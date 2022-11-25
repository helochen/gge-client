--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2020-06-19 11:54:36
--======================================================================--
local 系统类_喊话 = class()
local floor = math.floor
local ff = require("script/系统类/丰富文本")
local min = math.min
local tp
local sort = table.sort
local insert = table.insert
local remove = table.remove
local 背景
function 系统类_喊话:初始化(根)
	if 背景 == nil then
		self.背景 = 根._自适应.创建(9,1,125,23,3,9)
	end
	self.对话 = {}
	tp = 根
end

function 系统类_喊话:显示(x,y,dt,xx,yy)
	if #self.对话 == 0 then
		return
	end

	for n=1,#self.对话 do
		if self.对话[n] ~= nil then
			if self.对话[n].允许加入 and self.对话[n].fj >= self.对话[n].fjjr then
				self.对话[n].fj = self.对话[n].fjjr
				self.对话[n].允许加入 = nil
			end
			if self.对话[n].允许加入 then
				self.对话[n].fj = self.对话[n].fj + 2
			end
			local h=self.对话[n].h
			local w=self.对话[n].w
			if x~=nil and y~=nil then

              self.对话[n].目标.x=x
              self.对话[n].目标.y=x
		        end
			self.对话[n].x = (x or floor(self.对话[n].目标.x + tp.场景.屏幕坐标.x)) - floor(w/2)
			self.对话[n].y = (y or floor(self.对话[n].目标.y + tp.场景.屏幕坐标.y)) - (self.对话[n].高度计算+h) - self.对话[n].fj
			self.背景:置宽高(w,h)
			for i=1,3 do
				self.背景:显示(self.对话[n].x,self.对话[n].y)
			end
			self.对话[n].丰富文本:显示(self.对话[n].x+3,self.对话[n].y+2)
			if self.对话[n].允许加入 == nil then
				self.对话[n].时间 = self.对话[n].时间 - 1
				if self.对话[n].时间 <= 0 then
					remove(self.对话,1)
				end
			end
		end
	end
end

function 系统类_喊话:写入(rw,dh,txt,sj)
	if #self.对话 >= 8 or (self.对话[1] ~= nil and (self.对话[1].fj > 150 or self.对话[1].fjjr > 150)) then
		remove(self.对话,1)
	end
	local txts = {
		y = rw.y,
		fj = 0,
		fjjr = 0,
		时间 = sj or 500,
		丰富文本 = ff(100,300),
		目标 = rw,
	}
	if dh["静立"]~=nil and dh["静立"].信息组[0][3] ~= nil then
		txts.高度计算 = dh["静立"].信息组[0][3]+10
	else
		if dh["待战"]~=nil and dh["待战"].信息组[0][3] ~= nil then
		   txts.高度计算 = dh["待战"].信息组[0][3]+10
		elseif dh["行走"] ~= nil and dh["行走"].信息组[0][3] ~= nil then
			txts.高度计算 = dh["行走"].信息组[0][3]+10
		else
			txts.高度计算 = 90
		end
	end
	local ab = txts.丰富文本:添加文本(txt)
	txts.w = txts.丰富文本.显示表.宽度+8
	txts.h = ab+3
	if #self.对话 > 0 then
		local cs = #self.对话
		local zgd = txts.h + 3
		local jz = 0
		while true do
			self.对话[cs].fjjr = zgd
			self.对话[cs].允许加入 = true
			zgd = zgd + self.对话[cs].h + 3
			cs = cs - 1
			if cs == 0 then
				break
			end
		end
	end
	insert(self.对话,txts)
end


return 系统类_喊话