
local 战斗单位类 = class()
local floor=math.floor
local format = string.format
local yxs = require("script/资源类/FSB")

function 战斗单位类:初始化()
  self.伤害图片 = tp.战斗文字[1]
  self.回复图片 = tp.战斗文字[2]
  self.暴击图片 = tp.战斗文字[4]
end

local function 取攻击帧(模型,zl)
	local 攻击帧,攻击延迟,终结帧 = 2,1.25,nil
	if 模型 == "偃无师" or 模型 == "桃夭夭"  then
		攻击帧 = -1
		攻击延迟 = 1.35
	elseif 模型 == "鬼潇潇" or 模型 == "龙太子" or 模型 == "剑侠客" or 模型 == "真陀护法" then
		攻击帧 = 1
		攻击延迟 = 1.3
	elseif 模型 == "玄彩娥" or 模型 == "舞天姬" or 模型 == "进阶毗舍童子"or 模型 == "羊头怪" or 模型 == "锦毛貂精" then
		攻击帧 = -1
		攻击延迟 = 1.15
	elseif 模型 == "虎头怪" or 模型 == "神天兵" or 模型 == "巨魔王" or 模型 == "杀破狼" or 模型 == "持国巡守" or 模型 == "雷鸟人" or 模型 == "金饶僧" or 模型 == "葫芦宝贝" or 模型 == "幽灵"  or 模型 == "凤凰" or 模型 == "野鬼" or 模型 == "帮派妖兽" or 模型 == "修罗傀儡鬼" or 模型 == "踏云兽" or 模型 == "巴蛇" or 模型 == "黑熊"  then
		攻击帧 = 1
		攻击延迟 = 1.2
		if zl ~= nil then
			if zl == "弓弩" or zl == "弓弩1"  then
				攻击延迟 = 0.88
			end
		end
	elseif 模型 == "强盗" or 模型 == "山贼" or 模型 == "鼠先锋" or 模型 == "增长巡守"or 模型 == "灵灯侍者" or 模型 == "般若天女" or 模型 == "进阶雨师" or 模型 == "进阶如意仙子" or 模型 == "野猪精" or 模型 == "超级玉兔" or 模型 == "幽萤娃娃" or 模型 == "黑熊精" or 模型 == "蚌精"  or 模型 == "机关鸟" or 模型 == "连弩车" or 模型 == "蜃气妖" or 模型 == "蛤蟆精" or 模型 == "虾兵" or 模型 == "蟹将" or 模型 == "兔子怪" or 模型 == "蜘蛛精" or 模型 == "花妖" or 模型 == "狐狸精" or 模型 == "哮天犬" or 模型 == "混沌兽" or 模型 == "蝴蝶仙子" or 模型 == "狼" or 模型 == "老虎" then
		攻击帧 = 2
		攻击延迟 = 1.12
	elseif 模型 == "机关人人形" or 模型 == "机关兽" then
		攻击帧 = 2
		攻击延迟 = 1.25
	elseif 模型 == "泡泡" then
		攻击帧 = 2
		攻击延迟 = 2.1
	elseif 模型 == "混沌兽"  then
		攻击延迟 = 1.35
	elseif 模型 == "狂豹人形"  then
		攻击帧 = 1
		攻击延迟 = 1.4
	elseif 模型 == "海毛虫" then
     攻击帧 = 1
		攻击延迟 = 1.35
	elseif 模型 == "大海龟"or 模型 == "骷髅怪" or 模型 == "金身罗汉" or 模型 == "修罗傀儡妖" or 模型 == "曼珠沙华" or 模型 == "幽萤娃娃" then
		攻击帧 = 1
		攻击延迟 = 1.2
	elseif 模型 == "画魂" or 模型 == "羽灵神"  then
		攻击帧 = 1
		攻击延迟 = 1.1
	elseif 模型 == "天兵"or 模型 == "巨力神猿"   then
		攻击帧 = 1
		攻击延迟 = 1.25
	elseif 模型 == "地狱战神" or 模型 == "风伯" or 模型 == "芙蓉仙子" or 模型 == "毗舍童子" or 模型 == "镜妖"  or 模型 == "千年蛇魅"or 模型 == "小龙女"  then
		攻击帧 = 0
		攻击延迟 = 1.25
	elseif 模型 == "芙蓉仙子" then
		攻击帧 = 0
		攻击延迟 = 1.1
	elseif 模型 == "百足将军"  or 模型 == "天将" or 模型 == "小龙女" or 模型 == "碧水夜叉" or 模型 == "马面" or 模型 == "灵鹤" then
		攻击帧 = 3
		攻击延迟 = 1.23
	elseif 模型 == "鬼将"  or  模型 == "大力金刚"then
		攻击帧 = 4
		攻击延迟 = 1.3
		终结帧 = 1
	elseif 模型 == "赌徒" then
		攻击帧 = 4
		攻击延迟 = 1.1
	elseif 模型 == "牛妖"  then
		攻击帧 = 3
		攻击延迟 = 1.26
	elseif 模型 == "古代瑞兽"  then
		攻击帧 = 4
		攻击延迟 = 1.2
	elseif 模型 == "知了王" then
		攻击帧 = 4
		攻击延迟 = 1.32
	elseif 模型 == "黑山老妖"  or 模型 == "炎魔神"  then
		攻击帧 = 4
		攻击延迟 = 1.32
	elseif 模型 == "长眉灵猴"  then
		攻击帧 = -1
		攻击延迟 = 1.23
	elseif 模型 == "骨精灵" or 模型 == "狐美人" or 模型 == "剑侠客" or 模型 == "逍遥生" or 模型 == "巫蛮儿" or 模型 == "英女侠" or 模型 == "飞燕女" then
		if zl ~= nil then
			if zl == "魔棒"  then
				攻击帧 = -1
			elseif zl == "宝珠" then
				攻击帧 = 2
			elseif 模型 == "英女侠"  then
				攻击帧 = 0
			elseif 模型 == "飞燕女" and zl == "双短剑"  then
				攻击帧 = 0
			elseif 模型 == "飞燕女" and zl == "环圈"  then
				攻击帧 = 3
			elseif 模型 == "逍遥生" and (zl == "扇")  then
				攻击帧 = 0
			elseif 模型 == "逍遥生" and (zl == "剑")  then
				攻击帧 = -1
				终结帧 = 1
			elseif 模型 == "巫蛮儿" and (zl == "法杖")  then
				攻击帧 =0
			elseif 模型 == "狐美人" and zl == "爪刺" then
				攻击帧 = 0
			elseif 模型 == "狐美人" and zl == "鞭" then
				攻击帧 = 0
			end
		else
			攻击帧 = 1
		end
		攻击延迟 = 1.25
	end
	return 攻击帧,攻击延迟,终极帧
end

function 战斗单位类:添加特技内容(q)
  self.特技文本=分割字符(q)
  self.特技总数=#self.特技文本
  self.特技序列={}
  self.特技次数=20
  self.特技间隔=4
  for n=1,#self.特技文本 do
    self.特技序列[n]={}
    self.特技序列[n].文本=self.特技文本[n]
    self.特技序列[n].高度=0
    self.特技序列[n].x=self.显示xy.x-self.特技总数*4
    self.特技序列[n].y=self.显示xy.y
  end
  self.特技顺序=1
  self.特技内容开关=true
  self.关闭计次=0
end

function 战斗单位类:创建单位(数据,队伍id,编号)
  self.编号=编号
  self.数据=数据


  self.更新次数=0
  local wz = require("gge文字类")
  self.特技文字=wz.创建(nil,16,false,false,false)
  self.特技文字:置颜色(0xFF871F78)
  wz=nil
  self.动画=战斗动画类()
  if 数据.变身套 ~= nil then
    self.动画:创建动画(数据.模型,数据.类型,数据.染色方案,数据.染色组,数据.变异,数据.武器,数据.变身数据,数据.显示饰品,数据.锦衣数据,数据.武器染色方案,数据.武器染色组,数据.变身套)
  else
    self.动画:创建动画(数据.模型,数据.类型,数据.染色方案,数据.染色组,数据.变异,数据.武器,数据.变身数据,数据.显示饰品,数据.锦衣数据,数据.武器染色方案,数据.武器染色组)
  end
  self.动作="待战"
  self.显示xy={x=100,y=150}
  self.名称 = 数据.名称
  self.名称宽度 = floor(tp.字体表.人物字体:取宽度(数据.名称) / 2)
  self.附加 = {x=0,y=0}
  self.刷新 = {x=0,y=0}
  self.当前 = {x=0,y=0}
  self.主动技能=数据.主动技能
  self.特技技能=数据.特技技能
  self.战意=数据.战意
  self.气血=数据.气血
  self.队伍=数据.队伍
  self.最大气血=数据.最大气血
  self.模型=数据.模型
  self.类型=数据.类型
  self.染色方案=数据.染色方案
  self.染色组=数据.染色组
  self.变异=数据.变异
  self.武器=数据.武器
  self.变身数据=数据.变身数据
  self.显示饰品=数据.显示饰品
  self.锦衣数据=数据.锦衣数据
  self.移动坐标={}
  self.移动上限=90
  self.单位消失=false
  self.移动频率=35
  self.攻击特效={}
  self.法术特效={}
  self.状态特效={}
  self.掉血开关=false
  self.捕捉开关=false
  self.是否显示=true
  self.附加阵法 = 数据.附加阵法
  self.位置 = 数据.位置
  if 数据.武器~=nil then
    self.武器子类=数据.武器.子类
 	end

  self.攻击帧,self.攻击延迟,self.终极帧 = 取攻击帧(self.模型,self.武器子类)

  self.高度 = self.动画.动画["待战"].信息组[0][3]
  if self.高度 == nil then
    self.高度 = 80
  end
	if self.高度 > 120 then
		self.高度 = 120
	elseif self.高度 < 60 then
		self.高度 = 60
	elseif self.高度 < 85 then
		self.高度 = 85
	end
	if self.位置 == 2 then
		self.高度 = self.高度 + 20
	else
		self.高度 = self.高度 + 20
	end
  if 数据.队伍==战斗类.队伍id then
    位置=战斗类:刷新阵法位置(true)
    self.初始方向=2
    self.敌我=1
    self.逃跑方向=0
  else
    位置=战斗类:刷新阵法位置(false)
    self.初始方向=0
    self.敌我=2
    self.逃跑方向=2
 	end

  if 数据.附加阵法~="普通" then
    if  self.敌我==1 then
      位置=战斗类.阵型位置[数据.附加阵法].我方
    else
      位置=战斗类.阵型位置[数据.附加阵法].敌方
    end
  end
  self.方向=self.初始方向
  self.动画:置方向(self.方向,self.动作)
  self.显示xy={x=位置[数据.位置].x,y=位置[数据.位置].y}
    if self.敌我==1 then
      if 数据.位置<=5 then
        self.显示xy.x,self.显示xy.y=self.显示xy.x,self.显示xy.y
      else
        self.显示xy.x,self.显示xy.y=self.显示xy.x,self.显示xy.y
      end
      self.躲避参数=8
      self.躲避坐标=2.5
      self.反震误差={x=50,y=10}
      self.逃跑坐标=3
    else
      self.显示xy.x,self.显示xy.y=self.显示xy.x,self.显示xy.y
      self.反震误差={x=-50,y=-10}
      self.躲避坐标=-2.5
      self.躲避参数=-8
      self.逃跑坐标=-3
    end
 	-- end
  self.初始xy={}
  self.初始xy.x,self.初始xy.y= self.显示xy.x,self.显示xy.y
  self.x,self.y=self.显示xy.x,self.显示xy.y
  self.色相变身=0
  self.特技内容开关=false
  self.抖动数据={开关=false,进程=0,x=0,y=0}
  self.逃跑开关=false
  self.逃跑特效=tp:载入特效("逃跑",self:取txz("逃跑"))
  self.喊话=require("script/显示类/喊话").创建(tp)
  self.鼠标跟随=false
  self.飞镖开关=false
end

function 战斗单位类:设置鼠标跟随(特效)
  if 1==1 then return  end
  if self.鼠标跟随 then
    self.鼠标跟随=false
  else
    self.鼠标跟随=true
  end
end

function 战斗单位类:取txz(特效)
  local txz = 0
	if 特效 == "唧唧歪歪" then
		txz = 1.15
	elseif 特效 == "横扫千军" or 特效 == "浪涌"  or 特效=="天命剑法" then
		txz = 1.05
	elseif 特效 == "反震" or 特效 == "防御" then
		txz = 1.6
	elseif 特效 == "捕捉开始"or 特效 == "暴击" then
		txz = 1.55
	elseif 特效 == "龙卷雨击" or 特效 == "地裂火"  then
		txz = 1.5
	 elseif 特效 == "龙卷雨击2" then
	 	txz = 1.5
	 elseif 特效 == "龙卷雨击3" then
	 	txz = 1.0
	 elseif 特效 == "龙卷雨击4" then
	 	txz = 1.15
   elseif 特效 == "龙卷雨击" then
    txz = 1
	elseif 特效 == "龙吟" then
		txz = 1.45
	elseif 特效 == "龙腾" then
		txz = 1.75
	elseif 特效 == "泰山压顶" then
		txz = 1.4
	elseif 特效 == "连环击" then
		txz = 2.4
	elseif 特效 == "宠物_静" then
		local mt = ptmx(tp.宠物.模型)
		return tp.资源:载入(mt[3],"网易WDF动画",mt[1])
	elseif 特效 == "宠物_走" then
		local mt = ptmx(tp.宠物.模型)
		return tp.资源:载入(mt[3],"网易WDF动画",mt[2])
	elseif 特效 == "天雷斩" then
		txz = 1.6
	elseif 特效 == "地狱烈火" then
		txz = 1.6
  elseif 特效 == "水漫金山" then
    txz = 2.4
	elseif 特效 == "鹰击" or 特效 == "上古灵符" then
		txz = 1.48
	elseif 特效 == "五雷轰顶" then
		txz = 1
	elseif 特效 == "天罗地网" then
		txz = 0.85
	elseif 特效 == "狮搏"  then
		txz = 1.4
	elseif 特效 == "被击中"or 特效 == "飞砂走石" or 特效 == "二龙戏珠" then
		txz = 1.28
	elseif 特效 == "月光" then
		txz = 1.3
	elseif 特效 == "翻江搅海" then
		txz = 3
	elseif 特效 == "尘土刃" then
		txz = 1.5
	elseif 特效 == "泰山压顶1" then
		txz = 1.25
	elseif 特效 == "泰山压顶2" then
		txz = 1.4
	elseif 特效 == "泰山压顶3" then
		txz = 1.1
	elseif 特效 == "归元咒" or 特效 == "乾天罡气" or 特效 == "巨岩破" or 特效 == "推拿" or 特效 == "活血" or 特效 == "推气过宫" then
		txz = 0.95
	elseif 特效 == "惊心一剑" or 特效 == "牛刀小试" or 特效 == "力劈华山" then
		txz = 1.05
	else
		txz = 1.15
	end
	return txz
end

function 战斗单位类:添加攻击特效(名称,加速,攻击方)
  if tp==nil then return  end
  local 名称1=名称
  if 名称1=="干将莫邪" or 名称1=="金甲仙衣"  then
    if self.敌我==1 then
      名称1=名称1.."_我方"
    else
      名称1=名称1.."_敌方"
    end
  end
  if not self:无需特效(名称) then
    self.攻击特效[#self.攻击特效+1]=tp:载入特效(名称1,self:取txz(名称))
    self.攻击特效[#self.攻击特效].加速更新=加速
  if 名称1=="破釜沉舟"  or 名称1=="天命剑法" then
       self.攻击特效[#self.攻击特效+1]=tp:载入特效(名称1.."2",self:取txz(名称1.."2"))
       self.攻击特效[#self.攻击特效].加速更新=加速
    elseif 名称1=="翩鸿一击" then
      战斗类.战斗单位[攻击方].翩鸿一击=1
    end
  end
end

function 战斗单位类:添加法术特效(名称,加速)
  if  名称=="杀意" or 名称=="念心" or 名称=="突进" or 名称=="止戈" or 名称=="凝神术"or 名称=="苦缠" or 名称=="顺势而为"or
      名称=="风灵" or 名称=="身法" or 名称=="花舞" or 名称=="倩影" or 名称=="云霄" or 名称=="破浪" or 名称=="波涛" or
      名称=="天地同寿" or 名称=="乾坤妙法" or 名称=="体恤" or 名称=="锤炼" or 名称=="神附" or 名称=="轰鸣" or 名称=="疾雷" or
      名称=="火神" or 名称=="震天" or 名称=="神焰" or 名称=="魔焰滔天" or 名称=="判官" or 名称=="回旋" or 名称=="夜行" or
      名称=="爪印" or 名称=="鹰展" or 名称=="驭兽" or 名称=="天魔解体" or 名称=="鼓乐" or 名称=="妖气" or 名称=="怜心" or
      名称=="化戈" or 名称=="推衍" or 名称=="借灵" then
      return
  end
  if tp==nil then return  end
  local 名称1=名称
  if 名称1=="干将莫邪" then
    if self.敌我==1 then
      名称1=名称1.."_我方"
    else
      名称1=名称1.."_敌方"
    end
  end
  if not self:无需特效(名称) then
    self.法术特效[#self.法术特效+1]=tp:载入特效(名称1,self:取txz(名称))
    self.法术特效[#self.法术特效].附加y=0
    if 名称=="生命之泉" then
      self.法术特效[#self.法术特效].附加y=-75
    elseif 名称=="龙腾" then
      self.法术特效[#self.法术特效].加速=0.04
      elseif 名称=="龙卷雨击" then
      self.法术特效[#self.法术特效].加速=1
    end
  end
end

function 战斗单位类:加载特效(名称)
  local txt=self:取txz(名称)
  local cp = tp:载入特效(名称,txz,不显示)
  cp:置提速(txz)

  return cp
 --return tp:载入特效(名称,self:取txz(名称))
end

function 战斗单位类:换方向(方向)
  self.动画:置方向(方向,self.动作)
end

function 战斗单位类:取当前帧()
  return self.动画:取当前帧(self.动作)
end

function 战斗单位类:取结束帧()
  return self.动画:取结束帧(self.动作)
end

function 战斗单位类:取开始帧()
  return self.动画:取开始帧(self.动作)
end

function 战斗单位类:取间隔()
  return self.动画.动画[self.动作]:取间隔()
end

function 战斗单位类:取中间()
  return self.动画.动画[self.动作]:取中间()
end

function 战斗单位类:状态前置(特效)
  if 特效 ~= nil then
    local cp = true
    local py={0,0}
    -- 调整偏移值
    if 特效 == "红灯" or 特效 == "蓝灯" or  特效 == "炼气化神" then
      py = {0,-75}
     -- if 剩余回合 >= 4 then
       -- 剩余回合 = 4
      --end
    elseif 特效 == "镇妖" or 特效 == "失忆符" or 特效 == "催眠符" or 特效 == "落魄符" or 特效 == "追魂符" or 特效 == "炎护" or 特效 == "含情脉脉" or 特效 == "离魂符"  or 特效 == "失心符" or 特效 == "失魂符" or 特效 == "碎甲符" or 特效 == "一笑倾城" or 特效 == "象形" or 特效 == "似玉生香" or 特效 == "乘风破浪" or 特效 == "一苇渡江" or 特效 == "逆鳞" or 特效 == "夺魄令" or 特效 == "百万神兵" or 特效 == "护法紫丝" then
      cp = false
    elseif 特效 == "红袖添香" then
      py = {10,0}
    elseif 特效 == "天罗地网" or 特效 == "乾坤玄火塔" or 特效 == "苍白纸人" or 特效 == "干将莫邪" or 特效 == "莲步轻舞" or 特效 == "如花解语" then
      py = {1,3}
      cp = false
    elseif 特效 == "定身符" then
      py = {5,2}
      cp = false
    elseif 特效 == "变身" then
      py = {2,-31}
    elseif 特效 == "紧箍咒" then
      py = {2,-self.高度/2-4}
    elseif 特效 == "普渡众生" or 特效 == "生命之泉" then
      py = {2,-75}
    elseif 特效 == "血雨" then
      py = {0,45}
    elseif 特效 == "鹰击" or 特效 == "横扫千军" or 特效=="后发制人"  or 特效=="翩鸿一击" or 特效 == "天命剑法"  then
      cp=false
    elseif 特效 == "死亡召唤" or 特效 == "法术防御" then
      cp=false
    end
    return {cp=cp,py=py}
  end
end

function 战斗单位类:增加状态(名称)
  if 当前特效=="金刚镯" and 名称=="毒" then 名称="金刚镯" end
  if 当前特效=="画地为牢" and 名称=="毒" then 名称="画地为牢" end
  if 当前特效=="魔息术" then return end
  if 名称=="天命剑法" then return  end
  if 名称~=nil and tp~=nil then
    local 状态参数=self:状态前置(名称)
    self.状态特效[名称]=状态参数
    local 名称1=名称
    if 名称1=="干将莫邪" or 名称1=="苍白纸人" or 名称1=="混元伞" then
      if self.敌我==1 then
        名称1=名称1.."_我方"
      else
        名称1=名称1.."_敌方"
      end
    end
    if not self:透明状态("状态_"..名称1) and not self:无需状态特效(名称1) then
      self.状态特效[名称].动画=tp:载入特效("状态_"..名称1,self:取txz(名称))
    end
    if 名称1=="后发制人" then
       self.后发制人=1
    end
    if 名称1=="风灵" or 名称1=="身法" then
      self.状态特效[名称].附加x=0
      self.状态特效[名称].附加y=-70
    elseif 名称1=="体恤" or 名称1=="锤炼" or 名称1=="神附" then
      self.状态特效[名称].附加x=0
      self.状态特效[名称].附加y=-70
    elseif 名称1=="火神" or 名称1=="震天" or 名称1=="神焰" then--未调整
      self.状态特效[名称].附加x=0
      self.状态特效[名称].附加y=0
    elseif 名称1=="爪印" or 名称1=="鹰展" or 名称1=="驭兽" then--未调整这里调
      self.状态特效[名称].附加x=0
      self.状态特效[名称].附加y=0
    elseif 名称1=="天地同寿" then
      self.状态特效[名称].附加x=5
      self.状态特效[名称].附加y=-40
    else
      self.状态特效[名称].附加x=0
      self.状态特效[名称].附加y=0
    end
  end
end

function 战斗单位类:透明状态(效果)
  local xxg = false
  if 效果=="状态_金刚护法" or 效果=="状态_反间之计" or 效果=="状态_修罗隐身" then
    xxg = true
  end
  return xxg
end

function 战斗单位类:无需状态特效(效果)
  local xxg = false
  if  效果=="高级连击" or 效果=="理直气壮"  or 效果=="修罗隐身" or 效果=="翩鸿一击"   or 效果=="由己渡人" or 效果=="长驱直入" or 效果 == "野兽之力" or 效果 == "魔兽之印" then
    xxg = true
  end
  return xxg
end

function 战斗单位类:无需特效(效果)
  local xxg = false
  if  效果=="高级连击" or 效果=="修罗隐身" or 效果=="理直气壮" or 效果=="由己渡人" or 效果=="翩鸿一击" or 效果=="破釜沉舟" or 效果=="煞气诀" or 效果=="长驱直入" or 效果=="法术防御" or 效果=="死亡召唤" then
    xxg = true
  end
  return xxg
end

function 战斗单位类:换动作(动作,复原,更新,添加状态,取消状态,结尾气血)
  self.动作=动作
  self.动画:置方向(self.方向,self.动作)
  self.动作复原=复原
  self.停止更新=更新
  self.更新次数=0
  if self.添加状态==nil then
    self.添加状态=添加状态
  end
  if self.取消状态==nil then
    self.取消状态=取消状态
  end
  if self.结尾掉血==nil then
    self.结尾掉血=结尾气血
  end
  local 临时模型=self.数据.模型
  if self.数据.类型=="角色" or self.数据.类型=="系统角色" then
    if self.数据.武器~=nil and tp~=nil then
      if self.数据.武器.名称 == "龙鸣寒水" or self.数据.武器.名称 == "非攻" then
        local wq = "弓弩1"
        临时模型=临时模型.."_"..wq
      else
        local wq = tp:取武器子类(self.数据.武器.子类)
        临时模型=临时模型.."_"..wq
      end
    end
  end
  local 临时音乐=引擎.取音效(临时模型)

  if 游戏音效>0 and tp.音效开启 and 临时音乐~=nil and 临时音乐[动作]~=nil then
    self:音效类(临时音乐[动作],临时音乐.资源,动作)
  end

  -- if 游戏音效>0 and tp.音效开启 and 临时音乐~=nil and 临时音乐.资源 ~= nil and 临时音乐[动作]~=nil then
  --    local 音乐 =分割文本(string.format("%#x",临时音乐[动作]),"x")
  --    local x = 音乐[2]..""
  --     音乐=tp.资源:载入(wdf配置.."/Audio/"..临时音乐.资源.."/"..x..".wav","音乐",nil)
  --     音乐:播放(false)
  --     音乐:置音量(游戏音效)
  --     音乐=nil
  --     临时音乐=nil
  --  end



end

function 战斗单位类:音效类(文件号,资源包,子类)
  if 文件号 ~= nil and 文件号 ~= 0 and  游戏音效>0 and tp~=nil and tp.音效开启 then
    yxs(tp.资源:读数据(资源包,文件号)):置音量(游戏音效):播放(false)
  end
end

function 战斗单位类:设置飞镖(xy,方向,伤害,死亡)
  self.飞镖数据={x=xy.x,y=xy.y,伤害=伤害,死亡=死亡}
  self.飞镖动画=tp:载入特效("飞镖",self:取txz("飞镖"))--tp.资源:载入('addon.wdf',"网易WDF动画",0x494DC152) --tp:载入特效("飞镖",self:取txz("飞镖"))
  self.飞镖动画:置颜色(ARGB(255,255,255,250))
  self.飞镖xy={x=xy.x,y=xy.y}
  self.飞镖动画:置方向(方向)
  self.飞镖开关=true
end

function 战斗单位类:开启击退(死亡)
  self.击退开关=true
  self.击退延迟=true
  self.偏移类型=1
  self.停止偏移=40
  self.死亡参数=死亡
  -- if self.动作~="防御" then
  -- self.动作="被击中"
  --self.动画.按帧更新=true
  --end
  --self.动画:换方向(self.动作,self.初始方向)
  self.击退坐标={}
  self.击退坐标.x,self.击退坐标.y=self.显示xy.x,self.显示xy.y
  if self.敌我==2 then
    self.偏移坐标=-1
    if self.死亡参数~=0 then
      self.偏移坐标=-0.6
    end
  else
    self.偏移坐标=1
    if self.死亡参数~=0 then
      self.偏移坐标=0.6
    end
  end
end

function 战斗单位类:击退处理()
  if self.偏移类型==1 then
    self.显示xy.x,self.显示xy.y=self.显示xy.x+self.偏移坐标,self.显示xy.y+self.偏移坐标
    if(取两点距离(生成XY(self.击退坐标.x,self.击退坐标.y),生成XY(self.显示xy.x,self.显示xy.y))>self.停止偏移)then
      self.偏移类型=2
      if self.死亡参数==1  then
      self:死亡处理()
      self.显示xy.x,self.显示xy.y=self.击退坐标.x,self.击退坐标.y
      self.偏移类型=0
      self.击退开关=false
      self.偏移类型=0
      else
        -- self.动作="待战"
        --self:换动作(self.动作,nil,nil)
        if self.敌我==2 then
          self.偏移坐标=-1
          if self.死亡参数~=0 then
            self.偏移坐标=-2.5
          end
        else
          self.偏移坐标=1
          if self.死亡参数~=0 then
            self.偏移坐标=2.5
          end
        end
        self.偏移类型=2
      end
    end
  elseif self.偏移类型==2 then
    self.显示xy.x,self.显示xy.y=self.显示xy.x-self.偏移坐标,self.显示xy.y-self.偏移坐标
    if(取两点距离(生成XY(self.击退坐标.x,self.击退坐标.y),生成XY(self.显示xy.x,self.显示xy.y))<=10)then
      self.显示xy.x,self.显示xy.y=self.击退坐标.x,self.击退坐标.y
      self.偏移类型=0
      self.击退开关=false
      self.动画.按帧更新=false
      self.显示xy.x,self.显示xy.y=self.击退坐标.x,self.击退坐标.y
      if self.死亡参数==2  then
        self:死亡处理()
      else
        self.动作="待战"
        self:换动作(self.动作,nil,nil)
      end
    end
  end
end

function 战斗单位类:死亡处理1(死亡)
  self.死亡参数=死亡
  self:死亡处理()
end

function 战斗单位类:死亡处理()
  self.动画:置帧率(self.动作,0.1)
  self.死亡开关=true
  if self.死亡参数==1 then
    self.击飞开关=true
    self.击飞数据={}
    self.击飞流程=0
    self.击飞方向=0
    self.击飞开关=true
    self.击飞流程=1
    self.击飞时间=引擎.取游戏时间()
    -- self.动画.按帧更新=true
    if self.敌我==2 then
      self.击飞数据[1]={x=20,y=3,终止=全局游戏高度+100}
      self.击飞数据[2]={x=20,y=1,终止=全局游戏宽度+100}
    else
      self.击飞数据[1]={x=-20,y=-3,终止=全局游戏高度+100}
      self.击飞数据[2]={x=-20,y=-1,终止=全局游戏宽度+100}
    end
  elseif self.死亡参数==2 then
    self.动作="死亡"
    --self:播放音效("倒地")
    self.停止更新=false
    self:换方向(self.方向)
    self.倒地开关=true
    self.停止更新=true
  end
end

function 战斗单位类:倒地处理()
  --print(self.动作,self.动画:取当前帧(self.动作),self.动画:取开始帧(self.动作),self.动画:取结束帧(self.动作))
  if self.动画:取当前帧(self.动作)==self.动画:取结束帧(self.动作) then
    self.动作="死亡"
    self.停止更新=true
    self.倒地开关=false
  end
end

function 战斗单位类:击飞处理()
  if self.击飞流程==1 then
    self.显示xy.x,self.显示xy.y=self.显示xy.x-self.击飞数据[self.击飞流程].x,self.显示xy.y-self.击飞数据[self.击飞流程].y
    if 引擎.取游戏时间()-self.击飞时间>=0.005 then
      self.方向=self.方向-1
      if self.方向<0 then self.方向=3 end
      -- print(self.方向)
      self.击飞时间=引擎.取游戏时间()
      self:换方向(self.方向)
    end
  if(取两点距离(生成XY(self.初始xy.x,self.初始xy.y),生成XY(self.显示xy.x,self.显示xy.y))>全局游戏高度-100)then
    self.击飞流程=2
  end
  elseif self.击飞流程==2 then
    self.显示xy.x,self.显示xy.y=self.显示xy.x+self.击飞数据[self.击飞流程].x,self.显示xy.y+self.击飞数据[self.击飞流程].y
    if 引擎.取游戏时间()-self.击飞时间>=0.005 then
      self.方向=self.方向-1
      if self.方向<0 then self.方向=3 end
      self.击飞时间=引擎.取游戏时间()
      self:换方向(self.方向)
    end
    if (取两点距离(生成XY(self.初始xy.x,self.初始xy.y),生成XY(self.显示xy.x,self.显示xy.y))>1100) then
      self.击飞流程=0
      self.击飞开关=false
    end
  end
end

function 战斗单位类:返回事件()
  --print(取两点距离(生成XY(self.显示xy.x,self.显示xy.y),生成XY(self.移动坐标.x,self.移动坐标.y)))
  if 取两点距离(生成XY(self.显示xy.x,self.显示xy.y),生成XY(self.移动坐标.x,self.移动坐标.y))>=20 then
    self.移动距离=取移动坐标(生成XY(self.显示xy.x,self.显示xy.y),生成XY(self.移动坐标.x,self.移动坐标.y),20)
    self.角度=取两点角度(生成XY(self.显示xy.x,self.显示xy.y),生成XY(self.移动距离.x,self.移动距离.y))
    self:换方向(角度算四方向(self.角度))
    self.显示xy.x,self.显示xy.y=self.移动距离.x,self.移动距离.y
  else
    self.返回开关=false
    self.动作="待战"
    self:换方向(self.初始方向)
    self.显示xy.x,self.显示xy.y=self.初始xy.x,self.初始xy.y
  end
end

function 战斗单位类:移动事件()
  if 取两点距离(生成XY(self.显示xy.x,self.显示xy.y),生成XY(self.移动坐标.x,self.移动坐标.y))>=self.移动上限 then
    self.移动距离=取移动坐标(生成XY(self.显示xy.x,self.显示xy.y),生成XY(self.移动坐标.x,self.移动坐标.y),self.移动频率)
    self.角度=取两点角度(生成XY(self.显示xy.x,self.显示xy.y),生成XY(self.移动距离.x,self.移动距离.y))
    self.方向=角度算四方向(self.角度)
    self.动画:置方向(角度算四方向(self.角度),self.动作)
    self.显示xy.x,self.显示xy.y=self.移动距离.x,self.移动距离.y
  else
    self.角度=取两点角度(生成XY(self.显示xy.x,self.显示xy.y),生成XY(self.移动坐标.x,self.移动坐标.y))
    self.方向=角度算四方向(self.角度)
    self.动画:置方向(角度算四方向(self.角度),self.动作)
    self.移动开关=false
  end
end

function 战斗单位类:开启躲避()
  self.躲避类型=1
  self.停止躲避=75
  self.躲避开关=true
  self.躲避数量=0
  self.躲避xy={}
  self.躲避xy.x,self.躲避xy.y=self.显示xy.x,self.显示xy.y
end

function 战斗单位类:躲避事件()
  if self.躲避类型==1 then
    self.显示xy.x,self.显示xy.y=self.显示xy.x+self.躲避坐标,self.显示xy.y+self.躲避坐标
    self.躲避数量=math.floor(取两点距离(生成XY(self.初始xy.x,self.初始xy.y),生成XY(self.显示xy.x,self.显示xy.y))/15)
    if(取两点距离(生成XY(self.初始xy.x,self.初始xy.y),生成XY(self.显示xy.x,self.显示xy.y))>=self.停止躲避)then
      self.躲避类型=2
    end
  elseif self.躲避类型==2 then
    self.显示xy.x,self.显示xy.y=self.显示xy.x-self.躲避坐标,self.显示xy.y-self.躲避坐标
    self.躲避数量=math.floor(取两点距离(生成XY(self.初始xy.x,self.初始xy.y),生成XY(self.显示xy.x,self.显示xy.y))/15)
    if(取两点距离(生成XY(self.初始xy.x,self.初始xy.y),生成XY(self.显示xy.x,self.显示xy.y))<=5)then
      self.显示xy.x,self.显示xy.y=self.初始xy.x,self.初始xy.y
      self.躲避类型=0
      self.躲避开关=false
      --self.掉血开关=false
    end
  end
  self:躲避处理()
end

function 战斗单位类:躲避处理()
  for n=1,self.躲避数量 do
    -- self.躲避动画:显示(self.躲避xy.x+self.躲避参数*n,self.躲避xy.y+self.躲避参数*n,self.动作)
    self.动画:显示(self.躲避xy.x+self.躲避参数*n,self.躲避xy.y+self.躲避参数*n,self.动作)
  end
end

function 战斗单位类:是否选中(x,y)
  return self.动画.动画[self.动作]:是否选中(x,y)
end

function 战斗单位类:置高亮()
  self.动画.动画[self.动作]:置高亮()
  if self.动画.武器~=nil and self.动画.武器[self.动作]~=nil then
    self.动画.武器[self.动作]:置高亮()
  end
end

function 战斗单位类:取消高亮()
  self.动画.动画[self.动作]:取消高亮()
  if self.动画.武器~=nil and self.动画.武器[self.动作]~=nil  then
    self.动画.武器[self.动作]:取消高亮()
  end
end

function 战斗单位类:取状态()
  if self.移动开关 or self.击退开关 or self.击飞开关 or self.倒地开关 or self.返回开关 or self.躲避开关 or self.飞镖开关 then
    return false
  else
    return true
  end
end

function 战斗单位类:更新(dt)
  if self.鼠标跟随 then
    self.显示xy.x,self.显示xy.y=鼠标.x,鼠标.y
  end
  if self.显示xy==nil then
    self.显示xy={}
    self.显示xy.x,self.显示xy.y=鼠标.x,鼠标.y
  end
  self.x,self.y=self.显示xy.x,self.显示xy.y
  if self.动作=="待战" or self.动作=="倒地" then
    if self.状态特效.疯狂 or self.状态特效.反间之计 then
      if self.抖动数据.开关==false then
        self.抖动数据.开关=true
        self.抖动数据.进程=1
        self.抖动数据.x,self.抖动数据.y=-0.2,-0.2
      else
        self.抖动数据.进程=self.抖动数据.进程+1
        if self.抖动数据.进程<=5 then
          self.抖动数据.x,self.抖动数据.y=self.抖动数据.进程-self.抖动数据.进程*2,self.抖动数据.进程-self.抖动数据.进程*2
        else
          self.抖动数据.x,self.抖动数据.y=self.抖动数据.x+0.2,self.抖动数据.y+0.2
          if self.抖动数据.进程>=12 then
            self.抖动数据.进程=0
          end
        end
      end
    elseif self.抖动数据.开关 then
      self.抖动数据.进程=0
      self.抖动数据.x,self.抖动数据.y=0,0
      self.抖动数据.开关=false
    end
  end
  if self.停止更新 and self.动画:取当前帧(self.动作)>=self.动画:取结束帧(self.动作) then
    if self.动作=="死亡" and self.倒地开关 then
      self.倒地开关=false
    end
  else
    self.动画:更新(dt,self.动作)
    -- self.更新次数=self.更新次数+1
  end
  if self.动画:取当前帧(self.动作)>=self.动画:取结束帧(self.动作) then
    if self.添加状态~=nil and not self:无需特效(self.添加状态) then
      local 状态参数=self:状态前置(self.添加状态)
      self.状态特效[self.添加状态]=状态参数
      self.状态特效[self.添加状态].动画=tp:载入特效("状态_"..self.添加状态,self:取txz(self.添加状态))
      self.添加状态=nil
    end
    if self.取消状态~=nil then
      self.状态特效[self.取消状态]=nil
      self.取消状态=nil
    end
    if self.结尾掉血~=nil then
      self:设置掉血(self.结尾掉血,1)
      self.结尾掉血=nil
    end
  end
  if self.移动开关 then
    self:移动事件()
  end
  if self.击退开关 then
    self:击退处理()
  end
  if self.飞镖开关 then
    self.飞镖动画:更新(dt)
    self.飞镖xy=取移动坐标(self.飞镖xy,self.显示xy,5)
    self.飞镖动画:显示(self.飞镖xy.x,self.飞镖xy.y)
    if 取两点距离(self.飞镖xy,self.显示xy)<=20 then
      self:设置掉血(self.飞镖数据.伤害,1)
      self:换动作("挨打",nil,true)
      self:开启击退(self.飞镖数据.死亡)
      self.飞镖开关=nil
      self.飞镖动画=nil
    end
  end
  if self.溅射开关 then
    self:设置掉血(self.溅射数据.伤害,1)
    -- self:换动作("挨打",nil,true)
    self:开启击退(self.溅射数据.死亡)
    self.溅射开关=nil
  end
  if self.返回开关 then self:返回事件() end
  if self.击飞开关 then self:击飞处理() end
  if self.躲避开关 then self:躲避事件() end
  if self.动作复原  then
    if self.动画:取当前帧(self.动作)==self.动画:取结束帧(self.动作) then
      if self.动作=="攻击" then
        self.动画:置帧率("攻击",0.1)
      end
      self:换动作("待战")
    end
  end
  if self.抓捕开关 then
    if self.捕捉暂停~=nil and 时间-self.捕捉暂停>=1 then
      self.捕捉暂停=nil
      self.抓捕动画:置方向(0)
      -- self.抓捕开关=false
      if self.抓捕成功 then
        战斗类.战斗单位[self.抓捕编号]:设置抓捕路径({x=self.显示xy.x,y=self.显示xy.y},self.抓捕成功)
      end
    end
    self.抓捕动画:更新(dt)
    -- self.抓捕动画:显示(self.抓捕xy.x,self.抓捕xy.y)
    -- 名称显示(self.抓捕名称,self.抓捕xy)
    if self.抓捕流程==1 then
      -- self.抓捕xy.x,self.抓捕xy.y=self.抓捕xy.x-2,self.抓捕xy.y-2
      self.抓捕xy=取移动坐标(self.抓捕xy,self.抓捕目标,3)
      if 取两点距离(self.抓捕xy,self.抓捕目标)<=40 then
      self.抓捕流程=2
      self.捕捉暂停=时间
      end
    elseif self.抓捕流程==2 and self.捕捉暂停==nil then
      -- self.抓捕xy.x,self.抓捕xy.y=self.抓捕xy.x+2,self.抓捕xy.y+2
      self.抓捕xy=取移动坐标(self.抓捕xy,生成XY(self.显示xy.x,self.显示xy.y),3)
      if 取两点距离(self.抓捕xy,self.显示xy)<=10 then
        self.抓捕动画=nil
        self.抓捕开关=false
        -- table.print(self.显示xy)
      end
    end
  end
  if self.抓捕移动~=nil then
    -- self.显示xy.x,self.显示xy.y=self.显示xy.x+2,self.显示xy.y+2
    self.显示xy=取移动坐标(self.显示xy,self.抓捕移动,3)
    if 取两点距离(self.抓捕移动,self.显示xy)<=30 then
      self.是否显示=false
      self.显示xy.x,self.显示xy.y=1500,1500
      self.抓捕移动=nil
    end
  end
end

function 战斗单位类:设置溅射(xy,方向,伤害,死亡)
  self.溅射数据={伤害=伤害,死亡=死亡}
  self.溅射开关=true
end

function 战斗单位类:设置抓捕路径(目标,成功)
   self:换动作("跑去")
   self.抓捕移动=目标
end

function 战斗单位类:设置抓捕动画(目标,模型,成功,名称)
  self.抓捕资源=引擎.取模型(模型)
  self.抓捕动画=tp.资源:载入(self.抓捕资源[3],"网易WDF动画",self.抓捕资源[2])
  self.抓捕动画:置方向(2)
  self.抓捕动画:取消高亮()
  self.抓捕流程=1
  self.抓捕成功=成功
  self.抓捕目标={x=战斗类.战斗单位[目标].显示xy.x,y=战斗类.战斗单位[目标].显示xy.y}
  self.抓捕xy={x=self.显示xy.x,y=self.显示xy.y}
  self.抓捕开关=true
  self.抓捕编号=目标
  self.抓捕名称=名称
end

function 战斗单位类:取消变相(dt,x,y)
  self.动画.动画["待战"]:取消高亮()
  --self.动画.动画[self.动作]:置颜色()
  if self.动画.武器~= nil then
    self.动画.武器["待战"]:取消高亮()
    --self.动画.武器[self.动作]:置颜色()
  end
end

function 战斗单位类:显示(dt,x,y)
  if self.是否显示==false then return  end
  for i, v in pairs(self.状态特效) do
    if self.状态特效[i]~=nil then
      if self.状态特效[i].cp==false and self.状态特效[i].动画~=nil then
       self.状态特效[i].动画:更新(dt*1.5)
       self.状态特效[i].动画:显示(self.显示xy.x+self.抖动数据.x+self.状态特效[i].py[1],self.显示xy.y+self.抖动数据.y+self.状态特效[i].py[2])
      end
    end
  end

  if self.状态特效["修罗隐身"]~=nil or self.状态特效["分身术"]~=nil or self.状态特效["楚楚可怜"]~=nil  then
    self.动画.动画["待战"]:置颜色(1694498815)
    if self.动画.武器 ~= nil then
      self.动画.武器["待战"]:置颜色(1694498815)
    end
  end
  if self.状态特效["金刚护法"]~=nil and self.状态特效["修罗隐身"]==nil and self.状态特效["分身术"]==nil then
    self.色相变身 = self.色相变身 + 1
    if self.色相变身 >= 30 then
      self.动画.动画["待战"]:取消高亮()
      if self.动画.武器~= nil then
        self.动画.武器["待战"]:取消高亮()
      end
      if self.色相变身 >= 60 then
        self.色相变身 = 0
      end
    else
      self.动画.动画["待战"]:置高亮模式(-10855936)
      if self.动画.武器 ~= nil then
        self.动画.武器["待战"]:置高亮模式(-10855936)
      end
    end
  end
  if self.逃跑开关 then
    self.动作="返回"
  end
  if self.飞镖开关 then
    self.飞镖动画:显示(self.飞镖xy.x,self.飞镖xy.y)
  end
  if self.躲避开关 then

  else
    self.动画:显示(self.显示xy.x+self.抖动数据.x,self.显示xy.y+self.抖动数据.y,self.动作)
  end

  --zt:置颜色(self.名称颜色)
  --zt:置阴影颜色(-1275068416)
  if self.抓捕开关 then
    self.抓捕动画:显示(self.抓捕xy.x,self.抓捕xy.y)
    名称显示(self.抓捕名称,self.抓捕xy)
    tp.影子:显示(self.抓捕xy.x,self.抓捕xy.y)
  end
  for i, v in pairs(self.状态特效) do
    if self.状态特效[i]~=nil then
      if self.状态特效[i].cp and self.状态特效[i].动画~=nil then
        self.状态特效[i].动画:更新(dt*1.5)
        self.状态特效[i].动画:显示(self.显示xy.x+self.抖动数据.x+self.状态特效[i].py[1],self.显示xy.y+self.抖动数据.y+self.状态特效[i].py[2])
      end
    end
  end

  for n=1,#self.攻击特效 do
    if  self.攻击特效[n]~=nil then
       self.攻击特效[n]:更新(dt*1.5)
      self.攻击特效[n]:显示(self.显示xy.x,self.显示xy.y)
      if self.攻击特效[n].当前帧==self.攻击特效[n].结束帧 then
         table.remove(self.攻击特效,n)
      	 end
      end
 	 end
  for n=1,#self.法术特效 do
    if  self.法术特效[n]~=nil then
      if self.法术特效[n].加速==nil then
        self.法术特效[n]:更新(dt)
      else
        self.法术特效[n]:更新(self.法术特效[n].加速)
        end
      self.法术特效[n]:显示(self.显示xy.x+self.抖动数据.x,self.显示xy.y+self.抖动数据.y+self.法术特效[n].附加y)
      if self.法术特效[n].当前帧==self.法术特效[n].结束帧 then
         table.remove(self.法术特效,n)
      end
      end
   end
  if self.逃跑开关 then
    self.逃跑特效:更新(dt)
    self.逃跑特效:显示(self.显示xy.x+self.抖动数据.x,self.显示xy.y+self.抖动数据.y)
  end
end

function 战斗单位类:血条显示(x,y)
  if self.是否显示==false then return  end
  if self.敌我==1 then
    战斗类.血条背景:显示(floor(self.显示xy.x+self.抖动数据.x + self.附加.x - 23),floor(self.显示xy.y +self.抖动数据.y+ self.附加.y -self.高度+5))
    战斗类.血条栏:置区域(0,0,(self.气血 / self.最大气血) * 36,4)
    战斗类.血条栏:显示(floor(self.显示xy.x +self.抖动数据.x+ self.附加.x -22),floor(self.显示xy.y+self.抖动数据.y + self.附加.y -self.高度 + 6))
  end
  if  self.特技内容开关 then
    self:特技文本显示()
  end
  self.喊话:显示(self.显示xy.x,self.显示xy.y)
end

-- function 战斗单位类:设置掉血(数额,类型) --修改气血过多
--   if 数额==nil then 数额=1 end
--   self.伤害数额=数额
--   --print(self.伤害数额)
-- self.伤害数额=math.floor(self.伤害数额)
--  self.伤害数额=tostring(self.伤害数额)
--  self.伤害数额=string.format("%.0f",self.伤害数额)
--  self.伤害总数=string.len(self.伤害数额)
--   self.伤害序列={}
--   self.弹跳次数=12
--   self.弹跳间隔=2
--   self.伤害类型=类型
--   self.掉血开关=true
--   self.加血顺序=0
--   if 类型==1 or 类型==3 or 类型==4 then
--     self.气血=self.气血-数额
--     if self.气血<=0 then
--      self.气血=1
--     end
--     -- if self.法术状态组["催眠符"]~=nil then self.法术状态组["催眠符"]=nil end
--   else
--     self.气血=self.气血+数额
--     if self.气血>self.最大气血 then
--      self.气血=self.最大气血
--     end
--   end
--   for n=1,self.伤害总数 do
--     self.伤害序列[n]={}
--     self.伤害序列[n].数字=string.sub(self.伤害数额,n,n)
--     self.伤害序列[n].高度=0
--     self.伤害序列[n].x=self.显示xy.x-self.伤害总数*2-self.伤害总数*1.5
--     self.伤害序列[n].y=self.显示xy.y
--   end
--   self.弹跳顺序=1
-- end
function 战斗单位类:设置掉血(数额,类型) --原有
  if 数额==nil then 数额=1 end
  self.伤害数额=数额
  --print(self.伤害数额)
  self.伤害数额=math.floor(self.伤害数额)
  self.伤害总数=string.len(tostring(self.伤害数额))
  --print(self.伤害数额,类型)
  self.伤害序列={}
  self.弹跳次数=12
  self.弹跳间隔=2
  self.伤害类型=类型
  self.掉血开关=true
  self.加血顺序=0
  if 类型==1 or 类型==3 or 类型==4 then
    self.气血=self.气血-数额
    if self.气血<=0 then
     self.气血=1
    end
    -- if self.法术状态组["催眠符"]~=nil then self.法术状态组["催眠符"]=nil end
  else
    self.气血=self.气血+数额
    if self.气血>self.最大气血 then
     self.气血=self.最大气血
    end
  end
  for n=1,self.伤害总数 do
    self.伤害序列[n]={}
    self.伤害序列[n].数字=string.sub(self.伤害数额,n,n)
    self.伤害序列[n].高度=0
    self.伤害序列[n].x=self.显示xy.x-self.伤害总数*2-self.伤害总数*1.5
    self.伤害序列[n].y=self.显示xy.y
  end
  self.弹跳顺序=1
end
function 战斗单位类:加血显示()
  for n=1,self. 伤害总数 do
    self.加血顺序=self.加血顺序+1
    if n==self.弹跳顺序 then
      self.伤害序列[n].高度=self.伤害序列[n].高度+self.弹跳间隔
      if(self.伤害序列[n].高度>=self.弹跳次数) then
        self.弹跳顺序=self.弹跳顺序+1
      end
    elseif self.伤害序列[n].高度>0 then
      self.伤害序列[n].高度=self.伤害序列[n].高度-1
    end
    if(self.敌我==2)then
      self.回复图片[self.伤害序列[n].数字+1]:显示(self.伤害序列[n].x-20+n*12,self.伤害序列[n].y-30-self.伤害序列[n].高度)
    else
      self.回复图片[self.伤害序列[n].数字+1]:显示(self.伤害序列[n].x-20+n*12,self.伤害序列[n].y-30-self.伤害序列[n].高度)
    end
    if(self.加血顺序>=#self.伤害序列*40)then
      self.掉血开关=false
      --self.击退开关=false
    end
  end
end
-- function 战斗单位类:掉血显示()--修改

--   for n=1,#self.伤害序列 do
--      self.加血顺序=self.加血顺序+1

--      if n==self.弹跳顺序 then

--           self.伤害序列[n].高度=self.伤害序列[n].高度+self.弹跳间隔

--           if(self.伤害序列[n].高度>=self.弹跳次数) then

--              self.弹跳顺序=self.弹跳顺序+1
--              end

--         elseif self.伤害序列[n].高度>0 then

--           self.伤害序列[n].高度=self.伤害序列[n].高度-1


--          end
--       if(self.敌我==2)then

--          if self.伤害序列[n]==nil or self.伤害序列[n].数字==nil then return 0 end
--           self.伤害图片[self.伤害序列[n].数字+1]:显示(self.伤害序列[n].x-20+n*12,self.伤害序列[n].y-30-self.伤害序列[n].高度)
--         else
--           if self.伤害序列[n]==nil or self.伤害序列[n].数字==nil then return 0 end
--          --print(self.伤害序列[n].数字)
--          if self.伤害序列[n].数字==nil then self.伤害序列[n].数字=0 end
--          self.伤害图片[self.伤害序列[n].数字+1]:显示(self.伤害序列[n].x-10+n*12,self.伤害序列[n].y-30-self.伤害序列[n].高度)
--          end



--     end

--     if(self.加血顺序>=#self.伤害序列*40)then
--       self.掉血开关=false
--       --self.击退开关=false
--     end


-- end
function 战斗单位类:掉血显示()
  for n=1,#self.伤害序列 do
    self.加血顺序=self.加血顺序+1
    if n==self.弹跳顺序 then
      self.伤害序列[n].高度=self.伤害序列[n].高度+self.弹跳间隔
      if(self.伤害序列[n].高度>=self.弹跳次数) then
        self.弹跳顺序=self.弹跳顺序+1
      end
    elseif self.伤害序列[n].高度>0 then
      self.伤害序列[n].高度=self.伤害序列[n].高度-1
    end
    if(self.敌我==2)then
      if self.伤害序列[n]==nil or self.伤害序列[n].数字==nil then return 0 end
      self.伤害图片[self.伤害序列[n].数字+1]:显示(self.伤害序列[n].x-20+n*12,self.伤害序列[n].y-30-self.伤害序列[n].高度)
    else
      if self.伤害序列[n]==nil or self.伤害序列[n].数字==nil then return 0 end
      --print(self.伤害序列[n].数字)
      if self.伤害序列[n].数字==nil then self.伤害序列[n].数字=0 end
        self.伤害图片[self.伤害序列[n].数字+1]:显示(self.伤害序列[n].x-10+n*12,self.伤害序列[n].y-30-self.伤害序列[n].高度)
    end
  end
  if(self.加血顺序>=#self.伤害序列*40)then
    self.掉血开关=false
    --self.击退开关=false
  end
end

function 战斗单位类:暴击显示()
  for n=1,#self.伤害序列 do
    self.加血顺序=self.加血顺序+1
    if n==self.弹跳顺序 then
      self.伤害序列[n].高度=self.伤害序列[n].高度+self.弹跳间隔
      if(self.伤害序列[n].高度>=self.弹跳次数) then
        self.弹跳顺序=self.弹跳顺序+1
      end
    elseif self.伤害序列[n].高度>0 then
      self.伤害序列[n].高度=self.伤害序列[n].高度-1
    end
    if(self.敌我==2)then
      if self.伤害序列[n]==nil or self.伤害序列[n].数字==nil then
       return 0
      end
      self.暴击图片[self.伤害序列[n].数字+1]:显示(self.伤害序列[n].x-20+n*14,self.伤害序列[n].y-30-self.伤害序列[n].高度)
    else
      if self.伤害序列[n]==nil or self.伤害序列[n].数字==nil then
       return 0
      end
      --print(self.伤害序列[n].数字)
      if self.伤害序列[n].数字==nil then
       self.伤害序列[n].数字=0
      end
      self.暴击图片[self.伤害序列[n].数字+1]:显示(self.伤害序列[n].x-10+n*14,self.伤害序列[n].y-30-self.伤害序列[n].高度)
    end
  end
  if(self.加血顺序>=#self.伤害序列*40)then
    self.掉血开关=false
  end

end

function 战斗单位类:特技文本显示()
  self.关闭计次=self.关闭计次+1
  for n=1,self.特技总数 do
    if n==self.特技顺序 then
      self.特技序列[n].高度=self.特技序列[n].高度+self.特技间隔
      if(self.特技序列[n].高度>=self.特技次数) then
        self.特技顺序=self.特技顺序+1
      end
    elseif self.特技序列[n].高度>0 then
      self.特技序列[n].高度=self.特技序列[n].高度-1
    end
    self.特技文字:显示(self.特技序列[n].x-20+n*12,self.特技序列[n].y-30-self.特技序列[n].高度,self.特技序列[n].文本)
  end
  if self.关闭计次>=50 then self.特技内容开关=false end
end

return 战斗单位类