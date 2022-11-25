


--=================,=====================================================--
local 场景类_对话栏 = class()
local bw = require("gge包围盒")
local floor = math.floor
local ceil = math.ceil
local insert = table.insert
local remove = table.remove
local format = string.format
local random = 引擎.取随机整数
local tp
local max = math.max
local tx = 引擎.取头像
local sort = table.sort
local mousea = 引擎.鼠标按住
local mouseb = 引擎.鼠标弹起
local insert = insert
local qbb = 引擎.取宝宝
local zts
function 场景类_对话栏:初始化(根)
	self.ID = 2
	self.x = 100
	self.y = 340
	self.xx = 0
	self.yy = 0
	self.注释 = "对话栏"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	tp = 根
	local 资源 = tp.资源
	local 自适应 = tp._自适应
	self.资源组 = {
		[1] = 资源:载入('wzife.wd4',"网易WDF动画",0x260BE57C),
		[2] = 自适应.创建(28,1,40,28,1,3,nil,18),
	}
	self.背景窗口 = 资源:载入('wzife.wd5',"网易WDF动画",0x01000050)  --增加
	self.头像 = ""
	self.名称 = ""
	self.头像宽度 = 0
	self.头像高度 = 0
	self.文本高度 = 0
	self.选项 = {}
	self.记录文本 = {}
	self.丰富文本 = 根._丰富文本(569,287)
	self.窗口时间 = 0
	self.坐标 = 0
	self.关闭事件 = false
	self.放载事件 = nil
	self.接触按钮 = false
	self.缓冲时间 = 0 -- 都有缓冲时间，避免重复点击
	self.模型头像 = ""
	zts = tp.字体表.普通字体
end

function 场景类_对话栏:打开()
	if self.可视 then
		self.丰富文本:清空()
		self.选项 = {}
		self.记录文本 = {}
		self.可视 = false
		self.模型头像 = nil
		self.第二列 = nil
		self.第三列 = nil
		self.第四列 = nil
		self.文本内容 = nil
		--self.背景窗口=nil  --修改
		tp.场景.事件选中 = false
	else
	    tp.运行时间 = tp.运行时间 + 1
	    self.窗口时间 = tp.运行时间
	    self.可视 = true
	    --self.背景窗口 = tp._自适应.创建(0,1,600,170,3,9)  --修改
	end
end

function 场景类_对话栏:显示(dt,x,y)
	if self.缓冲时间 > 0  then
	  	self.缓冲时间 = self.缓冲时间 - 0.2
	end
	self.接触按钮 = false
	if self.头像 ~= "" then
		local v = self.头像宽度
		if v > 50 then
			v = self.x + 13
		end
		self.头像:显示(self.x+15+self.头像.信息组[0][2],self.y-self.头像高度+2,1)
	end
	if self.名称 ~= nil and self.名称 ~= "" then
		self.资源组[1]:显示(self.x,self.y-27)
		zts:置颜色(4294967295):显示(self.x+10 + (78 - #self.名称*3.72),self.y-20,self.名称)
	end
	self.背景窗口:显示(self.x,self.y)
	self.丰富文本:显示(self.x+17,self.y+17)
	self:选项解析(x,y)
	self.焦点 = false
	if self.鼠标 then
		if not self.接触按钮 and not (self.头像 ~= "" and self.头像:是否选中(x,y)) and self.缓冲时间 <= 0 then
			if mouseb(0) then
				if #self.记录文本 > 0 then
					self:下一页()
				else
					if self.选项 == nil or (self.选项 ~= nil and self.选项[1] == nil) then
						if self.放载事件 == "车迟国" then
							if tp.剧情开关.副本[2] == 2 then
								tp.剧情开关.副本[2] = 3
								tp.假人库:生成副本Npc()
								tp.窗口.任务栏:删除("副本任务")
								tp.窗口.任务栏:添加("副本任务",format("“灭佛兴道”之气不能忍，吃光场内所有供品。\n#L/完成度：%d/10",tp.剧情开关.副本[4][3]))
							elseif tp.剧情开关.副本[2] == 4 then
								tp.剧情开关.副本[2] = 5
								tp.场景:传送至(1137,41,35)
								tp.假人库:生成副本Npc()
								tp.窗口.任务栏:删除("副本任务")
								tp.窗口.任务栏:添加("副本任务",format("这三座道士像，定是那妖道所砌！为解心头之气，只好冒犯神像了！\n#L/完成度：%d/3",tp.剧情开关.副本[4][4]))
							elseif tp.剧情开关.副本[2] == 5 then
								tp.剧情开关.副本[2] = 6
								tp.场景:传送至(1111,31,149)
								tp.假人库:生成副本Npc()
								tp.窗口.任务栏:删除("副本任务")
								tp.窗口.任务栏:添加("副本任务","前方似乎有个神仙，问问他关于妖道的消息")
							elseif tp.剧情开关.副本[2] == 6 then
								tp.剧情开关.副本[4][5] = 1
								tp.剧情开关.副本[4][6] = 0
								tp.假人库:生成副本Npc()
								tp.窗口.任务栏:删除("副本任务")
								tp.窗口.任务栏:添加("副本任务",format("火速阻止风婆、雨师、雷公的施法\n#L/完成度：%d/3",tp.剧情开关.副本[4][6]))
							end
						elseif self.放载事件 ~= nil then
							for i=1,#self.放载事件 do
								loadstring(self.放载事件[i])()
							end
							for i=1,#(self.结束事件 or {}) do
								loadstring(self.结束事件[i])()
							end
						end
						if self.结束事件 == nil then
							self:打开()
						else
							self:下一页()
							self.结束事件 = nil
						end
					end
					return false
				end
			end
		end
	end

 if 引擎.鼠标弹起(右键) then self:打开() end
end

function 场景类_对话栏:选项解析(x,y)
	if #self.选项 > 0 then
		for n=1, #self.选项 do
			--local 颜色 =
			local xx = 0
			local yy = 0
			if n<=5 then
				self.选项[n].选中判断:置坐标(self.x+19,self.y + self.文本高度+((n-1) * 22) + 5)
			elseif n <= 10 then
				self.选项[n].选中判断:置坐标(self.x+self.第二列,self.y + self.文本高度+((n-6) * 22))
			elseif n <= 15 then
				self.选项[n].选中判断:置坐标(self.x+self.第三列,self.y + self.文本高度+((n-11) * 22))
			elseif n <= 20 then
				self.选项[n].选中判断:置坐标(self.x+self.第四列 ,self.y + self.文本高度+((n-16) * 22))
			end
			if self.鼠标 and self.选项[n].选中判断:检查点(x,y) and not self.焦点 then

				--print(self.选项[n].跳转链接)
				self.接触按钮 = true
				self.焦点 = true
				if mousea(0) then
					xx = 1
					yy = 1
				end
				self.资源组[2]:置宽高(zts:取宽度(self.选项[n].基本内容)+12,28)
				self.资源组[2]:显示(self.选项[n].选中判断.x-7+xx,self.选项[n].选中判断.y-6+yy)
				if mouseb(0) then
					if self.选项[n].跳转链接 ~= nil then
						local 当前地图 = tp.当前地图
						if (self.选项[n].跳转链接 ~= "我要招募队员" and self.选项[n].跳转链接 ~= "我随便逛逛 不好意思") and 当前地图 == 1537 and self.名称 == "贸易车队总管" then
							self:建邺城贸易总管(self.选项[n].跳转链接)
							self:下一页()
							break
						elseif (self.选项[n].跳转链接 ~= "兑换海产" and self.选项[n].跳转链接 ~= "太贵了我没钱" and self.选项[n].跳转链接 ~= "花费2000两购买鱼竿") and 当前地图 == 1092 and self.名称 == "渔夫" then
							self:傲来国渔夫(self.选项[n].跳转链接)
							self:下一页()
							break
						elseif self.放载事件 == "门派师傅" or self.放载事件 == "师门答题" then
							self:师门执行事件(当前地图,self.名称,self.选项[n].跳转链接,self.模型头像)
							self:下一页()
							break
						--elseif self.选项[n].跳转链接 == "学习技能" then
							--self:师门执行事件(当前地图,self.名称,self.选项[n].跳转链接,self.模型头像)
							--self:下一页()
							--break
						--elseif self.名称 == "门派传送人" then
							--self.可视 = false
							--tp.场景.人物:置传送(self.选项[n].跳转链接)
							--break
						else
							self:事件解析(self.选项[n].跳转链接,当前地图,self.名称,nil,n)
							if self.关闭事件 then
								self.关闭事件 = false
								break
							end
						end
					end
				end
	        end
	        if self.选项[n].基本内容 == "红尘试炼" then
	        	zts:置颜色(0xFFFFFF00)
	       	elseif self.选项[n].基本内容 == "打造任务" or self.选项[n].基本内容 == "上交物品" or self.选项[n].基本内容 == "上交召唤兽" or self.选项[n].基本内容 == "上交乾坤袋" or self.选项[n].基本内容 == "宠物修炼任务"  then
	        	zts:置颜色(黄色)
	        else
	        	zts:置颜色(0xFFFF6666)
	        end
			if n<=5 then
				zts:显示(self.x+19 + xx,self.y  + yy + self.文本高度+((n-1) * 22) + 5,self.选项[n].基本内容)
			elseif n <= 10 then
				zts:显示(self.x+self.第二列 + xx,self.y  + yy + self.文本高度+((n-6) * 22),self.选项[n].基本内容)
			elseif n <= 15 then
				zts:显示(self.x+self.第三列 + xx,self.y  + yy + self.文本高度+((n-11) * 22),self.选项[n].基本内容)
			elseif n <= 20 then
				zts:显示(self.x+self.第四列 + xx,self.y  + yy + self.文本高度+((n-16) * 22),self.选项[n].基本内容)
			end
		end
	end
end

local 大小排序 = function(a,b)
	return a < b
end

function 场景类_对话栏:文本(头像,名称,内容,选项,放载事件,附加事件,下一页事件)
	if self.可视 then self:打开() end
	if 内容==nil then return  end
	if tp.剧情开关.押镖 ~= false and 放载事件 == "门派师傅" then
		if tp.剧情开关.押镖[1] == tp.当前地图 and tp.剧情开关.押镖[2] == 名称 then
			if 选项 ~= nil then
				insert(选项,"押镖任务")
			end
		end
	end
	if tp.剧情开关.四季 ~= false and tp.剧情开关.四季[1] == "元宵拜年" and 放载事件 == "门派师傅" then
		if tp.剧情开关.四季[4][1][1] == tp.当前地图 and tp.剧情开关.四季[4][1][2] == 名称 then
			if 选项 ~= nil then
				insert(选项,"四季轮转")
			end
		end
	end
	for i=1,#tp.窗口_ do
		if tp.窗口_[i] == self then
			remove(tp.窗口_,i)
			break
		end
	end
	insert(tp.窗口_,self)
	self.第二列 = nil
	self.第三列 = nil
	self.第四列 = nil
	self.文本内容 = 内容
	self.放载事件 = 放载事件
	self.附加事件 = 附加事件
	if not self.可视 then
		self:打开()
		self.选项 = {}
		self.名称 = 名称
		self.丰富文本:清空()
		self.下一页事件 = 下一页事件
		local ab = self.丰富文本:添加文本(内容)
		if 头像 ~= "" and 头像 ~= nil then
			local 头像资源 = tx(头像)
			self.头像 = tp.资源:载入(头像资源[10] or 头像资源[7],"网易WDF动画",头像资源[4])
			self.头像高度 = self.头像.高度 + tp:取y偏移(头像)
			self.模型头像 = 头像
		else
			self.头像 = ""
			self.模型头像 = ""
		end
		self.文本高度 = ab+23
		if 选项 ~= nil and 选项 ~= "" and type(选项)=="table" and 选项[1] ~= nil then
			local jc = nil
			if #选项 > 5 then
				jc = {}
			end
			for i=1,#选项 do
				if jc ~= nil then
					insert(jc,zts:取宽度(选项[i]))
					if #jc >= 5 then
						sort(jc,大小排序)
						if self.第二列 == nil then
							self.第二列 = jc[#jc] + 24 + 35
						elseif self.第三列 == nil then
							self.第三列 = self.第二列 + jc[#jc] + 35
						elseif self.第四列 == nil then
							self.第四列 = self.第三列 + jc[#jc] + 35
						end
						jc = {}
					end
				end
				self.选项[i] = {
					基本内容 = 选项[i],
					跳转链接 = 选项[i],
					选中判断 = bw(0,0,zts:取宽度(选项[i]),14)
				}
			end
		end
		self.缓冲时间 = 2
	else
		local 记录 = {
			头像_ = 头像,
			名称_ = 名称,
			内容_ = 内容,
			选项_ = 选项,
			放载事件_ = 放载事件,
			下一页事件_ = 下一页事件,
		}
		insert(self.记录文本,记录)
	end
end

function 场景类_对话栏:下一页()
	if self.可视 then self:打开() end
	if self.记录文本[1] ~= nil then
		for i=1,#tp.窗口_ do
			if tp.窗口_[i] == self then
				remove(tp.窗口_,i)
				break
			end
		end
		insert(tp.窗口_,self)
		self.选项 = {}
		self.第二列 = nil
		self.第三列 = nil
		self.第四列 = nil
		local 内容 = self.记录文本[1].内容_
		local 名称 = self.记录文本[1].名称_
		local 头像 = self.记录文本[1].头像_
		local 选项 = self.记录文本[1].选项_
		self.放载事件 = self.记录文本[1].放载事件_
		self.下一页事件 = self.记录文本[1].下一页事件_
		local w = zts:取宽度(内容)
		if w > 438 then
			w = 438
		end
		self.文本内容 = 内容
		self.名称 = 名称
		if self.模型头像 ~= 头像 then
			if 头像 ~= "" and 头像 ~= nil then
				local 头像资源 = tx(头像)
				self.头像 = tp.资源:载入(头像资源[10] or 头像资源[7],"网易WDF动画",头像资源[4])
				self.头像高度 = self.头像.高度 + tp:取y偏移(头像)
				self.模型头像 = 头像
			else
				self.头像 = ""
				self.模型头像 = ""
			end
		end
		self.丰富文本:清空()
		local ab = self.丰富文本:添加文本(内容)
		self.文本高度 = ab+23
		if 选项 ~= nil and 选项 ~= "" and 选项[1] ~= nil then
			local jc = nil
			if #选项 > 5 then
				jc = {}
			end
			for i=1,#选项 do
				if jc ~= nil then
					insert(jc,zts:取宽度(选项[i]))
					if #jc >= 5 then
						sort(jc,大小排序)
						if self.第二列 == nil then
							self.第二列 = jc[#jc] + 24 + 35
						elseif self.第三列 == nil then
							self.第三列 = self.第二列 + jc[#jc] + 35
						elseif self.第四列 == nil then
							self.第四列 = self.第三列 + jc[#jc] + 35
						end
						jc = {}
					end
				end
				self.选项[i] = {
					基本内容 = 选项[i],
					跳转链接 = 选项[i],
					选中判断 = bw(0,0,zts:取宽度(选项[i]),14)
				}
			end
		end
		self.缓冲时间 = 3
		remove(self.记录文本,1)
	else
		self.可视 = false
	end
end

function 场景类_对话栏:检查点(x,y)
	if self.可视 and (self.背景窗口:是否选中(x,y)  or (self.头像 ~= nil and self.头像 ~= "" and self.头像:是否选中(x,y))) then
		return true
	else
		return false
	end
end

function 场景类_对话栏:初始移动()
	tp.运行时间 = tp.运行时间 + 1
  	self.窗口时间 = tp.运行时间
end

function 场景类_对话栏:开始移动()

end

function 场景类_对话栏:事件解析(事件,地图1,名称,名称1,编号)
	-- print("对话栏事件解析",事件,地图1,名称,名称1)
	if 事件 == "不了不了" or 事件 == "算了算了" or 事件 == "怕了怕了，我绕着走还不行吗？" or 事件 == "大王，我是来膜拜你绝世的容颜的" or 事件 == "太贵了我没钱" or 事件 == "我随便逛逛 不好意思" or 事件 == "我只是来看看" or 事件 == "我只是看看" or 事件 == "只是路过" or 事件 == "我只是路过" or 事件 == "我只是随便看看" or 事件 == "我还要逛逛" or 事件 == "我点错了" or 事件 == "我什么也不想做" or 事件 == "我保留意见" or 事件 == "我什么都不想做" or 事件 == "没什么，我只是看看" or 事件 == "我们后会有期" then
		self.可视 = false
		self.文本栏焦点 = false
		return 0
	elseif 事件 == "帮主" or 事件 == "副帮主" or 事件 == "左护法" or 事件 == "右护法" or 事件 == "长老" or 事件 == "堂主" or 事件 == "帮众" or 事件 == "商人" then
		if tp.窗口.帮派查看.选中 == nil or tp.窗口.帮派查看.帮众数据[tp.窗口.帮派查看.选中5] == nil  then
			tp.提示:写入("#Y/请选择正确的目标!")
			return
		end
		名称1=tp.窗口.帮派查看.帮众数据[tp.窗口.帮派查看.选中5].id
		tp.窗口.帮派查看.选中5 = 0
		客户端:发送数据(1502,{事件,地图1,名称,名称1},1)
	elseif 事件 == "法系神兽" or 事件 == "物理神兽" then
		local 物法
		if 事件 == "法系神兽" then
			物法 = "-法系"
		else
			物法 = ""
		end

		发送数据(115.5,{模型=tp.窗口.商城类.数据[tp.窗口.商城类.分类][tp.窗口.商城类.选中编号3].模型,物法=物法})
	elseif 事件 == "购买法系神兽" or 事件 == "购买物理神兽" then
		if 事件 == "购买法系神兽" then
			物法 = "-法系"
		else
			物法 = nil
		end
		tp.窗口.商城类.仙玉 = tp.窗口.商城类.仙玉 - tp.窗口.商城类.物品数据[tp.窗口.商城类.分类][tp.窗口.商城类.商品编号].价格
		self.发送信息 = {
			编号 = tp.窗口.商城类.商品编号,--self.物品数据[self.分类][self.商品编号].编号,
			位置 = tp.窗口.商城类.商品编号,
			数量 = tp.窗口.商城类.数量,
			组号 = tp.窗口.商城类.组号,
			分类 = tp.窗口.商城类.分类,
			物法 = 物法
		}
		发送数据(30,self.发送信息)
	elseif 事件=="培养十次" or 事件=="培养一次" or 事件=="培养五十次" then
		local 培养目标 = tp.窗口.助战界面.选中
		if tp.助战列表[培养目标] == nil then
			tp.提示:写入("#Y/请选择正确的目标!")
			return
		end
		local 次数 = 1
		if 事件=="培养十次" then
			次数 = 10
		elseif 事件=="培养五十次" then
			次数 = 50
		end
		发送数据(85,{编号=培养目标,次数=次数})
	elseif 事件=="退出助战门派" then
		local 培养目标 = tp.窗口.助战界面.选中
		if tp.助战列表[培养目标] == nil then
			tp.提示:写入("#Y/请选择正确的目标!")
			return
		end
		发送数据(83,{编号=培养目标})
	elseif 事件 == "确定遗弃" then
		local 培养目标 = tp.窗口.助战界面.选中
		if tp.助战列表[培养目标] == nil then
			tp.提示:写入("#Y/请选择正确的目标!")
			return
		end
		发送数据(84,{编号=培养目标})
	elseif 事件 == "方寸山(助战)" or 事件 == "女儿村(助战)" or 事件 == "神木林(助战)" or 事件 == "化生寺(助战)" or 事件 == "大唐官府(助战)" or 事件 == "盘丝洞(助战)" or 事件 == "阴曹地府(助战)" or 事件 == "无底洞(助战)" or 事件 == "魔王寨(助战)" or 事件 == "狮驼岭(助战)" or 事件 == "天宫(助战)" or 事件 == "普陀山(助战)" or 事件 == "凌波城(助战)" or 事件 == "五庄观(助战)" or 事件 == "龙宫(助战)" then
		local 培养目标 = tp.窗口.助战界面.选中
		if tp.助战列表[培养目标] == nil then
			tp.提示:写入("#Y/请选择正确的目标!")
			return
		end
		发送数据(82,{编号=培养目标,门派=事件})
	elseif self.文本内容 == "请选择你要统御的召唤兽。" then
		if tp.窗口.坐骑属性栏.选中 == 0 then
			tp.提示:写入("#Y/请选择一个坐骑！")
			return
		elseif tp.窗口.坐骑属性栏.可统御信息 == nil or  #tp.窗口.坐骑属性栏.可统御信息 <= 0 then
			tp.提示:写入("#Y/你没有可以统御的额召唤兽！")
			return
		else
		    for i=1,#tp.窗口.坐骑属性栏.对话信息 do
		    	if 事件 ~= "算了算了" and 事件 == tp.窗口.坐骑属性栏.对话信息[i] and 编号 == i then
		    		发送数据(90,{序列=tp.窗口.坐骑属性栏.选中,召唤兽编号=i})
		    		break
		    	end
		    end
		end
	elseif 事件=="驯养十次" or 事件=="驯养一次" or 事件=="驯养五十次" then
		local 驯养目标 = tp.窗口.坐骑属性栏.选中
		if tp.坐骑列表[驯养目标] == nil then
			tp.提示:写入("#Y/请选择正确的目标!")
			return
		end
		local 次数 = 1
		if 事件=="驯养十次" then
			次数 = 10
		elseif 事件=="驯养五十次" then
			次数 = 50
		end
		发送数据(92,{编号=驯养目标,次数=次数})
		elseif 事件=="提升1次坐骑速度" or 事件=="提升10次坐骑速度" or 事件=="提升50次坐骑速度" then
		local 驯养目标 = tp.窗口.坐骑属性栏.选中
		if tp.坐骑列表[驯养目标] == nil then
			tp.提示:写入("#Y/请选择正确的目标!")
			return
		end
		local 次数 = 1
		if  事件=="提升10次坐骑速度" then
		    次数 = 10
		end
		if  事件=="提升50次坐骑速度" then
		    次数 = 50
		end
		发送数据(92.1,{编号=驯养目标,次数=次数})
	elseif 事件=="坐骑洗点" then
		local 驯养目标 = tp.窗口.坐骑属性栏.选中
		if tp.坐骑列表[驯养目标] == nil then
			tp.提示:写入("#Y/请选择正确的目标!")
			return
		end
		发送数据(94,{编号=驯养目标})
	elseif 事件=="坐骑放生" then
		local 驯养目标 = tp.窗口.坐骑属性栏.选中
		if tp.坐骑列表[驯养目标] == nil then
			tp.提示:写入("#Y/请选择正确的目标!")
			return
		end
		发送数据(95,{编号=驯养目标})
	elseif 事件=="坐骑喂养" then
		local 驯养目标 = tp.窗口.坐骑属性栏.选中
		if tp.坐骑列表[驯养目标] == nil then
			tp.提示:写入("#Y/请选择正确的目标!")
			return
		end
		发送数据(97,{编号=驯养目标})	-- elseif 事件 == "什么是化境" then
	-- 	self.关闭事件 = true
	-- 	self:文本("吴刚","吴刚","万物变化，虚而不屈，相生相克，无穷无尽，欲强者先弱，欲扬者先抑，欲刚者先柔，欲取者先与，欲升者先降，欲张者先合。入与化境之后会变的暂时弱些，但是不久你就可以达到更强的境界。")
	-- 	self:下一页()
	-- elseif 事件 == "我想入化境，请指点一二。" then
	-- 	self.关闭事件 = true
	-- 	if tp.队伍[1].等级 >= 135 then
	-- 		if tp.剧情开关.飞升 == false then
	-- 			self:文本("吴刚","吴刚","如果你准备好了，可以去找法明长老来指导你如何进入化境！等你通过了所有修炼再来找，我会带你入与化境。")
	-- 			tp.剧情开关.飞升 = {1}
	-- 			tp.窗口.任务栏:添加("飞升剧情","#R/法明长老#L/将会指引你如何进入化境。")
	-- 		else
	-- 			tp.提示:写入("#Y/你已经领取了飞升任务")
	-- 		end
	-- 	else
	-- 		self:文本("吴刚","吴刚","少侠你目前你的修为还不够，还需要多多历练才是。（需等级>=135）")
	-- 	end
	-- 	self:下一页()
	-- elseif 事件 == "入化境后有什么变化？" then
	-- 	self.关闭事件 = true
	-- 	self:文本("吴刚","吴刚","进入化境后将会等级上限会提高至155级，同时修炼等级上限也会从20级提高25级。")
	-- elseif 事件 == "飞升剧情" then
	-- 	self.关闭事件 = true
	-- 	if tp.剧情开关.飞升[1] == 1 then
	-- 		self:文本("空度禅师","法明长老","你现在已经是绝顶高手，但是如此求得称雄三界，却也水中捞月，我这有易筋经洗髓，脱胎换骨之门，学成之后，可入化境，天下无敌，不知道你愿意学不？",{"我愿意","我还要在想想"},"飞升开关")
	-- 	elseif tp.剧情开关.飞升[1] == 2 then
	-- 		if tp.剧情开关.飞升[2] == nil then
	-- 			local a = tp:取药品(2)
	-- 			local b = tp:取药品(3)
	-- 			a = a[random(1,#a)]
	-- 			b = b[random(1,#b)]
	-- 			tp.剧情开关.飞升[2] = {a,b}
	-- 			增加物品(a)
	-- 			增加物品(b)
	-- 			self:文本("男人_太上老君","太上老君",format("欲入化境，必先明道。为道者将强先弱，欲扬先抑。入于化境之后会变的暂时弱些，但是不久你就可以达到更强的境界，携带更加厉害的召唤兽，拥有更有威力的法术和更强的修炼。既然我传授给你这些道理，你也应该为我道门做些事情。我这几日要炼仙丹，需要%s和%s做药引，你去取些来。",a,b))
	-- 			tp.窗口.任务栏:修改内容("飞升剧情",format("为了多打听关于化境的事，帮太上老君找来%s来做药引",a))
	-- 		else
	-- 			self:文本("男人_太上老君","太上老君","找到药引了吗",{"找到了","还没有"},"飞升开关")
	-- 		end
	-- 	elseif tp.剧情开关.飞升[1] == 4 then
	-- 		if tp.剧情开关.飞升[2][1] == 4 then
	-- 			tp:增加经验(500000,nil,true)
	-- 			tp.剧情开关.飞升[1] = 5
	-- 			tp.剧情开关.飞升[2] = nil
	-- 			tp.窗口.任务栏:修改内容("飞升剧情","去找李世民谈谈。")
	-- 			self:文本("男人_玉帝","玉皇大帝","要你找的这四样宝贝暗含四象之妙，可以激发你的潜力，如果再加上地藏王的不死壤，那么五行妙法就已齐备。可惜自从大禹治水后，就再也没有人见过不死壤了。天庭已经没有什么好教你的了，你再去人界修炼妙法吧。")
	-- 			物品失去("定海针")
	-- 			物品失去("避火诀")
	-- 			物品失去("修篁斧")
	-- 			物品失去("炼金鼎")
	-- 		else
	-- 			self:文本("男人_玉帝","玉皇大帝",format("把这四样东西给我找来：\n#Y/东海龙王的定海针%s；\n#Y/李靖的避火诀%s；\n#Y/镇元大仙的炼金鼎%s；\n#Y/观音姐姐的修篁斧%s",开关取内容("(完成)","",取数组内容(tp.剧情开关.飞升[2][2],"定海针")),开关取内容("(完成)","",取数组内容(tp.剧情开关.飞升[2][2],"避火诀")),开关取内容("(完成)","",取数组内容(tp.剧情开关.飞升[2][2],"炼金鼎")),开关取内容("(完成)","",取数组内容(tp.剧情开关.飞升[2][2],"修篁斧"))))
	-- 		end
	-- 	elseif tp.剧情开关.飞升[1] == 5 then
	-- 		-- print(1)
	-- 	end
	-- 	self:下一页()
	-- elseif self.放载事件 == "飞升开关" then
	-- 	self.关闭事件 = true
	-- 	if 事件 == "我愿意" then
	-- 		self:文本("空度禅师","法明长老","很好，你现在去天界找太上老君，他会告诉你一个如何入与化境的方法。")
	-- 		tp.剧情开关.飞升[1] = 2
	-- 		tp.窗口.任务栏:修改内容("飞升剧情","去#R/太上老君#L/那了解入化境的方法。")
	-- 	elseif 事件 == "找到了" then
	-- 		local xq = nil
	-- 		local id = nil
	-- 		if tp.剧情开关.飞升[2][1] ~= nil then
	-- 			if 物品判断(tp.剧情开关.飞升[2][1],1) then
	-- 				物品失去(tp.剧情开关.飞升[2][1],1)
	-- 				xq = tp.剧情开关.飞升[2][1]
	-- 				id = 2
	-- 				tp.剧情开关.飞升[2][1] = nil
	-- 			end
	-- 		elseif tp.剧情开关.飞升[2][2] ~= nil then
	-- 			if 物品判断(tp.剧情开关.飞升[2][2],1) then
	-- 				物品失去(tp.剧情开关.飞升[2][2],1)
	-- 				xq = tp.剧情开关.飞升[2][2]
	-- 				id = 1
	-- 				tp.剧情开关.飞升[2][2] = nil
	-- 			end
	-- 		end
	-- 		if xq ~= nil then
	-- 			if tp.剧情开关.飞升[2][1] == nil and tp.剧情开关.飞升[2][2] == nil then
	-- 				self:文本("男人_太上老君","太上老君","嗯，你做的很好。看来你的确潜心向道，我要向玉皇大帝引见你，让你获得进行仙界试炼的资格。")
	-- 				tp.剧情开关.飞升 = {3}
	-- 				tp.窗口.任务栏:修改内容("飞升剧情","去玉皇大帝那获得仙界的试炼资格")
	-- 				tp.提示:写入("#Y/你得到了20000经验")
	-- 				tp:增加经验(20000)
	-- 			else
	-- 				self:文本("男人_太上老君","太上老君",format("不错不错，帮我找到了一个%s当药引，另一个呢？",xq))
	-- 				tp.窗口.任务栏:修改内容("飞升剧情",format("为了多打听关于化境的事，帮太上老君找来%s来做药引",tp.剧情开关.飞升[2][id]))
	-- 			end
	-- 		else
	-- 			self:文本("男人_太上老君","太上老君","你身上没有我要的东西。")
	-- 		end
	-- 	elseif 事件 == "我可以" then
	-- 		self:文本("男人_玉帝","玉皇大帝","把这4样东西给我找来：\n#Y/东海龙王的定海针；\n#Y/李靖的避火诀；\n#Y/观音的修篁斧；\n#Y/镇元大仙的炼金鼎。")
	-- 		tp.剧情开关.飞升[1] = 4
	-- 		tp.剧情开关.飞升[2] = {0,{},{}}
	-- 		tp.窗口.任务栏:修改内容("飞升剧情",format("去向#R/东海龙王#L/要定海针%s；\n#L/◆去向#R/李靖#L/要一本避火诀%s；\n#L/◆去向#R/镇元大仙#L/借下炼金鼎%s；\n#L/◆去向#R/观音姐姐#L/借吧修篁斧%s",开关取内容("(完成)","",取数组内容(tp.剧情开关.飞升[2][2],"定海针")),开关取内容("(完成)","",取数组内容(tp.剧情开关.飞升[2][2],"避火诀")),开关取内容("(完成)","",取数组内容(tp.剧情开关.飞升[2][2],"炼金鼎")),开关取内容("(完成)","",取数组内容(tp.剧情开关.飞升[2][2],"修篁斧"))))
	-- 	end
	-- 	self:下一页()
	else
		客户端:发送数据(1502,{事件,地图1,名称,名称1},1)
	end
	self.可视 = false
	self.文本栏焦点 = false
end

function 场景类_对话栏:事件解析1(事件,地图1,名称,名称1)
	-- print("对话栏事件解析",事件,地图1,名称,名称1)
	local 当前地图 = tp.当前地图
	if 事件 == "不了不了" or 事件 == "算了算了" or 事件 == "太贵了我没钱" or 事件 == "我随便逛逛 不好意思" or 事件 == "我只是来看看" or 事件 == "我只是看看" or 事件 == "只是路过" or 事件 == "我只是路过" or 事件 == "我只是随便看看" or 事件 == "我还要逛逛" or 事件 == "我点错了" or 事件 == "我什么也不想做" or 事件 == "我保留意见" or 事件 == "我什么都不想做" or 事件 == "没什么，我只是看看" then
		self.可视 = false
		self.文本栏焦点 = false
	elseif 事件 == "我要更换当前的宠物" and 地图1 == 1501 and 名称 == "宠物仙子" then
		tp.窗口.宠物领养栏:打开()
		self.可视 = false
		self.文本栏焦点 = false
	elseif 事件 == "购买" and 地图1 == 1501 and 名称 == "飞儿" then
		tp.窗口.商店:打开({"包子"})
		self.可视 = false
	elseif 事件 == "快些治疗我吧" and 地图1 == 1501 and 名称 == "陈长寿" then
		self.关闭事件 = true
		if tp.队伍[1].等级 <= 10 then
			for n=1,#tp.队伍 do
				tp.队伍[n].气血 = tp.队伍[n].最大气血
				tp.队伍[n].魔法 = tp.队伍[n].最大魔法
				if tp.队伍[n].参战宝宝.名称 ~= nil then
					tp.队伍[n].参战宝宝.气血 = tp.队伍[n].参战宝宝.最大气血
					tp.队伍[n].参战宝宝.魔法 = tp.队伍[n].参战宝宝.最大魔法
				end
			end
			local wb = "你已经恢复健康了"
			self:文本("男人_药店老板","陈长寿",wb)
			self:下一页()
		else
		    local wb = "少侠你已经不需要我的帮助了"
			self:文本("男人_药店老板","陈长寿",wb)
			self:下一页()
		end
	elseif 事件 == "出售" and (地图1 == 1501 or 地图1 == 1001) and 名称 == "装备收购商" then
		self.可视 = false
		tp.窗口.出售:打开(0.6,{2})
	elseif 事件 == "我要做其他事情" and 地图1 == 1501 and 名称 == "牛大胆" then
		self.关闭事件 = true
		tp:对话事件(1501,13,1)
		self:下一页()
	elseif 地图1 == 1506 and 事件 == "是的我要去" and 名称 == "船夫" then
		self.关闭事件 = true
		if tp.队伍[1].等级 >= 10 then
			tp.场景:传送至(1092,165,132)
			self.可视 = false
		else
			self:文本("男人_驿站老板","船夫","等级不够，不敢给你传送")
			self:下一页()
		end
	elseif 地图1 == 1092 and 事件 == "是的我要去" and 名称 == "船夫" then
		self.关闭事件 = true
		tp.场景:传送至(1506,70,93)
		self.可视 = false
	elseif 事件 == "我卖大海龟（250两银子/只或者300两储备金/只）给你" and 地图1 == 1501 and 名称 == self.名称 then
		self.关闭事件 = true
		wb = "请选择你要出售的方式#R（会将所有未参战状态下的大海龟全部出售！）"
		local xx = {"250两银子卖给你","300两储备银子卖给你"}
		self:文本("男人_钓鱼","海产收购商",wb,xx)
		self:下一页()
	elseif 事件 == "我卖巨蛙（350两银子/只或者400两储备金/只）给你" and 地图1 == 1501 and 名称 == self.名称 then
		self.关闭事件 = true
		wb = "请选择你要出售的方式#R（会将所有未参战状态下的巨蛙全部出售！）"
		local xx = {"350两银子卖给你","400两储备银子卖给你"}
		self:文本("男人_钓鱼","海产收购商",wb,xx)
		self:下一页()
	elseif 事件 == "我卖海毛虫（500两银子/只或者600两储备金/只）给你" and 地图1 == 1501 and 名称 == self.名称 then
		self.关闭事件 = true
		wb = "请选择你要出售的方式#R（会将所有未参战状态下的海毛虫全部出售！）"
		local xx = {"500两银子卖给你","600两储备银子卖给你"}
		self:文本("男人_钓鱼","海产收购商",wb,xx)
		self:下一页()
	elseif 事件 == "250两银子卖给你" and 地图1 == 1501 and 名称 == self.名称 then
		self.关闭事件 = true
		local zhs = 0
		for n=1,#tp.队伍[1].宝宝列表 do
			if tp.队伍[1].宝宝列表[n] ~= nil and tp.队伍[1].宝宝列表[n] ~= tp.队伍[1].参战宝宝 and tp.队伍[1].宝宝列表[n].模型 == "大海龟" then
				zhs = zhs + 1
				remove(tp.队伍[1].宝宝列表,n)
			end
			for i=1,#tp.队伍[1].宝宝列表 do
					if tp.队伍[1].宝宝列表[i] ~= nil and tp.队伍[1].宝宝列表[i] ~= tp.队伍[1].参战宝宝 and tp.队伍[1].宝宝列表[i].模型 == "大海龟" then
					zhs = zhs + 1
					remove(tp.队伍[1].宝宝列表,i)
				end
			end
		end
		if zhs == 0 then
			wb = "你身上没有我要的召唤兽"
			self:文本("男人_钓鱼","海产收购商",wb,xx)
			self:下一页()
		else
			local cb = (250 * zhs)
			tp.金钱 = tonumber(tp.金钱) + cb
			wb = "你成功出售了#Y/"..zhs.."只#W/大海龟给我共赚取了#R"..cb.."两银子"
			self:文本("男人_钓鱼","海产收购商",wb,xx)
			self:下一页()
			tp.窗口.召唤兽属性栏:刷新()
		end
	elseif 事件 == "300两储备银子卖给你" and 地图1 == 1501 and 名称 == self.名称 then
		self.关闭事件 = true
		local zhs = 0
		for n=1,#tp.队伍[1].宝宝列表 do
			if tp.队伍[1].宝宝列表[n] ~= nil and tp.队伍[1].宝宝列表[n] ~= tp.队伍[1].参战宝宝 and tp.队伍[1].宝宝列表[n].模型 == "大海龟" then
				zhs = zhs + 1
				remove(tp.队伍[1].宝宝列表,n)
			end
			for i=1,#tp.队伍[1].宝宝列表 do
					if tp.队伍[1].宝宝列表[i] ~= nil and tp.队伍[1].宝宝列表[i] ~= tp.队伍[1].参战宝宝 and tp.队伍[1].宝宝列表[i].模型 == "大海龟" then
					zhs = zhs + 1
					remove(tp.队伍[1].宝宝列表,i)
				end
			end
		end
		if zhs == 0 then
			wb = "你身上没有我要的召唤兽"
			self:文本("男人_钓鱼","海产收购商",wb,xx)
			self:下一页()
		else
			local cb = (300 * zhs)
			tp.储备 = tonumber(tp.储备) + cb
			wb = "你成功出售了#Y/"..zhs.."只#W/大海龟给我共赚取了#R"..cb.."两储备银子"
			self:文本("男人_钓鱼","海产收购商",wb,xx)
			self:下一页()
			tp.窗口.召唤兽属性栏:刷新()
		end
	elseif 事件 == "350两银子卖给你" and 地图1 == 1501 and 名称 == self.名称 then
		self.关闭事件 = true
		local zhs = 0
		for n=1,#tp.队伍[1].宝宝列表 do
			if tp.队伍[1].宝宝列表[n] ~= nil and tp.队伍[1].宝宝列表[n] ~= tp.队伍[1].参战宝宝 and tp.队伍[1].宝宝列表[n].模型 == "巨蛙" then
				zhs = zhs + 1
				remove(tp.队伍[1].宝宝列表,n)
			end
			for i=1,#tp.队伍[1].宝宝列表 do
					if tp.队伍[1].宝宝列表[i] ~= nil and tp.队伍[1].宝宝列表[i] ~= tp.队伍[1].参战宝宝 and tp.队伍[1].宝宝列表[i].模型 == "巨蛙" then
					zhs = zhs + 1
					remove(tp.队伍[1].宝宝列表,i)
				end
			end
		end
		if zhs == 0 then
			wb = "你身上没有我要的召唤兽"
			self:文本("男人_钓鱼","海产收购商",wb,xx)
			self:下一页()
		else
			local cb = (350 * zhs)
			tp.金钱 = tonumber(tp.金钱) + cb
			wb = "你成功出售了#Y/"..zhs.."只#W/巨蛙给我共赚取了#R"..cb.."两银子"
			self:文本("男人_钓鱼","海产收购商",wb,xx)
			self:下一页()
			tp.窗口.召唤兽属性栏:刷新()
		end
	elseif 事件 == "400两储备银子卖给你" and 地图1 == 1501 and 名称 == self.名称 then
		self.关闭事件 = true
		local zhs = 0
		for n=1,#tp.队伍[1].宝宝列表 do
			if tp.队伍[1].宝宝列表[n] ~= nil and tp.队伍[1].宝宝列表[n] ~= tp.队伍[1].参战宝宝 and tp.队伍[1].宝宝列表[n].模型 == "巨蛙" then
				zhs = zhs + 1
				remove(tp.队伍[1].宝宝列表,n)
			end
			for i=1,#tp.队伍[1].宝宝列表 do
					if tp.队伍[1].宝宝列表[i] ~= nil and tp.队伍[1].宝宝列表[i] ~= tp.队伍[1].参战宝宝 and tp.队伍[1].宝宝列表[i].模型 == "巨蛙" then
					zhs = zhs + 1
					remove(tp.队伍[1].宝宝列表,i)
				end
			end
		end
		if zhs == 0 then
			wb = "你身上没有我要的召唤兽"
			self:文本("男人_钓鱼","海产收购商",wb,xx)
			self:下一页()
		else
			local cb = (400 * zhs)
			tp.储备 = tp.储备 + cb
			wb = "你成功出售了#Y/"..zhs.."只#W/巨蛙给我共赚取了#R"..cb.."两储备银子"
			self:文本("男人_钓鱼","海产收购商",wb,xx)
			self:下一页()
			tp.窗口.召唤兽属性栏:刷新()
		end
	elseif 事件 == "500两银子卖给你" and 地图1 == 1501 and 名称 == self.名称 then
		self.关闭事件 = true
		local zhs = 0
		for n=1,#tp.队伍[1].宝宝列表 do
			if tp.队伍[1].宝宝列表[n] ~= nil and tp.队伍[1].宝宝列表[n] ~= tp.队伍[1].参战宝宝 and tp.队伍[1].宝宝列表[n].模型 == "海毛虫" then
				zhs = zhs + 1
				remove(tp.队伍[1].宝宝列表,n)
			end
			for i=1,#tp.队伍[1].宝宝列表 do
					if tp.队伍[1].宝宝列表[i] ~= nil and tp.队伍[1].宝宝列表[i] ~= tp.队伍[1].参战宝宝 and tp.队伍[1].宝宝列表[i].模型 == "海毛虫" then
					zhs = zhs + 1
					remove(tp.队伍[1].宝宝列表,i)
				end
			end
		end
		tp.窗口.召唤兽属性栏:刷新()
		if zhs == 0 then
			wb = "你身上没有我要的召唤兽"
			self:文本("男人_钓鱼","海产收购商",wb,xx)
			self:下一页()
		else
			local cb = (500 * zhs)
			tp.金钱 = tonumber(tp.金钱) + cb
			wb = "你成功出售了#Y/"..zhs.."只#W/海毛虫给我共赚取了#R"..cb.."两银子"
			self:文本("男人_钓鱼","海产收购商",wb,xx)
			self:下一页()
		end
	elseif 事件 == "600两储备银子卖给你" and 地图1 == 1501 and 名称 == self.名称 then
		self.关闭事件 = true
		local zhs = 0
		for n=1,#tp.队伍[1].宝宝列表 do
			if tp.队伍[1].宝宝列表[n] ~= nil and tp.队伍[1].宝宝列表[n] ~= tp.队伍[1].参战宝宝 and tp.队伍[1].宝宝列表[n].模型 == "海毛虫" then
				zhs = zhs + 1
				remove(tp.队伍[1].宝宝列表,n)
			end
			for i=1,#tp.队伍[1].宝宝列表 do
					if tp.队伍[1].宝宝列表[i] ~= nil and tp.队伍[1].宝宝列表[i] ~= tp.队伍[1].参战宝宝 and tp.队伍[1].宝宝列表[i].模型 == "海毛虫" then
					zhs = zhs + 1
					remove(tp.队伍[1].宝宝列表,i)
				end
			end
		end
		tp.窗口.召唤兽属性栏:刷新()
		if zhs == 0 then
			wb = "你身上没有我要的召唤兽"
			self:文本("男人_钓鱼","海产收购商",wb,xx)
			self:下一页()
		else
			local cb = (600 * zhs)
			tp.金钱 = tonumber(tp.金钱) + cb
			wb = "你成功出售了#Y/"..zhs.."只#W/海毛虫给我共赚取了#R"..cb.."两储备银子"
			self:文本("男人_钓鱼","海产收购商",wb,xx)
			self:下一页()
		end
	elseif 事件 == "我完成任务回来领取奖励" and 地图1 == 1501 and 名称 == "赵铺头" then
		self.关闭事件 = true
		local a = 物品判断("心魔宝珠",20,true)
		if a then
			if tonumber(tp.队伍[1].等级) < 15 then
				local jy = ceil(tonumber(tp.队伍[1].最大经验) / 12)
				local jq = ceil(tonumber(tp.队伍[1].等级) * 300)
				for n=1,#tp.队伍 do
					tp.队伍[n].当前经验 = tonumber(tp.队伍[n].当前经验) + jy
					if tp.队伍[n].参战宝宝.名称 ~= nil then
						tp.队伍[n].参战宝宝.当前经验 = tonumber(tp.队伍[n].参战宝宝.当前经验) + jy
					end
				end
				local cb = floor((jq + jq*0.2))
				tp.提示:写入(format("#Y/你获得了经验%d，金钱%d，储备%d",jy,jq, cb))
				tp.金钱 = tonumber(tp.金钱) + jq
				tp.储备 = tp.储备 + cb
				self:文本("男人_衙役","赵铺头","这些经验和钱就当作你的奖励了。",xx)
			else
				self:文本("男人_衙役","赵铺头","你的能力不应该界限于此",xx)
			end
		else
			self:文本("男人_衙役","赵铺头","你身上没有我要的东西。",xx)
		end
		self:下一页()
	elseif 事件 == "我要招募队员" and 地图1 == 1537 and 名称 == "贸易车队总管" then
		self.关闭事件 = true
		wb = " 请选择你要招募的队员吧，一个队员的招募价格是5000两银子（#R/新的三个角色目前暂时不能招募#W/）"
		local xx = {"飞燕女","英女侠","巫蛮儿","逍遥生","剑侠客","狐美人","骨精灵","杀破狼","巨魔王","虎头怪","舞天姬","玄彩娥","羽灵神","神天兵","龙太子","偃无师","鬼潇潇","桃夭夭"}
		self:文本("男人_老财","贸易车队总管",wb,xx)
		self:下一页()
	elseif 事件 == "我有物品需要典当" and 地图1 == 1523 and 名称 == "当铺老板" then
		self.可视 = false
		tp.窗口.出售:打开(0.3)
	elseif 事件 == "查看心魔宝珠获得场景" and 地图1 == 1501 and 名称 == "赵铺头" then
		self.关闭事件 = true
		wb = " 5级（含5级）#Y/东海湾#W/获得 \n 5级以上10级（含10级）#Y/东海岩洞#W/获得 \n 10级以上15级以下（含15级）#Y/东海海底#W/、#Y/沉船#W/获得 \n 15级以上20级以下（含20级）#Y/江南野外#W/"
		self:文本("男人_衙役","赵铺头",wb,xx)
		self:下一页()
	elseif 事件 == "购买" and 地图1 == 1505 and 名称 == self.名称 then
		tp.窗口.商店:打开({"摄妖香","洞冥草"})
		self.可视 = false
	elseif 事件 == "购买" and 地图1 == 1502 and 名称 == "武器店掌柜" then
		tp.窗口.商店:打开({"折扇","红缨枪","牛皮鞭","曲柳杖","铁爪","松木锤","琉璃珠","双短剑","青铜短剑","柳叶刀","青铜斧","五色缎带","黄铜圈","硬木弓","细木棒","钝铁重剑","素纸灯","油纸伞"})
		self.可视 = false
	elseif 事件 == "购买" and 地图1 == 1502 and 名称 == "武器店老板" then
		tp.窗口.商店:打开({"铁骨扇","曲尖枪","牛筋鞭","红木杖","天狼爪","镔铁锤","水晶珠","镔铁双剑","铁齿剑","苗刀","开山斧","幻彩银纱","精钢日月圈","铁胆弓","金丝魔棒","桃印铁刃","竹骨灯","红罗伞"})
		self.可视 = false
	elseif 事件 == "购买" and 地图1 == 1503 and 名称 == "服装店老板" then
		tp.窗口.商店:打开({"方巾","簪子","布衣","布裙","布鞋","护身符","腰带","布帽","玉钗","皮衣","丝绸长裙","牛皮靴","五色飞石","缎带"})
		self.可视 = false
	elseif 事件 == "购买" and 地图1 == 1504 and 名称 == "药店老板" then
		tp.窗口.商店:打开({"四叶花","紫丹罗","血色茶花","熊胆","丁香水","麝香","金创药","佛光舍利子"})
		self.可视 = false
	elseif 事件 == "请帮我治疗" and 地图1 == 1506 and 名称 == "云游神医" then
		self.关闭事件 = true
		if tp.队伍[1].等级 <= 10 then
			for n=1,#tp.队伍 do
				tp.队伍[n].气血 = tp.队伍[n].最大气血
				tp.队伍[n].魔法 = tp.队伍[n].最大魔法
			end
			local wb = "你已经恢复健康了"
			self:文本("男人_村长","云游神医",wb)
			self:下一页()
		else
		    local wb = "少侠你已经不需要我的帮助了"
			self:文本("男人_村长","云游神医",wb)
			self:下一页()
		end
	elseif 事件 == "我的召唤兽受伤了，请帮我救治一下吧" and (地图1 == 1506 or 地图1 == 1501) and 名称 == "超级巫医" then
		self.关闭事件 = true
		if tp.队伍[1].参战宝宝.名称 ~= nil then
			local qx = tp.队伍[1].参战宝宝.最大气血 - tp.队伍[1].参战宝宝.气血
			local jq = math.ceil(qx * 2 + (qx*1.3))
			if tp.金钱 >= jq then
				tp.队伍[1].参战宝宝.气血 = tonumber(tp.队伍[1].参战宝宝.气血) + qx
				if tp.队伍[1].参战宝宝.气血 > tonumber(tp.队伍[1].参战宝宝.最大气血) then
					tp.队伍[1].参战宝宝.气血 = tonumber(tp.队伍[1].参战宝宝.最大气血)
				end
				tp.金钱 = tp.金钱 - jq
				local wb = "治疗好了，你的召唤兽已经恢复健康了，共收取了"..jq.."两银子"
				self:文本("男人_巫医","超级巫医",wb)
				self:下一页()
			else
			    local wb = "钱不够呢。"
				self:文本("男人_巫医","超级巫医",wb)
				self:下一页()
			end
		else
			local wb = "请将要治疗的召唤兽设置为参战状态吧。"
			self:文本("男人_巫医","超级巫医",wb)
			self:下一页()
		end
	elseif 事件 == "我的召唤兽忠诚度降低了，请帮我驯养一下吧" and (地图1 == 1506 or 地图1 == 1501) and 名称 == "超级巫医" then
		self.关闭事件 = true
		if tp.队伍[1].参战宝宝.名称 ~= nil then
			local qx = 100 - tp.队伍[1].参战宝宝.忠诚
			local jq = ceil(qx * 100 + (qx*1.3))
			if tp.金钱 >= jq then
				tp.队伍[1].参战宝宝.忠诚 = tp.队伍[1].参战宝宝.忠诚 + qx
				if tp.队伍[1].参战宝宝.忠诚 > 100 then
					tp.队伍[1].参战宝宝.忠诚 = 100
				end
				tp.金钱 = tonumber(tp.金钱) - jq
				local wb = "你的召唤兽已经驯养好了，共收取了"..jq.."两银子"
				self:文本("男人_巫医","超级巫医",wb)
				self:下一页()
			else
			    local wb = "钱不够呢。"
				self:文本("男人_巫医","超级巫医",wb)
				self:下一页()
			end
		else
			local wb = "请将要驯养的召唤兽设置为参战状态吧。"
			self:文本("男人_巫医","超级巫医",wb)
			self:下一页()
		end
	elseif 事件 == "我要同时补满全队召唤兽的气血、魔法和忠诚值" and 名称 == "超级巫医" then
		for i=1,#tp.队伍 do
			if tp.队伍[i].参战宝宝.名称 ~= nil then
				local qx = tonumber(tp.队伍[i].参战宝宝.最大气血) - tonumber(tp.队伍[i].参战宝宝.气血)
				local mf = tonumber(tp.队伍[i].参战宝宝.最大魔法) - tonumber(tp.队伍[i].参战宝宝.魔法)
				local zc = 100 - tp.队伍[1].参战宝宝.忠诚
				local jq = math.ceil((qx * 1.8 + (qx*1.2)) + (mf * 1.3 + (mf*1.0)) + (zc * 50 + (zc*1.2)))
				if tp.金钱 >= jq then
					tp.队伍[i].参战宝宝.气血 = tonumber(tp.队伍[i].参战宝宝.气血) + qx
					if tp.队伍[i].参战宝宝.气血 > tonumber(tp.队伍[i].参战宝宝.最大气血) then
						tp.队伍[i].参战宝宝.气血 = tonumber(tp.队伍[i].参战宝宝.最大气血)
					end
					tp.队伍[i].参战宝宝.魔法 = tonumber(tp.队伍[i].参战宝宝.魔法) + mf
					if tp.队伍[i].参战宝宝.魔法 > tonumber(tp.队伍[i].参战宝宝.最大魔法) then
						tp.队伍[i].参战宝宝.魔法 = tonumber(tp.队伍[i].参战宝宝.最大魔法)
					end
					tp.队伍[i].参战宝宝.忠诚 = tp.队伍[i].参战宝宝.忠诚 + zc
					if tp.队伍[i].参战宝宝.忠诚 > 100 then
						tp.队伍[i].参战宝宝.忠诚 = 100
					end
					tp.金钱 = tp.金钱 - jq
					tp.提示:写入("#Y/召唤兽已经恢复了健康并驯养好了，共收取了"..jq.."两银子")
				end
			end
		end
	elseif 事件 == "是的，我想进去探个究竟" and 地图1 == 1506 and 名称 == "捕鱼人" then
		if tonumber(tp.队伍[1].等级) >= 5 then
			tp.场景:传送至(1126,12,77)
		else
		    self:文本("男人_钓鱼","捕鱼人","你的修为也太低了吧，里面的怪物可是很可怕的。")
		end
		self.可视 = false
	elseif 事件 == "是的我要去" and 地图1 == 1506 and 名称 == "老虾" then
		self.可视 = false
		tp.场景:传送至(1116,17,107)
	elseif 事件 == "是的" and 地图1 == 1507 and 名称 == "螃蟹精" then
		self.可视 = false
		tp.场景:传送至(1501,265,113)
	elseif 事件 == "是的" and 地图1 == 1508 and 名称 == "虾精" then
		self.可视 = false
		tp.场景:传送至(1501,265,113)
		self.关闭事件 = true
		self:下一页()
	elseif 事件 == "传送江南野外" and 地图1 == 1501 and 名称 == "建邺守卫" then
		if tp.队伍[1].等级 >= 10 then
			self.关闭事件 = true
			tp.场景:传送至(1193,149,65)
			self.可视 = false
		else
			self.关闭事件 = true
		    self:文本("男人_衙役","建邺守卫","等级不足，不敢为你传送")
		    self:下一页()
		end
	-- 长安
	elseif 事件 == "购买" and 地图1 == 1020 and 名称 == "武器店掌柜" then
		tp.窗口.商店:打开({"精钢扇","锯齿矛","乌龙鞭","白椴杖","幽冥鬼爪","八棱金瓜","珍宝珠","龙凤双剑","吴越剑","夜魔弯刀","双面斧","金丝彩带","离情环","紫檀弓","玉如意","赭石巨剑","红灯笼","紫竹伞"})
		self.可视 = false
	elseif 事件 == "购买" and 地图1 == 1020 and 名称 == "武器店老板" then
		tp.窗口.商店:打开({"铁面扇","乌金三叉戟","钢结鞭","墨铁拐","青龙牙","狼牙锤","翡翠珠","竹节双剑","青锋剑","金背大砍刀","双弦钺","无极丝","金刺轮","宝雕长弓","点金棒","壁玉长铗","鲤鱼灯","锦绣椎"})
		self.可视 = false
	elseif 事件 == "购买" and 地图1 == 1017 and 名称 == "饰品店老板" then
		tp.窗口.商店:打开({"银腰带","珍珠链","腰带","护身符"})
		self.可视 = false
	elseif 事件 == "购买" and 地图1 == 1022 and 名称 == "服装店老板" then
		tp.窗口.商店:打开({"方巾","簪子","布衣","布裙","布鞋","面具","梅花簪子","鳞甲","五彩裙","马靴"})
		self.可视 = false
	elseif 事件 == "购买" and 地图1 == 1030 and 名称 == "酒店老板" then
		tp.窗口.商店:打开({"秘制红罗羹","秘制绿罗羹"})
		self.可视 = false
	elseif 事件 == "购买" and 地图1 == 1001 and 名称 == "罗道人" then
		tp.窗口.商店:打开({"飞行符","白色导标旗","红色导标旗","黄色导标旗","蓝色导标旗","绿色导标旗"})
		self.可视 = false
	elseif 事件 == "购买" and 地图1 == 1101 and 名称 == "杜天" then
		tp.窗口.商店:打开({"百折扇","火焰枪","蛇骨鞭","玄铁牛角杖","勾魂爪","烈焰锤","莲华珠","狼牙双剑","龙泉剑","雁翅刀","精钢禅钺","天蚕丝带","风火圈","錾金宝弓","云龙棒","青铜古剑","芙蓉花灯","幽兰帐"})
		self.可视 = false
	-- 长安
	elseif 事件 == "领取运镖任务" and 地图1 == 1024 and 名称 == "郑镖头" then
		if tp.剧情开关.押镖 == false then
			local 地图 = {1054,1043,1137,1143,1154,1124,1144,1156,1145,1134,1112,1141,1150,1147,1117}
			local 对应 = {"程咬金","空度禅师","菩提祖师","孙婆婆","巫奎虎","地藏王","白晶晶","地涌夫人","牛魔王","大大王","李靖","观音姐姐","二郎神","镇元子","东海龙王"}
			local 随机 = random(1,#地图)
			self.关闭事件 = true
			tp.剧情开关.押镖 = {地图[随机],对应[随机]}
			tp.窗口.任务栏:添加("押镖任务",format("#L/完成郑镖头的押镖任务\n#L/场景：%s\n#L/目标：%s",取地图名称(地图[随机]),对应[随机]))
			self:文本("男人_镖头","郑镖头",format("将物品送达啊#R/%s#W/处",对应[随机]))
			self:下一页()
		else
			self.关闭事件 = true
			self:文本("男人_镖头","郑镖头","你已经领取过任务了")
			self:下一页()
		end
	elseif 事件 == "我想为人物染色" and 地图1 == 1001 and 名称 == "染色师" then
		tp.窗口.染色:打开()
		self.可视 = false
	elseif 事件 == "是的我要去" and 地图1 == 1001 and 名称 == "驿站老板" then
		tp.场景:传送至(1110,63,75)
		self.可视 = false
	elseif 事件 == "是的我要为角色洗点一次" and 地图1 == 1001 and 名称 == "洗点人" then
		--[[self.关闭事件 = true
		local zb = false
		for n=1,6 do
			if tp.队伍[1].装备[n] ~= nil then
				zb = true
			end
		end
		if not zb then
			if not tp.队伍[1].洗点 then
				local sxd = tp:取初始属性(tp.队伍[1].种族)
				local lstz = 0
				local lsml = 0
				local lsll = 0
				local lsnl = 0
				local lsmj = 0
				lstz = tonumber(tp.队伍[1].体质) - sxd[1]
				lsml = tonumber(tp.队伍[1].魔力) - sxd[2]
				lsll = tonumber(tp.队伍[1].力量) - sxd[3]
				lsnl = tonumber(tp.队伍[1].耐力) - sxd[4]
				lsmj = tonumber(tp.队伍[1].敏捷) - sxd[5]
				tp.队伍[1].体质 = sxd[1]
				tp.队伍[1].魔力 = sxd[2]
				tp.队伍[1].力量 = sxd[3]
				tp.队伍[1].耐力 = sxd[4]
				tp.队伍[1].敏捷 = sxd[5]
				tp.队伍[1].潜力 = tonumber(tp.队伍[1].潜力) + (lstz + lsml + lsll + lsnl + lsmj)
				tp.队伍[1]:刷新信息("1")
				self:文本("男人_道士","洗点人","已经洗髓成功了！要想再次洗点，需要获得指定道具方能洗点")
				tp.队伍[1].洗点 = true
			else
				self:文本("男人_道士","洗点人","已经不能洗点了。")
			end
		else
			self:文本("男人_道士","洗点人","急着洗点被雷劈啊？衣服先脱下来！")
		end--]]
		self:下一页()
	-- 药店
	elseif 事件 == "购买" and 地图1 == 1016 and 名称 == "药店老板" then
		tp.窗口.商店:打开({"佛手","灵脂","曼佗罗花","白玉骨头","天青地白","金创药","佛光舍利子"})
		self.可视 = false
	-- 服饰店
	elseif 事件 == "购买" and 地图1 == 1095 then
		tp.窗口.商店:打开({"纶巾","珍珠头带","水晶腰带","侠客履","龙鳞羽衣","玉树腰带","锁子甲","骷髅吊坠","苍魂珠"})
		self.可视 = false
	elseif 事件 == "购买" and 地图1 == 1083 then
		tp.窗口.商店:打开({"九宫坠","白面狼牙","江湖夜雨","凤头钗","缨络丝带","神行靴","琥珀腰链","紧身衣","天香披肩"})
		self.可视 = false
	elseif 事件 == "购买" and 地图1 == 1085 then
		local ab = {}
		for i=1,17 do
			insert(ab,tp.打造物品[i][5])
		end
		tp.窗口.商店:打开(ab)
		self.可视 = false
	elseif 事件 == "是的我要去" and 地图1 == 1001 and 名称 == "圣山传送人" then
		tp.场景:传送至(1205,115,94)
		self.可视 = false
	-- 傲来国
	elseif 事件 == "花费2000两购买鱼竿" and 地图1 == 1092 and 名称 == "渔夫" then
		if tp.金钱 >= 2000 then
			增加物品("鱼竿")
			tp.金钱 = tp.金钱 - 2000
			tp.提示:写入("#Y/成功购买了一个鱼竿花费了2000两")
		else
			self:文本("男人_钓鱼","渔夫","钱不够呢。")
		end
	elseif 事件 == "兑换海产" and 地图1 == 1092 and 名称 == "渔夫" then
		self.关闭事件 = true
		local xx = {"随机二级鱼类","随机三级鱼类","随机属性人参果","祥瑞腾蛇"}
		self:文本("男人_钓鱼","渔夫","请选择你要兑换的物品",xx)
		self:下一页()
	elseif 事件 == "是的我要去" and 地图1 == 1092 and 名称 == "仙岛引路人" then
		self.可视 = false
		tp.场景:传送至(1207,10,109)
	-- 未知
	elseif 事件 == "是的 我要去" and 地图1 == 1116 and 名称 == "虾兵" then
		self.可视 = false
		tp.场景:传送至(1506,95,37)
	-- 北俱
	elseif 事件 == "是的我要去" and 地图1 == 1174 and 名称 == "地遁鬼" then
		self.可视 = false
		tp.场景:传送至(1091,73,103)
	elseif 事件 == "是的我要去" and 地图1 == 1174 and 名称 == "女娲神迹传送人" then
		self.可视 = false
		tp.场景:传送至(1201,47,105)
	-- 长寿郊外
	elseif 事件 == "是的我要去" and 地图1 == 1091 and 名称 == "驿站老板" then
		self.可视 = false
		tp.场景:传送至(1174,193,155)
	elseif 事件 == "是的我要去" and 地图1 == 1091 and 名称 == "传送天将" then
		self.可视 = false
		tp.场景:传送至(1111,246,158)
	elseif 事件 == "是的我要去" and 地图1 == 1091 and 名称 == "西牛贺洲土地" then
		self.可视 = false
		tp.场景:传送至(1173,33,96)
	-- 境外
	elseif 事件 == "是的我要去" and 地图1 == 1173 and 名称 == "大唐境外土地" then
		self.可视 = false
		tp.场景:传送至(1091,84,151)
	elseif 事件 == "是的我要去" and 地图1 == 1173 and 名称 == "碗子山土地" then
		self.可视 = false
		tp.场景:传送至(1228,85,183)
	-- 天宫
	elseif 事件 == "是的我要去" and 地图1 == 1111 and 名称 == "守门天兵" then
		self.可视 = false
		tp.场景:传送至(1091,24,119)
	-- 国境
	elseif 事件 == "送我去凌波城" and 地图1 == 1110 and 名称 == "大唐国境土地" then
		tp.场景:传送至(1150,9,94)
		self.可视 = false
	elseif 事件 == "是的我要去" and 地图1 == 1110 and 名称 == "普陀山接引仙女" then
		tp.场景:传送至(1140,84,62)
		self.可视 = false
	-- 碗子山
	elseif 事件 == "是的我要去" and 地图1 == 1228 and 名称 == "碗子山土地" then
		tp.场景:传送至(1139,83,45)
		self.可视 = false
	-- 西梁女国
	elseif 事件 == "是的我要去" and 地图1 == 1040 and 名称 == "驿站老板" then
		tp.场景:传送至(1208,128,36)
		self.可视 = false
	elseif 事件 == "我去！我去！" and 地图1 == 1040 and 名称 == "驿站老板" then
		tp.场景:传送至(1235,465,85)
		self.可视 = false
	-- 丝绸之路
	elseif 事件 == "是的我要去" and 地图1 == 1235 and 名称 == "驿站老板" then
		tp.场景:传送至(1040,25,110)
		self.可视 = false
	-- 麒麟山
	elseif 事件 == "送我过去吧" and 地图1 == 1210 and 名称 == "驿站老板" then
		tp.场景:传送至(1226,10,111)
		self.可视 = false
	-- 蓬莱
	elseif 事件 == "送我过去吧" and 地图1 == 1207 and 名称 == "驿站老板" then
		tp.场景:传送至(1092,34,61)
		self.可视 = false
	-- 玩法
	elseif 事件 == "好的 我帮你。" and 地图1 == 1122 and 名称 == "城里的孩子" then
		self.关闭事件 = true
		if #tp.队伍 >= 3 then
			if tp.队伍[1].等级 >= 40 then
				if tp.剧情开关.抓鬼 == false then
					tp.窗口.任务栏:删除("抓鬼任务")
					local a = tp.假人库:生成鬼()
					local 虚伪坐标 = {x=a.坐标.x+random(-6,6),y=a.坐标.y+random(-10,10)}
					if 虚伪坐标.x <= 0 then
						虚伪坐标.x = 0
					end
					if 虚伪坐标.y <= 0 then
						虚伪坐标.y = 0
					end
					if tp.剧情进度.抓鬼 > 10 then
						tp.剧情进度.抓鬼 = 1
					end
					local maps = 取地图名称(a.编号)
					local vs = "出逃地府的#R"..a.名称.."#W/出没在#R/"..maps.."#W/的#R/"..虚伪坐标.x..","..虚伪坐标.y.."#W/附近，请少侠速去捉拿\n#W/"
					tp.窗口.任务栏:添加("抓鬼任务","帮助钟馗抓回来出逃在"..maps.."#L/"..虚伪坐标.x..","..虚伪坐标.y.."#L/附近的"..a.名称.."\n#L/当前第"..tp.剧情进度.抓鬼.."环")
					self:文本("男人_钟馗","城里的孩子",vs)
				    self:下一页()
			    else
			    	self:文本("男人_钟馗","城里的孩子","你已经领取了一次任务了")
		   			self:下一页()
				end
			else
				self:文本("男人_钟馗","城里的孩子","队长等级至少大于或等于40级")
		   		self:下一页()
			end
		else
			self:文本("男人_钟馗","城里的孩子","队伍中至少要有3名队员才可以领取抓鬼任务")
		    self:下一页()
		end
	elseif 事件 == "听听无妨。。。" and 地图1 == 1028 and 名称 == "店小二" then
		self.关闭事件 = true
		if tp.金钱 >= 500 then
			if tp.队伍[1].等级 > 25 then
				if tp.剧情开关.宝图 == false then
					tp.金钱 = tp.金钱 - 500
					local a = tp.假人库:生成强盗()
					local map = 取地图名称(a.maps)
					self:文本("男人_店小二","店小二","听说在#R/"..map.."#R/x:"..a.x.." y:"..a.y.."#W/处的江洋大盗#R/"..a.name.."#W/身上携带珍贵藏宝图")
					tp.窗口.任务栏:添加("宝图任务","长安酒店的店小二说在#R/"..map.."#R/x:"..a.x.." y:"..a.y.."#L/处的江洋大盗#R/"..a.name.."#L/身上携带珍贵藏宝图")
			    	tp.剧情开关.宝图 = true
			    	self:下一页()
				else
					self:文本("男人_店小二","店小二","你已经领取了一次任务了")
			    	self:下一页()
				end
			else
				self:文本("男人_店小二","店小二","队长等级至少大于或等于25级")
		   		self:下一页()
			end
		else
			self:文本("男人_店小二","店小二","这点诚意都没有，我才不告诉你呢")
		    self:下一页()
		end
	elseif 事件 == "我要住店休息" then
		self.关闭事件 = true
		if tp.队伍[1].等级 > 20 then
			if tp.金钱 >= 500 then
				for i=1,#tp.队伍 do
					tp.队伍[i].气血 = tp.队伍[i].最大气血
					tp.队伍[i].魔法 = tp.队伍[i].最大魔法
					if tp.队伍[i].参战宝宝.名称 ~= nil then
						tp.队伍[i].参战宝宝.气血 = tp.队伍[i].参战宝宝.最大气血
						tp.队伍[i].参战宝宝.魔法 = tp.队伍[i].参战宝宝.最大魔法
					end
				end
				self:文本("男人_酒店老板","酒店老板","客官你已经恢复了精神")
		    	self:下一页()
		    	tp.金钱 = tp.金钱 - 500
			else
				self:文本("男人_酒店老板","酒店老板","你太穷了，不给你住店")
		    	self:下一页()
			end
		else
			for i=1,#tp.队伍 do
				tp.队伍[i].气血 = tp.队伍[i].最大气血
				tp.队伍[i].魔法 = tp.队伍[i].最大魔法
				if tp.队伍[i].参战宝宝.名称 ~= nil then
					tp.队伍[i].参战宝宝.气血 = tp.队伍[i].参战宝宝.最大气血
					tp.队伍[i].参战宝宝.魔法 = tp.队伍[i].参战宝宝.最大魔法
				end
			end
			self:文本("男人_酒店老板","酒店老板","客官你已经恢复了精神")
		    self:下一页()
		end
	-- 门派传送
	elseif 事件 == "是的我要去" and ((地图1 == 1135 and 名称 == "接引道童") or (地图1 == 1142 and 名称 == "接引女使")  or (地图1 == 1198 and 名称 == "传送护卫") or
		(地图1 == 1002 and 名称 == "接引僧") or (地图1 == 1513 and 名称 == "引路小妖") or (地图1 == 1139 and 名称 == "接引小妖") or
		(地图1 == 1131 and 名称 == "传送小妖") or (地图1 == 1140 and 名称 == "接引仙女") or (地图1 == 1111 and 名称 == "接引仙女") or (地图1 == 1150 and 名称 == "传送天将") or
		(地图1 == 1116 and 名称 == "传送蟹将") or (地图1 == 1146 and 名称 == "传送道童") or (地图1 == 1138 and 名称 == "引路族民") or (地图1 == 1122 and 名称 == "地遁鬼") or (地图1 == 1198 and 名称 == "传送护卫") or
		(地图1 == 1512 and 名称 == "传送牛妖")) then
		self.可视 = false
		tp.场景:传送至(1001,393,217)
	-- 新增玩法
	elseif 事件 == "少废话，开打"and self.放载事件 ~= nil then
		self.关闭事件 = true
		if #tp.队伍 >= 3 then
			if tp.队伍[1].等级 >= 25 then
				引擎.活动战斗(1,self.放载事件[1],self.放载事件[2],self.放载事件[3])
				self.可视 = false
			else
				self:文本(self.放载事件[2],self.放载事件[1],"队长等级至少大于或等于25级才能挑战我")
				self:下一页()
			end
		else
			self:文本(self.放载事件[2],self.放载事件[1],"还是回去多找几个人在来吧")
			self:下一页()
		end
	elseif 事件 == "开始战斗吧" and self.放载事件 ~= nil and self.放载事件[1] == "门派大闯关" then
		引擎.门派大闯关战斗(self.放载事件[1],self.放载事件[2],self.放载事件[3],self.放载事件[4],self.放载事件[5],self.放载事件[6])
		self.可视 = false
	elseif 事件 == "开始四季活动" then
		self.关闭事件 = true
		if tp.剧情开关.四季 == false then
			self:文本("普陀山_接引仙女","四季轮转活动使","请等待版本更新")
			--self:文本("普陀山_接引仙女","四季轮转活动使","请选择你要做的活动",{"春色暖暖","夏日炎炎","秋意绵绵","冬雪皑皑"})
		else
			self:文本("普陀山_接引仙女","四季轮转活动使","你已经领取过一次任务了，需要结束或者完成任务才能继续领取领取")
		end
		self:下一页()
	elseif 事件 == "春色暖暖" then
		self.关闭事件 = true
		local xa = {}
		local 地图 = {1054,1043,1137,1143,1154,1124,1144,1156,1145,1134,1112,1141,1150,1147,1117}
		local 对应 = {"程咬金","空度禅师","菩提祖师","孙婆婆","巫奎虎","地藏王","白晶晶","地涌夫人","牛魔王","大大王","李靖","观音姐姐","二郎神","镇元子","东海龙王"}
		for i=1,5 do
			local v = random(1,#地图)
			local cb = {地图[v],对应[v]}
			xa[i] = cb
			remove(地图, v)
			remove(对应, v)
		end
		tp.窗口.任务栏:添加("四季轮转",format("为师父%s道一身问候吧",xa[1][2]))
		self:文本("普陀山_接引仙女","四季轮转活动使","元宵佳节，别忘了去给自己的师父道一声问候。通过师傅们的考验会获得意想不到的福利哦")
		tp.提示:写入(format("#Y/为师父%s道一身问候吧",xa[1][2]))
		tp.剧情开关.四季 = {"元宵拜年",0,1,xa}
		self:下一页()
	elseif 事件 == "夏日炎炎" then
		self.关闭事件 = true
		tp.窗口.任务栏:添加("四季轮转","前往江南野外把知了甲、知了乙、知了丙、知了丁、知了戊、知了己、知了庚给消灭掉，并杀死最后的知了王")
		self:文本("普陀山_接引仙女","四季轮转活动使","前往江南野外把知了甲、知了乙、知了丙、知了丁、知了戊、知了己、知了庚给消灭掉，并杀死最后的知了王")
		tp.剧情开关.四季 = {"知了王",0,1}
		tp.假人库:四季活动生成(true)
		self:下一页()
	elseif 事件 == "秋意绵绵" then
		self.关闭事件 = true
		tp.窗口.任务栏:添加("四季轮转","前往月宫消灭天狗\n#L/当前剩余天狗数量5只")
		self:文本("普陀山_接引仙女","四季轮转活动使","前往月宫杀死5只食月天狗获得打狗棒之后驱赶最终的噬月天狗")
		tp.剧情开关.四季 = {"天狗食月",0,1}
		tp.假人库:四季活动生成(true)
		self:下一页()
	elseif 事件 == "冬雪皑皑" then
		self.关闭事件 = true
		tp.窗口.任务栏:添加("四季轮转","去北俱芦洲把雪人堆起来吧")
		self:文本("普陀山_接引仙女","四季轮转活动使","北俱芦洲出现了一个雪人，不过它好像快融化了，你需要把给堆起来（打死周围的融雪怪可以获得堆雪人的材料，交托给雪人之后雪人会增加不同的进度点，每20次雪人会成长一次哦，成长到最后就可以领取奖励了）")
		tp.剧情开关.四季 = {"堆雪人",0,1,{0,0,0,false,false,false,0}}
		tp.假人库:四季活动生成(true)
		self:下一页()
	elseif 事件 == "结束四季活动" then
		self.关闭事件 = true
		if tp.剧情开关.四季 ~= false then
			tp.剧情开关.四季 = false
			tp.假人库:清空四季()
			tp.窗口.任务栏:删除("四季轮转")
			self:文本("普陀山_接引仙女","四季轮转活动使","为你取消了四季活动")
		else
			self:文本("普陀山_接引仙女","四季轮转活动使","你暂时还没有领取四季活动呢")
		end
		self:下一页()
	elseif 事件 == "准备好了，请告诉我们第一关的挑战地点" then
		self.关闭事件 = true
		if tp.剧情开关.十五门 == false then
			local dl = {}
			local ks = {1002,1135,1142,1138,1198,1122,1513,1139,1512,1131,1111,1140,1150,1146,1116}
			for i=1,15 do
				local v = random(1,#ks)
				insert(dl,ks[v])
				remove(ks, v)
			end
			tp.剧情开关.十五门 = dl
			local a = tp.假人库:生成闯关使者()
			tp.窗口.任务栏:添加("十五门派大闯关","挑战"..a)
			self:文本("男人_马副将","门派闯关使","你的第一关为"..a.."请前往挑战，十五次之后可以再次来我这里领取任务")
			tp.剧情进度.十五门 = 1
		else
			self:文本("男人_马副将","门派闯关使","你已经领取了闯关任务")
		end
		self:下一页()
	elseif 事件 == "查看十五门派大闯关活动积分" then
		self.关闭事件 = true
		self:文本("男人_马副将","门派闯关使",format("你当前的积分为：%d",tp.剧情进度.十五门积分 or 0))
		self:下一页()
	elseif 事件 == "兑换十五门派大闯关活动奖励" then
		self.关闭事件 = true
		self:文本("男人_马副将","门派闯关使","请选择你要兑换的奖励",{"普通神兽(66积分)","变异神兽(108积分)"})
		self:下一页()
	elseif 事件 == "普通神兽(66积分)" then
		self.关闭事件 = true
		if (tp.剧情进度.十五门积分 or 0) >= 66 then
			self:文本("男人_马副将","门派闯关使","兑换成功")
			self:下一页()
			local 神兽 = {"超级泡泡","超级白泽","超级神牛","超级青鸾","超级赤焰兽","超级海豚","超级腾蛇"}
			神兽 = 神兽[random(1,#神兽)]
			local 技能 = qbb(神兽.."（物理型）")
			tp:获取宝宝(神兽,神兽,"神兽",nil,nil,nil,技能[9],{1400,1400,4500,2500,1200,1200},1.25,nil,{100,20,20,20,20,20})
			tp.剧情进度.十五门积分 = max((tp.剧情进度.十五门积分 or 0) - 66,0)
		else
			self:文本("男人_马副将","门派闯关使","积分不足")
			self:下一页()
		end
	elseif 事件 == "变异神兽(108积分)" then
		self.关闭事件 = true
		if (tp.剧情进度.十五门积分 or 0) >= 108 then
			self:文本("男人_马副将","门派闯关使","兑换成功")
			self:下一页()
			local 神兽 = {"超级泡泡","超级白泽","超级神牛","超级青鸾","超级赤焰兽","超级海豚","超级腾蛇"}
			神兽 = 神兽[random(1,#神兽)]
			local 技能 = qbb(神兽.."（物理型）")
			tp:获取宝宝(神兽,神兽,"进阶神兽",nil,nil,nil,技能[9],{1600,1600,5500,3500,1400,1400},1.3,nil,{100,20,20,20,20,20})
			tp.剧情进度.十五门积分 = max((tp.剧情进度.十五门积分 or 0) - 108,0)
		else
			self:文本("男人_马副将","门派闯关使","积分不足")
			self:下一页()
		end
	elseif self.放载事件 ~= nil and self.放载事件[1] ~= nil and self.放载事件[1] == "四季轮转" and 事件 ~= "夏日炎炎正好眠，求放过" then
		self.关闭事件 = true
		引擎.四季选项(事件,self.放载事件[2],名称)
	elseif 事件 == "保卫长安任务" then
		self.关闭事件 = true
		if tp.剧情开关.保卫长安 ~= false then
			if tp.剧情开关.保卫长安[1] == "鬼王密信" then
				self:文本("考官2","魏征","少侠，根据信中所说，鬼王们已经在长安集结势力，你需要前往长安各地捉拿鬼王，惩恶扬善。")
				tp.窗口.任务栏:删除("保卫长安")
				tp.窗口.任务栏:添加("保卫长安","前往长安城41,218处捉拿试图放出所有犯人制造大乱的六道吸血鬼")
				tp.剧情开关.保卫长安[2] = 1
				tp.剧情开关.保卫长安[3] = 10
				tp.假人库:生成保卫长安()
			elseif tp.剧情开关.保卫长安[1] == "无尽梦魇" then
				self:文本("考官2","魏征","少侠，梦魇已经入侵了许多无辜平民百姓的梦境，似乎想在梦中制造恐慌。我这就将你传送至梦境中，你务必惩恶扬善，修复梦境、")
				tp.窗口.任务栏:删除("保卫长安")
				tp.剧情开关.保卫长安[2] = 1
				tp.剧情开关.保卫长安[3] = 0
				tp.剧情开关.副本 = {}
				tp.场景:传送至(1400,19,16)
				tp.窗口.任务栏:添加("保卫长安",format("杀死幻境中的全部怪物\n#L/完成度：%d/10\n#L/当前第%d/6波",tp.剧情开关.保卫长安[3],tp.剧情开关.保卫长安[2]))
				tp.假人库:生成保卫长安()
			end
		else
			self:文本("考官2","魏征","少侠，我们暂时不需要你的帮助")
		end
		self:下一页()
	elseif self.放载事件 ~= nil and self.放载事件[1] ~= nil and self.放载事件[1] == "保卫长安" then
		self.关闭事件 = true
		if 事件 == "少吓唬人，看招" then
			引擎.保卫长安战斗(self.放载事件[2],self.放载事件[3],self.放载事件[4])
			return false
		elseif 事件 == "送我回去吧" then
			tp.剧情开关.保卫长安 = false
			tp.剧情开关.副本 = false
			tp.场景:传送至(1001,336,217)
			tp.窗口.任务栏:删除("保卫长安")
		end
		self:下一页()
	elseif (事件 == "我来领取任务链任务1" or 事件 == "继续吧") and 名称 == "陆萧然" then
		self.关闭事件 = true
		local b = {"召唤兽"}
		local bl = 1.0
		if tp.剧情开关.跑环 == false then
			tp.剧情开关.跑环 = {}
		end
		tp.剧情开关.跑环[1] = b[random(1,#b)]
		if tp.剧情开关.跑环[1] == "召唤兽" then
			local xq = tp:取进制等级(tp.队伍[1].等级)
			if xq >= 40 then
				xq = 40
			end
			xq = 引擎.取等级怪(xq)
			xq = 引擎.取敌人信息(xq[random(1,#xq)])[2]
			if xq == "浣熊" then
				xq = "狸"
			end
			tp.剧情开关.跑环[2] = xq
			bl = 1.3
		end
		if tp.剧情开关.跑环[3] == nil then
			tp.剧情开关.跑环[3] = 99
		end
		tp.剧情开关.跑环[3] = tp.剧情开关.跑环[3] + 1
		tp.剧情开关.跑环[4] = bl
		if tp.剧情开关.跑环[5] == nil then
			tp.剧情开关.跑环[5] = 0
		end
		tp.剧情开关.跑环[5] = tp.剧情开关.跑环[5] + 1
		if tp.剧情开关.跑环[3] <= 100 then
			if tp.剧情开关.跑环[5] > 10 then
				tp.剧情开关.跑环[5] = 1
			end
		elseif tp.剧情开关.跑环[3] > 100 and tp.剧情开关.跑环[3] <= 200 then
			if tp.剧情开关.跑环[5] > 20 then
				tp.剧情开关.跑环[5] = 1
			end
		elseif tp.剧情开关.跑环[3] > 200 and tp.剧情开关.跑环[3] <= 300 then
			if tp.剧情开关.跑环[5] > 25 then
				tp.剧情开关.跑环[5] = 1
			end
		end
		tp.场景.跑环计时器 = 108000
		tp.窗口.任务栏:删除("任务链")
		if tp.剧情开关.跑环[1] == "召唤兽" then
			self:文本("男人_老书生","陆萧然",format("请为我带回来一只#G/%s#W/吧",tp.剧情开关.跑环[2]),xx)
			tp.窗口.任务栏:添加("任务链",format("为陆萧然带回来一只%s\n#L/◆当前第%d环\n#L/◆奖励倍率："..tp.剧情开关.跑环[4].."倍\n#L/（剩余时间：%d分钟）",tp.剧情开关.跑环[2],tp.剧情开关.跑环[3],floor(tp.场景.跑环计时器/60/60)))
		end
		tp.剧情开关.跑环开始 = true
		self:下一页()
	elseif 事件 == "我来取消任务链任务" then
		self.关闭事件 = true
		if tp.剧情开关.跑环 ~= false then
			self:文本("男人_老书生","陆萧然",format("少侠你真的想好了要前功尽弃了吗？当前进行到#R/%d#W/环",tp.剧情开关.跑环[3]),{"我想好了，为我取消任务链任务吧","我点错了"})
		else
			self:文本("男人_老书生","陆萧然","你还没有领取任务链任务")
		end
		self:下一页()
	elseif 事件 == "我想好了，为我取消任务链任务吧" then
		self.关闭事件 = true
		tp.剧情开关.跑环 = false
		tp.场景.跑环计时器 = nil
		tp.窗口.任务栏:删除("任务链")
		self:文本("男人_老书生","陆萧然","为你取消了任务链任务")
		self:下一页()
	elseif 事件 == "我来查看任务链说明（第一次玩建议查看）" then
		self.关闭事件 = true
		self:文本("男人_老书生","陆萧然","倍率说明：任务内的奖励倍率将影响最终奖励，任务越难，被率倍高。最高不大于3，最低也不小于0.7\n保存环数说明：跑环过程中允许存档，但100环、200环、300环时存档会将环数自动提高一环\n跳环数说明：每次完成任务，都有一定的概率提高3~5环。但跳环之后的环数不会超过100环、200环、300环")
		self:下一页()
	-- 抓捕生肖
	elseif 事件 == "抓捕生肖" then
		self.关闭事件 = true
		if tp.剧情开关.十二生肖 == false then
			self:文本("天兵","守门天兵","近日以来，十二生肖因为触犯天条被捕入狱，被关押在天牢。因此12生肖心生反意，并且在在神秘人的帮助下越狱逃离，少侠可愿意助我天庭一臂之力将生肖抓捕归案？",{"我愿意","我点错了"},"十二生肖")
		else
			self:文本("天兵","守门天兵","少侠你已经接受了天庭抓捕生肖的密令，请将十二生肖全部抓捕完毕")
		end
		self:下一页()
	elseif self.放载事件 == "十二生肖" then
		self.关闭事件 = true
		if 事件 == "我愿意" then
			tp.剧情开关.十二生肖 = {0,{},nil,nil}
			self:文本("天兵","守门天兵","在接下来的十二个时辰里，天庭将会在每个时辰的开始前以密令形式提醒你生肖的所处位置，")
			tp.提示:写入("#Y/请注意每隔两个小时将刷新生肖坐标")
			local di = tp.假人库:生成十二生肖()
			tp.提示:写入(format("#Y/%s出现在%s处，请及时捉拿",di[1],di[2]))
			tp.窗口.任务栏:添加("十二生肖",format("%s出现在%s处，请及时前往捉拿\n#L/◆当前抓捕第%d次",di[1],di[2],tp.剧情开关.十二生肖[1]))
		end
		self:下一页()
	elseif 事件 == "终于找到你了，快和我回天庭自首！" then
		引擎.十二生肖战斗(self.放载事件[1],self.放载事件[2],self.放载事件[3])
	-- 飞升
	elseif 事件 == "什么是化境" then
		self.关闭事件 = true
		self:文本("吴刚","吴刚","万物变化，虚而不屈，相生相克，无穷无尽，欲强者先弱，欲扬者先抑，欲刚者先柔，欲取者先与，欲升者先降，欲张者先合。入与化境之后会变的暂时弱些，但是不久你就可以达到更强的境界。")
		self:下一页()
	elseif 事件 == "我想入化境，请指点一二。" then
		self.关闭事件 = true
		if tp.队伍[1].等级 >= 125 then
			if tp.剧情开关.飞升 == false then
				self:文本("吴刚","吴刚","如果你准备好了，可以去找法明长老来指导你如何进入化境！等你通过了所有修炼再来找，我会带你入与化境。")
				tp.剧情开关.飞升 = {1}
				tp.窗口.任务栏:添加("飞升剧情","#R/法明长老#L/将会指引你如何进入化境。")
			else
				tp.提示:写入("#Y/你已经领取了飞升任务")
			end
		else
			self:文本("吴刚","吴刚","少侠你目前你的修为还不够，还需要多多历练才是。（需等级>=125）")
		end
		self:下一页()
	elseif 事件 == "入化境后有什么变化？" then
		self.关闭事件 = true
		self:文本("吴刚","吴刚","进入化境后将会等级上限会提高至155级，同时修炼等级上限也会从20级提高25级。")
	elseif 事件 == "飞升剧情" then
		self.关闭事件 = true
		if tp.剧情开关.飞升[1] == 1 then
			self:文本("空度禅师","法明长老","你现在已经是绝顶高手，但是如此求得称雄三界，却也水中捞月，我这有易筋经洗髓，脱胎换骨之门，学成之后，可入化境，天下无敌，不知道你愿意学不？",{"我愿意","我还要在想想"},"飞升开关")
		elseif tp.剧情开关.飞升[1] == 2 then
			if tp.剧情开关.飞升[2] == nil then
				local a = tp:取药品(2)
				local b = tp:取药品(3)
				a = a[random(1,#a)]
				b = b[random(1,#b)]
				tp.剧情开关.飞升[2] = {a,b}
				增加物品(a)
				增加物品(b)
				self:文本("男人_太上老君","太上老君",format("欲入化境，必先明道。为道者将强先弱，欲扬先抑。入于化境之后会变的暂时弱些，但是不久你就可以达到更强的境界，携带更加厉害的召唤兽，拥有更有威力的法术和更强的修炼。既然我传授给你这些道理，你也应该为我道门做些事情。我这几日要炼仙丹，需要%s和%s做药引，你去取些来。",a,b))
				tp.窗口.任务栏:修改内容("飞升剧情",format("为了多打听关于化境的事，帮太上老君找来%s来做药引",a))
			else
				self:文本("男人_太上老君","太上老君","找到药引了吗",{"找到了","还没有"},"飞升开关")
			end
		elseif tp.剧情开关.飞升[1] == 4 then
			if tp.剧情开关.飞升[2][1] == 4 then
				tp:增加经验(500000,nil,true)
				tp.剧情开关.飞升[1] = 5
				tp.剧情开关.飞升[2] = nil
				tp.窗口.任务栏:修改内容("飞升剧情","去找李世民谈谈。")
				self:文本("男人_玉帝","玉皇大帝","要你找的这四样宝贝暗含四象之妙，可以激发你的潜力，如果再加上地藏王的不死壤，那么五行妙法就已齐备。可惜自从大禹治水后，就再也没有人见过不死壤了。天庭已经没有什么好教你的了，你再去人界修炼妙法吧。")
				物品失去("定海针")
				物品失去("避火诀")
				物品失去("修篁斧")
				物品失去("炼金鼎")
			else
				self:文本("男人_玉帝","玉皇大帝",format("把这四样东西给我找来：\n#Y/东海龙王的定海针%s；\n#Y/李靖的避火诀%s；\n#Y/镇元大仙的炼金鼎%s；\n#Y/观音姐姐的修篁斧%s",开关取内容("(完成)","",取数组内容(tp.剧情开关.飞升[2][2],"定海针")),开关取内容("(完成)","",取数组内容(tp.剧情开关.飞升[2][2],"避火诀")),开关取内容("(完成)","",取数组内容(tp.剧情开关.飞升[2][2],"炼金鼎")),开关取内容("(完成)","",取数组内容(tp.剧情开关.飞升[2][2],"修篁斧"))))
			end
		elseif tp.剧情开关.飞升[1] == 5 then
			-- print(1)
		end
		self:下一页()
	elseif self.放载事件 == "飞升开关" then
		self.关闭事件 = true
		if 事件 == "我愿意" then
			self:文本("空度禅师","法明长老","很好，你现在去天界找太上老君，他会告诉你一个如何入与化境的方法。")
			tp.剧情开关.飞升[1] = 2
			tp.窗口.任务栏:修改内容("飞升剧情","去#R/太上老君#L/那了解入化境的方法。")
		elseif 事件 == "找到了" then
			local xq = nil
			local id = nil
			if tp.剧情开关.飞升[2][1] ~= nil then
				if 物品判断(tp.剧情开关.飞升[2][1],1) then
					物品失去(tp.剧情开关.飞升[2][1],1)
					xq = tp.剧情开关.飞升[2][1]
					id = 2
					tp.剧情开关.飞升[2][1] = nil
				end
			elseif tp.剧情开关.飞升[2][2] ~= nil then
				if 物品判断(tp.剧情开关.飞升[2][2],1) then
					物品失去(tp.剧情开关.飞升[2][2],1)
					xq = tp.剧情开关.飞升[2][2]
					id = 1
					tp.剧情开关.飞升[2][2] = nil
				end
			end
			if xq ~= nil then
				if tp.剧情开关.飞升[2][1] == nil and tp.剧情开关.飞升[2][2] == nil then
					self:文本("男人_太上老君","太上老君","嗯，你做的很好。看来你的确潜心向道，我要向玉皇大帝引见你，让你获得进行仙界试炼的资格。")
					tp.剧情开关.飞升 = {3}
					tp.窗口.任务栏:修改内容("飞升剧情","去玉皇大帝那获得仙界的试炼资格")
					tp.提示:写入("#Y/你得到了20000经验")
					tp:增加经验(20000)
				else
					self:文本("男人_太上老君","太上老君",format("不错不错，帮我找到了一个%s当药引，另一个呢？",xq))
					tp.窗口.任务栏:修改内容("飞升剧情",format("为了多打听关于化境的事，帮太上老君找来%s来做药引",tp.剧情开关.飞升[2][id]))
				end
			else
				self:文本("男人_太上老君","太上老君","你身上没有我要的东西。")
			end
		elseif 事件 == "我可以" then
			self:文本("男人_玉帝","玉皇大帝","把这4样东西给我找来：\n#Y/东海龙王的定海针；\n#Y/李靖的避火诀；\n#Y/观音的修篁斧；\n#Y/镇元大仙的炼金鼎。")
			tp.剧情开关.飞升[1] = 4
			tp.剧情开关.飞升[2] = {0,{},{}}
			tp.窗口.任务栏:修改内容("飞升剧情",format("去向#R/东海龙王#L/要定海针%s；\n#L/◆去向#R/李靖#L/要一本避火诀%s；\n#L/◆去向#R/镇元大仙#L/借下炼金鼎%s；\n#L/◆去向#R/观音姐姐#L/借吧修篁斧%s",开关取内容("(完成)","",取数组内容(tp.剧情开关.飞升[2][2],"定海针")),开关取内容("(完成)","",取数组内容(tp.剧情开关.飞升[2][2],"避火诀")),开关取内容("(完成)","",取数组内容(tp.剧情开关.飞升[2][2],"炼金鼎")),开关取内容("(完成)","",取数组内容(tp.剧情开关.飞升[2][2],"修篁斧"))))
		end
		self:下一页()
	--物件
	elseif 事件 == "打造" and (地图1 == 1502 or 地图1 == 1020) then
		self.可视 = false
		tp.窗口.打造:打开(true)
	-- 副本
	elseif 事件 == "乌鸡国" or 事件 == "车迟斗法" or 事件 == "水陆大会" or 事件 == "通天河" or 事件 == "大闹天宫" or 事件 == "秘境降妖" then
		self.关闭事件 = true
		if tp.剧情开关.进入副本 ~= false and 事件 == tp.剧情开关.进入副本[1] then
			if 事件 == "乌鸡国" then
				self:文本("男人_书生","吴举人","&*(&&%$^&*@*_啊……在我课上你都要睡觉#54")
				self:文本(tp.队伍[1].模型,tp.队伍[1].名称,"一个人自称乌鸡国王，此次托梦给我，是为了让我为他洗清冤屈。",{"你还是去仔细探查吧，我送你过去","你功课还没有做完，不让过去"},"副本选项")
			elseif 事件 == "车迟斗法" then
				self:文本("男人_胖和尚","慧觉和尚","最近比较忙#47。受大圣所托，正前往车迟国。同为佛门弟子，听闻车迟国僧众受到逼迫，无心念经向佛，事有蹊跷，老衲正欲前往打探。",{"有这等诡异之事，在下怎能袖手旁观，请大师引我前往。","大师先行一步，在下稍作准备，随后前往"},"副本选项")
			elseif 事件 == "水陆大会" then
				self:文本("男人_胖和尚","疥癞和尚","今玄奘秉承建大会，众有识之士不妨来帮忙帮忙",{"我要来帮忙","啊..我有事先走"},"副本选项")
			elseif 事件 == "通天河" then
				self:文本("蝴蝶仙子","蝴蝶女","前方是八百里通天河，蛟龙不得渡，鹅毛浮不起。唐僧师徒要向此处上西天，实在是难哩。",{"逢山开路，遇水架桥，这有何难，待我渡来。","这经取不得了，各回各家吧。"},"副本选项")
			elseif 事件 == "大闹天宫" then
				self:文本("男人_诗中仙","太白金星","前日里天兵天将不知诸位神通，故遭败北，今玉帝特命老夫下界前来邀请大王们上天做官，请各位授录")
				self:文本(tp.队伍[1].模型,tp.队伍[1].名称,"前番勤劳，今又蒙爱，多谢！但不知玉帝老儿封我个什么官？")
				self:文本("男人_诗中仙","太白金星","玉帝宣旨，让你做个“齐天大圣”，并负责看管蟠桃园，官品极矣，可谓美差啊！",{"甚好，甚好，就请快快带我前往吧！","待我先去休息一番再来。"},"副本选项")
			elseif 事件 == "秘境降妖" then
				self:文本("护卫","御林军左统领","有英雄进入秘境打败了那些为非作歹的妖精，不料他们死灰复燃，不仅继续作恶，还每每在夜间摄走唐王魂魄想借着王者之气掩盖他们的妖气，如今唐王夜夜噩梦不断，问遍了当世名医和朝野的相士，却都是无能为力。",{"我也正为此事而来！","我三界也认识不少朋友，帮你打听打听。"},"副本选项")
			end
		else
			tp.提示:写入(format("#Y/你并没有接取%s副本任务",事件))
		end
		self:下一页()
	elseif self.放载事件 == "副本选项" and tp.剧情开关.进入副本 ~= false then
		if 事件 == "你还是去仔细探查吧，我送你过去" then
			tp.窗口.任务栏:删除("副本任务")
			tp.剧情开关.副本 = {"乌鸡国",1,0,{0,0,0,0,0,0}}
			tp.剧情开关.禁止Npc = true
			tp.窗口.任务栏:添加("副本任务",format("战胜失去理智的木妖。把场景中所有失去理智的木妖都降服后，才能心平气和的和他们谈谈\n#L/完成度：%d/15",tp.剧情开关.副本[4][1]))
			tp.场景:传送至(1131,112,14)
			tp.假人库:生成副本Npc()
			self:下一页()
		elseif 事件 == "有这等诡异之事，在下怎能袖手旁观，请大师引我前往。" then
			tp.窗口.任务栏:删除("副本任务")
			tp.剧情开关.副本 = {"车迟斗法",1,0,{0,0,0,0,0,0,0}}
			tp.剧情开关.禁止Npc = true
			tp.窗口.任务栏:添加("副本任务","将位于地图坐标88,28处的道观建设完毕")
			tp.场景:传送至(1204,32,124)
			tp.假人库:生成副本Npc()
		elseif 事件 == "我要来帮忙" then
			tp.窗口.任务栏:删除("副本任务")
			--tp.剧情开关.副本 = {"水陆大会",1,0,{0,0,0,0,0,0,0}}
			--tp.剧情开关.禁止Npc = true
			--tp.窗口.任务栏:添加("副本任务","问问道场督僧还需要做些什么事情吧")
			--tp.场景:传送至(1002,7,88)
			--tp.假人库:生成副本Npc()
			tp.窗口.任务栏:删除("副本任务")
			tp.剧情开关.副本 = {"水陆大会",8,0,{0,0,0,0,0,0,0}}
			tp.剧情开关.禁止Npc = true
			tp.窗口.任务栏:添加("副本任务",format("唐王在妖魔巢穴深处，击杀路上的所有妖兵，救出唐王吧！\n#L/完成度：%d/9",tp.剧情开关.副本[4][1]))
			tp.场景:传送至(1211,41,18)
			tp.假人库:生成副本Npc()
		elseif 事件 == "逢山开路，遇水架桥，这有何难，待我渡来。" then
			tp.窗口.任务栏:删除("副本任务")
			tp.剧情开关.副本 = {"通天河",1,0,{0,0,0,0,0,0,0}}
			tp.剧情开关.禁止Npc = true
			tp.窗口.任务栏:添加("副本任务","前方有个道场督僧，问问他有什么需要帮助的吧")
			tp.场景:传送至(1070,47,71)
			tp.假人库:生成副本Npc()
		elseif 事件 == "那就去瞧瞧热闹" then
			tp.窗口.任务栏:删除("副本任务")
			tp.剧情开关.副本 = {"黑风山",1,0,{0,0,0,0,0,0,0}}
			tp.剧情开关.禁止Npc = true
			tp.窗口.任务栏:添加("副本任务","前方有个道场督僧，问问他有什么需要帮助的吧")
			tp.场景:传送至(1042,40,22)
			tp.假人库:生成副本Npc()
		elseif 事件 == "甚好，甚好，就请快快带我前往吧！" then
			tp.窗口.任务栏:删除("副本任务")
			tp.剧情开关.副本 = {"大闹天宫",1,0,{0,0,0,0,0,0,0}}
			tp.剧情开关.禁止Npc = true
			tp.窗口.任务栏:添加("副本任务","前方有个道场督僧，问问他有什么需要帮助的吧")
			tp.场景:传送至(1511,63,56)
			tp.假人库:生成副本Npc()
		elseif 事件 == "我也正为此事而来！" then
			tp.窗口.任务栏:删除("副本任务")
			tp.剧情开关.副本 = {"秘境降妖",1,0,{0,0}}
			tp.剧情开关.禁止Npc = true
			tp.窗口.任务栏:添加("副本任务","找到御林军左统领，让他把你传送到秘境1层吧")
			tp.场景:传送至(1197,62,33)
			tp.假人库:生成副本Npc()
		else
			self.可视 = false
		end
	elseif 事件 == "我们要掀起这块石板，请您帮忙。" then
		self.关闭事件 = true
		tp.剧情开关.副本[4][2] = tp.剧情开关.副本[4][2] + 1
		tp.窗口.任务栏:删除("副本任务")
		local cccs = tp.假人库:删除指定Npc(nil,nil,nil,"乌鸡国",self.放载事件[1],nil)
		local xx = floor(cccs[1]/20)
		local yy = floor(cccs[2]/20)
		引擎.副本奖励()
		if tp.剧情开关.副本[4][2] >= 15 then
			tp.剧情开关.副本[4][2] = 0
			tp.剧情开关.副本[2] = 3
			tp.窗口.任务栏:添加("副本任务",format("帮组乌鸡国王清扫道路\n#L/完成度：%d/5",tp.剧情开关.副本[4][3]))
			tp.假人库:生成副本Npc(xx,yy)
		else
			self:文本("和尚3","热心仙人",format("我知道啦。你放心，我会尽力而为的。你还需要找#G/%d#W/个仙人帮忙哦。",15-tp.剧情开关.副本[4][2]))
			tp.窗口.任务栏:添加("副本任务",format("寻求场景中所有仙人的帮助\n#L/完成度：%d/15",tp.剧情开关.副本[4][2]))
		end
		self:下一页()
	elseif self.放载事件 ~= nil and self.放载事件[1] == "答题" then
		self.关闭事件 = true
		local bhs = self.放载事件[3]
		if self.放载事件[2] == "车迟国" then
			if 事件 == self.放载事件[4] then
				self:文本(self.模型头像,self.名称,"少侠果然机智过人。")
				tp.假人库:删除指定Npc(nil,nil,"男人_道士","车迟斗法",bhs,"副本")
				if random(1,10) <= 4 then
					增加物品("高级木材")
					tp.提示:写入("#Y/你获得了高级木材")
				else
					增加物品("普通木材")
					tp.提示:写入("#Y/你获得了普通木材")
				end
			else
				self:文本(self.模型头像,self.名称,"少侠，你答错了。")
				tp.假人库:删除指定Npc(nil,nil,"男人_道士","车迟斗法",bhs,"副本")
			end
			tp.剧情开关.副本[4][1] = tp.剧情开关.副本[4][1] + 1
			if tp.剧情开关.副本[4][1] == 20 then
				tp.剧情开关.副本[4][1] = 0
				tp.假人库:生成副本Npc(nil,nil,true)
			end
		end
		self:下一页()
	elseif self.放载事件 ~= nil then
		if self.放载事件[1] == "副本" then
			-- 乌鸡国
			if 事件 == "大家一起去" then
				tp.剧情开关.副本 = {"乌鸡国",4,0,{0,0,0,0,0,0}}
				tp.剧情开关.禁止Npc = true
				tp.窗口.任务栏:添加("副本任务",format("消灭场景内三个囚禁仙人的妖怪\n#L/完成度：%d/3",tp.剧情开关.副本[4][4]))
				tp.场景:传送至(1209,40,49)
				tp.假人库:生成副本Npc()
			elseif 事件 == "我要让这些神仙的渴望变成现实" or 事件 == "妖怪莫要嚣张，我来收拾你" or 事件 == "哼，少废话，看打！" then
				引擎.副本战斗(名称,self.放载事件[2],self.放载事件[3])
			elseif 事件 == "我找到玲珑了" then
				self.关闭事件 = true
				if 物品判断("玲珑",1) then
					local sl = 物品失去("玲珑")
					tp.剧情开关.副本[4][6] = tp.剧情开关.副本[4][6] + sl
					if tp.剧情开关.副本[4][6] >= 8 then
						tp.剧情开关.副本[2] = 6
						tp.提示:写入("#Y/假乌鸡国王已经出现，将其消灭吧")
						tp.假人库:删除副本Npc()
						tp.假人库:生成副本Npc()
					else
						self:文本("观音姐姐","观音大士",format("谢谢你，已经收集了#R/%d#/件玲珑",tp.剧情开关.副本[4][6]))
					end
				else
					self:文本("观音姐姐","观音大士","你身上并没有我要的东西")
				end
				self:下一页()
			-- 车迟国
			elseif 事件 == "上交材料" then
				self.关闭事件 = true
				if 物品判断("普通木材",1) or 物品判断("高级木材",1) then
					local sl0 = 0
					local sl1 = 0
					if 物品判断("普通木材",1) then
						sl0 = 物品失去("普通木材")
					end
					if 物品判断("高级木材",1) then
						sl1 = 物品失去("高级木材")
					end
					引擎.副本奖励(sl0+sl1)
					sl0 = sl0 * 8
					sl1 = sl1 * 20
					sl0 = sl0 + sl1
					tp.剧情开关.副本[4][2] = tp.剧情开关.副本[4][2] + sl0
					if tp.剧情开关.副本[4][2] >= 600 then
						self:文本(nil,nil,"道观已经建设完毕，去找有个和尚聊聊吧")
						tp.剧情开关.副本[4][1] = 0
						tp.剧情开关.副本[4][2] = 0
						tp.剧情开关.副本[2] = 2
						tp.假人库:删除副本Npc()
						tp.假人库:生成副本Npc()
						tp.窗口.任务栏:删除("副本任务")
						tp.窗口.任务栏:添加("副本任务","道观已经建设完毕，去找有个和尚聊聊吧")
					else
						self:文本(nil,nil,format("/当前建设进度为%d".."/600",tp.剧情开关.副本[4][2]))
					end
				else
					self:文本(nil,nil,"暂时没有任何材料可以上交。材料获得可以通过与场景内的“有个道士”答题获得")
				end
				self:下一页()
			elseif 事件 == "查看建设进度" then
				self.关闭事件 = true
				self:文本(nil,nil,format("/当前建设进度为%d".."/600",tp.剧情开关.副本[4][2]))
				self:下一页()
			elseif 事件 == "我来吃掉你" then
				引擎.副本战斗(self.放载事件[2],self.放载事件[3],self.放载事件[4])
			elseif 事件 == "神像，得罪了" then
				引擎.副本战斗()
			elseif 事件 == "是的" then
				tp.假人库:删除指定Npc(nil,nil,nil,"车迟斗法",self.放载事件[2],nil)
				引擎.副本奖励()
				self.关闭事件 = true
				self:下一页()
			-- 水陆大会
			elseif 事件 == "大师，请问现在有什么事情是缺人手做的" then
				self.关闭事件 = true
				self:文本("空度禅师","道场督僧","多谢少侠了，你想帮忙做哪个呢？",{"装横","看流星耶..当我没来过"},{"副本"})
				self:下一页()
			elseif 事件 == "装横" then
				self.关闭事件 = true
				if tp.剧情开关.副本[2] ~= 2 then
					tp.剧情开关.副本[2] = 2
					tp.假人库:生成副本Npc()
				end
				self:文本("空度禅师","道场督僧","道场还缺些木材，你速去道场后院100,19处，采集一些桃木")
				tp.窗口.任务栏:删除("副本任务")
				tp.窗口.任务栏:添加("副本任务",format("道场还缺些木材，你速去道场后院100,19处，采集一些桃木\n#L/完成度：%d/10",tp.剧情开关.副本[4][1]))
				self:下一页()
			elseif 事件 == "呔！你们竟敢将唐王和玄奘大师掳走，看招！" then
				引擎.副本战斗(self.放载事件[2],self.放载事件[3],self.放载事件[4])
			elseif 事件 == "放了唐王和玄奘法师！" then
				引擎.副本战斗(self.放载事件[3],self.放载事件[4],self.放载事件[5])
			elseif 事件 == "是的我要去" then
				if self.放载事件[2] == "水陆大会" then
					tp.窗口.任务栏:删除("副本任务")
					tp.剧情开关.副本 = {"水陆大会",7,0,{0,0,0,0,0,0,0}}
					tp.剧情开关.禁止Npc = true
					tp.窗口.任务栏:添加("副本任务",format("唐王在妖魔巢穴深处，击杀路上的所有妖兵，救出唐王吧！\n#L/完成度：%d/9",tp.剧情开关.副本[4][1]))
					tp.场景:传送至(1211,54,91)
					tp.假人库:生成副本Npc()
				end
			-- 结束
			elseif 事件 == "送我回去吧" then
				tp.剧情开关.副本 = false
				tp.剧情开关.禁止Npc = false
				tp.剧情开关.进入副本 = false
				tp.场景:传送至(1001,336,217)
			else
				self.可视 = false
			end
		elseif self.放载事件[1] == "红尘试炼" then
			if self.放载事件[2] == nil then
				if self.放载事件[3] == nil then
					if 事件 == "红尘试炼" then
						self.关闭事件 = true
						if self.附加事件[2] ~= nil then
							loadstring(self.附加事件[2])()
						end
						tp:获取任务对话(tp.红尘试炼[1],tp.红尘试炼[2],self.放载事件[4])
						self:下一页()
					elseif 事件 == "我要做其他事情" then
						self.关闭事件 = true
						tp:对话事件(当前地图,self.附加事件[1],nil,true)
						self:下一页()
					elseif 事件 == "发起攻击（战斗）"or 事件 == "呜呜呜哇……（战斗）" or 事件 == "看我的厉害(战斗)！" or 事件 == "来就来，谁怕谁（战斗）" then -- 战斗
						self.关闭事件 = true
						tp:剧情战斗("红尘试炼",tp.红尘试炼[1],tp.红尘试炼[2])
						tp.红尘试炼[2] = tp.红尘试炼[2] - 1
						self:下一页()
					elseif 事件 == "在准备一下" or 事件 == "唔唔唔。" or 事件 == "不要烦我。" or 事件 == "冷静！冷静一下！" then -- 减少进度
						self.关闭事件 = true
						tp.红尘试炼[2] = tp.红尘试炼[2] - 1
						self:下一页()
					elseif 事件 == "这事情很紧急，告诉他情况" then -- 衔接对话
						self.关闭事件 = true
						tp.红尘试炼[2] = tp.红尘试炼[2] + 1
						tp:获取任务对话(tp.红尘试炼[1],tp.红尘试炼[2])
						self:下一页()
					else
						self.可视 = false
					end
				else
					if 事件 == "我再想想" then
						self.可视 = false
					else
						self.关闭事件 = true
						loadstring(self.放载事件[3])()
						tp:领取任务(tp.红尘试炼[1],tp.红尘试炼[2])
						self:下一页()
					end
				end
			else
				if 事件 == "确定" then
					if tp.队伍[1].等级 >= self.放载事件[2] then
						if tp.窗口.任务栏:是否有该任务(self.放载事件[3]) then
							self.关闭事件 = true
							self:文本("女人_灵鼠娃娃",nil,"不能重复领取任务哦")
							self:下一页()
						else
							if tp.红尘试炼 ~= nil then
								self.关闭事件 = true
								self:文本("女人_灵鼠娃娃",nil,"已经领取了一个红尘试炼任务了，不能重复领取")
								self:下一页()
							else
								self.关闭事件 = true
								tp.红尘试炼 = {self.放载事件[3],1}
						   		tp:领取任务(self.放载事件[3],1)
						   		self:下一页()
						   	end
					    end
					else
						self.关闭事件 = true
						self:文本("女人_灵鼠娃娃",nil,"你的等级不够，无法领取任务")
						self:下一页()
					end
				else
					self.可视 = false
				end
			end
		else
	   		self.可视 = false
		end
	end
end

return 场景类_对话栏