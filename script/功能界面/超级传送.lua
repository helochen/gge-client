--======================================================================--
-- @作者: 幕神
-- @QQ：303343650
-- @创建时间: 2021-01-13 02:34:19
-- @Last Modified time: 2021-01-13 21:33:24
--======================================================================--
local 系统类_超级传送 = class()
local floor = math.floor
local tp,zts,zt
local format = string.format
local insert = table.insert

function 系统类_超级传送:初始化(根)
	self.x = 120
	self.y = 120
	self.xx = 0
	self.yy = 0
	self.注释 = "超级传送"
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

function 系统类_超级传送:打开(数据)
	if self.可视 then
		self.可视 = false
		self.资源组=nil
		return
	else
		insert(tp.窗口_,self)
		local 资源 = tp.资源
		local 按钮 = tp._按钮
		local 自适应 = tp._自适应
		self.动态1 = 资源:载入('wzife.wd2',"网易WDF动画",0x103FA0FF)
		self.动态2 = 资源:载入('wzife.wd2',"网易WDF动画",0x8E28D6F3)
		self.动态3 = 资源:载入('wzife.wd2',"网易WDF动画",0x76F0D6C6)
		self.动态4 = 资源:载入('wzife.wd2',"网易WDF动画",0x7F01F6E7)
		self.动态5 = 资源:载入('wzife.wd2',"网易WDF动画",0x71321C77)
		self.聊天 = 资源:载入('wzife.wd2',"网易WDF动画",0x98AAC807)
		self.资源组 = {
			[1] = 资源:载入('wzife.wd5',"网易WDF动画",0x01000081),
			[2] = 按钮.创建(tp.资源:载入('wzife.wd5',"网易WDF动画",0x01000025),0,0,4,true,true),
			[3] = 按钮.创建(tp.资源:载入('wzife.wd4',"网易WDF动画",0xCFC32179),0,0,4,true,true,"  主城传送"),

			[4] = 按钮.创建(tp.资源:载入('wzife.wd4',"网易WDF动画",0xCFC32179),0,0,4,true,true,"  NPC 传送"),
			[5] = 按钮.创建(tp.资源:载入('wzife.wd4',"网易WDF动画",0xCFC32179),0,0,4,true,true,"  野外地图①"),
			[6] = 按钮.创建(tp.资源:载入('wzife.wd4',"网易WDF动画",0xCFC32179),0,0,4,true,true,"  野外地图②"),
			[7] = 按钮.创建(tp.资源:载入('wzife.wd4',"网易WDF动画",0xCFC32179),0,0,4,true,true,"  门派传送"),
			--[7] = 资源:载入('wzife.wdf',"网易WDF动画",0x2DA9D4EC),

			[8] = 资源:载入('wzife.wdf',"网易WDF动画",0x479E857C),
			   -----------主城 -----------
			[9] = 按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0x4BB58ED4),0,0,4,true,true,"   建邺城"),
			[10] = 按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0x4BB58ED4),0,0,4,true,true,"  长安城"),
			[11] = 按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0x4BB58ED4),0,0,4,true,true,"  傲来国"),
			[12] = 按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0x4BB58ED4),0,0,4,true,true,"  长寿村"),
			[13] = 按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0x4BB58ED4),0,0,4,true,true,"  西梁女国"),
			[14] = 按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0x4BB58ED4),0,0,4,true,true,"  宝象国"),
			[15] = 按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0x4BB58ED4),0,0,4,true,true,"  朱紫国"),
			--------------功能NPC------------------------
			[16] = 按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0x4BB58ED4),0,0,4,true,true,"  钱庄老板"),
			[17] = 按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0x4BB58ED4),0,0,4,true,true,"  钟馗"),
			[18] = 按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0x4BB58ED4),0,0,4,true,true,"  袁天罡"),
			[19] = 按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0x4BB58ED4),0,0,4,true,true,"  袁守城"),
			[20] = 按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0x4BB58ED4),0,0,4,true,true,"  商会总管"),
			[21] = 按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0x4BB58ED4),0,0,4,true,true,"  杜少海"),
			[22] = 按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0x4BB58ED4),0,0,4,true,true,"  镖局"),
			[23] = 按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0x4BB58ED4),0,0,4,true,true,"  皇宫护卫"),
			[24] = 按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0x4BB58ED4),0,0,4,true,true,"  土地公公"),
			[25] = 按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0x4BB58ED4),0,0,4,true,true,"  闯关使者"),
			[26] = 按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0x4BB58ED4),0,0,4,true,true,"  仙缘洞天"),
			[27] = 按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0x4BB58ED4),0,0,4,true,true,"  月宫吴刚"),
			[28] = 按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0x4BB58ED4),0,0,4,true,true,"  镇塔之神"),
			[29] = 按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0x4BB58ED4),0,0,4,true,true,"  慧觉和尚"),
			[30] = 按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0x4BB58ED4),0,0,4,true,true,"  疥癞和尚"),
			[31] = 按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0x4BB58ED4),0,0,4,true,true,"  吴举人"),
			-- [32] = 按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0x4BB58ED4),0,0,4,true,true,"  长安城"),
			-- [33] = 按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0x4BB58ED4),0,0,4,true,true,"  长安城"),
			-- [34] = 按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0x4BB58ED4),0,0,4,true,true,"  长安城"),
			-- [35] = 按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0x4BB58ED4),0,0,4,true,true,"  长安城"),
			-- [36] = 按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0x4BB58ED4),0,0,4,true,true,"  长安城"),
			---------------------野外1-----------
			[37] = 按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0x4BB58ED4),0,0,4,true,true,"  东海湾"),
			[38] = 按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0x4BB58ED4),0,0,4,true,true,"  江南野外"),
			[39] = 按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0x4BB58ED4),0,0,4,true,true,"  大唐国境"),
			[40] = 按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0x4BB58ED4),0,0,4,true,true,"  大唐境外"),
			[41] = 按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0x4BB58ED4),0,0,4,true,true,"  墨家村"),
			[42] = 按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0x4BB58ED4),0,0,4,true,true,"  长寿郊外"),
			[43] = 按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0x4BB58ED4),0,0,4,true,true,"  碗子山"),
			[44] = 按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0x4BB58ED4),0,0,4,true,true,"  生死劫"),
			[45] = 按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0x4BB58ED4),0,0,4,true,true,"  观星台"),
			[46] = 按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0x4BB58ED4),0,0,4,true,true,"  仙缘洞天"),
			[47] = 按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0x4BB58ED4),0,0,4,true,true,"  柳林坡"),
			[48] = 按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0x4BB58ED4),0,0,4,true,true,"  北俱芦洲"),
			[49] = 按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0x4BB58ED4),0,0,4,true,true,"  丝绸之路"),
			[50] = 按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0x4BB58ED4),0,0,4,true,true,"  比丘国"),
			[51] = 按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0x4BB58ED4),0,0,4,true,true,"  须弥东界"),
			[52] = 按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0x4BB58ED4),0,0,4,true,true,"  海底5层"),
			[53] = 按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0x4BB58ED4),0,0,4,true,true,"  地狱5层"),
			[54] = 按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0x4BB58ED4),0,0,4,true,true,"  龙窟7层"),
			[55] = 按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0x4BB58ED4),0,0,4,true,true,"  凤巢7层"),
			[56] = 按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0x4BB58ED4),0,0,4,true,true,"  女娲神迹"),
			--[57] = 按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0x4BB58ED4),0,0,4,true,true,"  长安城"),
			--------------------门派传送------------
			[58] = 按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0x4BB58ED4),0,0,4,true,true,"  方寸山"),
			[59] = 按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0x4BB58ED4),0,0,4,true,true,"  盘丝洞"),
			[60] = 按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0x4BB58ED4),0,0,4,true,true,"  天宫"),
			[61] = 按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0x4BB58ED4),0,0,4,true,true,"  天机城"),
			[62] = 按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0x4BB58ED4),0,0,4,true,true,"  女儿村"),
			[63] = 按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0x4BB58ED4),0,0,4,true,true,"  阴曹地府"),
			[64] = 按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0x4BB58ED4),0,0,4,true,true,"  普陀山"),
			[65] = 按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0x4BB58ED4),0,0,4,true,true,"  女魃墓"),
			[66] = 按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0x4BB58ED4),0,0,4,true,true,"  神木林"),
			[67] = 按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0x4BB58ED4),0,0,4,true,true,"  无底洞"),
			[68] = 按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0x4BB58ED4),0,0,4,true,true,"  凌波城"),
			[69] = 按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0x4BB58ED4),0,0,4,true,true,"  花果山"),
			[70] = 按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0x4BB58ED4),0,0,4,true,true,"  化生寺"),
			[71] = 按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0x4BB58ED4),0,0,4,true,true,"  魔王寨"),
			[72] = 按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0x4BB58ED4),0,0,4,true,true,"  五庄观"),
			[73] = 按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0x4BB58ED4),0,0,4,true,true,"  大唐官府"),
			[74] = 按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0x4BB58ED4),0,0,4,true,true,"  狮驼岭"),
			[75] = 按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0x4BB58ED4),0,0,4,true,true,"  龙宫"),

			-----野外2--------------
			[76] = 按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0x4BB58ED4),0,0,4,true,true,"  蓬莱仙岛"),
			[77] = 按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0x4BB58ED4),0,0,4,true,true,"  凌云渡"),
			[78] = 按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0x4BB58ED4),0,0,4,true,true,"  解阳山"),
			[79] = 按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0x4BB58ED4),0,0,4,true,true,"  麒麟山"),
			[80] = 按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0x4BB58ED4),0,0,4,true,true,"  子母河底"),
			[81] = 按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0x4BB58ED4),0,0,4,true,true,"  太岁府"),
			[82] = 按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0x4BB58ED4),0,0,4,true,true,"  月宫"),
			-- [83] = 按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0x4BB58ED4),0,0,4,true,true,"  长安城"),
			-- [84] = 按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0x4BB58ED4),0,0,4,true,true,"  长安城"),

		}


		self.数据=数据
		tp.运行时间 = tp.运行时间 + 1
	    self.窗口时间 = tp.运行时间
	    self.可视 = true
	    self.进程=1
	    self.信息=1


	end
end

function 系统类_超级传送:刷新(数据)
	--self.数据.信息 = 数据


end

function 系统类_超级传送:显示(dt,x,y)
	self.焦点 = false
	self.动态1:更新(dt)
	self.动态2:更新(dt)
	self.动态3:更新(dt)
	self.动态4:更新(dt)
	self.动态5:更新(dt)
	self.资源组[2]:更新(x,y)
	self.资源组[3]:更新(x,y)
	self.资源组[4]:更新(x,y)
	self.资源组[5]:更新(x,y)
	self.资源组[6]:更新(x,y)
	self.资源组[7]:更新(x,y)
	self.资源组[9]:更新(x,y)
	self.资源组[10]:更新(x,y)
	self.资源组[11]:更新(x,y)
	self.资源组[12]:更新(x,y)
	self.资源组[13]:更新(x,y)
	self.资源组[14]:更新(x,y)
	self.资源组[15]:更新(x,y)
	self.资源组[16]:更新(x,y)
	self.资源组[17]:更新(x,y)
	self.资源组[18]:更新(x,y)
	self.资源组[19]:更新(x,y)
	self.资源组[20]:更新(x,y)
	self.资源组[21]:更新(x,y)
	self.资源组[22]:更新(x,y)
	self.资源组[23]:更新(x,y)
	self.资源组[24]:更新(x,y)
	self.资源组[25]:更新(x,y)
	self.资源组[26]:更新(x,y)
	self.资源组[27]:更新(x,y)
	self.资源组[28]:更新(x,y)
	self.资源组[29]:更新(x,y)
	self.资源组[30]:更新(x,y)
	self.资源组[31]:更新(x,y)

	self.资源组[58]:更新(x,y)
	self.资源组[59]:更新(x,y)
	self.资源组[60]:更新(x,y)
	self.资源组[61]:更新(x,y)
	self.资源组[62]:更新(x,y)
	self.资源组[63]:更新(x,y)
	self.资源组[64]:更新(x,y)
	self.资源组[65]:更新(x,y)
	self.资源组[66]:更新(x,y)
	self.资源组[67]:更新(x,y)
	self.资源组[68]:更新(x,y)
	self.资源组[69]:更新(x,y)
	self.资源组[70]:更新(x,y)
	self.资源组[71]:更新(x,y)
	self.资源组[72]:更新(x,y)
	self.资源组[73]:更新(x,y)
	self.资源组[74]:更新(x,y)
	self.资源组[75]:更新(x,y)
	self.资源组[76]:更新(x,y)
	self.资源组[77]:更新(x,y)
	self.资源组[78]:更新(x,y)
	self.资源组[79]:更新(x,y)
	self.资源组[80]:更新(x,y)
	self.资源组[81]:更新(x,y)
	self.资源组[82]:更新(x,y)

	self.资源组[37]:更新(x,y)
	self.资源组[38]:更新(x,y)
	self.资源组[39]:更新(x,y)
	self.资源组[40]:更新(x,y)
	self.资源组[41]:更新(x,y)
	self.资源组[42]:更新(x,y)
	self.资源组[43]:更新(x,y)
	self.资源组[44]:更新(x,y)
	self.资源组[45]:更新(x,y)
	self.资源组[46]:更新(x,y)
	self.资源组[47]:更新(x,y)
	self.资源组[48]:更新(x,y)
	self.资源组[49]:更新(x,y)
	self.资源组[50]:更新(x,y)
	self.资源组[51]:更新(x,y)
	self.资源组[52]:更新(x,y)
	self.资源组[53]:更新(x,y)
	self.资源组[54]:更新(x,y)
	self.资源组[55]:更新(x,y)
	self.资源组[56]:更新(x,y)



	self.资源组[1]:显示(self.x,self.y)
	self.资源组[2]:显示(self.x + 650,self.y)
	self.资源组[3]:显示(self.x + 55,self.y + 60)
	self.资源组[4]:显示(self.x + 55,self.y + 150)
	self.资源组[5]:显示(self.x + 55,self.y + 195)
	self.资源组[6]:显示(self.x + 55,self.y + 240)
	self.资源组[7]:显示(self.x + 55,self.y + 105)
	self.聊天:显示(self.x +189,self.y+325)

local 发送内容={
       [9]={1501,92,96},                    --长安城"),
       [10] ={1001,377,49},                   --建邺城"),
       [11]={1092,73,53},                      --傲来国"),
       [12]={1070,91,151},                            --长寿村"),
       [13]={1040,108,98},                            --西梁女国"),
       [14]={1226,117,48},                            --宝象国"),
       [15]={1208,128,36},                            --朱紫国"),
----------------------------------
       [16]={1524,36,23},                                -- 钱庄老板"),
       [17]={1001,211,115},   	                            -- 钟馗"),
       [18]={1001,358,35},   	                            -- 袁天罡"),
       [19]={1001,179,263},   	                            -- 袁守城"),
       [20]={1001,323,264},   	                            -- 商会总管"),
       [21]={1001,399,206},   	                            -- 杜少海"),
       [22]={1024,31,24},   	                            -- 镖局"),
       [23]={1001,441,33},   	                            -- 皇宫护卫"),
       [24]={1226,117,15},   	                            -- 土地公公"),
       [25]={1001,130,90},   	                            -- 闯关使者"),
       [26]={1216,90,80},   	                            -- 仙缘洞天"),
       [27]={1114,12,60},   	                            -- 月宫吴刚"),
       [28]={1090,30,27},   	                            -- 镇塔之神"),
       [29]={1070,130,144},   	                            -- 慧觉和尚"),
       [30]={1002,30,79},   	                            -- 疥癞和尚"),
       [31]={1026,26,26},  	                            -- 吴举人"),
--------------------------------------


	  [37]={1506,76,94},                                -- 东海湾"),
	  [38]={1193,72,69},                                -- 江南野外"),
	  [39]={1110,141,166},                                -- 大唐国境"),
	  [40]={1173,345,72},                                -- 大唐境外"),
	  [41]={1218,45,12},                                -- 墨家村"),
	  [42]={1091,77,98},                                -- 长寿郊外"),
	  [43]={1228,59,19},                                -- 碗子山"),
	  [44]={1204,20,44},                                -- 小雷音寺"),
	  [45]={1223,56,32},                                -- 观星台"),
	  [46]={1216,85,75},                                -- 仙缘洞天"),

	  [47]={1233,50,50},                                -- 柳林坡"),
	  [48]={1174,50,50},                                -- 北俱芦洲"),
	  [49]={1235,50,50},                                -- 丝绸之路"),
	  [50]={1232,50,50},                                -- 比丘国"),
	  [51]={1242,50,50},                                -- 须弥东界"),
	  [52]={1532,33,27},                                -- 海底5层"),
	  [53]={1130,50,50},                                -- 地狱4层"),
	  [54]={1183,50,50},                                -- 龙窟7层"),
	  [55]={1192,50,50},                                -- 凤巢7层"),
	  [56]={1201,50,50},                                -- 女娲神迹"),

	-- --------------------------------------

	   [58]={1135,72,63},                              -- 方寸山"),
	   [59]={1513,174,31},                               -- 盘丝洞"),
	   [60]={1111,175,122},                                 -- 天宫"),
	   [61]={1250,63,92},                               -- 天机城"),
	   [62]={1142,37,37},                            -- 女儿村"),
	   [63]={1122,101,102},                               -- 阴曹地府"),
	   [64]= {1140,20,18},                              -- 普陀山"),
	   [65]={1249,51,44},                              -- 女魃墓"),
	   [66]= {1138,46,121},                              -- 神木林"),
	   [67]={1139,61,125},                                 -- 无底洞"),
	   [68]={1150,33,67},                            -- 凌波城"),
	   [69]={1251,38,76},                               -- 花果山"),
	   [70]={1002,7,88},                           -- 化生寺"),
	   [71]={1512,76,29},                              -- 魔王寨"),
	   [72]={1146,26,55},                                -- 五庄观"),
	   [73]={1198,131,82},                           -- 大唐官府"),
	   [74]={1131,109,77},                                 -- 狮驼岭"),
	   [75]={1116,71,77},                           -- 龙宫"),

	   -- ------------------------------
        [76]={1207,50,50},                                     --蓬莱仙岛"),
        [77]={1920,50,50},                                     --凌云渡"),
        [78]={1042,50,50},                                     --解阳山"),
        [79]={1210,50,50},                                     --麒麟山"),
        [80]={1041,50,50},                                     --子母河底"),
        [81]={1211,50,50},                                     --太岁府"),
        [82]={1114,50,50}                                     --月宫"),
	   }




if self.信息 == 1 then
self.动态1:显示(self.x +100,self.y+300)
 zt:显示(self.x+220,self.y+335,"哥哥的腿不是腿，\n\n     塞纳河畔的清水~")
elseif self.信息 == 2 then

self.动态2:显示(self.x +100,self.y+300)
 zt:显示(self.x+220,self.y+335,"别爱我，没结果，\n\n     除非花手摇过我~")
elseif self.信息 == 3 then
self.动态3:显示(self.x +100,self.y+300)
  zt:显示(self.x+220,self.y+335,"你说我是败类，\n\n     我是败类中的败类！~")
elseif self.信息 == 4 then
self.动态4:显示(self.x +100,self.y+300)
 zt:显示(self.x+220,self.y+335,"画画的baby~~，\n\n     画画的baby~~")
elseif self.信息 == 5 then
self.动态5:显示(self.x +100,self.y+300)
  zt:显示(self.x+220,self.y+335,"一出门我就感觉我，\n\n     仙气儿~飘飘~")

end



	if self.资源组[2]:事件判断() then
		self:打开()
		return false
	elseif self.资源组[3]:事件判断() then
		self.进程=1
	elseif self.资源组[4]:事件判断() then
		self.进程=2
	elseif self.资源组[5]:事件判断() then

		self.进程=3
	elseif self.资源组[6]:事件判断() then

		self.进程=4
	elseif self.资源组[7]:事件判断() then

		self.进程=5
	end



if self.进程 == 1 then

		self.资源组[9]:显示(self.x  +220,self.y +62)
	    self.资源组[10]:显示(self.x +330,self.y+62)
		self.资源组[11]:显示(self.x +440,self.y+62)
		self.资源组[12]:显示(self.x +550,self.y+62)
		self.资源组[13]:显示(self.x +220,self.y+112)
		self.资源组[14]:显示(self.x +330,self.y+112)
		self.资源组[15]:显示(self.x +440,self.y+112)
		self.xxx=0
		self.yyy=0

	     for n=9,15 do
		 if self.资源组[n]:事件判断() then
		 	发送数据(100.5,发送内容[n])
		 	self.可视 = false
		   self.资源组=nil
		    return

		 end
	 end
end
if self.进程 == 2 then

	self.资源组[16]:显示(self.x+220,self.y+62)
	self.资源组[17]:显示(self.x+330,self.y+62)
	self.资源组[18]:显示(self.x+440,self.y+62)
	self.资源组[19]:显示(self.x+550,self.y+62)
	self.资源组[20]:显示(self.x+220,self.y+112)
	self.资源组[21]:显示(self.x+330,self.y+112)
	self.资源组[22]:显示(self.x+440,self.y+112)
	self.资源组[23]:显示(self.x+550,self.y+112)
	self.资源组[24]:显示(self.x+220,self.y+162)
	self.资源组[25]:显示(self.x+330,self.y+162)
	self.资源组[26]:显示(self.x+440,self.y+162)
	self.资源组[27]:显示(self.x+550,self.y+162)
	self.资源组[28]:显示(self.x+220,self.y+212)
	self.资源组[29]:显示(self.x+330,self.y+212)
	self.资源组[30]:显示(self.x+440,self.y+212)
	self.资源组[31]:显示(self.x+550,self.y+212)
		self.xxx=0
		self.yyy=0


     for n=16,31 do
		 if self.资源组[n]:事件判断() then
		 	发送数据(100.5,发送内容[n])
		 	self.可视 = false
		    self.资源组=nil
		    return

		 end
	 end
end
if self.进程 == 3 then
    self.资源组[37]:显示(self.x+220,self.y+62)
	self.资源组[38]:显示(self.x+330,self.y+62)
	self.资源组[39]:显示(self.x+440,self.y+62)
	self.资源组[40]:显示(self.x+550,self.y+62)
	self.资源组[41]:显示(self.x+220,self.y+112)
	self.资源组[42]:显示(self.x+330,self.y+112)
	self.资源组[43]:显示(self.x+440,self.y+112)
	self.资源组[44]:显示(self.x+550,self.y+112)
	self.资源组[45]:显示(self.x+220,self.y+162)
	self.资源组[46]:显示(self.x+330,self.y+162)
	self.资源组[47]:显示(self.x+440,self.y+162)
	self.资源组[48]:显示(self.x+550,self.y+162)
	self.资源组[49]:显示(self.x+220,self.y+212)
	self.资源组[50]:显示(self.x+330,self.y+212)
	self.资源组[51]:显示(self.x+440,self.y+212)
	self.资源组[52]:显示(self.x+550,self.y+212)
	self.资源组[53]:显示(self.x+220,self.y+262)
	self.资源组[54]:显示(self.x+330,self.y+262)
	self.资源组[55]:显示(self.x+440,self.y+262)
	self.资源组[56]:显示(self.x+550,self.y+262)

		self.xxx=0
		self.yyy=0
     for n=37,56 do
		 if self.资源组[n]:事件判断() then
		 	发送数据(100.5,发送内容[n])
		 	self.可视 = false
		    self.资源组=nil
		    return

		 end
	 end
end
if self.进程 == 4 then

	self.资源组[76]:显示(self.x + 220,self.y +62)
	self.资源组[77]:显示(self.x + 330,self.y +62)
	self.资源组[78]:显示(self.x + 440,self.y +62)
	self.资源组[79]:显示(self.x + 550,self.y +62)
	self.资源组[80]:显示(self.x + 220,self.y +112)
	self.资源组[81]:显示(self.x + 330,self.y +112)
	self.资源组[82]:显示(self.x + 440,self.y +112)
		self.xxx=0
		self.yyy=0
     for n=76,82 do
		 if self.资源组[n]:事件判断() then
		 	发送数据(100.5,发送内容[n])
		 	self.可视 = false
		    self.资源组=nil
		    return

		 end
	 end
 end
if self.进程 == 5 then

	self.资源组[58]:显示(self.x + 220,self.y +62)
	self.资源组[59]:显示(self.x + 330,self.y +62)
	self.资源组[60]:显示(self.x + 440,self.y +62)
	self.资源组[61]:显示(self.x + 550,self.y +62)
	self.资源组[62]:显示(self.x + 220,self.y +112)
	self.资源组[63]:显示(self.x + 330,self.y +112)
	self.资源组[64]:显示(self.x + 440,self.y +112)
	self.资源组[65]:显示(self.x + 550,self.y +112)
	self.资源组[66]:显示(self.x + 220,self.y +162)
	self.资源组[67]:显示(self.x + 330,self.y +162)
	self.资源组[68]:显示(self.x + 440,self.y +162)
	self.资源组[69]:显示(self.x + 550,self.y +162)
	self.资源组[70]:显示(self.x + 220,self.y +212)
	self.资源组[71]:显示(self.x + 330,self.y +212)
	self.资源组[72]:显示(self.x + 440,self.y +212)
	self.资源组[73]:显示(self.x + 550,self.y +212)
	self.资源组[74]:显示(self.x + 220,self.y +262)
	self.资源组[75]:显示(self.x + 330,self.y +262)
		self.xxx=0
		self.yyy=0

     for n=58,75 do
		  if self.资源组[n]:事件判断() then
		 	发送数据(100.5,发送内容[n])
		 	self.可视 = false
		    self.资源组=nil
		    return

		 end
		 -- self:打开()
	 end
 end
end

function 系统类_超级传送:检查点(x,y)
	if self.资源组 ~= nil and self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 系统类_超级传送:初始移动(x,y)
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

function 系统类_超级传送:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 系统类_超级传送