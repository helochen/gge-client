--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19.
-- @Last Modified time: 2021-04-25 07:06:55
--======================================================================--
local 助战奇经八脉 = class()

local floor = math.floor
local format = string.format
local insert = table.insert
local remove = table.remove
local type = type
local mouseb = 引擎.鼠标弹起
local zts,zts1,tp

local function ms(mx)
	if mx == "飞燕女" then
		return 0x3F40F51A
	elseif mx == "英女侠" then
		return 0x8CE4F5B1
	elseif mx == "巫蛮儿" then
		return 0x7E5A0478
	elseif mx == "偃无师" then
		return 0xB74762FF
	elseif mx == "逍遥生" then
		return 0x2B092186
	elseif mx == "剑侠客" then
		return 0x75F646A9
	elseif mx == "骨精灵" then
		return 0xD26C8968
	elseif mx == "狐美人" then
		return 0x8B625417
	elseif mx == "鬼潇潇" then
		return 0xD70CBA7A
	elseif mx == "杀破狼" then
		return 0x9BF7DC7E
	elseif mx == "巨魔王" then
		return 0xB5F4F713
	elseif mx == "虎头怪" then
		return 0x4BC65441
	elseif mx == "舞天姬" then
		return 0x976BDFDB
	elseif mx == "玄彩娥" then
		return 0x62D522B6
	elseif mx == "桃夭夭" then
		return 0x4F9DF47A
	elseif mx == "羽灵神" then
		return 0x0CE5E05F
	elseif mx == "神天兵" then
		return 0x2F359481
	elseif mx == "龙太子" then
		return 0x784828C1
	end
end

local function sk(mp)
	if mp == "方寸山" then
		return {"苦缠","雷动","奔雷","黄粱","不舍","鬼怮","补缺","不倦","不灭","化身","调息","批亢","斗法","吐纳","飞符炼魂","鬼念","碎甲","摧心","顺势而为","额外能力","钟馗论道"}
	elseif mp == "女儿村" then
		return {"自矜","暗伤","杏花","花舞","倩影","淬芒","傲娇","花护","天香","国色","鸿影","轻霜","机巧","毒引","毒雾","嫣然","磐石","花殇","碎玉弄影","额外能力","鸿渐于陆"}
	elseif mp == "神木林" then
		return {"风灵","法身","咒术","灵压","咒法","蔓延","鞭挞","月影","不侵","风魂","冰锥","血契","滋养","纯净","破杀","追击","灵能","寄生","风卷残云","额外能力","凋零之歌"}
	elseif mp == "化生寺" then
		return {"止戈","销武","佛屠","佛誉","仁心","聚气","佛显","心韧","归气","天照","舍利","感念","慈针","佛性","妙悟","慈心","映法","流刚","渡劫金身","额外能力","诸天看护"}
	elseif mp == "大唐官府" then
		return {"目空","风刃","扶阵","翩鸿一击","勇武","长驱直入","杀意","念心","静岳","干将","勇念","神凝","狂狷","不惊","突进","破空","历战","连破","无敌","额外能力","破军"}
	elseif mp == "阴曹地府" then
		return {"判官","回旋","夜行","入骨","聚魂","六道无量","索魂","伤魂","百炼","黄泉","毒印","百爪狂杀","幽光","泉爆","鬼火","魂飞","汲魂","击破","魑魅缠身","额外能力","夜之王者"}
	elseif mp == "盘丝洞" then
		return {"鼓乐","妖气","怜心","迷瘴","粘附","意乱","绝殇","安抚","忘忧","忘川","迷梦","倾情","情劫","脱壳","迷意","结阵","媚态","利刃","落花成泥","额外能力","偷龙转凤"}
	elseif mp == "无底洞" then
		return {"金莲","追魂","回敬","由己渡人","自愈","陷阱","化莲","风墙","御兽","精进","救人","灵身","持戒","内伤","反先","忍辱","暗潮","噬魂","同舟共济","额外能力","妖风四起"}
	elseif mp == "魔王寨" then
		return {"充沛","炙烤","震怒","蚀天","敛恨","赤暖","火神","震天","神焰","神炎","返火","崩摧","魔冥","燃魂","狂月","威吓","连营","魔心","魔焰滔天","额外能力","烈焰真诀"}
	elseif mp == "狮驼岭" then
		return {"爪印","翼展","驭兽","化血","宁息","兽王","狮吼","怒象","鹰啸","乱破","魔息","威慑","狂袭","失心","羁绊","死地","乱击","悲恸","背水","额外能力","肝胆"}
	elseif mp == "天宫" then
		return {"威吓","疾雷","轰鸣","趁虚","余韵","驭意","震慑","神念","伏魔","苏醒","护佑","电芒","月桂","怒火","灵光","神律","洞察","雷波","画地为牢","额外能力","风雷韵动"}
	elseif mp == "普陀山" then
		return {"化戈","推衍","借灵","莲花心音","生克","默诵","劳心","普渡","化怨","甘露","法印","秘术","灵动","雨润","莲心剑意","玉帛","道衍","法咒","波澜不惊","额外能力","五行制化"}
	elseif mp == "凌波城" then
		return {"山破","战诀","抗击","聚气","神诀","魂聚","神躯","斩魔","不动","力战","破击","怒涛","海沸","怒火","煞气","强袭","雷附","再战","天神怒斩","额外能力)","真君显灵"}
	elseif mp == "五庄观" then
		return {"体恤","锤炼","神附","心浪","养生","强击","归本","修心","混元","修身","同辉","雨杀","乾坤","意境","傲视","陌宝","心随意动","致命","清风望月","额外能力","天命剑法"}
	elseif mp == "龙宫" then
		return {"波涛","破浪","云霄","逐浪","踏涛","清吟","天龙","龙珠","龙骇","龙慑","傲翔","飞龙","戏珠","回魔","月魂","汹涌","龙魄","摧意","亢龙归海","额外能力","雷浪穿云"}
	elseif mp == "女魃墓" then
		return {"腐蚀","引魂","咒怨","不共戴天","灵诅","噬魔","异兆","不灭","灵威","余烬","遗世","怒火","凋零","血泉","俱灭","焕然","伤蚀","狂焰","觉醒","额外能力","无相诛戮"}
	elseif mp == "天机城" then
		return {"锐志","精奇","善工","玄机","催锋","巧偃","连枷","断矶","纯青","无痕","奇肱","攻云","造化","天匠","穷变","鲸甲","天机神迹","不厌","铜山铁壁","额外能力","所向披靡"}
	elseif mp == "花果山" then
		return {"顽心","逐胜","愈勇","斗志","忘形","贪天","显圣","锤炼","火眼","闹天","铁骨","搅海","伏妖","豪胆","压邪","战魄","不坏","荡魔","战神","额外能力","齐天神通"}
	end
end

local function ew(mp)
	if mp == "方寸山" then
		return "学习之后，伤害+%8 防御+%8 灵力+%8 法防+%8 速度+%8"
	elseif mp == "女儿村" then
	    return "学习之后，伤害+%8 防御+%8 灵力+%8 法防+%8 速度+%8"
   elseif mp == "神木林" then
		return "学习之后，伤害+%8 防御+%8 灵力+%8 法防+%8 速度+%8"
	elseif mp == "化生寺" then
		return "学习之后，伤害+%8 防御+%8 灵力+%8 法防+%8 速度+%8"
	elseif mp == "大唐官府" then
		return "学习之后，伤害+%8 防御+%8 灵力+%8 法防+%8 速度+%8"
	elseif mp == "阴曹地府" then
		return "学习之后，伤害+%15 防御+%15 灵力+%5 法防+%15 速度+%5"
	elseif mp == "盘丝洞" then
		return "学习之后，伤害+%15 防御+%15 灵力+%5 法防+%15 速度+%5"
	elseif mp == "无底洞" then
		return "学习之后，伤害+%15 防御+%15 灵力+%5 法防+%15 速度+%5"
	elseif mp == "魔王寨" then
		return "学习之后，伤害+%15 防御+%15 灵力+%5 法防+%15 速度+%5"
	elseif mp == "狮驼岭" then
		return "学习之后，伤害+%15 防御+%15 灵力+%5 法防+%15 速度+%5"
	elseif mp == "天宫" then
		return "学习之后，伤害+%5 防御+%15 灵力+%15 法防+%15 速度+%5"
	elseif mp == "普陀山" then
		return "学习之后，伤害+%5 防御+%15 灵力+%15 法防+%15 速度+%5"
	elseif mp == "凌波城" then
		return "学习之后，伤害+%5 防御+%15 灵力+%15 法防+%15 速度+%5"
	elseif mp == "五庄观" then
		return "学习之后，伤害+%5 防御+%15 灵力+%15 法防+%15 速度+%5"
	elseif mp == "龙宫" then
		return "学习之后，伤害+%5 防御+%15 灵力+%15 法防+%15 速度+%5"
	elseif mp == "女魃墓" then
		return "学习之后，伤害+%15 防御+%15 灵力+%5 法防+%15 速度+%5"
	elseif mp == "天机城" then
		return "学习之后，伤害+%8 防御+%8 灵力+%8 法防+%8 速度+%8"
	elseif mp == "花果山" then
		return "学习之后，伤害+%5 防御+%15 灵力+%15 法防+%15 速度+%5"
	end
end

function 助战奇经八脉:初始化(根)
	self.ID = 33
	self.x = 205
	self.y = 105
	self.xx = 0
	self.yy = 0
	self.注释 = "奇经八脉"
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

function 助战奇经八脉:打开(数据)
	-- if  数据.门派 == "无门派" then
	-- 	tp.提示:写入("#Y/拜入门派才可以打开奇经八脉")
 --        return
 --    end
	if self.可视 then
		for i=1,21 do
			self.资源组[6][i].尝试 = nil
			self.资源组[6][i].技能树 = nil
			self.资源组[6][i].技能 = nil
		end
		self.头像 = nil
		self.选中 = nil
		self.可视 = false
		self.资源组 = nil
		return
	else
		self.数据 = 数据
		self.是否选的=0
		insert(tp.窗口_,self)
		self:加载数据()
		local qj = sk(self.数据.门派)
		if self.数据.门派=="无门派" then
		   tp.提示:写入("#Y/拜入门派才可以打开奇经八脉")
           return
        end
		for m=1,21 do
			local jj = tp._技能()
			jj:置对象(qj[m],2)
			self.资源组[6][m]:置技能(jj)
		end
		if self.数据.奇经八脉.技能树 == nil then
		    self.数据.奇经八脉.技能树 = {1,2,3}
		end
		if self.数据.奇经八脉.技能树 ~= nil and type(self.数据.奇经八脉.技能树) ~= "number" then
			for n=1,#self.数据.奇经八脉.技能树 do
				self.资源组[6][self.数据.奇经八脉.技能树[n]].技能树 = true
			end
		end
		self.资源组[6][20].介绍 = ew(self.数据.门派)
		tp.运行时间 = tp.运行时间 + 1
	 	self.窗口时间 = tp.运行时间
	    self.可视 = true
	end
end
function 助战奇经八脉:加载数据()
	local 资源 = tp.资源
	local 按钮 = tp._按钮
	local 自适应 = tp._自适应
	self.资源组 = {
		[1] = 自适应.创建(0,1,630,467,3,9),
		[2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),
		[3] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"确认加点"),
		[4] = 按钮.创建(自适应.创建(12,4,55,22,1,3),0,0,4,true,true,"取消"),
		[5] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"清空经脉"),
		[6] = {},
		[7] = 资源:载入('wzife.wd4',"网易WDF动画",0x22D22D6D),
		[8] = 自适应.创建(5,1,600,419,3,9),
		[9] = 资源:载入('wzife.wd1',"网易WDF动画",0xECEDD9A8).精灵,
		[10] = 自适应.创建(1,1,592,18,1,3,nil,18),
		[11] = 按钮.创建(自适应.创建(12,4,55,22,1,3),0,0,4,true,true,"兑换"),
	}
	self.资源组[9]:置区域(0,0,2,395)
	for n=2,5 do
	    self.资源组[n]:绑定窗口_(33)
	end
	local jn = tp._技能格子
	for i=1,21 do
		self.资源组[6][i] = jn(0,0,n,"奇经八脉")
	end
	--self.头像 = tp.资源:载入("wzife.wd3","网易WDF动画",ms(self.数据.模型))
end

function 助战奇经八脉:刷新()
	if self.数据.奇经八脉.技能树 ~= nil and type(self.数据.奇经八脉.技能树) ~= "number" then
		for n=1,#self.数据.奇经八脉.技能树 do
			self.资源组[6][self.数据.奇经八脉.技能树[n]].技能树 = true
		end
	end
end

function 助战奇经八脉:开启奇经八脉()
	if self.数据.奇经八脉.开启奇经八脉 ~= nil then -- 避免重复开启
		return
	end
	self.数据.奇经八脉.技能树 = {1,2,3}
	self.数据.装备属性.剩余乾元丹 = 1
	self.数据.奇经八脉.开启奇经八脉 = true
end

function 助战奇经八脉:显示(dt,x,y)
	self.焦点 = false
	self.资源组[2]:更新(x,y)
	self.资源组[3]:更新(x,y,self.选中 ~= nil and self.数据.装备属性.剩余乾元丹 ~= 0)
	self.资源组[4]:更新(x,y,self.选中 ~= nil)
	self.资源组[5]:更新(x,y)
	self.资源组[11]:更新(x,y)
	if self.资源组[2]:事件判断() then
		self:打开()
		return false
		elseif self.资源组[11]:事件判断() then
		发送数据(114.7,{编号=self.数据.编号})
	elseif self.资源组[3]:事件判断() then--确认
		self.数据.奇经八脉[self.资源组[6][self.选中].技能.名称] = 1
		if self.选中 >= 19 then
			self.数据.奇经八脉[self.资源组[6][20].技能.名称] = 1
		end
		local jnc = self.资源组[6][self.选中].技能.名称
		if jnc == "飞符炼魂" or jnc == "顺势而为" or jnc == "钟馗论道" or jnc == "碎玉弄影" or jnc == "鸿渐于陆" or jnc == "风卷残云" or jnc == "凋零之歌" or jnc == "妙悟" or jnc == "诸天看护" then
			local jj = tp._技能()
			jj:置对象(self.资源组[6][self.选中].技能.名称,2)
			insert(self.数据.人物技能,jj)
		end
		local 技能树 = self:技能树(self.选中)
		local qj = sk(self.数据.门派)
		for m=1,#qj do
			local jj = tp._技能()
			jj:置对象(qj[m],2)
			self.资源组[6][m]:置技能(jj)
			self.资源组[6][m].技能树 = nil
			self.资源组[6][m].尝试 = nil
			if 技能树 ~= nil and 技能树[1] == m then
				self.资源组[6][m].技能树 = true
				remove(技能树, 1)
			end
		end
		self.数据.奇经八脉.技能树 = self:技能树(self.选中) or 1
		self.数据.装备属性.剩余乾元丹 = self.数据.装备属性.剩余乾元丹 - 1
		if self.选中~=nil then
		    发送数据(114.5,{序列=self.选中,编号=self.数据.编号})
			self.选中 = nil
		end
	elseif self.资源组[4]:事件判断() then--取消
		self.选中 = nil
		local qj = sk(self.数据.门派)
		local 技能树 = {}
		if self.数据.奇经八脉.技能树 == nil then
			技能树 = {1,2,3}
		else
			if type(self.数据.奇经八脉.技能树) ~= "number" then
				for n=1,#self.数据.奇经八脉.技能树 do
					insert(技能树,self.数据.奇经八脉.技能树[n])
				end
			end
		end
		for m=1,#qj do
			local jj = tp._技能()
			jj:置对象(qj[m],2)
			self.资源组[6][m]:置技能(jj)
			self.资源组[6][m].技能树 = nil
			self.资源组[6][m].尝试 = nil
			if 技能树 ~= nil and 技能树[1] == m then
				self.资源组[6][m].技能树 = true
				remove(技能树, 1)
			end
		end
	elseif self.资源组[5]:事件判断() then --清空
		发送数据(114.6,{编号=self.数据.编号})
	end
	self.资源组[1]:显示(self.x,self.y)
	self.资源组[8]:显示(self.x+14,self.y+30)
	self.资源组[9]:显示(self.x+255,self.y+42)
    self.资源组[11]:显示(self.x+350-75,self.y+415,true)
	if 暖风界面 then
	self.资源组[2]:显示(self.x+611,self.y+3)
	tp.窗口标题:显示(self.x+241,self.y)
	zts1:置字间距(2)
	zts1:显示(self.x+281,self.y+1,self.数据.门派)
	zts1:置字间距(0)
	else
	self.资源组[10]:显示(self.x+6,self.y+3)
	self.资源组[2]:显示(self.x+603,self.y+6)
	tp.窗口标题背景_:置区域(0,0,81,16)
	tp.窗口标题背景_:显示(self.x+272,self.y+3)
	zts1:置字间距(2)
	zts1:显示(self.x+281,self.y+3,"奇经八脉")
	zts1:置字间距(0)
    end
	self.资源组[3]:显示(self.x+350,self.y+415,true)
	self.资源组[4]:显示(self.x+445,self.y+415,true)
	self.资源组[5]:显示(self.x+520,self.y+415,true)
	--self.头像:置颜色(1342177280)
	--self.头像:显示(self.x+((820-self.头像.宽度)/2),self.y+40)
	local xx = 0
	local yy = 1
	self.资源组[7]:更新(dt)
	for n=1,21 do
		self.资源组[6][n]:置坐标(self.x + xx * 75 + 35,self.y + yy * 55 - 5)
		if self.数据.奇经八脉[self.资源组[6][n].技能.名称] == nil and self.资源组[6][n].尝试 == nil then
			self.资源组[6][n].技能.模型:灰度级()
		end
		self.资源组[6][n]:显示(x,y,self.鼠标)
		if self.资源组[6][n].技能树 ~= nil then
			self.资源组[7]:显示(self.x + xx * 75 + 25,self.y + yy * 55 - 14)
		end

		if self.资源组[6][n].技能 ~= nil and self.资源组[6][n].焦点 then
			self.资源组[6][20].技能.介绍 = ew(self.数据.门派)
			tp.提示:经脉技能(x,y,self.资源组[6][n].技能)
			if mouseb(0) and self.资源组[6][n].技能树 ~= nil and self.数据.奇经八脉[self.资源组[6][n].技能.名称] == nil  then
				self.选中 = n
				self.资源组[6][n].尝试 = true
				local qj = sk(self.数据.门派)
				for m=1,#qj do
					local jj = tp._技能()
					jj:置对象(qj[m],2)
					self.资源组[6][m]:置技能(jj)
					self.资源组[6][m].技能树 = nil
				end
			end
		end
		xx = xx + 1
		if xx >= 3 then
			xx = 0
			yy = yy + 1
		end
	end
	zts:置颜色(白色)
	zts:显示(self.x+305,self.y+392,"已用")
	zts:显示(self.x+422,self.y+392,"可用乾元丹")
	zts:显示(self.x+515,self.y+392,"可换乾元丹")
	zts:置颜色(-256)
	zts:显示(self.x+335,self.y+391.8,format("乾元丹:%d",self.数据.装备属性.乾元丹))
	zts:显示(self.x+490,self.y+391.8,format(":%d",self.数据.装备属性.剩余乾元丹))
	zts:显示(self.x+583,self.y+391.8,format(":%d",self.数据.装备属性.可换乾元丹))
end

function 助战奇经八脉:检查点(x,y)
	if self.可视 and self.资源组 ~= nil and  self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 助战奇经八脉:初始移动(x,y)
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

function 助战奇经八脉:技能树(a)
	if a == 1 or a == 4 or a == 7 or a == 10 or a == 13 or a == 16 then
		if a == 16 then
			return {a+3}
		else
			return {a+3,a+4}
		end
	elseif a == 2 or a == 5 or a == 8 or a == 11 or a == 14 or a == 17 then
		if a == 17 then
			return {a+2,a+4}
		else
			return {a+2,a+3,a+4}
		end
	elseif a == 3 or a == 6 or a == 9 or a == 12 or a == 15 or a == 18 then
		if a == 18 then
			return {a+3}
		else
			return {a+2,a+3}
		end
	end
end

function 助战奇经八脉:开始移动(x,y)
	if self.可视 and self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end





return 助战奇经八脉