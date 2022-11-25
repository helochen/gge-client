--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19.
-- @Last Modified time: 2021-02-03 00:38:39
--======================================================================--
local 无名系统处理 = class()

local floor = math.floor
local format = string.format
local insert = table.insert
local remove = table.remove
local mouseb = 引擎.鼠标弹起
local zts,zts1,tp

function 无名系统处理:初始化(根)
	self.ID = 331
	self.x = 110
	self.y = 47
	self.xx = 0
	self.yy = 0
	self.注释 = "奇经八脉2"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	self.选中 = nil
	tp = 根
	zts = tp.字体表.普通字体
	zts1 = tp.字体表.描边字体
	self.窗口时间 = 0
end

function 无名系统处理:打开(数据)
	if self.可视 then
		self.头像 = nil
		self.选中 = nil
		self.可视 = false
		self.资源组 = nil
		self.魂环组= nil
		self.法相组= nil
		self.异火组= nil
		self.神器组= nil
		return
	else

		insert(tp.窗口_,self)
		self:加载数据()
		self:刷新数据(数据)
		tp.运行时间 = tp.运行时间 + 1
	 	self.窗口时间 = tp.运行时间
	    self.可视 = true
	end
end
function 无名系统处理:刷新数据(数据)
	self.增加=nil
	self.数据=数据
	if self.数据.位置~=nil then
	   self.位置=self.数据.位置
	end
	self.境界="无"
	self.补差={x=0,y=0}
	if self.数据.境界==0 then
		self.数据.境界=self.数据.境界+1
		self.增加=true
	end
	if  self.数据.类型=="异火" then
		self.文本 = "白虎是战神、杀伐之神。虎具有避邪、\n禳灾、祈丰及惩恶的扬善、发财致富、\n喜结良缘等多种神力。而它是四灵之一\n当然也|是由星宿变成的。"
		self.补差={x=140,y=300}
		self.资源组[12]=self.异火组[self.数据.名称]
		if self.数据.境界==1 then
		   self.境界="斗气白虎"
		elseif self.数据.境界==2 then
		   self.境界="斗者白虎"
		elseif self.数据.境界==3 then
		   self.境界="斗师白虎"
		elseif self.数据.境界==4 then
		   self.境界="斗灵白虎"
		elseif self.数据.境界==5 then
		   self.境界="斗宗白虎"
		elseif self.数据.境界==6 then
		   self.境界="斗王白虎"
		elseif self.数据.境界==7 then
		   self.境界="斗尊白虎"
		elseif self.数据.境界==8 then
		   self.境界="斗圣白虎"
		elseif self.数据.境界==9 then
		   self.境界="斗皇白虎"
		end
	end
	if self.数据.类型=="魂环" then
		self.文本 = "朱雀在中国来说，是一种代表幸福的\n灵物。它的原形有很多种。如锦鸡、\n孔雀、鹰鹫、鹄、玄鸟(燕子)等等又有\n说是佛教大鹏金翅鸟变成的。故又叫火凤凰。"
		self.补差={x=140,y=300}
		self.资源组[12]=self.魂环组[self.数据.境界]
		if self.数据.境界==1 then
		   self.境界="普通朱雀"
		elseif self.数据.境界==2 then
		   self.境界="十年朱雀"
		elseif self.数据.境界==3 then
		   self.境界="百年朱雀"
		elseif self.数据.境界==4 then
		   self.境界="千年朱雀"
		elseif self.数据.境界==5 then
		   self.境界="万年朱雀"
		elseif self.数据.境界==6 then
		   self.境界="十万年朱雀"
		elseif self.数据.境界==7 then
		   self.境界="神级朱雀"
		end
	end
	if self.数据.类型=="神器" then
		self.文本 = "青龙，亦作“苍龙”，古代神话中的\n东方之神。龙是中华民族的图腾，自\n黄帝授命于天，威泽四方，在东方传说中，\n青龙身似长蛇、麒麟首、鲤鱼尾、面有\n长须、犄角似鹿、有五爪、相貌威武。"
		self.补差={x=140,y=300}
		self.资源组[12]=self.神器组[self.数据.境界]
		if self.数据.境界==1 then
		   self.境界="器士青龙"
		elseif self.数据.境界==2 then
		   self.境界="器者青龙"
		elseif self.数据.境界==3 then
		   self.境界="器师青龙"
		elseif self.数据.境界==4 then
		   self.境界="器灵青龙"
		elseif self.数据.境界==5 then
		   self.境界="器宗青龙"
		elseif self.数据.境界==6 then
		   self.境界="器王青龙"
		elseif self.数据.境界==7 then
		   self.境界="器尊青龙"
		elseif self.数据.境界==8 then
		   self.境界="器圣青龙"
		elseif self.数据.境界==9 then
		   self.境界="器皇青龙"
		end
	end
	if self.数据.类型=="法相"then
		self.文本 = "玄武是一种由龟和蛇组合成的一种灵物。\n玄武的本意就是玄冥，武、冥古音是\n相通的。武，是黑色的意思；冥，就是\n阴的意思。所以玄冥又成了北方神。"
		self.补差={x=140,y=300}
		if tp.队伍[1].性别=="男" then
			self.资源组[12]=self.法相组[self.数据.境界+9]
		else
			self.资源组[12]=self.法相组[self.数据.境界]
		end
		if self.数据.境界==1 then
		   self.境界="练气玄武"
		elseif self.数据.境界==2 then
		   self.境界="筑基玄武"
		elseif self.数据.境界==3 then
		   self.境界="金丹玄武"
		elseif self.数据.境界==4 then
		   self.境界="元婴玄武"
		elseif self.数据.境界==5 then
		   self.境界="出窍玄武"
		elseif self.数据.境界==6 then
		   self.境界="分神玄武"
		elseif self.数据.境界==7 then
		   self.境界="合体玄武"
		elseif self.数据.境界==8 then
		   self.境界="洞虚玄武"
		elseif self.数据.境界==9 then
		   self.境界="大乘玄武"
		end
	end
		if self.增加 then
			self.数据.境界=self.数据.境界-1
			if self.数据.境界==0 then
				self.境界="无"
			end
		end
	self.文字显示 = require("gge文字类").创建(nil,20,false,false,true)


end
function 无名系统处理:加载数据()
	local 资源 = tp.资源
	local 按钮 = tp._按钮
	local 自适应 = tp._自适应
	self.资源组 = {
		[1] = 自适应.创建(0,1,630,367,3,9),
		[2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),
		[3] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"确认升级"),
		[4] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"培养感情"),
		[5] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"开启功能"),
		[6] = {},
		[7] = 资源:载入('wzife.wd4',"网易WDF动画",0x22D22D6D),
		[8] = 自适应.创建(5,1,600,319,3,9),
		[9] = 资源:载入('wzife.wd1',"网易WDF动画",0x1f24a7ee).精灵,--竖线
		[10] = 自适应.创建(1,1,592,18,1,3,nil,18),
		[11] = 资源:载入('wzife.wd1',"网易WDF动画",0xECEDD9A8).精灵,--横线
		[12] ={}

	}
	self.魂环组={
		[1] = 资源:载入('shape.dll',"网易WDF动画",0x000D4719),
		[2] = 资源:载入('shape.dll',"网易WDF动画",0x000D4719),
		[3] = 资源:载入('shape.dll',"网易WDF动画",0x000D4719),
		[4] = 资源:载入('shape.dll',"网易WDF动画",0x000D4719),
		[5] = 资源:载入('shape.dll',"网易WDF动画",0x000D4719),
		[6] = 资源:载入('shape.dll',"网易WDF动画",0x000D4719),
		[7] = 资源:载入('shape.dll',"网易WDF动画",0x000D4719),

	}
	self.法相组={
		[1] = tp.资源:载入("shape.dll","网易WDF动画",0x001BBE3F),
		[2] = tp.资源:载入("shape.dll","网易WDF动画",0x001BBE3F),
		[3] = tp.资源:载入("shape.dll","网易WDF动画",0x001BBE3F),
		[4] = tp.资源:载入("shape.dll","网易WDF动画",0x001BBE3F),
		[5] = tp.资源:载入("shape.dll","网易WDF动画",0x001BBE3F),
		[6] = tp.资源:载入("shape.dll","网易WDF动画",0x001BBE3F),
		[7] = tp.资源:载入("shape.dll","网易WDF动画",0x001BBE3F),
		[8] = tp.资源:载入("shape.dll","网易WDF动画",0x001BBE3F),
		[9] = tp.资源:载入("shape.dll","网易WDF动画",0x001BBE3F),
		[10] = tp.资源:载入("shape.dll","网易WDF动画",0x001BBE3F),
		[11] = tp.资源:载入("shape.dll","网易WDF动画",0x001BBE3F),
		[12] = tp.资源:载入("shape.dll","网易WDF动画",0x001BBE3F),
		[13] = tp.资源:载入("shape.dll","网易WDF动画",0x001BBE3F),
		[14] = tp.资源:载入("shape.dll","网易WDF动画",0x001BBE3F),
		[15] = tp.资源:载入("shape.dll","网易WDF动画",0x001BBE3F),
		[16] = tp.资源:载入("shape.dll","网易WDF动画",0x001BBE3F),
		[17] = tp.资源:载入("shape.dll","网易WDF动画",0x001BBE3F),
		[18] = tp.资源:载入("shape.dll","网易WDF动画",0x001BBE3F),


	}
	self.异火组={
		青莲地心火 = tp.资源:载入("shape.dll","网易WDF动画",0x0021C4AB),
		虚无吞炎 =  tp.资源:载入("shape.dll","网易WDF动画",0x0021C4AB),
	}
	self.神器组={
		[1] = tp.资源:载入("shape.dll","网易WDF动画",0X0015159D),
		[2] = tp.资源:载入("shape.dll","网易WDF动画",0X0015159D),
		[3] = tp.资源:载入("shape.dll","网易WDF动画",0X0015159D),
		[4] = tp.资源:载入("shape.dll","网易WDF动画",0X0015159D),
		[5] = tp.资源:载入("shape.dll","网易WDF动画",0X0015159D),
		[6] = tp.资源:载入("shape.dll","网易WDF动画",0X0015159D),
		[7] = tp.资源:载入("shape.dll","网易WDF动画",0X0015159D),
		[8] = tp.资源:载入("shape.dll","网易WDF动画",0X0015159D),
		[9] = tp.资源:载入("shape.dll","网易WDF动画",0X0015159D),
		[10] = tp.资源:载入("shape.dll","网易WDF动画",0X0015159D),
		[11] = tp.资源:载入("shape.dll","网易WDF动画",0X0015159D),
		[12] = tp.资源:载入("shape.dll","网易WDF动画",0X0015159D),
		[13] = tp.资源:载入("shape.dll","网易WDF动画",0X0015159D),
		[14] = tp.资源:载入("shape.dll","网易WDF动画",0X0015159D),
		[15] = tp.资源:载入("shape.dll","网易WDF动画",0X0015159D),
		[16] = tp.资源:载入("shape.dll","网易WDF动画",0X0015159D),
		[17] = tp.资源:载入("shape.dll","网易WDF动画",0X0015159D),
		[18] = tp.资源:载入("shape.dll","网易WDF动画",0X0015159D),


	}
	self.资源组[9]:置区域(0,0,2,295)
	self.资源组[11]:置区域(0,0,345,2)


end

function 无名系统处理:显示(dt,x,y)
	self.焦点 = false
	self.资源组[2]:更新(x,y)
	if self.资源组[2]:事件判断() then
	   self.可视=false
	end
	self.资源组[3]:更新(x,y, self.数据.境界~=0 or self.数据.等级 ~= 0)
	self.资源组[4]:更新(x,y, self.数据.境界~=0 or self.数据.等级 ~= 0)
	self.资源组[5]:更新(x,y, self.数据.境界==0 and self.数据.等级 == 0)
	self.资源组[1]:显示(self.x,self.y)
	self.资源组[8]:显示(self.x+14,self.y+30)

	self.资源组[10]:显示(self.x+6,self.y+3)
	self.资源组[9]:显示(self.x+255,self.y+42)
	self.资源组[11]:显示(self.x+255,self.y+242)
	self.资源组[11]:显示(self.x+255,self.y+142)
	self.文字显示:置颜色(黄色)
	self.文字显示:显示(self.x+270,self.y+40,self.文本)
	self.文字显示:置颜色(黑色)
	--self.文字显示:显示(self.x+270,self.y+150,"名称:"..(self.数据.名称 or  "无"))
	--self.文字显示:显示(self.x+270,self.y+180,"类型:"..(self.数据.类型 or  "无"))
	self.文字显示:显示(self.x+270,self.y+180,"境界:"..self.境界)
	self.文字显示:显示(self.x+270,self.y+150,"品阶:"..(self.数据.等级 or 0))
	self.文字显示:显示(self.x+425,self.y+150,"当前经验:"..(self.数据.当前经验 or 0))
	self.文字显示:显示(self.x+425,self.y+180,"升级经验:"..(self.数据.升级经验 or 4))

	self.资源组[2]:显示(self.x+603,self.y+6)
	tp.窗口标题背景_:置区域(0,0,81,16)
	tp.窗口标题背景_:显示(self.x+272,self.y+3)
	zts1:置字间距(2)
	zts1:显示(self.x+281,self.y+3,"详细信息")
	zts1:置字间距(0)
	self.资源组[3]:显示(self.x+400,self.y+315,true)
	self.资源组[4]:显示(self.x+300,self.y+315,true)
	self.资源组[5]:显示(self.x+500,self.y+315,true)

	if tp.窗口_[tp.选中窗口]~=nil and tp.窗口_[tp.选中窗口].ID==self.ID then
			if self.资源组[3]:事件判断() then
		        发送数据(116,{序列=3,位置=self.位置})
			end
			if self.资源组[4]:事件判断() then
		        发送数据(116,{序列=4,位置=self.位置})
			end
			if self.资源组[5]:事件判断() then
		        发送数据(116,{序列=2,位置=self.位置})
			end
	end
	self.资源组[12]:更新(dt)
	self.资源组[12]:显示(self.x+self.补差.x,self.y-50+self.补差.y)


	if self.数据.境界~=nil and self.数据.等级~=0 then
	   if self.数据.等级==1 then
	   	  self.资源组[12]:置颜色(0XFF83c583)
	   elseif self.数据.等级==2 then
	   	  self.资源组[12]:置颜色(0XFF732d2b)
	   elseif self.数据.等级==3 then
	   	  self.资源组[12]:置颜色(0XFF735b2b)
	   elseif self.数据.等级==4 then
	   	  self.资源组[12]:置颜色(0XFFb2ab41)
	   elseif self.数据.等级==5 then
	   	  self.资源组[12]:置颜色(0XFF94be44)
	   elseif self.数据.等级==6 then
	   	  self.资源组[12]:置颜色(0XFF4fe14f)
	   elseif self.数据.等级==7 then
	   	  self.资源组[12]:置颜色(0XFF4fe1b9)
	   elseif self.数据.等级==8 then
	   	  self.资源组[12]:置颜色(0XFFfc1822)
	   end
	else
		self.资源组[12]:置颜色(1342177280)
	end
end

function 无名系统处理:检查点(x,y)
	if self.可视 and self.资源组 ~= nil and  self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 无名系统处理:初始移动(x,y)
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

function 无名系统处理:开始移动(x,y)
	if self.可视 and self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end





return 无名系统处理