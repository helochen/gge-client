local 拍卖系统 = class()
local insert = table.insert
local floor = math.floor
local min = math.min
local max = math.max
local ceil = math.ceil
local tp,ptzt,hkzt
local bw = require("gge包围盒")(0,0,54,54)
local box = 引擎.画矩形

function 拍卖系统:初始化(根)
	self.ID = 803
	self.x = math.floor((全局游戏宽度-448)/2)
	self.y = math.floor((全局游戏高度-489)/2)
	self.xx = 0
	self.yy = 0
	self.注释 = "拍卖系统"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	self.窗口时间 = 0
	tp = 根
	ptzt = tp.字体表.普通字体
	hkzt = tp.字体表.普通字体
	self.控件类 = require("ggeui/加载类")()
	local 总控件 = self.控件类:创建控件('给予总控件')
	总控件:置可视(true,true)
	self.输入框 = 总控件:创建输入("银两输入",0,0,110,16)
	self.输入框:置可视(false,false)
	self.输入框:置限制字数(12)
	self.输入框:置数字模式()
	self.输入框:屏蔽快捷键(true)
	self.输入框:置光标颜色(0xFF6C310A)
	self.输入框:置文字颜色(0xFF6C310A)
end

function 拍卖系统:打开(内容)
	if self.可视 then
		self.可视 = false
		self.资源组 = nil
		self.按钮组 = nil
		self.输入框:置可视(false,false)
		self.输入框:置文本("")
		self.数据 = nil
		self.拍卖数据 = nil
		return
	else
		insert(tp.窗口_,self)
		self:加载数据()
		self.输入框:置可视(true,true)
	    tp.运行时间 = tp.运行时间 + 1
	    self.窗口时间 = tp.运行时间
	    self.可视 = true
	    self.分类 = "浏览拍品"
	    self.数据 = 内容
	    local 格子 = tp._物品格子
	    self.拍卖数据 = {}
		for n=1,#self.数据 do
			if self.数据[n].分类 == "物品" then
				self.拍卖数据[n] = 格子.创建(0,0,n,"拍品物品")
				self.拍卖数据[n]:置物品(self.数据[n].数据)
			elseif self.数据[n].分类 == "召唤兽" then
				local xn = 引擎.取头像(self.数据[n].数据.模型)
				self.拍卖数据[n] = tp.资源:载入(xn[8],"网易WDF动画",xn[2])
			end
		end
		self.加入 = 0
		self.加入2 = 0
		self.加入3 = 0
		self.选中编号 = 0
		self.竞拍数据 = {}
		self.竞价记录 = {}
	end
end

function 拍卖系统:加载数据()
	local 资源 = tp.资源
	local 按钮 = tp._按钮
	local 自适应 = tp._自适应
	self.资源组 = {
		[1] = 资源:载入('wpal/121.wpal',"网易WDF动画",0xBBAA8801),
		[2] = 资源:载入('wpal/121.wpal',"网易WDF动画",0xBBAA8802),
		[3] = 资源:载入('wpal/121.wpal',"网易WDF动画",0xBBAA8803),
		[4] = 资源:载入('wpal/121.wpal',"网易WDF动画",0xBBAA8804),
		[5] = 资源:载入('wpal/121.wpal',"网易WDF动画",0xBBAA8805),
		[6] = 资源:载入('wpal/121.wpal',"网易WDF动画",0xBBAA8806),
	}
	self.按钮组 = {
		[1] = 按钮.创建(资源:载入('wpal/121.wpal',"网易WDF动画",0xBBBB8804),0,0,3,true,true),--参与竞拍
		[2] = 按钮.创建(资源:载入('wpal/121.wpal',"网易WDF动画",0xBBBB8804),0,0,3,true,true),
		[3] = 按钮.创建(资源:载入('wpal/121.wpal',"网易WDF动画",0xBBBB8804),0,0,3,true,true),
		[4] = 按钮.创建(资源:载入('wpal/121.wpal',"网易WDF动画",0xBBBB8804),0,0,3,true,true),
		[5] = 按钮.创建(资源:载入('wpal/121.wpal',"网易WDF动画",0xBBBB8800),0,0,3,true,true),--关闭
		[6] = 按钮.创建(资源:载入('wpal/121.wpal',"网易WDF动画",0xFFFF2803),0,0,4,true,true),--上箭头
		[7] = 按钮.创建(资源:载入('wpal/121.wpal',"网易WDF动画",0xFFFF2804),0,0,4,true,true),--下箭头
		[8] = 按钮.创建(资源:载入('wpal/121.wpal',"网易WDF动画",0xBBBB8801),0,0,3,true,true),
		[9] = 按钮.创建(资源:载入('wpal/121.wpal',"网易WDF动画",0xBBBB8802),0,0,3,true,true),
		[10] = 按钮.创建(资源:载入('wpal/121.wpal',"网易WDF动画",0xBBBB8803),0,0,3,true,true),
		[11] = 按钮.创建(资源:载入('wpal/121.wpal',"网易WDF动画",0xBBBB8807),0,0,3,true,true),--刷新
		[12] = 按钮.创建(资源:载入('wpal/121.wpal',"网易WDF动画",0xBBBB8805),0,0,3,true,true),--出价
		[13] = 按钮.创建(资源:载入('wpal/121.wpal',"网易WDF动画",0xBBBB8806),0,0,3,true,true),--报名
		[21] = 按钮.创建(资源:载入('wpal/121.wpal',"网易WDF动画",0xBBBB8808),0,0,3,true,true),--取回保证金
		[22] = 按钮.创建(资源:载入('wpal/121.wpal',"网易WDF动画",0xBBBB8808),0,0,3,true,true),
		[23] = 按钮.创建(资源:载入('wpal/121.wpal',"网易WDF动画",0xBBBB8808),0,0,3,true,true),
		[24] = 按钮.创建(资源:载入('wpal/121.wpal',"网易WDF动画",0xBBBB8808),0,0,3,true,true),
		[25] = 按钮.创建(资源:载入('wpal/121.wpal',"网易WDF动画",0xBBBB8809),0,0,3,true,true),--取出拍品
		[26] = 按钮.创建(资源:载入('wpal/121.wpal',"网易WDF动画",0xBBBB8809),0,0,3,true,true),
		[27] = 按钮.创建(资源:载入('wpal/121.wpal',"网易WDF动画",0xBBBB8809),0,0,3,true,true),
		[28] = 按钮.创建(资源:载入('wpal/121.wpal',"网易WDF动画",0xBBBB8809),0,0,3,true,true),
	}

	for n=1,#self.按钮组 do
	    self.按钮组[n]:绑定窗口_(803)
	end

end

function 拍卖系统:刷新拍卖数据(数据)
	self.数据[self.选中编号]=数据
end

function 拍卖系统:刷新竞价数据(数据)
	table.print(数据)
	self.竞价记录 = 数据.数据
	if 数据.编号~=nil then
		self:刷新竞价数据2(数据.编号)
	end
end

function 拍卖系统:刷新竞价数据2(编号)
	if self.选中编号~=0 and self.选中编号==编号 and self.竞价记录[self.选中编号]~=nil then
		self.竞价记录[self.选中编号]=reverseTable(self.竞价记录[self.选中编号])
		self.加入3=0
	end
end

function 拍卖系统:打开竞拍数据(数据)
	self.竞拍数据 = 数据
	self.分类 = "我的竞价"
end

function 拍卖系统:显示(dt,x,y)
	self.焦点 = false
	self.右键关闭 = nil
	self.资源组[1]:显示(self.x,self.y)
	self.按钮组[5]:更新(x,y)
	self.按钮组[5]:显示(self.x+528,self.y+2)
	hkzt:置颜色(白色):显示(self.x+241,self.y+4,"拍 卖 系 统")

	self.按钮组[8]:更新1(x,y,self.分类 ~= "浏览拍品",nil,2)
	self.按钮组[8]:显示(self.x+17, self.y+42,true,nil,nil,self.分类 == "浏览拍品",2)
	self.按钮组[9]:更新1(x,y,self.分类 ~= "拍品详情",nil,2)
	self.按钮组[9]:显示(self.x+117, self.y+42,true,nil,nil,self.分类 == "拍品详情",2)
	self.按钮组[10]:更新1(x,y,self.分类 ~= "我的竞价",nil,2)
	self.按钮组[10]:显示(self.x+217, self.y+42,true,nil,nil,self.分类 == "我的竞价",2)


	if self.分类 == "浏览拍品" then
		self.输入框:置可视(false,false)
		self.资源组[2]:显示(self.x+526,self.y+67)
		self.按钮组[6]:更新(x,y)
		self.按钮组[7]:更新(x,y)
		self.按钮组[6]:显示(self.x+523,self.y+65)
		self.按钮组[7]:显示(self.x+523,self.y+416)

		hkzt:置颜色(0xFF6C310A):显示(self.x+348+50,self.y+46,"当前共    件拍品")
		hkzt:置颜色(红色):显示(self.x+396+50,self.y+46,#self.拍卖数据)

		box(self.x+62,self.y+162,self.x+500,self.y+163,0xFFdeba9c)
		box(self.x+62,self.y+247,self.x+500,self.y+248,0xFFdeba9c)
		box(self.x+62,self.y+332,self.x+500,self.y+333,0xFFdeba9c)
		for i=1,4 do
			if self.数据[i+self.加入] ~= nil then
				self.资源组[3]:显示(self.x+70,self.y+94+(i-1)*85)
				if self.数据[i+self.加入].分类 == "物品" then
					self.拍卖数据[i+self.加入]:置坐标(self.x+73,self.y+94+(i-1)*85)
					self.拍卖数据[i+self.加入]:显示(dt,x,y,self.鼠标)

					if self.拍卖数据[i+self.加入].焦点 and not tp.消息栏焦点 then
						tp.提示:道具行囊(x,y,self.拍卖数据[i+self.加入].物品)
					end
				elseif self.数据[i+self.加入].分类 == "召唤兽" then
					bw:置坐标(self.x+73,self.y+94+(i-1)*85)
					self.拍卖数据[i+self.加入]:显示(self.x+75,self.y+99+(i-1)*85)
					if bw:检查点(x,y)  then
						tp.提示:自定义(x,y,"右键查看该召唤兽详细属性")
						self.资源组[4]:更新(dt)
						self.资源组[4]:显示(self.x+73,self.y+94+(i-1)*85)
						if 引擎.鼠标弹起(右键) then
							self.右键关闭 = true
							tp.窗口.召唤兽查看栏:打开(self.数据[i+self.加入].数据)
						end
					end
				end

				local startTime = self.数据[i+self.加入].起拍时间
				local stopTime = self.数据[i+self.加入].结束时间-os.time()
				local mTime = math.floor(stopTime / 60)
				local sTime = math.floor(stopTime % 60)
				hkzt:置颜色(0xFF6C310A):显示(self.x+175-7,self.y+94+(i-1)*85,"起拍价：")
				hkzt:置颜色(0xFF6C310A):显示(self.x+258,self.y+94+(i-1)*85,self.数据[i+self.加入].起拍价.."("..self.数据[i+self.加入].类型..")")
				if startTime <= os.time() then
					if stopTime > 0 then
						hkzt:置颜色(0xFF6C310A):显示(self.x+168,self.y+114+(i-1)*85,"当前价：")
						hkzt:置颜色(0xFF6C310A):显示(self.x+258,self.y+114+(i-1)*85,self.数据[i+self.加入].当前价.."("..self.数据[i+self.加入].类型..")")
						hkzt:置颜色(0xFF6C310A):显示(self.x+153,self.y+133+(i-1)*85,"距离结束仅剩：")
						hkzt:置颜色(红色):显示(self.x+258,self.y+133+(i-1)*85,mTime.."分 "..sTime.."秒")

					elseif stopTime <= 0 then
						hkzt:置颜色(0xFF6C310A):显示(self.x+203,self.y+114+(i-1)*85,"拍卖已结束！")
						hkzt:置颜色(0xFF6C310A):显示(self.x+168,self.y+133+(i-1)*85,"成交价：")
						hkzt:置颜色(0xFF6C310A):显示(self.x+258,self.y+133+(i-1)*85,self.数据[i+self.加入].当前价.."("..self.数据[i+self.加入].类型..")")
					end
				else
					hkzt:置颜色(0xFF6C310A):显示(self.x+203,self.y+114+(i-1)*85,"拍卖尚未开始")
					hkzt:置颜色(0xFF6C310A):显示(self.x+161,self.y+133+(i-1)*85,"开拍时间：")
					hkzt:置颜色(0xFF6C310A):显示(self.x+258,self.y+133+(i-1)*85,os.date("%Y-%m-%d %H:%M:%S",startTime))
				end

				self.按钮组[i]:更新(x,y)
				self.按钮组[i]:显示(self.x+385,self.y+108+(i-1)*85)
				if self.按钮组[i]:事件判断() then
					if i+self.加入 == self.数据[i+self.加入].编号 then
						self.选中编号 = i+self.加入
						self.输入框:置文本("")
						self.分类 = "拍品详情"
					end
				end
			end
		end

		if self.按钮组[6]:事件判断() then
			if self.加入<=0 then
				tp.提示:写入("#Y/到头了")
			else
				self.加入 = self.加入-1
			end
			return false
		elseif self.按钮组[7]:事件判断() then
			if self.加入>=#self.拍卖数据-4 then
				tp.提示:写入("#Y/到头了")
			else
				self.加入 = self.加入+1
			end
			return false
		elseif self.资源组[1]:是否选中(x,y) and 引擎.取鼠标滚轮() == 1 then
			if self.加入<=0 then
				-- tp.提示:写入("#Y/到头了")
			else
				self.加入 = self.加入-1
			end
			return false
		elseif self.资源组[1]:是否选中(x,y) and 引擎.取鼠标滚轮() == -1 then
			if self.加入>=#self.拍卖数据-4 then
				-- tp.提示:写入("#Y/到头了")
			else
				self.加入 = self.加入+1
			end
			return false
		end

	elseif self.分类 == "拍品详情" then

		self.资源组[3]:显示(self.x+70,self.y+94)
		self.资源组[6]:显示(self.x+33,self.y+311)
		hkzt:置颜色(0xFF6C310A):显示(self.x+348,self.y+46,"当前共    件拍品")
		hkzt:置颜色(红色):显示(self.x+396,self.y+46,#self.拍卖数据)
		hkzt:置颜色(0xFF6C310A):显示(self.x+42,self.y+292,"竞价信息：")
		if self.数据[self.选中编号].分类 == "物品" then
			self.拍卖数据[self.选中编号]:置坐标(self.x+73,self.y+94)
			self.拍卖数据[self.选中编号]:显示(dt,x,y,self.鼠标)
			if self.拍卖数据[self.选中编号].焦点 and not tp.消息栏焦点 then
				tp.提示:道具行囊(x,y,self.拍卖数据[self.选中编号].物品)
			end
		elseif self.数据[self.选中编号].分类 == "召唤兽" then
			bw:置坐标(self.x+73,self.y+94)
			self.拍卖数据[self.选中编号]:显示(self.x+75,self.y+99)
			if bw:检查点(x,y)  then
				tp.提示:自定义(x,y,"右键查看该召唤兽详细属性")
				self.资源组[4]:更新(dt)
				self.资源组[4]:显示(self.x+73,self.y+94)
				if 引擎.鼠标弹起(右键) then
					self.右键关闭 = true
					tp.窗口.召唤兽查看栏:打开(self.数据[self.选中编号].数据)
				end
			end
		end
		local startTime = self.数据[self.选中编号].起拍时间
		local stopTime = self.数据[self.选中编号].结束时间-os.time()
		local mTime = math.floor(stopTime / 60)
		local sTime = math.floor(stopTime % 60)
		hkzt:置颜色(0xFF6C310A):显示(self.x+168,self.y+101,"拍品名称：")
		hkzt:置颜色(0xFF6C310A):显示(self.x+262,self.y+102,self.数据[self.选中编号].名称)
		if stopTime > 0 then
			hkzt:置颜色(0xFF6C310A):显示(self.x+154,self.y+125,"距离结束仅剩：")
			hkzt:置颜色(红色):显示(self.x+262,self.y+124,mTime.."分 "..sTime.."秒")
			self.输入框:置可视(true,true)
			self.资源组[5]:显示(self.x+95,self.y+255)
			self.按钮组[11]:更新(x,y)
			self.按钮组[11]:显示(self.x+470,self.y+42)
			self.按钮组[12]:更新(x,y)
			self.按钮组[12]:显示(self.x+212,self.y+255)
			self.按钮组[13]:更新(x,y)
			self.按钮组[13]:显示(self.x+368,self.y+255)
		elseif stopTime <= 0 then
			self.输入框:置可视(false,false)
			hkzt:置颜色(0xFF6C310A):显示(self.x+168,self.y+125,"拍卖已结束！")
		end

		hkzt:置颜色(0xFF6C310A):显示(self.x+73,self.y+168,"起拍价：")
		hkzt:置颜色(0xFF6C310A):显示(self.x+156,self.y+168,self.数据[self.选中编号].起拍价.."("..self.数据[self.选中编号].类型..")")
		hkzt:置颜色(0xFF6C310A):显示(self.x+66,self.y+192,"开拍时间：")
		hkzt:置颜色(0xFF6C310A):显示(self.x+156,self.y+192,os.date("%Y-%m-%d %H:%M:%S",startTime))
		hkzt:置颜色(0xFF6C310A):显示(self.x+73,self.y+216,"当前价：")
		hkzt:置颜色(0xFF6C310A):显示(self.x+156,self.y+216,self.数据[self.选中编号].当前价.."("..self.数据[self.选中编号].类型..")")

		hkzt:置颜色(0xFF6C310A):显示(self.x+338,self.y+168,"当前共有     人报名竞拍")
		hkzt:置颜色(红色):显示(self.x+411,self.y+168,self.数据[self.选中编号].报名人数)
		hkzt:置颜色(0xFF6C310A):显示(self.x+338,self.y+192,"当前共有     次竞价信息")
		hkzt:置颜色(红色):显示(self.x+411,self.y+192,self.数据[self.选中编号].竞价记录)
		hkzt:置颜色(0xFF6C310A):显示(self.x+338,self.y+216,"保证金：")
		hkzt:置颜色(0xFF6C310A):显示(self.x+411,self.y+216,self.数据[self.选中编号].保证金.."("..self.数据[self.选中编号].类型..")")

		self.输入框:置坐标(self.x+100,self.y+259)
		self.控件类:更新(dt,x,y)
		self.控件类:显示(x,y)

		self.按钮组[6]:更新(x,y)
		self.按钮组[7]:更新(x,y)
		self.按钮组[6]:显示(self.x+500,self.y+311)
		self.按钮组[7]:显示(self.x+500,self.y+400)

		 for i=1,5 do
		 	if self.竞价记录[self.选中编号]~=nil and self.竞价记录[self.选中编号][i+self.加入3]~=nil then
				hkzt:置颜色(0xFF6C310A):显示(self.x+44,self.y+302+(i)*20,os.date("%Y-%m-%d %H:%M:%S",self.竞价记录[self.选中编号][i+self.加入3].时间).."   ID："..self.竞价记录[self.选中编号][i+self.加入3].id.."   出价："..self.竞价记录[self.选中编号][i+self.加入3].出价)
		 	end
		 end



		if self.按钮组[11]:事件判断() then
			发送数据(6305,{编号=self.选中编号})
		elseif self.按钮组[12]:事件判断() then

			if self.输入框:取文本() == "" or tonumber(self.输入框:取文本()) == nil then
				tp.提示:写入("#Y/出价输入有误，请仔细检查")

			elseif tonumber(self.输入框:取文本()) <= self.数据[self.选中编号].当前价 then
				tp.提示:写入("#Y/出价不能低于拍品的当前价，请检查后重新输入")
			else
				发送数据(6304,{编号=self.选中编号,名称=self.数据[self.选中编号].名称,出价=tonumber(self.输入框:取文本())})
			end
			return false
		elseif self.按钮组[13]:事件判断() then
			发送数据(6303,{编号=self.选中编号,名称=self.数据[self.选中编号].名称})
			return false
		elseif self.按钮组[6]:事件判断() then
			if self.加入3<=0 then
				tp.提示:写入("#Y/到头了")
			else
				self.加入3 = self.加入3-1
			end
			return false
		elseif self.按钮组[7]:事件判断() then
			if self.加入3>=#self.竞价记录[self.选中编号]-5 then
				tp.提示:写入("#Y/到头了")
			else
				self.加入3 = self.加入3+1
			end
			return false
		end

	elseif self.分类 == "我的竞价" then
		self.输入框:置可视(false,false)
		self.资源组[2]:显示(self.x+526,self.y+67)
		self.按钮组[6]:更新(x,y)
		self.按钮组[7]:更新(x,y)
		self.按钮组[6]:显示(self.x+523,self.y+65)
		self.按钮组[7]:显示(self.x+523,self.y+416)

		hkzt:置颜色(0xFF6C310A):显示(self.x+348+50,self.y+46,"共参与    个竞拍")
		hkzt:置颜色(红色):显示(self.x+396+50,self.y+46,#self.竞拍数据)

		box(self.x+62,self.y+162,self.x+500,self.y+163,0xFFdeba9c)
		box(self.x+62,self.y+247,self.x+500,self.y+248,0xFFdeba9c)
		box(self.x+62,self.y+332,self.x+500,self.y+333,0xFFdeba9c)

		for i=1,4 do
			if self.竞拍数据[i+self.加入2] ~= nil then
				local 竞拍编号 = self.竞拍数据[i+self.加入2].编号
				self.资源组[3]:显示(self.x+70,self.y+94+(i-1)*85)

				if self.数据[竞拍编号].分类 == "物品" then
					self.拍卖数据[竞拍编号]:置坐标(self.x+73,self.y+94+(i-1)*85)
					self.拍卖数据[竞拍编号]:显示(dt,x,y,self.鼠标)

					if self.拍卖数据[竞拍编号].焦点 and not tp.消息栏焦点 then
						tp.提示:道具行囊(x,y,self.拍卖数据[竞拍编号].物品)
					end
				elseif self.数据[竞拍编号].分类 == "召唤兽" then
					bw:置坐标(self.x+73,self.y+94+(i-1)*85)
					self.拍卖数据[竞拍编号]:显示(self.x+75,self.y+99+(i-1)*85)
					if bw:检查点(x,y)  then
						tp.提示:自定义(x,y,"右键查看该召唤兽详细属性")
						self.资源组[4]:更新(dt)
						self.资源组[4]:显示(self.x+73,self.y+94+(i-1)*85)
						if 引擎.鼠标弹起(右键) then
							self.右键关闭 = true
							tp.窗口.召唤兽查看栏:打开(self.数据[竞拍编号].数据)
						end
					end
				end

				local startTime = self.数据[竞拍编号].起拍时间
				local stopTime = self.数据[竞拍编号].结束时间-os.time()
				local mTime = math.floor(stopTime / 60)
				local sTime = math.floor(stopTime % 60)
				hkzt:置颜色(0xFF6C310A):显示(self.x+175-7,self.y+94+(i-1)*85,"当前价：")
				hkzt:置颜色(0xFF6C310A):显示(self.x+258,self.y+94+(i-1)*85,self.数据[竞拍编号].当前价.."("..self.数据[竞拍编号].类型..")")
				hkzt:置颜色(0xFF6C310A):显示(self.x+161,self.y+114+(i-1)*85,"我的出价：")
				hkzt:置颜色(0xFF6C310A):显示(self.x+258,self.y+114+(i-1)*85,self.竞拍数据[i+self.加入2].当前出价.."("..self.数据[竞拍编号].类型..")")

				if startTime <= os.time() then
					if stopTime > 0 then
						hkzt:置颜色(0xFF6C310A):显示(self.x+153,self.y+133+(i-1)*85,"距离结束仅剩：")
						hkzt:置颜色(红色):显示(self.x+258,self.y+133+(i-1)*85,mTime.."分 "..sTime.."秒")
					elseif stopTime <= 0 then
						hkzt:置颜色(0xFF6C310A):显示(self.x+161,self.y+133+(i-1)*85,"拍卖已结束，成交状态：")
						hkzt:置颜色(0xFF6C310A):显示(self.x+375,self.y+100+(i-1)*85,"保证金：")
						hkzt:置颜色(0xFF6C310A):显示(self.x+445,self.y+100+(i-1)*85,self.竞拍数据[i+self.加入2].保证金.."("..self.数据[竞拍编号].类型..")")
						if self.竞拍数据[i+self.加入2].结束==true then
							if self.竞拍数据[i+self.加入2].状态=="出局" then
								hkzt:置颜色(红色):显示(self.x+320,self.y+133+(i-1)*85,"出局")
								self.按钮组[i+20]:更新(x,y)
								self.按钮组[i+20]:显示(self.x+385,self.y+123+(i-1)*85)
								if self.按钮组[i+20]:事件判断() then
									发送数据(6307,{编号1=i+self.加入2,编号2=竞拍编号})
								end
							elseif self.竞拍数据[i+self.加入2].状态=="成交" then
								hkzt:置颜色(红色):显示(self.x+320,self.y+133+(i-1)*85,"成交")
								self.按钮组[i+24]:更新(x,y)
								self.按钮组[i+24]:显示(self.x+385,self.y+123+(i-1)*85)
								if self.按钮组[i+24]:事件判断() then
									发送数据(6307,{编号1=i+self.加入2,编号2=竞拍编号})
								end
							end
						end
					end
				else
					hkzt:置颜色(0xFF6C310A):显示(self.x+168,self.y+133+(i-1)*85,"拍卖尚未开始")
				end



			end
		end
	end

	if self.按钮组[5]:事件判断() then
		self:打开()
		return false
	elseif self.按钮组[8]:事件判断() then
		self.分类 = "浏览拍品"
	elseif self.按钮组[9]:事件判断() then
		tp.提示:写入("#Y/请选择心仪的商品点击参与竞拍进入详情页面")
	elseif self.按钮组[10]:事件判断() then
		发送数据(6306)
		return false
	end
	if self.输入框._已碰撞 then
		self.焦点 = true
	end
end

function 拍卖系统:检查点(x,y)
	if self.可视 and self.资源组~=nil and self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 拍卖系统:初始移动(x,y)
	tp.运行时间 = tp.运行时间 + 1
	if not tp.消息栏焦点 then
  		self.窗口时间 = tp.运行时间
 	end
	if not self.焦点 then
		tp.移动窗口 = true
	end
	if self.可视 and self.鼠标 and not self.焦点 then
		self.xx = x - self.x
		self.yy = y - self.y
	end
end

function 拍卖系统:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 拍卖系统