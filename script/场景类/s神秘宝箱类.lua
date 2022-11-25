
local 神秘宝箱类 = class()
local tp,zts1
local insert = table.insert

function 神秘宝箱类:初始化(根)
	tp = 根
    self.ID = 11501
	self.x = 50
	self.y = 50
	self.xx = 0
	self.yy = 0
	self.注释 = "给予类"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	self.右键关闭=1
	zts1 = 根.字体表.常用字体
	self.窗口时间 = 0
end
function 神秘宝箱类:打开(内容)
if self.可视 then
		for i=1,5 do
			--self.队伍格子[i].禁止 = false
		end
		self.选中人物 = 0
		self.可视 = false
		self.资源组=nil
		self.动画=nil
        self.请等待=nil
        self.记录值=nil
        self.等待开奖=nil
	    self.进程=nil
	    self.位置=nil
	    self.间隔=nil
	    self.商品=nil
	    self.起始=nil
	    self.速度=nil
	    self.中奖=nil
	    self.上次中奖=nil
	    self.筹码=nil
	    self.坐标=nil
	    self.动画=nil
	    self.动画2=nil
	    self.下注金额=nil
	    tp.鼠标.置鼠标("普通")


		return
	else
		insert(tp.窗口_,self)
		local 按钮 = tp._按钮
		local 自适应 = tp._自适应

		-- [1] = 自适应.创建(0,1,293,413,3,9),
		-- [2] = 自适应.创建(2,1,130,117,3,9),

		self.资源组 = {
			[1] = 自适应.创建(0,1,700,500,3,9),
			--[1] = tp.资源:载入('wzife.wdf',"网易WDF动画",0x1fc24eb4),
	        [2] = 按钮.创建(自适应.创建(12,4,43,22,1,3),0,0,4,true,true,"停止"),
	        [3] = tp.资源:载入('wzife.wdf',"网易WDF动画",0x10921ca7),
	        [4] = 自适应.创建(4,1,360,360,3,9),
	        [5] = tp.资源:载入('wzife.wdf',"网易WDF动画",0x42a7366b),
	        [6] = 自适应.创建(34,1,260,105,3,9),
	        [7] = 自适应.创建(0,1,300,300,3,9),
	        [8] = 自适应.创建(34,1,625,60,3,9),
 			[9] = 自适应.创建(3,1,80,20,1,3),
			[10] = tp._自适应.创建(1,1,600,18,1,3,nil,18),
	        [11] = tp.资源:载入('自用',"网易WDF动画",0x10021),
	        [12] = tp.资源:载入('自用',"网易WDF动画",0x10022),
	        [13] = tp.资源:载入('自用',"网易WDF动画",0x10028),
	        [14] = tp.资源:载入('自用',"网易WDF动画",0x10029),
	        [15] = tp.资源:载入('自用',"网易WDF动画",0x10027),
	        [16] = tp.资源:载入('自用',"网易WDF动画",0x10030),
	        [17] = tp.资源:载入('自用',"网易WDF动画",0x10024),
	        [18] = tp.资源:载入('自用',"网易WDF动画",0x10023),
	        [19] = tp.资源:载入('自用',"网易WDF动画",0x10025),
	        [20] = tp.资源:载入('自用',"网易WDF动画",0x10026),
	        [21] = tp.资源:载入('wzife.wdf',"网易WDF动画",0x406537b5),
	        [22] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),
	        [23] = 按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0x20f3e242),0,0,4,true),--问号





		}

     	tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间
	    self.可视 = true
	    self.开关=false
	    self.开奖时间=内容.开奖时间
	    self.银子=math.floor(内容.银子/10000).."万"
	    self.账本=math.floor(内容.账本.当前流水/10000).."万"
	    self.十=0
	    self.个=0
        if string.len(self.开奖时间) ==1 then
           self.个=self.开奖时间
        else
           self.十=string.sub(self.开奖时间,1,1)
           self.个=string.sub(self.开奖时间,2,2)
        end
        self.请等待=tp.资源:载入('misc.wdf',"网易WDF动画",0xEE1713AC)
        self.历史记录=内容.历史记录
        self.记录值=os.time()
        self.等待开奖=false
	    self.进程=0
	    self.位置=0
	    self.间隔=0
	    self.商品={}
	    self.下注金额={[1]=0,[2]=0,[3]=0,[4]=0,[5]=0,[6]=0}
	    self.起始=时间
	    self.速度=5
	    self.中奖=0
	    self.上次中奖=0
	    self.筹码=0
	    self.坐标={}
	    local  资源组 = {"魔兽要诀","高级召唤兽内丹","藏宝图","召唤兽内丹","魔兽要诀","高级藏宝图","藏宝图","召唤兽内丹","魔兽要诀","高级魔兽要诀","藏宝图","召唤兽内丹","魔兽要诀","高级藏宝图","藏宝图","召唤兽内丹"}
	    self.动画={}
	    self.筹码介绍={"1W","5W","10W","50W","100W","500W","1000W","5000W","1亿","5亿"}
	    for i=1,16 do
      	    local 资源=引擎.取物品(资源组[i])
		  	self.动画[i]=tp.资源:载入(资源[11],"网易WDF动画",资源[12])
	    end
	    self.动画3={}
	    for i=1,#self.历史记录 do
      	    local 资源=引擎.取物品(资源组[self.历史记录[i]])
		  	self.动画3[i]=tp.资源:载入(资源[11],"网易WDF动画",资源[12])
	    end
		资源组 = {"魔兽要诀","藏宝图","召唤兽内丹","高级藏宝图","高级魔兽要诀","高级召唤兽内丹"}
		local  说明 = {"1赔2.5","1赔2.5","1赔2.5","1赔4","1赔6","1赔6"}
	    self.动画2={}
	    for i=1,6 do
      	    local 资源=引擎.取物品(资源组[i])
		  	self.动画2[i]=tp.资源:载入(资源[11],"网易WDF动画",资源[12])
		  	self.动画2[i].说明=说明[i]
	    end
	    self.数字图片=tp.战斗文字[5]
		local xn = 引擎.取头像(tp.队伍[1].模型)
		self.头像 = tp.资源:载入(xn[7],"网易WDF动画",xn[5])
		self.资源组[23]:绑定窗口_(self.ID)
    end
end

function 神秘宝箱类:刷新数据(数据)
	    self.开关=true
	    self.中奖=数据.结果
     	self.进程=1
     	self.速度=1
     	self.间隔=0
     	self.起始=时间
     	self.记录=0
     	self.计时=0
     	self.等待开奖=true
        self.十=0
        self.个=8
end

function 神秘宝箱类:刷新下注(数据)
	    self.下注金额=数据
	    self.银子=math.floor(数据.银子/10000).."万"
	    self.账本=math.floor(数据.账本.当前流水/10000).."万"
end
function 神秘宝箱类:刷新时间(数据)
		  	       self.等待开奖=false
		           self.十=2
		           self.个=9
		           self.下注金额={[1]=0,[2]=0,[3]=0,[4]=0,[5]=0,[6]=0}


        self.历史记录=数据.历史记录
	    local  资源组 = {"魔兽要诀","高级召唤兽内丹","藏宝图","召唤兽内丹","魔兽要诀","高级藏宝图","藏宝图","召唤兽内丹","魔兽要诀","高级魔兽要诀","藏宝图","召唤兽内丹","魔兽要诀","高级藏宝图","藏宝图","召唤兽内丹"}
	    self.动画3={}
	    for i=1,#self.历史记录 do
      	    local 资源=引擎.取物品(资源组[self.历史记录[i]])
		  	self.动画3[i]=tp.资源:载入(资源[11],"网易WDF动画",资源[12])
	    end
	    self.银子=math.floor(数据.银子/10000).."万"
end






function 神秘宝箱类:显示(dt,x,y)
	if 引擎.鼠标弹起(右键) then
		 self:打开()
	end
	if self.资源组~=nil then
		 	self.资源组[1]:显示(self.x+20,self.y)
		 	self.资源组[4]:显示(self.x+55,self.y+45)
		 	self.资源组[7]:显示(self.x+85,self.y+87)
		 	self.资源组[5]:更新(dt)
		 	self.资源组[5]:显示(self.x+195,self.y+215)
		 	self.资源组[6]:显示(self.x+420,self.y+300)
		 	self.资源组[8]:显示(self.x+55,self.y+417)
		 	self.资源组[10]:显示(self.x+55,self.y+5)
			tp.窗口标题背景_:置区域(0,0,130,16)
			tp.窗口标题背景_:显示(self.x+310,self.y+5)
		 	tp.字体表.常用字体:显示(self.x+320,self.y+5,"奔驰宝马娱乐城")
		 	self.资源组[23]:更新(x,y)
		 	self.资源组[23]:显示(self.x+650,self.y+25)
			if self.资源组[23]:是否选中(x,y) then
				tp.提示:自定义(self.x+650,self.y+70,"#Y/流水积分=下注金额1:1转换！\n#G/输赢都算 永久有效\n#S/该积分可在商城购买物品")
			end
		 	self.头像:显示(self.x+420,self.y+45)
		 	tp.字体表.常用字体20:显示(self.x+500,self.y+45,"当前货币:"..self.银子)
		 	tp.字体表.常用字体20:显示(self.x+500,self.y+85,"今日流水:"..self.账本)
		 	self.资源组[22]:更新(x,y)
		 	self.资源组[22]:显示(self.x+690,self.y+7)
		 	if self.资源组[22]:事件判断() then
		 		self.可视=false
		 	end

		 	local  xx = 0
		 	local  yy = 0
		 	for i=1,10 do
			 	self.资源组[i+10]:显示(self.x+430+xx*50,self.y+310+yy)
			 	if self.资源组[i+10]:是否选中(x,y) and 引擎.鼠标弹起(左键) then
			 	   self.筹码=i
			 	   tp.鼠标.置鼠标("交易")
			 	elseif self.资源组[i+10]:是否选中(x,y) then
			 	    tp.提示:自定义(self.x+430+xx*50,self.y+310+yy,self.筹码介绍[i])
			 	end
			 	if self.筹码~=nil and self.筹码~=0 and self.筹码==i then
			 		self.资源组[21]:更新(dt)
			 		self.资源组[21]:显示(self.x+450+xx*50,self.y+305+yy)
			 	end
			 	xx=xx+1
			 	if xx>=5 then
			 		xx=xx-5
			 		yy=yy+50
			 	end
		 	end

			if self.进程==0 and self.开关 then
				self.间隔=self.间隔+1
		   		if self.间隔>=self.速度 then
		   	 		self.间隔=0
			  		self.位置=self.位置+1
			  		if self.位置==17 then self.位置=1 end
		     	end
		     	-- self.资源组[2]:更新(x,y)
		     	-- self.资源组[2]:显示(self.x+218,self.y+340)
		     	-- if self.资源组[2]:事件判断() then
		      --    	self.进程=1
		      --    	self.起始=时间
		     	-- end
			elseif self.进程==1 then
		  		self.间隔=self.间隔+1
		  		self.计时=self.计时+1
		   		if self.间隔>=self.速度 then
		   	 		self.间隔=0
			  		self.位置=self.位置+1
			  		if self.位置==17 then self.位置=1 end
		     	end
		  		if 时间>=self.起始+3 then
		     		self.进程=2
		  	 	end
		  	 	if self.计时>self.记录+5 then
		  	 		self.计时=0
				    		tp.音乐 = tp.资源:载入(wdf配置.."/Audio/bet.ogg","音乐",nil)
							tp.音乐:播放(false)
						    tp.音乐:置音量(tp.音量)
		  	 	end
			elseif self.进程==2 then
		   		local 距离=math.abs(self.位置-self.中奖)
		   		if 距离>=30 then
		   			self.速度=2
		   		elseif 距离>=20 then
		     		self.速度=5
		   		elseif 距离>=15 then
		     		self.速度=10
		    	elseif 距离>=10 then
		     		self.速度=15
		    	elseif 距离>=5 then
		     		self.速度=20
		   	 	end
		   		self.间隔=self.间隔+1
		   		if self.间隔>=self.速度 then
		   	 		self.间隔=0
			  		self.位置=self.位置+1
			  		if self.位置==17 then self.位置=1 end
			  	else
			  		self.计时=self.计时+1
			  	 	if self.计时>self.记录+self.速度  then
			  	 		self.计时=0
					    		tp.音乐 = tp.资源:载入(wdf配置.."/Audio/bet.ogg","音乐",nil)
								tp.音乐:播放(false)
							    tp.音乐:置音量(tp.音量)
			  	 	end
		     	end
		    	if self.位置==self.中奖 then
		    		self.进程=3
		    		self.起始=时间
		    	end
		   	elseif self.进程==3 and 时间>=self.起始+1 then
		     	self.资源组[3]:显示(self.坐标[self.中奖][1],self.坐标[self.中奖][2])
		 	end
		 	local xx=0
		 	local yy=30
		 	self.记录=0
		 	for i=1,16 do
		 		self.坐标[i]={self.x+150+xx,self.y+62+yy}
		 		tp.物品背景:显示(self.x+150+xx,self.y+62+yy)
		      	self.动画[i]:显示(self.x+150+xx,self.y+62+yy)
		      	if self.位置==i then
		          	self.资源组[3]:显示(self.x+150+xx,self.y+62+yy)
		       	end
		      	if i<4 then
			      	xx=xx+60
			    elseif i<8 then
				    yy=yy+60
			    elseif i<12 then
			      	xx=xx-60
			    else
				    yy=yy-60
			    end

		 	end
		 	local xx=0
		 	local yy=0
		 	zts1:置颜色(白色)
		 	for i=1,6 do
		 		tp.物品背景:显示(self.x+420+xx*135,self.y+120+yy*60)
		      	self.动画2[i]:显示(self.x+420+xx*135,self.y+120+yy*60)
		 		self.资源组[9]:显示(self.x+470+xx*135,self.y+120+yy*60)
		 		zts1:显示(self.x+485+xx*135,self.y+145+yy*60,self.动画2[i].说明)
				tp.字体表.描边字体:显示(self.x+480+xx*135,self.y+120+yy*60,((self.下注金额[i] or 0)/10000).."万" )
		      	yy=yy+1
		      	if yy==3 then
		      	   yy=0
		      	   xx=xx+1
		      	end
		      	if self.动画2[i]:是否选中(x,y) and 引擎.鼠标弹起(左键) then
		      	   if self.筹码==0 or self.筹码==nil then
					  tp.提示:写入("#Y/请选择筹码")
		      	   	  return
		      	   end
		      	   if self.等待开奖 then
					  tp.提示:写入("#Y/等待开奖,禁止下注")
		      	   	  return
		      	   end
		      	   发送数据(8001,{类型=self.筹码,目标=i})
		      	end


		 	end
		   for i=1,#self.动画3 do
		 		tp.物品背景:显示(self.x+20+i*50,self.y+415)
		      	self.动画3[i]:显示(self.x+20+i*50,self.y+415)
		   end


		  if self.记录值+1<=os.time() then
		  	 self.记录值=os.time()
		  	 self.个=self.个-1
			  if self.个<0 then
			  	 self.十=self.十-1
			  	 if self.十<0 then
			  	 	self.等待开奖=true
			  	 end
			  	 self.个=9
			  end

		  end
		  if  self.等待开奖 == false then
		      self.数字图片[self.十+1]:显示(self.x+185,self.y+225)
		      self.数字图片[self.个+1]:显示(self.x+235,self.y+225)
		  else
			  self.请等待:显示(self.x+160,self.y+225)
		  end



 	end

end

function 神秘宝箱类:检查点(x,y)
	if self.可视 and self.资源组~=nil and self.资源组[1]:是否选中(x,y)  then
		return true
	else
		return false
	end
end

function 神秘宝箱类:初始移动(x,y)
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

function 神秘宝箱类:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end
return 神秘宝箱类