--======================================================================--

--======================================================================--
local 系统类_元神 = class()
local floor = math.floor
local tp,zts,zt
local format = string.format
local insert = table.insert

function 系统类_元神:初始化(根)
  self.x = 120
  self.y = 120
  self.xx = 0
  self.yy = 0
  self.注释 = "元 神 突 破"
  self.可视 = false
  self.鼠标 = false
  self.焦点 = false
  self.可移动 = true
  tp = 根
  self.窗口时间 = 0
  zts = tp.字体表.道具字体
  zt = tp.字体表.描边字体

  self.进程=1
    self.突破=1
  self.控件类 = require("ggeui/加载类")()
  local 总控件 = self.控件类:创建控件('序号控件')
  总控件:置可视(true,true)
  self.输入框 = 总控件:创建输入("卡号输入",0,0,180,14)
  self.输入框:置可视(false,false)
  self.输入框:置限制字数(30)
  self.输入框:屏蔽快捷键(true)
  self.输入框:置光标颜色(-16777216)
  self.输入框:置文字颜色(-16777216)

  self.数量框 = 总控件:创建输入("数量输入",0,0,180,14)
  self.数量框:置可视(false,false)
  self.数量框:置限制字数(10)
  self.数量框:置数字模式()
  self.数量框:屏蔽快捷键(true)
  self.数量框:置光标颜色(-16777216)
  self.数量框:置文字颜色(-16777216)

end

function 系统类_元神:打开(数据)
  if self.可视 then
    self.可视 = false
    self.资源组=nil
    return
  else
    insert(tp.窗口_,self)
    local 资源 = tp.资源
    local 按钮 = tp._按钮
    local 自适应 = tp._自适应
    self.动态1 = 资源:载入('wzife.wd2',"网易WDF动画",0x103FA0FF)
    self.动态2 = 资源:载入('wzife.wd2',"网易WDF动画",0x8E28D6F3)
    self.动态3 = 资源:载入('wzife.wd2',"网易WDF动画",0x76F0D6C6)
    self.动态4 = 资源:载入('wzife.wd2',"网易WDF动画",0x7F01F6E7)
    self.动态5 = 资源:载入('wzife.wd2',"网易WDF动画",0x71321C77)
    self.聊天 = 资源:载入('wzife.wd2',"网易WDF动画",0x98AAC807)
    self.资源组 = {
      [1] = 资源:载入('npk/bj.npk',"网易WDF动画",0x10001000),
      [2] = 资源:载入('npk/bj.npk',"网易WDF动画",0x10005000),
      [3] = 按钮.创建(tp.资源:载入('npk/bj.npk',"网易WDF动画",0x10002000),0,0,4,true,true,"个人元神突破"),
      [4] = 按钮.创建(tp.资源:载入('npk/bj.npk',"网易WDF动画",0x10002000),0,0,4,true,true,"所有门派特性"),
      [7] = 按钮.创建(tp.资源:载入('npk/bj.npk',"网易WDF动画",0x10003000),0,0,4,true,true),
         -----------门派 -----------
      [9]  = 按钮.创建(tp.资源:载入('npk/bj.npk',"网易WDF动画",0x10004000),0,0,4,true,true),--,"  方寸山"
      [10] = 按钮.创建(tp.资源:载入('npk/bj.npk',"网易WDF动画",0x10004000),0,0,4,true,true),--,"  龙宫"
      [11] = 按钮.创建(tp.资源:载入('npk/bj.npk',"网易WDF动画",0x10004000),0,0,4,true,true),--,"  女儿村"
      [12] = 按钮.创建(tp.资源:载入('npk/bj.npk',"网易WDF动画",0x10004000),0,0,4,true,true),--,"  神木林"
      [13] = 按钮.创建(tp.资源:载入('npk/bj.npk',"网易WDF动画",0x10004000),0,0,4,true,true),--,"  大唐"
      [14] = 按钮.创建(tp.资源:载入('npk/bj.npk',"网易WDF动画",0x10004000),0,0,4,true,true),--,"  化生寺"
      [15] = 按钮.创建(tp.资源:载入('npk/bj.npk',"网易WDF动画",0x10004000),0,0,4,true,true),--,"  地府"
      [16] = 按钮.创建(tp.资源:载入('npk/bj.npk',"网易WDF动画",0x10004000),0,0,4,true,true),--,"  盘丝洞"
      [17] = 按钮.创建(tp.资源:载入('npk/bj.npk',"网易WDF动画",0x10004000),0,0,4,true,true),--,"  狮驼岭"
      [18] = 按钮.创建(tp.资源:载入('npk/bj.npk',"网易WDF动画",0x10004000),0,0,4,true,true),--,"  魔王寨"
      [19] = 按钮.创建(tp.资源:载入('npk/bj.npk',"网易WDF动画",0x10004000),0,0,4,true,true),--,"  普陀山"
      [20] = 按钮.创建(tp.资源:载入('npk/bj.npk',"网易WDF动画",0x10004000),0,0,4,true,true),--,"  天宫"
      [21] = 按钮.创建(tp.资源:载入('npk/bj.npk',"网易WDF动画",0x10004000),0,0,4,true,true),--,"  凌波城"
      [22] = 按钮.创建(tp.资源:载入('npk/bj.npk',"网易WDF动画",0x10004000),0,0,4,true,true),--,"  五庄观"
      [23] = 按钮.创建(tp.资源:载入('npk/bj.npk',"网易WDF动画",0x10004000),0,0,4,true,true),--,"  天机城"
      [24] = 按钮.创建(tp.资源:载入('npk/bj.npk',"网易WDF动画",0x10004000),0,0,4,true,true),--,"  女魃墓"
      [25] = 按钮.创建(tp.资源:载入('npk/bj.npk',"网易WDF动画",0x10004000),0,0,4,true,true),--,"  花果山"
      [26] = 按钮.创建(tp.资源:载入('npk/bj.npk',"网易WDF动画",0x10004000),0,0,4,true,true),--,"  无底洞"


    }
        self.方寸山 = 图像类("save/bj/fc.png")
        self.龙宫 = 图像类("save/bj/lg.png")
        self.女儿村 = 图像类("save/bj/ne.png")
        self.神木林 = 图像类("save/bj/sml.png")
        self.大唐官府 = 图像类("save/bj/dt.png")
        self.化生寺 = 图像类("save/bj/hss.png")
        self.阴曹地府 = 图像类("save/bj/df.png")
        self.盘丝洞 = 图像类("save/bj/psd.png")
        self.狮驼岭 = 图像类("save/bj/stl.png")
        self.魔王寨 = 图像类("save/bj/mw.png")
        self.普陀山 = 图像类("save/bj/pts.png")
        self.天宫 = 图像类("save/bj/tg.png")
        self.凌波城 = 图像类("save/bj/lbc.png")
        self.五庄观 = 图像类("save/bj/wzg.png")
        self.天机城 = 图像类("save/bj/tjc.png")
        self.女魃墓 = 图像类("save/bj/nbm.png")
        self.花果山 = 图像类("save/bj/hgs.png")
        self.无底洞 = 图像类("save/bj/wdd.png")

               self.方寸山元神={
        [1]= "当前效果为：气血上限+2000，面板属性+,50",
        [2]= "当前效果为：面板属性+,88",
        [3]= "当前效果为：落雷符伤害结果为100%～110%",
        [4]= "当前效果为：落雷符伤害结果为110%～120%",
        [5]= "当前效果为：落雷符伤害结果为120%～130%",

    }

        self.龙宫元神 ={
        [1]= "当前效果为：气血上限+2000，面板属性+,50",
        [2]= "当前效果为：面板属性+,88",
        [3]="当前效果为：龙卷雨击伤害结果为100%～110%，10%\n几率触发法连效果",
        [4]="当前效果为：龙卷雨击伤害结果为110%～120%，30%\n几率触发法连效果",
        [5]="当前效果为：龙卷雨击伤害结果为120%～130%，60%\n几率触发法连效果",
    }
       self.女儿村元神 = {
        [1]= "当前效果为：气血上限+2000，面板属性+,50",
        [2]= "当前效果为：面板属性+,88",
        [3]="当前效果为：固定伤害结果为100%～110%",
        [4]="当前效果为：固定伤害结果为110%～120%",
        [5]="当前效果为：固定伤害结果为120%～130%",
    }
       self.神木林元神 = {
        [1]= "当前效果为：气血上限+2000，面板属性+,50",
        [2]= "当前效果为：面板属性+,88",
        [3]="当前效果为：落叶萧萧的伤害结果为100%～110%",
        [4]="当前效果为：落叶萧萧的伤害结果为110%～120%",
        [5]="当前效果为：落叶萧萧的伤害结果为120%～130%",
    }
         self.大唐官府元神 ={
        [1]= "当前效果为：气血上限+2000，面板属性+,50",
        [2]= "当前效果为：面板属性+,88",
        [3]="当前效果为：横扫千军伤害结果为100%～110%,",
        [4]="当前效果为：横扫千军伤害结果为110%～120%,",
        [5]="当前效果为：横扫千军伤害结果为120%～130%,",
    }
       self.化生寺元神 = {
        [1]= "当前效果为：气血上限+2000，面板属性+,50",
        [2]= "当前效果为：面板属性+,88",
        [3]="当前效果为：推气过宫恢复气血为100%～110%",
        [4]="当前效果为：推气过宫恢复气血为110%～120%",
        [5]="当前效果为：推气过宫恢复气血为120%～130%",
    }
        self.阴曹地府元神 ={
        [1]= "当前效果为：气血上限+2000，面板属性+,50",
        [2]= "当前效果为：面板属性+,88",
        [3]= "当前效果为：尸腐毒每回合减血结果为100%～150%",
        [4]= "当前效果为：尸腐毒每回合减血结果为110%～120%",
        [5]= "当前效果为：尸腐毒每回合减血结果为120%～130%",
    }
        self.盘丝洞元神 = {
        [1]= "当前效果为：气血上限+2000，面板属性+,50",
        [2]= "当前效果为：面板属性+,88",
        [3]="当前效果为：含情脉脉30%几率无视一切状态\n并命中",
        [4]="当前效果为：含情脉脉60%几率无视一切状态\n并命中",
        [5]="当前效果为：含情脉脉80%几率无视一切状态\n并命中",
    }
        self.狮驼岭元神 = {
        [1]= "当前效果为：气血上限+2000，面板属性+,50",
        [2]= "当前效果为：面板属性+,88",
        [3]= "当前效果为：鹰击后有30%概率不休息",
        [4]= "当前效果为：鹰击后有60%概率不休息",
        [5]= "当前效果为：鹰击后有80%概率不休息",
    }
        self.魔王寨元神 = {
        [1]= "当前效果为：气血上限+2000，面板属性+,50",
        [2]= "当前效果为：面板属性+,88",
        [3]= "当前效果为：三味真火，飞沙走石\n伤害结果为100%～110%",
        [4]= "当前效果为：三味真火，飞沙走石\n伤害结果为110%～120%",
        [5]= "当前效果为：三味真火，飞沙走石\n伤害结果为120%～130%",
    }
         self.普陀山元神 = {
        [1]= "当前效果为：气血上限+2000，面板属性+,50",
        [2]= "当前效果为：面板属性+,88",
        [3]="当前效果为：杨柳甘露复活队友直接恢复30%气血",
        [4]="当前效果为：杨柳甘露复活队友直接恢复60%气血",
        [5]="当前效果为：杨柳甘露复活队友直接恢复80%气血",
    }
        self.天宫元神 = {
        [1]= "当前效果为：气血上限+2000，面板属性+,50",
        [2]= "当前效果为：面板属性+,88",
        [3]= "当前效果为：雷霆万钧伤害结果为100%～110%",
        [4]= "当前效果为：雷霆万钧伤害结果为110%～120%",
        [5]= "当前效果为：雷霆万钧伤害结果为120%～130%",
    }
       self.凌波城元神 = {
        [1]= "当前效果为：气血上限+2000，面板属性+,50",
        [2]= "当前效果为：面板属性+,88",
        [3]= "当前效果为：开局直接获得6点战意",
        [4]= "当前效果为：开局直接获得8点战意",
        [5]= "当前效果为：开局直接获得10点战意，浪涌目标+1",
    }
        self.五庄观元神 = {
        [1]= "当前效果为：气血上限+2000，面板属性+,50",
        [2]= "当前效果为：面板属性+,88",
        [3]= "当前效果为：飘渺式伤害结果为100%～110%",
        [4]= "当前效果为：飘渺式伤害结果为110%～120%",
        [5]= "当前效果为：飘渺式伤害结果为120%～130%",
    }
       self.天机城元神 = {
        [1]= "当前效果为：气血上限+2000，面板属性+,50",
        [2]= "当前效果为：面板属性+,88",
        [3]= "当前效果为：匠心·削铁、匠心·固甲、匠心\n·蓄锐 ",
        [4]= "当前效果为：匠心·削铁、匠心·固甲、匠心\n·蓄锐 ",
        [5]= "当前效果为：匠心·削铁、匠心·固甲、匠心\n·蓄锐 ",
    }
        self.女魃墓元神 = {
        [1]= "当前效果为：气血上限+2000，面板属性+,50",
        [2]= "当前效果为：面板属性+,88",
        [3]= "当前效果为：女魃墓召唤所有单位全属性提\n升为100%～110%",
        [4]= "当前效果为：女魃墓召唤所有单位全属性提\n升为110%～120%",
        [5]= "当前效果为：女魃墓召唤所有单位全属性提\n升为120%～130%",
    }
      self.花果山元神 = {
        [1]= "当前效果为：气血上限+2000，面板属性+,50",
        [2]= "当前效果为：面板属性+,88",
        [3]= "当前效果为：神针撼海的起始伤害为100%～110%",
        [4]= "当前效果为：神针撼海的起始伤害为110%～120%",
        [5]= "当前效果为：神针撼海的起始伤害为120%～130%",
    }
        self.无底洞元神 = {
        [1]= "当前效果为：气血上限+2000，面板属性+,50",
        [2]= "当前效果为：面板属性+,88",
        [3]= "当前效果为：地涌金莲的恢复气血为100%～110%",
        [4]= "当前效果为：地涌金莲的恢复气血为110%～120%",
        [5]= "当前效果为：地涌金莲的恢复气血为120%～130%",
    }



    self.数据=数据
    tp.运行时间 = tp.运行时间 + 1
      self.窗口时间 = tp.运行时间
      self.可视 = true
      self.进程=1
      self.突破=1
      self.信息=1


  end
end

function 系统类_元神:刷新(数据)
  self.数据 = 数据



end

function 系统类_元神:显示(dt,x,y)
  self.焦点 = false
  self.动态1:更新(dt)
  self.动态2:更新(dt)
  self.动态3:更新(dt)
  self.动态4:更新(dt)
  self.动态5:更新(dt)
  self.资源组[3]:更新(x,y,self.进程~=1)
  self.资源组[4]:更新(x,y,self.进程~=2)
  self.资源组[9]:更新(x,y,self.进程~=3)
  self.资源组[10]:更新(x,y,self.进程~=4)
  self.资源组[11]:更新(x,y,self.进程~=5)
  self.资源组[12]:更新(x,y,self.进程~=6)
  self.资源组[13]:更新(x,y,self.进程~=7)
  self.资源组[14]:更新(x,y,self.进程~=8)
  self.资源组[15]:更新(x,y,self.进程~=9)
  self.资源组[16]:更新(x,y,self.进程~=10)
  self.资源组[17]:更新(x,y,self.进程~=11)
  self.资源组[18]:更新(x,y,self.进程~=12)
  self.资源组[19]:更新(x,y,self.进程~=13)
  self.资源组[20]:更新(x,y,self.进程~=14)
  self.资源组[21]:更新(x,y,self.进程~=15)
  self.资源组[22]:更新(x,y,self.进程~=16)
  self.资源组[23]:更新(x,y,self.进程~=17)
  self.资源组[24]:更新(x,y,self.进程~=18)
  self.资源组[25]:更新(x,y,self.进程~=19)
  self.资源组[26]:更新(x,y,self.进程~=20)


  self.资源组[1]:显示(self.x,self.y)
  self.资源组[3]:显示(self.x + 28,self.y + 28)
  self.资源组[4]:显示(self.x + 128,self.y + 28)

  zt:显示(self.x+269,self.y+4,self.注释)


  if self.资源组[3]:事件判断() then
    self.进程=1
    self.资源组[3]:显示(self.x + 28,self.y + 28,nil,nil,nil,self.进程==1,3)
  elseif self.资源组[4]:事件判断() then
    self.进程=2
         self.资源组[4]:显示(self.x + 128,self.y + 28,nil,nil,nil,self.进程==2,3)
  elseif self.资源组[7]:事件判断() then
       发送数据(100.16)
  end



if self.进程 == 1 then
  self.突破 = self.数据.层数+1
  local 元神名称 = self.数据.门派.."元神"
   self.资源组[2]:显示(self.x + 81,self.y + 63)
   self[self.数据.门派]:显示(self.x+349,self.y+62)
   if self.数据.层数 == 0 then
   tp.字体表.普通字体:置颜色(0xFFFF0000):显示(self.x+260,self.y+170,"当前无元神")
   else
   tp.字体表.普通字体:置颜色(0xFFFF0000):显示(self.x+260,self.y+170,self[元神名称][self.数据.层数])
   end
   tp.字体表.普通字体:置颜色(0xFFFF0000):显示(self.x+128,self.y+70,"一阶")
   tp.字体表.普通字体:置颜色(0xFFFF0000):显示(self.x+128,self.y+111,"二阶")
   tp.字体表.普通字体:置颜色(0xFFFF0000):显示(self.x+128,self.y+152,"三阶")
   tp.字体表.普通字体:置颜色(0xFFFF0000):显示(self.x+128,self.y+191,"四阶")
   tp.字体表.普通字体:置颜色(0xFFFF0000):显示(self.x+128,self.y+231,"五阶")
   --tp.字体表.普通字体:置颜色(0xFFFF0000):显示(self.x+128,self.y+208,"四阶")
   --tp.字体表.普通字体:置颜色(0xFFFF0000):显示(self.x+128,self.y+247,"五阶")

if self.突破 == 1 then
   self.资源组[7]:更新(x,y)
   self.资源组[7]:显示(self.x + 179,self.y + 72)

    tp.字体表.普通字体:置颜色(0xFFFF0000):显示(self.x+128,self.y+87,"可突破")
    tp.字体表.普通字体:置颜色(0xFFFF0000):显示(self.x+128,self.y+128,"未突破")
    tp.字体表.普通字体:置颜色(0xFFFF0000):显示(self.x+128,self.y+169,"未突破")
    tp.字体表.普通字体:置颜色(0xFFFF0000):显示(self.x+128,self.y+208,"未突破")
    tp.字体表.普通字体:置颜色(0xFFFF0000):显示(self.x+128,self.y+247,"未突破")
end
if self.突破 == 2 then
   self.资源组[7]:更新(x,y)
   self.资源组[7]:显示(self.x + 179,self.y + 112)
    tp.字体表.普通字体:置颜色(0xFFFF0000):显示(self.x+128,self.y+87,"已突破")
    tp.字体表.普通字体:置颜色(0xFFFF0000):显示(self.x+128,self.y+128,"可突破")
    tp.字体表.普通字体:置颜色(0xFFFF0000):显示(self.x+128,self.y+169,"未突破")
    tp.字体表.普通字体:置颜色(0xFFFF0000):显示(self.x+128,self.y+208,"未突破")
    tp.字体表.普通字体:置颜色(0xFFFF0000):显示(self.x+128,self.y+247,"未突破")
end
if self.突破 == 3 then
   self.资源组[7]:更新(x,y)
   self.资源组[7]:显示(self.x + 179,self.y + 152)
    tp.字体表.普通字体:置颜色(0xFFFF0000):显示(self.x+128,self.y+87,"已突破")
    tp.字体表.普通字体:置颜色(0xFFFF0000):显示(self.x+128,self.y+128,"已突破")
    tp.字体表.普通字体:置颜色(0xFFFF0000):显示(self.x+128,self.y+169,"可突破")
        tp.字体表.普通字体:置颜色(0xFFFF0000):显示(self.x+128,self.y+208,"未突破")
    tp.字体表.普通字体:置颜色(0xFFFF0000):显示(self.x+128,self.y+247,"未突破")
end
if self.突破 == 4 then
   self.资源组[7]:更新(x,y)
   self.资源组[7]:显示(self.x + 179,self.y + 192)
    tp.字体表.普通字体:置颜色(0xFFFF0000):显示(self.x+128,self.y+87,"已突破")
    tp.字体表.普通字体:置颜色(0xFFFF0000):显示(self.x+128,self.y+128,"已突破")
     tp.字体表.普通字体:置颜色(0xFFFF0000):显示(self.x+128,self.y+169,"已突破")
         tp.字体表.普通字体:置颜色(0xFFFF0000):显示(self.x+128,self.y+208,"可突破")
    tp.字体表.普通字体:置颜色(0xFFFF0000):显示(self.x+128,self.y+247,"未突破")
end
if self.突破 == 5 then
   self.资源组[7]:更新(x,y)
  self.资源组[7]:显示(self.x + 179,self.y + 232)
    tp.字体表.普通字体:置颜色(0xFFFF0000):显示(self.x+128,self.y+87,"已突破")
    tp.字体表.普通字体:置颜色(0xFFFF0000):显示(self.x+128,self.y+128,"已突破")
    tp.字体表.普通字体:置颜色(0xFFFF0000):显示(self.x+128,self.y+169,"已突破")
        tp.字体表.普通字体:置颜色(0xFFFF0000):显示(self.x+128,self.y+208,"已突破")
    tp.字体表.普通字体:置颜色(0xFFFF0000):显示(self.x+128,self.y+247,"可突破")

end
if self.突破 == 6 then

    tp.字体表.普通字体:置颜色(0xFFFF0000):显示(self.x+128,self.y+87,"已突破")
    tp.字体表.普通字体:置颜色(0xFFFF0000):显示(self.x+128,self.y+128,"已突破")
    tp.字体表.普通字体:置颜色(0xFFFF0000):显示(self.x+128,self.y+169,"已突破")
        tp.字体表.普通字体:置颜色(0xFFFF0000):显示(self.x+128,self.y+208,"已突破")
    tp.字体表.普通字体:置颜色(0xFFFF0000):显示(self.x+128,self.y+247,"已突破")

end

end
if self.进程 == 2 or self.进程 ==3 or  self.进程 ==4 or   self.进程 ==5 or   self.进程 ==6 or   self.进程 ==7 or   self.进程 ==8 or   self.进程 ==9 or   self.进程 ==10 or   self.进程 ==11 or   self.进程 ==12 or   self.进程 ==13 or   self.进程 ==14 or   self.进程 ==15 or   self.进程 ==16 or   self.进程 ==17 or   self.进程 ==18 or   self.进程 ==19 or   self.进程 ==20    then

    self.xxx=0
    self.yyy=0
    for i=9,26 do
      if self.yyy>=18 then
          self.yyy=0
      end
      self.资源组[i]:显示(self.x+85+self.xxx,self.y+67+self.yyy*16)
      self.yyy=self.yyy+1
    end
   tp.字体表.普通字体:置颜色(0xFFFF0000):显示(self.x+118,self.y+68,"方  寸  山")
   tp.字体表.普通字体:置颜色(0xFFFF0000):显示(self.x+118,self.y+68+16*1,"龙      宫")
   tp.字体表.普通字体:置颜色(0xFFFF0000):显示(self.x+118,self.y+68+16*2,"女  儿  村")
   tp.字体表.普通字体:置颜色(0xFFFF0000):显示(self.x+118,self.y+68+16*3,"神  木  林")
   tp.字体表.普通字体:置颜色(0xFFFF0000):显示(self.x+118,self.y+68+16*4,"大      唐")
   tp.字体表.普通字体:置颜色(0xFFFF0000):显示(self.x+118,self.y+68+16*5,"化  生  寺")
   tp.字体表.普通字体:置颜色(0xFFFF0000):显示(self.x+118,self.y+68+16*6,"地      府")
   tp.字体表.普通字体:置颜色(0xFFFF0000):显示(self.x+118,self.y+68+16*7,"盘  丝  洞")
   tp.字体表.普通字体:置颜色(0xFFFF0000):显示(self.x+118,self.y+68+16*8,"狮  驼  岭")
   tp.字体表.普通字体:置颜色(0xFFFF0000):显示(self.x+118,self.y+68+16*9,"魔  王  寨")
   tp.字体表.普通字体:置颜色(0xFFFF0000):显示(self.x+118,self.y+68+16*10,"普  陀  山")
   tp.字体表.普通字体:置颜色(0xFFFF0000):显示(self.x+118,self.y+68+16*11,"天      宫")
   tp.字体表.普通字体:置颜色(0xFFFF0000):显示(self.x+118,self.y+68+16*12,"凌  波  城")
   tp.字体表.普通字体:置颜色(0xFFFF0000):显示(self.x+118,self.y+68+16*13,"五  庄  观")
   tp.字体表.普通字体:置颜色(0xFFFF0000):显示(self.x+118,self.y+68+16*14,"天  机  城")
   tp.字体表.普通字体:置颜色(0xFFFF0000):显示(self.x+118,self.y+68+16*15,"女  魃  墓")
   tp.字体表.普通字体:置颜色(0xFFFF0000):显示(self.x+118,self.y+68+16*16,"花  果  山")
   tp.字体表.普通字体:置颜色(0xFFFF0000):显示(self.x+118,self.y+68+16*17,"无  底  洞")

if self.资源组[9]:事件判断() then
    self.进程=3
    self.资源组[9]:显示(self.x + 85,self.y + 67,nil,nil,nil,self.进程==3,3)

elseif self.资源组[10]:事件判断() then
  self.进程=4
    self.资源组[10]:显示(self.x + 85,self.y + 67+16,nil,nil,nil,self.进程==4,3)

elseif self.资源组[11]:事件判断() then
  self.进程=5
    self.资源组[11]:显示(self.x + 85,self.y + 67+16*2,nil,nil,nil,self.进程==5,3)
elseif self.资源组[12]:事件判断() then
  self.进程=6
    self.资源组[12]:显示(self.x + 85,self.y + 67+16*3,nil,nil,nil,self.进程==6,3)
elseif self.资源组[13]:事件判断() then
  self.进程=7
    self.资源组[13]:显示(self.x + 85,self.y + 67+16*4,nil,nil,nil,self.进程==7,3)
elseif self.资源组[14]:事件判断() then
  self.进程=8
    self.资源组[14]:显示(self.x + 85,self.y + 67+16*5,nil,nil,nil,self.进程==8,3)
elseif self.资源组[15]:事件判断() then
  self.进程=9
    self.资源组[15]:显示(self.x + 85,self.y + 67+16*6,nil,nil,nil,self.进程==9,3)
elseif self.资源组[16]:事件判断() then
  self.进程=10
    self.资源组[16]:显示(self.x + 85,self.y + 67+16*7,nil,nil,nil,self.进程==10,3)
elseif self.资源组[17]:事件判断() then
  self.进程=11
    self.资源组[17]:显示(self.x + 85,self.y + 67+16*8,nil,nil,nil,self.进程==11,3)
elseif self.资源组[18]:事件判断() then
  self.进程=12
    self.资源组[18]:显示(self.x + 85,self.y + 67+16*9,nil,nil,nil,self.进程==12,3)
elseif self.资源组[19]:事件判断() then
  self.进程=13
    self.资源组[19]:显示(self.x + 85,self.y + 67+16*10,nil,nil,nil,self.进程==13,3)
elseif self.资源组[20]:事件判断() then
  self.进程=14
    self.资源组[20]:显示(self.x + 85,self.y + 67+16*11,nil,nil,nil,self.进程==14,3)
elseif self.资源组[21]:事件判断() then
  self.进程=15
    self.资源组[21]:显示(self.x + 85,self.y + 67+16*12,nil,nil,nil,self.进程==15,3)
elseif self.资源组[22]:事件判断() then
  self.进程=16
    self.资源组[22]:显示(self.x + 85,self.y + 67+16*13,nil,nil,nil,self.进程==16,3)
elseif self.资源组[23]:事件判断() then
  self.进程=17
    self.资源组[23]:显示(self.x + 85,self.y + 67+16*14,nil,nil,nil,self.进程==17,3)
elseif self.资源组[24]:事件判断() then
  self.进程=18
    self.资源组[24]:显示(self.x + 85,self.y + 67+16*15,nil,nil,nil,self.进程==18,3)
elseif self.资源组[25]:事件判断() then
  self.进程=19
    self.资源组[25]:显示(self.x + 85,self.y + 67+16*16,nil,nil,nil,self.进程==19,3)
elseif self.资源组[26]:事件判断() then
  self.进程=20
    self.资源组[26]:显示(self.x + 85,self.y + 67+16*17,nil,nil,nil,self.进程==20,3)
  end
end

if self.进程 == 3 then
     tp.字体表.普通字体:置颜色(0xFFFF0000):显示(self.x+270,self.y+170,"一阶：气血上限+2000，面板属性+50\n二阶：面板属性+88\n三阶：落雷符伤害结果为100%～110%,\n四阶：落雷符伤害结果为110%～120%,\n五阶：落雷符伤害结果为120%～130%,\n ")
 self.方寸山:显示(self.x+340,self.y+69)

end
if self.进程 == 4 then
   tp.字体表.普通字体:置颜色(0xFFFF0000):显示(self.x+270,self.y+170,"一阶：气血上限+2000，面板属性+50\n二阶：面板属性+88\n三阶：龙卷雨击伤害结果为100%～110%，10%几率法连\n四阶：龙卷雨击伤害结果为110%～120%，30%几率法连\n五阶：龙卷雨击伤害结果为120%～130%，60%几率法连")

 self.龙宫:显示(self.x+345,self.y+66)
 end
if self.进程 == 5 then
   tp.字体表.普通字体:置颜色(0xFFFF0000):显示(self.x+270,self.y+170,"一阶：气血上限+2000，面板属性+50\n二阶：面板属性+88\n三阶：固定伤害结果为100%～110%\n四阶：固定伤害结果为110%～120%\n五阶：固定伤害结果为120%～130%\n")

 self.女儿村:显示(self.x+349,self.y+62)

 end
 if self.进程 == 6 then
   tp.字体表.普通字体:置颜色(0xFFFF0000):显示(self.x+270,self.y+170,"一阶：气血上限+2000，面板属性+50\n二阶：面板属性+88\n三阶：落叶萧萧的伤害结果为100%～110%,\n四阶：落叶萧萧的伤害结果为110%～120%,\n五阶：落叶萧萧的伤害结果为120%～130%,\n")

 self.神木林:显示(self.x+349,self.y+62)

 end
 if self.进程 == 7 then
   tp.字体表.普通字体:置颜色(0xFFFF0000):显示(self.x+270,self.y+170,"一阶：气血上限+2000，面板属性+50\n二阶：面板属性+88\n三阶：横扫千军伤害结果为100%～110%,\n四阶：横扫千军伤害结果为110%～120%,\n五阶：横扫千军伤害结果为110%～120%,\n")

 self.大唐官府:显示(self.x+349,self.y+62)

 end
 if self.进程 == 8 then
  tp.字体表.普通字体:置颜色(0xFFFF0000):显示(self.x+270,self.y+170,"一阶：气血上限+2000，面板属性+50\n二阶：面板属性+88\n三阶：推气过宫恢复气血为100%～110%\n四阶：推气过宫恢复气血为110%～120%\n五阶：推气过宫恢复气血为120%～130%\n")

self.化生寺:显示(self.x+349,self.y+62)

 end
 if self.进程 == 9 then
 tp.字体表.普通字体:置颜色(0xFFFF0000):显示(self.x+270,self.y+170,"一阶：气血上限+2000，面板属性+50\n二阶：面板属性+88\n三阶：尸腐毒每回合减血结果为100%～150%\n四阶：尸腐毒每回合减血结果为110%～120%\n五阶：尸腐毒每回合减血结果为120%～130%\n")
 self.阴曹地府:显示(self.x+349,self.y+62)

 end
 if self.进程 == 10 then
  tp.字体表.普通字体:置颜色(0xFFFF0000):显示(self.x+270,self.y+170,"一阶：气血上限+2000，面板属性+50\n二阶：面板属性+88\n三阶：含情脉脉30%几率无视一切状态并命中\n四阶：含情脉脉60%几率无视一切状态并命中\n五阶：含情脉脉80%几率无视一切状态并命中\n")
 self.盘丝洞:显示(self.x+349,self.y+62)
 end
 if self.进程 == 11 then
  tp.字体表.普通字体:置颜色(0xFFFF0000):显示(self.x+270,self.y+170,"一阶：气血上限+2000，面板属性+88\n二阶：面板属性+88\n三阶：鹰击后有30%概率不休息\n四阶：鹰击后有60%概率不休息\n五阶：鹰击后有80%概率不休息")
 self.狮驼岭:显示(self.x+349,self.y+62)

 end
 if self.进程 == 12 then
  tp.字体表.普通字体:置颜色(0xFFFF0000):显示(self.x+270,self.y+170,"一阶：气血上限+2000，面板属性+50\n二阶：面板属性+88\n三阶：三味真火，飞沙走石伤害结果为\n100%～110%\n四阶：以上二技能的伤害结果为110%～120%\n五阶：以上二技能的伤害结果为120%～130%\n")

 self.魔王寨:显示(self.x+349,self.y+62)

 end
 if self.进程 == 13 then
     tp.字体表.普通字体:置颜色(0xFFFF0000):显示(self.x+270,self.y+170,"一阶：气血上限+2000，面板属性+50\n二阶：面板属性+88\n三阶：杨柳甘露复活队友直接恢复30%气血\n四阶：杨柳甘露复活队友直接恢复60%气血\n五阶：杨柳甘露复活队友直接恢复80%气血\n")

 self.普陀山:显示(self.x+349,self.y+62)

 end
 if self.进程 == 14 then
     tp.字体表.普通字体:置颜色(0xFFFF0000):显示(self.x+270,self.y+170,"一阶：气血上限+2000，面板属性+50\n二阶：面板属性+88\n三阶：雷霆万钧伤害结果为100%～110%,\n四阶：雷霆万钧伤害结果为110%～120%,\n五阶：雷霆万钧伤害结果为120%～130%,")

 self.天宫:显示(self.x+349,self.y+62)

 end
 if self.进程 == 15 then
     tp.字体表.普通字体:置颜色(0xFFFF0000):显示(self.x+270,self.y+170,"一阶：气血上限+2000，面板属性+50\n二阶：面板属性+88\n三阶：开局直接获得6点战意\n四阶：开局直接获得8点战意\n五阶：开局直接获得10点战意,\n")

 self.凌波城:显示(self.x+349,self.y+62)

 end
 if self.进程 == 16 then
       tp.字体表.普通字体:置颜色(0xFFFF0000):显示(self.x+270,self.y+170,"一阶：气血上限+2000，面板属性+50\n二阶：面板属性+88\n三阶：飘渺式伤害结果为100%～110%,\n四阶：飘渺式伤害结果为110%～120%,\n五阶：飘渺式伤害结果为120%～130%,\n")

self.五庄观:显示(self.x+349,self.y+62)

 end
 if self.进程 == 17 then
         tp.字体表.普通字体:置颜色(0xFFFF0000):显示(self.x+270,self.y+170,"一阶：气血上限+2000，面板属性+50\n二阶：面板属性+88\n三阶：匠心·削铁、匠心·固甲、匠心·蓄锐 目标\n四阶：匠心·削铁、匠心·固甲、匠心·蓄锐 目标\n五阶：匠心·削铁、匠心·固甲、匠心·蓄锐 目标\n")

 self.天机城:显示(self.x+349,self.y+62)

 end
 if self.进程 == 18 then
     tp.字体表.普通字体:置颜色(0xFFFF0000):显示(self.x+270,self.y+170,"一阶：气血上限+2000，面板属性+50\n二阶：面板属性+88\n三阶：女魃墓召唤所有单位全属性提\n升为100%～110%\n四阶：女魃墓召唤所有单位全属性提\n升为110%～120%\n五阶：女魃墓召唤所有单位全属性提\n升为120%～130%\n")

 self.女魃墓:显示(self.x+349,self.y+62)

 end
 if self.进程 == 19 then
       tp.字体表.普通字体:置颜色(0xFFFF0000):显示(self.x+270,self.y+170,"一阶：气血上限+2000，面板属性+50\n二阶：面板属性+88\n三阶：神针撼海的起始伤害为100%～110%\n四阶：神针撼海的起始伤害为110%～120%\n五阶：神针撼海的起始伤害为120%～130%\n")

 self.花果山:显示(self.x+349,self.y+62)

 end
 if self.进程 == 20 then
   tp.字体表.普通字体:置颜色(0xFFFF0000):显示(self.x+270,self.y+170,"一阶：气血上限+2000，面板属性+50\n二阶：面板属性+88\n三阶：地涌金莲的恢复气血为100%～110%\n四阶：地涌金莲的恢复气血为110%～120%\n五阶：地涌金莲的恢复气血为120%～130%\n")

 self.无底洞:显示(self.x+349,self.y+62)


 end
end


function 系统类_元神:检查点(x,y)
  if self.资源组 ~= nil and self.资源组[1]:是否选中(x,y)  then
    return true
  end
end

function 系统类_元神:初始移动(x,y)
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

function 系统类_元神:开始移动(x,y)
  if self.鼠标 then
    self.x = x - self.xx
    self.y = y - self.yy
  end
end

return 系统类_元神