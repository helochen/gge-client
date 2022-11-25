
local 场景类_宠物合宠栏 = class()
local bw = require("gge包围盒")(0,0,120,37)
local box = 引擎.画矩形
local remove = table.remove
local insert = table.insert
local random = 引擎.取随机整数
local min = math.min
local cfs = 删除重复
local tss = 引擎.取天生
local qmxs = 引擎.取战斗模型
local mouseb = 引擎.鼠标弹起
local tx = 引擎.取头像
local yx = {{68,4},{25,28},{111,28},{24,75},{111,75},{68,97}}
local zts,tp,zts1
local insert = table.insert
local bw1 = require("gge包围盒")(0,0,120,43)
local qmx = 引擎.取模型
function 场景类_宠物合宠栏:初始化(根)
	self.ID = 16
	self.x = 0
	self.y = 0
	self.xx = 0
	self.yy = 0
	self.注释 = "宠物合宠栏"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	tp = 根
	self.主状态=1
	self.副状态=1
	self.主选择=nil
	self.主选择认证=nil
	self.主选择界面=false
	self.副选择=nil
	self.副选择界面=false
	self.副选择认证=nil
	self.主头像组 = {}
	self.副头像组 = {}
	self.主加入 = 0
	self.主技能加入 = 0
	self.主内丹数据 = nil
	self.副加入 = 0
	self.副技能加入 = 0
	self.副内丹数据 = nil
	self.主宠 = nil
	self.副宠 = nil
	self.开始 = 1
	self.结束 = 20
	self.窗口时间 = 0
	zts = tp.字体表.普通字体
	zts1 = tp.字体表.描边字体
	ztx = tp.字体表.普通字体_
	self.时间 = 0
end

function 场景类_宠物合宠栏:加载资源()
	local 按钮 = tp._按钮
	local 资源 = tp.资源
	local 自适应 = tp._自适应
	local 物品 = tp._物品格子
	self.资源组 = {
		[0] = 自适应.创建(1,1,535,18,1,3,nil,18),
		[1] = 自适应.创建(0,1,570,450,3,9),
		[2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),
		[3] = 按钮.创建(自适应.创建(12,4,55,22,1,3),0,0,4,true,true,"合宠"),
		[4] = 按钮.创建(自适应.创建(12,4,55,22,1,3),0,0,4,true,true,"选择"),
		[5] = 按钮.创建(自适应.创建(12,4,55,22,1,3),0,0,4,true,true,"选择"),
		[6] = 自适应.创建(2,1,130,117,3,9),
		[7] = 自适应.创建(3,1,148,20,1,3),
		[8] = 按钮.创建(资源:载入('wzife.wd4',"网易WDF动画",0x1F996671),0,0,4,true,true),
		[9] = 按钮.创建(资源:载入('wzife.wd4',"网易WDF动画",0x9C24F376),0,0,4,true,true),
		[10] = 按钮.创建(资源:载入('wzife.wd4',"网易WDF动画",0xCD999F0B),0,0,4,true,true),
		[11] = 资源:载入('wzife.wd1',"网易WDF动画",0x68D384BD),
		[12] = 资源:载入('wzife.wd1',"网易WDF动画",0x7367031D),
		[13] = 资源:载入('wzife.wd1',"网易WDF动画",0x1E714129),
		[14] = 资源:载入('wzife.wd1',"网易WDF动画",0xF2FC2425),
		[15] = 按钮.创建(资源:载入('wzife.wd4',"网易WDF动画",0x1F996671),0,0,4,true,true),
		[16] = 按钮.创建(资源:载入('wzife.wd4',"网易WDF动画",0x9C24F376),0,0,4,true,true),
		[17] = 按钮.创建(资源:载入('wzife.wd4',"网易WDF动画",0xCD999F0B),0,0,4,true,true),
		[18] = 自适应.创建(0,1,170,240,3,9),
		[19] = 按钮.创建(自适应.创建(20,4,18,19,4,3),0,0,4,true,true),
		[20] = 按钮.创建(自适应.创建(21,4,18,19,4,3),0,0,4,true,true),
		[21] =  tp._滑块.创建(自适应.创建(11,4,15,40,2,3,nil),4,14,177,2),
		[22] = 资源:载入('wzife.wdf',"网易WDF动画",0x363AAF1B),
		[23] = 按钮.创建(自适应.创建(20,4,18,19,4,3),0,0,4,true,true),
		[24] = 按钮.创建(自适应.创建(21,4,18,19,4,3),0,0,4,true,true),
		[25] =  tp._滑块.创建(自适应.创建(11,4,15,40,2,3,nil),4,14,177,2),
		[26] = 资源:载入('wzife.wd1',"网易WDF动画",0x68D384BD),
	}
	for n=2,5 do
		self.资源组[n]:绑定窗口_(16)
	end
	for n=8,10 do
		self.资源组[n]:绑定窗口_(16)
	end
	for n=15,17 do
		self.资源组[n]:绑定窗口_(16)
	end
	for n=19,20 do
		self.资源组[n]:绑定窗口_(16)
	end
	for n=23,24 do
		self.资源组[n]:绑定窗口_(16)
	end
	self.主上页=按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0x7AB5584C),0,0,4,true,true)
    self.主下页=按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0xCB50AB1D),0,0,4,true,true)
    self.副上页=按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0x7AB5584C),0,0,4,true,true)
    self.副下页=按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0xCB50AB1D),0,0,4,true,true)
	self.物品 = {}
	for i=1,180 do
		self.物品[i] = 物品.创建(0,0,i,"合宠物品")
	end
	self.主技能 = {}
	self.副技能 = {}
	local jn = tp._技能格子
	for i=1,24 do
	    self.主技能[i] = jn(0,0,i,"主召唤兽资质技能")
	end
	for i=1,24 do
	    self.副技能[i] = jn(0,0,i,"副召唤兽资质技能")
	end
	self.合宠物品 = 物品.创建(0,0,0,"合宠_物品")
	self.合宠物品:置根(tp)
	self.主认证格子=jn(0,0,i,"主召唤兽资质技能")
	self.副认证格子=jn(0,0,i,"副召唤兽资质技能")
end

function 场景类_宠物合宠栏:打开(数据)
	if self.可视 then
		self.可视 = false
		self.主选择=nil
		self.副选择=nil
		self.主宠 = nil
		self.副宠 = nil
		self.主选择界面=false
		self.副选择界面=false
		self.主选择认证 = nil
	    self.副选择认证 = nil
	    self.资源组=nil
	    self.主上页=nil
	    self.主下页=nil
	    self.副上页=nil
	    self.副下页=nil
	    self.物品=nil
	    self.主技能=nil
	    self.副技能=nil
	    self.合宠物品=nil
	    self.主认证格子=nil
	    self.副认证格子=nil
	    return
	else
		insert(tp.窗口_,self)
		self:加载资源()
		self.x = (全局游戏宽度/2)-220
		self.y = (全局游戏高度/2)-200
	    tp.运行时间 = tp.运行时间 + 1
	    self.窗口时间 = tp.运行时间
	    self.可视 = true
	    self.合宠物品.物品 = nil
	    self.主选择认证 = nil
	    self.副选择认证 = nil
	    self.主选择=nil
		self.副选择=nil
		self.主宠 = nil
		self.副宠 = nil
		self.主状态=1
		self.副状态=1
		self.时间 = 0
	end
end

function 场景类_宠物合宠栏:清除()
 	tp.窗口.召唤兽属性栏:刷新()
	self.合宠物品:置物品(nil)
	self.主召唤兽 = nil
	self.副召唤兽 = nil
	self.主选择 = nil
	self.副选择 = nil
	self.主选择认证 = nil
	self.副选择认证 = nil
	self.主状态=1
	self.副状态=1
end

function 场景类_宠物合宠栏:主置形象()
	self.资源组[28]=nil
	self.资源组[29]=nil
	if tp.队伍[1].宝宝列表[self.主召唤兽]  ~= nil and self.主召唤兽 ~= 0 then
		local 模型=tp.队伍[1].宝宝列表[self.主召唤兽].模型
		if tp.队伍[1].宝宝列表[self.主召唤兽].进阶 and tp.队伍[1].宝宝列表[self.主召唤兽].还原造型==nil then
			模型="进阶"..模型
		end
		local n = qmxs(模型)
		self.主宠 = tp.资源:载入(n[10],"网易WDF动画",n[6])
		if tp.队伍[1].宝宝列表[self.主召唤兽].饰品 ~= nil then
			n = qmxs("饰品_"..模型)
			self.资源组[28] = tp.资源:载入(n[10],"网易WDF动画",n[6])
		end
		if tp.队伍[1].宝宝列表[self.主召唤兽].染色方案 ~= nil then
			self.主宠:置染色(tp.队伍[1].宝宝列表[self.主召唤兽].染色方案,tp.队伍[1].宝宝列表[self.主召唤兽].染色组[1],tp.队伍[1].宝宝列表[self.主召唤兽].染色组[2],tp.队伍[1].宝宝列表[self.主召唤兽].染色组[3],tp.队伍[1].宝宝列表[self.主召唤兽].染色组[4])
			self.主宠:置方向(0)
		end
	end
end

function 场景类_宠物合宠栏:副置形象()
	self.资源组[30]=nil
	self.资源组[31]=nil
	if tp.队伍[1].宝宝列表[self.副召唤兽]  ~= nil and self.副召唤兽 ~= 0 then
		local 模型=tp.队伍[1].宝宝列表[self.副召唤兽].模型
		if tp.队伍[1].宝宝列表[self.副召唤兽].进阶 and tp.队伍[1].宝宝列表[self.副召唤兽].还原造型==nil then
			模型="进阶"..模型
		end
		local n = qmxs(模型)
		self.副宠 = tp.资源:载入(n[10],"网易WDF动画",n[6])
		if tp.队伍[1].宝宝列表[self.副召唤兽].饰品 ~= nil then
			n = qmxs("饰品_"..模型)
			self.资源组[30] = tp.资源:载入(n[10],"网易WDF动画",n[6])
		end
		if tp.队伍[1].宝宝列表[self.副召唤兽].染色方案 ~= nil then
			self.副宠:置染色(tp.队伍[1].宝宝列表[self.副召唤兽].染色方案,tp.队伍[1].宝宝列表[self.副召唤兽].染色组[1],tp.队伍[1].宝宝列表[self.副召唤兽].染色组[2],tp.队伍[1].宝宝列表[self.副召唤兽].染色组[3],tp.队伍[1].宝宝列表[self.副召唤兽].染色组[4])
			self.副宠:置方向(0)
		end
	end
end

function 场景类_宠物合宠栏:显示(dt,x,y)
	if tp.窗口.宠物状态栏.可视 then
		tp.窗口.宠物状态栏:打开()
	end
	local bblb = tp.队伍[1].宝宝列表
	self.焦点 = false
	self.资源组[2]:更新(x,y)
	self.资源组[3]:更新(x,y)
	self.资源组[4]:更新(x,y)
	self.资源组[5]:更新(x,y)
	self.资源组[8]:更新(x,y)
	self.资源组[9]:更新(x,y)
	self.资源组[10]:更新(x,y,false)
	self.资源组[15]:更新(x,y)
	self.资源组[16]:更新(x,y)
	self.资源组[17]:更新(x,y,false)
	if self.主宠 ~= nil then
		self.主宠:更新(dt)
	end
	if self.副宠 ~= nil then
		self.副宠:更新(dt)
	end
	self.资源组[1]:显示(self.x,self.y)
	self.资源组[0]:显示(self.x+6,self.y+3)
	-- tp.窗口标题背景_:置区域(0,0,74,16)
	-- tp.窗口标题背景_:显示(self.x+245,self.y+3)
	zts1:置颜色(白色):显示(self.x+259,self.y+2,"合  宠")
	zts1:置颜色(白色):显示(self.x+254,self.y+32,"合宠材料")
	self.资源组[6]:置宽高(210,120)
	for i=1,2 do
		self.资源组[6]:显示(self.x + 15 + (i-1) * 330, self.y + 28)
		self.资源组[7]:显示(self.x + 15 + (i-1) * 330, self.y + 160)
		ztx:置颜色(白色):显示(self.x + 15 + (i-1) * 330, self.y + 191,"攻击资质:")
		ztx:置颜色(白色):显示(self.x + 135 + (i-1) * 330, self.y + 191,"法力资质:")
		ztx:置颜色(白色):显示(self.x + 15 + (i-1) * 330, self.y + 211,"防御资质:")
		ztx:置颜色(白色):显示(self.x + 135 + (i-1) * 330, self.y + 211,"速度资质:")
		ztx:置颜色(白色):显示(self.x + 15 + (i-1) * 330, self.y + 231,"体力资质:")
		ztx:置颜色(白色):显示(self.x + 135 + (i-1) * 330, self.y + 231,"躲闪资质:")
		ztx:置颜色(白色):显示(self.x + 15 + (i-1) * 330, self.y + 251,"寿 命:")
		ztx:置颜色(白色):显示(self.x + 135 + (i-1) * 330, self.y + 251,"成 长:")
		ztx:置颜色(白色):显示(self.x + 15 + (i-1) * 330, self.y + 271,"五 行:")
	end
	if self.主选择 ~= nil then
		local 主宝宝 = bblb[self.主选择]
		if 主宝宝~=nil then
			zts:置颜色(黑色):显示(self.x + 20, self.y + 163,主宝宝.名称 .. "  "..主宝宝.等级.."级")
			ztx:置颜色(白色):显示(self.x + 80, self.y + 191,主宝宝.攻击资质)
			ztx:置颜色(白色):显示(self.x + 200, self.y + 191,主宝宝.法力资质)
			ztx:置颜色(白色):显示(self.x + 80, self.y + 211,主宝宝.防御资质)
			ztx:置颜色(白色):显示(self.x + 200, self.y + 211,主宝宝.速度资质)
			ztx:置颜色(白色):显示(self.x + 80, self.y + 231,主宝宝.体力资质)
			ztx:置颜色(白色):显示(self.x + 200, self.y + 231,主宝宝.躲闪资质)
			ztx:置颜色(白色):显示(self.x + 80, self.y + 251,主宝宝.寿命)
			ztx:置颜色(白色):显示(self.x + 200, self.y + 251,主宝宝.成长)
			ztx:置颜色(白色):显示(self.x + 80, self.y + 271,主宝宝.五行)
		else
		    zts:置颜色(黑色):显示(self.x + 20, self.y + 163,"请选择召唤兽->")
			ztx:置颜色(白色):显示(self.x + 80, self.y + 191,"-")
			ztx:置颜色(白色):显示(self.x + 200, self.y + 191,"-")
			ztx:置颜色(白色):显示(self.x + 80, self.y + 211,"-")
			ztx:置颜色(白色):显示(self.x + 200, self.y + 211,"-")
			ztx:置颜色(白色):显示(self.x + 80, self.y + 231,"-")
			ztx:置颜色(白色):显示(self.x + 200, self.y + 231,"-")
			ztx:置颜色(白色):显示(self.x + 80, self.y + 251,"-")
			ztx:置颜色(白色):显示(self.x + 200, self.y + 251,"-")
			ztx:置颜色(白色):显示(self.x + 80, self.y + 271,"-")
		end
	elseif self.主选择 == nil then
		zts:置颜色(黑色):显示(self.x + 20, self.y + 163,"请选择召唤兽->")
		ztx:置颜色(白色):显示(self.x + 80, self.y + 191,"-")
		ztx:置颜色(白色):显示(self.x + 200, self.y + 191,"-")
		ztx:置颜色(白色):显示(self.x + 80, self.y + 211,"-")
		ztx:置颜色(白色):显示(self.x + 200, self.y + 211,"-")
		ztx:置颜色(白色):显示(self.x + 80, self.y + 231,"-")
		ztx:置颜色(白色):显示(self.x + 200, self.y + 231,"-")
		ztx:置颜色(白色):显示(self.x + 80, self.y + 251,"-")
		ztx:置颜色(白色):显示(self.x + 200, self.y + 251,"-")
		ztx:置颜色(白色):显示(self.x + 80, self.y + 271,"-")
	end
	if self.副选择 ~= nil then
		local 副宝宝 = bblb[self.副选择]
		if 副宝宝~=nil then
			zts:置颜色(黑色):显示(self.x + 20 + 330 , self.y + 163,副宝宝.名称 .. "  "..副宝宝.等级.."级")
			ztx:置颜色(白色):显示(self.x + 80 + 330, self.y + 191,副宝宝.攻击资质)
			ztx:置颜色(白色):显示(self.x + 200 + 330, self.y + 191,副宝宝.法力资质)
			ztx:置颜色(白色):显示(self.x + 80 + 330, self.y + 211,副宝宝.防御资质)
			ztx:置颜色(白色):显示(self.x + 200 + 330, self.y + 211,副宝宝.速度资质)
			ztx:置颜色(白色):显示(self.x + 80 + 330, self.y + 231,副宝宝.体力资质)
			ztx:置颜色(白色):显示(self.x + 200 + 330, self.y + 231,副宝宝.躲闪资质)
			ztx:置颜色(白色):显示(self.x + 80 + 330, self.y + 251,副宝宝.寿命)
			ztx:置颜色(白色):显示(self.x + 200 + 330, self.y + 251,副宝宝.成长)
			ztx:置颜色(白色):显示(self.x + 80 + 330, self.y + 271,副宝宝.五行)
		else
		    zts:置颜色(黑色):显示(self.x + 20 + 330 , self.y + 163,"请选择召唤兽->")
			ztx:置颜色(白色):显示(self.x + 80 + 330, self.y + 191,"-")
			ztx:置颜色(白色):显示(self.x + 200 + 330, self.y + 191,"-")
			ztx:置颜色(白色):显示(self.x + 80 + 330, self.y + 211,"-")
			ztx:置颜色(白色):显示(self.x + 200 + 330, self.y + 211,"-")
			ztx:置颜色(白色):显示(self.x + 80 + 330, self.y + 231,"-")
			ztx:置颜色(白色):显示(self.x + 200 + 330, self.y + 231,"-")
			ztx:置颜色(白色):显示(self.x + 80 + 330, self.y + 251,"-")
			ztx:置颜色(白色):显示(self.x + 200 + 330, self.y + 251,"-")
			ztx:置颜色(白色):显示(self.x + 80 + 330, self.y + 271,"-")
		end
	elseif self.副选择 == nil then
		zts:置颜色(黑色):显示(self.x + 20 + 330 , self.y + 163,"请选择召唤兽->")
		ztx:置颜色(白色):显示(self.x + 80 + 330, self.y + 191,"-")
		ztx:置颜色(白色):显示(self.x + 200 + 330, self.y + 191,"-")
		ztx:置颜色(白色):显示(self.x + 80 + 330, self.y + 211,"-")
		ztx:置颜色(白色):显示(self.x + 200 + 330, self.y + 211,"-")
		ztx:置颜色(白色):显示(self.x + 80 + 330, self.y + 231,"-")
		ztx:置颜色(白色):显示(self.x + 200 + 330, self.y + 231,"-")
		ztx:置颜色(白色):显示(self.x + 80 + 330, self.y + 251,"-")
		ztx:置颜色(白色):显示(self.x + 200 + 330, self.y + 251,"-")
		ztx:置颜色(白色):显示(self.x + 80 + 330, self.y + 271,"-")
	end
	self.资源组[2]:显示(self.x + 547,self.y + 6)
	self.资源组[3]:显示(self.x + 256,self.y + 125)
	tp.物品格子背景_:显示(self.x+257,self.y+55)
	self.合宠物品:置坐标(self.x+259,self.y+55)
	self.合宠物品:显示(dt,x,y,self.鼠标)
	tp.竖排花纹背景_:置区域(0,0,20,280)
	tp.竖排花纹背景_:显示(self.x+264,self.y+162)
	tp.竖排花纹背景_:显示(self.x+284,self.y+162)
	self.资源组[4]:显示(self.x + 170,self.y + 159)
	self.资源组[5]:显示(self.x + 500,self.y + 159)
	self.资源组[8]:显示(self.x + 210,self.y + 297,nil,nil,nil,self.主状态==1,2)
	self.资源组[9]:显示(self.x + 210,self.y + 342,nil,nil,nil,self.主状态==2,2)
	self.资源组[10]:显示(self.x + 210,self.y + 387)
	self.资源组[15]:显示(self.x + 540,self.y + 297,nil,nil,nil,self.副状态==1,2)
	self.资源组[16]:显示(self.x + 540,self.y + 342,nil,nil,nil,self.副状态==2,2)
	self.资源组[17]:显示(self.x + 540,self.y + 387)

	if self.资源组[2]:事件判断() then
    	self:打开()
    	return
    elseif self.资源组[3]:事件判断() then
    	if self.主选择认证 == nil or self.副选择认证 == nil then
    		tp.提示:写入("#Y/请先选择需要合成的召唤兽")
    		return
    	elseif self.主选择认证 == self.副选择认证 then
    		tp.提示:写入("#Y/同一只召唤兽怎么合成呢？")
    		return
    	end
    	if (os.time() - self.时间 > 1 or self.时间 == 0) then
    		self.时间 = os.time()
    		发送数据(5009,{序列=self.主选择认证,序列1=self.副选择认证})
    		self:清除()
    	end
    elseif self.资源组[4]:事件判断() then
    	if self.主选择界面==false then
			self.主选择界面=true
			self.主头像组 = {}
			self.资源组[21]:置起始点(0)
		else
		   	self.主选择界面=false
		end
	elseif self.资源组[5]:事件判断() then
    	if self.副选择界面==false then
			self.副选择界面=true
			self.副头像组 = {}
			self.资源组[25]:置起始点(0)
		else
		   	self.副选择界面=false
		end
    elseif self.资源组[8]:事件判断() then
    	self.主状态=1
    elseif self.资源组[9]:事件判断() then
    	self.主状态=2
    elseif self.资源组[15]:事件判断() then
    	self.副状态=1
    elseif self.资源组[16]:事件判断() then
    	self.副状态=2
	end
	if self.主状态==1 then
		local xx = 0
		local yy = 0
		for n=1,12 do
			local jx = self.x + 20 + (xx * 41)
			local jy = self.y + 299 + (yy * 41)
			self.资源组[11]:显示(jx,jy)
			if self.主选择~=nil then
				self.主技能[n+self.主技能加入]:置坐标(jx+3,jy+2)
				self.主技能[n+self.主技能加入]:显示(x,y,self.鼠标)
				if self.主技能[n+self.主技能加入].焦点 and self.主技能[n+self.主技能加入].技能 ~= nil and self.主选择界面==false and self.鼠标 then
					tp.提示:技能(x,y,self.主技能[n+self.主技能加入].技能)
				end
			end
			xx = xx + 1
			if xx > 3 then
				xx = 0
				yy = yy + 1
			end
		end
		if self.主选择~=nil then
			if tp.队伍[1].宝宝列表[self.主选择].法术认证~=nil then
				local xx=3
				local yy=2
				local jx = self.x + 20 + (xx * 41)
				local jy = self.y + 299 + (yy * 41)
				self.资源组[11]:显示(jx,jy)
				self.主认证格子:置坐标(jx+3,jy+2)
				self.主认证格子:显示(x,y,self.鼠标)
				引擎.画线(jx+3,jy+2,jx+3+40,jy+2,红色)
				引擎.画线(jx+3,jy+2+40,jx+3+40,jy+2+40,红色)
				引擎.画线(jx+3,jy+2,jx+3,jy+2+40,红色)
				引擎.画线(jx+3+40,jy+2,jx+3+40,jy+2+40,红色)
				if self.主认证格子.焦点 and self.主认证格子.技能 ~= nil and self.主选择界面==false and self.鼠标 then
					tp.提示:技能(x,y,self.主认证格子.技能)
				end
			end
			if #tp.队伍[1].宝宝列表[self.主选择].技能 > 12 then
				self.主上页:更新(x,y)
				self.主上页:显示(self.x+192,self.y+310)
				self.主下页:更新(x,y)
				self.主下页:显示(self.x+192,self.y+390)
				if self.主上页:事件判断() then
					if self.主技能加入 == 0 then
						tp.提示:写入("#Y/已经是第一页技能了")
					else
						self.主技能加入 = 0
					end
				elseif self.主下页:事件判断() then
					if self.主技能加入 == 0 then
						self.主技能加入 = 12
					else
						tp.提示:写入("#Y/已经是第二页技能了")
					end
				end
			end
		end
	elseif self.主状态==2 then
		local jx = self.x+20
		local jy = self.y+299
		self.资源组[12]:显示(jx,jy)
		local bb = tp.队伍[1].宝宝列表[self.主选择]
		for i=1,6 do
			local jxx = jx + yx[i][1]
			local jxy = jy + yx[i][2]
			if bb~=nil then
				if i<= bb.内丹.内丹上限 then
					self.资源组[14]:显示(jxx,jxy)
					if self.鼠标 and self.资源组[14]:是否选中(x,y) then
						tp.提示:内丹提示(x,y,self.资源组[14],{名称="可用的内丹技能格",说明="可以学习的内丹技能"})
						self.焦点 = true
					end
				else
					self.资源组[13]:显示(jxx,jxy)
					if self.鼠标 and self.资源组[13]:是否选中(x,y) then
						tp.提示:内丹提示(x,y,self.资源组[13],{名称="不可用内丹技能格",说明="召唤兽可用内丹格数量与其参战等级相关"})
						self.焦点 = true
					end
				end
				if self.主内丹数据[i] ~= nil then
				  	self.主内丹数据[i].模型:显示(jxx,jxy)
		   	      	if self.主内丹数据[i].模型:是否选中(鼠标.x,鼠标.y) then
				    	tp.提示:内丹提示(鼠标.x,鼠标.y,self.主内丹数据[i].模型,self.主内丹数据[i])
				 	end
				end
			end
		end
	end

	if self.副状态==1 then
		local xx = 0
		local yy = 0
		for n=1,12 do
			local jx = self.x + 20 + (xx * 41) + 330
			local jy = self.y + 299 + (yy * 41)
			self.资源组[26]:显示(jx,jy)
			if self.副选择~=nil then
				self.副技能[n+self.副技能加入]:置坐标(jx+3,jy+2)
				self.副技能[n+self.副技能加入]:显示(x,y,self.鼠标)
				if self.副技能[n+self.副技能加入].焦点 and self.副技能[n+self.副技能加入].技能 ~= nil and self.副选择界面==false and self.鼠标 then
					tp.提示:技能(x,y,self.副技能[n+self.副技能加入].技能)
				end
			end
			xx = xx + 1
			if xx > 3 then
				xx = 0
				yy = yy + 1
			end
		end
		if self.副选择~=nil then
			if tp.队伍[1].宝宝列表[self.副选择].法术认证~=nil then
				local xx=3
				local yy=2
				local jx = self.x + 20 + (xx * 41) + 330
				local jy = self.y + 299 + (yy * 41)
				self.资源组[26]:显示(jx,jy)
				self.副认证格子:置坐标(jx+3,jy+2)
				self.副认证格子:显示(x,y,self.鼠标)
				引擎.画线(jx+3,jy+2,jx+3+40,jy+2,红色)
				引擎.画线(jx+3,jy+2+40,jx+3+40,jy+2+40,红色)
				引擎.画线(jx+3,jy+2,jx+3,jy+2+40,红色)
				引擎.画线(jx+3+40,jy+2,jx+3+40,jy+2+40,红色)
				if self.副认证格子.焦点 and self.副认证格子.技能 ~= nil and self.副选择界面==false and self.鼠标 then
					tp.提示:技能(x,y,self.副认证格子.技能)
				end
			end
			if #tp.队伍[1].宝宝列表[self.副选择].技能  <13 then
				self.副上页:更新()
				self.副上页:显示(self.x+192+330,self.y+310)
				self.副下页:更新()
				self.副下页:显示(self.x+192+330,self.y+390)
				if self.副上页:取是否单击() then
					if self.副技能加入 == 0 then
						tp.提示:写入("#Y/已经是第一页技能了")
					else
						self.副技能加入 = 0
					end
				elseif self.副下页:取是否单击() then
					if self.副技能加入 == 0 then
						self.副技能加入 = 13
					else
						tp.提示:写入("#Y/已经是第二页技能了")
					end
				end
			end
		end
	elseif self.副状态==2 then
		local jx = self.x+20 + 330
		local jy = self.y+299
		self.资源组[12]:显示(jx,jy)
		local bb = tp.队伍[1].宝宝列表[self.副选择]
		for i=1,6 do
			local jxx = jx + yx[i][1]
			local jxy = jy + yx[i][2]
			if bb~=nil then
				if i<= bb.内丹.内丹上限 then
					self.资源组[14]:显示(jxx,jxy)
					if self.鼠标 and self.资源组[14]:是否选中(x,y) then
						tp.提示:内丹提示(x,y,self.资源组[14],{名称="可用的内丹技能格",说明="可以学习的内丹技能"})
						self.焦点 = true
					end
				else
					self.资源组[13]:显示(jxx,jxy)
					if self.鼠标 and self.资源组[13]:是否选中(x,y) then
						tp.提示:内丹提示(x,y,self.资源组[13],{名称="不可用内丹技能格",说明="召唤兽可用内丹格数量与其参战等级相关"})
						self.焦点 = true
					end
				end
				if self.副内丹数据[i] ~= nil then
				  	self.副内丹数据[i].模型:显示(jxx,jxy)
		   	      	if self.副内丹数据[i].模型:是否选中(鼠标.x,鼠标.y) then
				    	tp.提示:内丹提示(鼠标.x,鼠标.y,self.副内丹数据[i].模型,self.副内丹数据[i])
				 	end
				end
			end
		end
	end

	if self.主宠 ~= nil and self.主召唤兽 ~= nil then
		tp.影子:显示(self.x + 120,self.y + 120)
		self.主宠:显示(self.x + 120,self.y + 120)
		if self.资源组[28] ~= nil then
			self.资源组[28]:更新(dt)
			self.资源组[28]:显示(self.x + 120,self.y + 120)
		end
		if self.资源组[29] ~= nil then
			self.资源组[29]:更新(dt)
			self.资源组[29]:显示(self.x + 120,self.y + 120)
		end
	end
	if self.副宠 ~= nil and self.副召唤兽 ~= nil then
		tp.影子:显示(self.x + 450,self.y + 120)
		self.副宠:显示(self.x + 450,self.y + 120)
		if self.资源组[30] ~= nil then
			self.资源组[30]:更新(dt)
			self.资源组[30]:显示(self.x + 450,self.y + 120)
		end
		if self.资源组[31] ~= nil then
			self.资源组[31]:更新(dt)
			self.资源组[31]:显示(self.x + 450,self.y + 120)
		end
	end
	if self.主选择界面 then
		self:主选择召唤兽(x,y)
	end
	if self.副选择界面 then
		self:副选择召唤兽(x,y)
	end
	if self.资源组[21].接触 or self.资源组[25].接触 then
		self.焦点 = true
	end
end

function 场景类_宠物合宠栏:主选择召唤兽(x,y)
	self.主加入 = 0
	self.资源组[18]:显示(self.x,self.y+185)
	self.资源组[6]:置宽高(135,215)
	self.资源组[6]:显示(self.x+18,self.y+185+12)
	local bbs = tp.队伍[1].宝宝列表
	local bbsa = #bbs
	if bbsa > 5 then
		self.资源组[21]:置高度(min(math.floor(143/(bbsa-5)),104))
		self.主加入 = min(math.ceil((bbsa-5)*self.资源组[21]:取百分比()),bbsa-5)
	end
	self.资源组[19]:更新(x,y,self.主加入 > 0)
	self.资源组[20]:更新(x,y,self.主加入 < bbsa - 5)
	tp.画线:置区域(0,0,15,190)
	tp.画线:显示(self.x+141,self.y+215)
	self.资源组[19]:显示(self.x+136,self.y+198)
	self.资源组[20]:显示(self.x+136,self.y+393)
	if bbsa > 5 then
		self.资源组[21]:显示(self.x+138,self.y+217,x,y,self.鼠标)
	end
	if self.资源组[20]:事件判断() then
		self.资源组[21]:置起始点(self.资源组[21]:取百分比转换(self.主加入+1,5,bbsa))
		self.主头像组 = {}
	elseif self.资源组[19]:事件判断() then
		self.资源组[21]:置起始点(self.资源组[21]:取百分比转换(self.主加入-1,5,bbsa))
		self.主头像组 = {}
	end
	for i=1,5 do
		if bbs[i+self.主加入] ~= nil then
			local jx = self.x+20
			local jy = self.y+160+(i*42)
			bw1:置坐标(self.x+20,self.y+160+i*42)
			if bw1:检查点(x,y) and self.鼠标 then
				self.焦点=true
				box(self.x+20,self.y+160+i*42,self.x+130,self.y+200+i*42,-2097481216)
				if 引擎.鼠标弹起(0) and self.鼠标 and not tp.消息栏焦点 then
					if bbs[i + self.主加入].参战信息~=nil or bbs[i + self.主加入].装备[1]~=nil or bbs[i + self.主加入].装备[2]~=nil or bbs[i + self.主加入].装备[3]~=nil or bbs[i + self.主加入].进阶==true then
						tp.提示:写入("#Y/已参战、有装备、有饰品、进阶的召唤兽，无法进行该操作！")
						return
					elseif bbs[i + self.主加入].等级 < 30 then
						tp.提示:写入("#Y/召唤兽未到30级，无法进行该操作！")
						return
					elseif bbs[i + self.主加入].种类~=nil and bbs[i + self.主加入].种类=="神兽" then
						tp.提示:写入("#Y/神兽无法进行该操作！")
						return
					elseif bbs[i + self.主加入].加锁~=nil and bbs[i + self.主加入].加锁 then
						tp.提示:写入("#Y/加锁的召唤兽无法进行该操作。")
						return
					end
					self.主选择 = i + self.主加入
					self.主选择界面=false
					self.主召唤兽 = i + self.主加入
					self.主选择认证 = bbs[i + self.主加入].认证码
					self:主置形象()
					self.主技能加入 = 0
					local bb = bbs[self.主选择]
					local 序列=0
					self.主认证格子:置技能(nil)
					for n=1,24 do
						序列=序列+1
						if bb.技能[n]~=nil and bb.技能[n].名称==bb.法术认证 then
							序列=序列-1
							self.主认证格子:置技能(bb.技能[n])
						else
							self.主技能[序列]:置技能(DeepCopy(bb.技能[n]))
						end
					end
					self.主内丹数据 = {}
					for n=1,#bb.内丹 do
			         	self.主内丹数据[n] =bb.内丹[n]
						local item = self:取内丹数据(bb.内丹[n].技能,bb.内丹[n].等级)
						self.主内丹数据[n].说明= item.说明
						self.主内丹数据[n].效果 = item.效果
						self.主内丹数据[n].模型 = 引擎.场景.资源:载入(item.资源,"网易WDF动画",item.模型)
						self.主内丹数据[n].小模型 = 引擎.场景.资源:载入(item.资源,"网易WDF动画",item.模型)
			       	end
				end
			end
			if self.主头像组[i+self.主加入] == nil then
				local n = tx(bbs[i+self.主加入].模型)
				self.主头像组[i+self.主加入] = tp.资源:载入(n[7],"网易WDF动画",n[1])
			end
			self.资源组[22]:显示(jx+1,jy)
			self.主头像组[i+self.主加入]:显示(jx+4,jy+4)
			if bbs[i+self.主加入].参战信息 ~= nil then
				zts:置颜色(-256)
			else
				zts:置颜色(-16777216)
			end
			zts:显示(jx+41,jy+3,bbs[i+self.主加入].名称)
			zts:显示(jx+41,jy+21,bbs[i+self.主加入].等级.."级")
		end
	end
end

function 场景类_宠物合宠栏:副选择召唤兽(x,y)
	self.副加入 = 0
	self.资源组[18]:显示(self.x+340,self.y+185)
	self.资源组[6]:置宽高(135,215)
	self.资源组[6]:显示(self.x+358,self.y+185+12)
	local bbs = tp.队伍[1].宝宝列表
	local bbsa = #bbs
	if bbsa > 5 then
		self.资源组[25]:置高度(min(math.floor(143/(bbsa-5)),104))
		self.副加入 = min(math.ceil((bbsa-5)*self.资源组[25]:取百分比()),bbsa-5)
	end
	self.资源组[23]:更新(x,y,self.副加入 > 0)
	self.资源组[24]:更新(x,y,self.副加入 < bbsa - 5)
	tp.画线:置区域(0,0,15,190)
	tp.画线:显示(self.x+481,self.y+215)
	self.资源组[23]:显示(self.x+476,self.y+198)
	self.资源组[24]:显示(self.x+476,self.y+393)
	if bbsa > 5 then
		self.资源组[25]:显示(self.x+478,self.y+217,x,y,self.鼠标)
	end
	if self.资源组[24]:事件判断() then
		self.资源组[25]:置起始点(self.资源组[25]:取百分比转换(self.副加入+1,5,bbsa))
		self.副头像组 = {}
	elseif self.资源组[23]:事件判断() then
		self.资源组[25]:置起始点(self.资源组[25]:取百分比转换(self.副加入-1,5,bbsa))
		self.副头像组 = {}
	end
	for i=1,5 do
		if bbs[i+self.副加入] ~= nil then
			local jx = self.x+360
			local jy = self.y+160+(i*42)
			bw1:置坐标(self.x+360,self.y+160+i*42)
			if bw1:检查点(x,y) and self.鼠标 then
				self.焦点=true
				box(self.x+360,self.y+160+i*42,self.x+470,self.y+200+i*42,-2097481216)
				if 引擎.鼠标弹起(0) and self.鼠标 and not tp.消息栏焦点 then
					if bbs[i + self.副加入].参战信息~=nil or bbs[i + self.副加入].装备[1]~=nil or bbs[i + self.副加入].装备[2]~=nil or bbs[i + self.副加入].装备[3]~=nil or bbs[i + self.副加入].进阶==true then
						tp.提示:写入("#Y/参战、有装备、有饰品、进阶的召唤兽，无法进行合成！")
						return
					elseif bbs[i + self.副加入].等级 < 30 then
						tp.提示:写入("#Y/召唤兽未到30级，无法进行合成！")
						return
					elseif bbs[i + self.副加入].种类~=nil and bbs[i + self.副加入].种类=="神兽" then
						tp.提示:写入("#Y/神兽无法进行合成！")
						return
					elseif bbs[i + self.副加入].加锁~=nil and bbs[i + self.副加入].加锁 then
						tp.提示:写入("#Y/加锁的召唤兽无法进行该操作。")
						return
					end
					self.副选择 = i + self.副加入
					self.副选择界面=false
					self.副召唤兽 = i + self.副加入
					self.副选择认证 = bbs[i + self.副加入].认证码
					self:副置形象()
					self.副技能加入 = 0
					local bb = bbs[self.副选择]
					local 序列=0
					self.副认证格子:置技能(nil)
					for n=1,24 do
						序列=序列+1
						if bb.技能[n]~=nil and bb.技能[n].名称==bb.法术认证 then
							序列=序列-1
							self.副认证格子:置技能(bb.技能[n])
						else
							self.副技能[序列]:置技能(DeepCopy(bb.技能[n]))
						end
					end
					self.副内丹数据 = {}
					for n=1,#bb.内丹 do
			         	self.副内丹数据[n] =bb.内丹[n]
						local item = self:取内丹数据(bb.内丹[n].技能,bb.内丹[n].等级)
						self.副内丹数据[n].说明= item.说明
						self.副内丹数据[n].效果 = item.效果
						self.副内丹数据[n].模型 = 引擎.场景.资源:载入(item.资源,"网易WDF动画",item.模型)
						self.副内丹数据[n].小模型 = 引擎.场景.资源:载入(item.资源,"网易WDF动画",item.模型)
			       	end
				end
			end
			if self.副头像组[i+self.副加入] == nil then
				local n = tx(bbs[i+self.副加入].模型)
				self.副头像组[i+self.副加入] = tp.资源:载入(n[7],"网易WDF动画",n[1])
			end
			self.资源组[22]:显示(jx+1,jy)
			self.副头像组[i+self.副加入]:显示(jx+4,jy+4)
			if bbs[i+self.副加入].参战信息 ~= nil then
				zts:置颜色(-256)
			else
				zts:置颜色(-16777216)
			end
			zts:显示(jx+41,jy+3,bbs[i+self.副加入].名称)
			zts:显示(jx+41,jy+21,bbs[i+self.副加入].等级.."级")
		end
	end
end

function 场景类_宠物合宠栏:取内丹数据(wd,s)
  local wds = {}

    if wd == "迅敏" then
        wds.说明 = "提升召唤兽伤害力与速度，提升效果受召唤兽自身等级影响。"
        wds.效果 = "增加"..(s*20).."点伤害与"..(s*10).."点速度，随内丹等级提升而增加。"
        wds.资源 = "item.wdf"
        wds.模型 = 0x6FA0B3A8
    elseif wd == "狂怒" then
        wds.说明 = "提升必杀/高级必杀技能触发时造成的伤害，但是受到水、土二系法术攻击时将承受额外的伤害。"
        wds.效果 = "必杀时增加"..(s*80).."点伤害，但是额外受到15%水、土系法术伤害。"
        wds.资源 = "item.wdf"
        wds.模型 = 0x956BD457
    elseif wd == "阴伤" then
        wds.说明 = "提升连击/高级连击技能第二次攻击造成的伤害，但是受到火、雷二系法术攻击时将承受额外的伤害。"
        wds.效果 = "连击时增加"..(s*50).."点伤害，但是额外受到15%火、雷系法术伤害。"
        wds.资源 = "item.wdf"
        wds.模型 = 0x3EF0A9BF
    elseif wd == "静岳" then
        wds.说明 = "提升召唤兽灵力与气血，提升效果受召唤兽自身等级影响。"
        wds.效果 = "增加"..(s*32).."点灵力与"..(s*80).."点气血，随内丹等级提升而增加。"
        wds.资源 = "item.wdf"
        wds.模型 = 0xF58C6B1D
    elseif wd == "擅咒" then
        wds.说明 = "你对目标的法术伤害得到提升。"
        wds.效果 = "法术伤害结果增加"..(s*12).."点。"
        wds.资源 = "item.wdf"
        wds.模型 = 0x4D74B795
    elseif wd == "灵身" then
        wds.说明 = "提升法术爆击/高级法术爆击触发时的伤害，但是受到携带强力与高级强力技能召唤兽物理攻击时，承受额外的伤害。"
        wds.效果 = "法术暴击伤害增加"..(s*7).."%，但是受到强力、高强力技能额外伤害。"
        wds.资源 = "item.wdf"
        wds.模型 = 0x55124270
     elseif wd == "矫健" then
        wds.说明 = "提升召唤兽气血与速度，提升效果受召唤兽自身等级影响。"
        wds.效果 = "增加"..(s*120).."点气血与"..(s*15).."点速度，随召唤兽等级提升而增加。"
        wds.资源 = "item.wdf"
        wds.模型 = 0x3877515B
    elseif wd == "深思" then
        wds.说明 = "提升高冥思技能效果。"
        wds.效果 = "高冥思效果增加"..(s*5).."点"
        wds.资源 = "item.wdf"
        wds.模型 = 0x9912B979
    elseif wd == "钢化" then
        wds.说明 = "拥有防御或高级防御技能的召唤兽能提升防御效果，但在受到除固定伤害外的其他法术攻击时，受到的伤害增加。"
        wds.效果 = "防御、高级防御效果增加"..(s*20).."点，随召唤兽等级提升而增加，所受法术伤害增加10%。"
        wds.资源 = "item.wdf"
        wds.模型 = 0x89C1F027
    elseif wd == "坚甲" then
        wds.说明 = "拥有反震或高级反震技能的召唤兽能提升对敌人造成的反震伤害。"
        wds.效果 = "对敌人所造成的反震伤害增加"..(s*100).."点。"
        wds.资源 = "item.wdf"
        wds.模型 = 0x2788B6E8
    elseif wd == "慧心" then
        wds.说明 = "提升召唤兽抵抗封印几率。"
        wds.效果 = "增加"..(s*6).."%的抗封印几率。"
        wds.资源 = "item.wdf"
        wds.模型 = 0xB6A27748
    elseif wd == "撞击" then
        wds.说明 = "提升召唤兽物理攻击命中几率，提升效果受召唤兽体质点影响，同时提升一定的伤害结果。"
        wds.效果 = "物理攻击时增加"..(s*5).."%命中几率，效果与召唤兽体质点相关，同时增加5点伤害结果。"
        wds.资源 = "item.wdf"
        wds.模型 = 0xE837F9B1
    elseif wd == "无畏" then
        wds.说明 = "提升对拥有反震/高级反震技能目标的物理伤害。"
        wds.效果 = "对待有反震、高级反震技能的目标造成的物理伤害增加"..(s*2).."%。"
        wds.资源 = "item.wdf"
        wds.模型 = 0xE8FDD3F4
    elseif wd == "愤恨" then
        wds.说明 = "提升召唤兽对拥有幸运/高级幸运技能目标的物理伤害。"
        wds.效果 = "对待有幸运、高级幸运技能的目标造成的物理伤害增加"..(s*2).."%。"
        wds.资源 = "item.wdf"
        wds.模型 = 0x9F97DB7F
    elseif wd == "淬毒" then
        wds.说明 = "提升毒/高级毒技能的中毒触发几率。"
        wds.效果 = "命中目标后致毒的几率增加"..(s*5).."%。"
        wds.资源 = "item.wdf"
        wds.模型 = 0x4A491950
    elseif wd == "狙刺" then
        wds.说明 = "提升召唤兽对施法选定目标的法术伤害，提升效果受召唤兽等级影响"
        wds.效果 = "对施法选定目标法术伤害增加"..(s*35).."点，效果随召唤兽等级提升而增加。"
        wds.资源 = "item.wdf"
        wds.模型 = 0x9762CCF9
    elseif wd == "连环" then
        wds.说明 = "提升连击/高级连击技能触发连击的几率。"
        wds.效果 = "连击的几率增加"..(s*2).."%。"
        wds.资源 = "item.wdf"
        wds.模型 = 0xE2D19F8F
    elseif wd == "圣洁" then
        wds.说明 = "提升驱鬼/高级驱鬼技对于鬼魂/高级鬼魂技能召唤兽的法术伤害"
        wds.效果 = "驱鬼的效果在原基础上增加"..(s*10).."%。"
        wds.资源 = "item.wdf"
        wds.模型 = 0x809E53A3
    elseif wd == "灵光" then
        wds.说明 = "提升召唤兽法术伤害，提升效果受召唤兽自身法力点数影响。"
        wds.效果 = "增加"..(s*30).."点法术伤害，效果受自身法力点数影响。"
        wds.资源 = "item.wdf"
        wds.模型 = 0xC0EAFCA3
    elseif wd == "神机步" then
        wds.说明 = "进入战斗后三回合内提升召唤兽躲避力。"
        wds.效果 = "进入战斗时，"..(s*3).."回合内的躲避值增加100%。"
        wds.资源 = "item.wdf"
        wds.模型 = 0x19D18973
    elseif wd == "腾挪劲" then
        wds.说明 = "召唤兽受到物理攻击时，有一定几率化解部分伤害。"
        wds.效果 = "受到物理攻击时有"..(s*3).."%的几率抵挡50%的伤害。"
        wds.资源 = "item.wdf"
        wds.模型 = 0x06EF9E7B
    elseif wd == "玄武躯" then
        wds.说明 = "提升召唤兽气血，提升效果受召唤兽等级影响，但是将减少召唤兽所有攻击方式造成的伤害。"
        wds.效果 = "增加"..(s*30).."点气血，随召唤兽等级提升而增加，对目标造成伤害减少50%。"
        wds.资源 = "item.wdf"
        wds.模型 = 0xC842B66C
    elseif wd == "龙胄铠" then
        wds.说明 = "提升召唤兽防御，提升效果受召唤兽等级影响，但是将减少召唤兽所有攻击方式造成的伤害。"
        wds.效果 = "增加"..(s*20).."点防御，随召唤兽等级提升而增加，对目标造成伤害减少50%。"
        wds.资源 = "item.wdf"
        wds.模型 = 0x4E9FBEE0
    elseif wd == "玉砥柱" then
        wds.说明 = "降低召唤兽受到壁垒击破技能攻击时所承受的伤害，但是将减少召唤兽所有攻击方式造成的伤害。"
        wds.效果 = "受到壁垒击破技能伤害减少"..(s*7).."%；但是对其他目标造成的伤害减少20%。"
        wds.资源 = "item.wdf"
        wds.模型 = 0x5DAD21DF
     elseif wd == "碎甲刃" then
        wds.说明 = "召唤兽普通物理攻击时将有一定几率降低攻击目标的物理防御，效果持续两回合。"
        wds.效果 = "普通物理攻击后减低目标后有30%几率降低目标"..(s*20).."点防御值，持续2回合，效果受自身力量点影响。"
        wds.资源 = "item.wdf"
        wds.模型 = 0xCDDAE9FF
    elseif wd == "阴阳护" then
        wds.说明 = "降低召唤兽保护其他目标时所承受的伤害。"
        wds.效果 = "保护目标时承受的伤害减少"..(s*10).."%。"
        wds.资源 = "item.wdf"
        wds.模型 = 0x9041DD3F
    elseif wd == "凛冽气" then
        wds.说明 = "携带此内丹的召唤兽在战斗中降低本方包含其在内所有召唤兽的逃跑几率。"
        wds.效果 = "本方所有召唤兽逃跑的几率减少"..(s*10).."%。"
        wds.资源 = "item.wdf"
        wds.模型 = 0x38808205
    elseif wd == "舍身击" then
        wds.说明 = "提升物理攻击造成的伤害，提升效果受召唤兽自身力量点数影响。"
        wds.效果 = "物理攻击伤害结果增加"..(s*30).."点，效果受自身力量点影响。"
        wds.资源 = "item.wdf"
        wds.模型 = 0x10E2B4A7
    elseif wd == "电魂闪" then
        wds.说明 = "使用单体法术命中目标时将有一定几率驱散目标的某种增益状态。"
        wds.效果 = "单体法术命中目标时有"..(s*8).."%几率驱散目标随机一种状态。"
        wds.资源 = "item.wdf"
        wds.模型 = 0x624D3F68
    elseif wd == "通灵法" then
        wds.说明 = "提升召唤兽忽视目标法术减免效果的能力。"
        wds.效果 = "忽视"..(s*4).."%的法术伤害减免能力。"
        wds.资源 = "item.wdf"
        wds.模型 = 0xBD739B98
    elseif wd == "双星爆" then
        wds.说明 = "提升法术连击/高级法术连击技能触发第二次法术攻击造成的伤害。"
        wds.效果 = "法术连击第二下伤害增加"..(s*12).."%。"
        wds.资源 = "item.wdf"
        wds.模型 = 0x8AD71FAF
    elseif wd == "催心浪" then
        wds.说明 = "提升法术波动/高级法术波动技能触发时的伤害波动下限。"
        wds.效果 = "法术波动下限提升了。"
        wds.资源 = "item.wdf"
        wds.模型 = 0x5CEDA8EC
    elseif wd == "隐匿击" then
        wds.说明 = "降低拥有隐身/高级隐身技能的召唤兽在隐身状态下减少的伤害值，但隐身结束后将消耗额外的魔法。"
        wds.效果 = "隐身状态下降低的伤害降低"..(s*1).."%，同时隐身结束后额外消耗100%的魔法值。"
        wds.资源 = "item.wdf"
        wds.模型 = 0x0A21302B
    elseif wd == "生死决" then
        wds.说明 = "提升召唤兽将自身防御的一部分转化为伤害力的几率，提升效果持续到本回合结束。"
        wds.效果 = "增加"..(s*3).."%的狂暴几率。"
        wds.资源 = "item.wdf"
        wds.模型 = 0x2AA03A67
    elseif wd == "血债偿" then
        wds.说明 = "本方不带本技能召唤兽每被击飞一次，提升一次拥有本技能召唤兽对目标造成的法术伤害，持续到战斗结束。提升效果最多叠加5次，且受召唤兽自身魔力点数影响，不能与鬼魂和高级鬼魂技能共存。"
        wds.效果 = "本方每被击飞一个不带有此技能的召唤兽，自身对目标造成的法术伤害增加"..(s*50).."点。持续到战斗结束，最多可叠加5次，此技能与鬼魂、高鬼魂冲突，效果受自身魔力点数影响。"
        wds.资源 = "item.wdf"
        wds.模型 = 0x97117DEE

    end
    return  wds
end

function 场景类_宠物合宠栏:检查点(x,y)
	if self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 场景类_宠物合宠栏:初始移动(x,y)
	tp.运行时间 = tp.运行时间 + 1
	if not tp.消息栏焦点 then
  		self.窗口时间 = tp.运行时间
 	end
	if not self.焦点 then
		tp.移动窗口 = true
	end
	if  self.鼠标 and  not self.焦点 then
		self.xx = x - self.x
		self.yy = y - self.y
	end
end

function 场景类_宠物合宠栏:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 场景类_宠物合宠栏