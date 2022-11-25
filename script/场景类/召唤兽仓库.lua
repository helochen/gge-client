--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2021-02-26 01:13:08
--======================================================================--
local 场景类_召唤兽仓库 = class()

local floor = math.floor
local tp,zts,zts1,bba,zts2
local bw = require("gge包围盒")(0,0,138,20)
local box = 引擎.画矩形
local mouseb = 引擎.鼠标弹起
local move = table.move
local insert = table.insert

function 场景类_召唤兽仓库:初始化(根)
	self.ID = 38
	self.x = 314
	self.y = 158
	self.xx = 0
	self.yy = 0
	self.注释 = "召唤兽仓库"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.焦点1 = false
	self.可移动 = true
	local 资源 = 根.资源
	local 按钮 = 根._按钮
	local 自适应 = 根._自适应
	self.资源组 = {
		[1] = 自适应.创建(0,1,382,305,3,9),
		[2] = 自适应.创建(1,1,158,18,1,3,nil,18),
		[3] = 自适应.创建(4,1,155,220,3,nil),
		[4] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),
		[5] = 自适应.创建(3,1,47,19,1,3),
		[6] = 按钮.创建(自适应.创建(12,4,55,22,1,3),0,0,4,true,true,"取出"),
		[7] = 按钮.创建(自适应.创建(12,4,55,22,1,3),0,0,4,true,true,"存入"),
		[8] = 按钮.创建(自适应.创建(12,4,55,22,1,3),0,0,4,true,true,"上页"),
		[9] = 按钮.创建(自适应.创建(12,4,55,22,1,3),0,0,4,true,true,"下页"),

	}
	self.资源组[4]:绑定窗口_(38)
	self.资源组[6]:绑定窗口_(38)
	self.资源组[7]:绑定窗口_(38)
	self.窗口时间 = 0
	tp = 根
	zts = tp.字体表.人物字体_
	zts1 = tp.字体表.描边字体
	zts2 = tp.字体表.普通字体
	bba = tp.召唤兽仓库
	self.上次时间 = 0
	self.召唤兽仓库=tp.召唤兽仓库
end

function 场景类_召唤兽仓库:打开()
	if self.可视 then
		self.可视 = false
	else
		insert(tp.窗口_,self)
		self.选中 = 0
		self.选中1 = 0
		tp.运行时间 = tp.运行时间 + 1
	    self.窗口时间 = tp.运行时间
	    self.上次时间 = os.time()
	    self.可视=true
if self.ID == nil then
self.ID=0
end
全局窗口id =self.ID
	    self.仓库页数=1
		self.召唤兽仓库=tp.召唤兽仓库
	end
end

function 场景类_召唤兽仓库:显示(dt,x,y)
	local bbc = tp.队伍[1].宝宝列表
	self.召唤兽仓库=tp.召唤兽仓库
	self.资源组[4]:更新(x,y)
	self.资源组[6]:更新(x,y,self.选中1 ~= 0)
	self.资源组[7]:更新(x,y,self.选中 ~= 0 and #bbc > 0)
	self.资源组[8]:更新(x,y)
	self.资源组[9]:更新(x,y)
	if self.资源组[4]:事件判断() then
		self:打开()
		return
	elseif self.资源组[8]:事件判断() then --取出
		if self.上次时间 == os.time() then
			tp.提示:写入("#Y/请不要频繁点击。")
			return
		end
		if self.仓库页数 ~= 1 then
			self.仓库页数 = self.仓库页数 - 1
			发送数据(5013,{仓库页=self.仓库页数})
		else
			tp.提示:写入("#Y/当前仓库已是第一页。")
		end
		self.上次时间 = os.time()
	elseif self.资源组[9]:事件判断() then --取出
		if self.上次时间 == os.time() then
			tp.提示:写入("#Y/请不要频繁点击。")
			return
		end
		self.上次时间 = os.time()
		self.仓库页数 = self.仓库页数 + 1
		发送数据(5013,{仓库页=self.仓库页数})
	elseif self.资源组[6]:事件判断() then --取出
		local 仓库序列号= self.召唤兽仓库[self.选中1].认证码
		发送数据(5012,{仓库页=self.仓库页数,取出序列=仓库序列号})
		self.选中1 = 0
	elseif self.资源组[7]:事件判断() then
		if tp.窗口.召唤兽属性栏.可视 then
			if tp.队伍[1].宝宝列表[tp.窗口.召唤兽属性栏.选中+tp.窗口.召唤兽属性栏.加入] == bb then
				tp.窗口.召唤兽属性栏.名称输入框:置可视(false,false)
				tp.窗口.召唤兽属性栏.加入 = math.max(tp.窗口.召唤兽属性栏.加入 - 1,0)
				tp.窗口.召唤兽属性栏:置形象()
				if tp.窗口.道具行囊.可视 and tp.窗口.道具行囊.窗口 == "召唤兽" then
					if bb == tp.队伍[1].宝宝列表[tp.窗口.道具行囊.选中召唤兽] then
						tp.窗口.道具行囊.选中召唤兽 = 0
						tp.窗口.道具行囊.资源组[4] = nil
						for s=1,3 do
							tp.窗口.道具行囊.召唤兽装备[s]:置物品(nil)
						end
					end
				end
			end
			if tp.窗口.召唤兽资质栏.可视 then
				tp.窗口.召唤兽资质栏:打开()
			end
			tp.窗口.召唤兽属性栏.选中 = tp.窗口.召唤兽属性栏.选中 - 1
		end
		local 序列号 = tp.队伍[1].宝宝列表[self.选中].认证码
		发送数据(5014,{仓库页=self.仓库页数,存入序列=序列号})
		--table.insert(bba,tp.队伍[1].宝宝列表[self.选中])
		--table.remove(tp.队伍[1].宝宝列表, self.选中)
		self.选中 = 0
	end
	self.焦点 = false
	self.焦点1 = nil
	self.资源组[1]:显示(self.x,self.y)
	self.资源组[2]:显示(self.x+19,self.y+3)
	self.资源组[2]:显示(self.x+197,self.y+3)
	-- tp.窗口标题背景_:置区域(0,0,84,16)
	-- tp.窗口标题背景_:显示(self.x+57,self.y+3)
	-- tp.窗口标题背景_:显示(self.x+241,self.y+3)
	zts1:置字间距(1)
	zts1:显示(self.x+62,self.y+3,"召唤兽仓库")
	zts1:显示(self.x+246,self.y+3,"携带召唤兽")
	zts1:置字间距(0)
	self.资源组[3]:显示(self.x+22,self.y+39)
	self.资源组[3]:显示(self.x+202,self.y+39)
	self.资源组[4]:显示(self.x+359,self.y+6)
	self.资源组[5]:显示(self.x+15,self.y+271)
	self.资源组[6]:显示(self.x+210,self.y+270)
	self.资源组[7]:显示(self.x+291,self.y+270)
	self.资源组[8]:显示(self.x+80,self.y+270)
	self.资源组[9]:显示(self.x+140,self.y+270)
	local yyy = 1
	for i= 1, 8 do
		if self.召唤兽仓库[i] ~= nil then
			zts:置颜色(-16777216)
			local jx = self.x+34
			local jy = self.y+55+yyy*22
			bw:置坐标(jx-4,jy-3)
			if i ~= self.选中1 then
				if bw:检查点(x,y) then
					box(jx-5,jy-6,jx+138,jy+15,-3551379)
					self.焦点 = true
					if mouseb(0) and self.鼠标 and not tp.消息栏焦点 then
						self.选中1 = i
					end
				end
			else
				local ys = -10790181
				if bw:检查点(x,y) then
					ys = -9670988
					self.焦点1 = true
					self.焦点 = true
					if mouseb(1) and self.鼠标 and not tp.消息栏焦点 then
						tp.窗口.召唤兽查看栏:打开(self.召唤兽仓库[i])
					end
				end
				box(jx-5,jy-6,jx+138,jy+15,ys)
			end
			zts:显示(jx,jy-2,self.召唤兽仓库[i].名称)
		end
		yyy = yyy + 1
		if yyy > 8 then
			yyy = 1
		end
	end
	for i=1,#bbc do
		if bbc[i].参战信息 == nil then
			zts:置颜色(-16777216)
		else
		    zts:置颜色(-65536)
		end
		local jx = self.x+213
		local jy = self.y+55+i*22
		bw:置坐标(jx-4,jy-3)
		if i ~= self.选中 then
			if bw:检查点(x,y) then
				box(jx-5,jy-6,jx+138,jy+15,-3551379)
				self.焦点 = true
				if mouseb(0) and self.鼠标 and not tp.消息栏焦点 then
					self.选中 = i
				end
			end
		else
			local ys = -10790181
			if bw:检查点(x,y) then
				ys = -9670988
				self.焦点 = true
				self.焦点1 = true
				if mouseb(1) and self.鼠标 and not tp.消息栏焦点 then
					tp.窗口.召唤兽查看栏:打开(bbc[i])
				end
			end
			box(jx-5,jy-6,jx+138,jy+15,ys)
		end
		zts:显示(jx,jy-2,bbc[i].名称)
	end
	zts2:置颜色(-16777216)
	zts2:显示(self.x+24,self.y+274,self.仓库页数)
end

function 场景类_召唤兽仓库:检查点(x,y)
	if self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 场景类_召唤兽仓库:初始移动(x,y)
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

function 场景类_召唤兽仓库:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 场景类_召唤兽仓库