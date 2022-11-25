local 场景类_缓冲 = class()

local _GUI   = require("ggeui/加载类")()
local 控件界面 = _GUI:创建控件('控件界面')
local tp
local 渐进加载界面_进度条= 控件界面:创建进度('渐进加载界面_进度条',315,355.5,240,17)
function 渐进加载界面_进度条:初始化()
  self:置颜色(0xFF23d749)
  self.i = 1
end
function 渐进加载界面_进度条:更新(dt)

  	if self.i ~= nil then
	  self.i = self.i +1.5
	  if self.i >100 then
	      self.i = 1
	  end
	  渐进加载界面_进度条:置位置(self.i)
	    if self.i==91 then
	      self.i=nil
	      tp.进程=1
	      tp.音乐:播放(true)
			if 动态加密文本 ~="" and  动态加密文本 ~=nil then
				检测开启=1
			end
	    end
	end
end



function 场景类_缓冲:初始化(根)
	tp=根
	self.梦幻LOGO = 根.资源:载入('wzife.wd5',"网易WDF动画",0x00000001)
end

function 场景类_缓冲:显示(dt,x, y)
    self.梦幻LOGO:显示(0,0)
    _GUI:更新(dt,x, y)
    _GUI:显示(x, y)
    控件界面:置可视(true, true)

end


return 场景类_缓冲
