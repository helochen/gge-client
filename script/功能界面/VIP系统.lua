--======================================================================--

--======================================================================--
local 系统类_VIP系统 = class()
local floor = math.floor
local tp,zts,zt
local format = string.format
local insert = table.insert

function 系统类_VIP系统:初始化(根)
	self.x = 70
	self.y = 140
	self.xx = 0
	self.yy = 0
	self.注释 = "VIP系统"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	tp = 根
	self.窗口时间 = 0
	zts = tp.字体表.道具字体
	zt = tp.字体表.描边字体
	self.进程=1

	self.控件类 = require("ggeui/加载类")()
	local 总控件 = self.控件类:创建控件('序号控件')
	总控件:置可视(true,true)
	self.输入框 = 总控件:创建输入("卡号输入",0,0,180,14)
	self.输入框:置可视(false,false)
	self.输入框:置限制字数(30)
	self.输入框:置光标颜色(-16777216)
	self.输入框:置文字颜色(-16777216)

	self.数量框 = 总控件:创建输入("数量输入",0,0,180,14)
	self.数量框:置可视(false,false)
	self.数量框:置限制字数(10)
	self.数量框:置数字模式()
	self.数量框:置光标颜色(-16777216)
	self.数量框:置文字颜色(-16777216)

end

function 系统类_VIP系统:打开(数据)
	if self.可视 then
		self.可视 = false
		self.资源组=nil
		return
	else
		insert(tp.窗口_,self)
		local 资源 = tp.资源
		local 按钮 = tp._按钮
		local 自适应 = tp._自适应
		self.资源组 = {
			[1] = 资源:载入('wzife.wd5',"网易WDF动画",0x01000081),
			[2] = 按钮.创建(tp.资源:载入('wzife.wd5',"网易WDF动画",0x01000025),0,0,4,true,true),
			[3] = 按钮.创建(tp.资源:载入('wzife.wd4',"网易WDF动画",0xCFC32179),0,0,4,true,true,"  累 冲 奖 励"),
			[4] = 按钮.创建(tp.资源:载入('wzife.wd4',"网易WDF动画",0xCFC32179),0,0,4,true,true,"   充值排行榜"),
			[5] = 按钮.创建(tp.资源:载入('wzife.wd4',"网易WDF动画",0xCFC32179),0,0,4,true,true,"  周 卡 月 卡"),
			[6] = 按钮.创建(tp.资源:载入('wzife.wd4',"网易WDF动画",0xCFC32179),0,0,4,true,true,"  立 即 充 值"),
			[7] = 资源:载入('wzife.wdf',"网易WDF动画",0x2DA9D4EC),
			[8] = 资源:载入('wzife.wdf',"网易WDF动画",0x479E857C),
			[9] = 按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0x4BB58ED4),0,0,4,true,true,"  刷新经验"),
			[40] = 资源:载入('wzife.wdf',"网易WDF动画",0xF391CDE0),
		}
		for i=10,14 do
			self.资源组[i] = 按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0x48D2590A),0,0,4,true,true,"领取奖励")
		end
		for i=15,39 do
			self.资源组[i] = 资源:载入('wzife.wdf',"网易WDF动画",0x8E881BAB)
		end
		for i=41,45 do--装备礼包
			self.资源组[i] = 资源:载入('item.wd1',"网易WDF动画",0x2B44FFFB)
		end
		for i=46,50 do--仙玉
			self.资源组[i] = 资源:载入('item.wd1',"网易WDF动画",0xDF80EAB7)
		end
		for i=51,55 do--饰品
			self.资源组[i] = 资源:载入('item.wd1',"网易WDF动画",0x11DF58C)
		end
		for i=56,60 do--金丹
			self.资源组[i] = 资源:载入('item.wdf',"网易WDF动画",0x5A0E9307)
		end
		for i=61,61 do--宝石
			self.资源组[i] = 资源:载入('item.wdf',"网易WDF动画",0x9724BCB0)
		end
		for i=62,64 do--宠物蛋
			self.资源组[i] = 资源:载入('common/item.wdf',"网易WDF动画",0x5631E4CF)
		end
		self.资源组[65] = 按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0x48D2590A),0,0,4,true,true,"确定充值")
		self.资源组[66] = 按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0x48D2590A),0,0,4,true,true,"兑换仙玉")
		self.数据=数据
		tp.运行时间 = tp.运行时间 + 1
	    self.窗口时间 = tp.运行时间
	    self.可视 = true
	    self.进程=1
	end
end

function 系统类_VIP系统:刷新(数据)
	self.数据.点卡 = 数据.点卡
end

function 系统类_VIP系统:显示(dt,x,y)
	self.焦点 = false
	self.资源组[2]:更新(x,y)
	self.资源组[3]:更新(x,y)
	self.资源组[4]:更新(x,y)
	self.资源组[5]:更新(x,y)
	self.资源组[6]:更新(x,y)
	self.资源组[9]:更新(x,y)
	self.资源组[1]:显示(self.x,self.y)
	self.资源组[2]:显示(self.x + 650,self.y)
	self.资源组[3]:显示(self.x + 55,self.y + 60)
	self.资源组[4]:显示(self.x + 55,self.y + 100)
	self.资源组[5]:显示(self.x + 55,self.y + 140)
	self.资源组[6]:显示(self.x + 55,self.y + 180)
	self.资源组[40]:显示(self.x +30,self.y-123)
	if self.资源组[2]:事件判断() then
		self:打开()
		return false
	elseif self.资源组[3]:事件判断() then
		self.输入框:置可视(false,false)
		self.输入框:置文本("")
		self.数量框:置可视(false,false)
		self.数量框:置文本("输入兑换的仙玉数额")
		self.进程=1
	elseif self.资源组[6]:事件判断() then
		self.输入框:置可视(true,true)
		self.数量框:置可视(true,true)
		self.数量框:置文本("输入兑换的仙玉数额")
		self.进程=2
	elseif self.资源组[10]:事件判断() then
		发送数据(46,{序列="VIP1"})
	elseif self.资源组[11]:事件判断() then
		发送数据(46,{序列="VIP2"})
	elseif self.资源组[12]:事件判断() then
		发送数据(46,{序列="VIP3"})
	elseif self.资源组[13]:事件判断() then
		发送数据(46,{序列="VIP4"})
	elseif self.资源组[14]:事件判断() then
		发送数据(46,{序列="VIP5"})
	end
	if self.进程 == 1 then
		self.资源组[10]:更新(x,y,self.数据.VIP数据.VIP1状态==false and self.数据.VIP数据.VIP经验>= 188*self.数据.充值比例)
		self.资源组[11]:更新(x,y,self.数据.VIP数据.VIP2状态==false and self.数据.VIP数据.VIP经验>= 388*self.数据.充值比例)
		self.资源组[12]:更新(x,y,self.数据.VIP数据.VIP3状态==false and self.数据.VIP数据.VIP经验>= 888*self.数据.充值比例)
		self.资源组[13]:更新(x,y,self.数据.VIP数据.VIP4状态==false and self.数据.VIP数据.VIP经验>= 2888*self.数据.充值比例)
		self.资源组[14]:更新(x,y,self.数据.VIP数据.VIP5状态==false and self.数据.VIP数据.VIP经验>= 4888*self.数据.充值比例)

		self.资源组[7]:显示(self.x + 205,self.y + 60)
		self.资源组[8]:显示(self.x+305,self.y+65)
		self.资源组[9]:显示(self.x + 545,self.y +62)
		zts:显示(self.x+210,self.y+60,"VIP")
		zt:显示(self.x+400,self.y+65,self.数据.VIP数据.VIP经验)
		if self.数据.VIP数据.VIP经验 >= 0*self.数据.充值比例 and self.数据.VIP数据.VIP经验 < 188*self.数据.充值比例 then
	        zts:显示(self.x+255,self.y+60,"0")
	    elseif self.数据.VIP数据.VIP经验 >= 188*self.数据.充值比例 and self.数据.VIP数据.VIP经验 < 388*self.数据.充值比例 then
	       	zts:显示(self.x+255,self.y+60,"1")
	    elseif self.数据.VIP数据.VIP经验 >= 388*self.数据.充值比例 and self.数据.VIP数据.VIP经验 < 888*self.数据.充值比例 then
	        zts:显示(self.x+255,self.y+60,"2")
	    elseif self.数据.VIP数据.VIP经验 >= 888*self.数据.充值比例 and self.数据.VIP数据.VIP经验 < 2888*self.数据.充值比例 then
	        zts:显示(self.x+255,self.y+60,"3")
	    elseif self.数据.VIP数据.VIP经验 >= 2888*self.数据.充值比例 and self.数据.VIP数据.VIP经验 < 4888*self.数据.充值比例 then
	        zts:显示(self.x+255,self.y+60,"4")
	    elseif self.数据.VIP数据.VIP经验 >= 4888*self.数据.充值比例 then
	        zts:显示(self.x+255,self.y+60,"5")
	    end
		self.xxx=0
		self.yyy=0
		for i=1,25 do
			if self.xxx>=5 then
			    self.yyy=self.yyy+1
			    self.xxx=0
			end
			self.资源组[14+i]:显示(self.x+270+self.xxx*57,self.y+100+self.yyy*57)
			self.xxx=self.xxx+1
		end
		for i=1,5 do
			zts:显示(self.x+210,self.y+i*57+60,"VIP"..i)
			self.资源组[9+i]:显示(self.x+565,self.y+i*57+63)
			self.资源组[40+i]:显示(self.x+276,self.y+i*57+63-10)
			self.资源组[45+i]:显示(self.x+276+57,self.y+i*57+63-15)
			self.资源组[50+i]:显示(self.x+276+57+57,self.y+i*57+63-13)
			self.资源组[55+i]:显示(self.x+276+57+57+57,self.y+i*57+63-13)
		end
		self.资源组[61]:显示(self.x+276+57+57+57+57,self.y+57+120-13)
		for i=1,3 do
			self.资源组[61+i]:显示(self.x+276+57+57+57+57,self.y+(i+1)*57+120-13)
		end

		if self.资源组[10]:是否选中(x,y) then
			tp.提示:自定义(x-42,y+27,"VIP1礼包：可领取一套120级无级别装备、一套60级灵饰、九转金丹9个、仙玉1W、1000W银子、称谓：西游小萌新(气血+300)")
		elseif self.资源组[11]:是否选中(x,y) then
			tp.提示:自定义(x-42,y+27,"VIP2礼包：可领取一套130级无级别装备、一套80级灵饰、九转金丹30个、随机祥瑞一只、仙玉3W、2000W银子、5级宝石礼包、称谓：笑看西游(气血+500)")
		elseif self.资源组[12]:是否选中(x,y) then
			tp.提示:自定义(x-42,y+27,"VIP3礼包：可领取一套140级无级别装备、一套100级灵饰、九转金丹88个、8技能毗舍童子一只、仙玉5W、3000W银子、7级宝石礼包、称谓：西游任我行(气血+800)")
		elseif self.资源组[13]:是否选中(x,y) then
			tp.提示:自定义(x-42,y+27,"VIP4礼包：可领取一套150级无级别装备、一套120级灵饰、九转金丹128个、12技能般若天女一只、仙玉10W、5000W银子、10级宝石礼包、称谓：梦幻任逍遥(气血+1000)")
		elseif self.资源组[14]:是否选中(x,y) then
			tp.提示:自定义(x-42,y+27,"VIP5礼包：可领取一套160级无级别装备、一套140级灵饰、九转金丹288个、定制24技能召唤兽俩只、仙玉50W、一亿银子、称谓：天人开造化(气血+2000)")
		elseif self.资源组[41]:是否选中(x,y) then
			tp.提示:自定义(x-42,y+27,"可获得一套无级别120级装备礼包")
		elseif self.资源组[42]:是否选中(x,y) then
			tp.提示:自定义(x-42,y+27,"可获得一套无级别130级装备礼包")
		elseif self.资源组[43]:是否选中(x,y) then
			tp.提示:自定义(x-42,y+27,"可获得一套无级别40级装备礼包")
		elseif self.资源组[44]:是否选中(x,y) then
			tp.提示:自定义(x-42,y+27,"可获得一套无级别150级装备礼包")
		elseif self.资源组[45]:是否选中(x,y) then
			tp.提示:自定义(x-42,y+27,"可获得一套无级别160级装备礼包")
		elseif self.资源组[46]:是否选中(x,y) then
			tp.提示:自定义(x-42,y+27,"可获得1W仙玉")
		elseif self.资源组[47]:是否选中(x,y) then
			tp.提示:自定义(x-42,y+27,"可获得3W仙玉")
		elseif self.资源组[48]:是否选中(x,y) then
			tp.提示:自定义(x-42,y+27,"可获得5W仙玉")
		elseif self.资源组[49]:是否选中(x,y) then
			tp.提示:自定义(x-42,y+27,"可获得10W仙玉")
		elseif self.资源组[50]:是否选中(x,y) then
			tp.提示:自定义(x-42,y+27,"可获得50W仙玉")
		elseif self.资源组[51]:是否选中(x,y) then
			tp.提示:自定义(x-42,y+27,"可获得一套无级别60级灵饰一套")
		elseif self.资源组[52]:是否选中(x,y) then
			tp.提示:自定义(x-42,y+27,"可获得一套无级别80级灵饰一套")
		elseif self.资源组[53]:是否选中(x,y) then
			tp.提示:自定义(x-42,y+27,"可获得一套无级别100级灵饰一套")
		elseif self.资源组[54]:是否选中(x,y) then
			tp.提示:自定义(x-42,y+27,"可获得一套无级别120级灵饰一套")
		elseif self.资源组[55]:是否选中(x,y) then
			tp.提示:自定义(x-42,y+27,"可获得一套无级别140级灵饰一套")
		elseif self.资源组[56]:是否选中(x,y) then
			tp.提示:自定义(x-42,y+27,"可获得9个500品质九转金丹")
		elseif self.资源组[57]:是否选中(x,y) then
			tp.提示:自定义(x-42,y+27,"可获得30个500品质九转金丹")
		elseif self.资源组[58]:是否选中(x,y) then
			tp.提示:自定义(x-42,y+27,"可获得88个500品质九转金丹")
		elseif self.资源组[59]:是否选中(x,y) then
			tp.提示:自定义(x-42,y+27,"可获得128个500品质九转金丹")
		elseif self.资源组[60]:是否选中(x,y) then
			tp.提示:自定义(x-42,y+27,"可获得288个500品质九转金丹")
		elseif self.资源组[61]:是否选中(x,y) then
			tp.提示:自定义(x-42,y+27,"可获得5级宝石礼包(包含5级光芒石、太阳石、红玛瑙、月亮石、黑宝石、舍利子)")
		elseif self.资源组[62]:是否选中(x,y) then
			tp.提示:自定义(x-42,y+27,"可获得8技能毗舍童子一只)")
		elseif self.资源组[63]:是否选中(x,y) then
			tp.提示:自定义(x-42,y+27,"可获得12技能般若天女一只")
		elseif self.资源组[64]:是否选中(x,y) then
			tp.提示:自定义(x-42,y+27,"可联系GM定制俩只24技能召唤兽")
		end
	elseif self.进程 == 2 then
		self.资源组[65]:更新(x,y)
		self.资源组[66]:更新(x,y)
		self.资源组[65]:显示(self.x + 545,self.y +63)
		self.资源组[66]:显示(self.x + 545,self.y +103)
		self.资源组[8]:显示(self.x+315,self.y+105)
		self.资源组[8]:显示(self.x+315,self.y+65)

		self.控件类:更新(dt,x,y)
		self.控件类:显示(x,y)
		self.输入框:置坐标(self.x+317,self.y+66)
		self.数量框:置坐标(self.x+317,self.y+106)


		zts:显示(self.x+210,self.y+60,"输入卡号")
		zts:显示(self.x+210,self.y+100,"兑换仙玉")
		zt:显示(self.x+220,self.y+130,"当前点卡兑换仙玉比例:  1:"..self.数据.兑换比例.."  当前剩余点卡:"..self.数据.点卡)

		if self.资源组[65]:事件判断() then
			if self.输入框:取文本() == "" then
				tp.提示:写入("#Y/请输入正确的卡号")
				return
			end
			发送数据(100,{卡号=self.输入框:取文本()})
		elseif self.资源组[66]:事件判断() then
			if self.数量框:取文本() == "" or tonumber(self.数量框:取文本()) == nil then
				tp.提示:写入("#Y/请输入正确兑换数量")
				return
			elseif tonumber(self.数量框:取文本()) < self.数据.兑换比例 then
				tp.提示:写入("#Y/你个穷鬼兑换的仙玉数量太少了")
				return
			elseif tonumber(self.数量框:取文本())/self.数据.兑换比例 > self.数据.点卡+0 then
				tp.提示:写入("#Y/你当前没有这么多的点卡可以兑换")
				return
			end
			发送数据(100.1,{数额=tonumber(self.数量框:取文本())})
		end
	end
end

function 系统类_VIP系统:检查点(x,y)
	if self.资源组 ~= nil and self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 系统类_VIP系统:初始移动(x,y)
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

function 系统类_VIP系统:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 系统类_VIP系统