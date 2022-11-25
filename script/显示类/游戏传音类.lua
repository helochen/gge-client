--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2020-09-25 16:38:55
-- 梦幻西游游戏资源破解 baidwwy@vip.qq.com(313738139) 老毕   和 C++PrimerPlus 717535046 这俩位大神破解所以资源
--======================================================================--
local 游戏公告类 = class()

function 游戏公告类:初始化(根)
    self.显示开关=false
    self.丰富文本2=根._丰富文本(240,125)
    for n=0,120 do
        self.丰富文本2:添加元素(n,根.包子表情动画[n])
    end

  self.资源组 = {
    [1]= 根.资源:载入('wzife.wd4',"网易WDF动画",0x8789ADD0),
    [2] = 根.资源:载入('wzife.wd4',"网易WDF动画",0x8D402754),
    [3]= 根.资源:载入('wzife.wd4',"网易WDF动画",0xA2C9A949),
    [4] = 根.资源:载入('wzife.wd4',"网易WDF动画",0xE3BD3AF3),
    [5]= 根.资源:载入('wzife.wd4',"网易WDF动画",0xF4F71376),
    [6]= 根.资源:载入('wzife.wd4',"网易WDF动画",0x5532559A),
    [7]= 根.资源:载入('wzife.wd4',"网易WDF动画",0x891CA42C),
    [8]= 根.资源:载入('wzife.wd4',"网易WDF动画",0x3413093D),
    [9]= 根.资源:载入('wzife.wd4',"网易WDF动画",0xFE7B1779),
    [10]= 根.资源:载入('wzife.wd4',"网易WDF动画",0x15FD4546),
    [11] = 根.资源:载入('wzife.wd4',"网易WDF动画",0xC6CEF932),
    [12]= 根.资源:载入('wzife.wd4',"网易WDF动画",0x2396DDC3),
  }


end

function 游戏公告类:添加公告(内容)
    self.类型=内容[3]
    self.道具=内容[4]
    if self.显示开关==false then
        self.x=500
        self.显示开关=true
        self.丰富文本2:清空()
        self.丰富文本2:添加文本("#G〖"..内容[1].."〗:#W"..内容[2])
    end
end

function 游戏公告类:更新(dt)

end

function 游戏公告类:显示(dt,x,y)
    if self.显示开关 then
        self.x=self.x-1
        if self.x<1 then
           self.显示开关=false
        end
      if self.类型==1 then
          self.资源组[1]:更新(dt)
          self.资源组[2]:更新(dt)
          self.资源组[3]:更新(dt)
          self.资源组[1]:显示(10,250)
          self.资源组[2]:显示(10,250)
          self.资源组[3]:显示(10,400)
      elseif self.类型==2 then
          self.资源组[4]:更新(dt)
          self.资源组[5]:更新(dt)
          self.资源组[6]:更新(dt)
          self.资源组[4]:显示(10,250)
          self.资源组[5]:显示(10,250)
          self.资源组[6]:显示(10,400)
      elseif self.类型==3 then
          self.资源组[7]:更新(dt)
          self.资源组[8]:更新(dt)
          self.资源组[9]:更新(dt)
          self.资源组[7]:显示(10,250)
          self.资源组[8]:显示(10,250)
          self.资源组[9]:显示(10,400)
      elseif self.类型==4 then
          self.资源组[10]:更新(dt)
          self.资源组[11]:更新(dt)
          self.资源组[12]:更新(dt)
          self.资源组[10]:显示(10,250)
          self.资源组[11]:显示(10,250)
          self.资源组[12]:显示(10,400)
      end



      self.丰富文本2:显示(30,260)
    end
end

return 游戏公告类