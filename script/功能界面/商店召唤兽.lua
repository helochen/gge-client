local 商店召唤兽类 = class()
local insert = table.insert
local 名称数据={}
local bw = require("gge包围盒")(0,0,520,20)
local 选中编号=0
local tp
function 商店召唤兽类:初始化(根)
  self.ID = 6502
	self.x = 202
	self.y = 88
	self.xx = 0
	self.yy = 0
	self.注释 = "给予类"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	self.右键关闭=1
	self.窗口时间 = 0
	tp = 根
end

function 商店召唤兽类:打开(内容)
 if self.可视 then
		self.选中人物 = 0
		self.可视 = false
    self.资源组 = nil
    self.数据 = nil
    self.名称 = nil
    self.刷新 = nil
    内容 = nil
    按钮 = nil
    自适应 = nil
    return
	else
		insert(tp.窗口_,self)
    local 按钮 = tp._按钮
    local 自适应 = tp._自适应
    self.资源组 = {
		[1] = tp.资源:载入('goods.wdf',"网易WDF动画",0x00000001),
		[2] = 按钮.创建(自适应.创建(12,4,43,22,1,3),0,0,4,true,true,"提交"),
		[3] = 按钮.创建(自适应.创建(12,4,43,22,1,3),0,0,4,true,true,"取消"),
		[4] = 按钮.创建(自适应.创建(20,4,18,19,4,3),0,0,4,true,true),
		[5] = 按钮.创建(自适应.创建(21,4,18,19,4,3),0,0,4,true,true),
		[6] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),
		[7] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"更改职务"),
		[8] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"更改宗旨"),
		[9] = 按钮.创建(自适应.创建(12,4,43,22,1,3),0,0,4,true,true,"购买"),
		[10] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"刷新"),
    }
     	tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间
	    self.可视 = true

        self.数据=内容
        self.名称={}
        self.刷新=内容.刷新
        self.资源组[10].按钮文字="刷新("..self.刷新..")"
        for i=1,#self.数据 do

          self.名称[#self.名称+1]={名称=self.数据[i].模型,价格=self.数据[i].价格}
         -- print(self.数据[i])


         end



      self.起点=1
      self.终点=12
      选中编号=0



    end


end
function 商店召唤兽类:更新数据(内容)
  self.数据=内容
        self.名称={}
        self.刷新=内容.刷新
        self.资源组[10].按钮文字="刷新("..self.刷新..")"
        for i=1,#self.数据 do

          self.名称[#self.名称+1]={名称=self.数据[i].模型,价格=self.数据[i].价格}
         -- print(self.数据[i])


         end

 end
function 商店召唤兽类:更新(dt)

end


function 商店召唤兽类:显示(dt,x,y)
	--print(8888888)
 self.资源组[1]:显示(self.x,self.y)
 self.资源组[4]:显示(self.x+537,self.y+65)
 self.资源组[5]:显示(self.x+537,self.y+305)
 self.资源组[6]:显示(self.x+542,self.y+3)
 self.资源组[9]:显示(self.x+192,self.y+335)
 self.资源组[10]:显示(self.x+312,self.y+335)
 self.资源组[4]:更新(x,y)
 self.资源组[5]:更新(x,y)
 self.资源组[6]:更新(x,y)
 self.资源组[9]:更新(x,y,选中编号~=0)
 self.资源组[10]:更新(x,y)
  if self.资源组[4]:事件判断() then

     if self.起点>1 then

         self.起点=self.起点-1
         self.终点=self.终点-1

     	 end
  elseif self.资源组[5]:事件判断() then

     if self.终点<#名称数据 then

         self.起点=self.起点+1
         self.终点=self.终点+1

     	 end


   elseif self.资源组[6]:事件判断() then
     self:打开()
     return
   elseif self.资源组[9]:事件判断() then
     if 选中编号==0 then

        tp.提示:写入("#Y请先选择要购买的召唤兽")
      else

       发送数据(53,{名称=选中编号})

       end
    elseif self.资源组[10]:事件判断() then
     发送数据(54,{名称=选中编号})
    elseif self.资源组[1]:是否选中(x,y) and 引擎.鼠标弹起(右键) then

    	self:打开()
    	return

     end
 local 字体=tp.字体表.普通字体
 字体:置颜色(白色)

 字体:显示(self.x+245,self.y+5,"商会召唤兽")
 字体:置颜色(黑色)
 字体:显示(self.x+35,self.y+52,"召唤兽名称")
 字体:显示(self.x+255,self.y+52,"召唤兽类型")
 --字体:显示(self.x+185,self.y+52,"职务")
 --字体:显示(self.x+255,self.y+52,"帮贡")
 字体:显示(self.x+435,self.y+52,"价格")
 --字体:显示(self.x+435,self.y+52,"离线日期")
 --显示12行
 local 位置=0
 for n=self.起点,self.终点 do
     位置=位置+1
     --print(self.名称[n])
      if self.名称[n]~=nil then

         local 颜色=黑色
         if 选中编号==n then 颜色=红色 end
         bw:置坐标(self.x+20,self.y+62+位置*20)
         if bw:检查点(x,y) then
          --  print(66666)

           if 引擎.鼠标弹起(左键) then
             if 选中编号==n then
                选中编号=0
             else
               选中编号=n

               end

             end


           end
         字体:置颜色(颜色)
         字体:显示(self.x+30,self.y+62+位置*20,self.名称[n].名称)
         字体:显示(self.x+255,self.y+62+位置*20,"野怪")
         --字体:显示(self.x+185,self.y+62+位置*20,self.名称[n].职务)
         --字体:显示(self.x+245,self.y+62+位置*20,self.名称[n].帮贡.当前..[[/]]..self.名称[n].帮贡.获得)
         字体:显示(self.x+425,self.y+62+位置*20,self.名称[n].价格)
         --字体:显示(self.x+425,self.y+62+位置*20,时间转换(self.名称[n].离线时间))





      	 end



 	 end
end
function 商店召唤兽类:初始移动(x,y)
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

function 商店召唤兽类:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy


	end
end
function 商店召唤兽类:检查点(x,y)
	if self.可视 and self.资源组[1]:是否选中(x,y)  then
		return true
	else
		return false
	end
end

return 商店召唤兽类