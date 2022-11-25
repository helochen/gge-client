--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2020-09-15 23:11:25
--======================================================================--
local 场景类_战斗自动栏 = class()
local 状态 = "取消"
local 开启自动 = false
local format = string.format
local tp
local zts2
function 场景类_战斗自动栏:初始化(根)
	self.ID = 102
	self.x = 18
	self.y = 313
	self.xx = 0
	self.yy = 0
	self.注释 = "战斗"
	self.可视 = false
	self.可视化 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	self.窗口时间 = 0
	local 资源 = 根.资源
	local 按钮 = 根._按钮
	local 自适应 = 根._自适应
	self.资源组 = {
		[0] = 自适应.创建(1,1,174,18,1,3,nil,18),
		[1] = 自适应.创建(0,1,198,133,3,9),
		[2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),
		[3] = 按钮.创建(自适应.创建(12,4,55,22,1,3),0,0,4,true,true,"取消"),
		[4] = 按钮.创建(自适应.创建(12,4,55,22,1,3),0,0,4,true,true,"助战"),
	}
	for i=2,3 do
	--	self.资源组[i]:绑定窗口_(102)
	end
	tp = 根
	self.第一次 = false
	self.显示类型=1
	zts2 = tp.字体表.描边字体
end

function 场景类_战斗自动栏:打开(sf)
	if self.可视化 then
		self.可视化 = false
	else
		self.可视化 = true
		tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间



		if sf ~= false then
		  	状态 = "取消"
		else
		    状态 = "开启"
		end
		self.资源组[3]:置文字(状态)
	end
end

function 场景类_战斗自动栏:加载()
	local 资源 = tp.资源
	local 按钮 = tp._按钮
	local 自适应 = tp._自适应
	self.资源组 = {
		[0] = 自适应.创建(1,1,174,18,1,3,nil,18),
		[1] = 自适应.创建(0,1,198,133,3,9),
		[2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),
		[3] = 按钮.创建(自适应.创建(12,4,55,22,1,3),0,0,4,true,true,"取消"),
		[4] = 按钮.创建(自适应.创建(12,4,55,22,1,3),0,0,4,true,true,"助战"),
	}
end

function 场景类_战斗自动栏:取助战数()
	local 编号={}
	for n=1,#战斗类.战斗单位 do
	    if 战斗类.战斗单位[n].数据.类型=="角色" and 战斗类.战斗单位[n].数据.id==tp.队伍[1].数字id and 战斗类.战斗单位[n].数据.助战编号 ~= nil then
	        编号[#编号+1]=n
	    end
	 end
	 return 编号
end


function 场景类_战斗自动栏:取自动语句(类型)

 	if 类型==1 then --人物
     	local 编号=0
     	for n=1,#战斗类.战斗单位 do
         	if 战斗类.战斗单位[n].数据.类型=="角色" and 战斗类.战斗单位[n].数据.id==tp.队伍[1].数字id and 战斗类.战斗单位[n].数据.助战编号 == nil then
            	编号=n
         	end
     	end
      	local 语句="攻击"
      	if 编号==0 then return 语句 end
     	if 战斗类.战斗单位[编号].数据.自动指令~=nil then
         	if 战斗类.战斗单位[编号].数据.自动指令.类型=="法术" then
             	语句=战斗类.战斗单位[编号].数据.自动指令.参数
            else
             	语句=战斗类.战斗单位[编号].数据.自动指令.类型
         	end
     	end
       	return 语句
   	elseif 类型==2 then --人物
    	local 编号=0
	    for n=1,#战斗类.战斗单位 do
	        if 战斗类.战斗单位[n].数据.类型=="bb" and 战斗类.战斗单位[n].数据.id==tp.队伍[1].数字id then
	            编号=n
	        end
	    end
      	if 编号==0 then return "无" end
      	local 语句="攻击"
     	if 战斗类.战斗单位[编号].数据.自动指令~=nil then
         	if 战斗类.战斗单位[编号].数据.自动指令.类型=="法术" then
             	语句=战斗类.战斗单位[编号].数据.自动指令.参数
            else
             	语句=战斗类.战斗单位[编号].数据.自动指令.类型
         	end
     	end
       	return 语句
 	end
end

function 场景类_战斗自动栏:取助战自动语句(序号,编号)
	local 语句 = "助战["..序号.."]:攻击"
	if 编号 == 0 then
		return 语句
	else
		if 战斗类.战斗单位[编号].数据.自动指令~=nil then
         	if 战斗类.战斗单位[编号].数据.自动指令.类型=="法术" then
             	语句="助战["..序号.."]:"..战斗类.战斗单位[编号].数据.自动指令.参数
            else
             	语句="助战["..序号.."]:"..战斗类.战斗单位[编号].数据.自动指令.类型
         	end
     	end
	end
	return 语句
end

function 场景类_战斗自动栏:取自动状态()
	状态="开启"
  	for n=1,#战斗类.战斗单位 do
        if 战斗类.战斗单位[n].数据.自动战斗 and 战斗类.战斗单位[n].数据.类型=="角色" and 战斗类.战斗单位[n].数据.id==tp.队伍[1].数字id then
            状态="取消"
        end
    end
  	if self.资源组[3].按钮文字~=状态 then
      	self.资源组[3]:置文字(状态)
    end
 end
function 场景类_战斗自动栏:显示(dt,x,y)
	self:取自动状态()
	if self.助战编号 == nil then
		self.助战编号 = self:取助战数()
	end
	self.焦点 = false
	self.资源组[1]:显示(self.x,self.y)
	self.资源组[0]:显示(self.x+6,self.y+3)
	tp.窗口标题背景_:置区域(0,0,74,16)
	tp.窗口标题背景_:显示(self.x+72,self.y+3)
	zts2:置字间距(2)
	zts2:显示(self.x+78,self.y+3,"自动战斗")
	zts2:置字间距(0)
	if self.显示类型 == 1 then
		tp.字体表.常用字体14:置颜色(绿色)
		tp.字体表.常用字体14:显示(self.x + 25,self.y + 33,"人　物:")
		tp.字体表.常用字体14:显示(self.x + 25,self.y + 60,"召唤兽:")
		tp.字体表.常用字体14:置颜色(黄色)
		tp.字体表.常用字体14:显示(self.x + 80,self.y + 33,self:取自动语句(1))
		tp.字体表.常用字体14:显示(self.x + 80,self.y + 60,self:取自动语句(2))
	else
		tp.字体表.常用字体14:置颜色(白色)
		local xx=0
		local yy=0
	    for i=1,#self.助战编号 do
	    	tp.字体表.常用字体14:显示(self.x + 10,self.y + 25+yy*20,self:取助战自动语句(i,self.助战编号[i]))
	    	yy = yy +1
	    	if yy >= 4 then
	    		yy = 0
	    	end
	    end
	end
	--tp.字体表.普通字体:显示(self.x + 16,self.y + 72,"当前不受嘲讽影响")
	self.资源组[2]:更新1(x,y)
	self.资源组[3]:更新1(x,y)
	self.资源组[4]:更新1(x,y,#self.助战编号>0)
	--print(self.鼠标,self.资源组[2]:事件判断())
	if self.鼠标 then
		if self.资源组[2]:事件判断() then
			战斗类.自动开关 = false
		elseif self.资源组[3]:事件判断() then
          发送数据(5507)
        elseif self.资源组[4]:事件判断() then
        	if self.显示类型 == 1 then
        		self.显示类型 = 2
        		self.资源组[4]:置文字("人物")
        	else
        		self.资源组[4]:置文字("助战")
        		self.显示类型 = 1
        	end
		end
	end
	self.资源组[2]:显示(self.x+173,self.y+3)
	if self.显示类型 == 1 then
		self.资源组[3]:显示(self.x+25,self.y+100)
	end
	self.资源组[4]:显示(self.x+120,self.y+100)
	if tp.按钮焦点 then
		self.焦点 = true
	end
	if 引擎.鼠标弹起(1)  and not tp.禁止关闭 and self.鼠标 then
		self:打开()
	end
end

function 场景类_战斗自动栏:检查点(x,y)
	if self.资源组[1]:是否选中(x,y)  then
	  	self.鼠标=true
		return true
	end
end

function 场景类_战斗自动栏:初始移动(x,y)

	if not self.焦点 then
		tp.移动窗口 = true
	end
	if  self.鼠标 and  not self.焦点 then
		self.xx = x - self.x
		self.yy = y - self.y
	end
end

function 场景类_战斗自动栏:开始移动(x,y)
	if self.可视 and self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 场景类_战斗自动栏