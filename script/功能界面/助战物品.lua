--======================================================================--
--	☆ 作者：飞蛾扑火 QQ：1415559882
--======================================================================--
local 助战物品界面 = class()
local zts,bb,tp,zts1
local yx = {{68,4},{25,28},{111,28},{24,75},{111,75},{68,97}}
local insert = table.insert
local mousea = 引擎.鼠标弹起
function 助战物品界面:初始化(根)
	self.ID = 49
	self.xx = 0
	self.yy = 0
	self.注释 = "助战物品栏"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	tp = 根
	zts = tp.字体表.普通字体
	zts1 = tp.字体表.描边字体
	self.状态 = 1
	self.窗口时间 = 0
	font = 根.字体表.人物字体_
	self.装备坐标 = {x={12,60,110,161,212,263},y={33.5,33.5,34,35,35,34},xx={12,62,112,161,212},yy={105,105,105,105,105}}
	self.飞燕女 = 图像类("save/bj/飞燕女.png")
	self.骨精灵 = 图像类("save/bj/骨精灵.png")
	self.鬼潇潇 = 图像类("save/bj/鬼潇潇.png")
	self.狐美人 = 图像类("save/bj/狐美人.png")
	self.虎头怪 = 图像类("save/bj/虎头怪.png")
	self.剑侠客 = 图像类("save/bj/剑侠客.png")
	self.巨魔王 = 图像类("save/bj/巨魔王.png")
	self.龙太子 = 图像类("save/bj/龙太子.png")
	self.杀破狼 = 图像类("save/bj/杀破狼.png")
	self.神天兵 = 图像类("save/bj/神天兵.png")
	self.桃夭夭 = 图像类("save/bj/桃夭夭.png")
	self.巫蛮儿 = 图像类("save/bj/巫蛮儿.png")
	self.舞天姬 = 图像类("save/bj/舞天姬.png")
	self.逍遥生 = 图像类("save/bj/逍遥生.png")
	self.玄彩娥 = 图像类("save/bj/玄彩娥.png")
    self.偃无师 = 图像类("save/bj/偃无师.png")
	self.英女侠 = 图像类("save/bj/英女侠.png")
	self.羽灵神 = 图像类("save/bj/羽灵神.png")end

-- function 助战物品界面:打开(数据)
-- 	if self.可视 then
-- 		self.状态 = nil
-- 		self.可视 = false
-- 		if tp.窗口.助战技能栏.可视 then
-- 			tp.窗口.助战技能栏:打开()
-- 		end
-- 		self.资源组 = nil
-- 		self.物品 = nil
-- 		self.人物装备 = nil
-- 		self.人物灵饰 = nil
-- 		return
-- 	else
-- 		insert(tp.窗口_,self)
-- 		local 资源 = tp.资源
-- 		local 按钮 = tp._按钮
-- 		local 自适应 = tp._自适应
-- 		local 滑块 = tp._滑块
-- 		self.资源组 = {
-- 			[0] = 自适应.创建(1,1,275,18,1,3,nil,18), --横条
-- 			[1] = 自适应.创建(0,1,315,453,3,9),
-- 			[2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),
-- 			[3] = 资源:载入('wzife.wd5',"网易WDF动画",0x01000001),
-- 			[18] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"查看技能"),
-- 			[19] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"助战宝宝"),
-- 		}
-- 		self.资源组[18]:置偏移(0,3)
-- 		self.资源组[19]:置偏移(0,2)
-- 		self.物品 = {}
-- 		self.人物装备 = {}
-- 		self.人物灵饰 = {}
-- 		local 底图 =资源:载入('wzife.wdf',"网易WDF动画",0xA393A808)
-- 		local 格子 = tp._物品格子
-- 		for i=1,6 do
-- 			self.人物装备[i] = 格子(0,0,i,"助战物品_人物装备",底图)
-- 			if i<=4 then
-- 				self.人物灵饰[i] = 格子(0,0,i,"助战物品_人物装备",底图)
-- 			end
-- 		end
-- 		for i=1,20 do
-- 			self.物品[i] = 格子.创建(0,0,i,"助战物品_物品")
-- 		end
-- 		self.编号 = 数据.编号
-- 		for i=1,6 do
-- 			self.人物装备[i]:置物品(数据.装备[i])
-- 		end
-- 		self.开始 = 1
-- 		self.结束 = 20
-- 		for q=1,20 do
-- 			self.物品[q]:置物品(数据.道具.道具[q])
-- 		end
-- 		for i=1,4 do
-- 			self.人物灵饰[i]:置物品(数据.灵饰[i])
-- 		end
-- 		self.状态 = 1
-- 		tp.运行时间 = tp.运行时间 + 1
-- 	    self.窗口时间 = tp.运行时间
-- 	    self.可视 = true
-- 	end
-- end
function 助战物品界面:打开(数据)
	if self.可视 then
		self.状态 = nil
		self.可视 = false
		if tp.窗口.助战技能栏.可视 then
			tp.窗口.助战技能栏:打开()
		end
		if tp.窗口.助战锦衣.可视 then
			tp.窗口.助战锦衣:打开()
		end
		self.资源组 = nil
		self.物品 = nil
		self.人物装备 = nil
		self.人物灵饰 = nil
		return
	else
		insert(tp.窗口_,self)
		local 资源 = tp.资源
		local 按钮 = tp._按钮
		local 自适应 = tp._自适应
		local 滑块 = tp._滑块
		self.资源组 = {
			[0] = 自适应.创建(1,1,275,18,1,3,nil,18), --横条
			--[1] = 资源:载入('wzife.wd5',"网易WDF动画",0x01000001),
			[1] = 资源:载入('wpal/121.wpal',"网易WDF动画",0x00000777),
			[2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),
			--[3] = 资源:载入('wzife.wd5',"网易WDF动画",0x01000001),
			[4] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"助战修炼"),
			[5] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"辅助技能"),
			[6] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"奇经八脉"),
			[7] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"加入门派"),
			--[7] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"锦    衣"),
			--[8] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"法    宝"),
			--[9] = 资源:载入('wzife.wd1',"网易WDF动画",0x219FF008),
			--[10] = 资源:载入('wzife.wdf',"网易WDF动画",0xC0520208),
			--[11] = 资源:载入('wzife.wd2',"网易WDF动画",0xC2966B6F),
			--[12] = 资源:载入('wzife.wdf',"网易WDF动画",0xCF39217A),
			-- [13] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"提升十次"),
			-- [14] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"提升十次"),
			-- [15] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"提升十次"),
			-- [16] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"提升十次"),
			--[9] = 自适应.创建(26,1,45,45,1,1),--属性框2
			--[9] = 自适应.创建(0,1,45,45,3,9),
			--[18] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"学习技能"),
			[18] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"学习技能"),

		}
		-- if 暖风界面 then
		-- self.资源组[18] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"学习技能")
		-- --self.资源组[3]=资源:载入('uilf1.wdf',"网易WDF动画",0xEEE36C36)
	   --end
		self.物品 = {}
		self.人物装备 = {}
		self.人物灵饰 = {}
		self.人物法宝 = {}
		self.人物锦衣 = {}
		local 底图 =资源:载入('wzife.wdf',"网易WDF动画",0xA393A808)
		local 格子 = tp._物品格子
		--self.资源组[9] = tp.物品背景
		for i=1,6 do
			self.人物装备[i] = 格子(0,0,i,"助战物品_人物装备")
			if i<=5 then
				self.人物灵饰[i] = 格子(0,0,i,"助战物品_人物装备")
			end
		end
				for i=1,4 do
			self.人物锦衣[i] = 格子(0,0,i,"道具行囊_锦衣")
		end
						for i=1,3 do
			self.人物法宝[i] = 格子(0,0,i,"道具行囊_锦衣")
		end
		for i=1,20 do
			self.物品[i] = 格子.创建(0,0,i,"助战物品_物品")
		end
		self.编号 = 数据.编号
		助战修炼 = 数据.助战修炼
        助战修炼经验 = 数据.助战修炼经验
        助战名称 = 数据.模型
        助战门派 = 数据.门派
		for i=1,6 do
			self.人物装备[i]:置物品(数据.装备[i])
		end
		self.开始 = 1
		self.结束 = 20
		for q=1,20 do
			self.物品[q]:置物品(数据.道具.道具[q])
		end
		for i=1,5 do
			self.人物灵饰[i]:置物品(数据.灵饰[i])
		end
		for i=1,4 do
			if 数据.锦衣.锦衣 ~= nil and 数据.锦衣.锦衣[i] ~= nil and 数据.锦衣.锦衣[i].名称 ~= nil then
				self.人物锦衣[i]:置物品(数据.锦衣.锦衣[i])
			end
		end
		for i=1,3 do
	    if 数据.法宝.法宝 ~= nil and 数据.法宝.法宝[i] ~= nil and 数据.法宝.法宝[i].名称 ~= nil then
		self.人物法宝[i]:置物品(数据.法宝.法宝[i])
		end
		end
		self.状态 = 1
		tp.运行时间 = tp.运行时间 + 1
	    self.窗口时间 = tp.运行时间
	    self.可视 = true
	end
end
function 助战物品界面:刷新物品(数据)
	for q=1,20 do
		self.物品[q]:置物品(数据[q])
	end
end
function 助战物品界面:刷新装备(数据)
	for i=1,6 do
		self.人物装备[i]:置物品(数据.装备[i])
	end
	self.编号 = 数据.编号
end
function 助战物品界面:刷新灵饰(数据)
	for i=1,4 do
		self.人物灵饰[i]:置物品(数据.灵饰[i])
	end
	self.编号 = 数据.编号
end
function 助战物品界面:刷新锦衣(数据)
	for i=1,4 do
		self.人物锦衣[i]:置物品(数据.锦衣[i])
	end
	self.编号 = 数据.编号
end
function 助战物品界面:刷新法宝(数据)
	for i=1,3 do
		self.人物法宝[i]:置物品(数据.法宝[i])
	end
	self.编号 = 数据.编号
end
function 助战物品界面:刷新修炼(数据)
    助战修炼 = 数据.助战修炼
    助战修炼经验 = 数据.助战修炼经验
    self.编号 = 数据.编号
end
function 助战物品界面:刷新门派(数据)
    助战门派 = 数据.门派
    self.编号 = 数据.编号
end
-- function 助战物品界面:显示(dt,x,y)
-- 	self.焦点 = false
-- 	self.资源组[2]:更新(x,y)
-- 	self.资源组[18]:更新(x,y)
-- 	self.资源组[19]:更新(x,y)
-- 	if self.资源组[2]:事件判断() then
-- 		self:打开()
-- 		if tp.窗口.助战技能栏.可视 then
-- 			tp.窗口.助战技能栏:打开()
-- 		end
-- 		return false
-- 	elseif self.资源组[18]:事件判断() then
-- 		self:打开()
-- 		tp.窗口.助战技能栏:打开(self.编号)
-- 		tp.窗口.助战技能栏.x = self.x
-- 		tp.窗口.助战技能栏.y = self.y
-- 		return
-- 	elseif self.资源组[19]:事件判断() then
-- 		--tp.窗口.对话栏:文本(tp.助战列表[self.编号].模型,"统御召唤兽","请选择您要进行的操作",{"培养一次","培养十次","培养五十次","算了算了"})
-- 		发送数据(51.1,{序列=self.编号})
-- 		return
-- 	end
-- 	self.资源组[1]:显示(self.x,self.y)
-- 	self.资源组[0]:显示(self.x+6,self.y+3)
-- 	self.资源组[3]:显示(self.x-10,self.y)
-- 	tp.窗口标题背景_:置区域(0,0,84+30,16)
-- 	tp.窗口标题背景_:显示(self.x+71+40,self.y+3)
-- 	zts1:置字间距(1)
-- 	zts1:显示(self.x+76+60,self.y+3,"装备系统")
-- 	zts1:显示(self.x+40,self.y+29,"当前装备")
-- 	zts1:显示(self.x+190,self.y+80,"当前灵饰")
-- 	zts1:置字间距(0)
-- 	zts1:置字间距(2)
-- 	zts:置颜色(-16777216)
-- 	zts:显示(self.x+110,self.y+29+5,"0")
-- 	self.资源组[18]:显示(self.x+230,self.y+29,true)
-- 	self.资源组[19]:显示(self.x+230,self.y+52,true)
-- 	zts1:置颜色(4294967295)
-- 	zts1:置字间距(0)
-- 	self.资源组[2]:显示(self.x+216+73,self.y+5)
-- 	local o = self.开始 - 1
-- 	for h=1,4 do
-- 		for l=1,5 do
-- 			o = o + 1
-- 			self.物品[o]:置坐标(l * 51 - 26 + self.x+5,h * 51 + 175	 + self.y)
-- 			self.物品[o]:显示(dt,x,y,self.鼠标)
-- 			if  tp.场景.地图.抓取物品 == nil and self.物品[o].焦点 and not tp.消息栏焦点 and self.物品[o].物品 ~= nil then
-- 				if self.物品[o].物品 ~= nil then
-- 					tp.提示:道具行囊(x,y,self.物品[o].物品)
-- 					if mousea(1) and self.物品[o].物品.分类 <=12 and self.物品[o].物品.总类~=2 and self.物品[o].物品.总类~="坐骑饰品" then
-- 						--使用物品
-- 						发送数据(79,{编号=self.编号,物品编号=o})
-- 					elseif mousea(1) and self.物品[o].物品 ~= nil and self.物品[o].物品.分类 >= 10 and self.物品[o].物品.分类 <=14 then
-- 						--佩戴灵饰
-- 						发送数据(78,{编号=self.编号,物品编号=o})
-- 					elseif mousea(1) and self.物品[o].物品.分类 < 10 then
-- 						--佩戴装备
-- 						发送数据(78,{编号=self.编号,物品编号=o})
-- 					end
-- 				end
-- 				self.焦点 = true
-- 			end
-- 		end
-- 	end
-- 	for i=1,6 do
-- 		local 补差高度=3
-- 		if i==1 or i == 2 then
-- 		    补差高度=1
-- 		elseif i==5 or i == 6 then
-- 		    补差高度=2
-- 		end
-- 		if self.人物装备[i].物品 ~= nil and self.人物装备[i].焦点 then
-- 			tp.提示:道具行囊(x,y,self.人物装备[i].物品)
-- 			if mousea(1) then
-- 				发送数据(77,{编号=self.编号,物品编号=i})
-- 			end
-- 		end
-- 		if self.人物装备[i].焦点 then
-- 			self.焦点 = true
-- 		end
-- 		self.人物装备[i]:置坐标(self.x+self.装备坐标.x[i]+2,self.y+self.装备坐标.y[i]-补差高度,nil,nil,4,-1)
-- 		self.人物装备[i]:显示(dt,x,y,self.鼠标,nil,1)
-- 	end
-- 	for i=1,4 do
-- 		local 补差高度=3
-- 		if i==1 or i == 2 then
-- 		    补差高度=1
-- 		elseif i==5 or i == 6 then
-- 		    补差高度=2
-- 		end
-- 		if self.人物灵饰[i].物品 ~= nil and self.人物灵饰[i].焦点 then
-- 			tp.提示:道具行囊(x,y,self.人物灵饰[i].物品)
-- 			if mousea(1) then
-- 				发送数据(77,{编号=self.编号,物品编号=i,灵饰=1})
-- 			end
-- 		end
-- 		if self.人物灵饰[i].焦点 then
-- 			self.焦点 = true
-- 		end
-- 		self.人物灵饰[i]:置坐标(self.x+self.装备坐标.xx[i]+2,self.y+self.装备坐标.yy[i]-补差高度,nil,nil,4,-1)
-- 		self.人物灵饰[i]:显示(dt,x,y,self.鼠标,nil,1)
-- 	end
-- end
function 助战物品界面:显示(dt,x,y)
	self.焦点 = false
	self.资源组[2]:更新(x,y)
	self.资源组[4]:更新(x,y)
	self.资源组[5]:更新(x,y)
	self.资源组[6]:更新(x,y)
	self.资源组[7]:更新(x,y)
	self.资源组[18]:更新(x,y)
	-- self.资源组[13]:更新(x,y)
	-- self.资源组[14]:更新(x,y)
	-- self.资源组[15]:更新(x,y)
	-- self.资源组[16]:更新(x,y)
	-- if self.资源组[13]:事件判断() then
	-- 	发送数据(113.1,{编号=self.编号,修炼类型="攻击修炼"})
	-- elseif self.资源组[14]:事件判断() then
	-- 	发送数据(113.1,{编号=self.编号,修炼类型="法术修炼"})
	-- elseif self.资源组[15]:事件判断() then
	-- 	发送数据(113.1,{编号=self.编号,修炼类型="防御修炼"})
	-- elseif self.资源组[16]:事件判断() then
	-- 	发送数据(113.1,{编号=self.编号,修炼类型="抗法修炼"})
	-- end
	if self.资源组[4]:事件判断() then
	self:打开()
	发送数据(113.2,{编号=self.编号})
	return
		end
			if self.资源组[5]:事件判断() then
	self:打开()
	发送数据(114.2,{编号=self.编号})
	return
		end
	if self.资源组[6]:事件判断() then
	--self:打开()
		发送数据(114.4,{编号=self.编号})
		return
    end
	if self.资源组[2]:事件判断() then
		self:打开()
		if tp.窗口.助战技能栏.可视 then
			tp.窗口.助战技能栏:打开()
		end
		return false
	elseif self.资源组[18]:事件判断() then
		self:打开()
		发送数据(114,{编号=self.编号})
		return
	elseif self.资源组[7]:事件判断() then --加入门派 ok
		if 助战门派 ~= "无门派" then
			tp.窗口.对话栏:文本(助战模型,"退出门派","退出门派需要消耗3000W银子,你确定要退出么。",{"退出助战门派","算了算了"})
		else
			local 临时数据={"方寸山(助战)","女儿村(助战)","神木林(助战)","化生寺(助战)","大唐官府(助战)","盘丝洞(助战)","阴曹地府(助战)","无底洞(助战)","魔王寨(助战)","狮驼岭(助战)","天宫(助战)","普陀山(助战)","凌波城(助战)","五庄观(助战)","龙宫(助战)"}
			tp.窗口.对话栏:文本(助战模型,"加入门派","请选择您要拜入的门派",临时数据)
		end
	end
	self.资源组[1]:显示(self.x,self.y)
	if 助战门派 ~= "无门派" then
		self.资源组[7]:置文字("退出门派")
	else
		self.资源组[7]:置文字("加入门派")
	end

	--if 暖风界面 then
	--	print(1111)
		--tp.窗口标题:显示(self.x+71+18+150,self.y-2)
		self.资源组[2]:显示(self.x+888,self.y+1)
		self.资源组[18]:显示(self.x+350,self.y+90)
		self.资源组[4]:显示(self.x+500,self.y+90)
		self.资源组[5]:显示(self.x+350,self.y+130)
	    self.资源组[6]:显示(self.x+500,self.y+130)
	    self.资源组[7]:显示(self.x+425,self.y+50)
	    if 助战名称=="飞燕女" then
	        self.飞燕女:显示(self.x+350,self.y+220)
	    elseif 助战名称=="骨精灵" then
			self.骨精灵:显示(self.x+350,self.y+220)
		elseif 助战名称=="鬼潇潇" then
			self.鬼潇潇:显示(self.x+350,self.y+220)
		elseif 助战名称=="狐美人" then
			self.狐美人:显示(self.x+350,self.y+220)
		elseif 助战名称=="虎头怪" then
			self.虎头怪:显示(self.x+350,self.y+220)
		elseif 助战名称=="剑侠客" then
			self.剑侠客:显示(self.x+350,self.y+220)
		elseif 助战名称=="巨魔王" then
			self.巨魔王:显示(self.x+350,self.y+220)
		elseif 助战名称=="龙太子" then
			self.龙太子:显示(self.x+350,self.y+220)
		elseif 助战名称=="杀破狼" then
			self.杀破狼:显示(self.x+350,self.y+220)
		elseif 助战名称=="神天兵" then
			self.神天兵:显示(self.x+350,self.y+220)
		elseif 助战名称=="桃夭夭" then
			self.桃夭夭:显示(self.x+350,self.y+220)
		elseif 助战名称=="巫蛮儿" then
			self.巫蛮儿:显示(self.x+350,self.y+220)
		elseif 助战名称=="舞天姬" then
			self.舞天姬:显示(self.x+350,self.y+220)
		elseif 助战名称=="逍遥生" then
			self.逍遥生:显示(self.x+350,self.y+220)
		elseif 助战名称=="玄彩娥" then
			self.玄彩娥:显示(self.x+350,self.y+220)
		elseif 助战名称=="偃无师" then
		    self.偃无师:显示(self.x+350,self.y+220)
		elseif 助战名称=="英女侠" then
			self.英女侠:显示(self.x+350,self.y+220)
		elseif 助战名称=="羽灵神" then
			self.羽灵神:显示(self.x+350,self.y+220)
		end
		--self.资源组[3]:显示(self.x+8,self.y+60)
	-- else
 --    self.资源组[0]:显示(self.x+6,self.y+3)
	-- tp.窗口标题背景_:置区域(0,0,84+30,16)
	-- tp.窗口标题背景_:显示(self.x+71+40,self.y+3)
	-- self.资源组[18]:显示(self.x+230,self.y+29)
	-- self.资源组[4]:显示(self.x+220,self.y+53)
	-- self.资源组[5]:显示(self.x+129,self.y+29)
	-- self.资源组[6]:显示(self.x+129,self.y+53)
	-- --self.资源组[3]:显示(self.x-10,self.y)
    -- end


	zts1:置字间距(1)
	zts1:显示(self.x+270,self.y,"装备与技能")
	--zts1:显示(self.x+20,self.y+29,"装备")
	--zts1:显示(self.x+132,self.y+160,"灵饰")
	zts1:置字间距(0)
	zts1:置字间距(2)
	zts:置颜色(-16777216)
	zts:显示(self.x+110,self.y+29+5,"")

	zts1:置颜色(4294967295)
	zts1:置字间距(0)
 --    self.资源组[9]:显示(self.x+333-8,self.y+115-11)
	-- self.资源组[10]:显示(self.x+333+56-8,self.y+115-11)
	-- self.资源组[11]:显示(self.x+333-8,self.y+115+55-11)
	-- self.资源组[12]:显示(self.x+333+56-8,self.y+115+55-11)
	-- self.资源组[9]:显示(self.x+333+150-8,self.y+115-11)
	-- self.资源组[10]:显示(self.x+333+150+56-8,self.y+115-11)
	-- self.资源组[11]:显示(self.x+333+150-8,self.y+115+55-11)
	-- self.资源组[12]:显示(self.x+333+150+56-8,self.y+115+55-11)

	-- self.资源组[13]:显示(self.x+333+150+56-8,self.y+230)
	-- self.资源组[14]:显示(self.x+333+150+56-8,self.y+260)
	-- self.资源组[15]:显示(self.x+333+150+56-8,self.y+290)
	-- self.资源组[16]:显示(self.x+333+150+56-8,self.y+320)
	local o = self.开始 - 1
	for h=1,4 do
		for l=1,5 do
			o = o + 1
			self.物品[o]:置坐标(l * 51 - 26 + self.x+5,h * 51 + 175	 + self.y+7)
			self.物品[o]:显示(dt,x,y,self.鼠标)
			if  tp.场景.地图.抓取物品 == nil and self.物品[o].焦点 and not tp.消息栏焦点 and self.物品[o].物品 ~= nil then
				if self.物品[o].物品 ~= nil then
					tp.提示:道具行囊(x,y,self.物品[o].物品)
						if mousea(1) and self.物品[o].物品 ~= nil and self.物品[o].物品.总类 == 1000 then
						--if tp.窗口.助战法宝.可视 ~= true then
						--发送数据(114.9,{编号=self.编号})
						--end
						发送数据(114.91,{编号=self.编号,物品编号=o})
						end
					if mousea(1) and self.物品[o].物品.分类 <=12 and self.物品[o].物品.总类~=2 and self.物品[o].物品.总类~="坐骑饰品" and self.物品[o].物品.总类 ~= 1000 then
						发送数据(79,{编号=self.编号,物品编号=o})
					elseif mousea(1) and self.物品[o].物品 ~= nil and self.物品[o].物品.分类 >= 10 and self.物品[o].物品.分类 <=14 and self.物品[o].物品.总类 ~= 1000 then
						发送数据(78,{编号=self.编号,物品编号=o})
					elseif mousea(1) and self.物品[o].物品 ~= nil and self.物品[o].物品.分类 >= 15 and self.物品[o].物品.分类 <=18 then
						--if tp.窗口.助战锦衣.可视 ~= true then
						--发送数据(114.8,{编号=self.编号})
						--end
						发送数据(78.2,{编号=self.编号,物品编号=o})
					elseif mousea(1) and self.物品[o].物品.分类 < 10 and self.物品[o].物品.总类 ~= 1000 then
						发送数据(78,{编号=self.编号,物品编号=o})
					end
				end
				self.焦点 = true
			end
		end
	end
	for i=1,6 do
		if self.人物装备[i].物品 ~= nil and self.人物装备[i].焦点 then
			tp.提示:道具行囊(x,y,self.人物装备[i].物品)
			if mousea(1) then
				发送数据(77,{编号=self.编号,物品编号=i})
			end
		end
		if self.人物装备[i].焦点 then
			self.焦点 = true
		end
		if i == 1  then
		    self.人物装备[i]:置坐标(self.x+self.装备坐标.x[4]+2,self.y+self.装备坐标.y[4],nil,nil,4,-1)
		    self.人物装备[i]:显示(dt,x,y,self.鼠标,nil,1)
		elseif i == 2  then
			self.人物装备[i]:置坐标(self.x+self.装备坐标.x[3]+2,self.y+self.装备坐标.y[3],nil,nil,4,-1)
		    self.人物装备[i]:显示(dt,x,y,self.鼠标,nil,1)
		elseif i == 3  then
			self.人物装备[i]:置坐标(self.x+self.装备坐标.x[1]+2,self.y+self.装备坐标.y[1],nil,nil,4,-1)
		    self.人物装备[i]:显示(dt,x,y,self.鼠标,nil,1)
		elseif i == 4  then
			self.人物装备[i]:置坐标(self.x+self.装备坐标.x[2]+2,self.y+self.装备坐标.y[2],nil,nil,4,-1)
		    self.人物装备[i]:显示(dt,x,y,self.鼠标,nil,1)
		elseif i == 5  then
			self.人物装备[i]:置坐标(self.x+self.装备坐标.x[5]+2,self.y+self.装备坐标.y[5],nil,nil,4,-1)
		    self.人物装备[i]:显示(dt,x,y,self.鼠标,nil,1)
		elseif i == 6  then
			self.人物装备[i]:置坐标(self.x+self.装备坐标.x[6]+2,self.y+self.装备坐标.y[6],nil,nil,4,-1)
		    self.人物装备[i]:显示(dt,x,y,self.鼠标,nil,1)
		end
	end
	for i=1,5 do
		local 补差高度=3
		if i==1 or i == 2 then
		    补差高度=1
		elseif i==5 or i == 6 then
		    补差高度=2
		end
		if self.人物灵饰[i].物品 ~= nil and self.人物灵饰[i].焦点 then
			tp.提示:道具行囊(x,y,self.人物灵饰[i].物品)
			if mousea(1) then
				发送数据(77,{编号=self.编号,物品编号=i,灵饰=1})
			end
		end
		if self.人物灵饰[i].焦点 then
			self.焦点 = true
		end
		if i == 1  then
			self.人物灵饰[i]:置坐标(self.x+self.装备坐标.xx[1]+2,self.y+self.装备坐标.yy[1]-补差高度,nil,nil,5,-1)
			self.人物灵饰[i]:显示(dt,x,y,self.鼠标,nil,1)
		elseif i == 2  then
			self.人物灵饰[i]:置坐标(self.x+self.装备坐标.xx[3]+2,self.y+self.装备坐标.yy[3]-补差高度,nil,nil,5,-1)
			self.人物灵饰[i]:显示(dt,x,y,self.鼠标,nil,1)
		elseif i == 3  then
			self.人物灵饰[i]:置坐标(self.x+self.装备坐标.xx[2]+2,self.y+self.装备坐标.yy[2]-补差高度,nil,nil,5,-1)
			self.人物灵饰[i]:显示(dt,x,y,self.鼠标,nil,1)
		elseif i == 4  then
			self.人物灵饰[i]:置坐标(self.x+self.装备坐标.xx[4]+2,self.y+self.装备坐标.yy[4]-补差高度,nil,nil,5,-1)
			self.人物灵饰[i]:显示(dt,x,y,self.鼠标,nil,1)
		elseif i == 5  then
			self.人物灵饰[i]:置坐标(self.x+self.装备坐标.xx[5]+2,self.y+self.装备坐标.yy[5]-补差高度,nil,nil,5,-1)
			self.人物灵饰[i]:显示(dt,x,y,self.鼠标,nil,1)
		end
	end

	for i=1,4 do
		if self.人物锦衣[i].物品 ~= nil and self.人物锦衣[i].焦点 then
			tp.提示:道具行囊(x,y,self.人物锦衣[i].物品)
			if mousea(1) then
				发送数据(78.3,{编号=self.编号,物品编号=i})
			end
		end
		if self.人物锦衣[i].焦点 then
			self.焦点 = true
		end
		if i==1 then
			self.人物锦衣[i]:置坐标(self.x+150+self.装备坐标.xx[i]+2,self.y+self.装备坐标.yy[i]+68,nil,nil,5,-1)
			self.人物锦衣[i]:显示(dt,x,y,self.鼠标,nil,1)
		elseif i == 2  then
			self.人物锦衣[i]:置坐标(self.x+150+self.装备坐标.xx[i]+2,self.y+self.装备坐标.yy[i]+68,nil,nil,5,-1)
			self.人物锦衣[i]:显示(dt,x,y,self.鼠标,nil,1)
		elseif i == 3  then
            self.人物锦衣[i]:置坐标(self.x+150+self.装备坐标.xx[i]+2,self.y+self.装备坐标.yy[i]+68,nil,nil,5,-1)
			self.人物锦衣[i]:显示(dt,x,y,self.鼠标,nil,1)
		elseif i == 4  then
            self.人物锦衣[i]:置坐标(self.x+150+self.装备坐标.xx[3]+2,self.y+self.装备坐标.yy[i],nil,nil,5,-1)
			self.人物锦衣[i]:显示(dt,x,y,self.鼠标,nil,1)
		end
	end
	for i=1,3 do
		if self.人物法宝[i].物品 ~= nil and self.人物法宝[i].焦点 then
			tp.提示:道具行囊(x,y,self.人物法宝[i].物品)
			if mousea(1) then
				发送数据(114.92,{编号=self.编号,物品编号=i})
			end
		end
		if self.人物法宝[i].焦点 then
			self.焦点 = true
		end
		self.人物法宝[i]:置坐标(self.x+self.装备坐标.xx[i]+2,self.y+self.装备坐标.yy[i]+68,nil,nil,5,-1)
		self.人物法宝[i]:显示(dt,x,y,self.鼠标,nil,1)
	end
	-- zts:置颜色(-16777216)
	-- local 当前所需经验 = 0
	-- 当前所需经验 = 计算修炼等级经验(助战修炼.攻击修炼,25)
	-- zts:显示(self.x+333-8,self.y+230,"攻击修炼 等级:"..助战修炼.攻击修炼.."/25 修炼经验"..助战修炼经验.攻击经验.."/"..当前所需经验)
	-- 当前所需经验 = 计算修炼等级经验(助战修炼.法术修炼,25)
	-- zts:显示(self.x+333-8,self.y+260,"法术修炼 等级:"..助战修炼.法术修炼.."/25 修炼经验"..助战修炼经验.法术经验.."/"..当前所需经验)
	-- 当前所需经验 = 计算修炼等级经验(助战修炼.防御修炼,25)
	-- zts:显示(self.x+333-8,self.y+290,"防御修炼 等级:"..助战修炼.防御修炼.."/25 修炼经验"..助战修炼经验.防御经验.."/"..当前所需经验)
	-- 当前所需经验 = 计算修炼等级经验(助战修炼.抗法修炼,25)
	-- zts:显示(self.x+333-8,self.y+320,"抗法修炼 等级:"..助战修炼.抗法修炼.."/25 修炼经验"..助战修炼经验.抗法经验.."/"..当前所需经验)
end
function 助战物品界面:检查点(x,y)
	if self.资源组 ~= nil and self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 助战物品界面:初始移动(x,y)
	tp.运行时间 = tp.运行时间 + 1
	if not tp.消息栏焦点 then
  		self.窗口时间 = tp.运行时间
 	end
	if not self.焦点 then
		tp.移动窗口 = true
	end
	if self.鼠标 and not self.焦点 then
		self.xx = x - self.x
		self.yy = y - self.y
	end
end

function 助战物品界面:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 助战物品界面