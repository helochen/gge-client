
local 战斗动画类 = class()
local qmsx = 引擎.取战斗模型
local ptmx = 引擎.取模型
local 动作={"待战","跑去","防御","攻击","挨打","返回","死亡","施法"}
local qzdjy = 引擎.取锦衣模型
local qzdjys = 取锦衣身体模型
local 偏移x,偏移y = 0,0
function 战斗动画类:初始化()

end

function 战斗动画类:创建动画(模型,类型,染色方案,染色组,变异,武器,变身,饰品,锦衣,武器染色方案,武器染色组,变身套)
	local 动画资源 = tp.资源
	local 模型 = 模型
	if 变身~=nil and 变身显示 then
		类型=1
		模型=变身
		if 变异 then
		    染色方案 = 染色信息[模型].id
			染色组 = 染色信息[模型].方案
		else
			染色方案 = nil
			染色组 = nil
		end
	end
	if  变身套 ~= nil then
		if 变身套 ~= 0 and 变身套 ~= "0" then
			模型 = 变身套
		end
	end
	local zl=""
	if 类型=="角色" or 类型=="系统角色" then
		if 武器 ~= nil and 变身套 == 0 then
			if 武器.名称 == "龙鸣寒水" or 武器.名称 == "非攻" then
				zl = "弓弩1"
			else
				zl = tp:取武器子类(武器.子类)
			end
		end
	    self.行为 = "待战"
	    self.状态行为 = "待战"
	    if 锦衣 ~= nil and 锦衣[1]~= nil and (锦衣[1].名称 == "夜影" or  锦衣[1].名称 == "夏日清凉" or 锦衣[1].名称 == "华风汉雅" or 锦衣[1].名称 == "萌萌小厨") then
	    	local v = zl
	    	if v == "弓弩1" then
	    		v = "弓弩"
	    	end
			local 临时资源包 = "shape0.npk"
			if 锦衣[1].名称 == "华风汉雅" or 锦衣[1].名称 == "萌萌小厨" then
				临时资源包 = "shape2.npk"
			end
    		local n = qmsx(模型)
		    if zl ~= "" and zl ~= true then
			    n = qmsx(模型,zl)
		    end
		    local zy = n[10]
			self.动画 = {}
			self.动画.待战 = tp.资源:载入(临时资源包,"网易锦衣动画",qzdjy(模型..v.."_静立_"..锦衣[1].名称))
		    self.动画.跑去 = tp.资源:载入(临时资源包,"网易锦衣动画",qzdjy(模型..v.."_跑去_"..锦衣[1].名称))
		    self.动画.防御 = tp.资源:载入(临时资源包,"网易锦衣动画",qzdjy(模型..v.."_防御_"..锦衣[1].名称))
		    self.动画.攻击 = tp.资源:载入(临时资源包,"网易锦衣动画",qzdjy(模型..v.."_攻击_"..锦衣[1].名称))
		    self.动画.挨打 = tp.资源:载入(临时资源包,"网易锦衣动画",qzdjy(模型..v.."_被击中_"..锦衣[1].名称))
		    self.动画.返回 = tp.资源:载入(临时资源包,"网易锦衣动画",qzdjy(模型..v.."_返回_"..锦衣[1].名称))
		    self.动画.死亡 = tp.资源:载入(临时资源包,"网易锦衣动画",qzdjy(模型..v.."_倒地_"..锦衣[1].名称))
		    self.动画.施法 = tp.资源:载入(临时资源包,"网易锦衣动画",qzdjy(模型..v.."_施法_"..锦衣[1].名称))
		    self.动画.静立 = tp.资源:载入(临时资源包,"网易锦衣动画",qzdjy(模型..v.."_静立_"..锦衣[1].名称))
			if 锦衣[1].名称 == "夏日清凉" or 锦衣[1].名称 == "华风汉雅" or 锦衣[1].名称 == "萌萌小厨" then
				self.身体动画 = {}
				self.身体动画.待战 = tp.资源:载入("shape0.npk","网易锦衣动画",qzdjys(模型..v.."_静立_"..锦衣[1].名称.."_头"))
			    self.身体动画.跑去 = tp.资源:载入("shape0.npk","网易锦衣动画",qzdjys(模型..v.."_跑去_"..锦衣[1].名称.."_头"))
			    self.身体动画.防御 = tp.资源:载入("shape0.npk","网易锦衣动画",qzdjys(模型..v.."_防御_"..锦衣[1].名称.."_头"))
			    self.身体动画.攻击 = tp.资源:载入("shape0.npk","网易锦衣动画",qzdjys(模型..v.."_攻击_"..锦衣[1].名称.."_头"))
			    self.身体动画.挨打 = tp.资源:载入("shape0.npk","网易锦衣动画",qzdjys(模型..v.."_被击中_"..锦衣[1].名称.."_头"))
			    self.身体动画.返回 = tp.资源:载入("shape0.npk","网易锦衣动画",qzdjys(模型..v.."_返回_"..锦衣[1].名称.."_头"))
			    self.身体动画.死亡 = tp.资源:载入("shape0.npk","网易锦衣动画",qzdjys(模型..v.."_倒地_"..锦衣[1].名称.."_头"))
			    self.身体动画.施法 = tp.资源:载入("shape0.npk","网易锦衣动画",qzdjys(模型..v.."_施法_"..锦衣[1].名称.."_头"))
			    self.身体动画.静立 = tp.资源:载入("shape0.npk","网易锦衣动画",qzdjys(模型..v.."_静立_"..锦衣[1].名称.."_头"))
			end
			if 武器 ~= nil then
				self.武器={}
				local m = tp:取武器附加名称(武器.子类,武器.级别限制,武器.名称)
				w = qmsx(m.."_"..模型)
				self.音效模型 = 模型.."_"..zl
				if zl == "弓弩" or zl == "弓弩1" then
					self.攻击方式 = 1
				end
				if w[10] ~= nil then
					zy = w[10]
					self.武器.待战 = 动画资源:载入(ptmx(m.."_"..模型)[3],"网易WDF动画",ptmx(m.."_"..模型)[1])
					self.武器.跑去 = 动画资源:载入(zy,"网易WDF动画",w[8])
					self.武器.防御 = 动画资源:载入(zy,"网易WDF动画",w[4])
					self.武器.攻击 = 动画资源:载入(zy,"网易WDF动画",w[1])
					if 模型 == "鬼潇潇" then

					elseif 模型 == "偃无师" or 模型 == "桃夭夭" or 模型 == "狐美人" then

					elseif 模型 == "玄彩娥" then
						if zl == "飘带" then

						else

						end
					elseif 模型 == "舞天姬" then

					elseif 模型 == "虎头怪" or 模型 == "真陀护法" then

					elseif  模型 == "神天兵" or 模型 == "骨精灵"then
					    if zl == "枪矛" then

					   	else

					    end
					elseif  模型 == "巨魔王" then

					elseif  模型 == "杀破狼" or 模型 == "巫蛮儿" then

					elseif 模型 == "逍遥生"  then

					elseif 模型 == "剑侠客"  then
						if zl == "刀" then

						else
							偏移x = 5
							偏移y = -5
							self.终结帧 = 1
						end
					elseif 模型 == "英女侠"  then

					elseif 模型 == "飞燕女"  then

					elseif 模型 == "吸血鬼" then

					elseif 模型 == "天兵" then

					end
					self.武器.挨打 = 动画资源:载入(zy,"网易WDF动画",w[9])
					self.武器.返回 = 动画资源:载入(zy,"网易WDF动画",w[8])
					if w[3] ~= 0 then
						self.武器.死亡 = 动画资源:载入(zy,"网易WDF动画",w[3])
					end
					self.武器.施法 = 动画资源:载入(zy,"网易WDF动画",w[7])
					if self.开启饰品 then
						local ccc = ptmx(模型.."_饰品")
						self.武器.行走 = 动画资源:载入(ccc[3],"网易WDF动画",ccc[2])
					end
					-- table.print(武器)
					if 武器.染色方案~=0 and 武器.染色组~=0 and 武器.染色组~=nil and #武器.染色组>0 then
				        for n=1,#动作 do
			                self.武器[动作[n]]:置染色(武器.染色方案,武器.染色组[1],武器.染色组[2],武器.染色组[3])
			         	end
				    end
			        if 武器染色方案~=0 and 武器染色组~=0 and 武器染色组~=nil and #武器染色组>0 then
				        for n=1,#动作 do
			                self.武器[动作[n]]:置染色(武器染色方案,武器染色组[1],武器染色组[2],武器染色组[3])
			         	end
				    end
				end
		   	end
	    else
	     	local n = qmsx(模型)
		    if zl ~= "" and zl ~= true then
			    n = qmsx(模型,zl)
		    end
		    self.动画 = {}
		    local zy = n[10]

		    self.动画.待战 = 动画资源:载入(zy,"网易WDF动画",n[6])
		    self.动画.跑去 = 动画资源:载入(zy,"网易WDF动画",n[8])
		    self.动画.防御 = 动画资源:载入(zy,"网易WDF动画",n[4])
		    self.动画.攻击 = 动画资源:载入(zy,"网易WDF动画",n[1])
		    self.动画.挨打 = 动画资源:载入(zy,"网易WDF动画",n[9])
		    self.动画.返回 = 动画资源:载入(zy,"网易WDF动画",n[8])
		    self.动画.死亡 = 动画资源:载入(zy,"网易WDF动画",n[3])
		    self.动画.施法 = 动画资源:载入(zy,"网易WDF动画",n[7])
		    self.动画.静立 = 动画资源:载入(zy,"网易WDF动画",n[6])
		     self.动画.攻击特效 = 动画资源:载入(zy,"网易WDF动画",n[1.1])
		    self.动画.施法特效 = 动画资源:载入(zy,"网易WDF动画",n[1.2])
		    if 染色方案~=0 and 染色组~=0 and 染色组~=nil and #染色组>0 then
		        for n=1,#动作 do
	                self.动画[动作[n]]:置染色(染色方案,染色组[1],染色组[2],染色组[3])
	         	end
		    end
			if 武器 ~= nil and (变身套 == nil or 变身套 == 0 )then
				self.武器={}
				local m = tp:取武器附加名称(武器.子类,武器.级别限制,武器.名称)
				w = qmsx(m.."_"..模型)
				self.音效模型 = 模型.."_"..zl
				if zl == "弓弩" or zl == "弓弩1" then
					self.攻击方式 = 1
				end
				if w[10] ~= nil then
					zy = w[10]
					self.武器.待战 = 动画资源:载入(zy,"网易WDF动画",w[6])
					self.武器.跑去 = 动画资源:载入(zy,"网易WDF动画",w[8])
					self.武器.防御 = 动画资源:载入(zy,"网易WDF动画",w[4])
					self.武器.攻击 = 动画资源:载入(zy,"网易WDF动画",w[1])
					pysa = math.floor(self.武器.攻击:取宽度()/20)
					if 模型 == "鬼潇潇" then
						pysa = -15
					elseif 模型 == "偃无师" or 模型 == "桃夭夭" or 模型 == "狐美人" then
						pysa = 2
						pysy = 18
					elseif 模型 == "玄彩娥" then
						if zl == "飘带" then
							pysa = -2
						else
							pysa = 18
						end
					elseif 模型 == "舞天姬" then
						pysa = 9
					elseif 模型 == "虎头怪" or 模型 == "真陀护法" then
						pysa = 15
					elseif  模型 == "神天兵" or 模型 == "骨精灵"then
					    if zl == "枪矛" then
					    	pysa = 40
					   	else
					   		pysa = 20
					    end
					elseif  模型 == "巨魔王" then
					    pysa = 12
					elseif  模型 == "杀破狼" or 模型 == "巫蛮儿" then
					    pysa = 7
					elseif 模型 == "逍遥生"  then
						pysa = 15
						pysy = 32
					elseif 模型 == "剑侠客"  then
						if zl == "刀" then
							pysa = 60
							pysy = 12
						else
							pysa = 25
							self.终结帧 = 1
						end
					elseif 模型 == "英女侠"  then
						pysa = -5
					elseif 模型 == "飞燕女"  then
						pysa = 25
						pysy = 29
					elseif 模型 == "吸血鬼" then
						pysa = -15
					elseif 模型 == "天兵" then
						pysa = 6
						pysy = 10
					end
					self.武器.挨打 = 动画资源:载入(zy,"网易WDF动画",w[9])
					self.武器.返回 = 动画资源:载入(zy,"网易WDF动画",w[8])
					if w[3] ~= 0 then
						self.武器.死亡 = 动画资源:载入(zy,"网易WDF动画",w[3])
					end
					self.武器.施法 = 动画资源:载入(zy,"网易WDF动画",w[7])
					if self.开启饰品 then
						local ccc = ptmx(模型.."_饰品")
						self.武器.行走 = 动画资源:载入(ccc[3],"网易WDF动画",ccc[2])
					end
					if 武器.染色方案~=0 and 武器.染色组~=0 and 武器.染色组~=nil and #武器.染色组>0 then
				        for n=1,#动作 do
			                self.武器[动作[n]]:置染色(武器.染色方案,武器.染色组[1],武器.染色组[2],武器.染色组[3])
			         	end
				    end
				    if 武器染色方案~=0 and 武器染色组~=0 and 武器染色组~=nil and #武器染色组>0 then
				        for n=1,#动作 do
			                self.武器[动作[n]]:置染色(武器染色方案,武器染色组[1],武器染色组[2],武器染色组[3])
			         	end
				    end
				end
		   	end
		end
    else
    	if 模型=="贪狼" then
    		self.动画 = {}
    	    self.动画.待战 = pwd("53")
		    self.动画.静立 = pwd("53")
		    self.动画.跑去 = pwd("52")
		    self.动画.防御 = pwd("53")
		    self.动画.攻击 = pwd("50")
		    self.动画.挨打 = pwd("53")
		    self.动画.返回 = pwd("52")
		    self.动画.死亡 = pwd("53")
		    self.动画.施法 = pwd("51")
		    -- self.动画.施法特效 = pwd("51")
		    --self.动画.攻击特效 = pwd("50")
		    for n=1,#动作 do
	            if 染色方案~=nil and 染色组~=nil then
	                self.动画[动作[n]]:置染色(染色方案,染色组[1],染色组[2],染色组[3])
	            else
	            	if 变异 then
	            	    if 染色信息[模型]~=nil then
		                	self.动画[动作[n]]:置染色(染色信息[模型].id,染色信息[模型].方案[1],染色信息[模型].方案[2],染色信息[模型].方案[3])
	               		end
	            	end
	           	end
	     	end
    	else
	    	local n = qmsx(模型)
	    	local zl = qmsx("武器_"..模型)
	    	if zl[10] ~= nil then
			    self.武器={}
			    self.武器.待战 = 动画资源:载入(zl[10],"网易WDF动画",zl[6])
			    self.武器.静立 = 动画资源:载入(zl[10],"网易WDF动画",zl[6])
			    self.武器.跑去 = 动画资源:载入(zl[10],"网易WDF动画",zl[8])
			    self.武器.防御 = 动画资源:载入(zl[10],"网易WDF动画",zl[4])
			    self.武器.攻击 = 动画资源:载入(zl[10],"网易WDF动画",zl[1])
			    self.武器.挨打 = 动画资源:载入(zl[10],"网易WDF动画",zl[9])
			    self.武器.返回 = 动画资源:载入(zl[10],"网易WDF动画",zl[8])
			    self.武器.死亡 = 动画资源:载入(zl[10],"网易WDF动画",zl[3])
			    self.武器.施法 = 动画资源:载入(zl[10],"网易WDF动画",zl[7])
			   -- self.动画.攻击特效 = 动画资源:载入(zy,"网易WDF动画",n[1.1])
		       -- self.动画.施法特效 = 动画资源:载入(zy,"网易WDF动画",n[1.2])
	    	end
		    self.行为 = "待战"
		    self.状态行为 = "待战"
		    self.动画 = {}
		    local 动画资源 = tp.资源
		    local zy = n[10]
		    self.动画.待战 = 动画资源:载入(zy,"网易WDF动画",n[6])
		    self.动画.静立 = 动画资源:载入(zy,"网易WDF动画",n[6])
		    self.动画.跑去 = 动画资源:载入(zy,"网易WDF动画",n[8])
		    self.动画.防御 = 动画资源:载入(zy,"网易WDF动画",n[4])
		    self.动画.攻击 = 动画资源:载入(zy,"网易WDF动画",n[1])
		    self.动画.挨打 = 动画资源:载入(zy,"网易WDF动画",n[9])
		    self.动画.返回 = 动画资源:载入(zy,"网易WDF动画",n[8])
		    self.动画.死亡 = 动画资源:载入(zy,"网易WDF动画",n[3])
		    self.动画.施法 = 动画资源:载入(zy,"网易WDF动画",n[7])
		   -- self.动画.攻击特效 = 动画资源:载入(zy,"网易WDF动画",n[1.1])
            --self.动画.施法特效 = 动画资源:载入(zy,"网易WDF动画",n[1.2])
		    --变异=true
	        for n=1,#动作 do
	            if 染色方案~=nil and 染色组~=nil then
	                self.动画[动作[n]]:置染色(染色方案,染色组[1],染色组[2],染色组[3])
	            else
	            	if 变异 then
	            	    if 染色信息[模型]~=nil then
		                	self.动画[动作[n]]:置染色(染色信息[模型].id,染色信息[模型].方案[1],染色信息[模型].方案[2],染色信息[模型].方案[3])
	               		end
	            	end
	           	end
	     	end
	    end
	    self.饰品=nil
	    if 饰品~=nil then
	       local ccc = qmsx(模型.."_饰品")
	       self.饰品={}
	       self.饰品.待战=tp.资源:载入(ccc[10],"网易WDF动画",ccc[6])
	       self.饰品.静立=tp.资源:载入(ccc[10],"网易WDF动画",ccc[6])
	       self.饰品.跑去=tp.资源:载入(ccc[10],"网易WDF动画",ccc[8])
	       self.饰品.防御=tp.资源:载入(ccc[10],"网易WDF动画",ccc[4])
	       self.饰品.攻击=tp.资源:载入(ccc[10],"网易WDF动画",ccc[1])
	       self.饰品.挨打=tp.资源:载入(ccc[10],"网易WDF动画",ccc[9])
	       self.饰品.返回=tp.资源:载入(ccc[10],"网易WDF动画",ccc[8])
	       self.饰品.死亡=tp.资源:载入(ccc[10],"网易WDF动画",ccc[3])
	       self.饰品.施法=tp.资源:载入(ccc[10],"网易WDF动画",ccc[7])

	       if 饰品.染色方案~=nil then
			  for n, v in pairs(self.饰品) do
			      self.饰品[n]:置染色(饰品.染色方案,饰品.染色组[1],饰品.染色组[2],饰品.染色组[3])
			  end
	       end
	    end
  	end
	self.影子=动画资源:载入('shape.wdf',"网易WDF动画",0xDCE4B562)
end

function 战斗动画类:置方向(方向,动作)
	self.动画[动作]:置方向(方向)
	self.动画[动作]:换帧更新()
	if self.饰品~=nil then
		self.饰品[动作]:置方向(方向)
		self.饰品[动作]:换帧更新()
	end
	if  self.武器~=nil and self.武器[动作]~=nil  then
		self.武器[动作]:置方向(方向)
		self.武器[动作]:换帧更新()
	end
	if  self.身体动画 ~= nil and self.身体动画[动作]~=nil then
		self.身体动画[动作]:置方向(方向)
		self.身体动画[动作]:换帧更新()
	end

    if self.动画[动作]~= nil and self.动画[动作] ==self.动画.攻击 and  self.动画.攻击特效~=nil   then
       self.动画.攻击特效:置方向(方向)
       self.动画.攻击特效:换帧更新()
   end

   if   self.动画[动作]~= nil and self.动画[动作] ==self.动画.施法 and  self.动画.施法特效~=nil  then
        self.动画.施法特效:置方向(方向)
        self.动画.施法特效:换帧更新()
    end
end

function 战斗动画类:置帧率(动作,帧率)
	self.动画[动作].帧率=帧率
	if self.饰品~=nil then
		self.饰品[动作].帧率=帧率
	end
	if self.武器~=nil and self.武器[动作]~=nil  then
		self.武器[动作].帧率=帧率
	end
	if self.身体动画 ~= nil and self.身体动画[动作]~=nil then
		self.身体动画[动作].帧率=帧率
		self.身体动画[动作].帧率=帧率
	end
    if  self.动画[动作]~= nil and self.动画[动作] ==self.动画.攻击 and  self.动画.攻击特效~=nil   then
        self.动画.攻击特效.帧率=帧率

    end

    if  self.动画[动作]~= nil and self.动画[动作] ==self.动画.施法 and  self.动画.施法特效~=nil    then
        self.动画.施法特效.帧率=帧率
    end
end


function 战斗动画类:置颜色(颜色,动作)
	if self.饰品~=nil then
		self.饰品[动作]:置颜色(颜色)
	end
	--self.动画[动作]:换帧更新()
	if self.武器~=nil and self.武器[动作]~=nil  then
		self.武器[动作]:置颜色(颜色)
		--  self.武器[动作]:换帧更新()
	end
	if self.身体动画 ~= nil and self.身体动画[动作]~=nil then
		self.身体动画[动作]:置颜色(颜色)
	end
end

function 战斗动画类:取当前帧(动作)
	return self.动画[动作]:取当前帧()
end

function 战斗动画类:取结束帧(动作)
	return self.动画[动作]:取结束帧()
end

function 战斗动画类:取开始帧(动作)
	return self.动画[动作]:取开始帧()
end

function 战斗动画类:更新(dt,动作)
	self.动画[动作]:更新(dt)
	if self.饰品~=nil then
		self.饰品[动作]:更新(dt)
	end
	if self.武器~=nil and self.武器[动作]~=nil  then
		self.武器[动作]:更新(dt)
	end
	if self.身体动画 ~= nil and self.身体动画[动作]~=nil then
		self.身体动画[动作]:更新(dt)
	end
   if   self.动画[动作]~= nil and self.动画[动作] ==self.动画.攻击 and  self.动画.攻击特效~=nil  then
      self.动画.攻击特效:更新(dt)

   end

   if  self.动画[动作]~= nil and self.动画[动作] ==self.动画.施法 and  self.动画.施法特效~=nil then
        self.动画.施法特效:更新(dt)

   end
end

function 战斗动画类:显示(x,y,动作)
	self.影子:显示(x,y)
	if self.身体动画 ~= nil and self.身体动画[动作]~=nil then
		self.身体动画[动作]:显示(x,y)
	end
	self.动画[动作]:显示(x,y)
	if self.饰品~=nil then
		self.饰品[动作]:显示(x,y)
	end
	if self.武器~=nil and self.武器[动作]~=nil  then
		self.武器[动作]:显示(x+偏移x,y+偏移y)
	end
    if  self.动画[动作]~= nil and self.动画[动作] ==self.动画.攻击 and  self.动画.攻击特效~=nil then
       self.动画.攻击特效:显示(x,y)

    end

       if  self.动画[动作]~= nil and self.动画[动作] ==self.动画.施法 and  self.动画.施法特效~=nil then
        self.动画.施法特效:显示(x,y)
    end
end


return 战斗动画类