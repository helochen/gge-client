--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2020-02-22 08:18:38
--所有素材反编译由GGE开发者 313738139 baidwwy GGELUA作者亲自写.
--======================================================================--
动画类 = class()

function 动画类:换帧更新()
	self.开始帧 = self.方向 * self.帧数
	self.结束帧 = self.帧数 + self.开始帧 - 1
	self.当前帧 = self.开始帧
	self.时间累积 = 0
	self:更新纹理()
end

function 动画类:置染色(造型, 染色, 召唤兽)
	self.染色 = {
		c = 0,
		a = 0,
		b = 0
	}
	self.染色 = 染色
	self.was:置调色板("Dat\\人物\\人物调色板\\" .. 造型 .. ".wpal"):调色(self.染色.a, self.染色.b, self.染色.c, 0)
	self.染色方案数量 = self.was.染色方案数量
	self.信息组 = {}
	self.数量 = self.was.方向数 * self.was.帧数
	for n = 0, self.数量, 1 do
		self.信息组[n] = {}
	end
	self.信息组[0] = self.was:取纹理(0)
	self.精灵 = self.was:取精灵(0)
	self.高度 = self.was.高度
	self.宽度 = self.was.宽度
	self.中心x = self.was.x
	self.中心y = self.was.y
	self.开始帧 = 0
	self.结束帧 = 0
	self.当前帧 = 0
	self.时间累积 = 0
	self.方向数 = self.was.方向数
	self.帧数 = self.was.帧数
	self.帧率 = 0.1
	self.已载入 = 0
	self:置方向(0)
	self.允许显示 = true
	self.允许更新 = true
	self.停止帧数 = 0
	self:换帧更新()
end

function 动画类:初始化(p, len)
	if p then
		if type(p) ~= "table" then
			self.was = 锦衣was(p,len)
		else
			self.was = p
		end
	else
		self.was = _容错was
	end
	self.信息组 = {}
	self.数量 = self.was.方向数 * self.was.帧数 - 1
	for n = 0, self.数量, 1 do
		self.信息组[n] = {}
	end
	self.高度 = self.was.高度
	self.宽度 = self.was.宽度
	self.中心x = self.was.x
	self.中心y = self.was.y
	self.开始帧 = 0
	self.结束帧 = 0
	self.当前帧 = 0
	self.时间累积 = 0
	self.方向数 = self.was.方向数
	self.帧数 = self.was.帧数
	self.帧率 = 0.1
	self.已载入 = 0
	self.方向 = 0
	self.开始帧 = 0
	self.结束帧 = self.帧数 + self.开始帧 - 1
	self.当前帧 = self.开始帧
	self.提速 = 0
	self.信息组[0] = self.was:取纹理(0)
end

function 动画类:置高亮(v)
	if v then
		self:置混合(1)
		self:置颜色(-13158601)
	else
		self:置混合(0)
		self:置颜色(4294967295.0)
	end
end

function 动画类:置高亮模式(a)
	self:置混合(1)
	self:置颜色(a)
end
function 动画类:取间隔() return self.当前帧 - self.开始帧 end
function 动画类:取消高亮(v)
	self:置混合(0)
	self:置颜色(4294967295.0)
end

function 动画类:置混合(b)
	if not self.精灵 then
		self.信息组[0] = self.was:取纹理(0)
		self.精灵 = self.was:取精灵(0)
	end
	self.精灵:置混合(b or 0)
end

function 动画类:置颜色(v, i)
	self.精灵:置颜色(v, i or -1)
end

function 动画类:取精灵()
	if not self.精灵 then
		self.信息组[0] = self.was:取纹理(0)
		self.精灵 = self.was:取精灵(0)

		self:置方向(self.方向)
	end
	return self.精灵
end

function 动画类:更新纹理()
	if not self.精灵 then
		self.信息组[0] = self.was:取纹理(0)
		self.精灵 = self.was:取精灵(0)
		self:置方向(self.方向)
	end
	if self.信息组[self.当前帧] == nil then
		return 0
	end
	if self.was and self.信息组[self.当前帧].T == nil then
		local 帧信息 = self.was:取纹理(self.当前帧)
		if 帧信息.W == 0 and 帧信息.H == 0 and self.信息组[self.当前帧 - 1] and self.信息组[self.当前帧 - 1].T then
			self.信息组[self.当前帧] = self.信息组[self.当前帧 - 1]
		else
			self.信息组[self.当前帧] = 帧信息
		end
		self.已载入 = self.已载入 + 1
		if self.数量 <= self.已载入 then
			self.was = nil
		end
	end
	local t = self.信息组[self.当前帧]
	self.精灵:置纹理(t.T)
end
function 动画类:取当前帧()

 return self.当前帧


 end


function 动画类:取结束帧()

 return self.结束帧


 end


 function 动画类:取开始帧()

 return self.开始帧


 end

function 动画类:置提速(v)
	self.提速 = v
end
function 动画类:更新(dt,zl,pt)
	dt = dt or 引擎.取帧时间()
	if zl ~= nil and zl ~= 0 then
		dt = dt / zl
	elseif self.提速 ~= 0 then
		dt = dt * self.提速
	end
	self.时间累积 = self.时间累积 + dt
	if (self.时间累积 > 0.1) then
		self.当前帧 = self.当前帧 + 1
		if self.当前帧 > self.结束帧 then
			self.当前帧 = self.开始帧
		end
		self.时间累积 = 0
		if pt == nil then
			self:更新纹理()
		end
	end
end

function 动画类:是否选中(x,y)
	if self.精灵==nil then
	    return 0
	end
	if self.精灵:是否选中(x,y) then
	    return true
	end
	return false
end

function 动画类:取中间()
	return math.ceil((self.结束帧 - self.开始帧)/2)
end

function 动画类:显示(x, y, 比例)
	local 比例 = 比例 or 1
	if not self.精灵 then
		self.信息组[0] = self.was:取纹理(0)
		self.精灵 = self.was:取精灵(0)
		self:置方向(self.方向)
	end
	if self.信息组[self.当前帧] == nil then
		return 0
	end
	self.x = x - self.信息组[self.当前帧].X * 比例
	self.y = y - self.信息组[self.当前帧].Y * 比例
	if self.表情 then
		self.x = self.x + self.信息组[0].X
		self.y = self.y + self.信息组[0].Y
	end
	if 比例 ~= 1 then
		self.精灵:置过滤(true)
		self.精灵:置坐标_高级(self.x, self.y, 0, 比例, 比例):显示()
	else
		self.精灵:显示(self.x, self.y)
	end
end

function 动画类:置方向(d)
	if d == nil then
		d = 0
	end
	if self.方向 ~= d then
		if self.方向数 <= d then
			return
		end
		self.方向 = d
		if self.帧数 < d then
			d = 0
		end
		self.开始帧 = d * self.帧数
		self.结束帧 = self.帧数 + self.开始帧 - 1
		self.当前帧 = self.开始帧
		self:换帧更新()
		self:更新纹理()
	end
end

function 动画类:换方向(d)
	if self.方向 and self.方向 ~= d then
		self.方向 = d
	end
end

function 动画类:换帧更新()
	self.开始帧 = self.方向 * self.帧数
	self.结束帧 = self.帧数 + self.开始帧 - 1
	self.当前帧 = self.开始帧
	self.时间累积 = 0
	self:更新纹理()
end

return 动画类
