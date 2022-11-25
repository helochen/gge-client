--======================================================================--
--	☆ 作者：飞蛾扑火 QQ：1415559882
--======================================================================--
local 助战类 = class()
local tx = 引擎.取头像
local bw = require("gge包围盒")(0,0,140,34)
local box = 引擎.画矩形
local format = string.format
local floor = math.floor
local min = math.min
local max = math.max
local tp,zts,zts1,zts2,ztstt3
local qmxs = 引擎.取模型
local ceil = math.ceil
local tostring = tostring
local bd0 = {"气血","魔法","攻击","命中","防御","速度","灵力"}
local bd = {"体质","魔力","力量","耐力","敏捷"}
local mousea = 引擎.鼠标按住
local mouseb = 引擎.鼠标弹起
local insert = table.insert
local mxs = 引擎.取模型

function 助战类:初始化(根)
	self.ID = 47
	self.x = 0
	self.y = 104
	self.xx = 0
	self.yy = 0
	self.注释 = "助战类"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	tp = 根
	self.控件类 = require("ggeui/加载类")()
	local 总控件 = self.控件类:创建控件('坐骑总控件')
	总控件:置可视(true,true)
	self.名称输入框 = 总控件:创建输入("名称输入",0,0,100,14)
	self.名称输入框:置可视(false,false)
	self.名称输入框:置限制字数(12)
	self.名称输入框:置光标颜色(-16777216)
	self.名称输入框:置文字颜色(-16777216)
	self.头像组={}
	self.加入 = 0
	self.选中 = 0
	self.窗口时间 = 0
	self.拽拖计次 = 0
	self.拽拖对象 = 0
	self.拽拖事件 = 0
	self.临时潜力 = {}
	self.预览属性 = {}
	self.动画=nil
	for i=1,7 do
		self.临时潜力[i] = {体质=0,魔力=0,力量=0,耐力=0,敏捷=0}
	end
	for i=1,7 do
		self.预览属性[i] = {气血=0,魔法=0,伤害=0,速度=0,灵力=0,防御=0}
	end
	zts = tp.字体表.普通字体
	zts1 = tp.字体表.普通字体__
	zts2 = tp.字体表.描边字体
	ztstt3 = tp.字体表.描边字体
	local wp = 根._物品格子
end


function 助战类:打开()
	if self.可视 then
		self.名称输入框:置可视(false,false)
		self.可视 = false
		self.临时潜力 = {}
		self.预览属性 = {}
		if tp.窗口.助战宠物.可视 then
			tp.窗口.助战宠物:打开()
		end
		for i=1,7 do
			self.临时潜力[i] = {体质=0,魔力=0,力量=0,耐力=0,敏捷=0}
		end
		for i=1,7 do
			self.预览属性[i] = {气血=0,魔法=0,伤害=0,速度=0,灵力=0,防御=0}
		end
		self.头像组={}
		self.资源组=nil
		return
	else
		insert(tp.窗口_,self)
		local 资源 = tp.资源
		local 按钮 = tp._按钮
		local 自适应 = tp._自适应
		self.资源组 = {
			[0] = 自适应.创建(1,1,332,18,1,3,nil,18), --横条
			[1] = 自适应.创建(0,1,370,453,3,9), --背景
			[2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true), --关闭按钮
			[3] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"参加战斗"), --加入队伍
			[4] = 按钮.创建(自适应.创建(12,4,30,22,1,3),0,0,4,true,true,"改 "), --改名
			[5] = 按钮.创建(自适应.创建(25,4,19,19,4,3),0,0,4,true,true),--加点
			[6] = 按钮.创建(自适应.创建(25,4,19,19,4,3),0,0,4,true,true),
			[7] = 按钮.创建(自适应.创建(25,4,19,19,4,3),0,0,4,true,true),
			[8] = 按钮.创建(自适应.创建(25,4,19,19,4,3),0,0,4,true,true),
			[9] = 按钮.创建(自适应.创建(25,4,19,19,4,3),0,0,4,true,true),
			[10] = 按钮.创建(自适应.创建(26,4,19,19,4,3),0,0,4,true,true),
			[11] = 按钮.创建(自适应.创建(26,4,19,19,4,3),0,0,4,true,true),
			[12] = 按钮.创建(自适应.创建(26,4,19,19,4,3),0,0,4,true,true),
			[13] = 按钮.创建(自适应.创建(26,4,19,19,4,3),0,0,4,true,true),
			[14] = 按钮.创建(自适应.创建(26,4,19,19,4,3),0,0,4,true,true),--减点
			--[15] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"加入门派"), --加入门派
			[16] = 按钮.创建(自适应.创建(12,4,57,22,1,3),0,0,4,true,true,"观 看 "),
			[17] = 按钮.创建(自适应.创建(12,4,57,22,1,3),0,0,4,true,true,"培 养 "),
			[18] = 按钮.创建(自适应.创建(12,4,57,22,1,3),0,0,4,true,true,"遗 弃 "),
			[19] = 按钮.创建(自适应.创建(12,4,57,22,1,3),0,0,4,true,true,"洗 点 "),
			[21] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"确认加点"),
			[22] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"装备技能"),
			[26] = 资源:载入('wzife.wd4',"网易WDF动画",0x3906F9F1),--经验背景
			[27] = 按钮.创建(自适应.创建(20,4,18,19,4,3),0,0,4,true,true),--上滚动
			[28] = 按钮.创建(自适应.创建(21,4,18,19,4,3),0,0,4,true,true),--下滚动
			[29] = 自适应.创建(2,1,173,142,3,9),--坐骑选择框171,182  --33
			[30] = 资源:载入('wzife.wd1',"网易WDF动画",0xA19838E8),--自适应.创建(2,1,158,173,3,9),--动画框
			[32] = 自适应.创建(3,1,97,19,1,3),--属性框2
			[33] = 自适应.创建(3,1,66,19,1,3),--属性框3 小
			[35] = tp._滑块.创建(自适应.创建(11,4,15,40,2,3,nil),4,14,143-55,2),
			[36] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"获取助战"),
			[37] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"助战宠物"),
            [38] = 按钮.创建(自适应.创建(12,4,57,22,1,3),0,0,4,true,true,"坐 骑"),
		}
		if 暖风界面 then
		self.资源组[22] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"装备技能")
	end
		tp.运行时间 = tp.运行时间 + 1
	    self.窗口时间 = tp.运行时间
	    self.可视 = true
	    self.加入 = 0
		self.选中 = 0
		self.拽拖计次 = 0
		self.拽拖对象 = 0
		self.拽拖事件 = 0
		if tp.助战列表==nil then
		    tp.助战列表={}
		end
		for i=1,#tp.助战列表 do
			if tp.助战列表[i] ~= nil then
				if i > 3 then
					self.资源组[35]:置起始点(self.资源组[35]:取百分比转换(0,3,#tp.助战列表))
				end
			end
		end
	end
end

function 助战类:刷新(数据)
	self.加入 = 0
	self.选中 = 0
	self.临时潜力 = {}
	self.预览属性 = {}
	for i=1,7 do
		self.临时潜力[i] = {体质=0,魔力=0,力量=0,耐力=0,敏捷=0}
	end
	for i=1,7 do
		self.预览属性[i] = {气血=0,魔法=0,伤害=0,速度=0,灵力=0,防御=0}
	end
	self.头像组={}
	self.拽拖计次 = 0
	self.拽拖对象 = 0
	self.拽拖事件 = 0
	for i=1,#tp.助战列表 do
		if tp.助战列表[i] ~= nil then
			if i > 3 then
				self.加入 = i-3
				self.资源组[35]:置起始点(self.资源组[35]:取百分比转换(self.加入,3,#tp.助战列表))
			end
		end
	end
	if tp.窗口.助战物品界面.可视 then
		tp.窗口.助战物品界面:打开()
	end
end

function 助战类:刷新武器(编号)
	if self.选中 == 编号 then
		self:置形象()
	end
end

function 助战类:显示(dt,x,y)
	local bbs = tp.助战列表
	local bbsa = #bbs
	local bb,ls,yl
	if self.选中 ~= 0 then
		bb = bbs[self.选中]
		if bb.潜力==nil then
		    bb=nil
		end
		ls = self.临时潜力[self.选中]
		yl = self.预览属性[self.选中]
	end
	self.焦点 = false
	--更新
	self.资源组[2]:更新(x,y)
	self.资源组[3]:更新(x,y,bb ~= nil)
	self.资源组[4]:更新(x,y,bb ~= nil)
	--self.资源组[16]:更新(x,y,bb ~= nil and bb.队伍~= nil )
	self.资源组[19]:更新(x,y,bb ~= nil)
	--self.资源组[15]:更新(x,y,bb ~= nil)
	self.资源组[36]:更新(x,y)
	self.资源组[37]:更新(x,y,bb ~= nil)
	self.资源组[38]:更新(x,y)
	for i=5,9 do
	   self.资源组[i]:更新(x,y,bb ~= nil and bb.潜力 > 0,1)
	   if self.资源组[i]:事件判断() then
			bb.潜力 = bb.潜力 - 1
	   		ls[bd[i-4]] = ls[bd[i-4]] + 1
	   end
	end
	for i=10,14 do
	   self.资源组[i]:更新(x,y,bb ~= nil and ls[bd[i-9]] ~= nil and ls[bd[i-9]] > 0,1)
	   if self.资源组[i]:事件判断() then
	   		bb.潜力 = bb.潜力 + 1
	   		ls[bd[i-9]] = ls[bd[i-9]] - 1
	   end
	end
	if self.资源组[37]:事件判断() then
		发送数据(5027)
		tp.窗口.助战宠物.x = self.x + 370
		tp.窗口.助战宠物.y =  self.y
	end
		if self.资源组[38]:事件判断() then
		if self.选中 == 0 or self.选中 == nil then
		tp.提示:写入("#Y/请先选择助战")
		return 0
    end
		发送数据(114.93,{编号 = self.选中})
	end
	self.资源组[27]:更新(x,y,self.加入 > 0)
	self.资源组[28]:更新(x,y,self.加入 < bbsa - 3)

	self.资源组[17]:更新(x,y,bb ~= nil)
	self.资源组[18]:更新(x,y,bb ~= nil)
	self.资源组[21]:更新(x,y,bb ~= nil)
	self.资源组[22]:更新(x,y,bb ~= nil)
	--显示
	self.资源组[1]:显示(self.x,self.y)
	if 暖风界面 then
	self.资源组[2]:显示(self.x+351,self.y+3)
	tp.窗口标题:显示(self.x+105,self.y)
	self.资源组[22]:显示(self.x+295,self.y+406,true)
	--zts:置颜色(0xff71370f)
	else
	self.资源组[0]:显示(self.x+6,self.y+3)
	self.资源组[2]:显示(self.x+344,self.y+6)
	tp.窗口标题背景_:置区域(0,0,92,16)
	tp.窗口标题背景_:显示(self.x+132,self.y+3)
	tp.画线:置区域(0,0,15,159-40)--滑块虚线
	tp.画线:显示(self.x+171,self.y+34)
	self.资源组[22]:显示(self.x+295,self.y+406,true)
	--zts:置颜色(4294967295)
    end
	self.资源组[37]:显示(self.x+295,self.y+380)
	self.资源组[29]:显示(self.x+12,self.y+29)
	self.资源组[30]:显示(self.x+197,self.y+28)
tp.画线:置区域(0,0,15,159-40)--滑块虚线
	tp.画线:显示(self.x+171,self.y+34)

	if bbsa > 3 then
		self.资源组[35]:置高度(min(floor(93/(bbsa-3)),104))
		self.加入 = min(ceil((bbsa-3)*self.资源组[35]:取百分比()),bbsa-3)
	end
	if bbsa > 3 then
	self.资源组[35]:显示(self.x+168,self.y-20+75+5,x,y,self.鼠标)
			--self.资源组[35]:显示(self.x+168,self.y+50+15,x,y,self.鼠标)
	end

	zts2:置字间距(2)
	zts2:显示(self.x+138,self.y+2,"助战界面")
	zts2:置字间距(0)
	ztstt3:显示(self.x+28,self.y+183,"数量："..#bbs.."/7")
	zts:置颜色(白色)
	zts:显示(self.x+8,self.y+210,"名称")
	self.资源组[32]:显示(self.x+42,self.y+208)
	zts:显示(self.x+180,self.y+210,"等级")
	self.资源组[32]:显示(self.x+214,self.y+208)
	zts:置颜色(白色)
	for i=1,5 do --加减
		self.资源组[32]:显示(self.x+214,self.y+208+i*24)
		zts:显示(self.x+180,self.y+208+i*24,bd[i])--bd0[i+1]
	end
	for i=1,7 do --属性
		self.资源组[32]:显示(self.x+42,self.y+208+i*24)
		zts:显示(self.x+8,self.y+208+i*24,bd0[i])--bd0[i+1]
	end
	--属性加减开始
	for i=5,9 do
		self.资源组[i]:显示(self.x+313,self.y+232+((i-5)*24))
	end
	for i=10,14 do
		self.资源组[i]:显示(self.x+333,self.y+232+((i-10)*24))
	end
	ztstt3:置颜色(-1404907)
	ztstt3:显示(self.x+180,self.y+354,"潜 能")
	self.资源组[33]:显示(self.x+224,self.y+352)
	ztstt3:置颜色(4294967295)
	tp.经验背景_:置宽高1(150,22)
	zts:显示(self.x+8,self.y+412,"经验")
	tp.经验背景_:显示(self.x+42,self.y+410)
	tp.经验背景_:置宽高1(186,22)

	self.资源组[27]:显示(self.x+167,self.y+31)
	self.资源组[28]:显示(self.x+167,self.y+193-40)


	self.资源组[3]:显示(self.x+113,self.y+180)--参战
	self.资源组[4]:显示(self.x+145,self.y+208)--改名
	--self.资源组[15]:显示(self.x+295,self.y+180)--加入门派
	--self.资源组[16]:显示(self.x+270,self.y+180)--观看
	self.资源组[19]:显示(self.x+230,self.y+180)--洗点
	self.资源组[21]:显示(self.x+295,self.y+354,true)--确认加点
	self.资源组[17]:显示(self.x+230,self.y+380,true)
	self.资源组[18]:显示(self.x+230,self.y+406,true)
    self.资源组[38]:显示(self.x+165,self.y+380,true)
	self.资源组[36]:显示(self.x+295,self.y+180)
	for i=1,3 do
		if bbs[i+self.加入]~=nil then
			local jx = self.x+18
			local jy = self.y+(i*43)-6
			bw:置坐标(jx,jy+1)
			if self.头像组[i+self.加入] == nil then
				local n = tx(bbs[i+self.加入].模型)
				self.头像组[i+self.加入] = tp.资源:载入("wzife.wdf","网易WDF动画",n[8])
			end
			local xz = bw:检查点(x,y)
			-- if not self.资源组[35].接触 and xz and self.鼠标 and not tp.消息栏焦点 and self.拽拖对象 == 0 then
			-- 	if mousea(0) then
			-- 		self.拽拖计次 = self.拽拖计次 + 1
			-- 		if self.拽拖计次 >= 28 then
			-- 			self.拽拖对象 = i+self.加入
			-- 			self.拽拖事件 = {self.头像组[i+self.加入]}
			-- 			self.拽拖计次 = 0
			-- 		end
			-- 	end
			-- end
			if self.选中 ~= i+self.加入 then
				if not self.资源组[35].接触 and xz and not tp.消息栏焦点 and self.鼠标 then
					-- if self.拽拖对象 ~= 0 then
					-- 	box(jx+70,jy+34,jx+125,jy+39,-16777216)
					-- 	self.插入选区 = i+self.加入
					-- end
					if mouseb(0) and self.拽拖对象 == 0 then
						self.选中 = i+self.加入

						if tp.窗口.助战物品界面.可视 then
							tp.窗口.助战物品界面:打开()
							发送数据(80,{编号=self.选中})
							tp.窗口.助战物品界面.x = self.x + 370
							tp.窗口.助战物品界面.y = self.y
						end

						self.名称输入框:置文本(bbs[self.选中].名称)
						self.名称输入框:置可视(true,true)
						self:置形象()
						self.拽拖计次 = 0
					end
					self.焦点 = true
				end
			else
				if not self.资源组[35].接触 and xz and not tp.消息栏焦点 and self.鼠标 then
					self.焦点 = true
				end
				if self.拽拖对象 ~= i+self.加入 then
					box(jx-1,jy-3,jx+142,jy+41,-10790181)
				end
			end
			self.头像组[i+self.加入]:显示(jx+1,jy)
			if bbs[i+self.加入].参战 then
				zts:置颜色(-256)
			else
				zts:置颜色(-16777216)
			end
			zts:显示(jx+41,jy+3,bbs[i+self.加入].名称.."("..bbs[i+self.加入].助战等级..")")
			zts:显示(jx+41,jy+21,"等级："..bbs[i+self.加入].等级)
		end
	end
	if bb ~= nil then
		local jx = self.x + 280
		local jy = self.y + 145
		tp.影子:显示(jx,jy)
		if self.资源组[24] ~= nil then
			self.资源组[24]:更新(dt)
			self.资源组[24]:显示(jx,jy)
		end
		if self.选中~=0 and bb.参战 then
			zts:显示(self.x+210,self.y+40,"已参战")
			self.资源组[3]:置文字("取消参战")
		else
			self.资源组[3]:置文字("参加战斗")
		end
		-- if bb.门派 ~= "无门派" then
		-- 	self.资源组[15]:置文字("退出门派")
		-- else
		--     self.资源组[15]:置文字("加入门派")
		-- end
		if self.资源组[25] ~= nil then
			self.资源组[25]:更新(dt)
			self.资源组[25]:显示(jx,jy)
		end
		if self.资源组[40] ~= nil then
			self.资源组[40]:更新(dt)
			self.资源组[40]:显示(jx,jy)
		end
		-- 文字
		self.名称输入框:置坐标(self.x+55,self.y+246-35)
		self.控件类:更新(dt,x,y)
		self.控件类:显示(dt,x,y)
		if self.名称输入框._已碰撞 then
			self.焦点 = true
		end
		zts:置颜色(-16777216)
		zts:显示(self.x + 225,self.y + 210,bb.等级)
		zts:显示(self.x + 225,self.y + 236,(bb.体质+bb.装备属性.体质))--204
		if ls.体质 > 0 then
			zts:置颜色(-65536)
			zts:显示(self.x + 265 + (#tostring(bb.体质)*7) + 1,self.y + 236,"+"..ls.体质)--204
			zts:置颜色(-16777216)
		end
		zts:显示(self.x + 225,self.y + 259,(bb.魔力+bb.装备属性.魔力))
		if ls.魔力 > 0 then
			zts:置颜色(-65536)
			zts:显示(self.x + 265 + (#tostring(bb.魔力)*7) + 1,self.y + 259,"+"..ls.魔力)
			zts:置颜色(-16777216)
		end
		zts:显示(self.x + 225,self.y +284,(bb.力量+bb.装备属性.力量))
		if ls.力量 > 0 then
			zts:置颜色(-65536)
			zts:显示(self.x + 265 + (#tostring(bb.力量)*7) + 1,self.y + 284,"+"..ls.力量)
			zts:置颜色(-16777216)
		end
		zts:显示(self.x + 225,self.y + 308,(bb.耐力+bb.装备属性.耐力))
		if ls.耐力 > 0 then
			zts:置颜色(-65536)
			zts:显示(self.x + 265 + (#tostring(bb.耐力)*7) + 1,self.y + 308,"+"..ls.耐力)
			zts:置颜色(-16777216)
		end
		zts:显示(self.x + 225,self.y + 332,(bb.敏捷+bb.装备属性.敏捷))
		if ls.敏捷 > 0 then
			zts:置颜色(-65536)
			zts:显示(self.x + 265 + (#tostring(bb.敏捷)*7) + 1,self.y + 332,"+"..ls.敏捷)
			zts:置颜色(-16777216)
		end
		zts:显示(self.x + 55,self.y + 210+2+24,bb.气血.."/"..bb.最大气血)
		zts:显示(self.x + 55,self.y + 233+2+24,bb.魔法.."/"..bb.最大魔法)
		zts:显示(self.x + 55,self.y + 258+2+24,bb.伤害)
		zts:显示(self.x + 55,self.y + 282+2+24,bb.命中)
		zts:显示(self.x + 55,self.y + 306+2+24,bb.防御)
		zts:显示(self.x + 55,self.y + 330+2+24,bb.速度)
		zts:显示(self.x + 55,self.y + 354+2+24,bb.灵力)
		zts:显示(self.x + 235,self.y + 330+2+24,bb.潜力)
		if self.动画 ~= nil then
			self.动画:更新(dt)
			self.动画:显示(jx,jy)
			if self.武器 ~= nil then
				self.武器:更新(dt)
				self.武器:显示(jx,jy)
			end
		end
		self.资源组[26]:置区域(0,0,min(floor(bb.当前经验 / bb.最大经验 * 142),142),self.资源组[26].高度)
		self.资源组[26]:显示(self.x+46,self.y+413)
		local ts = format("%d/%d",bb.当前经验,bb.最大经验)
		zts2:置描边颜色(-16240640)
		zts2:置颜色(4294967295)
		zts2:显示(self.x + ((200- zts2:取宽度(ts))/2)+8,self.y + 411,ts)
		zts2:置描边颜色(-16777216)
	end
	if self.资源组[4]:事件判断() then --改名 OK
		if self.名称输入框:取文本() == "" then
			tp.提示:写入("#Y/请正确输入要修改的名称！")
		else
		    发送数据(87,{编号=self.选中,名称=self.名称输入框:取文本()})
		end
	elseif self.资源组[2]:事件判断() then --参战 OK
		self:打开()
		return
	elseif self.资源组[3]:事件判断() then --参战 OK
		发送数据(86,{编号=self.选中})
	elseif self.资源组[17]:事件判断() then --85 培养 OK
		if 让海啸席卷 then
		    tp.窗口.对话栏:文本(bbs[self.选中].模型,"助战培养","请选择您要进行的操作,单次培养消耗100W经验、50W银子",{"培养一次","培养十次","培养五十次","算了算了"})
		else
			tp.窗口.对话栏:文本(bbs[self.选中].模型,"助战培养","请选择您要进行的操作,单次培养消耗1000W经验、100W银子",{"培养一次","培养十次","培养五十次","算了算了"})
		end

	elseif self.资源组[18]:事件判断() then --遗弃
		tp.窗口.对话栏:文本(bbs[self.选中].模型,"助战遗弃","你确定要遗弃该助战么,一旦遗弃无法找回！",{"确定遗弃","算了算了"})
	-- elseif self.资源组[15]:事件判断() then --加入门派 ok
	-- 	if bbs[self.选中].门派 ~= "无门派" then
	-- 		tp.窗口.对话栏:文本(bbs[self.选中].模型,"退出门派","退出门派需要消耗3000W银子,你确定要退出么。",{"退出助战门派","算了算了"})
	-- 	else
	-- 		local 临时数据={"方寸山(助战)","女儿村(助战)","神木林(助战)","化生寺(助战)","大唐官府(助战)","盘丝洞(助战)","阴曹地府(助战)","无底洞(助战)","魔王寨(助战)","狮驼岭(助战)","天宫(助战)","普陀山(助战)","凌波城(助战)","五庄观(助战)","龙宫(助战)"}
	-- 		tp.窗口.对话栏:文本(bbs[self.选中].模型,"加入门派","请选择您要拜入的门派",临时数据)
	-- 	end
	elseif self.资源组[21]:事件判断() then
		if ls ~= nil then
			发送数据(81,{编号=self.选中,加点=ls})
			self.临时潜力[self.选中] = {体质=0,魔力=0,力量=0,耐力=0,敏捷=0}
			self.预览属性[self.选中] = {气血=0,魔法=0,伤害=0,速度=0,灵力=0,防御=0}
		end
	elseif self.资源组[22]:事件判断() then
		if tp.窗口.助战物品界面.可视 then
			tp.窗口.助战物品界面:打开()
		else
			发送数据(80,{编号=self.选中})
			tp.窗口.助战物品界面.x = self.x+223
			tp.窗口.助战物品界面.y = self.x+104
		end
	elseif self.资源组[27]:事件判断() then--上滚动
		self.资源组[35]:置起始点(self.资源组[35]:取百分比转换(self.加入-1,3,bbsa))
		self.头像组 = {}
	elseif self.资源组[28]:事件判断() then--下滚动
		self.资源组[35]:置起始点(self.资源组[35]:取百分比转换(self.加入+1,3,bbsa))
		self.头像组 = {}
	elseif self.资源组[19]:事件判断() then --洗点
		发送数据(76,{编号=self.选中})
	elseif self.资源组[36]:事件判断() then --获取助战
		发送数据(3803,{编号=self.选中})
	end
	-- if self.拽拖对象 ~= 0 then
	-- 	box(x-70,y-25,x+73,y+19,-849650981)
	-- 	self.拽拖事件[1]:显示(x-63,y-18)
	-- 	zts:显示(x-27,y-19,bbs[self.拽拖对象].名称)
	-- 	zts:显示(x-27,y,bbs[self.拽拖对象].等级.."级")
	-- 	if mouseb(0) then
	-- 		if self.鼠标 then
	-- 			if self.插入选区 == 0 then
	-- 				self.拽拖计次 = 0
	-- 				self.拽拖对象 = 0
	-- 				self.拽拖事件 = 0
	-- 				self.插入选区 = 0
	-- 				tp.禁止关闭 = false
	-- 			else
	-- 				self:排列(self.拽拖对象,self.插入选区)
	-- 				self.拽拖计次 = 0
	-- 				self.拽拖对象 = 0
	-- 				self.拽拖事件 = 0
	-- 				self.插入选区 = 0
	-- 				tp.禁止关闭 = false
	-- 			end
	-- 		else
	-- 			self.拽拖计次 = 0
	-- 			self.拽拖对象 = 0
	-- 			self.拽拖事件 = 0
	-- 			self.插入选区 = 0
	-- 			tp.禁止关闭 = false
	-- 		end
	-- 	end
	-- 	tp.禁止关闭 = true
	-- 	self.焦点 = true
	-- end
	if self.资源组[35].接触 then
		self.焦点 = true
	end
end

function 助战类:置形象()
	if tp.助战列表[self.选中]  ~= nil then
		self.动画=nil
		self.武器=nil
		local q = mxs(tp.助战列表[self.选中].模型)
		if tp.助战列表[self.选中].武器数据.名称 == nil or tp.助战列表[self.选中].武器数据.名称 == "" then
			self.动画 = tp.资源:载入(q[3],"网易WDF动画",q[1])

			if tp.助战列表[self.选中].染色方案~=0 then
	          self.动画:置染色(tp.助战列表[self.选中].染色方案,tp.助战列表[self.选中].染色组[1],tp.助战列表[self.选中].染色组[2],tp.助战列表[self.选中].染色组[3],0)
	        end
          if tp.助战列表[self.选中].锦衣名称 ~= nil  and  tp.助战列表[self.选中].锦衣名称[1] ~= nil then
			资源 = qmxs(tp.助战列表[self.选中].锦衣名称[1].名称.."_"..tp.助战列表[self.选中].模型)
			self.动画 = tp.资源:载入(资源[3],"网易WDF动画",资源[1])
			end
	    else
	    	self.武器={}
	    	local 武器 = tp.助战列表[self.选中].武器数据
	    	local ssss = 武器.子类
      		local sss
			if 武器.名称 == "龙鸣寒水" or 武器.名称 == "非攻" then
			     ssss = "弓弩1"
			else
			    ssss = tp:取武器子类(武器.子类)
     		end
     		q = mxs(tp.助战列表[self.选中].模型,ssss)
     		self.动画 = tp.资源:载入(q[3],"网易WDF动画",q[1])
			if tp.助战列表[self.选中].染色方案~=0 then
	          self.动画:置染色(tp.助战列表[self.选中].染色方案,tp.助战列表[self.选中].染色组[1],tp.助战列表[self.选中].染色组[2],tp.助战列表[self.选中].染色组[3],0)
	        end
	        local m = tp:取武器附加名称(武器.子类,武器.等级,武器.名称)
	        local x = mxs(m.."_"..tp.助战列表[self.选中].模型,nil)
	        self.武器 = tp.资源:载入(x[3],"网易WDF动画",x[1])
	        self.武器:置差异(self.武器.帧数-self.动画.帧数)
			if 武器.染色方案~=0 and 武器.染色组~=0 and 武器.染色组~=nil and #武器.染色组>0 then
          		self.武器:置染色(武器.染色方案,武器.染色组[1],武器.染色组[2],武器.染色组[3])
     	 	end
			--table.print(tp.助战列表[self.选中])
			if tp.助战列表[self.选中].锦衣名称 ~= nil  and  tp.助战列表[self.选中].锦衣名称[1] ~= nil then
			资源 = qmxs(tp.助战列表[self.选中].锦衣名称[1].名称.."_"..tp.助战列表[self.选中].模型)
			self.动画 = tp.资源:载入(资源[3],"网易WDF动画",资源[1])
			end
		end
	end
end

function 助战类:检查点(x,y)
	if self.资源组 ~= nil and self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 助战类:初始移动(x,y)
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

function 助战类:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 助战类