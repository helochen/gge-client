local 场景类_帮派查看类 = class()
local insert = table.insert
local tp
local mousea = 引擎.鼠标按住
local mouseb = 引擎.鼠标弹起
local bw = require("gge包围盒")(0,0,240,22)
local box = 引擎.画矩形
local qjn = 引擎.取技能
local 帮派建筑升级经验 = {
  [0]=1600,
  [1]=1600,
  [2]=3200,
  [3]=5200,
  [4]=7500,
  [5]=10300,
  [6]=13600,
  [7]=17900,
  [8]=23100,
  [9]=29500,
  [10]=37200,
  [11]=46600,
  [12]=57800,
  [13]=71100,
  [14]=86700,
  [15]=104900,
  [16]=128000
}

function 场景类_帮派查看类:初始化(根)
	self.ID = 50
	self.x = 0
	self.y = 0
	self.xx = 0
	self.yy = 0
	self.注释 = "帮派查看类"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	self.本类进程 = 1
	tp = 根
	zts = tp.字体表.普通字体___
	zts2 = tp.字体表.普通字体__
	zts1 = tp.字体表.描边字体
	self.窗口时间 = 0
	self.加入 = 0
	self.加入1 = 0
	self.加入2 = 0
	self.选中 = 0
	self.选中1 = 0
	self.选中2 = 0
	self.选中3 = 0
	self.选中4 = 0
	self.选中5 = 0
	self.丰富文本 =  require("script/系统类/丰富文本")(540,65)
	self.技能丰富文本 =  require("script/系统类/丰富文本")(210,100)
end

function 场景类_帮派查看类:打开(数据,开关)

	if self.可视 and 开关 == nil then
		self.可视 = false
		self.帮派数据 = nil
		self.本类进程 = 1
		self.加入 = 0
		self.加入1 = 0
		self.加入2 = 0
		self.选中 = 0
		self.选中1 = 0
		self.选中2 = 0
		self.选中3 = 0
		self.选中4 = 0
		self.选中5 = 0
		self.资源组 = nil
		self.丰富文本:清空()
		return
	else
		insert(tp.窗口_,self)
		if self.资源组 == nil or self.资源组[1] == nil then
			local 资源 = tp.资源
			local 按钮 = tp._按钮
			local 自适应 = tp._自适应
			self.资源组 = {
				[1] = 资源:载入('wzife.wd5',"网易WDF动画",0x00000002), --帮派基础
				[2] = 资源:载入('wzife.wd5',"网易WDF动画",0x00000004), --成员管理
				[3] = 资源:载入('wzife.wd5',"网易WDF动画",0x00000003), --统计管理
				[4] = 资源:载入('wzife.wd5',"网易WDF动画",0x00000005), --技能管理
				[5] = 资源:载入('wzife.wd5',"网易WDF动画",0x00000006), --建筑管理
				[6] = 按钮.创建(自适应.创建(12,4,55,22,1,3),0,0,4,true,true,"基础"),
				[7] = 按钮.创建(自适应.创建(12,4,55,22,1,3),0,0,4,true,true,"成员"),
				[8] = 按钮.创建(自适应.创建(12,4,55,22,1,3),0,0,4,true,true,"统计"),
				[9] = 按钮.创建(自适应.创建(12,4,55,22,1,3),0,0,4,true,true,"技能"),
				[10] = 按钮.创建(自适应.创建(12,4,55,22,1,3),0,0,4,true,true,"建筑"),
				[11] = 按钮.创建(自适应.创建(12,4,55,22,1,3),0,0,4,true,true,"关闭"),
				[12] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),
				[13] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"修改公告"),
				[14] = 按钮.创建(自适应.创建(20,4,18,19,4,3),0,0,4,true,true),--上滚动
				[15] = 按钮.创建(自适应.创建(21,4,18,19,4,3),0,0,4,true,true),--下滚动
				[16] =  tp._滑块.创建(自适应.创建(11,4,15,40,2,3,nil),4,14,195,2),
				[17] = 按钮.创建(自适应.创建(12,4,72,20,1,3),0,0,4,true,true,"逐出帮派"),
				[18] = 按钮.创建(自适应.创建(12,4,72,20,1,3),0,0,4,true,true,"修改职务"),
				[19] = 按钮.创建(自适应.创建(12,4,72,20,1,3),0,0,4,true,true,"批准入帮"),
				[20] = 按钮.创建(自适应.创建(12,4,72,20,1,3),0,0,4,true,true,"退出帮派"),
				[21] = 按钮.创建(自适应.创建(20,4,18,19,4,3),0,0,4,true,true),--上滚动
				[22] = 按钮.创建(自适应.创建(21,4,18,19,4,3),0,0,4,true,true),--下滚动
				[23] = 按钮.创建(自适应.创建(12,4,72,20,1,3),0,0,4,true,true,"修改宗旨"),
				[24] = 按钮.创建(自适应.创建(20,4,18,19,4,3),0,0,4,true,true),--上滚动
				[25] = 按钮.创建(自适应.创建(21,4,18,19,4,3),0,0,4,true,true),--下滚动
				[26] = 按钮.创建(自适应.创建(12,4,72,20,1,3),0,0,4,true,true,"研究技能"),
				[27] = 按钮.创建(自适应.创建(12,4,72,20,1,3),0,0,4,true,true,"提升等级"),
				[28] = 按钮.创建(自适应.创建(12,4,55,22,1,3),0,0,4,true,true,"研究"),
				[29] = 按钮.创建(自适应.创建(12,4,72,20,1,3),0,0,4,true,true,"提升规模"),
			}
			for n=6,22 do
			    self.资源组[n]:绑定窗口_(50)
			end
		end
	    self.选中 = 0
	    self.选中5 = 0
	    self.帮派数据 = 数据[1]
	    self.帮众数据 = {}
	    self.申请数据 = self.帮派数据.申请数据
	    for i ,v in pairs(self.帮派数据.成员数据) do
	    	if self.帮派数据.成员数据[i].职务 == "帮主" then
	        	table.insert(self.帮众数据, 1, self.帮派数据.成员数据[i])
	        elseif self.帮派数据.成员数据[i].职务 == "副帮主" then
	        	for n=1,2 do
	     			if self.帮众数据[n] == nil or (self.帮众数据[n].职务 ~= "帮主") then
	        	    	table.insert(self.帮众数据, n, self.帮派数据.成员数据[i])
	        	    	break
	        	    end
	        	end
	        elseif self.帮派数据.成员数据[i].职务 == "左护法" then
	        	for n=1,3 do
	     			if self.帮众数据[n] == nil or (self.帮众数据[n].职务 ~= "帮主" and self.帮众数据[n].职务 ~= "副帮主" ) then
	        	    	table.insert(self.帮众数据, n, self.帮派数据.成员数据[i])
	        	    	break
	        	    end
	        	end
	        elseif self.帮派数据.成员数据[i].职务 == "右护法" then
	        	for n=1,4 do
	     			if self.帮众数据[n] == nil or (self.帮众数据[n].职务 ~= "帮主" and self.帮众数据[n].职务 ~= "副帮主" and self.帮众数据[n].职务 ~= "左护法" ) then
	        	    	table.insert(self.帮众数据, n, self.帮派数据.成员数据[i])
	        	    	break
	        	    end
	        	end
	        elseif self.帮派数据.成员数据[i].职务 == "长老" then
	        	for n=1,5 do
	        	    if self.帮众数据[n] == nil or (self.帮众数据[n].职务 ~= "帮主" and self.帮众数据[n].职务 ~= "副帮主" and self.帮众数据[n].职务 ~= "左护法" and self.帮众数据[n].职务 ~= "右护法") then
	        	    	table.insert(self.帮众数据, n, self.帮派数据.成员数据[i])
	        	    	break
	        	    end
	        	end
	        elseif self.帮派数据.成员数据[i].职务 == "堂主" then
	        	for n=1,8 do
	        	    if self.帮众数据[n] == nil or (self.帮众数据[n].职务 ~= "帮主" and self.帮众数据[n].职务 ~= "副帮主" and self.帮众数据[n].职务 ~= "左护法" and self.帮众数据[n].职务 ~= "右护法" and self.帮众数据[n].职务 ~= "长老")then
	        	    	table.insert(self.帮众数据, n, self.帮派数据.成员数据[i])
	        	    	break
	        	    end
	        	end
	        else
	        	table.insert(self.帮众数据, self.帮派数据.成员数据[i])
	        end
	    end
	    self.帮派权限 = tp.队伍[1].帮派数据.权限
		self.丰富文本:清空()
		self.丰富文本:添加文本("    #Y/"..self.帮派数据.帮派宗旨)
	    tp.运行时间 = tp.运行时间 + 1
	    self.窗口时间 = tp.运行时间
	    self.可视 = true
	    self.帮派技能 = {}
	    for n,v in pairs(self.帮派数据.技能数据) do
	    	self.帮派技能[#self.帮派技能+1] = self.帮派数据.技能数据[n]
	    	self.帮派技能[#self.帮派技能].名称 = n
	    end
	    self.修炼技能 = {}
	    for n,v in pairs(self.帮派数据.修炼数据) do
	    	if n =="攻击修炼" then
	    		self.修炼技能[1] = self.帮派数据.修炼数据[n]
	    		self.修炼技能[1].名称 = n
	    	elseif n == "防御修炼" then
	    		self.修炼技能[2] = self.帮派数据.修炼数据[n]
	    		self.修炼技能[2].名称 = n
	    	elseif n == "法术修炼" then
	    		self.修炼技能[3] = self.帮派数据.修炼数据[n]
	    		self.修炼技能[3].名称 = n
	    	elseif n == "法抗修炼" then
	    		self.修炼技能[4] = self.帮派数据.修炼数据[n]
	    		self.修炼技能[4].名称 = n
	    	end
	    end
	    self.帮派建筑 = {}
	    for n,v in pairs(self.帮派数据.帮派建筑) do
	    	self.帮派建筑[#self.帮派建筑+1] = self.帮派数据.帮派建筑[n]
	    	self.帮派建筑[#self.帮派建筑].名称 = n
	    end
	end
end

function 场景类_帮派查看类:权限判断()
	if self.选中 == 0 then
		return false
	end
	if self.帮派权限 == 5 then
		if self.帮众数据[self.选中].职务 ~= "帮主"  then
			return true
		else
			return false
		end
	elseif self.帮派权限 == 4 then
		if self.帮众数据[self.选中].职务 ~= "帮主"  then
			return true
		else
			return false
		end
	elseif self.帮派权限 == 3 then
		if self.帮众数据[self.选中].职务 ~= "帮主" and self.帮众数据[self.选中].职务 ~= "副帮主" then
			return true
		else
			return false
		end
	elseif self.帮派权限 == 2 then
		if self.帮众数据[self.选中].职务 ~= "帮主" and self.帮众数据[self.选中].职务 ~= "副帮主"  and self.帮众数据[self.选中].职务 ~= "左护法" and self.帮众数据[self.选中].职务 ~= "右护法" then
			return true
		else
			return false
		end
	elseif self.帮派权限 == 1 then
		if self.帮众数据[self.选中].职务 ~= "堂主" or self.帮众数据[self.选中].职务 == "帮众"   then
			return true
		else
			return false
		end
	else
		return false
	end
end

function 场景类_帮派查看类:显示(dt,x,y)
	self.焦点 = false
	self.资源组[6]:更新(x,y,self.本类进程 ~= 1)
	self.资源组[7]:更新(x,y,self.本类进程 ~= 2)
	self.资源组[8]:更新(x,y,self.本类进程 ~= 3)
	self.资源组[9]:更新(x,y,self.本类进程 ~= 4)
	self.资源组[10]:更新(x,y,self.本类进程 ~= 5)
	self.资源组[11]:更新(x,y)
	self.资源组[12]:更新(x,y)
	self.资源组[13]:更新(x,y)
	if self.资源组[6]:事件判断() then
		self.本类进程 = 1
	elseif self.资源组[7]:事件判断() then
		self.本类进程 = 2
	elseif self.资源组[8]:事件判断() then
		self.本类进程 = 3
	elseif self.资源组[9]:事件判断() then
		self.本类进程 = 4
	elseif self.资源组[10]:事件判断() then
		self.本类进程 = 5
	elseif self.资源组[11]:事件判断() or self.资源组[12]:事件判断() then
		self:打开()
		return 0
	elseif self.资源组[13]:事件判断() then
		发送数据(6103)
	elseif self.资源组[23]:事件判断() then
		tp.窗口.组合输入框:打开("帮派宗旨",{"请输入你要修改的帮派宗旨",ARGB(255,255,255,0)})
	end
	if self.本类进程 == 1 then
		self.资源组[1]:显示(self.x+120,self.y+100)
		self.资源组[23]:更新(x,y,self.帮派权限>=4)--逐出帮派
		self.资源组[23]:显示(self.x+630,self.y+428)
		zts:显示(self.x+232,self.y+160,self.帮派数据.帮派名称)
		zts:显示(self.x+452,self.y+160,self.帮派数据.帮派编号)
		zts:显示(self.x+674,self.y+160,self.帮派数据.帮派规模)

		zts:显示(self.x+232,self.y+185,self.帮派数据.创始人.名称)
		zts:显示(self.x+452,self.y+185,self.帮派数据.成员数量.当前.."/"..self.帮派数据.成员数量.上限)
		zts:显示(self.x+674,self.y+185,self.帮派数据.繁荣度)

		zts:显示(self.x+232,self.y+210,self.帮派数据.现任帮主.名称)
		zts:显示(self.x+452,self.y+210,self.帮派数据.掌控区域)
		zts:显示(self.x+674,self.y+210,self.帮派数据.研究力)

		zts:显示(self.x+232,self.y+235,self.帮派数据.帮派资金.当前)
		zts:显示(self.x+452,self.y+235,self.帮派数据.管辖社区)
		zts:显示(self.x+674,self.y+235,self.帮派数据.安定度)

		zts:显示(self.x+232,self.y+260,self.帮派数据.储备金)
		zts:显示(self.x+452,self.y+260,self.帮派数据.训练力)
		zts:显示(self.x+674,self.y+260,self.帮派数据.人气度)

		zts:显示(self.x+232,self.y+285,self.帮派数据.同盟帮派)
		zts:显示(self.x+452,self.y+285,self.帮派数据.敌对帮派)
		zts:显示(self.x+674,self.y+285,self.帮派数据.行动力)

		self.丰富文本:显示(self.x+154,self.y+352)
	elseif self.本类进程 == 2 then
		local 帮众总数 = #self.帮众数据  --14
		self.资源组[2]:显示(self.x+119,self.y+98)
		-- tp.画线:置区域(0,0,15,200)--滑块虚线
		-- tp.画线:显示(self.x+398,self.y+190)
		-- if 帮众总数 > 9 then
		-- 	self.资源组[16]:置高度(math.min(math.floor(195/(帮众总数-9)),154))
		-- 	self.加入 = math.min(math.ceil((帮众总数-9)*self.资源组[16]:取百分比()),帮众总数-9)
		-- end
		self.资源组[14]:更新(x,y,self.加入 > 0)
		self.资源组[15]:更新(x,y,self.加入 < 帮众总数-9)
		self.资源组[14]:显示(self.x+394,self.y+172)
		self.资源组[15]:显示(self.x+394,self.y+385)

		self.资源组[17]:更新(x,y,self.帮派权限>=2 and self.选中 ~=0)--逐出帮派
		self.资源组[18]:更新(x,y,self:权限判断())--修改职务
		self.资源组[19]:更新(x,y,self.帮派权限>=1 and self.选中1 ~=0 )--批准入帮
		self.资源组[20]:更新(x,y,self.帮派权限==0)--退出帮派

		self.资源组[17]:显示(self.x+586,self.y+254)--逐出帮派
		self.资源组[18]:显示(self.x+658,self.y+254)--修改职务
		self.资源组[19]:显示(self.x+586,self.y+428)--批准入帮
		self.资源组[20]:显示(self.x+658,self.y+428)--退出帮派

		zts1:显示(self.x+520,self.y+278,"申请入帮数据")
		zts2:显示(self.x+460,self.y+305,"名称             等级        门派")
		for i=1,9 do
			if self.帮众数据[i+self.加入] ~= nil then
				bw:置坐标(self.x+160,self.y+180+i*22)
				if self.选中 ~= self.加入 + i then
					if bw:检查点(x,y) then  --375 110
						box(self.x + 150,self.y + 179 + i * 22,self.x + 388,self.y + 198 + i * 22,-3551379)
						if mouseb(0) then
							if self.选中1 ~= 0 then
								self.选中1 = 0
							end
							self.选中 = self.加入 + i
						end
					end
				else
					box(self.x + 150,self.y + 179 + i * 22,self.x + 388,self.y + 198 + i * 22,-9670988)
				end
				if self.帮众数据[i+self.加入].在线 == nil or self.帮众数据[i+self.加入].在线 then
					zts:置颜色(绿色)
					zts:显示(self.x+160,self.y+180+i*22,self.帮众数据[i+self.加入].名称)
					zts:显示(self.x+280,self.y+180+i*22,self.帮众数据[i+self.加入].职务)
				else
					zts:显示(self.x+160,self.y+180+i*22,self.帮众数据[i+self.加入].名称)
					zts:显示(self.x+280,self.y+180+i*22,self.帮众数据[i+self.加入].职务)
				end
				zts:置颜色(黑色)
			end
		end
		if self.选中 ~= 0 then
			zts:显示(self.x+480,self.y+164,self.帮众数据[self.选中].名称)
			zts:显示(self.x+656,self.y+164,self.帮众数据[self.选中].门派)
			zts:显示(self.x+480,self.y+187,self.帮众数据[self.选中].id)
			zts:显示(self.x+656,self.y+187,self.帮众数据[self.选中].等级)
			zts:显示(self.x+480,self.y+210,self.帮众数据[self.选中].称谓)
			zts:显示(self.x+656,self.y+210,self.帮众数据[self.选中].所属)
			zts:显示(self.x+480,self.y+232,os.date("%Y", self.帮众数据[self.选中].入帮时间).. "年"..os.date("%m", self.帮众数据[self.选中].入帮时间).. "月" .. os.date("%d", self.帮众数据[self.选中].入帮时间).."日")
			zts:显示(self.x+656,self.y+232,os.date("%m", self.帮众数据[self.选中].离线时间).. "月" .. os.date("%d", self.帮众数据[self.选中].离线时间).."日")--os.date("%m", self.帮众数据[self.选中].入帮时间) .. "/" .. os.date("%d", self.帮众数据[self.选中].入帮时间) .. " " .. os.date("%X", self.帮众数据[self.选中].入帮时间)
			zts:显示(self.x+480,self.y+255,self.帮众数据[self.选中].帮贡.当前)
		end

		-- if 帮众总数 >9 then
		-- 	self.资源组[16]:显示(self.x+395,self.y+190,x,y,self.鼠标)
		-- end
		-- if self.资源组[16].接触  then
		-- 	self.焦点 = true
		-- end

		local 申请总数 = #self.申请数据  --14
		-- tp.画线:置区域(0,0,15,90)--滑块虚线
		-- tp.画线:显示(self.x+706,self.y+320)
		self.资源组[21]:更新(x,y,self.加入1 > 0)
		self.资源组[22]:更新(x,y,self.加入1 < 申请总数-3)
		self.资源组[21]:显示(self.x+702,self.y+300)
		self.资源组[22]:显示(self.x+702,self.y+405)
		-- if 申请总数 > 3 then
		-- 	self.资源组[23]:置高度(math.min(math.floor(90/(申请总数-3)),104))
		-- 	self.加入1 = math.min(math.ceil((申请总数-3)*self.资源组[23]:取百分比()),申请总数-3)
		-- end

		for i =1,3 do
		    if self.申请数据 ~= nil and self.申请数据[i+self.加入1] ~= nil then
		    	bw:置坐标(self.x+440,self.y+310+i*22)
				if self.选中1 ~= self.加入1 + i then
					if bw:检查点(x,y) then  --375 110
						box(self.x + 440,self.y + 310 + i * 22,self.x + 700,self.y + 326 + i * 22,-3551379)
						if mouseb(0) then
							if self.选中 ~= 0 then
								self.选中 = 0
							end
							self.选中1 = self.加入1 + i
						end
					end
				else
					box(self.x + 440,self.y + 310 + i * 22,self.x + 700,self.y + 326 + i * 22,-9670988)
				end
				zts:显示(self.x+440,self.y+310+i*22,self.申请数据[i+self.加入1].名称)
				zts:显示(self.x+568,self.y+310+i*22,self.申请数据[i+self.加入1].等级)
				zts:显示(self.x+620,self.y+310+i*22,self.申请数据[i+self.加入1].门派)
		    end
		end

		-- if 申请总数 >3 then
		-- 	self.资源组[23]:显示(self.x+703,self.y+317,x,y,self.鼠标)
		-- end
		if self.资源组[19]:事件判断() then
			if self.选中1 == 0 then
				tp.提示:写入("#Y/请选择你要批准的玩家!")
			else
				发送数据(6104,{玩家序号=self.选中1})
				table.remove(self.申请数据,self.选中1)
				self.选中1 = 0
				self.加入1 = 0
			end
		elseif self.资源组[17]:事件判断() then
			if self.选中 == 0 then
				tp.提示:写入("#Y/请选择你要逐出的玩家!")
			elseif self.帮众数据[self.选中].职务 ~= "帮众" then
				tp.提示:写入("#Y/请解除该玩家的职务后再次尝试!")
			else
				发送数据(6106,{玩家id=self.帮众数据[self.选中].id})
				self.选中 = 0
				self.加入 = 0
			end
		elseif self.资源组[20]:事件判断() then
			if tp.队伍[1].帮派数据.权限+0 ~= 0 then
				tp.提示:写入("#Y/你身兼帮派要职无法主动离开帮派!")
			else
				发送数据(6107)
				self:打开()
				return 0
			end
		elseif self.资源组[18]:事件判断() then
			if self.选中 == 0 then
				tp.提示:写入("#Y/请选择你要任命的玩家!")
			else
				local 选项信息 = {}
				if self.帮派权限 >= 5 then
					选项信息 = {"帮主","副帮主","左护法","右护法","长老","堂主","帮众","商人"}
				elseif self.帮派权限 >= 4 then
					选项信息 = {"左护法","右护法","长老","堂主","帮众","商人"}
				elseif self.帮派权限 >=3 then
					选项信息 = {"长老","堂主","帮众","商人"}
				elseif self.帮派权限 >=2 then
					选项信息 = {"堂主","帮众","商人"}
				else
				    选项信息 = {"帮众"}
				end
				self.选中5 = self.选中
				tp.窗口.对话栏:文本("男人_兰虎","帮派总管","请选中您要任命的职位",选项信息)
			end
		end
		-- if self.资源组[23].接触 then
		-- 	self.焦点 = true
		-- end
		if self.资源组[14]:事件判断() then
			if self.加入 >0 then
				self.加入 = self.加入 -1
			end
		elseif self.资源组[15]:事件判断() then
			-- if self.加入 < 帮众总数-self.加入 then
				self.加入 = self.加入 + 1
			-- end
		elseif self.资源组[21]:事件判断() then
			if self.加入1 >0 then
				self.加入1 = self.加入1 -1
			end
		elseif self.资源组[22]:事件判断() then
			if 申请总数 > 3 and self.加入1 < 申请总数-self.加入1 then
				self.加入1 = self.加入1 + 1
			end
		end

	elseif self.本类进程 == 3 then
		self.资源组[3]:显示(self.x+120,self.y+99)
	elseif self.本类进程 == 4 then
		self.已操作 = false
		self.资源组[4]:显示(self.x+122,self.y+97)
		for i=1,4 do
			bw:置坐标(self.x+145,self.y+170+i*22)
			if self.选中2 ~= self.加入2 + i then
				if bw:检查点(x,y) then
					box(self.x + 142,self.y + 168 + i * 22,self.x + 450,self.y + 190 + i * 22,-3551379)
					if mouseb(0) then
						self.选中2 = self.加入2 + i
						if self.选中3 ~= 0 then
							self.选中3 = 0
						end
						if qjn(self.帮派技能[i+self.加入2].名称)[1]~= nil then
							self.技能丰富文本:清空()
							self.技能丰富文本:添加文本("#R/"..self.帮派技能[i+self.加入2].名称.."\n#Y/"..qjn(self.帮派技能[i+self.加入2].名称)[1])
						end
					end
				end
			else
				box(self.x + 142,self.y + 168 + i * 22,self.x + 450,self.y + 190 + i * 22,-9670988)
			end

			if self.帮派技能[i+self.加入2] ~= nil then
				zts:显示(self.x+145,self.y+170+i*22,self.帮派技能[i+self.加入2].名称)
				zts:显示(self.x+260,self.y+170+i*22,self.帮派技能[i+self.加入2].当前)
				zts:显示(self.x+335,self.y+170+i*22,self.帮派技能[i+self.加入2].上限)
			end

		end
		if self.选中2 ~= 0 then
			zts:显示(self.x+600,self.y+295,self.帮派技能[self.选中2].名称)
			zts:显示(self.x+600,self.y+330,帮派技能[self.帮派技能[self.选中2].当前+1])
			zts:显示(self.x+600,self.y+365,self.帮派技能[self.选中2].当前经验)
		end
		self.资源组[24]:更新(x,y,self.加入2 > 0)
		self.资源组[25]:更新(x,y,self.加入2 < 12)
		self.资源组[24]:显示(self.x+460,self.y+185)
		self.资源组[25]:显示(self.x+460,self.y+265)

		if self.资源组[24]:事件判断() then
			if self.加入2 >0 then
				self.加入2 = self.加入2 -1
			end
		elseif self.资源组[25]:事件判断() then
			if self.加入2 < 12 then
				self.加入2 = self.加入2 + 1
			end
		end

		---------------------------------------------------------------- 修炼
		for i=1,4 do
			bw:置坐标(self.x+145,self.y+300+i*25)
			if self.选中3 ~= i then
				if bw:检查点(x,y) then
					box(self.x + 142,self.y + 295 + i * 25,self.x + 450,self.y + 320 + i * 25,-3551379)
					if mouseb(0) then
						self.选中3 = i
						if self.选中2 ~= 0 then
							self.选中2 = 0
						end
						if qjn(self.修炼技能[i].名称)[1]~= nil then
							self.技能丰富文本:清空()
							self.技能丰富文本:添加文本("#R/"..self.修炼技能[i].名称.."\n#Y/"..qjn(self.修炼技能[i].名称)[1])
						end
					end
				end
			else
				box(self.x + 142,self.y + 295 + i * 25,self.x + 450,self.y + 320 + i * 25,-9670988)
			end
			zts:显示(self.x+145,self.y+300+i*25,self.修炼技能[i].名称)
			zts:显示(self.x+260,self.y+300+i*25,self.修炼技能[i].当前)
			zts:显示(self.x+335,self.y+300+i*25,self.修炼技能[i].上限)
		end
		if self.选中3 ~= 0 then
			zts:显示(self.x+600,self.y+295,self.修炼技能[self.选中3].名称)
			zts:显示(self.x+600,self.y+330,帮派修炼[self.修炼技能[self.选中3].当前+1])
			zts:显示(self.x+600,self.y+365,self.修炼技能[self.选中3].当前经验)
		end
		self.资源组[26]:更新(x,y,self.帮派权限>=4 and (self.选中2 ~= 0 or self.选中3 ~= 0))
		self.资源组[27]:更新(x,y,self.帮派权限>=4 and (self.选中2 ~= 0 or self.选中3 ~= 0))

		self.资源组[26]:显示(self.x+510,self.y+395)
		self.资源组[27]:显示(self.x+620,self.y+395)

		if self.资源组[26]:事件判断()then --研究技能
			if self.选中3 == 0 then
				发送数据(6108,{名称=self.帮派技能[self.选中2].名称})
			else
				发送数据(6109,{名称=self.修炼技能[self.选中3].名称})
			end
		elseif self.资源组[27]:事件判断() then --提升技能
			if self.选中3 == 0 then
				发送数据(6110,{名称=self.帮派技能[self.选中2].名称})
			else
				发送数据(6111,{名称=self.修炼技能[self.选中3].名称})
			end
		end
		self.技能丰富文本:显示(self.x+510,self.y+170)
	elseif self.本类进程 == 5 then
		self.资源组[5]:显示(self.x+120,self.y+99)
		self.资源组[28]:更新(x,y,self.帮派权限>=4 and self.选中4 ~= 0)
		self.资源组[29]:更新(x,y,self.帮派权限>=4 and self.选中4 ~= 0)
		self.资源组[28]:显示(self.x+325,self.y+395)
		self.资源组[29]:显示(self.x+410,self.y+395)


		zts:显示(self.x+240,self.y+165,self.帮派数据.帮派建筑.金库.数量)
		zts:显示(self.x+240,self.y+193,self.帮派数据.帮派建筑.书院.数量)
		zts:显示(self.x+240,self.y+221,self.帮派数据.帮派建筑.兽室.数量)

		zts:显示(self.x+240,self.y+250,self.帮派数据.帮派建筑.厢房.数量)
		zts:显示(self.x+240,self.y+280,self.帮派数据.帮派建筑.药房.数量)
		zts:显示(self.x+240,self.y+310,self.帮派数据.帮派建筑.仓库.数量)

		zts:显示(self.x+240,self.y+340,self.帮派数据.帮派资材.当前)
		zts:显示(self.x+240,self.y+370,self.帮派数据.帮派资材.上限)
		zts:显示(self.x+240,self.y+400,self.帮派数据.药品增加量)

		zts:显示(self.x+430,self.y+165,self.帮派数据.物价指数)
		zts:显示(self.x+430,self.y+193,self.帮派数据.修理指数	)
		zts:显示(self.x+430,self.y+221,self.帮派数据.守护兽等级)

		zts:显示(self.x+430,self.y+250,self.帮派数据.帮派迷宫)
		zts:显示(self.x+430,self.y+280,self.帮派数据.当前内政)
		zts:显示(self.x+430,self.y+340,self.帮派数据.当前维护费)
		zts:显示(self.x+430,self.y+370,self.帮派数据.维护时间)



		for i=1,6 do
			bw:置坐标(self.x+550,self.y+143+i*22)
			if self.选中4 ~= i then
				if bw:检查点(x,y) then
					box(self.x + 530,self.y + 143 + i * 22,self.x + 710,self.y + 165 + i * 22,-3551379)
					if mouseb(0) then
						self.选中4 = i
					end
				end
			else
				box(self.x + 530,self.y + 143 + i * 22,self.x + 710,self.y + 165 + i * 22,-9670988)
				zts:显示(self.x+650,self.y+312,0)
				zts:显示(self.x+650,self.y+340,帮派建筑升级经验[self.帮派数据.帮派建筑[self.帮派建筑[self.选中4].名称].数量])
				zts:显示(self.x+650,self.y+368,0)
				zts:显示(self.x+650,self.y+396,0)
			end
			if self.帮派建筑[i] ~= nil then
				zts:显示(self.x+540,self.y+145+i*22,self.帮派建筑[i].名称)
			end
		end

		if self.资源组[28]:事件判断() then
			if self.选中4 == 0 then
				tp.提示:写入("#Y/请选择你要选择的建筑!")
			else
				发送数据(6112,{名称=self.帮派建筑[self.选中4].名称})
				self.选中4 = 0
			end
		elseif self.资源组[29]:事件判断() then
				发送数据(6113)
		end
	end

	self.资源组[6]:显示(self.x+136,self.y+127) --34
	self.资源组[7]:显示(self.x+207,self.y+127)
	self.资源组[8]:显示(self.x+277,self.y+127)
	self.资源组[9]:显示(self.x+346,self.y+127)
	self.资源组[10]:显示(self.x+417,self.y+127)
	self.资源组[11]:显示(self.x+391,self.y+428)
	self.资源组[12]:显示(self.x+718,self.y+103)
end

function 场景类_帮派查看类:检查点(x,y)
	if self.可视 and self.资源组 ~= nil and self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 场景类_帮派查看类:初始移动(x,y)
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

function 场景类_帮派查看类:开始移动(x,y)
	if self.可视 and self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 场景类_帮派查看类