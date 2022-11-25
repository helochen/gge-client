--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2020-08-18 18:19:41
--======================================================================--
local 场景类_任务栏 = class()
local ceil = math.ceil
local bw = require("gge包围盒")(0,0,148,18)
local box = 引擎.画矩形
local insert = table.insert
local remove = table.remove
local tp,task,font,fonts1
local min = math.min
local max = math.max
local mouseb = 引擎.鼠标弹起
local fb = {{"乌鸡国","#R/副本难度：低\n#L/找长安国子监吴举人进入副本\n#N/你在国子监中攻书，突然间倦意袭来，你悄然入睡。梦中却见一个人自称是乌鸡国王，前来请求你为他主持公道。原来这乌鸡国中主持朝政的乃是个妖精，他害了乌鸡国王，还变幻成国王的模样，硬生生让江山易主了三年。你听了非常气愤，誓要捉盒妖怪，还这世间一个朗朗乾坤。乌鸡国王告诉你，当初那妖精趁其不备，把他推入御花园的枯井中，还盖上了厚重的石板。他提供了一个重要的线索，他被害的地点在一丛非常茂盛的芭蕉旁......那妖精是何方神圣，居然如此肆无忌惮？怀着这样的疑问和要还乌鸡国王一个公道的决心，你和伙伴们踏上了征程......\n#L/消耗金钱：100000\n#L/参加级别：≥50级"},
{"车迟斗法","#R/副本难度：低\n#L/找长寿村慧觉和尚进入副本\n#N/话说某日，那车迟国突然来了三个道人。这三道人可不简单，似是法力无穷，无所不能，打坐存神，点石成金，呼风唤雨之术亦不在话下。    正逢那车迟国长年干旱，这三道人凭借神力帮助车迟国解决了旱情，国王大喜不已，遂尊三人为国师以助朝政。自此以后，车迟国唯“道”独尊，在道士的嚣张之下僧人都成了阶下之囚，一时间，众寺庙里再也看不到和尚，他们都屈服于道家的苦役......自古佛道并存，灭佛兴道之为，实乃天地难容！得知此事，三界热血豪杰纷纷表示愿意前往车迟国，意在解决众僧于苦难。眼下长寿村的慧觉和尚最近忧心重重的，据说与此事有关？三界侠士遂前往......\n#L/消耗金钱：100000\n#L/参加级别：≥50级"},
{"水陆大会","#R/副本难度：低\n#L/找化生寺疥癞和尚进入副本\n#N/唐王向来怀有佛心，近日选定良辰吉日，要选集诸僧，参禅讲法，修建水陆大会，超度冥府野鬼．遂敕令化生寺一干僧众修建道场，说届时前来同民众一起拈香拜佛，以慈悲心听圆满法。金山寺的玄奖法师品德高尚又通悉佛典，被选为坛主，负责道场的大小诸事．民间素闻玄奖法师有大智慧，听说他要开坛讲法，无不欢欣雀跃，纷纷自愿前来帮忙。化生寺人来人往，打造禅榻，装修功德，整理乐音，齐备物件，好不热闹．但是在阴暗的角落，有妖物阴森森的眼神注视着他们，牙齿发出摩擦的声音......这些妖物到底什么来头？要破坏这祥和的一切，它们的目会何在？我们能够保证水陆大会一切顺利吗？\n#L/消耗金钱：100000\n#L/参加级别：≥50级"},
{"通天河","#R/副本难度：高\n#L/找长寿村的蝴蝶女进入副本\n#N/唐僧师徒西行来到通天畔陈家庄，却见庄内灯烛荧煌、香烟馥郁，皆是一片诵经之声，蹊跷的是经幡之中竟杂挂着小儿物軎，真是闻所未闻。好奇之下，师徒决定前往借宿，竟探知这法事是为活蹦乱跳的两个孩童所设。师徒一行没有想到，从此会阴差阳错的落入了“灵感大王”的通天阴谋之中...\n#L/消耗金钱：300000\n#L/参加级别：≥60级"},
{"黑风山","#R/副本难度：高\n#L/找大唐国境小二进入副本\n#N/一队朋友真开心，整日在梦幻中游山玩水。这天一行五人在大唐国境游玩时，偶尔听到小二正在讲当地的趣事：“话说那镝山太保刘伯钦，怒喝一声，手举钢叉刺向恶虎。但见怒气纷纷，狂风滚滚，人虎斗做一团，只吓得白面和尚缩在草堆瑟瑟发抖.......”\n#L/消耗金钱：300000\n#L/参加级别：≥60级"},
{"大闹天宫","#R/副本难度：高\n#L/找长寿村太白金星进入副本\n#N/自你被玉帝封为齐天大圣以后，日日四方周游，交朋结义。一日，玉帝恐你闲来生事，特派太白金星前来诏你上天看管蟠桃园。本以为是一桩有吃有玩的美差，没想到却由此引出了一场惊天动地的天庭纷争……\n#L/消耗金钱：300000\n#L/参加级别：≥60级"},
{"秘境降妖","#R/副本难度：高\n#L/找长安城的御林军左统领进入副本\n#N/唐王自得宝镜之后，经常做噩梦。原来镜中妖魔作祟，又纠合了一群妖怪，想要拘唐王魂魄进入镜中，用唐王王者之气抵消自己的妖气，借以对抗镜中秘境的神仙。唐王睡梦之中被摄走魂魄，频频受噩梦困扰，镜中散仙又无力潛剿所有妖魔，只好请三界少侠再度帮忙，还镜中迷宫一个清净，让唐王做一个久违的好梦.\n#L/消耗金钱：300000\n#L/参加级别：≥60级"},
}

function 场景类_任务栏:初始化(根)
	self.ID = 19
	self.x = 313
	self.y = 125
	self.xx = 0
	self.yy = 0
	self.注释 = "任务栏"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	self.介绍文本 = 根._丰富文本(187,215)
	self.介绍文本:添加元素("ms",根.包子表情动画[85])
	self.选中 = 0
	self.加入 = 0
	self.介绍加入 = 0
	self.窗口时间 = 0
	self.状态 = 1
	task = 根.任务列表
	font = 根.字体表.人物字体_
	fonts1 = 根.字体表.描边字体
	tp = 根
end

function 场景类_任务栏:打开(数据)
	if self.可视 then
		self.选中 = 0
		self.加入 = 0
		self.介绍加入 = 0
		self.介绍文本:清空()
		self.可视 = false
		self.资源组 = nil
		return
	else
		insert(tp.窗口_,self)
		self.状态 = 1
	    tp.运行时间 = tp.运行时间 + 1
	  	self.窗口时间 = tp.运行时间
	    self.可视 = true
	    self:加载资源()
	    task={}
		if tp.剧情开关.任务追踪 then
			tp.窗口.任务追踪栏.task={}
		end
	    for n=1,#数据 do
         	self:添加(数据[n][1],数据[n][2],数据[n][3],数据[n][4])
	    end
	end
end

function 场景类_任务栏:刷新(数据)
	insert(tp.窗口_,self)
    task={}
	if tp.剧情开关.任务追踪 then
		tp.窗口.任务追踪栏.task={}
	end
    for n=1,#数据 do
     	self:添加(数据[n][1],数据[n][2],数据[n][3],数据[n][4])
    end
end

function 场景类_任务栏:加载资源()
	local 资源 = tp.资源
	local 按钮 = tp._按钮
	local 滑块 = tp._滑块
	local 自适应 = tp._自适应
	self.资源组 = {
		[1] = 自适应.创建(0,1,430,353,3,9),
		[2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),
		[3] = 按钮.创建(自适应.创建(20,4,18,19,4,3),0,0,4,true,true),
		[4] = 按钮.创建(自适应.创建(21,4,18,19,4,3),0,0,4,true,true),
		[5] = 按钮.创建(自适应.创建(20,4,18,19,4,3),0,0,4,true,true),
		[6] = 按钮.创建(自适应.创建(21,4,18,19,4,3),0,0,4,true,true),
		[7] =  滑块.创建(自适应.创建(11,4,15,40,2,3,nil),4,14,210,2),
		[10] = 滑块.创建(自适应.创建(11,4,15,40,2,3,nil),4,14,213,2),
		[11] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"已接任务"),
		[12] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"副本介绍"),
		[13] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"创建副本"),
		[14] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"取消创建"),
		[15] = 自适应.创建(4,1,1,1,3,nil),
		[16] = 自适应.创建(1,1,392,18,1,3,nil,18),
		[17] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"任务追踪"),
	}
	for n=2,6 do
	    self.资源组[n]:绑定窗口_(19)
	end
	for n=11,14 do
	    self.资源组[n]:绑定窗口_(19)
	end
end
function 场景类_任务栏:添加(名称_,介绍_,描述_,取中间数据_)
	insert(task,{名称=名称_,介绍=介绍_,描述=描述_,取中间数据=取中间数据_})
	if self.选中 ~= 0 and task[self.选中] ~= nil and task[self.选中].名称 == 名称_ then
		self.介绍文本:清空()
		self.介绍文本:添加文本("#L/◆"..task[self.选中].介绍)
		if 描述_ ~= nil then
			self.介绍文本:添加文本("")
			self.介绍文本:添加文本("")
			self.介绍文本:添加文本("#ms")
			self.介绍文本:添加文本("#L/"..描述_)
		end
		for i=1,#self.介绍文本.显示表 - 13 do
			self.介绍文本:滚动(1)
		end
	end
	if #task > 11 and self.加入 ~= 0 then
		self.资源组[7]:置起始点(self.资源组[7]:取百分比转换(self.加入+1,11,#task))
		self.加入 = min(ceil((#task-11)*self.资源组[7]:取百分比()),#task-11)
	end
end

function 场景类_任务栏:修改内容(名称,内容,描述,取中间数据_)
	for i=1,#task do
		if task[i].名称 == 名称 then
		   	task[i].介绍 = 内容
		   	task[i].描述 = 描述
		   	if self.选中 ~= 0 and task[self.选中].名称 == 名称  then
		   		self.介绍文本:清空()
				if 描述 ~= nil then
					self.介绍文本:添加文本("")
					self.介绍文本:添加文本("")
					self.介绍文本:添加文本("#ms")
					self.介绍文本:添加文本("#L/"..描述)
				end
				for i=1,#self.介绍文本.显示表 - 13 do
					self.介绍文本:滚动(1)
				end
				self.资源组[10]:置起始点(0)
				self.介绍加入 = 0
		   	end
		   	break
		end
	end
end

function 场景类_任务栏:是否有该任务(名称)
	for i=1,#task do
		if task[i].名称 == 名称 then
			return task[i]
		end
	end
	return 0
end

function 场景类_任务栏:删除(名称)
	for i=1,#task do
	    if task[i].名称 == 名称 then
			if task[i].名称=="摄妖香" then
			    引擎.场景.摄妖香剩余功效时辰=0
			end
	    	if #task > 12 then
		    	self.资源组[7]:置起始点(self.资源组[7]:取百分比转换(self.加入-1,11,#task))
		    	self.选中 = self.选中 - 1
		    else
		    	self.选中 = max(self.选中 - 1,0)
		    	self.加入 = 0
		    end
	    	if self.状态 == 1 and self.选中 ~= 0 and 名称 == task[self.选中].名称 then
	    		self.介绍文本:清空()
	    	end
		   	remove(task,i)
		   	break
		end
	end
end

function 场景类_任务栏:显示(dt,x,y)
	self.焦点 = false
	self.资源组[2]:更新(x,y)
	self.资源组[11]:更新(x,y,self.状态~=1)
	self.资源组[12]:更新(x,y,self.状态~=2)
	self.资源组[3]:更新(x,y,self.加入 > 0)
	self.资源组[4]:更新(x,y,self.加入 < #task - 11)
	self.资源组[5]:更新(x,y,self.介绍加入 > 0)
	self.资源组[6]:更新(x,y,self.介绍加入 < #self.介绍文本.显示表 - 13)
	if self.资源组[2]:事件判断() then
		self:打开()
		return false
	elseif self.资源组[3]:事件判断() then
		self.资源组[7]:置起始点(self.资源组[7]:取百分比转换(self.加入-1,11,#task))
	elseif self.资源组[4]:事件判断() then
		self.资源组[7]:置起始点(self.资源组[7]:取百分比转换(self.加入+1,11,#task))
	elseif self.资源组[5]:事件判断() then
		self.资源组[10]:置起始点(self.资源组[10]:取百分比转换(self.介绍加入-1,13,#self.介绍文本.显示表))
	elseif self.资源组[6]:事件判断() then
		self.资源组[10]:置起始点(self.资源组[10]:取百分比转换(self.介绍加入+1,13,#self.介绍文本.显示表))
	elseif self.资源组[11]:事件判断() or self.资源组[12]:事件判断()  then
		if self.状态 == 2 then
			self.状态 = 1
			bw:置宽高(148,18)
			self.介绍文本.宽度,self.介绍文本.默认宽度,self.介绍文本.高度 = 187,187,215
		else
			self.状态 = 2
			bw:置宽高(108,18)
			self.介绍文本.宽度,self.介绍文本.默认宽度,self.介绍文本.高度 = 205,205,215
		end
		self.选中 = 0
		self.加入 = 0
		self.介绍加入 = 0
		self.介绍文本:清空()
		self.资源组[10]:置起始点(0)
	end
	self.资源组[1]:显示(self.x,self.y)
	self.资源组[16]:显示(self.x+6,self.y+3)
	self.资源组[2]:显示(self.x + 403,self.y + 6)
	tp.窗口标题背景_:置区域(0,0,80,16)
	tp.窗口标题背景_:显示(self.x+169,self.y+3)
	fonts1:置字间距(2)
	fonts1:显示(self.x+176,self.y+3,"任务提示")
	self.资源组[11]:显示(self.x + 20,self.y + 30,nil,nil,nil,self.状态==1,2)
	self.资源组[12]:显示(self.x + 100,self.y + 30,nil,nil,nil,self.状态==2,2)
	if self.状态 == 1 then
		self.资源组[15]:置宽高(159,251)
		self.资源组[15]:显示(self.x+15,self.y+63)
		self.资源组[15]:置宽高(190,251)
		self.资源组[15]:显示(self.x+204,self.y+63)
		fonts1:置字间距(10)
		fonts1:显示(self.x+52,self.y+68,"任务列表")
		fonts1:显示(self.x+259,self.y+68,"任务详细")
		tp.画线:置区域(0,0,15,209)
		tp.画线:显示(self.x+179,self.y+85)
		tp.画线:显示(self.x+399,self.y+85)
		self.资源组[3]:显示(self.x + 176,self.y + 66)
		self.资源组[4]:显示(self.x + 176,self.y + 294)
		self.资源组[5]:显示(self.x + 396,self.y + 66)
		self.资源组[6]:显示(self.x + 396,self.y + 294)
		if #task > 11 then
			self.加入 = min(ceil((#task-11)*self.资源组[7]:取百分比()),#task-11)
			self.资源组[7]:显示(self.x + 176,self.y + 84,x,y,self.鼠标)
		end
		if #self.介绍文本.显示表 > 13 then
			self.介绍加入 = min(ceil((#self.介绍文本.显示表-13)*self.资源组[10]:取百分比()),#self.介绍文本.显示表-13)
			self.介绍文本.加入 = self.介绍加入
			self.资源组[10]:显示(self.x + 395,self.y + 84,x,y,self.鼠标)
		end
		font:置颜色(-16777216)
		font:置阴影颜色(nil)
		local wzzb = 0
		for n=1,11 do
			if((n + self.加入) <= (11 + self.加入)) and task[n + self.加入]~=nil and task[n + self.加入].名称~="摄妖香"then
				wzzb=wzzb+1
				bw:置坐标(self.x + 17,self.y + 89 + (wzzb-1)*19.5)
				if self.选中 ~= self.加入 + n then
					if bw:检查点(x,y) then
						box(self.x + 21,self.y + 93 + (wzzb-1)*19.5,self.x + 169,self.y + 93 + (wzzb-1)*19.5+18,-3551379)
						if mouseb(0) and self.鼠标 and not tp.消息栏焦点 then
							self.选中 = n + self.加入
							self.介绍文本:清空()
							self.介绍文本:添加文本("#L/◆"..task[self.选中].介绍)
							if task[self.选中].描述 ~= nil then
								self.介绍文本:添加文本("")
								self.介绍文本:添加文本("")
							    self.介绍文本:添加文本("#ms")
							    self.介绍文本:添加文本("#L/"..task[self.选中].描述)
							end
							for i=1,#self.介绍文本.显示表 - 13 do
								self.介绍文本:滚动(1)
							end
							self.资源组[10]:置起始点(0)
							self.介绍加入 = 0
						end
						self.焦点 = true
					end
				else
					local ys = -10790181
					if bw:检查点(x,y) then
						ys = -9670988
						self.焦点 = true
					end
					box(self.x + 21,self.y + 93 + (wzzb-1)*19.5,self.x + 169,self.y + 93 + (wzzb-1)*19.5+18,ys)
				end
				font:显示(self.x+30,self.y+95+(wzzb-1)*19.5,task[n + self.加入].名称)
			end
		end
		self.介绍文本:显示(self.x + 208,self.y + 95.5)
		self.资源组[17]:更新(x,y)
		if self.资源组[17]:事件判断() then
			tp.剧情开关.任务追踪 = not tp.剧情开关.任务追踪
		end
		self.资源组[17]:显示(self.x+23,self.y+320)
	elseif self.状态 == 2 then
		self.资源组[15]:置宽高(129,252)
		self.资源组[15]:显示(self.x+15,self.y+63)
		self.资源组[15]:置宽高(220,252)
		tp.画线:置区域(0,0,15,228)
		self.资源组[15]:显示(self.x+171,self.y+63)
		tp.画线:显示(self.x+149,self.y+68)
		tp.画线:显示(self.x+396,self.y+68)
		self.资源组[3]:显示(self.x + 146,self.y + 64)
		self.资源组[4]:显示(self.x + 146,self.y + 296)
		self.资源组[5]:显示(self.x + 393,self.y + 64)
		self.资源组[6]:显示(self.x + 393,self.y + 296)
		fonts1:置字间距(3)
		fonts1:显示(self.x+43,self.y+68,"副本列表")
		fonts1:置字间距(10)
		fonts1:显示(self.x+243,self.y+68,"副本详细")
		if #self.介绍文本.显示表 > 13 then
			self.介绍加入 = min(ceil((#self.介绍文本.显示表-13)*self.资源组[10]:取百分比()),#self.介绍文本.显示表-13)
			self.介绍文本.加入 = self.介绍加入
			self.资源组[10]:显示(self.x + 393,self.y + 83,x,y,self.鼠标)
		end
		self.资源组[13]:更新(x,y,self.选中 ~= 0)
		self.资源组[14]:更新(x,y,tp.剧情开关.进入副本 ~= false)
		if self.资源组[13]:事件判断() then
			--self:副本解析(fb[self.选中][1])
		elseif self.资源组[14]:事件判断() then
			--tp.剧情开关.进入副本 = false
			--tp.提示:写入("#Y/你取消了副本任务")
			--tp.窗口.任务栏:删除("副本任务")
		end
		for i=0,1 do
			self.资源组[13+i]:显示(self.x + i * 200 + 80,self.y + 320)
		end
		font:置颜色(-16777216)
		for n=1,7 do
			bw:置坐标(self.x + 14,self.y + 91 + (n-1)*19.5)
			if self.选中 ~= self.加入 + n then
			if bw:检查点(x,y) then
					box(self.x + 20,self.y + 95 + (n-1)*19.5,self.x + 136,self.y + 95 + (n-1)*19.5+18,-3551379)
					if mouseb(0) and self.鼠标 and not tp.消息栏焦点 then
						self.选中 = n
						self.介绍文本:清空()
						self.介绍文本:添加文本(fb[self.选中][2])
						for i=1,#self.介绍文本.显示表 - 13 do
							self.介绍文本:滚动(1)
						end
						self.资源组[10]:置起始点(0)
						self.介绍加入 = 0
					end
					self.焦点 = true
				end
			else
				local ys = -10790181
				if bw:检查点(x,y) then
					ys = -9670988
					self.焦点 = true
				end
				box(self.x + 20,self.y + 95 + (n-1)*19.5,self.x + 136,self.y + 95 + (n-1)*19.5+18,ys)
			end
			font:显示(self.x+30,self.y+97+(n-1)*19.5,fb[n][1])
			self.介绍文本:显示(self.x + 180,self.y + 98.5)
		end
	end
	fonts1:置字间距(0)
	if self.资源组[7].接触 or self.资源组[10].接触 then
		self.焦点 = true
	end
end

function 场景类_任务栏:副本解析(副本)
	if tp.剧情开关.进入副本 ~= false or tp.剧情开关.副本 ~= false then
		tp.提示:写入("#Y/你已经创建了一个副本了")
		return false
	end
	if 副本 == "乌鸡国" then
		tp.剧情开关.进入副本 = {"乌鸡国",100000,50,3}
		tp.提示:写入("#Y/你已经开启了乌鸡国副本任务，前往长安国子监书库吴举人处进入副本")
		tp.窗口.任务栏:添加("副本任务","你已经开启了乌鸡国副本任务，前往长安国子监书库吴举人处进入副本")
	elseif 副本 == "车迟斗法" then
		tp.剧情开关.进入副本 = {"车迟斗法",100000,50,3}
		tp.提示:写入("#Y/你已经开启了车迟斗法副本任务，前往长寿村慧觉和尚处进入副本")
		tp.窗口.任务栏:添加("副本任务","你已经开启了车迟斗法副本任务，前往长寿村慧觉和尚处进入副本")
	elseif 副本 == "水陆大会" then
		tp.剧情开关.进入副本 = {"水陆大会",100000,50,3}
		tp.提示:写入("#Y/你已经开启了水陆大会副本任务，前往化生寺疥癞和尚处进入副本")
		tp.窗口.任务栏:添加("副本任务","你已经开启了水陆大会副本任务，前往化生寺疥癞和尚处进入副本")
	elseif 副本 == "通天河" then
		tp.剧情开关.进入副本 = {"通天河",300000,60,3}
		tp.提示:写入("#Y/你已经开启了通天河副本任务，前往长寿村蝴蝶女处进入副本")
		tp.窗口.任务栏:添加("副本任务","你已经开启了通天河副本任务，前往长寿村蝴蝶女处进入副本")
	elseif 副本 == "黑风山" then
		tp.剧情开关.进入副本 = {"黑风山",300000,60,3}
		tp.提示:写入("#Y/你已经开启了黑风山副本任务，前往大唐国境小二处进入副本")
		tp.窗口.任务栏:添加("副本任务","你已经开启了通天河副本任务，前往大唐国境小二处进入副本")
	elseif 副本 == "大闹天宫" then
		tp.剧情开关.进入副本 = {"大闹天宫",300000,60,3}
		tp.提示:写入("#Y/你已经开启了大闹天宫副本任务，前往长寿村太白金星处进入副本")
		tp.窗口.任务栏:添加("副本任务","你已经开启了大闹天宫副本任务，前往长寿村太白金星处进入副本")
	elseif 副本 == "秘境降妖" then
		tp.剧情开关.进入副本 = {"秘境降妖",300000,60,3}
		tp.提示:写入("#Y/你已经开启了秘境降妖副本任务，前往长安城御林军左统领处进入副本")
		tp.窗口.任务栏:添加("副本任务","你已经开启了秘境降妖副本任务，前往长安城御林军左统领处进入副本")
	end
end

function 场景类_任务栏:检查点(x,y)
	if self.资源组~= nil and self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 场景类_任务栏:初始移动(x,y)
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

function 场景类_任务栏:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 场景类_任务栏