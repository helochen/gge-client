--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2020-12-31 18:41:03
--============================,==========================================--
local 场景类_成就提示栏 = class()

local qmx = 引擎.取模型
local zts,zts1,tp
local insert = table.insert

function 场景类_成就提示栏:初始化(根)
	self.ID = 14
	self.x = 300
	self.y = 500
	self.xx = 0
	self.yy = 0
	self.注释 = "成就提示栏"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	self.窗口时间 = 0
	tp = 根
	zts = require("gge文字类").创建("wdf/font/宋体.ttf",15,false,false,true):置行间距(1)
	zts1 = tp.字体表.描边字体
end

function 场景类_成就提示栏:打开()
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


function 场景类_成就提示栏:加载数据()
	local 资源 = tp.资源
	local 按钮 = tp._按钮
	local 自适应 = tp._自适应
	self.资源组 = {
		[1] = 自适应.创建(0,1,270,50,3,9),
		[2] = 资源:载入('wzife.wd4',"网易WDF动画",0x2E0BA3E2),--已达成
		[5] = 资源:载入('wzife.wd4',"网易WDF动画",0x15FD4546),
		[6] = 资源:载入('wzife.wd4',"网易WDF动画",0xA5960821)

	}

end

function 场景类_成就提示栏:显示(dt,x,y)
	local cj = tp.成就提示
	self.焦点 = false
	self.资源组[2]:更新()
	self.资源组[5]:更新()
	self.资源组[6]:更新()
	self.资源组[1]:显示(self.x,self.y)
	self.资源组[5]:显示(self.x,self.y-25)
	self.资源组[6]:显示(self.x,self.y-25)
	zts1:置字间距(0)

	zts1:置颜色(白色)
	--zts1:显示(self.x + 90,self.y + 57,"抓鬼次数达到100次")

    zts:置颜色(红色)
    zts:显示(self.x + 10,self.y+5,"恭喜你完成了"..cj[1])
    self.资源组[2]:显示(self.x+200,self.y-10)

		-- zts:显示(self.x + 178,self.y + 72,cw.等级)
		-- zts:显示(self.x + 178,self.y + 98,cw.耐力.."/"..cw.最大耐力)
		-- zts:显示(self.x + 178,self.y + 122,cw.经验.."/"..cw.最大经验)
	--end
end

function 场景类_成就提示栏:检查点(x,y)
	if self.可视 and  self.资源组~=nil and self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 场景类_成就提示栏:初始移动(x,y)
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

function 场景类_成就提示栏:开始移动(x,y)
	if self.可视 and self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 场景类_成就提示栏