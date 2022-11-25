local 内充抽奖 = class()
local floor = math.floor
local min = math.min
local tp,zts1,zts2
local xxx = 0
local yyy = 0
local max = 1
local insert = table.insert
local mouseb = 引擎.鼠标弹起
local ARGB = ARGB
local wz = require("gge文字类")

function 内充抽奖:初始化(根)
	self.ID = 41
	self.x = 55
	self.y = 10
	self.xx = 0
	self.yy = 0
	self.注释 = "内充抽奖"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	self.状态 = 1
	self.窗口时间 = 0
	tp = 根
	self.分类选中=""
	self.子类选中=""
	self.玩法介绍内容=""
end
function 内充抽奖:打开(内容)
	if self.可视 then
		self.可视 = false
		self.资源组 = nil
		self.数据=nil
		self.图片=nil
		return
	else
		insert(tp.窗口_,self)
		local 资源 = tp.资源
		local 自适应 = tp._自适应
		local 按钮 = tp._按钮
		self.资源组 = {
		    [0] = 自适应.创建(1,1,332,18,1,3,nil,18),
			[1] = 资源:载入('幕神2.rpk',"网易WDF动画",0X00000332),
			[2] = 按钮.创建(资源:载入('幕神2.rpk',"网易WDF动画",0X00000333),0,0,2,true,true),  --[48] =  按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"提升百次"),
			[3] = 按钮.创建(资源:载入('xzsc.wdf',"网易WDF动画",0X0D4432F9),0,0,4,true,true),
			[4] = 按钮.创建(资源:载入('xzsc.wdf',"网易WDF动画",0X0D4432F9),0,0,4,true,true),
			[5] = 按钮.创建(资源:载入('xzsc.wdf',"网易WDF动画",0X0D4432F9),0,0,4,true,true),
			[6] = 按钮.创建(资源:载入('xzsc.wdf',"网易WDF动画",0X0D4432F9),0,0,4,true,true),
			[7] = 自适应.创建(0,1,200,150,3,9),
			[8] = 按钮.创建(自适应.创建(12,4,92,22,1,3),0,0,4,true,true),
			[9] = 按钮.创建(自适应.创建(12,4,92,22,1,3),0,0,4,true,true),
        }
		self.抽奖物品=内容.内充抽奖
		self.抽奖点卡=内容.抽奖点卡
        self.图片={}
	     for n,v in pairs(self.抽奖物品) do
	     	local 临时资源=引擎.取物品(self.抽奖物品[n])
	     	self.图片[n] = 资源:载入(临时资源[11],"网易WDF动画",临时资源[12])
	    end
	    tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间
        self.可移动 = true
		self.可视 = true
		self.介绍 = 0
	end
end
function 内充抽奖:刷新(内容)
    self.抽奖物品=内容.内充抽奖
	self.抽奖点卡=内容.抽奖点卡
end
function 内充抽奖:显示(dt,x,y)
	self.资源组[2]:更新(x,y)
	self.资源组[3]:更新(x,y)
	self.资源组[4]:更新(x,y)
	self.资源组[5]:更新(x,y)
	self.资源组[6]:更新(x,y)
	self.资源组[9]:更新(x,y)
	self.资源组[1]:显示(self.x,self.y)
	self.资源组[2]:显示(self.x+314,self.y+450)
    --self.资源组[3]:显示(self.x+0,self.y+0)
    --self.资源组[4]:显示(self.x+225,self.y+35)
   -- self.资源组[5]:显示(self.x+415,self.y+35)
    --self.资源组[6]:显示(self.x+610,self.y+35)
    --self.资源组[9]:显示(self.x+721,self.y-1)
	local 物品个数 = 0
    for n,v in pairs(self.抽奖物品) do
    	if v~=nil then
    		if n <= 0 then n = 1 end
			if n>= 1 and n<=12 then
				补差高度=0
				i=n
				self.图片[n]:显示(self.x+27+i*50,self.y+94+补差高度)
				if self.图片[n]:是否选中(x,y) then
                    if self.抽奖物品[n]=="太阳石" then
					    tp.提示:自定义(self.x+27+i*50,self.y+94+补差高度,"随机抽取11-20级的太阳石1颗")
					elseif self.抽奖物品[n]=="红玛瑙" then
						tp.提示:自定义(self.x+27+i*50,self.y+94+补差高度,"随机抽取11-20级的红玛瑙1颗")
					elseif self.抽奖物品[n]=="月亮石" then
						tp.提示:自定义(self.x+27+i*50,self.y+94+补差高度,"随机抽取11-20级的月亮石1颗")
					elseif self.抽奖物品[n]=="黑宝石" then
						tp.提示:自定义(self.x+27+i*50,self.y+94+补差高度,"随机抽取11-20级的黑宝石1颗")
					elseif self.抽奖物品[n]=="光芒石" then
						tp.提示:自定义(self.x+27+i*50,self.y+94+补差高度,"随机抽取11-20级的光芒石1颗")
					end
				end
			elseif n>=13 and n<=26 then
				补差高度=62
				i=n-12
				self.图片[n]:显示(self.x-23+i*50,self.y+94+补差高度)
				if self.图片[n]:是否选中(x,y) then
                    if self.抽奖物品[n]=="光芒石" then
					    tp.提示:自定义(self.x-23+i*50,self.y+94+补差高度,"随机抽取11-20级的光芒石1颗")
					elseif self.抽奖物品[n]=="舍利子" then
						tp.提示:自定义(self.x-23+i*50,self.y+94+补差高度,"随机抽取11-20级的舍利子1颗")
					elseif self.抽奖物品[n]=="神秘石" then
						tp.提示:自定义(self.x-23+i*50,self.y+94+补差高度,"随机抽取11-20级的神秘石1颗")
					elseif self.抽奖物品[n]=="星辉石" then
						tp.提示:自定义(self.x-23+i*50,self.y+94+补差高度,"随机抽取11-20级的星辉石1颗")
					end
				end
			elseif n>=27 and n<=40 then
				补差高度=124
				i=n-26
				self.图片[n]:显示(self.x-23+i*50,self.y+94+补差高度)
				if self.图片[n]:是否选中(x,y) then
                    if self.抽奖物品[n]=="避水珠" then
					    tp.提示:自定义(self.x-23+i*50,self.y+94+补差高度,"抽取五宝-避水珠1个")
					elseif self.抽奖物品[n]=="定魂珠" then
						tp.提示:自定义(self.x-23+i*50,self.y+94+补差高度,"抽取五宝-定魂珠1个")
					elseif self.抽奖物品[n]=="龙鳞" then
						tp.提示:自定义(self.x-23+i*50,self.y+94+补差高度,"抽取五宝-龙鳞1个")
					elseif self.抽奖物品[n]=="金刚石" then
						tp.提示:自定义(self.x-23+i*50,self.y+94+补差高度,"抽取五宝-金刚石1个")
					end
				end
			elseif n>=41 and n<=54 then
				补差高度=184
				i=n-40
				self.图片[n]:显示(self.x-23+i*50,self.y+94+补差高度)
				if self.图片[n]:是否选中(x,y) then
                    if self.抽奖物品[n]=="夜光珠" then
					    tp.提示:自定义(self.x-23+i*50,self.y+94+补差高度,"抽取五宝-夜光珠1个")
					elseif self.抽奖物品[n]=="小额银票" then
						tp.提示:自定义(self.x-23+i*50,self.y+94+补差高度,"抽取小额银票1个,内含1亿银币")
					elseif self.抽奖物品[n]=="大额银票" then
						tp.提示:自定义(self.x-23+i*50,self.y+94+补差高度,"抽取小额银票1个,内含10亿银币")
					elseif self.抽奖物品[n]=="金刚石" then
						tp.提示:自定义(self.x-23+i*50,self.y+94+补差高度,"抽取五宝-金刚石1个")
					end
				end
			elseif n>=55 and n<=68 then
				补差高度=244
				i=n-54
				self.图片[n]:显示(self.x-23+i*50,self.y+94+补差高度)
				if self.图片[n]:是否选中(x,y) then
                    if self.抽奖物品[n]=="双倍经验丹" then
					    tp.提示:自定义(self.x-23+i*50,self.y+94+补差高度,"抽取双倍经验丹1个，提供双倍经验")
					elseif self.抽奖物品[n]=="储灵袋" then
						tp.提示:自定义(self.x-23+i*50,self.y+94+补差高度,"抽取储灵袋1个,所有法宝增加1000灵气")
					elseif self.抽奖物品[n]=="洗骨符" then
						tp.提示:自定义(self.x-23+i*50,self.y+94+补差高度,"抽取洗骨符1个,洗练魂骨专用物品")
					elseif self.抽奖物品[n]=="洗魂符" then
						tp.提示:自定义(self.x-23+i*50,self.y+94+补差高度,"抽取洗魂符,洗练魂环专用物品")
					end
				end
			elseif n>=69 and n<=82 then
				补差高度=305
				i=n-68
				self.图片[n]:显示(self.x-23+i*50,self.y+94+补差高度)
				if self.图片[n]:是否选中(x,y) then
                    if self.抽奖物品[n]=="金柳露" then
					    tp.提示:自定义(self.x-23+i*50,self.y+94+补差高度,"抽取金柳露1个，洗宠物专用物品")
					elseif self.抽奖物品[n]=="超级金柳露" then
						tp.提示:自定义(self.x-23+i*50,self.y+94+补差高度,"抽取超级金柳露1个,洗宠物专用物品")
					elseif self.抽奖物品[n]=="附魔宝珠-动物套" then
						tp.提示:自定义(self.x-23+i*50,self.y+94+补差高度,"抽取附魔宝珠-动物套1个,必定获得满属性！！")
					elseif self.抽奖物品[n]=="洗魂符" then
						tp.提示:自定义(self.x-23+i*50,self.y+94+补差高度,"抽取洗魂符,洗练魂环专用物品")
					elseif self.抽奖物品[n]=="洗骨符" then
						tp.提示:自定义(self.x-23+i*50,self.y+94+补差高度,"抽取洗骨符1个,洗练魂骨专用物品")
				    end
				end
			elseif n>=83 and n<=87 then
				补差高度=364
				i=n-82
				self.图片[n]:显示(self.x+17+i*50,self.y+94+补差高度)
				if self.图片[n]:是否选中(x,y) then
                    if self.抽奖物品[n]=="金柳露" then
					    tp.提示:自定义(self.x+17+i*50,self.y+94+补差高度,"抽取金柳露1个，洗宠物专用物品")
					elseif self.抽奖物品[n]=="超级金柳露" then
						tp.提示:自定义(self.x+17+i*50,self.y+94+补差高度,"抽取超级金柳露1个,洗宠物专用物品")
					elseif self.抽奖物品[n]=="附魔宝珠-动物套" then
						tp.提示:自定义(self.x+17+i*50,self.y+94+补差高度,"抽取附魔宝珠-动物套1个,必定获得满属性！！")
					elseif self.抽奖物品[n]=="洗魂符" then
						tp.提示:自定义(self.x+17+i*50,self.y+94+补差高度,"抽取洗魂符,洗练魂环专用物品")
					elseif self.抽奖物品[n]=="洗骨符" then
						tp.提示:自定义(self.x+17+i*50,self.y+94+补差高度,"抽取洗骨符1个,洗练魂骨专用物品")
					end
				end
			elseif n>=88 and n<=92 then
				补差高度=364
				i=n-87
				self.图片[n]:显示(self.x+387+i*50,self.y+94+补差高度)
				if self.图片[n]:是否选中(x,y) then
					if self.抽奖物品[n]=="高级藏宝图" then
					    tp.提示:自定义(self.x+387+i*50,self.y+94+补差高度,"抽取高级藏宝图1个，挖高级藏宝图可以获得大量好物品！！")
					elseif self.抽奖物品[n]=="储灵袋" then
						tp.提示:自定义(self.x+387+i*50,self.y+94+补差高度,"抽取储灵袋1个,所有法宝增加1000灵气")
					elseif self.抽奖物品[n]=="洗骨符" then
						tp.提示:自定义(self.x+387+i*50,self.y+94+补差高度,"抽取洗骨符1个,洗练魂骨专用物品")
					elseif self.抽奖物品[n]=="洗魂符" then
						tp.提示:自定义(self.x+387+i*50,self.y+94+补差高度,"抽取洗魂符,洗练魂环专用物品")
                    elseif self.抽奖物品[n]=="金柳露" then
					    tp.提示:自定义(self.x+387+i*50,self.y+94+补差高度,"抽取金柳露1个，洗宠物专用物品")
					elseif self.抽奖物品[n]=="超级金柳露" then
						tp.提示:自定义(self.x+387+i*50,self.y+94+补差高度,"抽取超级金柳露1个,洗宠物专用物品")
					elseif self.抽奖物品[n]=="附魔宝珠-动物套" then
						tp.提示:自定义(self.x+387+i*50,self.y+94+补差高度,"抽取附魔宝珠-动物套1个,必定获得满属性！！")
					elseif self.抽奖物品[n]=="洗魂符" then
						tp.提示:自定义(self.x+387+i*50,self.y+94+补差高度,"抽取洗魂符,洗练魂环专用物品")
					end
				end
			elseif n>=93 and n<=97 then
				补差高度=423
				i=n-92
				self.图片[n]:显示(self.x+17+i*50,self.y+94+补差高度)
				if self.图片[n]:是否选中(x,y) then
                    if self.抽奖物品[n]=="万年·魂环" then
					    tp.提示:自定义(self.x+17+i*50,self.y+94+补差高度,"抽取万年·魂环，4条属性！！")
					elseif self.抽奖物品[n]=="十万年·魂环" then
						tp.提示:自定义(self.x+17+i*50,self.y+94+补差高度,"抽取十万年·魂环，5条属性！！")
					elseif self.抽奖物品[n]=="百万年·魂环" then
						tp.提示:自定义(self.x+17+i*50,self.y+94+补差高度,"抽取百万年·魂环，6条属性！！")
					elseif self.抽奖物品[n]=="神级·魂环" then
						tp.提示:自定义(self.x+17+i*50,self.y+94+补差高度,"抽取神级·魂环，毕业装备，7条属性！！")
					elseif self.抽奖物品[n]=="神级·魂骨" then
						tp.提示:自定义(self.x+17+i*50,self.y+94+补差高度,"抽取神级·魂骨，毕业装备，7条属性！！")
					elseif self.抽奖物品[n]=="百万年·魂骨" then
						tp.提示:自定义(self.x+17+i*50,self.y+94+补差高度,"抽取百万·魂骨，6条属性！！")
					elseif self.抽奖物品[n]=="十万年·魂骨" then
						tp.提示:自定义(self.x+17+i*50,self.y+94+补差高度,"抽取十万年·魂骨，5条属性！！")
					elseif self.抽奖物品[n]=="万年·魂骨" then
						tp.提示:自定义(self.x+17+i*50,self.y+94+补差高度,"抽取万年·魂骨，4条属性！！")
					elseif self.抽奖物品[n]=="160级四加低级装备礼包" then
						tp.提示:自定义(self.x+17+i*50,self.y+94+补差高度,"抽取随机1-8阶武器，超级牛逼！！")
					elseif self.抽奖物品[n]=="160级四加高级装备礼包" then
						tp.提示:自定义(self.x+17+i*50,self.y+94+补差高度,"抽取随机1-8阶装备，超级牛逼！！")
					end
				end
			elseif n>=98 and n<=102 then
				补差高度=423
				i=n-97
				self.图片[n]:显示(self.x+387+i*50,self.y+94+补差高度)
				if self.图片[n]:是否选中(x,y) then
                    if self.抽奖物品[n]=="万年·魂环" then
					    tp.提示:自定义(self.x+387+i*50,self.y+94+补差高度,"抽取万年·魂环，4条属性！！")
					elseif self.抽奖物品[n]=="十万年·魂环" then
						tp.提示:自定义(self.x+387+i*50,self.y+94+补差高度,"抽取十万年·魂环，5条属性！！")
					elseif self.抽奖物品[n]=="百万年·魂环" then
						tp.提示:自定义(self.x+387+i*50,self.y+94+补差高度,"抽取百万年·魂环，6条属性！！")
					elseif self.抽奖物品[n]=="神级·魂环" then
						tp.提示:自定义(self.x+387+i*50,self.y+94+补差高度,"抽取神级·魂环，毕业装备，7条属性！！")
					elseif self.抽奖物品[n]=="神级·魂骨" then
						tp.提示:自定义(self.x+387+i*50,self.y+94+补差高度,"抽取神级·魂骨，毕业装备，7条属性！！")
					elseif self.抽奖物品[n]=="百万年·魂骨" then
						tp.提示:自定义(self.x+387+i*50,self.y+94+补差高度,"抽取百万年·魂骨，6条属性！！")
					elseif self.抽奖物品[n]=="十万年·魂骨" then
						tp.提示:自定义(self.x+387+i*50,self.y+94+补差高度,"抽取十万年·魂骨，5条属性！！")
					elseif self.抽奖物品[n]=="万年·魂骨" then
						tp.提示:自定义(self.x+387+i*50,self.y+94+补差高度,"抽取万年·魂骨，4条属性！！")
					elseif self.抽奖物品[n]=="160级四加低级装备礼包" then
						tp.提示:自定义(self.x+387+i*50,self.y+94+补差高度,"抽取随机1-8阶武器，超级牛逼！！")
					elseif self.抽奖物品[n]=="160级四加高级装备礼包" then
						tp.提示:自定义(self.x+387+i*50,self.y+94+补差高度,"抽取随机1-8阶装备，超级牛逼！！")
					end
				end
			end
		end
		物品个数=物品个数+1
	end
	local 字体1 = tp.字体表.道具字体
   	字体1:置颜色(0xFF00FF00)
	--字体1:显示(self.x+35,self.y+47,"抽奖介绍")
	字体1:显示(self.x+237,self.y+40,"奖池剩余")
	字体1:显示(self.x+265,self.y+60,tostring(物品个数))
	--字体1:显示(self.x+427,self.y+47," 充 值 ")
	--字体1:显示(self.x+620,self.y+47,"领取充值")
	抽奖字体 = require("gge文字类").创建(nil,20,false,false,true)
	抽奖字体:置颜色(0xFF00FF00)
	抽奖字体:显示(self.x+320,self.y+3,"抽 奖 系 统")
	if self.资源组[2]:事件判断() then
	 	发送数据(3767)
    end
	if self.资源组[3]:事件判断() then
	 	self.介绍=1
	end
--	if self.资源组[5]:事件判断() then
--	    if 服务器名称数据 == "扶摇西游" then
--			引擎.运行("http://pay.8gesy.com/payment/fenqu.html?id=DB8A317E30AA57C9")
--        elseif 服务器名称数据 == "征梦西游" then
--			引擎.运行("http://www.8gesy.com/payment/fenqu.html?id=A0BEA5587FEC4170BA27BFFE21685D80")
--	    elseif 服务器名称数据 == "本地测试" then
--			引擎.运行("http://www.8gesy.com/payment/fenqu.html?id=A0BEA5587FEC4170BA27BFFE21685D80")
--		end
--	end
	if self.资源组[6]:事件判断() then
       发送数据(3768)
	end
	if self.资源组[9]:事件判断() then
	 	self.可视 = false
	end
	zts:置颜色(0xFFFF0000)
	zts:显示(self.x+530,self.y+45,"抽奖点卡余额")
	zts:显示(self.x+555,self.y+65,self.抽奖点卡)
	if self.介绍==1 then
		self.资源组[8]:更新(x,y)
		self.资源组[7]:显示(self.x+20,self.y+35)
		--self.资源组[8]:显示(self.x+201,self.y+37)
		local 字体 = tp.字体表.普通字体
		字体:置颜色(0xFF00FF00)
		字体:显示(self.x+40,self.y+70,"只能用抽奖点卡抽奖")
	    字体:显示(self.x+40,self.y+100,"抽奖充值和元宝充值累积")
	    字体:显示(self.x+40,self.y+130,"每次抽奖消耗10抽奖点卡")
	    字体:显示(self.x+40,self.y+160,"奖池物品剩余1个时自动刷新")
	end
	if self.资源组[8]:事件判断() then
		self.介绍=0
	end
	self.焦点 = false
end
function 内充抽奖:检查点(x,y)
	if self.可视 and self.资源组[1] ~= nil and self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 内充抽奖:初始移动(x,y)
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

function 内充抽奖:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 内充抽奖
