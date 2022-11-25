--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2020-12-20 13:27:58
--============================,==========================================--
local 场景类_成就系统栏 = class()

local qmx = 引擎.取模型
local zts,zts1,tp
local insert = table.insert

function 场景类_成就系统栏:初始化(根)
	self.ID = 14
	self.x = 135
	self.y = 60
	self.xx = 0
	self.yy = 0
	self.注释 = "成就系统栏"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	self.窗口时间 = 0
	tp = 根
	zts = require("gge文字类").创建("wdf/font/宋体.ttf",14,false,false,true):置行间距(1)
	zts1 = tp.字体表.描边字体
end

function 场景类_成就系统栏:打开()
	if self.可视 then
		self.可视 = false
		self.资源组=nil
		return
	else
		insert(tp.窗口_,self)
		self:加载数据()
		-- if tp.宠物.模型 ~= nil then
		-- 	local n = qmx(tp.宠物.模型)
		-- 	self.资源组[6] = tp.资源:载入(n[3],"网易WDF动画",n[1])
		-- 	self.资源组[6]:置方向(4)
		-- end
	    tp.运行时间 = tp.运行时间 + 1
	    self.窗口时间 = tp.运行时间
	    self.可视 = true
	end
end

function 场景类_成就系统栏:加载数据()
	local 资源 = tp.资源
	local 按钮 = tp._按钮
	local 自适应 = tp._自适应
	self.资源组 = {
		[1] = 自适应.创建(0,1,600,500,3,9),
		[2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),
		[3] = 自适应.创建(2,1,97,97,3,9),
		[4] = 自适应.创建(1,1,281,18,1,3,nil,18),
		[5] = 资源:载入('item.wdf',"网易WDF动画",1153796395),--书铁
		[6] = 资源:载入('wzife.wd1',"网易WDF动画",0xE6490543),
		[7] = 自适应.创建(9,1,250,50,3,9),
		[8] = 资源:载入('item.wdf',"网易WDF动画",1387446262),--宝石
		[9] = 资源:载入('item.wdf',"网易WDF动画",0x45BDA0CD),--三界悬赏令
		[10] = 资源:载入('item.wdf',"网易WDF动画",4271545734),--鬼谷子
		[11] = 资源:载入('item.wdf',"网易WDF动画",211127435),--宝图
		[12] = 资源:载入('item.wdf',"网易WDF动画",0x97C77FD8),--帮派银票
		[13] = 资源:载入('item.wdf',"网易WDF动画",0xF5601CC2),--镇妖塔
		[14] = 资源:载入('wzife.wd4',"网易WDF动画",0x2E0BA3E2),--已达成
		[15] = 资源:载入('wzife.wd4',"网易WDF动画",0x900D7019)--加油
	}

end

function 场景类_成就系统栏:显示(dt,x,y)
	local cj = tp.成就
	self.焦点 = false
	self.资源组[2]:更新(x,y)
	if self.资源组[2]:事件判断() then
		self:打开()
		return false
	end
	self.资源组[1]:显示(self.x,self.y)
	self.资源组[4]:显示(self.x+156,self.y+3)
	tp.窗口标题背景_:置区域(0,0,75,16)
	tp.窗口标题背景_:显示(self.x+255,self.y+3)
	zts1:置字间距(3)
	zts1:显示(self.x+274,self.y+3,"成就栏")
	self.资源组[2]:显示(self.x + 580,self.y + 6)
	zts1:置字间距(3)
	zts1:置字间距(0)
	self.资源组[7]:显示(self.x+30,self.y+42)
	self.资源组[6]:显示(self.x + 30,self.y + 42)
	self.资源组[5]:显示(self.x + 30,self.y + 42)
	self.资源组[7]:显示(self.x+30,self.y+102)
	self.资源组[6]:显示(self.x + 30,self.y + 102)
	self.资源组[8]:显示(self.x + 30,self.y + 102)
	self.资源组[7]:显示(self.x+30,self.y+162)
	self.资源组[6]:显示(self.x + 30,self.y + 162)
	self.资源组[9]:显示(self.x + 30,self.y + 162)
	self.资源组[7]:显示(self.x+30,self.y+222)
	self.资源组[6]:显示(self.x + 30,self.y + 222)
	self.资源组[10]:显示(self.x + 30,self.y + 222)
	self.资源组[7]:显示(self.x+30,self.y+282)
	self.资源组[6]:显示(self.x + 30,self.y + 282)
	self.资源组[11]:显示(self.x + 30,self.y + 282)
	self.资源组[7]:显示(self.x+30,self.y+342)
	self.资源组[6]:显示(self.x + 30,self.y + 342)
	self.资源组[12]:显示(self.x + 30,self.y + 342)
	self.资源组[7]:显示(self.x+30,self.y+402)
	self.资源组[6]:显示(self.x + 30,self.y + 402)
	self.资源组[13]:显示(self.x + 30,self.y + 402)

	self.资源组[7]:显示(self.x+320,self.y+42)
	self.资源组[6]:显示(self.x + 320,self.y + 42)
	self.资源组[5]:显示(self.x + 320,self.y + 42)
	self.资源组[7]:显示(self.x+320,self.y+102)
	self.资源组[6]:显示(self.x + 320,self.y + 102)
	self.资源组[8]:显示(self.x + 320,self.y + 102)
	self.资源组[7]:显示(self.x+320,self.y+162)
	self.资源组[6]:显示(self.x + 320,self.y + 162)
	self.资源组[9]:显示(self.x + 320,self.y + 162)
	self.资源组[7]:显示(self.x+320,self.y+222)
	self.资源组[6]:显示(self.x + 320,self.y + 222)
	self.资源组[10]:显示(self.x + 320,self.y + 222)
	self.资源组[7]:显示(self.x+320,self.y+282)
	self.资源组[6]:显示(self.x + 320,self.y + 282)
	self.资源组[11]:显示(self.x + 320,self.y + 282)
	self.资源组[7]:显示(self.x+320,self.y+342)
	self.资源组[6]:显示(self.x + 320,self.y + 342)
	self.资源组[12]:显示(self.x + 320,self.y + 342)
	self.资源组[7]:显示(self.x+320,self.y+402)
	self.资源组[6]:显示(self.x + 320,self.y + 402)
	self.资源组[13]:显示(self.x + 320,self.y + 402)
	zts1:置颜色(白色)
	zts1:显示(self.x + 90,self.y + 57,"抓鬼次数达到100次")
	zts1:显示(self.x + 90,self.y + 117,"任务链次数达到300次")
	zts1:显示(self.x + 90,self.y + 177,"三界悬赏令完成100次")
	zts1:显示(self.x + 90,self.y + 237,"押镖任务完成100次")
	zts1:显示(self.x + 90,self.y + 297,"挖宝次数达到300次")
	zts1:显示(self.x + 90,self.y + 357,"帮派跑商任务完成100次")
	zts1:显示(self.x + 90,self.y + 417,"帮派青龙任务完成200次")

	zts1:显示(self.x + 380,self.y + 57,"抓鬼次数达到1000次")
	zts1:显示(self.x + 380,self.y + 117,"任务链次数达到3000次")
	zts1:显示(self.x + 380,self.y + 177,"三界悬赏令完成1000次")
	zts1:显示(self.x + 380,self.y + 237,"强化装备次数达到200次")
	zts1:显示(self.x + 380,self.y + 297,"挖宝次数达到3000次")
	zts1:显示(self.x + 380,self.y + 357,"宝宝修环完成1000次")
	zts1:显示(self.x + 380,self.y + 417,"封妖次数达到5000次")
    zts:置颜色(黄色)
    zts:显示(self.x + 30,self.y + 472,"当前成就点为："..cj.成就数据.成就点.." （成就点达到相应点数会获得相应的称号，另有隐藏成就自己发现吧）")
    if cj.成就数据.抓鬼次数 > 99 then
    	self.资源组[14]:显示(self.x + 220,self.y + 40)
    else
    	self.资源组[15]:显示(self.x + 255,self.y + 67)
    end
    if cj.成就数据.任务链次数 > 299 then
    	self.资源组[14]:显示(self.x + 220,self.y + 100)
    else
    	self.资源组[15]:显示(self.x + 255,self.y + 127)
    end
    if cj.成就数据.三界次数 > 99 then
    	self.资源组[14]:显示(self.x + 220,self.y + 160)
    else
    	self.资源组[15]:显示(self.x + 255,self.y + 187)
    end
    if cj.成就数据.押镖次数 > 99 then
    	self.资源组[14]:显示(self.x + 220,self.y + 220)
    else
    	self.资源组[15]:显示(self.x + 255,self.y + 247)
    end
    if cj.成就数据.挖宝次数 > 299 then
    	self.资源组[14]:显示(self.x + 220,self.y + 280)
    else
    	self.资源组[15]:显示(self.x + 255,self.y + 307)
    end
    if cj.成就数据.跑商次数 > 99 then
    	self.资源组[14]:显示(self.x + 220,self.y + 340)
    else
    	self.资源组[15]:显示(self.x + 255,self.y + 367)
    end
    if cj.成就数据.青龙次数 > 199 then
    	self.资源组[14]:显示(self.x + 220,self.y + 400)
    else
    	self.资源组[15]:显示(self.x + 255,self.y + 427)
    end

    if cj.成就数据.抓鬼次数 > 999 then
    	self.资源组[14]:显示(self.x + 510,self.y + 40)
    else
    	self.资源组[15]:显示(self.x + 545,self.y + 67)
    end
    if cj.成就数据.任务链次数 > 2999 then
    	self.资源组[14]:显示(self.x + 510,self.y + 100)
    else
    	self.资源组[15]:显示(self.x + 545,self.y + 127)
    end
    if cj.成就数据.三界次数 > 999 then
    	self.资源组[14]:显示(self.x + 510,self.y + 160)
    else
    	self.资源组[15]:显示(self.x + 545,self.y + 187)
    end
    if cj.成就数据.强化次数 > 199 then
    	self.资源组[14]:显示(self.x + 510,self.y + 220)
    else
    	self.资源组[15]:显示(self.x + 545,self.y + 247)
    end
    if cj.成就数据.挖宝次数 > 2999 then
    	self.资源组[14]:显示(self.x + 510,self.y + 280)
    else
    	self.资源组[15]:显示(self.x + 545,self.y + 307)
    end
    if cj.成就数据.宝宝环次数 > 999 then
    	self.资源组[14]:显示(self.x + 510,self.y + 340)
    else
    	self.资源组[15]:显示(self.x + 545,self.y + 367)
    end
    if cj.成就数据.封妖次数 > 4999 then
    	self.资源组[14]:显示(self.x + 510,self.y + 400)
    else
    	self.资源组[15]:显示(self.x + 545,self.y + 427)
    end



		-- zts:显示(self.x + 178,self.y + 72,cw.等级)
		-- zts:显示(self.x + 178,self.y + 98,cw.耐力.."/"..cw.最大耐力)
		-- zts:显示(self.x + 178,self.y + 122,cw.经验.."/"..cw.最大经验)
	--end
end

function 场景类_成就系统栏:检查点(x,y)
	if self.可视 and  self.资源组~=nil and self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 场景类_成就系统栏:初始移动(x,y)
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

function 场景类_成就系统栏:开始移动(x,y)
	if self.可视 and self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 场景类_成就系统栏