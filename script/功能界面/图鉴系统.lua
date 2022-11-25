

local 图鉴系统 = class()
local tp
local insert = table.insert

function 图鉴系统:初始化(根) --图鉴系统制造全过程
	self.ID = 999
	self.x = 50
	self.y = 80
	self.xx = 0
	self.yy = 0
	self.注释 = "图鉴系统"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	self.窗口时间 = 0
	tp=根
end
function 图鉴系统:打开(数据)
	if self.可视 then
	   self.可视=false
	   self.资源组=nil
	   self.数据=nil
	   self.激活=nil
	   self.激活2=nil
	   self.按钮=nil
	else
	    insert(tp.窗口_,self)
		local 按钮 = tp._按钮
		local 自适应 = tp._自适应
		local 资源 = tp.资源
		self.资源组 = {
			[1] = 资源:载入('wpal/121.wpal',"网易WDF动画",0XEEE36C75),
			[2] = 按钮.创建(资源:载入('wpal/121.wpal',"网易WDF动画",0xEEE36C77),0,0,4,true,true),
			[3] = 资源:载入('wpal/121.wpal',"网易WDF动画",0XEEE36C74),
			[4] = 资源:载入('wpal/121.wpal',"网易WDF动画",0XEEE36C73),
			[5] = 资源:载入('wpal/121.wpal',"网易WDF动画",0XEEE36C83),
			[6] = 按钮.创建(资源:载入('wpal/121.wpal',"网易WDF动画",0xEEE36C81),0,0,4,true,true),
			[7] = 按钮.创建(资源:载入('wpal/121.wpal',"网易WDF动画",0xEEE36C82),0,0,4,true,true),
			[8] = 资源:载入('wpal/121.wpal',"网易WDF动画",0x0000b060),
			[9] = 资源:载入('wpal/121.wpal',"网易WDF动画",0x0000b062),
			[10] = 资源:载入('wpal/121.wpal',"网易WDF动画",0xEEE36C74),
			[11] = 资源:载入('wpal/121.wpal',"网易WDF动画",0x0000b059),
			[12] = 资源:载入('wpal/121.wpal',"网易WDF动画",0x0000b063),
			[13] = 资源:载入('wpal/121.wpal',"网易WDF动画",0x0000b059),
		}
		tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间
	    self.可视 = true
	    self.开始=1
	    self.结束=4
	    self.添加宠物=0
	    self.存放地图=""
	    self.存放宠物=""
	    self.选中宠物=0
	    self.数据=数据[1]
	    self.地图名称={"东海湾","江南野外","大雁塔","大唐国境","大唐境外","魔王寨","普陀山","盘丝岭","狮驼岭","西牛贺州"
	                  ,"花果山","海底迷宫","地狱迷宫","北俱芦洲","龙窟","凤巢","无名鬼蜮","女娲神迹","小西天","小雷音寺"}
	    self.宠物表={东海湾={"大海龟","巨蛙","海毛虫"}
	                ,江南野外={"树怪","野猪"}
	                ,大雁塔={"赌徒","强盗","骷髅怪","羊头怪","蛤蟆精","狐狸精","花妖","大蝙蝠"}
	                ,大唐国境={"赌徒","强盗","山贼"}
	                ,大唐境外={"老虎","黑熊","花妖"}
	                ,魔王寨={"牛妖","蛤蟆精"}
	                ,普陀山={"黑熊精"}
	                ,盘丝岭={"蜘蛛精","狐狸精","花妖"}
	                ,狮驼岭={"雷鸟人","蝴蝶仙子"}
	                ,西牛贺州={"小龙女","狼"}
	                ,花果山={"小龙女","老虎","黑熊"}
	                ,海底迷宫={"虾兵","蟹将","龟丞相"}
	                ,地狱迷宫={"野鬼","骷髅怪","僵尸","牛头","马面"}
	                ,北俱芦洲={"古代瑞兽","白熊","天将"}
	                ,龙窟={"古代瑞兽","黑山老妖","天兵","风伯","蛟龙","雨师","地狱战神","巡游天神","星灵仙子"}
	                ,凤巢={"黑山老妖","天将","天兵","雷鸟人","地狱战神","风伯","凤凰","如意仙子","芙蓉仙子"}
	                ,无名鬼蜮={"幽灵","吸血鬼","鬼将"}
	                ,小西天={"夜罗刹","炎魔神","噬天虎"}
	                ,女娲神迹={"律法女娲","灵符女娲","净瓶女娲"}
	                ,小雷音寺={"大力金刚","雾中仙","灵鹤"}
	                }
	    self.按钮={}
	    self.选中=0
	    self.头像组1={}
	    self.头像组2={}
	    --self.头像组1={}
	    for n=1,20 do
	        self.按钮[n]=按钮.创建(资源:载入('wpal/121.wpal',"网易WDF动画",0xEEE36C71),0,0,4,true,true)
	    end
	    self.上一页=按钮.创建(资源:载入('wpal/121.wpal',"网易WDF动画",0xEEE36C71),0,0,4,true,true)
	    self.下一页=按钮.创建(资源:载入('wpal/121.wpal',"网易WDF动画",0xEEE36C71),0,0,4,true,true)
	    self.刷新属性=按钮.创建(资源:载入('wpal/121.wpal',"网易WDF动画",0xEEE36C71),0,0,4,true,true)
	    self.激活={}
	    self.激活2={}
	    for n=1,20 do
	        self.激活[n]=按钮.创建(资源:载入('wpal/121.wpal',"网易WDF动画",0xEEE36C80),0,0,2,true,true)
	        self.激活2[n]=按钮.创建(资源:载入('wpal/121.wpal',"网易WDF动画",0xEEE36C80),0,0,2,true,true)
	    end
	end
end
function 图鉴系统:更新(dt)
self.数据=数据[1]
end
function 图鉴系统:刷新图鉴(数据)
self.数据=数据
end
function 图鉴系统:显示(dt,x,y) --问问老板翻页按钮这么安排搞点吃的先
	self.焦点=false
    self.刷新属性:更新(x,y)
	self.资源组[1]:显示(self.x,self.y)
	self.资源组[2]:更新(x,y)
	if self.资源组[2]:事件判断() then --关闭
		self.可视=false
	elseif self.上一页:事件判断() then
		if self.开始>4 then
		   self.开始=self.开始-4
		   self.结束=self.结束-4
		end
	elseif self.下一页:事件判断() then  --上下
		if self.结束<=16 then
		   self.开始=self.开始+4
		   self.结束=self.结束+4
		end
	end
	local 字体1 = tp.字体表.道具字体
	字体1:置颜色(黄色)
	local yy=1
	self.上一页:更新(x,y)
	self.下一页:更新(x,y)
    self.上一页:显示(self.x+55,self.y+65)
    字体1:显示(self.x+70,self.y+77,"上一页")
    self.下一页:显示(self.x+55,self.y+370)
    字体1:显示(self.x+70,self.y+382,"下一页")
    字体1:显示(self.x+320,self.y+20,"图鉴系统 ") --标题
    --if  self.可视 == true then
		for n=self.开始,self.结束 do
	        self.按钮[n]:更新(x,y)
	        if self.选中==n then
		        self.按钮[n]:显示(self.x+55,self.y+68+yy*60,nil,nil,nil,true,2)
			else
		    self.按钮[n]:显示(self.x+55,self.y+68+yy*60)
			end
			字体1:显示(self.x+65,self.y+80+yy*60,self.地图名称[n])
			yy=yy+1
		    if self.按钮[n]:事件判断() then
		        self.选中=n
		        self.头像组1={}
		        self.头像组2={}
		    end
		end
	--end
	local xx=0
	if self.选中~=0 then
        --字体1:显示(self.x+370,self.y+85,self.地图名称[self.选中])
        字体1:显示(self.x+370,self.y+85,"宝 宝")
		for n=1,#self.宠物表[self.地图名称[self.选中]] do
			if self.宠物表[self.地图名称[self.选中]][n]~=nil  then
				if  self.头像组1[n]==nil then
				    local 临时资源=引擎.取头像(self.宠物表[self.地图名称[self.选中]][n])
				    self.头像组1[n] =tp._按钮.创建(tp.资源:载入(临时资源[7],"网易WDF动画",临时资源[1]),0,0,1,true,true)
		        end
		        local 地图=self.地图名称[self.选中]
		        local 名称=self.宠物表[地图][n]
                if self.数据[地图][名称]==1 or self.数据[地图][名称]==3 then
               	    self.头像组1[n]:显示(self.x+212+xx*56,self.y+130)
               	    self.资源组[3]:显示(self.x+212+xx*56,self.y+130)
                else
                    self.头像组1[n]:显示(self.x+212+xx*56,self.y+130)
                end
                xx=xx+1
                if self.头像组1[n]:是否选中(x,y) and 引擎.鼠标按下(左键) and self.数据[地图][名称]~=1 and self.数据[地图][名称]~=3  and (self.数据[地图].激活==102 or self.数据[地图].激活==100 ) then
               	 -- 发送数据(201,{名称=名称,地图=地图}) --放入宠物
               	    if self.添加宠物~=0 then
	           	  	    self.添加宠物=0
	           	  	else
	           	  	    self.添加宠物=1
	           	  	    self.存放名称=名称
	           	  	    self.存放地图=地图
	           	    end
                end
		    end
		end
	    xx=0
	    if self.选中<=20 then
	        --字体1:显示(self.x+370,self.y+257,self.地图名称[self.选中])
	        字体1:显示(self.x+370,self.y+257,"变 异")
			for n=1,#self.宠物表[self.地图名称[self.选中]] do
				if self.宠物表[self.地图名称[self.选中]][n]~=nil  then
				    if  self.头像组2[n]==nil then
			            local 临时资源=引擎.取头像(self.宠物表[self.地图名称[self.选中]][n])
			            self.头像组2[n] =tp._按钮.创建(tp.资源:载入(临时资源[7],"网易WDF动画",临时资源[1]),0,0,1,true,true)
	                end
		            local 名称=self.宠物表[self.地图名称[self.选中]][n]
			        local 地图=self.地图名称[self.选中]
	                if self.数据[地图][名称]==2 or self.数据[地图][名称]==3 then
		                self.头像组2[n]:显示(self.x+212+xx*56,self.y+298)
		               	self.资源组[3]:显示(self.x+212+xx*56,self.y+298)
		            else
		               self.头像组2[n]:显示(self.x+212+xx*56,self.y+298)
		            end
	                xx=xx+1
		            if self.头像组2[n]:是否选中(x,y) and 引擎.鼠标按下(左键)  and self.数据[地图][名称]~=2 and self.数据[地图][名称]~=3 and (self.数据[地图].激活==101 or self.数据[地图].激活==100 ) then
		           	--print(self.数据[地图].激活,self.数据[地图][名称])
		           	--发送数据(201,{名称=名称,地图=地图})  --放入宠物
		           	    if self.添加宠物~=0 then
		           	  	    self.添加宠物=0
		           	  	else
		           	  	    self.添加宠物=2
		           	  	    self.存放名称=名称
		           	  	    self.存放地图=地图
		           	    end
		            end
			    end
		    end
		end
		local 字体 = tp.字体表.普通字体
		字体:置颜色(红色)
		if self.选中==1 then
			字体:显示(self.x+215,self.y+200,"体质：+100")
			字体:显示(self.x+215,self.y+370,"体质：+200")
		elseif self.选中==2 then
			字体:显示(self.x+215,self.y+200,"最大气血：400")
			字体:显示(self.x+215,self.y+370,"最大气血：800")
		elseif self.选中==3 then
			字体:显示(self.x+215,self.y+200,"攻击资质：+200")
			字体:显示(self.x+215,self.y+370,"攻击资质：+400")
		elseif self.选中==4 then
			字体:显示(self.x+215,self.y+200,"魔力：+100")
			字体:显示(self.x+215,self.y+370,"魔力：+200")
		elseif self.选中==5 then
			字体:显示(self.x+215,self.y+200,"力量：+100")
			字体:显示(self.x+215,self.y+370,"力量：+200")
		elseif self.选中==6 then
			字体:显示(self.x+215,self.y+200,"最大气血：+400")
			字体:显示(self.x+215,self.y+370,"最大气血：+800")
		elseif self.选中==7 then
			字体:显示(self.x+215,self.y+200,"速度：+100")
			字体:显示(self.x+215,self.y+370,"速度：+200")
		elseif self.选中==8 then
			字体:显示(self.x+215,self.y+200,"最大魔法：+400")
			字体:显示(self.x+215,self.y+370,"最大魔法：+800")
		elseif self.选中==9 then
			字体:显示(self.x+215,self.y+200,"攻击：+100")
			字体:显示(self.x+215,self.y+370,"攻击：+200")
		elseif self.选中==10 then
			字体:显示(self.x+215,self.y+200,"防御：+100")
			字体:显示(self.x+215,self.y+370,"防御：+200")
		elseif self.选中==11 then
			字体:显示(self.x+215,self.y+200,"躲闪资质：+200")
			字体:显示(self.x+215,self.y+370,"躲闪资质：+400")
		elseif self.选中==12 then
			字体:显示(self.x+215,self.y+200,"耐力:+100")
			字体:显示(self.x+215,self.y+370,"耐力:+200")
		elseif self.选中==13 then
			字体:显示(self.x+215,self.y+200,"防御资质：+200")
			字体:显示(self.x+215,self.y+370,"防御资质：+400")
		elseif self.选中==14 then
			字体:显示(self.x+215,self.y+200,"敏捷：+100")
			字体:显示(self.x+215,self.y+370,"敏捷：+200")
		elseif self.选中==15 then
			字体:显示(self.x+215,self.y+200,"体力资质：+400")
			字体:显示(self.x+215,self.y+370,"体力资质：+800")
		elseif self.选中==16 then
			字体:显示(self.x+215,self.y+200,"法力资质：+200")
			字体:显示(self.x+215,self.y+370,"法力资质：+400")
		elseif self.选中==17 then
			字体:显示(self.x+215,self.y+200,"速度：+100")
			字体:显示(self.x+215,self.y+370,"速度：+200")
		elseif self.选中==18 then
			字体:显示(self.x+215,self.y+200,"成长：+0.25")
			字体:显示(self.x+215,self.y+370,"成长：+0.5")
		elseif self.选中==19 then
			字体:显示(self.x+215,self.y+200,"灵力：+100")
			字体:显示(self.x+215,self.y+370,"灵力：+200")
		elseif self.选中==20 then
			字体:显示(self.x+215,self.y+200,"速度资质+200")
			字体:显示(self.x+215,self.y+370,"速度资质+400")
		end
		if self.数据[self.地图名称[self.选中]].激活==100 then
            self.激活[self.选中]:显示(self.x+520,self.y+188)
			字体1:显示(self.x+520,self.y+196," 未 激 活")
			self.激活2[self.选中]:显示(self.x+520,self.y+362)
			字体1:显示(self.x+520,self.y+370," 未 激 活")
        elseif self.数据[self.地图名称[self.选中]].激活==101 then
			self.激活[self.选中]:显示(self.x+520,self.y+188,nil,nil,nil,true,2)
			字体1:显示(self.x+520,self.y+196," 已 激 活 ")
			self.激活2[self.选中]:显示(self.x+520,self.y+362)
			字体1:显示(self.x+520,self.y+370," 未 激 活")
		elseif self.数据[self.地图名称[self.选中]].激活==102 then
			self.激活[self.选中]:显示(self.x+520,self.y+188)
			字体1:显示(self.x+520,self.y+196," 未 激 活")
			self.激活2[self.选中]:显示(self.x+520,self.y+362,nil,nil,nil,true,2)
			字体1:显示(self.x+520,self.y+370," 已 激 活 ")
		elseif self.数据[self.地图名称[self.选中]].激活==103 then
			self.激活[self.选中]:显示(self.x+520,self.y+188,nil,nil,nil,true,2)
			字体1:显示(self.x+520,self.y+196," 已 激 活 ")
			self.激活2[self.选中]:显示(self.x+520,self.y+362,nil,nil,nil,true,2)
			字体1:显示(self.x+520,self.y+370," 已 激 活 ")
		end
	    if self.激活[self.选中]:是否选中(x,y) and 引擎.鼠标按下(左键) and self.数据[self.地图名称[self.选中]].激活~=101 and self.数据[self.地图名称[self.选中]].激活~=103 then  --激活按钮判断
	    	local 激活数值=1
	       发送数据(202,{地图=self.地图名称[self.选中],区分=激活数值})
	    elseif self.选中<=20 and self.激活2[self.选中]:是否选中(x,y) and 引擎.鼠标按下(左键) and self.数据[self.地图名称[self.选中]].激活~=102 and self.数据[self.地图名称[self.选中]].激活~=103 then--激活按钮判断
	    	local 激活数值=2
	       发送数据(202,{地图=self.地图名称[self.选中],区分=激活数值})
	    end
    else
    	self.资源组[4]:显示(self.x+185,self.y+65)
    	self.资源组[12]:显示(self.x+190,self.y+70)
    	self.资源组[13]:显示(self.x+190,self.y+255)
    	local 字体 = tp.字体表.普通字体
    	zts2:置字间距(2)
	    zts2:显示(self.x+390,self.y+85,"图鉴介绍")
	    zts2:置字间距(2)
	    zts2:显示(self.x+390,self.y+215,"激活详情")
		字体:置颜色(黑色)
		字体:显示(self.x+320,self.y+120,"所有宠物都可获得激活的属性")
		字体:显示(self.x+320,self.y+150,"激活所有地图的图鉴，属性额外提升1/3！")
		--字体:显示(self.x+220,self.y+160,"激活所有地图的图鉴，属性额外提升1/3！")
		self.刷新属性:显示(self.x+515,self.y+180)
		字体1:显示(self.x+520,self.y+190,"刷新属性")
		if self.刷新属性:事件判断() then
		   发送数据(5026,{地图=self.地图名称[self.选中],区分=激活数值})
		end
		for n=1,#self.地图名称 do
			if n>=1 and n<=4 then
				self.资源组[8]:显示(self.x+220+(n-1)*105,self.y+250)
				if self.数据[self.地图名称[n]].激活==103 then
                    self.资源组[10]:显示(self.x+275+(n-1)*105,self.y+245)
                   -- self.资源组[12]:显示(self.x+190,self.y+70)
                else
                	self.资源组[9]:显示(self.x+275+(n-1)*105,self.y+245)
                	--self.资源组[12]:显示(self.x+190,self.y+70)
                end
                字体:显示(self.x+220+(n-1)*105,self.y+255,self.地图名称[n])
				--self.资源组[8]:显示(self.x+220+(n-1)*105,self.y+250)
			end
			if n>=5 and n<=8 then
				self.资源组[8]:显示(self.x+220+(n-5)*105,self.y+290)
				if self.数据[self.地图名称[n]].激活==103 then
                    self.资源组[10]:显示(self.x+275+(n-5)*105,self.y+285)
                  --  self.资源组[11]:显示(self.x+220+(n-1)*105,self.y+250)
                else
                	self.资源组[9]:显示(self.x+275+(n-5)*105,self.y+285)
                   -- self.资源组[11]:显示(self.x+220+(n-1)*105,self.y+250)
                end
                字体:显示(self.x+220+(n-5)*105,self.y+295,self.地图名称[n])
			end
			if n>=9 and n<=12 then
				self.资源组[8]:显示(self.x+220+(n-9)*105,self.y+330)
				if self.数据[self.地图名称[n]].激活==103 then
                    self.资源组[10]:显示(self.x+275+(n-9)*105,self.y+325)
                 --   self.资源组[11]:显示(self.x+220+(n-1)*105,self.y+250)
                else
                	self.资源组[9]:显示(self.x+275+(n-9)*105,self.y+325)
                	--self.资源组[11]:显示(self.x+220+(n-1)*105,self.y+250)
                end
                字体:显示(self.x+220+(n-9)*105,self.y+335,self.地图名称[n])
			end
			if n>=13 and n<=16 then
				self.资源组[8]:显示(self.x+220+(n-13)*105,self.y+370)
				if self.数据[self.地图名称[n]].激活==103 then
                    self.资源组[10]:显示(self.x+275+(n-13)*105,self.y+365)
                  --  self.资源组[11]:显示(self.x+220+(n-1)*105,self.y+250)
                else
                	self.资源组[9]:显示(self.x+275+(n-13)*105,self.y+365)
                --	self.资源组[11]:显示(self.x+220+(n-1)*105,self.y+250)
                end
                字体:显示(self.x+220+(n-13)*105,self.y+375,self.地图名称[n])
			end
			if n>=17 and n<=20 then
				self.资源组[8]:显示(self.x+220+(n-17)*105,self.y+410)
				if self.数据[self.地图名称[n]].激活==103 then
					--print(self.数据[self.地图名称[n]].激活)
                    self.资源组[10]:显示(self.x+275+(n-17)*105,self.y+405)
                  --  self.资源组[11]:显示(self.x+220+(n-1)*105,self.y+250)
                else
                	self.资源组[9]:显示(self.x+275+(n-17)*105,self.y+405)
                	--self.资源组[11]:显示(self.x+220+(n-1)*105,self.y+250)
                end
                字体:显示(self.x+220+(n-17)*105,self.y+415,self.地图名称[n])
			end
		end
	end
	if self.添加宠物~=0 then
		if self.添加宠物==1 then
		    self.资源组[5]:显示(self.x+260,self.y+170)
		    self.资源组[6]:显示(self.x+280,self.y+260)
		    self.资源组[7]:显示(self.x+420,self.y+260)

		    字体1:显示(self.x+350,self.y+180,"宝宝-"..self.存放名称)

	    else
	    	self.资源组[5]:显示(self.x+260,self.y+130)
		    self.资源组[6]:显示(self.x+280,self.y+220)
		    self.资源组[7]:显示(self.x+420,self.y+220)
		    字体1:显示(self.x+350,self.y+140,"变异-"..self.存放名称)

	    end
	    for n=1,#tp.队伍[1].宝宝列表 do
	    	if self.添加宠物==1 then
			   	if tp.队伍[1].宝宝列表[n].模型==self.存放名称 and tp.队伍[1].宝宝列表[n].种类=="宝宝" then
			   	   self.选中宠物=n
			   	   self.激活类型=101
			   	   break
			   	end
			else
			    if tp.队伍[1].宝宝列表[n].模型==self.存放名称 and tp.队伍[1].宝宝列表[n].种类=="变异" then
			   	    self.选中宠物=n
			   	    self.激活类型=102
			   	    break
			   	end
			end
	    end
	    if self.资源组[7]:是否选中(x,y) and 引擎.鼠标按下(左键) then
	      self.添加宠物=0
	   	  self.选中宠物=0
	   	  self.存放名称=""
	   	elseif self.资源组[6]:是否选中(x,y) and 引擎.鼠标按下(左键) then
	   		if self.选中宠物==0 then
	   			if self.添加宠物==1 then
	   		       tp.提示:写入("#Y您身上没有#R"..self.存放名称.."#Y宝宝，必须是#R宝宝")
	   		    else
	   		       tp.提示:写入("#Y您身上没有#R"..self.存放名称.."#Y变异宝宝，必须是#R变异宝宝")
	   		    end
	   		else
	   		   发送数据(203,{宠物=self.选中宠物,激活类型=self.激活类型,名称=self.存放名称,地图=self.存放地图})
	   		   self.存放地图=""
	   		   self.选种宠物=0
	   		   self.存放名称=""
	   		   self.添加宠物=0
	   		end
	    end
	end
	--self.资源组[2]:显示(self.x+648,self.y+36)
end
function 图鉴系统:检查点(x,y)
	if self.可视 and self.资源组 ~= nil and self.资源组[1]:是否选中(x,y)  then
		return true
	else
		return false
	end
end
function 图鉴系统:初始移动(x,y)
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

function 图鉴系统:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end
return  图鉴系统