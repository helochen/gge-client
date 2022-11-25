--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2021-04-24 05:40:07
--======================================================================--
local 场景类_梦幻指引 = class()

local floor = math.floor
local min = math.min
local xxx = 0
local yyy = 0
-- local VIP1 = {
-- 	{{"120武器\n必出无级别","图标素材",0xA3DB661B,1},{"120衣服\n必出无级别","图标素材",0xA3DB661B,1},{"120头部\n必出无级别","图标素材",0xA3DB661B,1},{"120项链\n必出无级别","图标素材",0xA3DB661B,1},{"120腰带\n必出无级别","图标素材",0xA3DB661B,1},{"120鞋子\n必出无级别","图标素材",0xA3DB661B,1}
-- 	,{"红玛瑙\n10级","图标素材",2783082158,1},{"黑宝石\n10级","图标素材",4208912380,1},{"舍利子\n10级","图标素材",2228232000,1},{"月亮石\n10级","图标素材",3488952287,1},{"光芒石\n10级","图标素材",182374181,1},{"太阳石\n10级","图标素材",1387446262,1}}}
-- local VIP2 = {
-- 	{{"130武器\n必出无级别","图标素材",0xA3DB661B,1},{"130衣服\n必出无级别","图标素材",0xA3DB661B,1},{"130头部\n必出无级别","图标素材",0xA3DB661B,1},{"130项链\n必出无级别","图标素材",0xA3DB661B,1},{"130腰带\n必出无级别","图标素材",0xA3DB661B,1},{"130鞋子\n必出无级别","图标素材",0xA3DB661B,1}
-- 	,{"红玛瑙\n11级","图标素材",2783082158,1},{"黑宝石\n11级","图标素材",4208912380,1},{"舍利子\n11级","图标素材",2228232000,1},{"月亮石\n11级","图标素材",3488952287,1},{"光芒石\n11级","图标素材",182374181,1},{"太阳石\n11级","图标素材",1387446262,1}}}
-- local VIP3 = {
-- 	{{"140武器\n必出无级别","图标素材",0xA3DB661B,1},{"140衣服\n必出无级别","图标素材",0xA3DB661B,1},{"140头部\n必出无级别","图标素材",0xA3DB661B,1},{"140项链\n必出无级别","图标素材",0xA3DB661B,1},{"140腰带\n必出无级别","图标素材",0xA3DB661B,1},{"140鞋子\n必出无级别","图标素材",0xA3DB661B,1}
-- 	,{"红玛瑙\n12级","图标素材",2783082158,1},{"黑宝石\n12级","图标素材",4208912380,1},{"舍利子\n12级","图标素材",2228232000,1},{"月亮石\n12级","图标素材",3488952287,1},{"光芒石\n12级","图标素材",182374181,1},{"太阳石\n12级","图标素材",1387446262,1}}}
-- local VIP4 = {
-- 	{{"150武器\n必出无级别","图标素材",0xA3DB661B,1},{"150衣服\n必出无级别","图标素材",0xA3DB661B,1},{"150头部\n必出无级别","图标素材",0xA3DB661B,1},{"150项链\n必出无级别","图标素材",0xA3DB661B,1},{"150腰带\n必出无级别","图标素材",0xA3DB661B,1},{"150鞋子\n必出无级别","图标素材",0xA3DB661B,1}
-- 	,{"红玛瑙\n13级","图标素材",2783082158,1},{"黑宝石\n13级","图标素材",4208912380,1},{"舍利子\n13级","图标素材",2228232000,1},{"月亮石\n13级","图标素材",3488952287,1},{"光芒石\n13级","图标素材",182374181,1},{"太阳石\n13级","图标素材",1387446262,1}}}
-- local VIP5 = {
-- 	{{"160武器\n必出无级别","图标素材",0xA3DB661B,1},{"160衣服\n必出无级别","图标素材",0xA3DB661B,1},{"160头部\n必出无级别","图标素材",0xA3DB661B,1},{"160项链\n必出无级别","图标素材",0xA3DB661B,1},{"160腰带\n必出无级别","图标素材",0xA3DB661B,1},{"160鞋子\n必出无级别","图标素材",0xA3DB661B,1}
-- 	,{"红玛瑙\n14级","图标素材",2783082158,1},{"黑宝石\n14级","图标素材",4208912380,1},{"舍利子\n14级","图标素材",2228232000,1},{"月亮石\n14级","图标素材",3488952287,1},{"光芒石\n14级","图标素材",182374181,1},{"太阳石\n14级","图标素材",1387446262,1}}}
-- local VIP6 = {
-- 	{{"160武器X2\n必出无级别","图标素材",0xA3DB661B,1},{"160衣服X2\n必出无级别","图标素材",0xA3DB661B,1},{"160头部X2\n必出无级别","图标素材",0xA3DB661B,1},{"160项链X2\n必出无级别","图标素材",0xA3DB661B,1},{"160腰带X2\n必出无级别","图标素材",0xA3DB661B,1},{"160鞋子X2\n必出无级别","图标素材",0xA3DB661B,1}
-- 	,{"红玛瑙\n15级","图标素材",2783082158,1},{"黑宝石\n15级X2","图标素材",4208912380,1},{"舍利子\n15级","图标素材",2228232000,1},{"月亮石\n15级X2","图标素材",3488952287,1},{"光芒石\n15级X2","图标素材",182374181,1},{"太阳石\n15级","图标素材",1387446262,1}}}
local 每日首冲 = {
	{{"藏宝图","图标素材",211127435,1},{"高级藏宝图","图标素材",0xA3DF3AA3,1},{"魔兽要诀","图标素材",1241924823,1},{"高级魔兽要诀","图标素材",0X6CAD36E8,1},{"星辉石","图标素材",0xD2DFDC4D,1},{"海马","图标素材",2901285604,1}
	,{"百万银子","图标素材",0x5453a471,1},{"随机宝石\n随机1-15级","图标素材",1387446262,1},{"高级召唤兽内丹(概率)","图标素材",0x02A776DE,1},{"月卡(概率)","图标素材",0xc5361f2,1},{"三级未激活的符石(概率)","图标素材",0xB39A2CAB,1},{"特殊魔兽要诀(概率)","图标素材",0x4694a50,1}}}
local 月卡福利 = {
	{{"九转金丹\n千品","图标素材",0x5A0E9307,1},{"修炼果\n10个","图标素材",0x19CEE771,1},{"高级兽诀\n随机5本","图标素材",0x6CAD36E8,1},{"大额银票\n2E","图标素材",0x91B892E4,1}}}



local insert = table.insert
local mouseb = 引擎.鼠标弹起

function 场景类_梦幻指引:初始化(根)
	self.ID = "VIP"
	self.x = -50
	self.y = 0
	self.xx = 0
	self.yy = 0
	self.注释 = "梦幻指引"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	self.选中 = 1
		local 资源 = tp.资源
		local 自适应 = tp._自适应
		local 按钮 = tp._按钮

	-- for i=1,1 do
	-- 	for n=1,#VIP1[i] do
	-- 			VIP1[i][n][2] = 资源:载入(VIP1[i][n][2],"网易WDF动画",VIP1[i][n][3])

	-- 	end
	-- end
	-- for i=1,1 do
	-- 	for n=1,#VIP2[i] do
	-- 			VIP2[i][n][2] = 资源:载入(VIP2[i][n][2],"网易WDF动画",VIP2[i][n][3])

	-- 	end
	-- end
	-- for i=1,1 do
	-- 	for n=1,#VIP3[i] do
	-- 			VIP3[i][n][2] = 资源:载入(VIP3[i][n][2],"网易WDF动画",VIP3[i][n][3])

	-- 	end
	-- end
	-- for i=1,1 do
	-- 	for n=1,#VIP4[i] do
	-- 			VIP4[i][n][2] = 资源:载入(VIP4[i][n][2],"网易WDF动画",VIP4[i][n][3])

	-- 	end
	-- end
	-- for i=1,1 do
	-- 	for n=1,#VIP5[i] do
	-- 			VIP5[i][n][2] = 资源:载入(VIP5[i][n][2],"网易WDF动画",VIP5[i][n][3])

	-- 	end
	-- end
	-- for i=1,1 do
	-- 	for n=1,#VIP6[i] do
	-- 			VIP6[i][n][2] = 资源:载入(VIP6[i][n][2],"网易WDF动画",VIP6[i][n][3])

	-- 	end
	-- end
	for i=1,1 do
		for n=1,#每日首冲[i] do
				每日首冲[i][n][2] = 资源:载入(每日首冲[i][n][2],"网易WDF动画",每日首冲[i][n][3])

		end
	end
	for i=1,1 do
		for n=1,#月卡福利[i] do
				月卡福利[i][n][2] = 资源:载入(月卡福利[i][n][2],"网易WDF动画",月卡福利[i][n][3])

		end
	end
end

function 场景类_梦幻指引:打开(数据)
	if self.可视 then
		self.可视 = false
		self.资源组=nil
		self.征战物品=nil
		return
	else
		insert(tp.窗口_,self)
		local 资源 = tp.资源
		local 自适应 = tp._自适应
		local 按钮 = tp._按钮



	self.资源组 = {
		[1] = 资源:载入('自用',"网易WDF动画",0x9cc4f244),--背景
		[2] = 按钮.创建(资源:载入('自用',"网易WDF动画",0x1a88c719),0,0,4,true,true," 累 计 充 值",nil,0,2),
		[3] = 资源:载入('自用',"网易WDF动画",0x9cc4f245), --VIP等级
		[4] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0x20f3e242),0,0,4,true),--问号
		[5] = 按钮.创建(资源:载入('wzife.wd4',"网易WDF动画",0xcfc32179),0,0,4,true),--领取
		[6] = 按钮.创建(资源:载入('wzife.wd4',"网易WDF动画",0x3d40d10e),0,0,4,true),--左
		[7] = 按钮.创建(资源:载入('wzife.wd4',"网易WDF动画",0x8a13108d),0,0,4,true),--又
		[8] = 按钮.创建(资源:载入('自用',"网易WDF动画",0x1a88c719),0,0,4,true,true," 每 日 首 冲",nil,0,2),
		[9] =  资源:载入('wzife.wd4',"网易WDF动画",0x3906F9F1),--经验
		[10] = 按钮.创建(资源:载入('自用',"网易WDF动画",0x1a88c719),0,0,4,true,true," 月 卡 福 利",nil,0,2),
		[11] = 按钮.创建(资源:载入('自用',"网易WDF动画",0x1a88c719),0,0,4,true,true," 自 动 抓 鬼",nil,0,2),
		[12] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0xFF205590),0,0,1,true,true),
		[13] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0xFF205590),0,0,1,true,true),
		[14] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0xFF205590),0,0,1,true,true),
		[15] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0xFF205590),0,0,1,true,true),
		[16] = 按钮.创建(资源:载入('自用',"网易WDF动画",0x1a88c719),0,0,4,true,true," C D K 兑 换",nil,0,2),
		[20] =  自适应.创建(9,1,457,160,3,9),--方框
		[21] = 资源:载入('wzife.wd1',"网易WDF动画",0xE6490543),
		[49] = 按钮.创建(pwd("14"),0,0,4,true,true),
		[50] = 按钮.创建(资源:载入('自用',"网易WDF动画",0x1a88c719),0,0,4,true,true," 征 战 天 下",nil,0,2),
		[66] = 按钮.创建(资源:载入('自用',"网易WDF动画",0x1a88c719),0,0,4,true,true," 我 要 变 强",nil,0,2),
		[67] = 资源:载入('自用',"网易WDF动画",0xcc000021),
		[68] = 资源:载入('自用',"网易WDF动画",0xcc000022),
		[70] = 资源:载入('wzife.wd1',"网易WDF动画",0x1f24a7ee).精灵,--竖线
		[71] = 资源:载入('wzife.wd1',"网易WDF动画",0xECEDD9A8).精灵,--横线
		[72] = 按钮.创建(资源:载入("wzife.wdf","网易WDF动画",0x7AB5584C),0,0,4,true,true),
		[73] = 按钮.创建(资源:载入("wzife.wdf","网易WDF动画",0xCB50AB1D),0,0,4,true,true),
		[74] = 按钮.创建(资源:载入("wzife.wd1","网易WDF动画",0x9b8b77d9),0,0,4,true,true),
		[75] = 按钮.创建(资源:载入("wzife.wd1","网易WDF动画",0x9b8b77d9),0,0,4,true,true),


	}
	for i=81,90 do
		self.资源组[i] = 按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0x48D2590A),0,0,4,true,true,"领取奖励")
		self.资源组[i]:绑定窗口_("VIP")
	end
	self.资源组[70]:置区域(0,0,430,5)
	self.资源组[71]:置区域(0,0,7,255)
	for i=4,8 do
	   self.资源组[2]:绑定窗口_("VIP")
	   self.资源组[i]:绑定窗口_("VIP")
	end
	self.资源组[10]:绑定窗口_("VIP")
	self.资源组[11]:绑定窗口_("VIP")
	self.资源组[16]:绑定窗口_("VIP")
	self.资源组[50]:绑定窗口_("VIP")
	self.资源组[72]:绑定窗口_("VIP")
	self.资源组[73]:绑定窗口_("VIP")
	self.资源组[74]:绑定窗口_("VIP")
	self.资源组[75]:绑定窗口_("VIP")




		for i=181,185 do
			self.资源组[i] = 按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0x48D2590A),0,0,4,true,true,"领取奖励")
		end
		-- for i=181,185 do
		--    self.资源组[i]:绑定窗口_("VIP")
		-- end
		for i=101,125 do
			self.资源组[i] = 资源:载入('wzife.wdf',"网易WDF动画",0x8E881BAB)
		end
		for i=171,175 do--装备礼包
			self.资源组[i] = 资源:载入('item.wd1',"网易WDF动画",0x2B44FFFB)
		end
		for i=131,135 do--仙玉
			self.资源组[i] = 资源:载入('item.wd1',"网易WDF动画",0xDF80EAB7)
		end
		for i=141,145 do--饰品
			self.资源组[i] = 资源:载入('item.wd1',"网易WDF动画",0x11DF58C)
		end
		for i=151,155 do--宝石
			self.资源组[i] = 资源:载入('item.wdf',"网易WDF动画",0x9724BCB0)
		end
		for i=161,165 do--宠物蛋
			self.资源组[i] = 资源:载入('common/item.wdf',"网易WDF动画",0x5631E4CF)
		end


	self.zts = tp.字体表.普通字体
	self.zts1 = tp.字体表.描边字体
    self.zts2 = tp.字体表.描边字体
    self.zts3 = require("gge文字类").创建(nil,21,false,false,true)
    self.zts3:置颜色(黑色)
    self.zts2:置颜色(白色)
	self.VIP文字 = tp.字体表.提示字体
	self.领取文字 = tp.字体表.道具字体
	self.领取文字:置颜色(0XFFFFF68F)


	self.控件类 = require("ggeui/加载类")()
	local 总控件 = self.控件类:创建控件('创建控件')
	总控件:置可视(true,true)
	self.输入框 = 总控件:创建输入("CDK输入",385,130,205,14,根)
	self.输入框:置可视(false,false)
	self.输入框:置限制字数(30)
	self.输入框:置光标颜色(-16777216)
	self.输入框:置文字颜色(-16777216)
	self.输入框:置文本("输入CKD码兑换对应的物品")

		self.状态 = 1
		self.加入 = 0
		self.子类状态 = 1
		tp.运行时间 = tp.运行时间 + 1
	    self.窗口时间 = tp.运行时间
	    self.可视 = true
	    self:数据转换(tp.队伍[1].VIP,数据)
	    self.分类=1
	    发送数据(45)
	end
end
function 场景类_梦幻指引:刷新数据(数据)
	self.自动抓鬼=数据
	local 分=math.abs(math.floor((os.time()-self.自动抓鬼.时间)/60))
	self.自动抓鬼.小时= math.abs(math.floor(分/60))
	self.自动抓鬼.分钟= math.abs(math.floor(math.modf((os.time()-self.自动抓鬼.时间)/60)/60))
end
function 场景类_梦幻指引:刷新回收(数据)
	self.自动回收=数据
	if self.自动回收~=nil and self.自动回收.装备==1 then
	   self.资源组[12]:置打勾框(true)
	else
		self.资源组[12]:置打勾框(false)
	end
	if self.自动回收~=nil and self.自动回收.月华露==1 then
	   self.资源组[13]:置打勾框(true)
	else
		self.资源组[13]:置打勾框(false)
	end
	if self.自动回收~=nil and self.自动回收.药品==1 then
	   self.资源组[14]:置打勾框(true)
	else
		self.资源组[14]:置打勾框(false)
	end
	if self.自动回收~=nil and self.自动回收.金柳露==1 then
	   self.资源组[15]:置打勾框(true)
	else
		self.资源组[15]:置打勾框(false)
	end

end
function 场景类_梦幻指引:数据转换(数据,转换)
	self.数据=数据
	self.经验=数据.VIP值
	self.升级数据=转换[1]

	if self.数据.VIP==nil then
	   self.数据.VIP=0
	elseif self.数据.VIP<1 then
	   self.升级数据=转换[1]
	elseif self.数据.VIP<2 then
	   self.升级数据=转换[2]
	elseif self.数据.VIP<3 then
	   self.升级数据=转换[3]
	elseif self.数据.VIP<4 then
	   self.升级数据=转换[4]
	elseif self.数据.VIP<5 then
	   self.升级数据=转换[5]
	elseif self.数据.VIP<6 then
	   self.升级数据=转换[6]
	elseif self.数据.VIP<7 then
	   self.升级数据=转换[7]
	elseif self.数据.VIP<8 then
	   self.升级数据=转换[8]
	elseif self.数据.VIP<9 then
	   self.升级数据=转换[9]
	elseif self.数据.VIP<=10 then
	   self.升级数据=转换[10]


	end

end
function 场景类_梦幻指引:征战刷新(数据,转换)
	if 数据.征战数据==nil then
	   self.征战数据={}
	else
		self.征战数据=数据.征战数据
	end
	self.征战等级=0
	self.征战经验 = 0
	self.征战选中=1
	self.征战奖励=数据.征战奖励
	if 数据.征战数据~=nil and 数据.征战数据.经验~=nil then
	   self.征战经验=数据.征战数据.经验
	end
	if 数据.征战数据~=nil and 数据.征战数据.等级~=nil then
	   self.征战等级=数据.征战数据.等级
	end
	self.征战升级数据=数据.升级经验
	self.征战物品 = {普通奖励={},会员奖励={}}
	for i=1,#self.征战奖励.普通奖励 do
		self.征战物品.普通奖励[i] = tp._物品格子.创建(0,0,i,"道具行囊_物品",tp.资源:载入('wzife.wd1',"网易WDF动画",0xE6490543))
		self.征战物品.会员奖励[i] = tp._物品格子.创建(0,0,i,"道具行囊_物品",tp.资源:载入('wzife.wd1',"网易WDF动画",0xE6490543))

	end
	local wp = tp._物品
	local qq = wp()
	for i=1,#self.征战奖励.普通奖励 do
		qq:置对象(self.征战奖励.普通奖励[i].名称)
		self.征战奖励.普通奖励[i].小模型资源=qq.小模型资源
		self.征战奖励.普通奖励[i].大模型资源=qq.大模型资源
		self.征战奖励.普通奖励[i].资源=qq.资源
		self.征战物品.普通奖励[i]:置物品(self.征战奖励.普通奖励[i])

		qq:置对象(self.征战奖励.会员奖励[i].名称)
		self.征战奖励.会员奖励[i].小模型资源=qq.小模型资源
		self.征战奖励.会员奖励[i].大模型资源=qq.大模型资源
		self.征战奖励.会员奖励[i].资源=qq.资源
		self.征战物品.会员奖励[i]:置物品(self.征战奖励.会员奖励[i])
		if self.征战数据.资格==nil then
		   self.征战物品.普通奖励[i].物品.小模型:灰度级()
		end
		if self.征战数据.VIP==nil then
		   self.征战物品.会员奖励[i].物品.小模型:灰度级()
		end
	end

end
function 场景类_梦幻指引:显示(dt,x,y)
	self.焦点 = false
	self.资源组[1]:显示(self.x+80,self.y+70)
	self.资源组[2]:显示(self.x+150,self.y+120)
	--self.资源组[8]:显示(self.x+150,self.y+160)
	self.资源组[10]:显示(self.x+150,self.y+160)
	self.资源组[11]:显示(self.x+150,self.y+200)
	--self.资源组[50]:显示(self.x+150,self.y+280)
	self.资源组[16]:显示(self.x+150,self.y+240)
	self.资源组[49]:显示(self.x+750,self.y+80)
	self.资源组[66]:显示(self.x+150,self.y+280)
	self.资源组[2]:更新(x,y)
	self.资源组[8]:更新(x,y)
	self.资源组[10]:更新(x,y)
	self.资源组[11]:更新(x,y)
	self.资源组[50]:更新(x,y)
	self.资源组[16]:更新(x,y)
	self.资源组[49]:更新(x,y)
	self.资源组[66]:更新(x,y)
	if self.资源组[49]:事件判断() then
		self.可视 = false
	end
	if self.资源组[2]:事件判断() then
		self.分类=1
	elseif self.资源组[8]:事件判断() then
		self.分类=2
	elseif self.资源组[10]:事件判断() then
		self.分类=3
	elseif self.资源组[11]:事件判断() then
		self.分类=4
	elseif self.资源组[50]:事件判断() then
		self.分类=5
	elseif self.资源组[16]:事件判断() then
		self.分类=7
	elseif self.资源组[66]:事件判断() then
		引擎.运行(全局地址)
	end
    if  self.分类==1 then
		self.资源组[6]:更新(x,y)
		self.资源组[7]:更新(x,y)
		self.资源组[6]:显示(self.x+300,self.y+455)
		self.资源组[7]:显示(self.x+715,self.y+455)
		if self.资源组[6]:事件判断() then
			if self.选中>1 then
			   self.选中=self.选中-1
			end
		end
		if self.资源组[7]:事件判断() then
			if self.选中<2 then
			   self.选中=self.选中+1
			end
		end
	    self.资源组[9]:置区域(0,0,min(floor(self.经验 / self.升级数据 * 200),200),16)
	    self.资源组[9]:显示(self.x + 417,self.y + 129)
		self.资源组[3]:显示(self.x+300,self.y+120)
		self.zts:显示(self.x+330,self.y+127,"VIP"..self.数据.VIP)
		self.zts2:显示(self.x+500,self.y+128,self.经验.."/"..self.升级数据)
		self.资源组[4]:更新(x,y)
		self.资源组[4]:显示(self.x+670,self.y+127)
		if self.资源组[4]:是否选中(x,y) then
				tp.提示:自定义(self.x+670,self.y+170,"#Y/VIP经验是内充1:1转换,月卡首冲都算！\n#G/若数据延迟重启后可看到VIP经验增加 \n#S/首冲征战会员月卡抓鬼也将计算VIP经验")
		end

		self.xxx=0
		self.yyy=0
		for i=1,25 do
			if self.xxx>=5 then
			    self.yyy=self.yyy+1
			    self.xxx=0
			end
			self.资源组[100+i]:显示(self.x+370+self.xxx*57,self.y+180+self.yyy*57)
			self.xxx=self.xxx+1
		end
		if self.选中==1 then
			self.资源组[181]:更新(x,y,self.数据.VIP>=1 and self.数据.礼包.VIP1~=nil)
			self.资源组[182]:更新(x,y,self.数据.VIP>=2 and self.数据.礼包.VIP2~=nil)
			self.资源组[183]:更新(x,y,self.数据.VIP>=3 and self.数据.礼包.VIP3~=nil)
			self.资源组[184]:更新(x,y,self.数据.VIP>=4 and self.数据.礼包.VIP4~=nil)
			self.资源组[185]:更新(x,y,self.数据.VIP>=5 and self.数据.礼包.VIP5~=nil)
			for i=1,5 do
				self.zts3:显示(self.x+210+100,self.y+i*57+60+80,"VIP"..i)
				self.资源组[180+i]:显示(self.x+565+100,self.y+i*57+63+80)
				self.资源组[170+i]:显示(self.x+276+100,self.y+i*57+63-10+80)
				self.资源组[130+i]:显示(self.x+276+57+100,self.y+i*57+63-15+80)
				--self.资源组[140+i]:显示(self.x+276+57+57+100,self.y+i*57+63-13+80)
				--self.资源组[150+i]:显示(self.x+276+57+57+57+100,self.y+i*57+63-13+80)
				--self.资源组[160+i]:显示(self.x+276+57+57+57+57+100,self.y+i*57+63-13+80)
				if self.资源组[180+i]:事件判断() then
					发送数据(47.77,{i})
				end
			end
			-- if self.资源组[171]:是否选中(x,y) then
			-- 	tp.提示:自定义(x-42,y+27,"可获得一套无级别120级装备礼包")
			-- elseif self.资源组[172]:是否选中(x,y) then
			-- 	tp.提示:自定义(x-42,y+27,"可获得一套无级别130级装备礼包")
			-- elseif self.资源组[173]:是否选中(x,y) then
			-- 	tp.提示:自定义(x-42,y+27,"可获得一套无级别40级装备礼包")
			-- elseif self.资源组[174]:是否选中(x,y) then
			-- 	tp.提示:自定义(x-42,y+27,"可获得一套无级别150级装备礼包")
			if self.资源组[175]:是否选中(x,y) then
				tp.提示:自定义(x-42,y+27,"可获得一套无级别160级装备礼包")
			elseif self.资源组[131]:是否选中(x,y) then
				tp.提示:自定义(x-42,y+27,"获得1E银子")
			elseif self.资源组[132]:是否选中(x,y) then
				tp.提示:自定义(x-42,y+27,"获得2E银子")
			elseif self.资源组[133]:是否选中(x,y) then
				tp.提示:自定义(x-42,y+27,"获得3E银子")
			elseif self.资源组[134]:是否选中(x,y) then
				tp.提示:自定义(x-42,y+27,"获得5E银子")
			elseif self.资源组[135]:是否选中(x,y) then
				tp.提示:自定义(x-42,y+27,"获得10E银子")
			-- elseif self.资源组[141]:是否选中(x,y) then
			-- 	tp.提示:自定义(x-42,y+27,"可获得一套无级别60级灵饰一套")
			-- elseif self.资源组[142]:是否选中(x,y) then
			-- 	tp.提示:自定义(x-42,y+27,"可获得一套无级别80级灵饰一套")
			-- elseif self.资源组[143]:是否选中(x,y) then
			-- 	tp.提示:自定义(x-42,y+27,"可获得一套无级别100级灵饰一套")
			-- elseif self.资源组[144]:是否选中(x,y) then
			-- 	tp.提示:自定义(x-42,y+27,"可获得一套无级别120级灵饰一套")
			-- elseif self.资源组[145]:是否选中(x,y) then
			-- 	tp.提示:自定义(x-42,y+27,"可获得一套无级别140级灵饰一套")
			-- elseif self.资源组[151]:是否选中(x,y) then
			-- 	tp.提示:自定义(x-42,y+27,"全套10级宝石")
			-- elseif self.资源组[152]:是否选中(x,y) then
			-- 	tp.提示:自定义(x-42,y+27,"全套11级宝石")
			-- elseif self.资源组[153]:是否选中(x,y) then
			-- 	tp.提示:自定义(x-42,y+27,"全套12级宝石")
			-- elseif self.资源组[154]:是否选中(x,y) then
			-- 	tp.提示:自定义(x-42,y+27,"全套13级宝石")
			-- elseif self.资源组[155]:是否选中(x,y) then
			-- 	tp.提示:自定义(x-42,y+27,"全套14级宝石")
			-- elseif self.资源组[161]:是否选中(x,y) then
			-- 	tp.提示:自定义(x-42,y+27,"哈哈哈")
			-- elseif self.资源组[162]:是否选中(x,y) then
			-- 	tp.提示:自定义(x-42,y+27,"哈哈哈)")
			-- elseif self.资源组[163]:是否选中(x,y) then
			-- 	tp.提示:自定义(x-42,y+27,"哈哈哈")
			-- elseif self.资源组[164]:是否选中(x,y) then
			-- 	tp.提示:自定义(x-42,y+27,"哈哈哈")
			-- elseif self.资源组[165]:是否选中(x,y) then
			-- 	tp.提示:自定义(x-42,y+27,"哈哈哈")
			end
		elseif self.选中==2 then
			self.资源组[181]:更新(x,y,self.数据.VIP>=6 and self.数据.礼包.VIP6~=nil)
			self.资源组[182]:更新(x,y,self.数据.VIP>=7 and self.数据.礼包.VIP7~=nil)
			self.资源组[183]:更新(x,y,self.数据.VIP>=8 and self.数据.礼包.VIP8~=nil)
			self.资源组[184]:更新(x,y,self.数据.VIP>=9 and self.数据.礼包.VIP9~=nil)
			self.资源组[185]:更新(x,y,self.数据.VIP>=10 and self.数据.礼包.VIP10~=nil)
			for i=1,5 do
				self.zts3:显示(self.x+210+100,self.y+i*57+60+80,"VIP"..i+5)
				self.资源组[180+i]:显示(self.x+565+100,self.y+i*57+63+80)
				self.资源组[170+i]:显示(self.x+276+100,self.y+i*57+63-10+80)
				self.资源组[130+i]:显示(self.x+276+57+100,self.y+i*57+63-15+80)
				self.资源组[140+i]:显示(self.x+276+57+57+100,self.y+i*57+63-13+80)
				self.资源组[150+i]:显示(self.x+276+57+57+57+100,self.y+i*57+63-13+80)
				--self.资源组[160+i]:显示(self.x+276+57+57+57+57+100,self.y+i*57+63-13+80)
				if self.资源组[180+i]:事件判断() then
					发送数据(47.77,{i+5})
				end
			end
			if self.资源组[171]:是否选中(x,y) then
				tp.提示:自定义(x-42,y+27,"称号----独步青云")
			elseif self.资源组[172]:是否选中(x,y) then
				tp.提示:自定义(x-42,y+27,"称号----剑指苍穹")
			elseif self.资源组[173]:是否选中(x,y) then
				tp.提示:自定义(x-42,y+27,"称号----盖世无双")
			elseif self.资源组[174]:是否选中(x,y) then
				tp.提示:自定义(x-42,y+27,"称号----龙皇")
			elseif self.资源组[175]:是否选中(x,y) then
				tp.提示:自定义(x-42,y+27,"称号----神豪")
			elseif self.资源组[131]:是否选中(x,y) then
				tp.提示:自定义(x-42,y+27,"获得20E银子")
			elseif self.资源组[132]:是否选中(x,y) then
				tp.提示:自定义(x-42,y+27,"获得30E银子")
			elseif self.资源组[133]:是否选中(x,y) then
				tp.提示:自定义(x-42,y+27,"获得40E银子")
			elseif self.资源组[134]:是否选中(x,y) then
				tp.提示:自定义(x-42,y+27,"获得60E银子")
			elseif self.资源组[135]:是否选中(x,y) then
				tp.提示:自定义(x-42,y+27,"获得100E银子")
			elseif self.资源组[141]:是否选中(x,y) then
				tp.提示:自定义(x-42,y+27,"气血1000")
			elseif self.资源组[142]:是否选中(x,y) then
				tp.提示:自定义(x-42,y+27,"魔法1000")
			elseif self.资源组[143]:是否选中(x,y) then
				tp.提示:自定义(x-42,y+27,"防御200")
			elseif self.资源组[144]:是否选中(x,y) then
				tp.提示:自定义(x-42,y+27,"速度100")
			elseif self.资源组[145]:是否选中(x,y) then
				tp.提示:自定义(x-42,y+27,"伤害200\n灵力200")  --\n
			elseif self.资源组[151]:是否选中(x,y) then
				tp.提示:自定义(x-42,y+27,"全套15级宝石")
			elseif self.资源组[152]:是否选中(x,y) then
				tp.提示:自定义(x-42,y+27,"全套16级宝石")
			elseif self.资源组[153]:是否选中(x,y) then
				tp.提示:自定义(x-42,y+27,"全套17级宝石")
			elseif self.资源组[154]:是否选中(x,y) then
				tp.提示:自定义(x-42,y+27,"全套18级宝石")
			elseif self.资源组[155]:是否选中(x,y) then
				tp.提示:自定义(x-42,y+27,"全套19级宝石")
			-- elseif self.资源组[161]:是否选中(x,y) then
			-- 	tp.提示:自定义(x-42,y+27,"哈哈哈")
			-- elseif self.资源组[162]:是否选中(x,y) then
			-- 	tp.提示:自定义(x-42,y+27,"哈哈哈)")
			-- elseif self.资源组[163]:是否选中(x,y) then
			-- 	tp.提示:自定义(x-42,y+27,"哈哈哈")
			-- elseif self.资源组[164]:是否选中(x,y) then
			-- 	tp.提示:自定义(x-42,y+27,"哈哈哈")
			-- elseif self.资源组[165]:是否选中(x,y) then
			-- 	tp.提示:自定义(x-42,y+27,"哈哈哈")
			end
		end






    elseif self.分类==2 then
	    self.资源组[9]:置区域(0,0,min(floor(self.经验 / self.升级数据 * 200),200),16)
	    self.资源组[9]:显示(self.x + 417,self.y + 129)
		self.资源组[3]:显示(self.x+300,self.y+120)
		self.zts:显示(self.x+330,self.y+127,"VIP"..self.数据.VIP)
		self.zts2:显示(self.x+500,self.y+128,self.经验.."/"..self.升级数据)
		self.资源组[4]:更新(x,y)
		self.资源组[4]:显示(self.x+670,self.y+127)
		if self.资源组[4]:是否选中(x,y) then
			tp.提示:自定义(self.x+670,self.y+170,"#Y/VIP经验是内充1:1转换,月卡首冲都算！\n#G/若数据延迟重启后可看到VIP经验增加 \n#S/首冲征战会员月卡抓鬼也将计算VIP经验")
		end
		self.zts3:显示(self.x+420,self.y+370,"每日首冲任意金额领取奖励")
		self.资源组[4]:更新(x,y)
		self.资源组[5]:更新(x,y)
		self.资源组[4]:显示(self.x+670,self.y+127)
		self.资源组[5]:显示(self.x+460,self.y+400)
		self.领取文字:显示(self.x+480,self.y+403,"领   取")
		self.资源组[20]:置宽高(420,170)
		if self.资源组[5]:事件判断() then
			发送数据(47.77,{11})
		end
			local xx = 0
			local yy = 0
			for i=1,1 do
				local jx = self.x+35
				local jy = self.y+i*168-85
				self.资源组[20]:显示(jx+271,jy+100)
				self.资源组[20]:显示(jx+272,jy+100)
				i = i+self.加入
				for n=1,#每日首冲[i] do
					self.资源组[21]:显示(jx+253+28+xx*70,jy+100+10+yy*65)
					每日首冲[i][n][2]:显示(jx+253+28+xx*70,jy+100+10+yy*65)
					if self.资源组[21]:是否选中(x,y) and self.鼠标 and not tp.消息栏焦点  then
						tp.提示:自定义(x,y,每日首冲[i][n][1])
						if mouseb(0) then
							--tp.提示:写入("#y/该任务已完成")
						end
						self.焦点 = true
					end
					xx = xx + 1
					if xx == 6 then
						xx = 0
						yy = yy + 1
					end
				end
			end
    elseif self.分类==3 then
	    self.资源组[9]:置区域(0,0,min(floor(self.经验 / self.升级数据 * 200),200),16)
	    self.资源组[9]:显示(self.x + 417,self.y + 129)
		self.资源组[3]:显示(self.x+300,self.y+120)
		self.zts:显示(self.x+330,self.y+127,"VIP"..self.数据.VIP)
		self.zts2:显示(self.x+500,self.y+128,self.经验.."/"..self.升级数据)
		self.资源组[4]:更新(x,y)
		self.资源组[4]:显示(self.x+670,self.y+127)
		self.VIP文字:显示(self.x+400,self.y+152,"每日额外领取500点卡")
		if self.资源组[4]:是否选中(x,y) then
			tp.提示:自定义(self.x+670,self.y+170,"#Y/VIP经验是内充1:1转换,月卡首冲都算！\n#G/若数据延迟重启后可看到VIP经验增加 \n#S/首冲征战会员月卡抓鬼也将计算VIP经验")
		end
		self.zts3:显示(self.x+420,self.y+370,"月卡用户每日领取1次,共31次")
		self.资源组[4]:更新(x,y)
		self.资源组[5]:更新(x,y)
		self.资源组[4]:显示(self.x+670,self.y+127)
		self.资源组[5]:显示(self.x+460,self.y+400)
		self.领取文字:显示(self.x+480,self.y+403,"领   取")
		self.资源组[20]:置宽高(420,80)
		if self.资源组[5]:事件判断() then
			发送数据(47.77,{12})
		end
			local xx = 0
			local yy = 0
			for i=1,1 do
				local jx = self.x+35
				local jy = self.y+i*168-85
				self.资源组[20]:显示(jx+271,jy+100)
				self.资源组[20]:显示(jx+272,jy+100)
				i = i+self.加入
				for n=1,#月卡福利[i] do
					self.资源组[21]:显示(jx+253+28+xx*70,jy+100+10+yy*65)
					月卡福利[i][n][2]:显示(jx+253+28+xx*70,jy+100+10+yy*65)
					if self.资源组[21]:是否选中(x,y) and self.鼠标 and not tp.消息栏焦点  then
						tp.提示:自定义(x,y,月卡福利[i][n][1])
						if mouseb(0) then
							--tp.提示:写入("#y/该任务已完成")
						end
						self.焦点 = true
					end
					xx = xx + 1
					if xx == 6 then
						xx = 0
						yy = yy + 1
					end
				end
			end
    elseif self.分类==4 then
	    self.资源组[9]:置区域(0,0,min(floor(self.经验 / self.升级数据 * 200),200),16)
	    self.资源组[9]:显示(self.x + 417,self.y + 129)
		self.资源组[3]:显示(self.x+300,self.y+120)
		self.zts:显示(self.x+330,self.y+127,"VIP"..self.数据.VIP)
		self.zts2:显示(self.x+500,self.y+128,self.经验.."/"..self.升级数据)
		self.资源组[4]:更新(x,y)
		self.资源组[4]:显示(self.x+670,self.y+127)
		if self.资源组[4]:是否选中(x,y) then
			tp.提示:自定义(self.x+670,self.y+170,"#Y/温馨提示:开启该功能后背包里需要有眼,每个鬼消耗一个,如果背包没有天眼则自动关闭该功能,物品回收功能不需要开启自动抓鬼功能也可以使用")
		end
		self.资源组[4]:更新(x,y)
		self.资源组[5]:更新(x,y)
		self.资源组[4]:显示(self.x+670,self.y+127)
		self.资源组[5]:显示(self.x+460,self.y+400)
		self.领取文字:显示(self.x+480,self.y+403,"开   启")
		self.资源组[20]:置宽高(420,30)

		self.资源组[12]:更新(x,y)
		self.资源组[12]:显示(self.x+305,self.y+220)
		self.zts2:显示(self.x+350,self.y+225,"自动回收背包90级以下装备")
		if self.资源组[12]:事件判断() then
			发送数据(46.1)
		end


		self.资源组[13]:更新(x,y)
		self.资源组[13]:显示(self.x+305,self.y+250)
		self.zts2:显示(self.x+350,self.y+255,"自动回收背包里所有月华露")
		if self.资源组[13]:事件判断() then
			发送数据(46.2)
		end

		self.资源组[14]:更新(x,y)
		self.资源组[14]:显示(self.x+305,self.y+280)
		self.zts2:显示(self.x+350,self.y+285,"自动回收背包里所有药品类")
		if self.资源组[14]:事件判断() then
			发送数据(46.3)
		end
		self.资源组[15]:更新(x,y)
		self.资源组[15]:显示(self.x+305,self.y+310)
		self.zts2:显示(self.x+350,self.y+315,"自动回收背包里所有金柳露")
		if self.资源组[15]:事件判断() then
			发送数据(46.4)
		end


		if self.资源组[5]:事件判断() then
			发送数据(46.9)
		end
		local jx = self.x+35
		local jy = self.y+168-85
		self.资源组[20]:显示(jx+271,jy+100)
		self.资源组[20]:显示(jx+272,jy+100)
		if self.自动抓鬼==nil then
				self.zts:显示(self.x+440,self.y+190,"您还未开通自动抓鬼功能")
		else

				self.zts:显示(self.x+350,self.y+190,"您当前的自动抓鬼时长还剩下:"..self.自动抓鬼.小时.."时"..self.自动抓鬼.分钟.."分,共:"..math.abs(os.time()-self.自动抓鬼.时间).."秒")
		end
    elseif self.分类==5 then
	    self.资源组[9]:置区域(0,0,min(floor(self.征战经验 / self.征战升级数据 * 200),200),16)
	    self.资源组[9]:显示(self.x + 417,self.y + 129)
		self.资源组[3]:显示(self.x+300,self.y+120)
		self.zts:显示(self.x+333,self.y+127,self.征战等级.."级")
		self.zts2:显示(self.x+500,self.y+128,self.征战经验.."/"..self.征战升级数据)
		self.资源组[4]:更新(x,y)
		self.资源组[4]:显示(self.x+670,self.y+127)
		if self.资源组[4]:是否选中(x,y) then
			tp.提示:自定义(self.x+670,self.y+170,"#Y/VIP经验是内充1:1转换,月卡首冲都算！\n#G/若数据延迟重启后可看到VIP经验增加 \n#S/首冲征战会员月卡抓鬼也将计算VIP经验")
		end


   		 self.资源组[67]:显示(self.x+80,self.y+60)
    	--self.资源组[68]:显示(self.x+160,self.y-110)
		local xx = 0
		local yy = 0
		for i=1+(self.征战选中-1)*5,(self.征战选中-1)*5+5 do
			if self.征战物品.普通奖励[i]~=nil then
				self.征战物品.普通奖励[i]:置坐标(self.x+370+xx*230,self.y+222+yy*50)
				self.征战物品.普通奖励[i]:显示(dt,x,y,true)
				if self.征战物品.普通奖励[i].焦点 and not tp.消息栏焦点 then
						tp.提示:道具行囊(x,y,self.征战物品.普通奖励[i].物品,true)
				end
			end
			self.zts3:显示(self.x+310+xx*230,self.y+235+yy*50,i.."级:")

			if self.征战物品.会员奖励[i]~=nil then
				self.征战物品.会员奖励[i]:置坐标(self.x+370+230,self.y+222+yy*50)
				self.征战物品.会员奖励[i]:显示(dt,x,y,true)
				if self.征战物品.会员奖励[i].焦点 and not tp.消息栏焦点 then
						tp.提示:道具行囊(x,y,self.征战物品.会员奖励[i].物品,true)
				end
			end
			self.zts3:显示(self.x+310+230,self.y+235+yy*50,i.."级:")


			yy=yy+1
		end
		local xx = 0
		local yy = 0
		self.资源组[72]:更新(x,y)
		self.资源组[73]:更新(x,y)
		self.资源组[71]:显示(self.x+515,self.y+222)
		self.资源组[72]:显示(self.x+512.5,self.y+232)
		self.资源组[73]:显示(self.x+512.5,self.y+447)
		if self.征战数据.资格==nil then
			self.资源组[74]:更新(x,y)
			self.资源组[74]:显示(self.x+310,self.y+152)
			if self.资源组[74]:事件判断() then
				发送数据(119,{位置=1})
			end
		end
		if  self.征战数据.资格~=nil and self.征战数据.VIP==nil then
			self.资源组[75]:更新(x,y)
			self.资源组[75]:显示(self.x+650,self.y+152)
			if self.资源组[75]:事件判断() then
				发送数据(119,{位置=2})
			end
		end





		if self.资源组[72]:事件判断() then
		   self.征战选中=self.征战选中-1
		   if self.征战选中<1 then
		   	  self.征战选中=1
		   end
		end
		if self.资源组[73]:事件判断() then
		   self.征战选中=self.征战选中+1
		   if self.征战选中>#self.征战物品.普通奖励/5 then
		   	  self.征战选中=1
		   end
		end
		for i=1,6 do
			self.资源组[70]:显示(self.x+300+xx*230,self.y+222+yy*50)
			yy=yy+1
		end
		local xx = 0
		local yy = 0
		for i=1,10 do
			if i>5 then
				self.资源组[80+i]:更新(x,y,self.征战数据.VIP~=nil and self.征战数据.等级~=nil and self.征战数据.等级>=i+(self.征战选中-1)*5-5 and self.征战数据.会员奖励[i+(self.征战选中-1)*5-5]==nil)
			else
				self.资源组[80+i]:更新(x,y,self.征战数据.资格~=nil and self.征战数据.等级~=nil and self.征战数据.等级>=i+(self.征战选中-1)*5 and self.征战数据.普通奖励[i+(self.征战选中-1)*5]==nil)
			end
			self.资源组[80+i]:显示(self.x+370+55+xx*230,self.y+237+yy*50)

			if self.资源组[80+i]:事件判断() then
				 发送数据(118,{位置=i+(self.征战选中-1)*5,原位置=i})
			end
			yy=yy+1
			if i==5 then
				xx=xx+1
				yy=0
			end
		end



    elseif self.分类==7 then
    	self.输入框:置坐标(self.x+30,self.y+0)
		self.输入框:置可视(true,true)
		self.控件类:更新(dt,x,y)
		self.控件类:显示(x,y)

		self.资源组[5]:更新(x,y)
		self.资源组[5]:显示(self.x+460,self.y+400)
		self.领取文字:显示(self.x+480,self.y+403,"领   取")
		if 引擎.按键按住(KEY.CTRL) and 引擎.按键按下(KEY.V) then
	  		self.输入框:置文本(取剪贴板())
	    end
		if self.资源组[5]:事件判断() then
			发送数据(52,{self.输入框:取文本()})
		end

    end

end

function 场景类_梦幻指引:检查点(x,y)
	if self.资源组[1]:是否选中(x,y)  then
		return true
	end
end


function 场景类_梦幻指引:初始移动(x,y)
	tp.运行时间 = tp.运行时间 + 1
	-- if not tp.消息栏焦点 then
 --  		self.窗口时间 = tp.运行时间
 -- 	end
	-- if not self.焦点 then
	-- 	tp.移动窗口 = true
	-- end
	-- if self.可视 and self.鼠标 and  not self.焦点 then
	-- 	self.xx = x - self.x
	-- 	self.yy = y - self.y
	-- end
end

function 场景类_梦幻指引:开始移动(x,y)
	if self.可视 and self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 场景类_梦幻指引