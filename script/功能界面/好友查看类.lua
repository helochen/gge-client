--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2021-03-26 23:11:10
--======================================================================--
local 好友查看类 = class()

local floor = math.floor
local tp,zts,zts1
local tx = 引擎.取头像
local bw = require("gge包围盒")(0,0,153,58)
local mouseb = 引擎.鼠标弹起
local box = 引擎.画矩形
local insert = table.insert

function 好友查看类:初始化(根)
  self.ID = 48
  self.x = 0
  self.y = 0
  self.xx = 0
  self.yy = 0
  self.右键关闭=1
  self.注释 = "好友查看类"
  self.可视 = false
  self.鼠标 = false
  self.焦点 = false
  self.可移动 = true
  self.窗口时间 = 0
  tp = 根
  zts = tp.字体表.普通字体
  zts1 = tp.字体表.描边字体
  self.队伍打开=false
end

function 好友查看类:打开(内容,当前类型,n,队伍打开)
  if self.可视 then
    self.可视 = false
    self.资源组 = nil
    return
  else
    insert(tp.窗口_,self)
    local 资源 = tp.资源
    local 按钮 = tp._按钮
    local 自适应 = tp._自适应
    self.资源组 = {
      [1] = 自适应.创建(0,1,188,381,3,9),
      [2] = 自适应.创建(1,1,153,18,1,3,nil,18),
      [3] = 自适应.创建(2,1,158,250,3,9),
      [14] = 资源:载入('wzife.wdf',"网易WDF动画",0X3D5D95E9),
      [15] = 资源:载入('wzife.wdf',"网易WDF动画",0X39496AA9),
      [16] = 按钮.创建(自适应.创建(12,4,43,22,1,3),0,0,4,true,true,"更新"),
      [17] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"添加好友"),
      [18] = 按钮.创建(自适应.创建(12,4,43,22,1,3),0,0,4,true,true,"断交"),
      [19] = 按钮.创建(自适应.创建(12,4,84,22,1,3),0,0,4,true,true,"拉入黑名单"),
      [20] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),
      [21] = 资源:载入('wzife.wdf',"网易WDF动画",0X39496AA9),
    }
    self.选中 = 0
    self.加入 = 0
    self.头像组 = {}
    tp.运行时间 = tp.运行时间 + 1
    self.窗口时间 = tp.运行时间
    self.可视 = true
    self.当前类型=当前类型
    self.数据=内容
    self.查找开关=false
    self.查找结果={}
    self.排序行数=0
    self.信息开关=false
    self.对话开关=false
    self.显示信息={}

    if 队伍打开 then
      self:队伍打开信息栏()
      self.队伍打开=true
    else
      self:打开信息栏(self.数据[当前类型][n].id,n)
      self.队伍打开=false
    end
  end
end

function 好友查看类:显示(dt,x,y)
  self.焦点 = false
  if self.信息开关 then
    if  self.显示信息.精灵 then
      self.资源组[15]:显示(self.x+350,self.y+150)
      if self.资源组[15]:是否选中(x,y) and 引擎.鼠标弹起(右键) then
        self.信息开关=false
        self:打开()
        return
      end
    else
      self.资源组[14]:显示(self.x+350,self.y+150)
      if self.资源组[14]:是否选中(x,y) and 引擎.鼠标弹起(右键) then
        self.信息开关=false
        self:打开()
        return
      end
      self.显示信息.模型:显示(self.x+370,self.y+185)
      self.资源组[16]:更新1(x,y)
      self.资源组[17]:更新1(x,y)
      self.资源组[18]:更新1(x,y)
      self.资源组[19]:更新1(x,y)
      self.资源组[20]:更新1(x,y)
      if not self.队伍打开 then
        self.资源组[16]:显示(self.x+374,self.y+375)
        self.资源组[18]:显示(self.x+524,self.y+375)
        self.资源组[19]:显示(self.x+584,self.y+375)
        self.资源组[20]:显示(self.x+673,self.y+153)
      end
      self.资源组[17]:显示(self.x+434,self.y+375)
      if  self.资源组[20]:事件判断() then
        self.信息开关=false
      elseif  self.资源组[16]:事件判断() then
        发送数据(20,{类型=self.当前类型,序列=self.显示信息.序列})
      elseif  self.资源组[17]:事件判断() then
        发送数据(21,{id=self.显示信息.id})
      elseif  self.资源组[18]:事件判断() then
        发送数据(23,{id=self.显示信息.id,类型=self.当前类型})
      elseif  self.资源组[19]:事件判断() then
        发送数据(22,{id=self.显示信息.id})
      end
      zts:置颜色(黑色)
      zts:显示(self.x+572,self.y+190,self.显示信息.名称)
      zts:显示(self.x+572,self.y+214,self.显示信息.id)
      zts:显示(self.x+572,self.y+238,self.显示信息.等级)
      zts:显示(self.x+572,self.y+262,self.显示信息.门派)
      zts:显示(self.x+572,self.y+286,"无")
      if self.显示信息.帮派==nil then
        zts:显示(self.x+420,self.y+320,"无")
      else
        zts:显示(self.x+420,self.y+320,self.显示信息.帮派)
      end
      if self.显示信息.称谓==nil then
        zts:显示(self.x+420,self.y+344,"无")
      else
        zts:显示(self.x+420,self.y+344,self.显示信息.称谓)
      end
      zts:显示(self.x+625,self.y+319,self.显示信息.关系)
      if self.显示信息.好友度==nil then
        zts:显示(self.x+630,self.y+344,"0")
      else
        zts:显示(self.x+630,self.y+344,self.显示信息.好友度)
      end
    end
  end
end

function 好友查看类:打开信息栏(id,序列)
  self.显示信息={}
  if id==0 then --梦幻精灵
    self.显示信息={名称="梦幻精灵",id=0,门派="九天仙宫",帮派="无",好友度=99999,关系="亲密无间",称谓="百科专家",等级=200,精灵=true}
    self.显示信息.模型=tp.资源:载入('wzife.wd4',"网易WDF动画",0XF431ED3A)--0X7B90C55C
  else
    self.显示信息={名称=self.数据[self.当前类型][序列].名称,id=self.数据[self.当前类型][序列].id,门派=self.数据[self.当前类型][序列].门派,帮派=self.数据[self.当前类型][序列].帮派,好友度=self.数据[self.当前类型][序列].好友度,关系=self.数据[self.当前类型][序列].关系,称谓=self.数据[self.当前类型][序列].称谓,等级=self.数据[self.当前类型][序列].等级}
    --self.数据[self.当前类型][序列].模型="桃夭夭"
    local n = 引擎.取头像(self.数据[self.当前类型][序列].模型)
    self.显示信息.模型= tp.资源:载入(n[7],"网易WDF动画",n[3])
    self.显示信息.序列=序列
    self.信息开关=true
  end
end

function 好友查看类:队伍打开信息栏()
  self.显示信息={}
  self.显示信息={名称=self.数据.名称,id=self.数据.id,门派=self.数据.门派,帮派=self.数据.帮派,好友度=0,关系=0,称谓=self.数据.称谓,等级=self.数据.等级}
  --self.数据[self.当前类型][序列].模型="桃夭夭"
  local n = 引擎.取头像(self.数据.模型)
  self.显示信息.模型= tp.资源:载入(n[7],"网易WDF动画",n[3])
  self.显示信息.序列=序列
  self.信息开关=true
end

function 好友查看类:检查点(x,y)
  if self.可视 and self.资源组~=nil and (self.资源组[14]:是否选中(x,y) or self.资源组[15]:是否选中(x,y))  then
    return true
  end
end

function 好友查看类:初始移动(x,y)
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

function 好友查看类:开始移动(x,y)
  if self.鼠标 then
    self.x = x - self.xx
    self.y = y - self.yy
  end
end

return 好友查看类