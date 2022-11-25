local 排行榜 = class()
local insert = table.insert
local  tp = 引擎.场景
local 富豪榜={"人气排行","经验排行","银子排行","存款排行","技能排行","修炼排行","帮贡排行","门贡排行"}
local 积分榜={"副本积分","水果积分","妖魔积分"}
local 属性榜={"气血排行","魔法排行","命中排行","伤害排行","防御排行","速度排行","灵力排行","躲闪排行"}

function 排行榜:初始化(根)
    tp=根
	self.ID = 56
	self.x = 70
	self.y = 50
	self.xx = 0
	self.yy = 0
	self.注释 = "排行榜"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
end

function 排行榜:打开()
	if self.可视 then
		self.可视 = false
		self.数据=nil
		self.资源组=nil
		collectgarbage("collect")
	else
		 insert(tp.窗口_,self)
	    tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间
	    self.可视 = true
	    self.状态= 1
	    self.子状态= 1
	    self.数据=数据
	local 资源 = tp.资源
	local 按钮 = tp._按钮
	local 自适应 = tp._自适应
	self.资源组 = {
		[1] = 资源:载入('wzife.wdf',"网易WDF动画",0XFBF970A7),
		[2] = 资源:载入('wzife.wdf',"网易WDF动画",0X75B260A7),
		--红色背景
		[3] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0xb42eb546),0,0,4,true),
		[4] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0xb42eb546),0,0,4,true),
		[5] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0xb42eb546),0,0,4,true),
		--黄色背景
		[6] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0x219a1626),0,0,4,true),
		[7] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0x219a1626),0,0,4,true),
		[8] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0x219a1626),0,0,4,true),
		[9] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0x219a1626),0,0,4,true),
		[10] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0x219a1626),0,0,4,true),
		[11] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0x219a1626),0,0,4,true),
		[12] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0x219a1626),0,0,4,true),
		[13] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0x219a1626),0,0,4,true),
		--纸上
		[14] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0x972ca1e4),0,0,4,true),
		[15] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0x6e62e765),0,0,4,true),
		[16] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0x8269dbb8),0,0,4,true),
		[17] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0x107f0617),0,0,4,true),
		[18] = 按钮.创建(资源:载入('自用',"网易WDF动画",0x98ea209e),0,0,4,true),--1
		[19] = 按钮.创建(资源:载入('自用',"网易WDF动画",0xad1d064f),0,0,4,true),
		[20] = 按钮.创建(资源:载入('自用',"网易WDF动画",0xf31b90f1),0,0,4,true),
		--底部
		[21] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0x20f3e242),0,0,4,true),
		[22] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0xc30317f),0,0,4,true),
	}
	for i=3,22 do
		self.资源组[i]:绑定窗口_(56)
	end
	self.窗口时间 = 0
	self.文字1= require("gge文字类").创建(nil,25,false,false,true)
	self.文字2=tp.字体表.描边字体
	self.zts = tp.字体表.普通字体
	self.zts1 = tp.字体表.描边字体
	self.zts3 = tp.字体表.普通字体__
	self.状态= 1
	self.子状态= 1

	end
end
function 排行榜:刷新(数据)
    self.数据=数据
end
function 排行榜:显示(dt,x,y)
	self.焦点 = false
	self.资源组[3]:更新(x,y,self.状态~=1)
	self.资源组[4]:更新(x,y,self.状态~=2)
	self.资源组[5]:更新(x,y,self.状态~=3)
	for i=6,13 do
		self.资源组[i]:更新(x,y,self.子状态~=i-5)
	end
	if self.资源组[3]:事件判断() then
		self.状态=1
		self.子状态=1
		发送数据(39,{"人气排行"})
	elseif self.资源组[4]:事件判断() then
		self.状态=2
		self.子状态=1
		--发送数据(39,{"副本积分"})
	elseif self.资源组[5]:事件判断() then
		self.状态=3
		self.子状态=1
		发送数据(39,{"气血排行"})
	elseif self.资源组[6]:事件判断() then
		self.子状态=1
		if self.状态==1 and self.子状态==1 then
			发送数据(39,{"人气排行"})
		elseif self.状态==2 and self.子状态==1 then
		--	发送数据(39,{"副本积分"})
		elseif self.状态==3 and self.子状态==1 then
			发送数据(39,{"气血排行"})
		end
	elseif self.资源组[7]:事件判断() then
		self.子状态=2
		if  self.状态==1  and self.子状态==2 then
		   发送数据(39,{"经验排行"})
		elseif  self.状态==2  and self.子状态==2 then
		--   发送数据(39,{"水果积分"})
		elseif self.状态==3 and self.子状态==2 then
			发送数据(39,{"魔法排行"})
		end
	elseif self.资源组[8]:事件判断() then
		self.子状态=3
		if  self.状态==1  and self.子状态==3 then
		   发送数据(39,{"银子排行"})
		elseif  self.状态==2  and self.子状态==3 then
		  -- 发送数据(39,{"妖魔积分"})
		elseif self.状态==3 and self.子状态==3 then
			发送数据(39,{"命中排行"})
		end
	elseif self.资源组[9]:事件判断() then
		self.子状态=4
		if self.状态==3 and self.子状态==4 then
			发送数据(39,{"伤害排行"})
		elseif  self.状态==1  and self.子状态==4 then
		   发送数据(39,{"存款排行"})
		end
	elseif self.资源组[10]:事件判断() then
		self.子状态=5
		if self.状态==3 and self.子状态==5 then
			发送数据(39,{"防御排行"})
		elseif  self.状态==1  and self.子状态==5 then
		   发送数据(39,{"技能排行"})
		end
	elseif self.资源组[11]:事件判断() then
		self.子状态=6
		if self.状态==3 and self.子状态==6 then
			发送数据(39,{"速度排行"})
		elseif self.状态==1 and self.子状态==6 then
			发送数据(39,{"修炼排行"})
		end
	elseif self.资源组[12]:事件判断() then
		self.子状态=7
		if self.状态==3 and self.子状态==7 then
			发送数据(39,{"灵力排行"})
		elseif self.状态==1 and self.子状态==7 then
			发送数据(39,{"帮贡排行"})
		end
	elseif self.资源组[13]:事件判断() then
		self.子状态=8
		if self.状态==3 and self.子状态==8 then
			发送数据(39,{"躲闪排行"})
		elseif self.状态==1 and self.子状态==8 then
			发送数据(39,{"门贡排行"})
		end
	end
	if	self.资源组[21]:是否选中(x,y) then
		tp.提示:自定义(self.x+180,self.y+440,"排行榜时时更新！")
	end

	self.资源组[1]:显示(self.x,self.y)
	self.资源组[2]:显示(self.x+240,self.y+20)
	self.资源组[3]:显示(self.x+90,self.y+90)
	self.文字1:显示(self.x+137,self.y +90,"富豪榜")
	--self.资源组[4]:显示(self.x+260,self.y+90)
	--self.文字1:显示(self.x+307,self.y +90,"积分榜")
	self.资源组[5]:显示(self.x+260,self.y+90)
	self.文字1:显示(self.x+307,self.y +90,"属性榜")
	for i=1,8 do
	self.资源组[i+5]:显示(self.x+98,self.y+90+i*35)
	end
	self.资源组[14]:显示(self.x+235,self.y+123)
	self.资源组[15]:显示(self.x+300,self.y+130)
	self.资源组[16]:显示(self.x+400,self.y+130)
	self.资源组[17]:显示(self.x+500,self.y+130)
	self.zts:置颜色(黑色)
	for i=1,10 do
		self.zts:显示(self.x+250,self.y + 110+i*29,"_______________________________________________")
	end
	self.资源组[18]:显示(self.x+294,self.y+146)
	self.资源组[19]:显示(self.x+300,self.y+181)
	self.资源组[20]:显示(self.x+309,self.y+213)
	self.zts3:置颜色(黑色)
	for i=4,10 do
		self.zts3:显示(self.x+320,self.y + 132+i*29,i)
	end

	if self.状态==1 then
		for i=1,8 do
			self.文字2:显示(self.x+135,self.y +98+i*35,富豪榜[i])
		end
	elseif  self.状态==2 then
		for i=1,3 do
			self.文字2:显示(self.x+135,self.y +98+i*35,积分榜[i])
		end
	elseif  self.状态==3 then
		for i=1,8 do
			self.文字2:显示(self.x+135,self.y +98+i*35,属性榜[i])
		end
	end
	if self.数据~=nil then
			for i=1,10 do
				self.zts:显示(self.x+401,self.y + 130+i*29,self.数据[i].名称)
				self.zts:显示(self.x+500,self.y + 130+i*29,self.数据[i].分数)
			end
	end
	self.资源组[21]:显示(self.x+200,self.y+413)
	--self.资源组[22]:显示(self.x+400,self.y+450)
end

function 排行榜:检查点(x,y)
	if self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 排行榜:初始移动(x,y)
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

function 排行榜:开始移动(x,y)
  if self.鼠标 then
    self.x = x - self.xx
    self.y = y - self.yy
  end
end








return 排行榜