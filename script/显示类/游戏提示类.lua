--===========================gfhffhg===========================================--
-- @作 者: GGE研 究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2020-07-20 11:02:24
-- 梦幻西游游戏资源破 解 baidwwy@vip.qq.com(313738139) 老毕   和 C++PrimerPlus 717535046 这俩位大神破解 所以资源
--==========================================ghfg============================--
游戏提示类 = class()

function 游戏提示类:初始化(根)
	self.背景={}
	self.提示文本={}
	self.提示时间={}
	self.提示总数=0
	self.是否清空=false
	self.字符大小=0
	self.背景=根._自适应.创建(9,1,125,23,3,9)
	self.背景1=根._自适应.创建(9,1,125,23,3,9)
	self.背景:置宽高(1050,25)
	self.背景1:置宽高(1050,25)
end

function 游戏提示类:更新(dt)

end

function 游戏提示类:加入提示(q)
   self.提示总数=self.提示总数+1
   self.提示文本[self.提示总数]=q
  self.提示时间[self.提示总数]=引擎:取时间戳()
end

function 游戏提示类:显示(w,e,x,y)
	self.背景:显示(x,y)
	self.背景1:显示(x,y)
end

return  游戏提示类