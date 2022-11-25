--======================================================================--

--======================================================================--
local 场景类_成就特效 = class()
local floor = math.floor
local tp,zts,zt
local format = string.format
local insert = table.insert

function 场景类_成就特效:初始化(根)
	self.x = 180
	self.y = 170
	self.xx = 0
	self.yy = 0
	self.注释 = "成就特效"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	tp = 根
	self.窗口时间 = 0
	zts = tp.字体表.道具字体
	zt = tp.字体表.描边字体
	self.成就类型= nil
	self.进程=1
	self.控件类 = require("ggeui/加载类")()
	local 总控件 = self.控件类:创建控件('序号控件')
	总控件:置可视(true,true)
end

function 场景类_成就特效:打开(数据)
	self.成就类型 = 数据
	if self.可视 then
		self.可视 = false

		self.资源组 = nil
		return
	else
		insert(tp.窗口_,self)
		local 资源 = tp.资源
		local 按钮 = tp._按钮
		local 自适应 = tp._自适应
		self.资源组 = {
			[1] = 资源:载入('wzife.wd1',"网易WDF动画",0x30F6DB85),
			[2] = 资源:载入('wzife.wd1',"网易WDF动画",0xAF83732B),
            [3] = 资源:载入('wzife.wd1',"网易WDF动画",0xF64ACC8C),
            [4] = 资源:载入("wdf/pic/xiaolian.png","图片")
		}
		self.数据=数据
		tp.运行时间 = tp.运行时间 + 1
	    self.窗口时间 = tp.运行时间
	    self.可视 = true

	end
end



function 场景类_成就特效:显示(dt,x,y)
	self.焦点 = false
	self.控件类:更新(dt,x,y)
	self.控件类:显示(x,y)
	if self.成就类型 == "无级别限制" then
	self.资源组[2]:更新(dt)
	self.资源组[3]:更新(dt)
    self.资源组[1]:显示(self.x+50,self.y+260)
	self.资源组[2]:显示(self.x+50,self.y+260)
	self.资源组[3]:显示(self.x+50,self.y+260)
	self.资源组[4]:显示(self.x+80,self.y+290)   --do
    tp.字体表.成就字体:置颜色(黑色)
    tp.字体表.成就字体:显示(self.x+140,self.y+290,"牛了！无级别啊")
    tp.字体表.普通字体:置颜色(黑色)
    tp.字体表.普通字体:显示(self.x+140,self.y+328,"鉴定至少80级装备出现特效无级别限制")
    else
    self.资源组[2]:更新(dt)
	self.资源组[3]:更新(dt)
    self.资源组[1]:显示(self.x+50,self.y+260)
	self.资源组[2]:显示(self.x+50,self.y+260)
	self.资源组[3]:显示(self.x+50,self.y+260)
	self.资源组[4]:显示(self.x+80,self.y+290)
    tp.字体表.成就字体:置颜色(黑色)
    tp.字体表.成就字体:显示(self.x+140,self.y+290,"我的"..self.成就类型)
    tp.字体表.普通字体:置颜色(黑色)
    tp.字体表.普通字体:显示(self.x+140,self.y+328,"鉴定至少80级装备出现特技"..self.成就类型)
    end

end



function 场景类_成就特效:检查点(x,y)
	if self.资源组 ~= nil and self.资源组[1]:是否选中(x,y)  then
		return true
	end
end




function 场景类_成就特效:初始移动(x,y)
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

function 场景类_成就特效:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 场景类_成就特效