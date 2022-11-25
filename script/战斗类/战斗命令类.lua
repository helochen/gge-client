
local 战斗命令类 = class()
local 场景类_战斗指令栏 = class()
local random = 引擎.取随机整数
local keyaz = 引擎.按键按住
local keyax = 引擎.按键按下
local keytq = 引擎.按键弹起
local mouse = 引擎.鼠标弹起
local KEY = KEY
local zts
function 战斗命令类:初始化(根)
  self.ID = 1
	self.x = 77
	self.y = 68
	self.xx = 0
	self.yy = 0
  self.道具栏 = require("script/战斗类/战斗道具栏").创建(根)
  self.法术界面= require("script/战斗类/战斗技能栏").创建(根)
  self.召唤界面=require("script/战斗类/战斗召唤栏").创建(根)
	self.注释 = "战斗"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
  zts = 根.字体表.描边字体
end
function 战斗命令类:加载()
  local 资源 = tp.资源
  local 按钮 = tp._按钮
  local 自适应 = tp._自适应



  self.人物资源组 = {
    [1] = 自适应.创建(101,4,64,300,2,3,nil),
    [2] = 按钮.创建(资源:载入(tp.战斗法术背景,"网易WDF动画",0x839C6C7D),0,0,4,true),
    [3] = 按钮.创建(资源:载入(tp.战斗法宝背景,"网易WDF动画",0x2E8F2187),0,0,4,true),
    [4] = 按钮.创建(资源:载入(tp.战斗特技背景,"网易WDF动画",0x389DCCF5),0,0,4,true),
    [5] = 按钮.创建(资源:载入(tp.战斗道具背景,"网易WDF动画",0x1587C26E),0,0,4,true),
    [6] = 按钮.创建(资源:载入(tp.战斗防御背景,"网易WDF动画",0xA662D44B),0,0,4,true),
    [7] = 按钮.创建(资源:载入(tp.战斗保护背景,"网易WDF动画",0x0467A0A8),0,0,4,true),
    [8] = 按钮.创建(资源:载入(tp.战斗指挥背景,"网易WDF动画",0x8A8A21AD),0,0,4,true),
    [9] = 按钮.创建(资源:载入(tp.战斗召唤背景,"网易WDF动画",0xA2E2DC42),0,0,4,true),
    [10] = 按钮.创建(资源:载入(tp.战斗召还背景,"网易WDF动画",0xE1A79F93),0,0,4,true),
    [11] = 按钮.创建(资源:载入(tp.战斗自动背景,"网易WDF动画",0xEFB4F757),0,0,4,true),
    [12] = 按钮.创建(资源:载入(tp.战斗捕捉背景,"网易WDF动画",0x2ACB414D),0,0,4,true),
    [13] = 按钮.创建(资源:载入(tp.战斗逃跑背景,"网易WDF动画",0x132041E1),0,0,4,true)
  }
  self.召唤兽资源组 = {
    [1] = 自适应.创建(101,4,64,150,2,3,nil),
    [2] = 按钮.创建(资源:载入(tp.战斗法术背景,"网易WDF动画",0x839C6C7D),0,0,4,true),
    [3] = 按钮.创建(资源:载入(tp.战斗法术背景,"网易WDF动画",0x1587C26E),0,0,4,true),
    [4] = 按钮.创建(资源:载入(tp.战斗法术背景,"网易WDF动画",0xA662D44B),0,0,4,true),
    [5] = 按钮.创建(资源:载入(tp.战斗法术背景,"网易WDF动画",0x0467A0A8),0,0,4,true),
    [6] = 按钮.创建(资源:载入(tp.战斗法术背景,"网易WDF动画",0x132041E1),0,0,4,true),
    [7] = 按钮.创建(资源:载入(tp.战斗法术背景,"网易WDF动画",0xEFB4F757),0,0,4,true),
  }
  self.助战资源组 = {
    [1] = 自适应.创建(101,4,64,150,2,3,nil),
    [2] = 按钮.创建(资源:载入(tp.战斗法术背景,"网易WDF动画",0x839C6C7D),0,0,4,true),
    [3] = 按钮.创建(资源:载入(tp.战斗法术背景,"网易WDF动画",0x389DCCF5),0,0,4,true),
    [4] = 按钮.创建(资源:载入(tp.战斗法术背景,"网易WDF动画",0x1587C26E),0,0,4,true),
    [5] = 按钮.创建(资源:载入(tp.战斗法术背景,"网易WDF动画",0xA662D44B),0,0,4,true),
    [6] = 按钮.创建(资源:载入(tp.战斗法术背景,"网易WDF动画",0x0467A0A8),0,0,4,true),
    [7] = 按钮.创建(资源:载入(tp.战斗法术背景,"网易WDF动画",0xEFB4F757),0,0,4,true),
  }
  self.指令 = nil
  self.对象 = nil
  self.队形 = nil
  self.使用 = nil
  self.技能 = nil
  self.特技 = nil
  self.物品 = nil
  self.召唤兽 = nil
  self.物品对象 = nil
  self.窗口时间 = 0
  self.剩余时间 = nil
  self.格子 = nil
  self.法术开关=false
  self.特技开关=false
  self.召唤开关=false
end
function 战斗命令类:设置指令(编号)
  if self.命令类型=="攻击" and self.参战单位[编号].敌我==1 then
    tp.提示:写入("#Y/你必须选择敌方单位作为攻击目标")
    return
  end
  if self.参战单位[编号].敌我 == 2 and self.命令参数 == "普度众生" and self.参战单位[self.单位编号[self.操作对象]].敌我 == 1 then
    tp.提示:写入("#Y/截图给GM命令附加为"..self.命令附加.."目标为"..self.参战单位[编号].名称)
  end
  self.完成指令[self.操作对象]={类型=self.命令类型,目标=编号,敌我=0,参数=self.命令参数,附加=self.命令附加}
  if self.操作对象>=self.对象上限 then
    发送数据(5502,self.完成指令)
    战斗类.进程="等待"
    self:重置高亮()
  else
    self.命令参数=""
    self.操作对象=self.操作对象+1
    self:重置高亮()
  end
  self.命令版面=true
  tp.鼠标.置鼠标("普通")
  self.命令类型="攻击"
  self.命令附加=4
end

function 战斗命令类:设置指令1(编号)
  self.完成指令[self.操作对象]={类型=self.命令类型,目标=编号,敌我=0,参数=self.命令参数,附加=self.命令附加}
  if self.操作对象>=self.对象上限 then
    发送数据(5502,self.完成指令)
    战斗类.进程="等待"
    self:重置高亮()
  else
    self.操作对象=self.操作对象+1
    self:重置高亮()
    self.命令版面=true
    tp.鼠标.置鼠标("普通")
    self.命令类型="攻击"
    self.命令附加=4
  end
  self.命令版面=true
  tp.鼠标.置鼠标("普通")
end

function 战斗命令类:更新类型(编号)
  local x=全局游戏宽度-50--950
  local y=485
  local xx = 93
  local yy = 297
  if dx == 2 then
    xx = 93
    yy = 128
  end
  self.x = x - xx
  self.y = y - yy
  self.命令版面=true
  self.类型=1
  self.单位编号=编号
  self.操作对象=1
  self.完成指令={}
  self.对象上限=#编号
  self.参战单位=战斗类.战斗单位
  self.命令类型="攻击"
  self.命令附加=4
  self.命令参数=""
  self.鼠标更改=true
  self.法术开关=false
  self.道具开关=false
  self.法宝开关=false
  self.召唤开关=false
  for n=1,#编号 do
    self.完成指令[n]={}
  end
end

function 战斗命令类:设置道具参数(编号,对象)
  -- print(编号,对象)
  self.道具栏:打开()
  self.命令类型="道具"
  self.命令附加=对象
  self.命令参数=编号
  self.命令版面=false
  tp.鼠标.置鼠标("道具")
end

function 战斗命令类:设置逃跑(id)
  self.完成指令[self.操作对象]={类型="逃跑",目标=1,敌我=0,参数=self.命令参数,附加=1}
  if self.操作对象>=self.对象上限 then
    发送数据(5502,self.完成指令)
    战斗类.进程="等待"
    self:重置高亮()
  else
    self.操作对象=self.操作对象+1
    self:重置高亮()
  end
end

function 战斗命令类:设置召唤(id)
  self.命令类型="召唤"
  self.完成指令[self.操作对象]={类型=self.命令类型,目标=id,敌我=0,参数=self.命令参数,附加=self.命令附加}
  if self.操作对象>=self.对象上限 then
    发送数据(5502,self.完成指令)
    战斗类.进程="等待"
    self:重置高亮()
  else
    self.操作对象=self.操作对象+1
    self:重置高亮()
  end
end

function 战斗命令类:设置道具()
  self.道具栏:打开()
end

function 战斗命令类:设置捕捉(法术)
  print(法术)
  self.命令类型="捕捉"
  --self.命令参数=法术.技能.名称
  self.命令附加=4
  self.命令版面=false
  self.法术开关=false
  tp.鼠标.置鼠标("捕捉")
end

function 战斗命令类:设置法术参数(法术,对象)
  if 法术.技能==nil then
    return
  end
  if self.操作对象==2 and 对象~=nil then
      return
  end
  self.命令类型="法术"
  self.命令参数=法术.技能.名称
  local 临时种类=引擎.取技能(法术.技能.名称)
  self.命令附加=临时种类[3]
  self.命令版面=false
  self.法术开关=false
  tp.鼠标.置鼠标("道具")
  if 法术.技能.名称=="妙手空空" then
    self.命令附加=4
  end
  if self.命令附加==66 then
    self:设置指令(self.单位编号[self.操作对象])
  end
  -- print( self.命令类型,self.命令参数,self.命令附加)
end

function 战斗命令类:设置宠物法术参数(法术)
  if 法术==nil then
    return
  end
  self.命令类型="法术"
  self.命令参数=法术.名称
  local 临时种类=引擎.取技能(法术.名称)
  self.命令附加=临时种类[3]
  self.命令版面=false
  self.法术开关=false
  tp.鼠标.置鼠标("道具")
  if 法术.名称=="妙手空空" then
    self.命令附加=4
  end
  if self.命令附加==3 then
    --self:设置指令(self.单位编号[self.操作对象])
  end
  -- print( self.命令类型,self.命令参数,self.命令附加)
end

function 战斗命令类:更新(dt,x,y,类型)
  if self.道具栏.可视 then
    self.道具栏:更新(dt,x,y)
  end
  if self.命令版面 then
    if self.操作对象==1 then-------------------人物命令
      self.人物资源组[2]:更新1(x,y)
      self.人物资源组[3]:更新1(x,y)
      self.人物资源组[4]:更新1(x,y)
      self.人物资源组[5]:更新1(x,y)
      self.人物资源组[6]:更新1(x,y)
      self.人物资源组[7]:更新1(x,y)
      self.人物资源组[8]:更新1(x,y)
      self.人物资源组[9]:更新1(x,y)
      self.人物资源组[10]:更新1(x,y)
      self.人物资源组[11]:更新1(x,y)
      self.人物资源组[12]:更新1(x,y)
      self.人物资源组[13]:更新1(x,y)
      if (keyaz(KEY.ALT) and keyax(KEY.Q)) then
        if 战斗类.战斗快捷键法术~=nil then
          战斗类.战斗指令:设置法术参数(战斗类.战斗快捷键法术)
        else
          tp.提示:写入("#Y/为设置快捷键技能!自动转为普通攻击...")
          self:设置指令1(0)
        end
      elseif (keyaz(KEY.ALT) and keyax(KEY.A)) then
        self:设置指令1(0)
      elseif self.人物资源组[7]:事件判断() or (keyaz(KEY.ALT) and keyax(KEY.T)) then
        self.命令版面=false
        self.命令类型="保护"
        tp.鼠标.置鼠标("保护")
      elseif self.人物资源组[2]:事件判断() or (keyaz(KEY.ALT) and keytq(KEY.W)) then
        tp.鼠标.置鼠标("普通")
        self.法术界面:打开(self.参战单位[self.单位编号[self.操作对象]].主动技能,"法术","人物")
      elseif self.人物资源组[4]:事件判断() then
        tp.鼠标.置鼠标("普通")
        self.法术界面:打开(self.参战单位[self.单位编号[self.操作对象]].特技技能,"特技","人物")
      elseif self.人物资源组[3]:事件判断() then
        发送数据(5508)
      elseif self.人物资源组[5]:事件判断() or (keyaz(KEY.ALT) and keyax(KEY.E)) then
        发送数据(5504)
      elseif self.人物资源组[6]:事件判断() or (keyaz(KEY.ALT) and keyax(KEY.D)) then
        self.命令类型="防御"
        self:设置指令1(0)
      elseif self.人物资源组[9]:事件判断() then
        if self.召唤界面.可视 then
          self.召唤界面:打开(tp.队伍[1])
        else
          发送数据(5505)
        end
      elseif self.人物资源组[11]:事件判断() then
        if 战斗类.自动开关 then
          战斗类.自动开关=false
        else
          战斗类.自动开关=true
        end
      elseif self.人物资源组[12]:事件判断() then
        self:设置捕捉()
      elseif self.人物资源组[13]:事件判断() then
        self:设置逃跑()
      elseif (keyaz(KEY.ALT) and keyax(KEY.G)) then
        self:设置捕捉(法术)
      end
    else
      if self.参战单位[self.单位编号[self.操作对象]].数据.类型=="bb" then
        self.召唤兽资源组[2]:更新1(x,y)
        self.召唤兽资源组[3]:更新1(x,y)
        self.召唤兽资源组[4]:更新1(x,y)
        self.召唤兽资源组[5]:更新1(x,y)
        self.召唤兽资源组[6]:更新1(x,y)
        if (keyaz(KEY.ALT) and keyax(KEY.Q)) then
          if 战斗类.宠物战斗快捷键法术~=nil and 战斗类.宠物战斗快捷键法术~=0 and self.参战单位~=nil and self.参战单位[self.单位编号[self.操作对象]]~=nil and self.参战单位[self.单位编号[self.操作对象]].主动技能~=nil then
            if self.参战单位[self.单位编号[self.操作对象]].主动技能[战斗类.宠物战斗快捷键法术]~=nil and self.参战单位[self.单位编号[self.操作对象]].主动技能[战斗类.宠物战斗快捷键法术].名称~=nil then
              战斗类.战斗指令:设置宠物法术参数(self.参战单位[self.单位编号[self.操作对象]].主动技能[战斗类.宠物战斗快捷键法术])
            else
              tp.提示:写入("#Y/未设置快捷键技能!自动转为普通攻击...")
              self:设置指令1(0)
            end
          else
            tp.提示:写入("#Y/未设置快捷键技能!自动转为普通攻击...")
            self:设置指令1(0)
          end
        elseif (keyaz(KEY.ALT) and keyax(KEY.A)) then
          self:设置指令1(0)
        elseif self.召唤兽资源组[5]:事件判断() or (keyaz(KEY.ALT) and keyax(KEY.T)) then
          self.命令版面=false
          self.命令类型="保护"
          tp.鼠标.置鼠标("保护")
        elseif self.召唤兽资源组[2]:事件判断() or (keyaz(KEY.ALT) and keytq(KEY.W)) then
          tp.鼠标.置鼠标("普通")
          self.法术界面:打开(self.参战单位[self.单位编号[self.操作对象]].主动技能,"法术","宠物")
        elseif self.召唤兽资源组[3]:事件判断() or (keyaz(KEY.ALT) and keyax(KEY.E)) then
          发送数据(5504)
        elseif self.召唤兽资源组[4]:事件判断() or (keyaz(KEY.ALT) and keyax(KEY.D)) then
          self.命令类型="防御"
          self:设置指令1(0)
        elseif self.召唤兽资源组[6]:事件判断() then
          self:设置逃跑()
        end
      else
        if self.完成指令[1].类型 == "逃跑" then
          self:设置逃跑()
        end
        self.助战资源组[2]:更新1(x,y) --法术
        self.助战资源组[3]:更新1(x,y) --特技
        self.助战资源组[4]:更新1(x,y) --道具
        self.助战资源组[5]:更新1(x,y) --防御
        self.助战资源组[6]:更新1(x,y) --保护
        if (keyaz(KEY.ALT) and keyax(KEY.Q)) then
          if 战斗类.宠物战斗快捷键法术~=nil and 战斗类.宠物战斗快捷键法术~=0 and self.参战单位~=nil and self.参战单位[self.单位编号[self.操作对象]]~=nil and self.参战单位[self.单位编号[self.操作对象]].主动技能~=nil then
            if self.参战单位[self.单位编号[self.操作对象]].主动技能[战斗类.宠物战斗快捷键法术]~=nil and self.参战单位[self.单位编号[self.操作对象]].主动技能[战斗类.宠物战斗快捷键法术].名称~=nil then
              战斗类.战斗指令:设置宠物法术参数(self.参战单位[self.单位编号[self.操作对象]].主动技能[战斗类.宠物战斗快捷键法术])
            else
              tp.提示:写入("#Y/未设置快捷键技能!自动转为普通攻击...")
              self:设置指令1(0)
            end
          else
            tp.提示:写入("#Y/未设置快捷键技能!自动转为普通攻击...")
            self:设置指令1(0)
          end
        elseif (keyaz(KEY.ALT) and keyax(KEY.A)) then
          self:设置指令1(0)
        elseif self.助战资源组[6]:事件判断() or (keyaz(KEY.ALT) and keyax(KEY.T)) then
          self.命令版面=false
          self.命令类型="保护"
          tp.鼠标.置鼠标("保护")
        elseif self.助战资源组[2]:事件判断() or (keyaz(KEY.ALT) and keytq(KEY.W)) then --法术
          tp.鼠标.置鼠标("普通")
          self.法术界面:打开(self.参战单位[self.单位编号[self.操作对象]].主动技能,"法术","宠物")
        elseif self.助战资源组[3]:事件判断() then
          tp.鼠标.置鼠标("普通")
          self.法术界面:打开(self.参战单位[self.单位编号[self.操作对象]].特技技能,"特技","宠物")
        elseif self.助战资源组[4]:事件判断() or (keyaz(KEY.ALT) and keyax(KEY.E)) then
          发送数据(5504)
        elseif self.助战资源组[5]:事件判断() or (keyaz(KEY.ALT) and keyax(KEY.D)) then
          self.命令类型="防御"
          self:设置指令1(0)
        end
      end
    end
 	end
  if 引擎.鼠标弹起(右键) then
    if self.命令类型=="保护" or self.命令类型=="捕捉" or self.命令类型=="法术" or self.命令类型=="道具"  then
      self.命令版面=true
      self.命令类型="攻击"
    end
    tp.鼠标.置鼠标("普通")
  end
  self:选择单位(x,y)

end

function 战斗命令类:重置高亮(x,y)
  local 单位选中=0
  for n=1,#self.参战单位 do
    if self.参战单位[n].高亮显示 then
      self.参战单位[n]:取消高亮()
      self.参战单位[n].高亮显示=nil
    end
  end
  tp.鼠标.置鼠标("普通")
end

function 战斗命令类:取类型选择(敌我)
  if self.命令类型=="法术" or self.命令类型=="道具" then
    if 敌我==2 and  self.命令附加==4 then
      return true
    elseif 敌我==1 and (self.命令附加==5 or self.命令附加==6 or self.命令附加==3) then
      return true
    end
  elseif self.命令类型=="攻击" or self.命令类型=="捕捉" then
    if 敌我==2 then
      return true
    end
  end
  return false
end

function 战斗命令类:界面重叠(x,y)
  if self.法术开关 and self.法术界面:检查点() then
    return true
  end
  return false
end

function 战斗命令类:选择单位(x,y)
  local 单位选中=0
  for n=1,#self.参战单位 do
    if self.参战单位[n]:是否选中(x,y) and self:界面重叠()==false and self.法术开关==false and self.召唤开关==false and self.道具开关==false  then--and self:取类型选择(self.参战单位[n].敌我)
      单位选中=n
      self.参战单位[n]:置高亮()
      self.参战单位[n].高亮显示=true
      战斗类.提示=self.参战单位[n].名称
      local 允许选择=false
      if self.命令类型=="攻击" and self.参战单位[n].敌我==2 and self:取类型选择(self.参战单位[n].敌我) then
        tp.鼠标.置鼠标("攻击")
        允许选择=true
      elseif self.命令类型=="保护" and self.参战单位[n].敌我==1 and n~=self.操作对象 then
        允许选择=true
      elseif self.命令类型=="法术" and self:取类型选择(self.参战单位[n].敌我) then
        允许选择=true
      elseif self.命令类型=="道具" and self:取类型选择(self.参战单位[n].敌我) then
        允许选择=true
      elseif self.参战单位[n].敌我==2 and self.命令类型=="捕捉" and self:取类型选择(self.参战单位[n].敌我) then--and n~=self.操作对象
        允许选择=true
      end
      if 允许选择 and 引擎.鼠标弹起(左键) then
        self:设置指令(n)
      end
    elseif self.参战单位[n].高亮显示 then
      self.参战单位[n]:取消高亮()
      self.参战单位[n].高亮显示=nil
    end
  end
  if 单位选中==0 then  战斗类.提示=nil end
  if self.命令类型=="攻击" and 单位选中==0 then
    tp.鼠标.置鼠标("普通")
  end
end

function 战斗命令类:结束()
  tp.鼠标.置鼠标("普通")
end

function 战斗命令类:显示(dt,x,y,类型)
  if self.道具栏.可视 then
    self.道具栏:显示(dt,x,y)
  end
  if self.命令版面 then
    if self.操作对象==1 then
      self.人物资源组[1]:显示(self.x + 67,self.y)
      self.人物资源组[2]:显示(self.x + 70,self.y + 4)
      self.人物资源组[3]:显示(self.x + 70,self.y + 4 + 24)
      self.人物资源组[4]:显示(self.x + 70,self.y + 4 + 24 * 2)
      self.人物资源组[5]:显示(self.x + 70,self.y + 4 + 24 * 3)
      self.人物资源组[6]:显示(self.x + 70,self.y + 4 + 24 * 4)
      self.人物资源组[7]:显示(self.x + 70,self.y + 4 + 24 * 5)
      self.人物资源组[8]:显示(self.x + 70,self.y + 4 + 24 * 6)
      self.人物资源组[9]:显示(self.x + 70,self.y + 4 + 24 * 7)
      self.人物资源组[10]:显示(self.x + 70,self.y + 4 + 24 * 8)
      self.人物资源组[11]:显示(self.x + 70,self.y + 4 + 24 * 9)
      self.人物资源组[12]:显示(self.x + 70,self.y + 4 + 24 * 10)
      self.人物资源组[13]:显示(self.x + 70,self.y + 4 + 24 * 11)
    elseif self.参战单位[self.单位编号[self.操作对象]].数据.类型=="bb" then
      self.召唤兽资源组[1]:显示(self.x + 67,self.y)
        zts:显示(self.x+73,self.y+3,self.参战单位[self.单位编号[self.操作对象]].名称)
      self.召唤兽资源组[2]:显示(self.x + 70,self.y + 20)
      self.召唤兽资源组[3]:显示(self.x + 70,self.y + 20 + 24)
      self.召唤兽资源组[4]:显示(self.x + 70,self.y + 20 + 24 * 2)
      self.召唤兽资源组[5]:显示(self.x + 70,self.y + 20 + 24 * 3)
      self.召唤兽资源组[6]:显示(self.x + 70,self.y + 20 + 24 * 4)
     -- self.召唤兽资源组[7]:显示(self.x + 70,self.y + 20 + 24 * 5)
    else
      self.助战资源组[1]:显示(self.x + 67,self.y)
      if self.参战单位[self.单位编号[2]] ~= nil and self.参战单位[self.单位编号[2]].数据.类型=="bb" then
        zts:显示(self.x+73,self.y+3,self.参战单位[self.单位编号[self.操作对象]].名称)
      else
        zts:显示(self.x+73,self.y+3,self.参战单位[self.单位编号[self.操作对象]].名称)
      end
      self.助战资源组[2]:显示(self.x + 70,self.y + 20)
      self.助战资源组[3]:显示(self.x + 70,self.y + 20 + 24)
      self.助战资源组[4]:显示(self.x + 70,self.y + 20 + 24 * 2)
      self.助战资源组[5]:显示(self.x + 70,self.y + 20 + 24 * 3)
      self.助战资源组[6]:显示(self.x + 70,self.y + 20 + 24 * 4)
      --self.助战资源组[7]:显示(self.x + 70,self.y + 20 + 24 * 5)
    end
    if self.法术开关 then
      self.法术界面:显示(dt,x,y)
    end
    if self.召唤开关 then
      self.召唤界面:更新(dt,x,y)
      self.召唤界面:显示(dt,x,y)
    end
  end
end

return 战斗命令类