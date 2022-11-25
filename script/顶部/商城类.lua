local 商城类 = class()
local mousea = 引擎.鼠标弹起
local tos = 引擎.取金钱颜色
local insert = table.insert
local remove = table.remove
local floor = math.floor
local move = table.move
local min = math.min
local max = math.max
local ceil = math.ceil
local tx = 引擎.取头像
local qmxs = 引擎.取模型
local ani = 引擎.取战斗模型
local qzdjy = 引擎.取锦衣模型
local qzdjys = 取锦衣身体模型
local zqj = 引擎.坐骑库
--local x类 = {"杂货","仙玉","积分","折扣","宝宝","法宝","锦衣祥瑞","锦衣","足迹","祥瑞","足印","比武积分","水果积分","副本积分","妖魔积分"}
local x类 = {"杂货","仙玉","积分","折扣","流水","宝宝","法宝","祥瑞","锦衣","足迹","祥瑞","足印","比武积分","水果积分","副本积分","妖魔积分"}

local zts2,zts
local tp
local 临时资源包
local bw = require("gge包围盒")(0,0,25,25)
local bw1 = require("gge包围盒")(0,0,110,25)
local bw2 = require("gge包围盒")(0,0,110,25)
local bw3 = require("gge包围盒")(0,0,110,25)
function 商城类:初始化(根)
	tp=根
	self.ID = 47
	self.x = -20
	self.y = 10
	self.xx = 0
	self.yy = 0
	self.注释 = ""
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	self.本类开关 = false
	self.选中编号4=0
	self.选中编号3 = 0
	self.选中编号2 = 0
	self.选中编号 = 0
	self.银两数额 = 0
	self.加入 = 0
	self.分类="首页"
	self.子类="锦衣"
	self.控件类 = require("ggeui/加载类")()
	local 总控件 = self.控件类:创建控件('给予总控件')
	总控件:置可视(true,true)
	self.输入框 = 总控件:创建输入("银两输入",0,0,100,14)
	self.输入框:置可视(false,false)
	self.输入框:置限制字数(8)
	self.输入框:置数字模式()
	self.输入框:屏蔽快捷键(true)
	self.输入框:置光标颜色(-16777216)
	self.输入框:置文字颜色(-16777216)
	zts2 = require("gge文字类").创建(nil,16,false,false,true)
	zts = require("gge文字类").创建(nil,20,false,false,true)
	zts2:置描边颜色(-16777216)
	zts:置描边颜色(-16777216)
	zts:置颜色(4294967295)
	zts2:置颜色(4294967295)
end

function 商城类:检查点(x,y)
	if self.可视 and self.背景 ~= nil and self.背景:是否选中(x,y) then
		return true
	else
		return false
	end
end

function 商城类:打开(数据)
	if self.选中编号 ~=0 then
	   return false
	end
	if self.可视 then
		self.变量 = {}
		self.可视 = false
		self.选中ID=0
		self.选中编号2 = 0
		self.选中编号3 = 0
		self.选中编号4 = 0
		self.选中编号 = 0
		--self.物品数据={杂货={},仙玉={},积分={},折扣={},宝宝={},法宝={},锦衣={},祥瑞={},足迹={},足印={},比武积分={},水果积分={},副本积分={},妖魔积分={}}
		self.物品数据={杂货={},仙玉={},积分={},折扣={},宝宝={},法宝={},锦衣祥瑞={},锦衣={},祥瑞={},足迹={},足印={},比武积分={},水果积分={},副本积分={},妖魔积分={}}

		self.输入框:置可视(false,false)
		self.背景 = nil
		self.背景2 =  nil
		self.选中显示 =  nil
		self.选中显示2 =  nil
		self.银两文字 =  nil
		self.银两文字1 =  nil
		self.银两文字2 =  nil
		self.银两文字3 =  nil
		self.调用文字 = nil
		self.调用文字2 = nil
		self.购买 = nil
		self.充值 = nil
		self.资源组 = nil
		return
	else
		insert(tp.窗口_,self)
		local 资源 = tp.资源
		local 按钮 = tp._按钮
		local 自适应 = tp._自适应
		self.背景 = 资源:载入('wpal/121.wpal',"网易WDF动画",0x10033000)
		self.背景2 = 自适应.创建(37,1,478,250,3,9)
		self.选中显示 = 资源:载入('wzife.wdf',"网易WDF动画",0x6F88F494)
		self.选中显示2 = 资源:载入('wzife.wdf',"网易WDF动画",0x10921CA7)
		self.银两文字 = tp.文字类.创建(wdf配置.."/font/simsun.ttc", 15)
		self.银两文字1 = tp.文字类.创建(wdf配置.."/font/simsun.ttc", 15)
		self.银两文字2 = tp.文字类.创建(wdf配置.."/font/simsun.ttc", 15)
		self.银两文字3 = tp.文字类.创建(wdf配置.."/font/simsun.ttc", 15)
		self.银两文字3:置颜色(黑色)
		self.调用文字 = tp.文字类(wdf配置.."/font/simsun.ttc", 16)
		self.调用文字:置颜色(白色)
		self.调用文字2 = tp.文字类(wdf配置.."/font/simsun.ttc", 16)
		self.调用文字2:置颜色(黑色)
		self.购买 = 按钮.创建(pwd("11"),0,0,2,true,true," 购  买")
		self.充值 = 按钮.创建(pwd("11"),0,0,2,true,true," 充  值")
		self.购买:绑定窗口_(47)
		self.充值:绑定窗口_(47)
		self.资源组 = {
			[1] = 按钮.创建(资源:载入('wpal/121.wpal',"网易WDF动画",0x10035000),0,0,4,true,true), --银子
			[2] = 按钮.创建(资源:载入('wpal/121.wpal',"网易WDF动画",0x10038000),0,0,4,true,true), --仙玉
			--[3] = 按钮.创建(pwd("1"),0,0,4,true,true,"			积 分 商 城"),
			[3] = 按钮.创建(资源:载入('wpal/121.wpal',"网易WDF动画",0x10042000),0,0,4,true,true),--首页
			[5] = 按钮.创建(资源:载入('wpal/121.wpal',"网易WDF动画",0x10040000),0,0,4,true,true),--宝宝
			[4] = 按钮.创建(pwd("1"),0,0,4,true,true,"			限 时 折 扣"),
			[6] = 按钮.创建(资源:载入('wpal/121.wpal',"网易WDF动画",0x10041000),0,0,4,true,true),--法宝
			[7] = 按钮.创建(pwd("1"),0,0,4,true,true,"  查看召唤兽属性"),
			[8] = 按钮.创建(资源:载入('wpal/121.wpal',"网易WDF动画",0x10037000),0,0,4,true,true),--锦衣
			[9] = 按钮.创建(资源:载入('wpal/121.wpal',"网易WDF动画",0x10039000),0,0,4,true,true),--点卡
			[10] = 按钮.创建(资源:载入('wpal/121.wpal',"网易WDF动画",0x10042000),0,0,4,true,true),--积分
			[11] = 图像类("pic/道具背景.png"),
			[12] = 图像类("pic/锦衣道具背景.png"),
			[13] = 图像类("pic/神兽背景.png"),
			[25] = 图像类("pic/输入背景.png"),
			[26] = 自适应.创建(2,1,158,153,3,9),

			--[27] = 按钮.创建(资源:载入('wpal/121.wpal',"网易WDF动画",0xEEE36C06),0,0,4,true,true),--上滚动
			--[28] = 按钮.创建(资源:载入('wpal/121.wpal',"网易WDF动画",0xEEE36C07),0,0,4,true,true),--下滚动
			[27] =  按钮.创建(pwd("11"),0,0,2,true,true,"上一页"),--上滚动
			[28] =  按钮.创建(pwd("11"),0,0,2,true,true,"下一页"),--下滚动
			[35] = 图像类("pic/商城首页.png"),
			[36] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),
			[38] = 按钮.创建(自适应.创建(12,4,43,22,1,3),0,0,4,true,true,"锦衣"),
			[39] = 图像类("pic/角色背景.png"),
			[40] = 按钮.创建(pwd("11"),0,0,4,true,true,"锦衣商城"),
			[41] = 按钮.创建(pwd("11"),0,0,4,true,true,"坐骑商城"),
			[42] = 按钮.创建(pwd("11"),0,0,4,true,true,"足迹商城"),
			[43] = 按钮.创建(pwd("11"),0,0,4,true,true,"足印商城"),
			[44] = 按钮.创建(pwd("11"),0,0,4,true,true,"宝石礼包"),
			[45] = 按钮.创建(pwd("11"),0,0,4,true,true,"变身卡"),
			[46] = 按钮.创建(pwd("11"),0,0,4,true,true,"符石"),
			[47] = 按钮.创建(pwd("11"),0,0,4,true,true,"内丹"),
			[48] = pwd("13"),
			[49] = 资源:载入('wzife.wd4',"网易WDF动画",0x2C78FCFE),
			[50] = 按钮.创建(pwd("11"),0,0,4,true,true,"外附魂骨"),
			[60] = 按钮.创建(pwd("11"),0,0,4,true,true,"变身卡"),
			[61] = 按钮.创建(pwd("11"),0,0,4,true,true,"点卡坐锦"),
			[62] = 按钮.创建(资源:载入('wzife.wd4',"网易WDF动画",0xCFC32179),0,0,4,true,true,"  兑 换 点 卡"),
			[63] = 按钮.创建(资源:载入('wzife.wd4',"网易WDF动画",0xCFC32179),0,0,4,true,true,"  天 地 锦 衣"),
			[64] = 按钮.创建(资源:载入('wzife.wd4',"网易WDF动画",0xCFC32179),0,0,4,true,true,"超 级 神 兜 兜"),
			[65] = 按钮.创建(资源:载入('wzife.wd4',"网易WDF动画",0xCFC32179),0,0,4,true,true,"  购 买 VIP"),
			[66] = 按钮.创建(资源:载入('wzife.wd4',"网易WDF动画",0xCFC32179),0,0,4,true,true,"  推 广 礼 包"),
			[67] = 按钮.创建(资源:载入('wzife.wd4',"网易WDF动画",0xCFC32179),0,0,4,true,true,"  在 线 礼 包"),
			[68] = 按钮.创建(资源:载入('wzife.wd4',"网易WDF动画",0xCFC32179),0,0,4,true,true,"  离 线 经 验"),
			[69] = 按钮.创建(资源:载入('wzife.wd4',"网易WDF动画",0xCFC32179),0,0,4,true,true,"  充 值 点 卡"),
			[70] = 按钮.创建(资源:载入('wzife.wd4',"网易WDF动画",0xCFC32179),0,0,4,true,true,"  累 冲 奖 励"),
			[71] = 按钮.创建(资源:载入('wzife.wd4',"网易WDF动画",0xCFC32179),0,0,4,true,true,"  点 卡 竞 猜"),
			[72] = 按钮.创建(资源:载入('wzife.wd4',"网易WDF动画",0xCFC32179),0,0,4,true,true,"  周 末 抽 奖"),
			[73] = 按钮.创建(资源:载入('wzife.wd4',"网易WDF动画",0xCFC32179),0,0,4,true,true,"  BUG 提 交"),
			[74] = 按钮.创建(资源:载入('wzife.wd4',"网易WDF动画",0xCFC32179),0,0,4,true,true,"  其 他 功 能"),
			[75] = 按钮.创建(资源:载入('wzife.wd4',"网易WDF动画",0xCFC32179),0,0,4,true,true,"  敬 请 期 待"),
			[76] = 图像类("pic/神兽名称.png"),
			[77] = 图像类("pic/神兽背景2.png"),
		}

		for i=1,3 do
			self.资源组[i]:绑定窗口_(47)
		end
		for i=62,75 do
			self.资源组[i]:绑定窗口_(47)
		end
		for i=4,5 do
			self.资源组[i]:绑定窗口_(47)
		end

		--self.资源组[35]:绑定窗口_(47)
		--self.资源组[36]:绑定窗口_(47)
		if 数据==nil then
		    return 0
		end
		if 数据.序列==1 then
		    self.分类="杂货"
		elseif 数据.序列==2 then
			self.分类="积分"
		end
		self.本类开关 = true
		self.数据 = 数据
		self.组号 = 数据.组号
		self.物品数据 = {杂货={},仙玉={},积分={},折扣={},流水={},宝宝={},法宝={},锦衣={},祥瑞={},足迹={},足印={},比武积分={},水果积分={},副本积分={},妖魔积分={}}

		self.商品编号 = 0
		for n = 1,#x类 do
			if x类[n]=="宝宝" then
				for i=1,#数据[x类[n]] do
					local xn = ani(数据[x类[n]][i].模型)
					self.物品数据[x类[n]][i] = tp.资源:载入(xn[10],"网易WDF动画",xn[6])
					self.物品数据[x类[n]].数量的=#数据[x类[n]]
					self.物品数据[x类[n]][i].编号 = n
					self.物品数据[x类[n]][i].价格=数据[x类[n]][i].价格
					self.数据[x类[n]][i].价格=0
				end


		--local n = ani(self.数据[self.分类][self.选中编号4].模型)
		--self.资源组[24] = tp.资源:载入(n[10],"网易WDF动画",n[6])
			else
				for i=1,#数据[x类[n]] do
					self.物品数据[x类[n]][i] = tp._物品格子.创建(0,0,i,"给予_物品")
					self.物品数据[x类[n]][i]:置物品(数据[x类[n]][i])
					self.物品数据[x类[n]].数量的=#数据[x类[n]]
					self.物品数据[x类[n]][i].编号 = n
					self.物品数据[x类[n]][i].价格=数据[x类[n]][i].价格
				end
			end
		end
		self.资源组[23] = nil
	    self.资源组[29] = nil
	    self.资源组[33] = nil
	    self.资源组[32] = nil
	    self.资源组[30] = nil
	    self.资源组[31] = nil
		self.资源组[51] = nil
	    self.显示足印 = nil
		self.显示翅膀 = nil
	    self.显示足迹 = nil
		self.坐骑显示 = nil
		self.显示锦衣 = nil
		self.数量 = 1
		self.价格 = 0
		self.名称 = " "
		self.仙玉 = 数据.仙灵玉
		self.点卡 = 数据.点卡
		self.银子 = 数据.银子
		self.积分 = 数据.积分数
		self.总额 = 0
		tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间
		self.可视 = true
		self.选中编号2 = 0
		self.选中编号3 = 0
		self.选中编号4 = 0
	    self.输入框:置可视(true,true)
	    self.输入框:置文本("")
	    if self.分类 == "杂货" or self.分类 == "仙玉" or self.分类 == "点卡" or self.分类 == "法宝" or self.分类 == "折扣"or self.分类 == "积分"  then
			self.翻页数据 = math.floor(self.物品数据[self.分类].数量的/32)
		elseif self.分类 == "宝宝" then
			self.翻页数据 = math.floor(self.物品数据[self.分类].数量的/16)
		elseif self.分类 == "锦衣"  or self.分类 == "祥瑞" or self.分类 == "足迹" or self.分类 == "足印" or self.分类 == "锦衣祥瑞"   then
			self.翻页数据 = math.floor(self.物品数据[self.子类].数量的/20)
		else
		    self.翻页数据 = math.floor(self.物品数据[self.分类].数量的/20)
		end
	end
end

function 商城类:刷新(数据)
 self.点卡 = 数据.点灵卡
end


function 商城类:初始系统(dt,x,y,l)
	zts2:显示(self.x+350,self.y+ 430, "")
	if l~=nil and l==2 then
		self.商品编号=0
		self.数量 = 1
		self.价格 = 0
		self.名称 = " "
		self.总额 = 0
		self.选中编号=0
		self.选中编号2=0
		self.选中编号3 = 0
		self.选中编号4 = 0
		bbsa=0
		--self.资源组[35]:置起始点(0)
	else
		self.商品编号=0
		self.数量 = 1
		self.价格 = 0
		self.名称 = " "
		self.总额 = 0
		self.选中编号=0
		self.选中编号2=0
		self.选中编号3 = 0
		self.选中编号4 = 0
	end
	if self.分类 == "杂货" or self.分类 == "仙玉"  or self.分类 == "点卡" or self.分类 == "法宝" or self.分类 == "折扣"   then
		self.翻页数据 = math.floor(self.物品数据[self.分类].数量的/32)
	elseif   self.分类 == "积分"  then
	    self.翻页数据 = math.floor(self.物品数据[self.子类].数量的/32)
	elseif self.分类 == "宝宝" then
		self.翻页数据 = math.floor(self.物品数据[self.分类].数量的/8)
	elseif  self.分类 == "锦衣"  or self.分类 == "祥瑞" or self.分类 == "足迹" or self.分类 == "足印"  or self.分类 == "锦衣祥瑞"  then
			self.翻页数据 = math.floor(self.物品数据[self.子类].数量的/20)
	else
		self.翻页数据 = math.floor(self.物品数据[self.子类].数量的/20)

	end
end

function 商城类:显示(dt,x,y)
    self.焦点=false
   	self.资源组[1]:更新(x,y,self.分类~="杂货")
	self.资源组[2]:更新(x,y,self.分类~="仙玉")
	self.资源组[9]:更新(x,y,self.分类~="点卡")
	self.资源组[3]:更新(x,y,self.分类~="积分")
	self.资源组[5]:更新(x,y,self.分类~="宝宝")
	self.资源组[10]:更新(x,y,self.分类~="积分")
	self.资源组[6]:更新(x,y,self.分类~="法宝")
	self.资源组[8]:更新(x,y,self.分类~="锦衣祥瑞")
	self.资源组[3]:更新(x,y,self.分类~="首页")
	self.背景:显示(self.x+115, self.y+40)
	self.资源组[1]:显示(self.x+150+34-68, self.y+76+35,true,nil,nil,self.分类 == "杂货",2)
	self.资源组[2]:显示(self.x+150+34-68, self.y+76+35+40,true,nil,nil,self.分类 == "仙玉",2)
	self.资源组[9]:显示(self.x+150+34-68, self.y+76+35+80,true,nil,nil,self.分类 == "点卡",2)
	self.资源组[8]:显示(self.x+150+34-68, self.y+76+35+120,true,nil,nil,self.分类 == "锦衣祥瑞",2)
	self.资源组[6]:显示(self.x+150+34-68, self.y+76+35+160,true,nil,nil,self.分类 == "法宝",2)
	self.资源组[5]:显示(self.x+150+34-68, self.y+76+35+200,true,nil,nil,self.分类 == "宝宝",2)
   self.资源组[10]:显示(self.x+150+34-68, self.y+76+35+238,true,nil,nil,self.分类 == "积分",2)
	if self.资源组[1]:事件判断() then
		self.分类="杂货"
		self:初始系统(dt,x,y,2)
		self.加入=0
	elseif self.资源组[2]:事件判断() then
		self.分类="仙玉"
		self:初始系统(dt,x,y,2)
		self.加入=0
	elseif self.资源组[9]:事件判断() then
		self.分类="折扣"
		self:初始系统(dt,x,y,2)
		self.加入=0
	elseif self.资源组[3]:事件判断() then
		self.分类="积分"
		self.子类="比武积分"
		self:初始系统(dt,x,y,2)
		self.加入=0
	elseif self.资源组[3]:事件判断() then
		self.分类="首页"
		self.子类="比武积分"
		self:初始系统(dt,x,y,2)
		self.加入=0
	elseif self.资源组[4]:事件判断() then
		self.分类="折扣"
		self:初始系统(dt,x,y,2)
		self.加入=0
	elseif self.资源组[5]:事件判断() then
		self.分类="宝宝"
		self:初始系统(dt,x,y,2)
		self.加入=0
	elseif self.资源组[10]:事件判断() then
		self.分类="积分"
		self.子类="比武积分"
		self:初始系统(dt,x,y,2)
		self.加入=0
	elseif self.资源组[6]:事件判断() then
	 	self.分类="法宝"
	 	self:初始系统(dt,x,y,2)
	 	self.加入=0
	elseif self.资源组[8]:事件判断() then
		self.分类="锦衣祥瑞"
		self.子类="锦衣"
		self:初始系统(dt,x,y,2)
		self.加入=0
	end
   bw:置坐标(self.x+635+120+127,self.y+40+12)

	  if bw:检查点(x,y)  then
        if 引擎.鼠标弹起(0)   then
		self:打开()
		return
		end
	  end
	--  zts:置颜色(黄色)
	 -- self.资源组[49]:更新(dt)
	 -- self.资源组[49]:显示(self.x+350+110+157-36-290,    self.y+ 429+30+50-160-245)
	 -- self.资源组[49]:显示(self.x+350+110+157-36-290+275,    self.y+ 429+30+50-160-245)


 if self.分类=="首页" then
    -- self.资源组[35]:显示(self.x+152+102, self.y+119+32)
	-- zts2:置颜色(白色)
	-- zts2:显示(self.x+350+110+157-36-310,self.y+ 429+30+50-200, "主页可以提供一下功能：")
 else
	if self.输入框:取文本() ~= "" and self.数量 ~= (self.输入框:取文本()+0) then
		self.数量 = 到整数(self.输入框:取文本())
		self.总额 = self.数量 * self.价格
	end
	 self.资源组[9]:更新(x,y,self.分类~="坐骑")
	 self.资源组[38]:更新(x,y,self.分类~="锦衣")
	self.资源组[7]:更新(x,y,self.选中编号3~=0)
	self.购买:更新(x,y,self.商品编号 ~= 0)
	self.充值:更新(x,y)
	if self.购买:事件判断() then
		if self.商品编号 == 0 then
			tp.提示:写入("#y/请先选择一件商品")
		else
			if self.商品编号~=0 then
				if self.分类=="杂货" then
				    if self.银子< self.物品数据[self.分类][self.商品编号].价格 then
					    tp.提示:写入("#y/银子不够购买商品!")
					    return
					end
				-- elseif self.分类=="积分" then
				--     if self.积分[self.子类]< self.物品数据[self.子类][self.商品编号].价格 then
				-- 	    tp.提示:写入("#y/积分不够购买商品!")
				-- 	    return
				-- 	end
				-- else
					if self.分类=="锦衣祥瑞" and self.仙玉< self.物品数据[self.子类][self.商品编号].价格 then
					    tp.提示:写入("#y/仙玉不够购买商品!")
					    return
					end
					if self.分类=="仙玉" and self.仙玉< self.物品数据[self.分类][self.商品编号].价格 then
					    tp.提示:写入("#y/仙玉不够购买商品!")
					    return
					end
					if self.分类=="点卡" and self.点卡< self.物品数据[self.分类][self.商品编号].价格 then
					    tp.提示:写入("#y/点卡不够购买商品!")
					    return
					end
					if self.子类=="坐锦" and self.点卡< self.物品数据[self.子类][self.商品编号].价格 then
					    tp.提示:写入("#y/点卡不够购买商品!")
					    return
					end
					if self.分类=="宝宝" or self.分类=="点卡神兽" then
					   if #tp.队伍[1].宝宝列表>=7 then
					       tp.提示:写入( "#y/您当前无法携带更多的召唤兽了")
					       return
					   end
					end
				end
				if self.分类=="杂货" then
				    self.银子=self.银子-self.物品数据[self.分类][self.商品编号].价格*self.数量
				elseif self.积分=="积分" then
					self.积分[self.子类]=self.积分[self.子类]-self.物品数据[self.子类][self.商品编号].价格*self.数量
				elseif self.分类 == "仙玉" then
					self.仙玉=self.仙玉-self.物品数据[self.分类][self.商品编号].价格*self.数量
				elseif self.子类 == "坐锦" then
					self.点卡 = self.点卡-self.物品数据[self.子类][self.商品编号].价格*self.数量
				elseif self.分类 == "锦衣祥瑞" then
					self.仙玉=self.仙玉-self.物品数据[self.子类][self.商品编号].价格*self.数量
				end
				if self.分类 == "宝宝" or self.分类 == "点卡神兽" then
					tp.窗口.对话栏:文本("普陀_接引仙女","神兽乐园","请选择您要购买的神兽类型",{"购买法系神兽","购买物理神兽"})
				else
					self.发送信息 = {
						编号 = self.商品编号,--self.物品数据[self.分类][self.商品编号].编号,
						位置 =self.商品编号,
						数量 = self.数量,
						组号 = self.组号,
						分类 = self.分类
					}
					if self.分类=="锦衣祥瑞" or self.分类=="积分" then
						self.发送信息.分类=self.子类
					end
					发送数据(30,self.发送信息)
				end

				if tp.窗口.召唤兽属性栏.可视 then
	                tp.窗口.召唤兽属性栏:打开()
	            end
				if tp.窗口.道具行囊.可视 then
					tp.窗口.道具行囊:打开()
				end
			end
		end

	elseif self.充值:事件判断() then
		引擎.运行(全局地址)
		return
	elseif self.资源组[36]:事件判断() then
		self:打开()
		self.本类开关 = false
		self.输入框:置可视(false,false)
		return false
	end




	zts:置颜色(蓝色)
	zts:显示(self.x+430,self.y+ 40, self.注释)
	zts2:置颜色(绿色)
	zts2:显示(self.x+145+110,self.y+ 370+20+41,"商品名称")
	zts2:显示(self.x+145+110,self.y+ 404+30+41,"商品单价")
	zts2:显示(self.x+350+157-30,self.y+404+15,"数 量")
	zts2:显示(self.x+350+157-30,self.y+404+50,"总 额")

	--self.资源组[49]:显示(self.x+635+120+130,self.y+40+12)

	 if self.分类 == "杂货" or self.分类 == "仙玉" or self.分类 == "点卡" or self.分类 == "法宝" or self.分类 == "折扣"  or self.分类 == "积分" then
	  self.资源组[11]:显示(self.x+296,self.y+ 159)
	  elseif   self.分类 == "锦衣祥瑞"  then
	  self.资源组[12]:显示(self.x+480,self.y+ 159)
	  elseif   self.分类 == "宝宝" then
	--  self.资源组[12]:显示(self.x+261,self.y+ 179)
	   elseif   self.分类 == "点卡神兽" then
	  self.资源组[12]:显示(self.x+261,self.y+ 179)
	 end
	 if self.分类 == "杂货" then
	    zts2:显示(self.x+350+157-30,self.y+404+86, "现 金")
	 elseif self.分类 == "积分" then
	 	zts2:显示(self.x+350+157-30,self.y+404+86, "点 卡")
	  elseif self.分类 == "折扣" or  self.分类 == "点卡" then
	 	zts2:显示(self.x+350+157-30,self.y+404+86, "点 卡")
	  elseif self.分类 =="锦衣祥瑞" and self.子类=="坐锦" then
	  	zts2:显示(self.x+350+157-30,self.y+404+86, "点 卡")
	 else
	 	zts2:显示(self.x+350+157-30,self.y+404+86, "仙 玉")
	end
	self.资源组[25]:显示(self.x+213+110,self.y+ 358+70)
	self.资源组[25]:显示(self.x+213+110,self.y+ 403+70)
	self.资源组[25]:显示(self.x+350+157+25,self.y+404+11)
	self.资源组[25]:显示(self.x+350+157+25,self.y+404+45)
	self.资源组[25]:显示(self.x+350+157+25,self.y+404+81)

   -- self.资源组[4]:显示(self.x+150+30-68, self.y+70+35+280,true,nil,nil,self.分类 == "折扣",2)
	--self.资源组[3]:显示(self.x+290+30, self.y+100,true,nil,nil,self.分类 == "积分",2)
	--if self.分类~="宝宝" and  self.分类~="点卡神兽"    then

	--end



--	self.充值:显示(self.x+540+110-40, self.y+403+30+105)
	if self.分类~="宝宝"  then
	self.控件类:更新(dt,x,y)
	self.控件类:显示(x,y)
	self.购买:显示(self.x+690,self.y+403+80)
	self.输入框:置坐标(self.x+350+157+35,self.y+404+15)
	end

	if self.分类=="宝宝"  then
		self:召唤兽类(dt,x,y)
    elseif self.分类=="点卡神兽" then
       self:召唤兽类(dt,x,y,1)
	elseif self.分类=="锦衣祥瑞" or (self.分类=="锦衣祥瑞" and self.子类=="锦衣") or (self.分类=="锦衣祥瑞" and self.子类=="祥瑞")  or (self.分类=="锦衣祥瑞" and self.子类=="变身卡")   or (self.分类=="锦衣祥瑞" and self.子类=="足迹") or (self.分类=="锦衣祥瑞" and self.子类=="翅膀") or (self.分类=="锦衣祥瑞" and self.子类=="足印") or (self.分类=="锦衣祥瑞" and self.子类=="坐锦") then
		self:锦衣类(dt,x,y)
	elseif self.分类=="积分" or (self.分类=="积分" and self.子类=="比武积分") or (self.分类=="积分" and self.子类=="水果积分") or (self.分类=="积分" and self.子类=="副本积分") or (self.分类=="积分" and self.子类=="妖魔积分") then
		self:积分类(dt,x,y)
	else
	if self.分类~="首页" then
		self:物品类(dt,x,y)
	end
	end
	--if self.资源组[35].接触 then
		--self.焦点 = true
		--self:初始系统(dt,x,y,0)
		--self.加入=0
	--end
	end

end

function 商城类:物品类(dt,x,y)
	self.输入框:置可视(true,true)
	if self.资源组[27]:事件判断() then

		self:初始系统(dt,x,y,0)
		if self.加入 >0 then
			self.加入 = self.加入 - 1
		end
	elseif self.资源组[28]:事件判断() then
		self:初始系统(dt,x,y,0)
		if self.加入 <self.翻页数据 then
			self.加入 = self.加入 + 1
		end

	end
	self.资源组[27]:更新(x,y,self.加入 > 0)
	self.资源组[28]:更新(x,y,self.加入 < self.翻页数据)
	self.焦点 = false
	if self.分类 == "杂货" then
		self.银两文字:置颜色()
		zts2:显示(self.x+350+157+35,self.y+404+85,self.银子)
	    --银两显示(self.银两文字, self.银子, self.x+350+157+35,self.y+404+85)
	elseif self.分类 == "积分" then
		银两显示(self.银两文字, self.点卡,self.x+350+157+35,self.y+404+85)
	elseif self.分类 == "点卡"  then
		self.银两文字:置颜色()
		zts2:显示(self.x+350+157+35,self.y+404+85,self.点卡)
		--银两显示(self.银两文字, self.点卡,self.x+350+157+35,self.y+404+85)
	elseif self.分类 == "锦衣祥瑞" and self.子类=="坐锦" then
		self.银两文字:置颜色()
		zts2:显示(self.x+350+157+35,self.y+404+85,self.仙玉)
        --银两显示(self.银两文字, self.点卡,self.x+350+157+35,self.y+404+85)
	elseif self.分类 == "折扣" then
		self.银两文字:置颜色()
		zts2:显示(self.x+350+157+35,self.y+404+85,self.点卡)
        --银两显示(self.银两文字, self.点卡,self.x+350+157+35,self.y+404+85)
	else
		self.银两文字:置颜色()
		zts2:显示(self.x+350+157+35,self.y+404+85,self.仙玉)
		--银两显示(self.银两文字, self.仙玉, self.x+350+157+35,self.y+404+85)
	end
	银两显示(self.银两文字1, self.名称,self.x+205+110+36-20,self.y+ 406+28)
	银两显示(self.银两文字1, self.价格,self.x+205+110+36-20,self.y+ 406+30+41)
	银两显示(self.银两文字2, self.总额,self.x+350+157+35,self.y+404+50)
	self.选中编号 = 0
	local x横,x竖 = 1,1
	for n = 1,32 do
		if self.物品数据[self.分类][n+self.加入*32]~=nil then
			if self.物品数据[self.分类][n+self.加入*32].焦点 then
				self.选中编号 = n+self.加入*32
				if 引擎.鼠标弹起(左键) then
				    self.选中编号2=n
				    self.选中编号3 = n+self.加入*32
				end
			end
			self.物品数据[self.分类][n+self.加入*32]:置坐标(self.x+240+x横*57, self.y+104+x竖*56)
			self.物品数据[self.分类][n+self.加入*32]:显示(dt,x,y,self.鼠标)
			if self.选中编号2 ~= 0 and self.选中编号2 == n then
				self.选中显示2:显示(self.x+242+x横*57, self.y+104+x竖*56)
			end
		end
		if x横 == 8  then
			x横 = 1
			x竖=x竖+1
		else
			x横 = x横+1
		end
	end
	if self.选中编号 ~= 0 then
		tp.提示:道具行囊(x,y,self.物品数据[self.分类][self.选中编号].物品)
		if 引擎.鼠标弹起(左键) then
			self.价格 = self.数据[self.分类][self.选中编号].价格
			self.名称 = self.数据[self.分类][self.选中编号].名称
			if self.商品编号 == self.选中编号 then
				self.数量 = self.数量 + 1
				self.总额 = self.数量 * self.价格
				self.输入框:置文本(self.数量)
				return 0
			else
				self.数量 = 1
				self.总额 = self.数量 * self.价格
				self.输入框:置文本(self.数量)
			end
			self.商品编号 = self.选中编号
		elseif 引擎.鼠标弹起(右键) and self.商品编号 == self.选中编号 and self.数量 > 1 then
			self.数量 = self.数量 - 1
			self.总额 = self.数量 * self.价格
			self.输入框:置文本(self.数量)
		end
	end
	if self.输入框._已碰撞 then
		self.焦点 = true
	end
	-- tp.画线:置区域(0,0,15,280)--滑块虚线
	-- tp.画线:显示(self.x+611-23,self.y+100+51)
	self.资源组[27]:显示(self.x+690,self.y+368+45)
	self.资源组[28]:显示(self.x+690,self.y+368+80)
	-- if bbsa > 55 then
	-- 	self.资源组[35]:显示(self.x+608-23,self.y+147+14,x,y,self.鼠标)
	-- end
end

function 商城类:积分类(dt,x,y)
	self.输入框:置可视(true,true)
	self.资源组[44]:更新(x,y,self.子类~="比武积分")
	self.资源组[45]:更新(x,y,self.子类~="水果积分")
	self.资源组[46]:更新(x,y,self.子类~="副本积分")
	self.资源组[47]:更新(x,y,self.子类~="妖魔积分")
	local bbsa = self.物品数据[self.子类].数量的
	if self.资源组[27]:事件判断() then
		-- self.资源组[35]:置起始点(self.资源组[35]:取百分比转换(self.加入-1,40,bbsa))
		self:初始系统(dt,x,y,0)
		if self.加入 >0 then
			self.加入 = self.加入 - 1
		end
	elseif self.资源组[28]:事件判断() then
		self:初始系统(dt,x,y,0)
		if self.加入 <self.翻页数据 then
			self.加入 = self.加入 + 1
		end
	elseif self.资源组[44]:事件判断() then
		self.子类="比武积分"
		self.分类="积分"
		self:初始系统(dt,x,y,2)
		self.加入=0
	elseif self.资源组[45]:事件判断() then
		self.子类="水果积分"
		self.分类="积分"
		self:初始系统(dt,x,y,2)
		self.加入=0
	elseif self.资源组[46]:事件判断() then
		self.子类="副本积分"
		self.分类="积分"
		self:初始系统(dt,x,y,2)
		self.加入=0
	elseif self.资源组[47]:事件判断() then
	 	self.子类="妖魔积分"
	 	self.分类="积分"
	 	self:初始系统(dt,x,y,2)
	 	self.加入=0
	end
	self.资源组[27]:更新(x,y,self.加入 > 0)
	self.资源组[28]:更新(x,y,self.加入 < self.翻页数据)
	self.资源组[44]:显示(self.x+250,self.y+105,true,nil,nil,self.子类 == "比武积分",2)
	self.资源组[45]:显示(self.x+250+80,self.y+105,true,nil,nil,self.子类 == "水果积分",2)
	self.资源组[46]:显示(self.x+250+160,self.y+105,true,nil,nil,self.子类 == "副本积分",2)
	self.资源组[47]:显示(self.x+250+240,self.y+105,true,nil,nil,self.子类 == "妖魔积分",2)
	self.焦点 = false
	if self.分类 == "杂货" then
	    银两显示(self.银两文字, self.银子, self.x+350+157+35,self.y+404+85)
	elseif self.分类 == "积分" then
		银两显示(self.银两文字, self.点卡, self.x+350+157+35,self.y+404+85)
	else
		银两显示(self.银两文字, self.仙玉,  self.x+350+157+35,self.y+404+85)
	end
	银两显示(self.银两文字1, self.名称,self.x+205+110+36-20,self.y+ 406+28)
	银两显示(self.银两文字1, self.价格,self.x+205+110+36-20,self.y+ 406+30+41)
	银两显示(self.银两文字2, self.总额,self.x+350+157+35,self.y+404+50)






	self.选中编号 = 0
		local x横,x竖 = 1,1
	for n = 1, 32 do
		if self.物品数据[self.子类][n+self.加入*32]~=nil then
			if self.物品数据[self.子类][n+self.加入*32].焦点 then
				self.选中编号 = n+self.加入*32
				if 引擎.鼠标弹起(左键) then
				    self.选中编号2=n+self.加入*32
				    self.选中编号3 = n+self.加入*32
				end
			end
			self.物品数据[self.子类][n+self.加入*32]:置坐标(self.x+240+x横*57, self.y+104+x竖*56)
			self.物品数据[self.子类][n+self.加入*32]:显示(dt,x,y,self.鼠标)

			if self.选中编号2 ~= 0 and self.选中编号2 == n then
				self.选中显示2:显示(self.x+240+x横*57, self.y+104+x竖*56)
			end
		end
		if x横 == 8  then
			x横 = 1
			x竖=x竖+1
		else
			x横 = x横+1
		end
	end

	if self.选中编号 ~= 0 then
		tp.提示:道具行囊(x,y,self.物品数据[self.子类][self.选中编号].物品)
		if 引擎.鼠标弹起(左键) then
			self.名称 = self.数据[self.子类][self.选中编号].名称
			self.价格 = self.数据[self.子类][self.选中编号].价格
			if self.商品编号 == self.选中编号 then
				self.数量 = self.数量 + 1
				self.总额 = self.数量 * self.价格
				self.输入框:置文本(self.数量)
				return 0
			else
				self.数量 = 1
				self.总额 = self.数量 * self.价格
				self.输入框:置文本(self.数量)
			end
			self.商品编号 = self.选中编号
		elseif 引擎.鼠标弹起(右键) and self.商品编号 == self.选中编号 and self.数量 > 1 then
			self.数量 = self.数量 - 1
			self.总额 = self.数量 * self.价格
			self.输入框:置文本(self.数量)
		end

	end
	if self.输入框._已碰撞 then
		self.焦点 = true
	end
	-- tp.画线:置区域(0,0,15,280)--滑块虚线
	-- tp.画线:显示(self.x+611-23,self.y+100+51)
	self.资源组[27]:显示(self.x+690,self.y+368+45)
	self.资源组[28]:显示(self.x+690,self.y+368+80)
	-- if bbsa > 55 then
	-- 	self.资源组[35]:显示(self.x+608-23,self.y+147+14,x,y,self.鼠标)
	-- end
end

function 商城类:锦衣类(dt,x,y)
	self.输入框:置可视(true,true)
	self.资源组[40]:更新(x,y,self.子类~="锦衣")
	self.资源组[41]:更新(x,y,self.子类~="祥瑞")
	self.资源组[42]:更新(x,y,self.子类~="足迹")
	self.资源组[43]:更新(x,y,self.子类~="足印")
		self.资源组[27]:更新(x,y,self.加入 > 0)
	self.资源组[28]:更新(x,y,self.加入 < self.翻页数据)
	self.焦点 = false
	--self.资源组[50]:更新(x,y,self.子类~="翅膀")
	--self.资源组[60]:更新(x,y,self.子类~="变身卡")
	--self.资源组[61]:更新(x,y,self.子类~="坐锦")
	local bbsa = self.物品数据[self.子类].数量的
	if self.资源组[27]:事件判断() then
		-- self.资源组[35]:置起始点(self.资源组[35]:取百分比转换(self.加入-1,40,bbsa))
		self:初始系统(dt,x,y,0)
		if self.加入 >0 then
			self.加入 = self.加入 - 1
		end
	elseif self.资源组[28]:事件判断() then
		-- self.资源组[35]:置起始点(self.资源组[35]:取百分比转换(self.加入+1,40,bbsa))
		self:初始系统(dt,x,y,0)
		if self.加入 <self.翻页数据 then
			self.加入 = self.加入 + 1
		end
	-- elseif (self.资源组[27]:是否选中(x,y) or self.资源组[35]:是否选中(x,y)) and 引擎.取鼠标滚轮() ==1 and self.加入 > 0 then
	-- 	self.资源组[35]:置起始点(self.资源组[35]:取百分比转换(self.加入-1,40,bbsa))
	-- 	self:初始系统(dt,x,y,0)
	-- elseif (self.资源组[28]:是否选中(x,y) or self.资源组[35]:是否选中(x,y)) and 引擎.取鼠标滚轮() ==-1 and self.加入 < bbsa - 32 then
	-- 	self.资源组[35]:置起始点(self.资源组[35]:取百分比转换(self.加入+1,40,bbsa))
	-- 	self:初始系统(dt,x,y,0)
	elseif self.资源组[40]:事件判断() then
		self.子类="锦衣"
		self.分类="锦衣祥瑞"
		self:初始系统(dt,x,y,2)
		self.加入=0
	elseif self.资源组[41]:事件判断() then
		self.子类="祥瑞"
		self.分类="锦衣祥瑞"
		self:初始系统(dt,x,y,2)
		self.加入=0
	elseif self.资源组[42]:事件判断() then
		self.子类="足迹"
		self.分类="锦衣祥瑞"
		self:初始系统(dt,x,y,2)
		self.加入=0
	elseif self.资源组[43]:事件判断() then
	 	self.子类="足印"
	 	self.分类="锦衣祥瑞"
	 	self:初始系统(dt,x,y,2)
	 	self.加入=0
   elseif self.资源组[50]:事件判断() then
	 	self.子类="翅膀"
	 	self.分类="锦衣祥瑞"
	 	self:初始系统(dt,x,y,2)
	 	self.加入=0

	elseif self.资源组[60]:事件判断() then
	 	self.子类="变身卡"
	 	self.分类="锦衣祥瑞"
	 	self:初始系统(dt,x,y,2)
	 	self.加入=0
	elseif self.资源组[61]:事件判断() then
	 	self.子类="坐锦"
	 	self.分类="锦衣祥瑞"
	 	self:初始系统(dt,x,y,2)
	 	self.加入=0
	end
	-- if bbsa > 40 then
	-- 	self.资源组[35]:置高度(min(floor(264/(bbsa-40)),50))
	-- 	self.加入 = min(ceil((bbsa-40)*self.资源组[35]:取百分比()),bbsa-40)
	-- end
	self.资源组[27]:更新(x,y,self.加入 > 0)
	--self.资源组[28]:更新(x,y,self.加入 < self.翻页数据)
	self.焦点 = false
	if self.子类=="坐锦" then
	银两显示(self.银两文字, self.点卡, self.x+400+110+35,self.y+ 431+30+30)
    else
	银两显示(self.银两文字, self.仙玉, self.x+400+110+35,self.y+ 431+30+30)
    end
	银两显示(self.银两文字1, self.名称,self.x+205+110+36-20,self.y+ 406+28)
	银两显示(self.银两文字1, self.价格,self.x+205+110+36-20,self.y+ 406+30+41)
	银两显示(self.银两文字2, self.总额,self.x+350+157+35,self.y+404+50)
	self.资源组[39]:显示(self.x+250,self.y+125+20)
	self.资源组[40]:显示(self.x+250,self.y+105,true,nil,nil,self.子类 == "锦衣",2)
	self.资源组[41]:显示(self.x+250+80,self.y+105,true,nil,nil,self.子类 == "祥瑞",2)
	self.资源组[42]:显示(self.x+250+160,self.y+105,true,nil,nil,self.子类 == "足迹",2)
	self.资源组[43]:显示(self.x+250+240,self.y+105,true,nil,nil,self.子类 == "足印",2)
	--self.资源组[50]:显示(self.x+567+100+35,self.y+145+25+192+25,true,nil,nil,self.子类 == "翅膀",2)
	--self.资源组[60]:显示(self.x+567+100+82+25,self.y+145+25+192+25,true,nil,nil,self.子类 == "变身卡",2)
	--self.资源组[61]:显示(self.x+567+100+35,self.y+145+25+192+25+25,true,nil,nil,self.子类 == "坐锦",2)
	self.选中编号 = 0
	local x横,x竖 = 1,1
	for n = 1, 20 do
		if self.物品数据[self.子类][n+self.加入*20]~=nil then
			if self.物品数据[self.子类][n+self.加入*20].焦点 then
				self.选中编号 = n+self.加入*20
				if 引擎.鼠标弹起(左键) then
				    self.选中编号2=n+self.加入*20
				    self.选中编号3 = n+self.加入*20
				end
			end
			self.物品数据[self.子类][n+self.加入*20]:置坐标(self.x+425+x横*57, self.y+102+x竖*57)
			self.物品数据[self.子类][n+self.加入*20]:显示(dt,x,y,self.鼠标)

		if self.选中编号2 ~= 0 and self.选中编号2 == n then
				self.选中显示2:显示(self.x+429+x横*57, self.y+102+x竖*57)
			end
		end

		if x横 == 5  then
			x横 = 1
			x竖=x竖+1
		else
			x横 = x横+1
		end
	end


	if self.选中编号 ~= 0 then
		tp.提示:道具行囊(x,y,self.物品数据[self.子类][self.选中编号].物品)
		if 引擎.鼠标弹起(左键) then
			self.名称 = self.数据[self.子类][self.选中编号].名称
			self.价格 = self.数据[self.子类][self.选中编号].价格
			if self.商品编号 == self.选中编号 then
				self.数量 = self.数量 + 1
				self.总额 = self.数量 * self.价格
				self.输入框:置文本(self.数量)
				return 0
			else
				self.数量 = 1
				self.总额 = self.数量 * self.价格
				self.输入框:置文本(self.数量)
			end
			self.商品编号 = self.选中编号
		elseif 引擎.鼠标弹起(右键) and self.商品编号 == self.选中编号 and self.数量 > 1 then
			self.数量 = self.数量 - 1
			self.总额 = self.数量 * self.价格
			self.输入框:置文本(self.数量)
		end

	end
	if self.选中编号2 ~= 0 then
	    if self.数据[self.子类][self.选中编号2].总类 == 102 and self.数据[self.子类][self.选中编号2].类型 == "锦衣"   and (self.资源组[23] == nil or self.资源组[23].名称 ~= self.数据[self.子类][self.选中编号2].名称) then
	    	local n
	    	if self.数据[self.子类][self.选中编号2].名称 == "夜影" or self.数据[self.子类][self.选中编号2].名称 == "夏日清凉" or self.数据[self.子类][self.选中编号2].名称 == "华风汉雅" or self.数据[self.子类][self.选中编号2].名称 == "萌萌小厨" then
				临时资源包 = "shape0.npk"
				if self.数据[self.子类][self.选中编号2].名称 == "华风汉雅" or self.数据[self.子类][self.选中编号2].名称 == "萌萌小厨" then
					临时资源包 = "shape2.npk"
				end
				self.资源组[23] = tp.资源:载入(临时资源包,"网易锦衣动画",qzdjy(tp.队伍[1].模型.."_静立_"..self.数据[self.子类][self.选中编号2].名称))
				self.资源组[23]:置方向(0)
				if self.数据[self.子类][self.选中编号2].名称 == "夏日清凉" or self.数据[self.子类][self.选中编号2].名称 == "华风汉雅" or self.数据[self.子类][self.选中编号2].名称 == "萌萌小厨" then
					self.资源组[32] = tp.资源:载入("shape0.npk","网易锦衣动画",qzdjys(tp.队伍[1].模型.."_静立_"..self.数据[self.子类][self.选中编号2].名称.."_头"))
					self.资源组[32]:置方向(0)
				else
					self.资源组[32] = nil
				end
	        else
	        	n = qmxs(self.数据[self.子类][self.选中编号2].名称.."_"..tp.队伍[1].模型)
				self.资源组[23] = tp.资源:载入(n[3],"网易WDF动画",n[1])
				self.资源组[23]:置方向(0)
			end
			self.显示锦衣 = self.数据[self.子类][self.选中编号2].名称
			self.资源组[23].名称 = self.数据[self.子类][self.选中编号2].名称
			self.资源组[30] = nil
		elseif self.数据[self.子类][self.选中编号2].总类 == 102 and self.数据[self.子类][self.选中编号2].类型 == "光环" and self.数据[self.子类][self.选中编号2].总类 ~= "祥瑞" and (self.资源组[29] == nil or self.资源组[29].名称 ~= self.数据[self.子类][self.选中编号2].名称)then
			local n = 引擎.取光环(self.数据[self.子类][self.选中编号2].名称)
			self.资源组[29]=tp.资源:载入(n[4],"网易WDF动画",n[1])
			self.资源组[29]:置方向(0)
			self.显示足印 = self.数据[self.子类][self.选中编号2].名称
			self.资源组[29].名称 = self.数据[self.子类][self.选中编号2].名称
		elseif self.数据[self.子类][self.选中编号2].总类 == 102 and self.数据[self.子类][self.选中编号2].类型 == "足迹" and self.数据[self.子类][self.选中编号2].总类 ~= "祥瑞" and (self.资源组[33] == nil or self.资源组[33].名称 ~= self.数据[self.子类][self.选中编号2].名称)then
			local n = 引擎.取足迹(self.数据[self.子类][self.选中编号2].名称)
			self.资源组[33]=tp.资源:载入(n[4],"网易WDF动画",n[1])
			self.资源组[33]:置方向(0)
			self.显示足印 = self.数据[self.子类][self.选中编号2].名称
			self.资源组[33].名称 = self.数据[self.子类][self.选中编号2].名称
	    elseif self.数据[self.子类][self.选中编号2].总类 == "祥瑞" and (self.资源组[30] == nil or self.资源组[30].名称 ~= self.数据[self.子类][self.选中编号2].名称 ) then
	        local 坐骑资源 = {}
	        if 引擎.新增坐骑(tp.队伍[1].模型,self.数据[self.子类][self.选中编号2].名称,"奔跑") ~= "" then
				坐骑资源.坐骑资源 = "xzsc.wdf"
				坐骑资源.坐骑站立 = 引擎.新增坐骑(tp.队伍[1].模型,self.数据[self.子类][self.选中编号2].名称,"站立")
			elseif 引擎.取站立坐骑(self.数据[self.子类][self.选中编号2].名称) ~= nil then
				坐骑资源.坐骑资源 = "xzsc.wdf"
				坐骑资源.坐骑站立 = 引擎.取站立坐骑(self.数据[self.子类][self.选中编号2].名称)[2]
	        else
	       	 	坐骑资源 = zqj(tp.队伍[1].模型,self.数据[self.子类][self.选中编号2].名称,self.数据[self.子类][self.选中编号2].饰品 or "空")
	       	end
	       	self.资源组[30] = tp.资源:载入(坐骑资源.坐骑资源,"网易WDF动画",坐骑资源.坐骑站立)
			self.资源组[23] = nil
			self.资源组[32] = nil
			self.坐骑显示 = self.数据[self.子类][self.选中编号2].名称
			self.资源组[30].名称 = self.坐骑显示
	    end
	end
	if self.资源组[33]~=nil then
	    self.资源组[33]:更新(dt)
	    self.资源组[33]:显示(self.x+350,self.y+265+60)
	end
	if self.资源组[51]~=nil then
	    self.资源组[51]:更新(dt)
	    self.资源组[51]:显示(self.x+350,self.y+265+60)
	end
	if self.资源组[29]~=nil then
	    self.资源组[29]:更新(dt)
	    self.资源组[29]:显示(self.x+350,self.y+265+60)
	end
	if self.资源组[30]~=nil then
	    self.资源组[30]:更新(dt)
	    self.资源组[30]:显示(self.x+350,self.y+265+60)
	end
	if self.资源组[31]~=nil then
	    self.资源组[31]:更新(dt)
	    self.资源组[31]:显示(self.x+350,self.y+265+60)
	end
	if self.资源组[23]~=nil then
		if self.资源组[32]~=nil then
		    self.资源组[32]:更新(dt)
		    self.资源组[32]:显示(self.x+350,self.y+265+60)
		end
	    self.资源组[23]:更新(dt)
	    tp.影子:显示(self.x+350,self.y+265+60)
	    self.资源组[23]:显示(self.x+350,self.y+265+60)
	end
	if self.输入框._已碰撞 then
		self.焦点 = true
	end
	self.资源组[27]:显示(self.x+690,self.y+368+45)
	self.资源组[28]:显示(self.x+690,self.y+368+80)
end

function 商城类:召唤兽类(dt,x,y,l)

	self.输入框:置可视(false,false)
	local bbsa = self.物品数据[self.分类].数量的

	if self.资源组[27]:事件判断() then
		self:初始系统(dt,x,y,0)
		if self.加入 >0 then
			self.加入 = self.加入 - 1
		end
	elseif self.资源组[28]:事件判断() then
		self:初始系统(dt,x,y,0)
		if self.加入 <self.翻页数据 then
			self.加入 = self.加入 + 1
		end

	end


	self.资源组[27]:更新(x,y,self.加入 > 0)
	self.资源组[28]:更新(x,y,self.加入 < self.翻页数据)
	self.资源组[13]:显示(self.x+245,self.y+ 95)

	self.资源组[77]:显示(self.x+245,self.y+403+90)

	self.购买:显示(self.x+708,self.y+403+95)
	self.焦点 = false
	if l~=nil and l==1 then
	银两显示(self.银两文字, self.点卡, self.x+400+50,self.y+403+100)
    else
	银两显示(self.银两文字, self.点卡, self.x+400+50,self.y+403+100)
    end
	--银两显示(self.银两文字1, self.名称,self.x+205+110+36-20,self.y+ 406+28)
	--银两显示(self.银两文字1, self.价格,self.x+205+110+36-20,self.y+ 406+30+41)
	银两显示(self.银两文字2, self.总额,self.x+300,self.y+404+100)

	--self.资源组[39]:显示(self.x+567+130+8,self.y+125+7+75)
	--self.资源组[7]:显示(self.x+518+155-63+95+12,self.y+265+15+60+40)
	if self.选中编号4 ~= 0 then
		self.资源组[24] = nil
		self.资源组[37] = nil
		local n = ani(self.数据[self.分类][self.选中编号4].模型)
		self.资源组[24] = tp.资源:载入(n[10],"网易WDF动画",n[6])
		if ani(self.数据[self.分类][self.选中编号4].模型.."_饰品") ~= nil and #ani(self.数据[self.分类][self.选中编号4].模型.."_饰品") >0 then
			n = ani(self.数据[self.分类][self.选中编号4].模型.."_饰品")
			self.资源组[37] = tp.资源:载入(n[10],"网易WDF动画",n[6])
		end
		if self.数据[self.分类][self.选中编号4].染色方案 ~= nil then
			if self.数据[self.分类][self.选中编号4].染色方案 == "黑白" then
				self.资源组[24]:置染色("黑白",ARGB(255,235,235,235))
				if self.数据[self.分类][self.选中编号4].饰品 ~= nil then
					self.资源组[37]:置染色("黑白",ARGB(255,185,185,185))
				end
			else
				self.资源组[24]:置染色(self.数据[self.分类][self.选中编号4].染色方案,self.数据[self.分类][self.选中编号4].染色组[1],self.数据[self.分类][self.选中编号4].染色组[2],self.数据[self.分类][self.选中编号4].染色组[3])
			end
		end

		if self.资源组[37]~=nil then
		    self.资源组[37]:置方向(0)
		end
		self.选中编号4=0
		self.资源组[24]:置方向(0)
	end
	if self.资源组[24]~=nil then
	    self.资源组[24]:更新(dt)

	  --  self.资源组[24]:显示(self.x+518+155+100+15,self.y+265+15+30)
		if self.资源组[37] ~= nil then
			self.资源组[37]:更新(dt)
			self.资源组[37]:显示(self.x+518+155+8+100+15,self.y+265+15+30)
		end
	end
	self.选中编号 = 0
	local x横,x竖 = 1,1
	for n = 1, 12 do
		if self.物品数据[self.分类][n+self.加入*12]~=nil then
			if self.物品数据[self.分类][n+self.加入*12]:是否选中(x,y) then
				self.选中编号 = n+self.加入*12
				tp.提示:自定义(x-42,y+27,self.数据[self.分类][n+self.加入*12].名称)
				if 引擎.鼠标弹起(左键) then
				    self.选中编号2=n
				    self.选中编号3 = n+self.加入*12
				    self.选中编号4 = n+self.加入*12
				end
			end

			tp.影子:显示(self.x+180+x横*133,self.y+70+x竖*130)
			self.物品数据[self.分类][n+self.加入*12]:更新(dt)
			self.物品数据[self.分类][n+self.加入*12]:显示(self.x+180+x横*133, self.y+70+x竖*130)
			self.资源组[76]:显示(self.x+121+x横*131.5, self.y+71+x竖*133)

			if self.选中编号 ~= 0 and self.选中编号 == n+self.加入*12 then
	        	--self.选中显示:显示(self.x+116+x横*135, self.y-35+x竖*130)
			end

			if self.选中编号2 ~= 0 and self.选中编号2 == n then
				if self.选中编号3 ~= 0 and self.资源组[7]:事件判断() or (引擎.鼠标弹起(右键) and self.物品数据[self.分类][n+self.加入*12]:是否选中(x,y)) then
					tp.窗口.对话栏:文本("普陀_接引仙女","神兽乐园","请选择您要查看的神兽类型",{"法系神兽","物理神兽"})
				end
				zts2:置颜色(红色)
				zts2:显示(self.x+120+x横*132, self.y+73+x竖*133,"右键查看属性")
				--self.选中显示2:显示(self.x+116+x横*135, self.y-35+x竖*130)
			else
				zts2:置颜色(白色)
				zts2:显示(self.x+120+x横*132, self.y+73+x竖*133,self.数据[self.分类][n+self.加入*12].名称)
			end
		end
		if x横 == 4  then
			x横 = 1
			x竖=x竖+1
		else
			x横 = x横+1
		end
	end
	if self.选中编号 ~= 0 then

		if 引擎.鼠标弹起(左键) and self.选中编号3~=0 then
			self.价格 = self.物品数据[self.分类][self.选中编号3].价格
			if self.商品编号 == self.选中编号 then
				self.数量 = 1--self.数量 + 1
				self.总额 = self.数量 * self.价格
				self.输入框:置文本(self.数量)
				return 0
			else
				self.数量 = 1
				self.总额 = self.数量 * self.价格
				self.输入框:置文本(self.数量)
			end
			self.商品编号 = self.选中编号
		elseif 引擎.鼠标弹起(右键) and self.商品编号 == self.选中编号 and self.数量 > 1 then
			self.数量 = self.数量 - 1
			self.总额 = self.数量 * self.价格
			self.输入框:置文本(self.数量)
		end
	end
		self.资源组[27]:显示(self.x+548,self.y+403+95)
	self.资源组[28]:显示(self.x+628,self.y+403+95)


end

function 商城类:初始移动(x,y)
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

function 商城类:开始移动(x,y)
	if self.可视 and self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 商城类
