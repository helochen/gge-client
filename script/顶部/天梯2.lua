--======================================================================--

--======================================================================--
local 系统类_天梯 = class()
local floor = math.floor
local tp,zts,zt
local format = string.format
local insert = table.insert
local tx = 引擎.取头像

function 系统类_天梯:初始化(根)
	self.x = 68
	self.y = 95
	self.xx = 0
	self.yy = 0
	self.注释 = "天梯"
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
	self.输入框:屏蔽快捷键(true)
	self.输入框:置光标颜色(-16777216)
	self.输入框:置文字颜色(-16777216)

	self.数量框 = 总控件:创建输入("数量输入",0,0,180,14)
	self.数量框:置可视(false,false)
	self.数量框:置限制字数(10)
	self.数量框:置数字模式()
	self.数量框:屏蔽快捷键(true)
	self.数量框:置光标颜色(-16777216)
	self.数量框:置文字颜色(-16777216)

end

function 系统类_天梯:打开(数据)
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
			[1] = 资源:载入('npk/bj.npk',"网易WDF动画",0x10000000),
			[3] = 按钮.创建(tp.资源:载入('npk/bj.npk',"网易WDF动画",0x10006000),0,0,4,true,true),--快速匹配
			[4] = 按钮.创建(tp.资源:载入('npk/bj.npk',"网易WDF动画",0x10007000),0,0,4,true,true),--单人
			[5] = 按钮.创建(tp.资源:载入('npk/bj.npk',"网易WDF动画",0x10008000),0,0,4,true,true),--三人
			[6] = 按钮.创建(tp.资源:载入('npk/bj.npk',"网易WDF动画",0x10009000),0,0,4,true,true),--五人
			[7] = 资源:载入('addon.wdf',"网易WDF动画",0x2231EBB4),
			[9] = 按钮.创建(tp.资源:载入('npk/bj.npk',"网易WDF动画",0x10006000),0,0,4,true,true),--取消匹配
			[10] = 按钮.创建(tp.资源:载入('npk/bj.npk',"网易WDF动画",0x10006000),0,0,4,true,true),--天梯排行
			[11] = 资源:载入('npk/bj.npk',"网易WDF动画",0x10010000),
			[12] = 资源:载入('npk/bj.npk',"网易WDF动画",0x10014000),
			[13] = 资源:载入('npk/bj.npk',"网易WDF动画",0x10011000),
			[14] = 资源:载入('npk/bj.npk',"网易WDF动画",0x10016000),
			[15] = 资源:载入('npk/bj.npk',"网易WDF动画",0x10012000),
			[16] = 资源:载入('npk/bj.npk',"网易WDF动画",0x10013000),
			[17] = 资源:载入('npk/bj.npk',"网易WDF动画",0x10015000),



		}
        self.记忆角色 = {}
        self.人物头像背景 = {}
		self.数据=数据
		tp.运行时间 = tp.运行时间 + 1
	    self.窗口时间 = tp.运行时间
	    self.可视 = true
	    self.进程=1
	    self.信息=1
	    self.排行可视 = false
       self.计时 = 0
       self.时间间隔 = 0
       self.是否匹配 = "无匹配"
       self.是否模式 = 0

	end
end

function 系统类_天梯:刷新(数据)

  self.数据 = 数据
end

 function 系统类_天梯:刷新排行(内容)

  self.排行数据 = 内容
 end

function 系统类_天梯:显示(dt,x,y)
	self.焦点 = false
	self.资源组[3]:更新(x,y)
	self.资源组[4]:更新(x,y)
	self.资源组[5]:更新(x,y)
	self.资源组[6]:更新(x,y)
	self.资源组[7]:更新(dt)
	self.资源组[9]:更新(x,y)
	self.资源组[10]:更新(x,y)
	self.资源组[1]:显示(self.x,self.y)
	self.资源组[3]:显示(self.x + 76,self.y + 380)
	self.资源组[9]:显示(self.x + 180,self.y + 380)
	self.资源组[10]:显示(self.x + 530,self.y + 380)
	self.资源组[4]:显示(self.x + 95,self.y + 231)
	self.资源组[5]:显示(self.x + 208,self.y + 231)
	self.资源组[6]:显示(self.x + 321,self.y + 231)

	tp.字体表.普通字体:置颜色(0xFF5e2612):显示(self.x+191,self.y+387,"取消匹配")

	tp.字体表.普通字体:置颜色(0xFF5e2612):显示(self.x+405,self.y+387,"当前状态："..self.是否匹配)
	if self.是否模式 == 1 then
	tp.字体表.普通字体:置颜色(0xFF5e2612):显示(self.x+267,self.y+387,"当前模式：单人模式")

    elseif self.是否模式 == 3 then
    tp.字体表.普通字体:置颜色(0xFF5e2612):显示(self.x+267,self.y+387,"当前模式：三人模式")
    elseif self.是否模式 == 5  then
    tp.字体表.普通字体:置颜色(0xFF5e2612):显示(self.x+267,self.y+387,"当前模式：五人模式")
     else
       tp.字体表.普通字体:置颜色(0xFF5e2612):显示(self.x+267,self.y+387,"当前模式：无模式")
    end

	 local  rw = tp.队伍[1]
    tp.字体表.普通字体:置颜色(0xFF5e2612):显示(self.x+207,self.y+100,rw.名称)
    tp.字体表.普通字体:置颜色(0xFF5e2612):显示(self.x+330,self.y+100,rw.门派)
    tp.字体表.普通字体:置颜色(0xFF5e2612):显示(self.x+208,self.y+127,rw.等级)
    tp.字体表.普通字体:置颜色(0xFF5e2612):显示(self.x+330,self.y+127,self.数据.积分) ----暂留待取积分

    if self.排行可视  then
    	local 数据名称 = "天梯"
     tp.字体表.普通字体:置颜色(0xFF5e2612):显示(self.x+545,self.y+329,"天梯前十") ----暂留待取段位
     tp.字体表.普通字体:置颜色(0xFF5e2612):显示(self.x+543,self.y+387,"查看段位")
     tp.字体表.普通字体:置颜色(0xFF5e2612):显示(self.x+475,self.y+85,"【排名】")
     tp.字体表.普通字体:置颜色(0xFF5e2612):显示(self.x+535,self.y+85,"【名称】")
     tp.字体表.普通字体:置颜色(0xFF5e2612):显示(self.x+610,self.y+85,"【积分】")
     for n=1,#self.排行数据[数据名称] do
			if n<=10 then
			  tp.字体表.普通字体:置颜色(0xFF5e2612):显示(self.x+490,self.y+125+n*20-33,n..".")
		      tp.字体表.普通字体:置颜色(0xFF5e2612):显示(self.x+525,self.y+125+n*20-33,self.排行数据[数据名称][n].名称)
		      tp.字体表.普通字体:置颜色(0xFF5e2612):显示(self.x+630,self.y+125+n*20-33,self.排行数据[数据名称][n].积分)
	        end
     end




    elseif self.数据.积分 <= 100 then
    tp.字体表.普通字体:置颜色(0xFF5e2612):显示(self.x+545,self.y+329,"倔强青铜") ----暂留待取段位
    tp.字体表.普通字体:置颜色(0xFF5e2612):显示(self.x+543,self.y+387,"查看排名")
    self.资源组[11]:显示(self.x + 503,self.y + 106)
   elseif  self.数据.积分 > 100 and self.数据.积分 <=300 then
   	tp.字体表.普通字体:置颜色(0xFF5e2612):显示(self.x+545,self.y+329,"秩序白银") ----暂留待取段位
   	tp.字体表.普通字体:置颜色(0xFF5e2612):显示(self.x+543,self.y+387,"查看排名")
   	self.资源组[12]:显示(self.x + 503,self.y + 106)
   	elseif  self.数据.积分 > 300 and self.数据.积分 <=500 then
   tp.字体表.普通字体:置颜色(0xFF5e2612):显示(self.x+545,self.y+329,"荣耀黄金") ----暂留待取段位
   tp.字体表.普通字体:置颜色(0xFF5e2612):显示(self.x+543,self.y+387,"查看排名")

   self.资源组[13]:显示(self.x + 503,self.y + 106)
      	elseif  self.数据.积分 > 500 and self.数据.积分 <=1000 then
   tp.字体表.普通字体:置颜色(0xFF5e2612):显示(self.x+545,self.y+329,"尊贵铂金") ----暂留待取段位
   tp.字体表.普通字体:置颜色(0xFF5e2612):显示(self.x+543,self.y+387,"查看排名")

   self.资源组[14]:显示(self.x + 503,self.y + 106)
      	elseif  self.数据.积分 > 1000 and self.数据.积分 <=3000 then
   tp.字体表.普通字体:置颜色(0xFF5e2612):显示(self.x+545,self.y+329,"永恒钻石") ----暂留待取段位
   tp.字体表.普通字体:置颜色(0xFF5e2612):显示(self.x+543,self.y+387,"查看排名")
   self.资源组[15]:显示(self.x + 503,self.y + 106)
      	elseif  self.数据.积分 > 3000 and self.数据.积分 <=5000 then
   tp.字体表.普通字体:置颜色(0xFF5e2612):显示(self.x+545,self.y+329,"至尊星耀") ----暂留待取段位
   tp.字体表.普通字体:置颜色(0xFF5e2612):显示(self.x+543,self.y+387,"查看排名")
   self.资源组[16]:显示(self.x + 503,self.y + 106)
      	elseif  self.数据.积分 > 5000 then
   tp.字体表.普通字体:置颜色(0xFF5e2612):显示(self.x+545,self.y+329,"最强王者") ----暂留待取段位
   tp.字体表.普通字体:置颜色(0xFF5e2612):显示(self.x+543,self.y+387,"查看排名")
   self.资源组[17]:显示(self.x + 503,self.y + 106)
     end

    local x = tx(rw.模型)----取角色模型名称即可
	self.人物头像背景[1] = tp.资源:载入(x[7],"网易WDF动画",x[2])
	tp.人物头像背景_:显示(self.x+108,self.y+97)
    self.人物头像背景[1]:显示(self.x+111,self.y+100)

  if #tp.队伍数据 >= 1 and not tp.战斗中 then
		for i=1,#tp.队伍数据 do
			if self.记忆角色[i+1] == nil or self.记忆角色[i+1] ~= tp.队伍数据[i].模型 then
				local x = tx(tp.队伍数据[i].模型)
				self.人物头像背景[i+1] = tp.资源:载入(x[7],"网易WDF动画",x[2])
				self.记忆角色[i+1] = tp.队伍数据[i].模型
			end
			tp.人物头像背景_:显示(self.x+95+i*51,self.y+164)
			self.人物头像背景[i+1]:显示(self.x+95+i*51+3,self.y+167)
			self.资源组[7]:显示(self.x + 122,self.y + 201)

		end

	else
		tp.字体表.普通字体:置颜色(0xFF5e2612):显示(self.x+128,self.y+180,"单人模式无需组队，三人和五人需要组队！")
	end


	if self.资源组[3]:事件判断() then
	  self.计时 = os.time()
	 发送数据(100.18,{匹配=1})
     --self.进程=3
    elseif self.资源组[9]:事件判断() then
     发送数据(100.18,{匹配=0})
      self.进程=1

	elseif self.资源组[4]:事件判断() then
		--print(11111)
		 发送数据(100.17,{模式=1})
	elseif self.资源组[5]:事件判断() then
         发送数据(100.17,{模式=3})
	elseif self.资源组[6]:事件判断() then
         发送数据(100.17,{模式=5})
    elseif self.资源组[10]:事件判断() then
       if self.排行可视 then
			self.排行可视 = false
		else

			 self.排行可视=true
			 发送数据(100.19)

		end


	end



if self.进程 == 1 then
	--  print("生效")
tp.字体表.普通字体:置颜色(0xFF5e2612):显示(self.x+89,self.y+387,"快速匹配")
self.是否匹配 = "无匹配"
end


if self.进程 == 3 then
	 self.是否匹配 = "匹配中"

      self.时间间隔 = os.time()-self.计时
         tp.字体表.普通字体:置颜色(0xFF5e2612):显示(self.x+87,self.y+387,"匹配中")
         tp.字体表.普通字体:置颜色(0xFF5e2612):显示(self.x+87,self.y+387,"匹配中")
        if self.时间间隔 == 1 then
		tp.字体表.普通字体:置颜色(0xFF5e2612):显示(self.x+87,self.y+387,"匹配中.")
	    elseif self.时间间隔 == 2 then
	    tp.字体表.普通字体:置颜色(0xFF5e2612):显示(self.x+87,self.y+387,"匹配中..")
	    elseif self.时间间隔 == 3 then
	    tp.字体表.普通字体:置颜色(0xFF5e2612):显示(self.x+87,self.y+387,"匹配中...")
	    elseif self.时间间隔 == 4 then
	    tp.字体表.普通字体:置颜色(0xFF5e2612):显示(self.x+87,self.y+387,"匹配中....")
	    elseif self.时间间隔 == 5 then
	    tp.字体表.普通字体:置颜色(0xFF5e2612):显示(self.x+87,self.y+387,"匹配中.....")
	    elseif self.时间间隔 >= 6 then
	    tp.字体表.普通字体:置颜色(0xFF5e2612):显示(self.x+87,self.y+387,"匹配中......")
	    self.计时 = os.time()
	  end
end

end

function 系统类_天梯:检查点(x,y)
	if self.资源组 ~= nil and self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 系统类_天梯:初始移动(x,y)
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

function 系统类_天梯:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 系统类_天梯