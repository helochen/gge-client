--======================================================================--
--  ☆ 作者：飞蛾扑火 QQ：1415559882
--======================================================================--
local 场景类_分区 = class()
local tp
local insert = table.insert

function 场景类_分区:初始化(根)
  local 资源 = 根.资源
  local 按钮 = 根._按钮
  local 自适应 = 根._自适应


  self.梦幻西游 = 资源:载入("pic/mhxy.png","图片")
  self.上一步 = 按钮.创建(资源:载入('other.wdf',"网易WDF动画",0x10009),0,0,3,true,true)
  self.下一步 = 按钮.创建(资源:载入('other.wdf',"网易WDF动画",0x10003),0,0,3,true,true)
  self.服务器状态=资源:载入('wzife.wdf',"网易WDF动画",0x0E3A7EE6)
  self.新区动画=资源:载入('wzife.wdf',"网易WDF动画",0x5286B0B5)
  self.服务器数据={}
local wz = require("gge文字类1")
  self.服务器文字=wz.创建(nil,14,false,false,false)
  self.服务器数据[1]={mc="游戏藏宝湾",ip=全局ip,dk=全局端口,wz=1,1,zt=4}

  self.服务器状态栏={}
  self.单区背景={}
 for n=1,6 do
  self.单区背景[n]=资源:载入('wzife.wdf',"网易WDF动画",0xD330CE3F)
  self.分区背景 = 资源:载入("pic/分区背景.png","图片")
  self.标题背景公告 = 资源:载入("pic/公告背景1.png","图片")
  self.电信 = 资源:载入('wzife.wdf',"网易WDF动画",0x28275FE2)
  self.默认 = 资源:载入('wzife.wdf',"网易WDF动画",0x2E588160)
  self.默认X = 资源:载入('wzife.wdf',"网易WDF动画",0x3EB5D36D)--0x19243A82
  self.小分区 = 资源:载入('wzife.wdf',"网易WDF动画",0xBD57A592)
  self.红色动态 = 资源:载入('wzife.wdf',"网易WDF动画",0xFB057B3D)--红色动态
  self.默认服务器 = 资源:载入('wzife.wdf',"网易WDF动画",0x40FD8B71)
  self.登陆选中建角色 = 资源:载入('wzife.wd3',"网易WDF动画",0X57880B0A)
   end
 for n=1,5 do
  self.服务器状态栏[n]=资源:载入('wzife.wdf',"网易WDF动画",0x5250B7AC)--极佳0X635B8925--良好0X39729C71--爆满0X5250B7AC--繁忙0X8CA1358F--维护0X31E8F730--蓝色0X142FA42C
  self.服务器选中 = 资源:载入('wzife.wdf',"网易WDF动画",0xF5674AFF)
  self.服务器编号=1
end
  tp = 根
end
function 场景类_分区:显示(dt,x,y)
  if tp.进程 == 8 then
       self.新区动画:更新(dt)
       self.红色动态:更新(dt)
       self.上一步:更新(x,y)
       self.下一步:更新(x,y)
       self.红色动态:显示(650,330)
       self.分区背景:显示(80,130)
       self.服务器状态:显示(630,150)
       self.下一步:显示(790-160,600-110)
       self.上一步:显示(790-160,600-175)
      self.梦幻西游:显示(300-90,0)
       self.服务器a=0
       self.服务器b=1
    for n=1,6 do
         self.服务器a=self.服务器a+1
         if self.服务器a>6 then
            self.服务器a=1
            self.服务器b=self.服务器b+1
            self.默认服务器:显示(110,505)
            self.小分区:显示(505,500)
            self.电信:显示(510,500)
            self.默认:显示(420,500)
            self.默认X:显示(465,500)
           end
            self.小分区:显示(self.服务器a*80-50+75,465)
            self.小分区:显示(self.服务器a*80-50+75,435)
            self.单区背景[n]:显示(self.服务器a*80-50+75,7+self.服务器b*35+110)
         if self.服务器编号~=0 and self.服务器编号==n then
            self.服务器选中:显示(self.服务器a*80-51+75,self.服务器b*35+6+110)
           end
         if self.单区背景[n]:是否选中(x,y) and 引擎.鼠标弹起(左键) then
          if self.服务器数据[n]==nil then
              tp.提示:写入("#Y/这个服务器尚未开放")
              return 0
            elseif self.服务器编号==n then
              self.服务器编号=0
            else
              系统参数.服务器={名称=self.服务器数据[n].mc,ip=self.服务器数据[n].ip,端口=self.服务器数据[n].dk}
              self.服务器编号=n
             end
           end
         end
        self.服务器a=0
        self.服务器b=1
          for n=1,#self.服务器数据 do
            self.服务器a=self.服务器a+1
             if self.服务器a>6 then
            self.服务器a=1
            self.服务器b=self.服务器b+1
           end
            if 1==1 then
                if n==1 then
                 self.服务器文字:显示(self.服务器a*80-50+5+75,7+self.服务器b*35+2+110,self.服务器数据[n].mc)
                else
                   self.服务器文字:显示(self.服务器a*80-50+5+75,7+self.服务器b*35+2+110,self.服务器数据[n].mc)
                  end
                self.服务器状态栏[self.服务器数据[n].zt+0]:显示(self.服务器a*80-50+4+75,self.服务器b*35+25+110)
                if self.服务器数据[n].xq=="1" then
                 self.新区动画:显示(self.服务器a*80-50+30+75,self.服务器b*35+10+130)
                  end
                end
             end
      if self.上一步:事件判断() then
          tp.进程=1
        elseif self.下一步:事件判断() then
          if self.服务器编号==0 then
            tp.提示:写入("#Y/请先选择你要登录的服务器")
            return 0
          else
             注册开关=false
           tp.进程=7
            end
         end
     end
end

return 场景类_分区