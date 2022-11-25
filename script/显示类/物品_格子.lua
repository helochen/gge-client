--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2021-03-05 10:24:52
--======================================================================--
local 系统类_物品格子 = class()
local tp,zt
local mouse = 引擎.鼠标弹起
local wps = 引擎.取物品
local  变身资源={
	大海龟=0x3C7B89E8,
		大蝙蝠=0x2481DFCC,
		海毛虫=0x3BD0B554,
		护卫=0x7003F174,
		巨蛙=0x98E3377F,
		强盗=0xD5C2566E,
		山贼=0x5F7346A8,
		树怪=0x4ED5C9C4,
		野猪=0xEF3A830D,
		蛤蟆精=0x8A53158C,
		黑熊=0xD4D2660A,
		狐狸精=0xDC14E699,
		花妖=0xD294444C,
		老虎=0x463F3E9B,
		羊头怪=0x8F19EF2A,
		骷髅怪=0xD0BE29D3,
		狼=0x92B59426,
		牛妖=0x3AF799AA,
		虾兵=0xE89179D1,
		小龙女=0xE05E7656,
		蟹将=0x65DBE48A,
		野鬼=0xB90EC617,
		龟丞相=0x67E0006E,
		黑熊精=0x35BDCFC8,
		僵尸=0xC7B126C6,
		马面=0xCA322977,
		牛头=0x06971D21,
		蜘蛛精=0xD2C2093D,
		白熊=0x7092E7F5,
		古代瑞兽=0x7728C3B2,
		黑山老妖=0x95FDC90D,
		蝴蝶仙子=0x976975FB,
		雷鸟人=0x4E646343,
		地狱战神=0xB5FE5920,
		风伯=0xDF2F3035,
		天兵=0x9AB7515F,
		天将=0x7E86C2A9,
		凤凰=0x2A4159F7,
		蛟龙=0xD4442C3A,
		大力金刚=0x64287AE7,
		鬼将=0x023AA63E,
		净瓶女娲=0x7E99A5F4,
		灵符女娲=0x5726FB84,
		灵鹤=0xACEF8DB7,
		律法女娲=0x4ED64302,
		如意仙子=0x411A18C7,
		噬天虎=0x8DC23CAE,
		雾中仙=0xA88F486E,
		吸血鬼=0x9D5FA3EC,
		星灵仙子=0xD226E204,
		巡游天神=0xFD35D4E3,
		炎魔神=0xB9917494,
		夜罗刹=0xAB1EFFB3,
		幽灵=0x62875401,
		芙蓉仙子=0xBAFBFAA8
	}



function 系统类_物品格子:初始化(x,y,ID,注释,遮挡)
	self.ID = ID
	self.注释 = 注释
	self.物品 = nil
	self.事件 = false
	self.焦点 = false
	self.右键 = false
	self.遮挡 = 遮挡
	self.确定 = false
end

function 系统类_物品格子:置根(根)
	tp = 根
	zt = tp.字体表.描边字体

end

function 系统类_物品格子:置物品(物品)
	self.选中=nil
	if 物品 ~= nil then
		if 物品.名称 ~= 0 then
			--self.物品 = 物品
			local item = tp._物品.创建()
			item:置对象(物品.名称)
			self.物品= item
			for n, v in pairs(物品) do
              self.物品[n]=v
		  	end
			if 物品.名称=="怪物卡片" then
				self.物品.小模型id="item.wdf"
				self.物品.资源="item.wdf"
				if 物品.等级==1 then
					self.物品.小模型资源=0x4A028BEE
				elseif 物品.等级==2 then
					self.物品.小模型资源=0xBB35E1EE
				elseif 物品.等级==3 then
					self.物品.小模型资源=0xE7FC64D2
				elseif 物品.等级==4 then
					self.物品.小模型资源=0xA00740F6
				elseif 物品.等级==5 then
					self.物品.小模型资源=0x21838782
				elseif 物品.等级==6 then
					self.物品.小模型资源=0xF1C84EB5
				elseif 物品.等级==7 then
					self.物品.小模型资源=0xEFA4BA2C
				elseif 物品.等级==8 then
					self.物品.小模型资源=0x2E030271
				end
				self.物品.大模型资源=变身资源[物品.造型]
			end
			if self.物品.小模型 == nil then
              self.物品.小模型 = tp.资源:载入(self.物品.小模型id or self.物品.资源,"网易WDF动画",self.物品.小模型资源)
			end
		end
	else
		self.物品 = nil
	end
	if self.物品~=nil then
		if self.物品.回合~=nil then
			self:置灰色()
		end
	end
end

function 系统类_物品格子:置灰色()
	if self.物品~=nil and self.物品.小模型~=nil then
		self.物品.小模型:灰度级()
	end
end

function 系统类_物品格子:显示(dt,x,y,条件,总类,xx,yy,abs)
	if self.确定 or self.选中 then
		tp.物品格子确定_:显示(self.x+1,self.y+2)
	end
	self.事件 = false
	self.焦点 = false
	self.右键 = false
	if self.物品 ~= nil then
		if self.遮挡 ~= nil and type(self.遮挡) ~= "number" then
			self.遮挡:显示(self.x-1+(xx or 0),self.y+4+(yy or 0))
		end
		self.物品.小模型:显示(self.x-1,self.y+2)
		if self.物品.回合~=nil then
			local 数量=string.len(tostring(self.物品.回合))
			for i=1,数量 do
				local 序列=string.sub(self.物品.回合,i,i)-1
				if 战斗类.法宝图片[序列]~=nil then
					战斗类.法宝图片[序列]:显示(self.x-数量*2-数量*1.5+20,self.y+20)
				end
			end
		end
		if self.物品.可叠加 and 总类 == nil then
			zt:置颜色(4294967295)
			zt:置描边颜色(-16777216)
			zt:显示(self.x + 3,self.y + 3,self.物品.数量)
		else
		if not self.物品.可叠加 and 总类 == nil then

			--zt:显示(self.x + 0,self.y + 37,self.物品.级别限制)
            zts1:置颜色(0xFFFFFF00)

			zts1:显示(self.x -2 ,self.y + 33,self.物品.附带技能)

			end
		if ((总类 and 总类 ~= false) and self.物品.总类 ~= 总类[1] and self.物品.总类 ~= 总类[2] and (总类[3]==nil or 总类[3]==false)) then
			tp.物品格子禁止_:显示(self.x + 5,self.y + 6)
		end
	end
	end
	if not tp.消息栏焦点 then
		if x>=self.x and x<=self.x+50 and y>=self.y and y<=self.y+50 and 条件 then
			tp.按钮焦点 = true
			tp.禁止关闭 = true
			if mouse(0) then
				self.事件 = true
			elseif mouse(1) then
				self.右键 = true
			end
			if self.格子显示 == nil then
				if self.物品 and self.物品.大模型 == nil then
					self.物品.大模型 = tp.资源:载入(self.物品.资源,"网易WDF动画",self.物品.大模型资源)
				end
				if abs == nil then
					tp.物品格子焦点_:显示(self.x+1,self.y+1)
				end
			end
			self.焦点 = true
		end
	end
end

function 系统类_物品格子:置坐标(x,y)
	self.x,self.y = x,y
end

return 系统类_物品格子