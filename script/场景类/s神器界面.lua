--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2020-08-31 18:16:39
--================,======================================================--
local 场景类_宠物领养栏 = class()
local insert = table.insert
local tp,zts1
local mouseb = 引擎.鼠标弹起
local qmx = 引擎.取模型
function 场景类_宠物领养栏:初始化(根)
	self.ID = 7653
	self.x = 230
	self.y = 135
	self.xx = 0
	self.yy = 0
	self.注释 = "神器栏"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	self.选中宠物 = 0
	self.介绍文本 = 根._丰富文本(118,600,根.字体表.普通字体)

	self.窗口时间 = 0
	tp = 根
	zts = 根.字体表.普通字体
	zts1 = 根.字体表.描边字体
	self.文字显示 = require("gge文字类").创建(nil,50,false,false,true)
	self.说明介绍 = require("gge文字类").创建(nil,25,false,false,true)


end

function 场景类_宠物领养栏:打开(内容)
	if self.可视 then
		self.介绍文本:清空()
		self.选中宠物 = 0
		self.可视 = false
		self.资源组 = nil
		self.宠物说明 = nil
		self.动画组 = nil
		return
	else
		if tp.宠物.领取 ~= nil then
			tp.提示:写入("#Y/已经领养过一次宠物了")
			return
		end
		insert(tp.窗口_,self)
		self.数据=内容
		if self.数据.等级==nil then
			self.数据.等级=1
		end
		self:加载数据()
		self.介绍文本:清空()
		self.选中宠物 = 0
		tp.运行时间 = tp.运行时间 + 1
	    self.窗口时间 = tp.运行时间
		self.可视 = true

	end
end
function 场景类_宠物领养栏:刷新(内容)
	self.数据=内容
end
function 场景类_宠物领养栏:加载数据()
	local 资源 = tp.资源
	local 按钮 = tp._按钮
	local 自适应 = tp._自适应
	self.资源组 = {
		[1] = 自适应.创建(0,1,560,347,3,9),
		-- [1] = 创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0xA0B51368),0,0,4,true,true,"确定充值")
		[2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),
		[3] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"吞噬装备"),
		[4] = 自适应.创建(2,1,150,150,3,9),
		[5] = 自适应.创建(1,1,522,18,1,3,nil,18),
		[6] = 资源:载入('magic.wdf',"网易WDF动画",0xcc000010),
	    [7] = tp.资源:载入('wzife.wdf',"网易WDF动画",0xA0B51368),
		[9] = 自适应.创建(3,1,140,19,1,3),
		[10] = 资源:载入('magic.wdf',"网易WDF动画",0xcc000003),-----1 独弦琴
		[11] = 资源:载入('magic.wdf',"网易WDF动画",0xcc000001),-----2 星斗盘
		[12] = 资源:载入('magic.wdf',"网易WDF动画",0xcc000002),-----2 清泽谱
		[13] = 资源:载入('magic.wdf',"网易WDF动画",0xcc000004),-----3 月光草
		[14] = 资源:载入('magic.wdf',"网易WDF动画",0xcc000005),-----4 轩辕剑
		[15] = 资源:载入('magic.wdf',"网易WDF动画",0xcc000006),-----5 天罡印
		[16] = 资源:载入('magic.wdf',"网易WDF动画",0xcc000007),-----6 四神鼎
		[17] = 资源:载入('magic.wdf',"网易WDF动画",0xcc000008),-----7 噬魂齿
		[18] = 资源:载入('magic.wdf',"网易WDF动画",0xcc000009),-----8 墨魂笔
		[19] = 资源:载入('magic.wdf',"网易WDF动画",0xcc000011),-----9 玲珑结
		[20] = 资源:载入('magic.wdf',"网易WDF动画",0xcc000012),-----9 泪痕碗
		[21] = 资源:载入('magic.wdf',"网易WDF动画",0xcc000013),-----9 昆仑镜
		[22] = 资源:载入('magic.wdf',"网易WDF动画",0xcc000014),-----9 黄金甲
		[23] = 资源:载入('magic.wdf',"网易WDF动画",0xcc000015),-----9 华光玉
		[24] = 资源:载入('magic.wdf',"网易WDF动画",0xcc000016),-----9 莫愁铃
		[25] = 资源:载入('magic.wdf',"网易WDF动画",0xcc000017),-----9 千机锁
		[26] = 资源:载入('magic.wdf',"网易WDF动画",0xcc000018),-----9 鸿蒙石





	}

	self.文本 = "123。"
	-- if self.数据.名称=="明火珠" then
	-- 	self.文本 = "天宫强大的神器，据传闻此神\n器乃诸神时代残留之古老壁\n文记载：独弦琴乃十大神器\n法力之首，足以毁天灭地、吞噬诸天。"
	-- end
    if self.数据.名称 == "独弦琴" then
        self.临时名称 = "天宫强大的神器，据传闻此神\n器乃诸神时代残留之古老壁\n文记载：独弦琴乃十大神器\n法力之首，足以毁天灭地、吞噬诸天。"
    elseif self.数据.名称 == "星斗盘"  then
       self.临时名称 = "五庄观强大的神器，据传闻\n此神器乃诸神时代残留\n之古老壁文记载：星斗盘\n乃十大神器之一，\n足以毁天灭地、吞噬诸天。"
    elseif self.数据.名称 == "清泽谱"  then
       self.临时名称 = "龙宫强大的神器，据传闻\n此神器乃诸神时代残留\n之古老壁文记载：清泽谱\n乃十大神器之一，\n足以毁天灭地、吞噬诸天。"
    elseif self.数据.名称 == "月光草"  then
       self.临时名称 = "神木林强大的神器，据传闻\n此神器乃诸神时代残留\n之古老壁文记载：月光草\n乃十大神器之一，\n足以毁天灭地、吞噬诸天。"
    elseif self.数据.名称 == "轩辕剑"  then
       self.临时名称 = "大唐官府强大的神器，据传闻\n此神器乃诸神时代残留\n之古老壁文记载：轩辕剑\n乃十大神器力量之首，\n足以毁天灭地、吞噬诸天。"
    elseif self.数据.名称 == "天罡印"  then
       self.临时名称 = "凌波城强大的神器，据传闻\n此神器乃诸神时代残留\n之古老壁文记载：天罡印\n乃十大神器之一，\n足以毁天灭地、吞噬诸天。"
    elseif self.数据.名称 == "四神鼎"  then
       self.临时名称 = "阴曹地府强大的神器，据传闻\n此神器乃诸神时代残留\n之古老壁文记载：四神鼎\n乃十大神器之一，\n足以毁天灭地、吞噬诸天。"
    elseif self.数据.名称 == "噬魂齿"  then
       self.临时名称 = "狮驼岭强大的神器，据传闻\n此神器乃诸神时代残留\n之古老壁文记载：噬魂齿\n乃十大神器之一，\n足以毁天灭地、吞噬诸天。"
    elseif self.数据.名称 == "墨魂笔"  then
       self.临时名称 = "化生寺强大的神器，据传闻\n此神器乃诸神时代残留\n之古老壁文记载：墨魂笔\n辅助救人之利器，\n足以毁天灭地、吞噬诸天。"
    elseif self.数据.名称 == "明火珠"   then
       self.临时名称 = "魔王寨强大的神器，据传闻\n此神器乃诸神时代残留\n之古老壁文记载：明火珠\n乃十大神器之一，\n足以毁天灭地、吞噬诸天。"
    elseif self.数据.名称 == "玲珑结"   then
       self.临时名称 = "无底洞强大的神器，据传闻\n此神器乃诸神时代残留\n之古老壁文记载：玲珑结\n乃十大神器之一，\n足以毁天灭地、吞噬诸天。"
    elseif self.数据.名称 == "泪痕碗"   then
       self.临时名称 = "女儿村强大的神器，据传闻\n此神器乃诸神时代残留\n之古老壁文记载：泪痕碗\n乃十大神器之一，\n足以毁天灭地、吞噬诸天。"
    elseif self.数据.名称 == "昆仑镜"   then
       self.临时名称 = "盘丝洞强大的神器，据传闻\n此神器乃诸神时代残留\n之古老壁文记载：昆仑镜\n乃十大神器之一，\n足以毁天灭地、吞噬诸天。"
    elseif self.数据.名称 == "黄金甲"   then
       self.临时名称 = "方寸山强大的神器，据传闻\n此神器乃诸神时代残留\n之古老壁文记载：黄金甲\n乃十大神器防御之甲，\n穿上此甲,不死不灭。"
    elseif self.数据.名称 == "华光玉"   then
       self.临时名称 = "普陀山强大的神器，据传闻\n此神器乃诸神时代残留\n之古老壁文记载：华光玉\n乃十大神器之一，\n足以毁天灭地、吞噬诸天。"
    elseif self.数据.名称 == "莫愁铃"   then
       self.临时名称 = "女魃墓强大的神器，据传闻\n此神器乃诸神时代残留\n之古老壁文记载：莫愁铃\n乃十大神器之一，\n足以毁天灭地、吞噬诸天。"
    elseif self.数据.名称 == "千机锁"   then
       self.临时名称 = "天机城强大的神器，据传闻\n此神器乃诸神时代残留\n之古老壁文记载：千机锁\n乃十大神器之一，\n足以毁天灭地、吞噬诸天。"
    elseif self.数据.名称 == "鸿蒙石"   then
       self.临时名称 = "花果山强大的神器，据传闻\n此神器乃诸神时代残留\n之古老壁文记载：鸿蒙石\n乃十大神器之一，\n足以毁天灭地、吞噬诸天。"
    end
	for n=2,3 do
	    self.资源组[n]:绑定窗口_(7653)
	end
end

function 场景类_宠物领养栏:显示(dt,x,y)
	self.资源组[2]:更新(x,y)
	self.资源组[3]:更新(x,y)
	if self.资源组[2]:事件判断() then
		self:打开()
		return
	elseif self.资源组[3]:事件判断() then
	   发送数据(1000)
	end
	self.焦点 = false
	self.资源组[12]:更新(dt)
    self.资源组[1]:显示(self.x,self.y)
	zts:置颜色(黄色)
	zts:显示(self.x+250,self.y+85,self.临时名称)
	zts:置颜色(白色)
	self.文字显示:置颜色(黄色)
	self.文字显示:显示(self.x+70,self.y+20,self.数据.等级.."级")
	self.资源组[4]:显示(self.x+20,self.y+100)
	-- self.资源组[6]:显示(self.x+100,self.y+200)
    self.资源组[7]:显示(self.x+450,self.y-45)
	self.资源组[9]:显示(self.x + 260,self.y + 206)
	zts:显示(self.x+200,self.y+208,"当前经验")
	zts1:显示(self.x+310,self.y+208,self.数据.当前经验.."/"..self.数据.升级经验)
	tp.窗口标题背景_:置区域(0,0,78,16)
	tp.窗口标题背景_:显示(self.x+235,self.y+3)
	zts1:置字间距(2)
	zts1:显示(self.x+243,self.y+3,"神器界面")
	zts1:置字间距(0)
	self.资源组[2]:显示(self.x + 534,self.y + 6)
	self.资源组[3]:显示(self.x + 450,self.y + 200,true)
	self.介绍文本:显示(self.x + 300,self.y + 50)
	self.文字显示:置颜色(黄色)
	self.说明介绍:显示(self.x+193,self.y+40,"神器介绍：")
	self.说明介绍:置颜色(黄色)
	self.说明介绍:显示(self.x+350,self.y+40,self.数据.名称)
	 zts:置颜色(白色)
	  zts:置颜色(红色)


    if self.数据.名称 == "独弦琴" then  --天宫
         self.资源组[10]:显示(self.x+100,self.y+200)
         zts:显示(self.x+50,self.y+265,"伤害: + "..self.数据.等级*30)
         zts:显示(self.x+200,self.y+265,"防御: + "..self.数据.等级*20)
         zts:显示(self.x+350,self.y+265,"灵力: + "..self.数据.等级*5)
         zts:显示(self.x+50,self.y+285,"魔法上限: + "..self.数据.等级*20)
         zts:显示(self.x+200,self.y+285,"最大气血: + "..self.数据.等级*20)
         zts:显示(self.x+350,self.y+285,"法防: + "..self.数据.等级*50)
         zts:显示(self.x+200,self.y+305,"人物潜能点: + "..self.数据.等级*10)
      elseif self.数据.名称 == "星斗盘"  then --五庄观
         self.资源组[11]:显示(self.x+100,self.y+200)
         zts:显示(self.x+50,self.y+265,"伤害: + "..self.数据.等级*30)
         zts:显示(self.x+200,self.y+265,"防御: + "..self.数据.等级*20)
         zts:显示(self.x+350,self.y+265,"灵力: + "..self.数据.等级*5)
         zts:显示(self.x+50,self.y+285,"魔法上限: + "..self.数据.等级*20)
         zts:显示(self.x+200,self.y+285,"最大气血: + "..self.数据.等级*20)
         zts:显示(self.x+350,self.y+285,"法防: + "..self.数据.等级*50)
         zts:显示(self.x+200,self.y+305,"人物潜能点: + "..self.数据.等级*10)
      elseif self.数据.名称 == "清泽谱"  then  --龙宫
         self.资源组[12]:显示(self.x+100,self.y+200)
         zts:显示(self.x+50,self.y+265,"灵力: + "..self.数据.等级*10)
         zts:显示(self.x+200,self.y+265,"防御: + "..self.数据.等级*20)
         zts:显示(self.x+350,self.y+265,"速度: + "..self.数据.等级*20)
         zts:显示(self.x+50,self.y+285,"魔法上限: + "..self.数据.等级*20)
         zts:显示(self.x+200,self.y+285,"最大气血: + "..self.数据.等级*30)
         zts:显示(self.x+350,self.y+285,"法防: + "..self.数据.等级*50)
         zts:显示(self.x+200,self.y+305,"人物潜能点: + "..self.数据.等级*10)
      elseif self.数据.名称 == "月光草"  then --神木林
         self.资源组[13]:显示(self.x+100,self.y+200)
         zts:显示(self.x+50,self.y+265,"灵力: + "..self.数据.等级*10)
         zts:显示(self.x+200,self.y+265,"防御: + "..self.数据.等级*20)
         zts:显示(self.x+350,self.y+265,"速度: + "..self.数据.等级*20)
         zts:显示(self.x+50,self.y+285,"魔法上限: + "..self.数据.等级*20)
         zts:显示(self.x+200,self.y+285,"最大气血: + "..self.数据.等级*30)
         zts:显示(self.x+350,self.y+285,"法防: + "..self.数据.等级*50)
         zts:显示(self.x+200,self.y+305,"人物潜能点: + "..self.数据.等级*10)
      elseif self.数据.名称 == "轩辕剑"  then --大唐官府
         self.资源组[14]:显示(self.x+100,self.y+200)
         zts:显示(self.x+50,self.y+265,"伤害: + "..self.数据.等级*40)
         zts:显示(self.x+200,self.y+265,"防御: + "..self.数据.等级*20)
         zts:显示(self.x+350,self.y+265,"速度: + "..self.数据.等级*10)
         zts:显示(self.x+50,self.y+285,"魔法上限: + "..self.数据.等级*10)
         zts:显示(self.x+200,self.y+285,"最大气血: + "..self.数据.等级*20)
         zts:显示(self.x+350,self.y+285,"法防: + "..self.数据.等级*50)
         zts:显示(self.x+200,self.y+305,"人物潜能点: + "..self.数据.等级*10)
      elseif self.数据.名称 == "天罡印"  then --凌波城
         self.资源组[15]:显示(self.x+100,self.y+200)
         zts:显示(self.x+50,self.y+265,"伤害: + "..self.数据.等级*40)
         zts:显示(self.x+200,self.y+265,"防御: + "..self.数据.等级*20)
         zts:显示(self.x+350,self.y+265,"速度: + "..self.数据.等级*10)
         zts:显示(self.x+50,self.y+285,"魔法上限: + "..self.数据.等级*10)
         zts:显示(self.x+200,self.y+285,"最大气血: + "..self.数据.等级*20)
         zts:显示(self.x+350,self.y+285,"法防: + "..self.数据.等级*50)
         zts:显示(self.x+200,self.y+305,"人物潜能点: + "..self.数据.等级*10)
      elseif self.数据.名称 == "四神鼎"  then --阴曹地府
         self.资源组[16]:显示(self.x+100,self.y+200)
         zts:显示(self.x+50,self.y+265,"伤害: + "..self.数据.等级*10)
         zts:显示(self.x+200,self.y+265,"防御: + "..self.数据.等级*30)
         zts:显示(self.x+350,self.y+265,"速度: + "..self.数据.等级*20)
         zts:显示(self.x+50,self.y+285,"魔法上限: + "..self.数据.等级*20)
         zts:显示(self.x+200,self.y+285,"最大气血: + "..self.数据.等级*30)
         zts:显示(self.x+350,self.y+285,"法防: + "..self.数据.等级*50)
         zts:显示(self.x+200,self.y+305,"人物潜能点: + "..self.数据.等级*10)
      elseif self.数据.名称 == "噬魂齿"  then --狮驼
         self.资源组[17]:显示(self.x+100,self.y+200)
         zts:显示(self.x+50,self.y+265,"伤害: + "..self.数据.等级*40)
         zts:显示(self.x+200,self.y+265,"防御: + "..self.数据.等级*20)
         zts:显示(self.x+350,self.y+265,"速度: + "..self.数据.等级*10)
         zts:显示(self.x+50,self.y+285,"魔法上限: + "..self.数据.等级*10)
         zts:显示(self.x+200,self.y+285,"最大气血: + "..self.数据.等级*20)
         zts:显示(self.x+350,self.y+285,"法防: + "..self.数据.等级*50)
         zts:显示(self.x+200,self.y+305,"人物潜能点: + "..self.数据.等级*10)
      elseif self.数据.名称 == "墨魂笔"  then --化生寺
         self.资源组[18]:显示(self.x+100,self.y+200)
         zts:显示(self.x+50,self.y+265,"灵力: + "..self.数据.等级*5)
         zts:显示(self.x+200,self.y+265,"防御: + "..self.数据.等级*40)
         zts:显示(self.x+350,self.y+265,"速度: + "..self.数据.等级*10)
         zts:显示(self.x+50,self.y+285,"魔法上限: + "..self.数据.等级*20)
         zts:显示(self.x+200,self.y+285,"最大气血: + "..self.数据.等级*40)
         zts:显示(self.x+350,self.y+285,"法防: + "..self.数据.等级*50)
         zts:显示(self.x+200,self.y+305,"人物潜能点: + "..self.数据.等级*10)
      elseif self.数据.名称 == "明火珠"   then  --魔王
      	self.资源组[6]:显示(self.x+100,self.y+200)
         zts:显示(self.x+50,self.y+265,"灵力: + "..self.数据.等级*10)
         zts:显示(self.x+200,self.y+265,"防御: + "..self.数据.等级*20)
         zts:显示(self.x+350,self.y+265,"速度: + "..self.数据.等级*20)
         zts:显示(self.x+50,self.y+285,"魔法上限: + "..self.数据.等级*20)
         zts:显示(self.x+200,self.y+285,"最大气血: + "..self.数据.等级*30)
         zts:显示(self.x+350,self.y+285,"法防: + "..self.数据.等级*50)
         zts:显示(self.x+200,self.y+305,"人物潜能点: + "..self.数据.等级*10)
      elseif self.数据.名称 == "玲珑结"   then --无底洞
         self.资源组[19]:显示(self.x+100,self.y+200)
         zts:显示(self.x+50,self.y+265,"灵力: + "..self.数据.等级*5)
         zts:显示(self.x+200,self.y+265,"防御: + "..self.数据.等级*40)
         zts:显示(self.x+350,self.y+265,"速度: + "..self.数据.等级*10)
         zts:显示(self.x+50,self.y+285,"魔法上限: + "..self.数据.等级*20)
         zts:显示(self.x+200,self.y+285,"最大气血: + "..self.数据.等级*40)
         zts:显示(self.x+350,self.y+285,"法防: + "..self.数据.等级*50)
         zts:显示(self.x+200,self.y+305,"人物潜能点: + "..self.数据.等级*10)
      elseif self.数据.名称 == "泪痕碗"   then --女儿村
         self.资源组[20]:显示(self.x+100,self.y+200)
         zts:显示(self.x+50,self.y+265,"伤害: + "..self.数据.等级*10)
         zts:显示(self.x+200,self.y+265,"防御: + "..self.数据.等级*30)
         zts:显示(self.x+350,self.y+265,"速度: + "..self.数据.等级*20)
         zts:显示(self.x+50,self.y+285,"魔法上限: + "..self.数据.等级*20)
         zts:显示(self.x+200,self.y+285,"最大气血: + "..self.数据.等级*30)
         zts:显示(self.x+350,self.y+285,"法防: + "..self.数据.等级*50)
         zts:显示(self.x+200,self.y+305,"人物潜能点: + "..self.数据.等级*10)
      elseif self.数据.名称 == "昆仑镜"   then --盘丝洞
         self.资源组[21]:显示(self.x+100,self.y+200)

         zts:显示(self.x+50,self.y+265,"伤害: + "..self.数据.等级*10)
         zts:显示(self.x+200,self.y+265,"防御: + "..self.数据.等级*30)
         zts:显示(self.x+350,self.y+265,"速度: + "..self.数据.等级*20)
         zts:显示(self.x+50,self.y+285,"魔法上限: + "..self.数据.等级*20)
         zts:显示(self.x+200,self.y+285,"最大气血: + "..self.数据.等级*30)
         zts:显示(self.x+350,self.y+285,"法防: + "..self.数据.等级*50)
         zts:显示(self.x+200,self.y+305,"人物潜能点: + "..self.数据.等级*10)
      elseif self.数据.名称 == "黄金甲"   then --方寸山
         self.资源组[22]:显示(self.x+100,self.y+200)

         zts:显示(self.x+50,self.y+265,"伤害: + "..self.数据.等级*10)
         zts:显示(self.x+200,self.y+265,"防御: + "..self.数据.等级*30)
         zts:显示(self.x+350,self.y+265,"速度: + "..self.数据.等级*20)
         zts:显示(self.x+50,self.y+285,"魔法上限: + "..self.数据.等级*20)
         zts:显示(self.x+200,self.y+285,"最大气血: + "..self.数据.等级*30)
         zts:显示(self.x+350,self.y+285,"法防: + "..self.数据.等级*50)
         zts:显示(self.x+200,self.y+305,"人物潜能点: + "..self.数据.等级*10)
      elseif self.数据.名称 == "华光玉"   then --普陀山
         self.资源组[23]:显示(self.x+100,self.y+200)

         zts:显示(self.x+50,self.y+265,"灵力: + "..self.数据.等级*5)
         zts:显示(self.x+200,self.y+265,"防御: + "..self.数据.等级*40)
         zts:显示(self.x+350,self.y+265,"速度: + "..self.数据.等级*10)
         zts:显示(self.x+50,self.y+285,"魔法上限: + "..self.数据.等级*20)
         zts:显示(self.x+200,self.y+285,"最大气血: + "..self.数据.等级*40)
         zts:显示(self.x+350,self.y+285,"法防: + "..self.数据.等级*50)
         zts:显示(self.x+200,self.y+305,"人物潜能点: + "..self.数据.等级*10)
      elseif self.数据.名称 == "千机锁"  then --天机城
       self.资源组[25]:显示(self.x+100,self.y+200)

         zts:显示(self.x+50,self.y+265,"伤害: + "..self.数据.等级*40)
         zts:显示(self.x+200,self.y+265,"防御: + "..self.数据.等级*20)
         zts:显示(self.x+350,self.y+265,"速度: + "..self.数据.等级*10)
         zts:显示(self.x+50,self.y+285,"魔法上限: + "..self.数据.等级*10)
         zts:显示(self.x+200,self.y+285,"最大气血: + "..self.数据.等级*20)
         zts:显示(self.x+350,self.y+285,"法防: + "..self.数据.等级*50)
         zts:显示(self.x+200,self.y+305,"人物潜能点: + "..self.数据.等级*10)
      elseif self.数据.名称 == "鸿蒙石"  then --花果山
       self.资源组[26]:显示(self.x+100,self.y+200)
         zts:显示(self.x+50,self.y+265,"伤害: + "..self.数据.等级*40)
         zts:显示(self.x+200,self.y+265,"防御: + "..self.数据.等级*20)
         zts:显示(self.x+350,self.y+265,"速度: + "..self.数据.等级*10)
         zts:显示(self.x+50,self.y+285,"魔法上限: + "..self.数据.等级*10)
         zts:显示(self.x+200,self.y+285,"最大气血: + "..self.数据.等级*20)
         zts:显示(self.x+350,self.y+285,"法防: + "..self.数据.等级*50)
         zts:显示(self.x+200,self.y+305,"人物潜能点: + "..self.数据.等级*10)
      elseif self.数据.名称 == "莫愁铃"  then --女魃墓
       self.资源组[24]:显示(self.x+100,self.y+200)
         zts:显示(self.x+50,self.y+265,"伤害: + "..self.数据.等级*30)
         zts:显示(self.x+200,self.y+265,"防御: + "..self.数据.等级*20)
         zts:显示(self.x+350,self.y+265,"灵力: + "..self.数据.等级*5)
         zts:显示(self.x+50,self.y+285,"魔法上限: + "..self.数据.等级*20)
         zts:显示(self.x+200,self.y+285,"最大气血: + "..self.数据.等级*20)
         zts:显示(self.x+350,self.y+285,"法防: + "..self.数据.等级*50)
         zts:显示(self.x+200,self.y+305,"人物潜能点: + "..self.数据.等级*10)
      end
      -- self.超级文本:显示(self.x +365,self.y +180)


end

function 场景类_宠物领养栏:检查点(x,y)
	if self.资源组~=nil and  self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 场景类_宠物领养栏:初始移动(x,y)
	tp.运行时间 = tp.运行时间 + 1
	if not tp.消息栏焦点 then
  		self.窗口时间 = tp.运行时间
 	end
	if not self.焦点 then
		tp.移动窗口 = true
	end
	if self.鼠标 and not self.焦点 then
		self.xx = x - self.x
		self.yy = y - self.y
	end
end

function 场景类_宠物领养栏:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 场景类_宠物领养栏