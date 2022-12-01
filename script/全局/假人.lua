--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2021-04-08 13:01:52
-- 梦幻西游游戏资源破解 baidwwy@vip.qq.com(313738139) 老毕   和 C++PrimerPlus 717535046 这俩位大神破解所以资源
--======================================================================--
local 场景类_假人 = class()

local floor = math.floor
local random = 引擎.取随机整数
local xys = 生成XY
local qmxs = 引擎.取模型
local qzdjy = 引擎.取锦衣模型
local qzdjys = 取锦衣身体模型
local remove = table.remove
local rwzt, tp
local bfx = 取八方向
local jds = 取两点角度
local jls = 取两点距离
local yds = 取移动坐标
local szb = 取四至八方向
local ARGB = ARGB
local mouse = 引擎.鼠标弹起
local pairs = ipairs
local qyg = 引擎.取野怪

function 场景类_假人:PB初始化(假人)
    假人.name = gbk.fromutf8(假人.name)
    假人.model = gbk.fromutf8(假人.model)
    假人.title = gbk.fromutf8(假人.title)
    假人.weapon = gbk.fromutf8(假人.weapon)
    假人.dress = gbk.fromutf8(假人.dress)
    假人.no = gbk.fromutf8(假人.no)
    假人.event = gbk.fromutf8(假人.event)
    假人.special = gbk.fromutf8(假人.special)

    if tp == nil then
        tp = 引擎.场景
        rwzt = tp.字体表.人物字体
    end
    local 资源 = qmxs(假人.model)
    if gbk.len(假人.dress) then
        资源 = qmxs(假人.dress .. '_' .. 假人.model)
        self.假人 = {['静立'] = tp.资源:载入(资源[3], '网易假人动画', 资源[1]), ['行走'] = tp.资源:载入(资源[3], '网易假人动画', 资源[2])}
    else
        self.假人 = {
            ['静立'] = tp.资源:载入(资源[3], '网易假人动画', 资源[1])
        }
        if 资源[2] ~= nil then
            self.假人['行走'] = tp.资源:载入(资源[3], '网易假人动画', 资源[2])
        else
            self.假人['行走'] = tp.资源:载入(资源[3], '网易假人动画', 资源[1])
        end
    end
    if 假人.direction ~= nil then
        假人.方向 = 假人.direction
    end
    if 假人.weapon ~= nil then
        假人.武器 = 假人.weapon
    end
    假人.Y = 假人.y + (random(1, 12) / 100) -- ????
    print('////////////////////' .. 假人.x .. 假人.y)
    self.名称 = 假人.name
    self.标识 = 假人.id
    self.序列 = 假人.idx
    self.坐标 = xys(floor(假人.x * 20), floor(假人.y * 20) + 0.1)
    self.真实坐标 = xys(floor(假人.x * 20), floor(假人.y * 20) + 0.1)
    print('////////////////////' .. table.tostring(xys(floor(假人.x * 20), floor(假人.y * 20) + 0.1)))
    self.编号 = 假人.idx
    self.行为 = '静立'
    self.类型 = '假人'
    self.需求 = {}
    if 假人.model == 宝箱 then
        假人.方向 = 0
    end
    self.方向 = 假人.direction
    self.记忆方向 = self.方向
    self.真实编号 = 假人.no
    self.执行事件 = 假人.event
    self.初始坐标 = self.坐标
    self.事件ID = 假人.eventId
    self.武器 = 假人.weapon
    self.模型 = 假人.model
    self.染色组 = 假人.color
    --self.炫彩 = 假人.炫彩
    --self.炫彩组 = 假人.炫彩组
    self.锦衣 = 假人.dress
    self.特殊BOSS = 假人.special
    self.组合 = 假人.combine -- ????
    self.小地图名称颜色 = 假人.mapColor
    self.商业分类1 = 假人.business[1]
    self.商业分类2 = 假人.business[2]
    self.商业分类3 = 假人.business[3]
    self.商业分类4 = 假人.business[4]
    self.行走开关 = 假人.walk
    self.触碰延时 = 时间
    self.领取人id = {} -- 假人.targetIds
    self.名称偏移 = xys(tp.字体表.人物字体:取宽度(self.名称) / 2, -15)
    -- self.喊话 = require("script/显示类/喊话").创建(根)
    if gbk.len(假人.title) > 0 then
        if 假人.称谓 == '狂暴之力' then
            self.狂暴之力 = tp.资源:载入('wzife.wd5', '网易假人动画', 0x01000074)
        elseif 假人.称谓 == '至尊财神' then
            self.至尊财神 = tp.资源:载入('wzife.wd5', '网易假人动画', 0x01000051)
        elseif 假人.称谓 == '武林圣者' then
            self.武林圣者 = tp.资源:载入('wzife.wd5', '网易假人动画', 0x01000076)
        elseif 假人.称谓 == '超凡入圣' then
            self.超凡入圣 = tp.资源:载入('wzife.wd5', '网易假人动画', 0x01000087)
        elseif 假人.称谓 == '洞察先机' then
            self.洞察先机 = pwd('39')
        elseif 假人.称谓 == '独步青云' then
            self.独步青云 = pwd('40')
        elseif 假人.称谓 == '风华绝代' then
            self.风华绝代 = pwd('41')
        elseif 假人.称谓 == '风云再起' then
            self.风云再起 = pwd('42')
        elseif 假人.称谓 == '盖世无双' then
            self.盖世无双 = pwd('43')
        elseif 假人.称谓 == '盖世英豪' then
            self.盖世英豪 = pwd('44')
        elseif 假人.称谓 == '九五之尊' then
            self.九五之尊 = pwd('45')
        elseif 假人.称谓 == '龙皇' then
            self.龙皇 = pwd('46')
        elseif 假人.称谓 == '神豪' then
            self.神豪 = pwd('47')
        elseif 假人.称谓 == '战神' then
            self.战神 = pwd('48')
        elseif 假人.称谓 == '纵横三界王者风云' then
            self.纵横三界王者风云 = pwd('49')
        elseif 假人.称谓 == '武神坛甲组冠军' then
            self.甲组冠军 = tp.资源:载入('xzsc.wdf', '网易WDF动画', 0xC4A082C0)
        elseif 假人.称谓 == '武神坛甲组亚军' then
            self.甲组亚军 = tp.资源:载入('xzsc.wdf', '网易WDF动画', 0xE7706EE2)
        elseif 假人.称谓 == '武神坛甲组季军' then
            self.甲组季军 = tp.资源:载入('xzsc.wdf', '网易WDF动画', 0x6336F8B3)
        elseif 假人.称谓 == '武神坛明星冠军' then
            self.明星冠军 = tp.资源:载入('xzsc.wdf', '网易WDF动画', 0xEB07CCCD)
        elseif 假人.称谓 == '武神坛明星亚军' then
            self.明星亚军 = tp.资源:载入('xzsc.wdf', '网易WDF动画', 0x550B771D)
        elseif 假人.称谓 == '武神坛明星季军' then
            self.明星季军 = tp.资源:载入('xzsc.wdf', '网易WDF动画', 0x69E88E4D)
        elseif 假人.称谓 == '九天揽月' then
            self.九天揽月 = tp.资源:载入('xzsc.wdf', '网易WDF动画', 0xAAFEC211)
        elseif 假人.称谓 == '剑指苍穹' then
            self.剑指苍穹 = tp.资源:载入('xzsc.wdf', '网易WDF动画', 0xFFAE13EE)
        elseif 假人.称谓 == '势不可挡' then
            self.势不可挡 = tp.资源:载入('xzsc.wdf', '网易WDF动画', 0xBEBEAE78)
        elseif 假人.称谓 == '王者风范' then
            self.王者风范 = tp.资源:载入('xzsc.wdf', '网易WDF动画', 0xCEAA7B7A)
        elseif 假人.称谓 == '绝世豪侠' then
            self.绝世豪侠框 = tp.资源:载入('xzsc.wdf', '网易WDF动画', 0xF15069E9)
        elseif 假人.称谓 == '江湖豪侠' then
            self.江湖豪侠框 = tp.资源:载入('xzsc.wdf', '网易WDF动画', 0xF15069E9)
        elseif 假人.称谓 == '威震四方' then
            self.梦幻大亨框 = tp.资源:载入('xzsc.wdf', '网易WDF动画', 0x0975DF49)
        elseif 假人.称谓 == '只手遮天' then
            self.黄称谓边框 = tp.资源:载入('xzsc.wdf', '网易WDF动画', 0xD7EA9DC8)
        elseif 假人.称谓 == '降龙伏虎' then
            self.黄称谓边框 = tp.资源:载入('xzsc.wdf', '网易WDF动画', 0xD7EA9DC8)
        elseif 假人.称谓 == '富可敌国' then
            self.富可敌国框 = tp.资源:载入('xzsc.wdf', '网易WDF动画', 0x21F08540)
        elseif 假人.称谓 == '幕神梦幻' then
            self.幕神梦幻框 = tp.资源:载入('xzsc.wdf', '网易WDF动画', 0x21F08540)
        elseif 假人.称谓 == '窈窕淑女' then
            self.窈窕淑女框 = tp.资源:载入('xzsc.wdf', '网易WDF动画', 0x800F661C)
        end
        self.称谓 = 假人.title
        self.称谓偏移 = xys(tp.字体表.人物字体:取宽度(self.title) / 2, -15)
        self.名称偏移.y = -35
    end
    self.目标格子 = {}
    self.任务开关 = {}
    self.方向开关 = self.假人.静立.方向数 == 8
    self.移动 = false
    if self.执行事件 == '明雷怪' or self.行走开关 then
        self.行走时间 = 20 + random(-10, 10)
    end
    if gbk.len(假人.weapon) > 0 then
        self:PB置武器(假人)
    elseif qmxs('武器_' .. 假人.model)[1] ~= nil then
        self:PB置武器(假人, true)
    end
    if 假人.colorW ~= nil and #假人.colorW > 0 then
        self.武器染色方案 = 假人.colorW[4]
        self.武器染色组 = 假人.colorW
    end
    if 假人.color ~= nil and #假人.color > 0 then
        self.染色方案 = 假人.color[4]
        self.染色组 = 假人.color
        if gbk.len(假人.dress) > 0 then
        else
            self:置染色(假人.color[4], 假人.color[1], 假人.color[2], 假人.color[3])
        end
    end

    self.静止转移 = self.假人.静立.帧数 <= 4 or (self.执行事件 == '明雷怪' or self.行走开关)
    if 假人.模型 == '宝箱' then
        self.静止转移 = nil
    end
    if 假人.模型 == '神树' then
        self.静止转移 = nil
    end
    if 假人.模型 == '桃树' then
        self.静止转移 = nil
    end
    if 假人.模型 == '帮派机关人' then
        self.静止转移 = nil
    end
    if 假人.模型 == '道观' then
        self.静止转移 = nil
    end
    if 假人.模型 == '鼠先锋' then
        self.静止转移 = nil
    end
    self.触发事件 = 假人.touchEvent
    self.触发计次 = 0
    self:置方向(self.方向)
    self.显示1 = true
    self.显示2 = true
    if self.targetIds ~= nil and #self.targetIds > 0 then
        self.显示2 = false
        for i = 1, #self.targetIds do
            if self.targetIds[i] ~= nil and self.targetIds[i] == tp.场景.人物.id then
                self.显示2 = true
            end
        end
    end
end

function 场景类_假人:初始化(假人)
    if 开发调试 then
        self:PB初始化(假人)
    else
        if tp == nil then
            tp = 引擎.场景
            rwzt = tp.字体表.人物字体
        end
        local 资源 = qmxs(假人.模型)
        if 假人.锦衣 ~= nil and 假人.锦衣 ~= 0 then
            资源 = qmxs(假人.锦衣 .. '_' .. 假人.模型)
            self.假人 = {['静立'] = tp.资源:载入(资源[3], '网易假人动画', 资源[1]), ['行走'] = tp.资源:载入(资源[3], '网易假人动画', 资源[2])}
        else
            self.假人 = {
                ['静立'] = tp.资源:载入(资源[3], '网易假人动画', 资源[1])
            }
            if 资源[2] ~= nil then
                self.假人['行走'] = tp.资源:载入(资源[3], '网易假人动画', 资源[2])
            else
                self.假人['行走'] = tp.资源:载入(资源[3], '网易假人动画', 资源[1])
            end
        end
        if 假人.方向 ~= nil then
            假人.方向 = 假人.方向
        end
        if 假人.武器 ~= nil then
            假人.武器 = 假人.武器
        end
        假人.Y = 假人.Y + (random(1, 12) / 100)
        print('>>>>>>>>>>>>>>>>>>>>>', 假人.Y, 假人.X)
        self.名称 = 假人.名称
        self.标识 = 假人.id
        self.序列 = 假人.编号
        self.坐标 = xys(floor(假人.X * 20), floor(假人.Y * 20) + 0.1)
        self.真实坐标 = xys(floor(假人.X * 20), floor(假人.Y * 20) + 0.1)
        print('////////////////////' .. table.tostring(xys(floor(假人.X * 20), floor(假人.Y * 20) + 0.1)))
        self.编号 = 假人.编号
        self.行为 = '静立'
        self.类型 = '假人'
        self.需求 = {}
        if 假人.模型 == 宝箱 then
            假人.方向 = 0
        end
        self.方向 = 假人.方向
        self.记忆方向 = self.方向
        self.真实编号 = 假人.真实编号
        self.执行事件 = 假人.执行事件
        self.初始坐标 = self.坐标
        self.事件ID = 假人.事件ID
        self.武器 = 假人.武器
        self.模型 = 假人.模型
        self.染色组 = 假人.染色组
        --self.炫彩 = 假人.炫彩
        --self.炫彩组 = 假人.炫彩组
        self.锦衣 = 假人.锦衣
        self.特殊BOSS = 假人.特殊BOSS
        self.组合 = 假人.组合
        self.小地图名称颜色 = 假人.小地图名称颜色
        self.商业分类1 = 假人.商业分类1
        self.商业分类2 = 假人.商业分类2
        self.商业分类3 = 假人.商业分类3
        self.商业分类4 = 假人.商业分类4
        self.行走开关 = 假人.行走开关
        self.触碰延时 = 时间
        self.领取人id = 假人.领取人id
        self.名称偏移 = xys(tp.字体表.人物字体:取宽度(self.名称) / 2, -15)
        -- self.喊话 = require("script/显示类/喊话").创建(根)
        if 假人.称谓 ~= '' and 假人.称谓 ~= 0 and 假人.称谓 ~= nil then
            if 假人.称谓 == '狂暴之力' then
                self.狂暴之力 = tp.资源:载入('wzife.wd5', '网易假人动画', 0x01000074)
            elseif 假人.称谓 == '至尊财神' then
                self.至尊财神 = tp.资源:载入('wzife.wd5', '网易假人动画', 0x01000051)
            elseif 假人.称谓 == '武林圣者' then
                self.武林圣者 = tp.资源:载入('wzife.wd5', '网易假人动画', 0x01000076)
            elseif 假人.称谓 == '超凡入圣' then
                self.超凡入圣 = tp.资源:载入('wzife.wd5', '网易假人动画', 0x01000087)
            elseif 假人.称谓 == '洞察先机' then
                self.洞察先机 = pwd('39')
            elseif 假人.称谓 == '独步青云' then
                self.独步青云 = pwd('40')
            elseif 假人.称谓 == '风华绝代' then
                self.风华绝代 = pwd('41')
            elseif 假人.称谓 == '风云再起' then
                self.风云再起 = pwd('42')
            elseif 假人.称谓 == '盖世无双' then
                self.盖世无双 = pwd('43')
            elseif 假人.称谓 == '盖世英豪' then
                self.盖世英豪 = pwd('44')
            elseif 假人.称谓 == '九五之尊' then
                self.九五之尊 = pwd('45')
            elseif 假人.称谓 == '龙皇' then
                self.龙皇 = pwd('46')
            elseif 假人.称谓 == '神豪' then
                self.神豪 = pwd('47')
            elseif 假人.称谓 == '战神' then
                self.战神 = pwd('48')
            elseif 假人.称谓 == '纵横三界王者风云' then
                self.纵横三界王者风云 = pwd('49')
            elseif 假人.称谓 == '武神坛甲组冠军' then
                self.甲组冠军 = tp.资源:载入('xzsc.wdf', '网易WDF动画', 0xC4A082C0)
            elseif 假人.称谓 == '武神坛甲组亚军' then
                self.甲组亚军 = tp.资源:载入('xzsc.wdf', '网易WDF动画', 0xE7706EE2)
            elseif 假人.称谓 == '武神坛甲组季军' then
                self.甲组季军 = tp.资源:载入('xzsc.wdf', '网易WDF动画', 0x6336F8B3)
            elseif 假人.称谓 == '武神坛明星冠军' then
                self.明星冠军 = tp.资源:载入('xzsc.wdf', '网易WDF动画', 0xEB07CCCD)
            elseif 假人.称谓 == '武神坛明星亚军' then
                self.明星亚军 = tp.资源:载入('xzsc.wdf', '网易WDF动画', 0x550B771D)
            elseif 假人.称谓 == '武神坛明星季军' then
                self.明星季军 = tp.资源:载入('xzsc.wdf', '网易WDF动画', 0x69E88E4D)
            elseif 假人.称谓 == '九天揽月' then
                self.九天揽月 = tp.资源:载入('xzsc.wdf', '网易WDF动画', 0xAAFEC211)
            elseif 假人.称谓 == '剑指苍穹' then
                self.剑指苍穹 = tp.资源:载入('xzsc.wdf', '网易WDF动画', 0xFFAE13EE)
            elseif 假人.称谓 == '势不可挡' then
                self.势不可挡 = tp.资源:载入('xzsc.wdf', '网易WDF动画', 0xBEBEAE78)
            elseif 假人.称谓 == '王者风范' then
                self.王者风范 = tp.资源:载入('xzsc.wdf', '网易WDF动画', 0xCEAA7B7A)
            elseif 假人.称谓 == '绝世豪侠' then
                self.绝世豪侠框 = tp.资源:载入('xzsc.wdf', '网易WDF动画', 0xF15069E9)
            elseif 假人.称谓 == '江湖豪侠' then
                self.江湖豪侠框 = tp.资源:载入('xzsc.wdf', '网易WDF动画', 0xF15069E9)
            elseif 假人.称谓 == '威震四方' then
                self.梦幻大亨框 = tp.资源:载入('xzsc.wdf', '网易WDF动画', 0x0975DF49)
            elseif 假人.称谓 == '只手遮天' then
                self.黄称谓边框 = tp.资源:载入('xzsc.wdf', '网易WDF动画', 0xD7EA9DC8)
            elseif 假人.称谓 == '降龙伏虎' then
                self.黄称谓边框 = tp.资源:载入('xzsc.wdf', '网易WDF动画', 0xD7EA9DC8)
            elseif 假人.称谓 == '富可敌国' then
                self.富可敌国框 = tp.资源:载入('xzsc.wdf', '网易WDF动画', 0x21F08540)
            elseif 假人.称谓 == '幕神梦幻' then
                self.幕神梦幻框 = tp.资源:载入('xzsc.wdf', '网易WDF动画', 0x21F08540)
            elseif 假人.称谓 == '窈窕淑女' then
                self.窈窕淑女框 = tp.资源:载入('xzsc.wdf', '网易WDF动画', 0x800F661C)
            end
            self.称谓 = 假人.称谓
            self.称谓偏移 = xys(tp.字体表.人物字体:取宽度(self.称谓) / 2, -15)
            self.名称偏移.y = -35
        end
        self.目标格子 = {}
        self.任务开关 = {}
        self.方向开关 = self.假人.静立.方向数 == 8
        self.移动 = false
        if self.执行事件 == '明雷怪' or self.行走开关 then
            self.行走时间 = 20 + random(-10, 10)
        -- if 资源[2] ~= nil then
        -- 	 self.假人["行走"] = tp.资源:载入(资源[3],"网易假人动画",资源[2])
        -- end
        end
        if 假人.武器 ~= nil then
            self:置武器(假人)
        elseif qmxs('武器_' .. 假人.模型)[1] ~= nil then
            self:置武器(假人, true)
        end
        if 假人.武器染色方案 ~= nil and 假人.武器染色组 ~= nil then
            self.武器染色方案 = 假人.武器染色方案
            self.武器染色组 = 假人.武器染色组
        end
        if 假人.染色方案 ~= nil and 假人.染色组 ~= nil then
            self.染色方案 = 假人.染色方案
            self.染色组 = 假人.染色组
            if 假人.锦衣 ~= nil and 假人.锦衣 ~= 0 then
            else
                self:置染色(假人.染色方案, 假人.染色组[1], 假人.染色组[2], 假人.染色组[3])
            end
        end

        self.静止转移 = self.假人.静立.帧数 <= 4 or (self.执行事件 == '明雷怪' or self.行走开关)
        if 假人.模型 == '宝箱' then
            self.静止转移 = nil
        end
        if 假人.模型 == '神树' then
            self.静止转移 = nil
        end
        if 假人.模型 == '桃树' then
            self.静止转移 = nil
        end
        if 假人.模型 == '帮派机关人' then
            self.静止转移 = nil
        end
        if 假人.模型 == '道观' then
            self.静止转移 = nil
        end
        if 假人.模型 == '鼠先锋' then
            self.静止转移 = nil
        end
        self.触发事件 = 假人.触发事件
        self.触发计次 = 0
        self:置方向(self.方向)
        self.显示1 = true
        self.显示2 = true
        if self.领取人id ~= nil and self.领取人id ~= 0 and #self.领取人id ~= nil then
            if #self.领取人id ~= 0 then
                self.显示2 = false
                for i = 1, #self.领取人id do
                    if self.领取人id[i] ~= nil and self.领取人id[i] == tp.场景.人物.id then
                        self.显示2 = true
                    end
                end
            end
        end
    end
end

function 场景类_假人:下一点(xy)
    if xy then
        if #self.目标格子 > 1 then
            local 位置 = #self.目标格子
            local 最后 = self.目标格子[位置]
            for n = 1, #self.目标格子 do
                if tp.场景.地图.寻路:判断直线障碍(xy, self.目标格子[n]) then
                    位置 = n
                    break
                end
            end
            for i = 1, 位置 do
                remove(self.目标格子, 1)
            end
            if #self.目标格子 == 0 then
                self.目标格子 = 最后
            end
        end
    end
end

function 场景类_假人:取目标()
    if self.目标格子[1] == nil then
        return
    end
    self.终点 = xys(floor(self.目标格子[1].x * 20), floor(self.目标格子[1].y * 20))
end

function 场景类_假人:开始移动()
    if self.目标格子[1] == nil then
        self:停止移动()
        return
    end
    self.行为 = '行走'
    local 方向 = 取八方向(jds(self.真实坐标, self.终点), not self.方向开关)
    if jls(self.真实坐标, self.终点) < 2 then -- 小于可移动点直接到达位置
        self.真实坐标 = self.终点
        remove(self.目标格子, 1)
        self:下一点(self.目标格子[1])
        if #self.目标格子 <= 0 then
            self:停止移动()
        end
        self:取目标()
        return false
    end
    self.真实坐标 = yds(self.真实坐标, self.终点, 2)
    self:置方向(方向)
end

function 场景类_假人:停止移动()
    self.目标格子 = {}
    self.行为 = '静立'
    self.移动 = false
end

function 场景类_假人:事件开始()
    if 开发调试 then
        --  TODO 数据请求
    else
        客户端:发送数据(1501, {地图 = tp.当前地图, 编号 = self.编号, 序列 = self.序列, 标识 = self.标识}, 1)
    end
    --[[
	if self.执行事件 == "宝图强盗" and not tp.消息栏焦点 then
		引擎.强盗战斗(false,self.名称,tp.当前地图,self.编号)
	elseif self.执行事件 == "抓鬼" and not tp.消息栏焦点 then
		引擎.抓鬼战斗(tp.当前地图,self.名称,self.模型,self.编号)
	elseif self.执行事件 == "28星宿" and not tp.消息栏焦点 then
		引擎.星宿事件(tp.当前地图,self.名称,self.编号,self.模型)
	elseif self.执行事件 == "十五门派大闯关" and not tp.消息栏焦点 then
		tp.窗口.对话栏:文本(self.模型,self.名称,"少侠，你准备好迎接我的战斗了吗？",{"开始战斗吧","我还需要准备一下"},{"门派大闯关",self.名称,self.模型,self.武器,{self.染色方案,self.染色组},self.事件ID})
	elseif self.执行事件 == "四季轮转" and not tp.消息栏焦点 then
		引擎.四季事件(self.名称,self.真实编号,self.模型)
	elseif self.执行事件 == "保卫长安" and not tp.消息栏焦点 then
		引擎.保卫长安事件(self.名称,self.真实编号,self.模型,self.特殊BOSS,self.组合)
	elseif self.执行事件 == "副本" and not tp.消息栏焦点 then
		引擎.副本事件(self.名称,self.模型,self.真实编号)
	elseif self.执行事件 == "远古" and not tp.消息栏焦点 then
		引擎.活动事件(1,self.名称,self.模型,self.真实编号)
	elseif self.执行事件 == "十二生肖" and not tp.消息栏焦点 then
		tp.窗口.对话栏:文本(self.模型,self.名称,"自由自在的日子真舒服，再也不想回天牢那破地方了",{"终于找到你了，快和我回天庭自首！","你接着玩，我不打扰你了"},{self.名称,self.真实编号,self.模型})
	else
		tp:对话事件(tp.当前地图,self.编号)
	end

	--]]
end

function 场景类_假人:更新(dt, x, y)
    if self.显示1 then
        self.假人[self.行为]:更新(dt)
        if self.假人['武器_' .. self.行为] ~= nil then
            self.假人['武器_' .. self.行为]:更新(dt)
        end
        if self.假人[self.行为]:是否选中(x, y) then
            tp.选中假人 = true
        end
        if self.假人[self.行为]:是否选中(x, y) and tp:可操作() and not tp.第一窗口移动中 then
            tp.选中假人 = true
            if mouse(0) and jls(tp.角色坐标, self.坐标) < 250 and self.执行事件 ~= '摆摊' and not self.开启跟随 and self.特效 == nil then
                if
                    not self.静止转移 or self.执行事件 == '明雷活动' or self.执行事件 == '单位' or self.执行事件 == '物件_打铁炉' or
                        self.执行事件 == '打铁炉'
                 then
                    if self.执行事件 == '明雷' then
                        self:事件开始()
                    elseif self.执行事件 == '明雷活动' then
                        self:事件开始()
                    else
                        self:事件开始()
                    end
                end
            end
            if tp.窗口.对话栏.可视 then
                self:事件方向(tp.角色坐标, self.坐标)
            end
        end
        if self.执行事件 == '明雷' then
            if jls(tp.角色坐标, self.坐标) < 25 and 时间 - 触碰延时 >= 1 then
                触碰延时 = 时间
                客户端:发送数据(1004, {地图 = tp.当前地图, 编号 = self.编号, 序列 = self.序列, 标识 = self.标识}, 1)
            end
        elseif self.触发事件 then
            if jls(tp.角色坐标, self.坐标) < 35 then
                if self.触发计次 <= 0 then
                    self:事件开始()
                    self.触发计次 = 25
                else
                    self.触发计次 = self.触发计次 - 1
                end
            end
        end
    end
end

function 场景类_假人:显示(dt, x, y, pys)
    if not self.显示2 then
        return 0
    end
    if self.至尊财神 ~= nil then
        self.至尊财神:更新()
    elseif self.武林圣者 ~= nil then
        self.武林圣者:更新()
    elseif self.狂暴之力 ~= nil then
        self.狂暴之力:更新()
    elseif self.超凡入圣 ~= nil then
        self.超凡入圣:更新()
    elseif self.洞察先机 ~= nil then
        self.洞察先机:更新()
    elseif self.独步青云 ~= nil then
        self.独步青云:更新()
    elseif self.风华绝代 ~= nil then
        self.风华绝代:更新()
    elseif self.风云再起 ~= nil then
        self.风云再起:更新()
    elseif self.盖世无双 ~= nil then
        self.盖世无双:更新()
    elseif self.盖世英豪 ~= nil then
        self.盖世英豪:更新()
    elseif self.九五之尊 ~= nil then
        self.九五之尊:更新()
    elseif self.龙皇 ~= nil then
        self.龙皇:更新()
    elseif self.神豪 ~= nil then
        self.神豪:更新()
    elseif self.战神 ~= nil then
        self.战神:更新()
    elseif self.纵横三界王者风云 ~= nil then
        self.纵横三界王者风云:更新()
    elseif self.甲组冠军 ~= nil then
        self.甲组冠军:更新()
    elseif self.甲组亚军 ~= nil then
        self.甲组亚军:更新()
    elseif self.甲组季军 ~= nil then
        self.甲组季军:更新()
    elseif self.明星冠军 ~= nil then
        self.明星冠军:更新()
    elseif self.明星亚军 ~= nil then
        self.明星亚军:更新()
    elseif self.明星季军 ~= nil then
        self.明星季军:更新()
    elseif self.九天揽月 ~= nil then
        self.九天揽月:更新()
    elseif self.剑指苍穹 ~= nil then
        self.剑指苍穹:更新()
    elseif self.势不可挡 ~= nil then
        self.势不可挡:更新()
    elseif self.王者风范 ~= nil then
        self.王者风范:更新()
    elseif self.黄称谓边框 ~= nil then
        self.黄称谓边框:更新()
    elseif self.梦幻大亨框 ~= nil then
        self.梦幻大亨框:更新()
    elseif self.江湖豪侠框 ~= nil then
        self.江湖豪侠框:更新()
    elseif self.绝世豪侠框 ~= nil then
        self.绝世豪侠框:更新()
    elseif self.富可敌国框 ~= nil then
        self.富可敌国框:更新()
    elseif self.幕神梦幻框 ~= nil then
        self.幕神梦幻框:更新()
    elseif self.窈窕淑女框 ~= nil then
        self.窈窕淑女框:更新()
    end
    self:更新(dt, x, y, pys)
    if jls(tp.角色坐标, self.坐标) < 800 then
        if self.行走时间 ~= nil then
            self.行走时间 = self.行走时间 - 1
            if self.行走时间 <= 0 then
                local 临时目标 = self.初始坐标
                临时目标 = xys(floor(临时目标.x / 20) + random(-6, 6), floor(临时目标.y / 20) + random(-6, 6))
                if 临时目标 ~= nil and self.目标格子[1] == nil then
                    local a = xys(floor(self.坐标.x / 20), floor(self.坐标.y / 20))
                    self.目标格子 = tp.场景.地图.寻路:寻路(a, 临时目标)
                    self:取目标()
                    self.移动 = true
                end
                self.行走时间 = 250 + random(-20, 10)
            end
        end
        if tp.窗口.对话栏.可视 == false and self.方向 ~= self.记忆方向 and (self.执行事件 ~= '明雷怪' and not self.行走开关) then
            self:置方向(self.记忆方向)
        end
        local s = xys(floor(self.真实坐标.x), floor(self.真实坐标.y))
        tp.影子:显示(s + pys)
        self.假人[self.行为]:显示(s + pys)
        if
            self.名称 == '右统领' or self.名称 == '李将军' or self.名称 == '杜少海' or self.名称 == '李捕头' or self.名称 == '左统领' or
                self.名称 == '王副将'
         then
            tp.任务图标:显示(s.x + pys.x - 10, s.y + pys.y - 80)
        end
        if self.假人['武器_' .. self.行为] ~= nil then
            self.假人['武器_' .. self.行为]:显示(s + pys)
        end
        local 名称颜色 = 0xFFFFFF00
        local 称谓颜色 = 0xFFFF0000
        if self.假人[self.行为]:是否选中(x, y) and tp:可操作() and not tp.第一窗口移动中 then
            self.假人[self.行为]:置高亮()
            if self.假人['武器_' .. self.行为] ~= nil then
                self.假人['武器_' .. self.行为]:置高亮()
            end
            名称颜色 = 0xFFFFFF00
            称谓颜色 = 0xFF0000FF
        else
            self.假人[self.行为]:取消高亮()
            if self.假人['武器_' .. self.行为] ~= nil then
                self.假人['武器_' .. self.行为]:取消高亮()
            end
        end
        if self.称谓 == nil then
            rwzt:置颜色(名称颜色)
            rwzt:显示x(s + pys - self.名称偏移, self.名称)
            rwzt:置阴影颜色(-1275068416)
        else
            rwzt:置颜色(称谓颜色)
            if self.称谓 == '至尊财神' then
                self.称谓偏移 = xys(tp.字体表.人物字体:取宽度(self.称谓) / 2 + 65, 20)
                self.名称偏移 = xys(tp.字体表.人物字体:取宽度(self.名称) / 2, -50)
                self.至尊财神:显示(s + pys - self.称谓偏移)
            elseif self.称谓 == '狂暴之力' then
                self.称谓偏移 = xys(tp.字体表.人物字体:取宽度(self.称谓) / 2 + 115, 20)
                self.名称偏移 = xys(tp.字体表.人物字体:取宽度(self.名称) / 2, -35)
                self.狂暴之力:显示(s + pys - self.称谓偏移)
            elseif self.称谓 == '武林圣者' then
                self.称谓偏移 = xys(tp.字体表.人物字体:取宽度(self.称谓) / 2 + 65, 20)
                self.名称偏移 = xys(tp.字体表.人物字体:取宽度(self.名称) / 2, -35)
                self.武林圣者:显示(s + pys - self.称谓偏移)
            elseif self.称谓 == '超凡入圣' and self.超凡入圣 ~= nil then
                self.称谓偏移 = 生成XY(tp.字体表.人物字体:取宽度(self.称谓) / 2 + 52, 0)
                self.名称偏移 = xys(tp.字体表.人物字体:取宽度(self.名称) / 2, -35)
                self.超凡入圣:显示(s + pys - self.称谓偏移)
            elseif self.称谓 == '洞察先机' and self.洞察先机 ~= nil then
                self.称谓偏移 = 生成XY(tp.字体表.人物字体:取宽度(self.称谓) / 2 - 30, -50)
                self.名称偏移 = xys(tp.字体表.人物字体:取宽度(self.名称) / 2, -55)
                self.洞察先机:显示(s + pys - self.称谓偏移)
            elseif self.称谓 == '独步青云' and self.独步青云 ~= nil then
                self.称谓偏移 = 生成XY(tp.字体表.人物字体:取宽度(self.称谓) / 2 - 30, -50)
                self.名称偏移 = xys(tp.字体表.人物字体:取宽度(self.名称) / 2, -55)
                self.独步青云:显示(s + pys - self.称谓偏移)
            elseif self.称谓 == '风华绝代' and self.风华绝代 ~= nil then
                self.称谓偏移 = 生成XY(tp.字体表.人物字体:取宽度(self.称谓) / 2 - 30, -40)
                self.名称偏移 = xys(tp.字体表.人物字体:取宽度(self.名称) / 2, -55)
                self.风华绝代:显示(s + pys - self.称谓偏移)
            elseif self.称谓 == '风云再起' and self.风云再起 ~= nil then
                self.称谓偏移 = 生成XY(tp.字体表.人物字体:取宽度(self.称谓) / 2 - 30, -40)
                self.名称偏移 = xys(tp.字体表.人物字体:取宽度(self.名称) / 2, -45)
                self.风云再起:显示(s + pys - self.称谓偏移)
            elseif self.称谓 == '盖世无双' and self.盖世无双 ~= nil then
                self.称谓偏移 = 生成XY(tp.字体表.人物字体:取宽度(self.称谓) / 2 - 30, -50)
                self.名称偏移 = xys(tp.字体表.人物字体:取宽度(self.名称) / 2, -55)
                self.盖世无双:显示(s + pys - self.称谓偏移)
            elseif self.称谓 == '盖世英豪' and self.盖世英豪 ~= nil then
                self.称谓偏移 = 生成XY(tp.字体表.人物字体:取宽度(self.称谓) / 2 - 30, -70)
                self.名称偏移 = xys(tp.字体表.人物字体:取宽度(self.名称) / 2, -75)
                self.盖世英豪:显示(s + pys - self.称谓偏移)
            elseif self.称谓 == '九五之尊' and self.九五之尊 ~= nil then
                self.称谓偏移 = 生成XY(tp.字体表.人物字体:取宽度(self.称谓) / 2 - 30, -80)
                self.名称偏移 = xys(tp.字体表.人物字体:取宽度(self.名称) / 2, -85)
                self.九五之尊:显示(s + pys - self.称谓偏移)
            elseif self.称谓 == '龙皇' and self.龙皇 ~= nil then
                self.称谓偏移 = 生成XY(tp.字体表.人物字体:取宽度(self.称谓) / 2 - 20, -55)
                self.名称偏移 = xys(tp.字体表.人物字体:取宽度(self.名称) / 2, -60)
                self.龙皇:显示(s + pys - self.称谓偏移)
            elseif self.称谓 == '神豪' and self.神豪 ~= nil then
                self.称谓偏移 = 生成XY(tp.字体表.人物字体:取宽度(self.称谓) / 2 - 20, -60)
                self.名称偏移 = xys(tp.字体表.人物字体:取宽度(self.名称) / 2, -65)
                self.神豪:显示(s + pys - self.称谓偏移)
            elseif self.称谓 == '战神' and self.战神 ~= nil then
                self.称谓偏移 = 生成XY(tp.字体表.人物字体:取宽度(self.称谓) / 2 - 20, -55)
                self.名称偏移 = xys(tp.字体表.人物字体:取宽度(self.名称) / 2, -60)
                self.战神:显示(s + pys - self.称谓偏移)
            elseif self.称谓 == '纵横三界王者风云' and self.纵横三界王者风云 ~= nil then
                self.称谓偏移 = 生成XY(tp.字体表.人物字体:取宽度(self.称谓) / 2 - 75, -70)
                self.名称偏移 = xys(tp.字体表.人物字体:取宽度(self.名称) / 2, -75)
                self.纵横三界王者风云:显示(s + pys - self.称谓偏移)
            elseif self.称谓 == '武神坛甲组冠军' and self.甲组冠军 ~= nil then
                self.称谓偏移 = 生成XY(tp.字体表.人物字体:取宽度(self.称谓) / 2 - 50, -25)
                self.名称偏移 = xys(tp.字体表.人物字体:取宽度(self.名称) / 2, -60)
                self.甲组冠军:显示(s + pys - self.称谓偏移)
            elseif self.称谓 == '武神坛甲组亚军' and self.甲组亚军 ~= nil then
                self.称谓偏移 = 生成XY(tp.字体表.人物字体:取宽度(self.称谓) / 2 - 50, -25)
                self.名称偏移 = xys(tp.字体表.人物字体:取宽度(self.名称) / 2, -60)
                self.甲组亚军:显示(s + pys - self.称谓偏移)
            elseif self.称谓 == '武神坛甲组季军' and self.甲组季军 ~= nil then
                self.称谓偏移 = 生成XY(tp.字体表.人物字体:取宽度(self.称谓) / 2 - 50, -25)
                self.名称偏移 = xys(tp.字体表.人物字体:取宽度(self.名称) / 2, -60)
                self.甲组季军:显示(s + pys - self.称谓偏移)
            elseif self.称谓 == '武神坛明星冠军' and self.明星冠军 ~= nil then
                self.称谓偏移 = 生成XY(tp.字体表.人物字体:取宽度(self.称谓) / 2 - 50, -25)
                self.名称偏移 = xys(tp.字体表.人物字体:取宽度(self.名称) / 2, -60)
                self.明星冠军:显示(s + pys - self.称谓偏移)
            elseif self.称谓 == '武神坛明星亚军' and self.明星亚军 ~= nil then
                self.称谓偏移 = 生成XY(tp.字体表.人物字体:取宽度(self.称谓) / 2 - 50, -25)
                self.名称偏移 = xys(tp.字体表.人物字体:取宽度(self.名称) / 2, -60)
                self.明星亚军:显示(s + pys - self.称谓偏移)
            elseif self.称谓 == '武神坛明星季军' and self.明星季军 ~= nil then
                self.称谓偏移 = 生成XY(tp.字体表.人物字体:取宽度(self.称谓) / 2 - 50, -25)
                self.名称偏移 = xys(tp.字体表.人物字体:取宽度(self.名称) / 2, -60)
                self.明星季军:显示(s + pys - self.称谓偏移)
            elseif self.称谓 == '九天揽月' and self.九天揽月 ~= nil then
                self.称谓偏移 = 生成XY(tp.字体表.人物字体:取宽度(self.称谓) / 2 + 60, 30)
                --    self.名称偏移 = xys(tp.字体表.人物字体:取宽度(self.名称) / 2,-60)
                self.九天揽月:显示(s + pys - self.称谓偏移)
            elseif self.称谓 == '剑指苍穹' and self.剑指苍穹 ~= nil then
                self.称谓偏移 = 生成XY(tp.字体表.人物字体:取宽度(self.称谓) / 2 + 60, 30)
                --    self.名称偏移 = xys(tp.字体表.人物字体:取宽度(self.名称) / 2,-60)
                self.剑指苍穹:显示(s + pys - self.称谓偏移)
            elseif self.称谓 == '势不可挡' and self.势不可挡 ~= nil then
                self.称谓偏移 = 生成XY(tp.字体表.人物字体:取宽度(self.称谓) / 2 + 60, 40)
                --    self.名称偏移 = xys(tp.字体表.人物字体:取宽度(self.名称) / 2,-60)
                self.势不可挡:显示(s + pys - self.称谓偏移)
            elseif self.称谓 == '王者风范' and self.王者风范 ~= nil then
                self.称谓偏移 = 生成XY(tp.字体表.人物字体:取宽度(self.称谓) / 2 + 65, 60)
                --    self.名称偏移 = xys(tp.字体表.人物字体:取宽度(self.名称) / 2,-60)
                self.王者风范:显示(s + pys - self.称谓偏移)
            elseif self.称谓 == '只手遮天' and self.黄称谓边框 ~= nil then
                --    self.名称偏移 = xys(tp.字体表.人物字体:取宽度(self.名称) / 2,-60)
                self.黄称谓边框:显示(s + pys - self.称谓偏移)
                self.称谓偏移 = 生成XY(tp.字体表.人物字体:取宽度(self.称谓) / 2 + 25, -35)
                人物字体:显示x(s + pys - 生成XY(tp.字体表.人物字体:取宽度(self.称谓) / 2, -15), self.称谓)
            elseif self.称谓 == '降龙伏虎' and self.黄称谓边框 ~= nil then
                --    self.名称偏移 = xys(tp.字体表.人物字体:取宽度(self.名称) / 2,-60)
                self.黄称谓边框:显示(s + pys - self.称谓偏移)
                self.称谓偏移 = 生成XY(tp.字体表.人物字体:取宽度(self.称谓) / 2 + 25, -35)
                人物字体:显示x(s + pys - 生成XY(tp.字体表.人物字体:取宽度(self.称谓) / 2, -10), self.称谓)
            elseif self.称谓 == '威震四方' and self.梦幻大亨框 ~= nil then
                self.梦幻大亨框:显示(s + pys - self.称谓偏移)
                self.称谓偏移 = 生成XY(tp.字体表.人物字体:取宽度(self.称谓) / 2 + 25, -35)
                人物字体:显示x(s + pys - 生成XY(tp.字体表.人物字体:取宽度(self.称谓) / 2, -15), self.称谓)
            elseif self.称谓 == '江湖豪侠' and self.江湖豪侠框 ~= nil then
                --    self.名称偏移 = xys(tp.字体表.人物字体:取宽度(self.名称) / 2,-60)
                self.江湖豪侠框:显示(s + pys - self.称谓偏移)
                self.称谓偏移 = 生成XY(tp.字体表.人物字体:取宽度(self.称谓) / 2 + 25, -35)
                人物字体:显示x(s + pys - 生成XY(tp.字体表.人物字体:取宽度(self.称谓) / 2, -15), self.称谓)
            elseif self.称谓 == '绝世豪侠' and self.绝世豪侠框 ~= nil then
                --    self.名称偏移 = xys(tp.字体表.人物字体:取宽度(self.名称) / 2,-60)
                self.绝世豪侠框:显示(s + pys - self.称谓偏移)
                self.称谓偏移 = 生成XY(tp.字体表.人物字体:取宽度(self.称谓) / 2 + 25, -35)
                人物字体:显示x(s + pys - 生成XY(tp.字体表.人物字体:取宽度(self.称谓) / 2, -15), self.称谓)
            elseif self.称谓 == '富可敌国' and self.富可敌国框 ~= nil then
                --    self.名称偏移 = xys(tp.字体表.人物字体:取宽度(self.名称) / 2,-60)
                self.富可敌国框:显示(s + pys - self.称谓偏移)
                self.称谓偏移 = 生成XY(tp.字体表.人物字体:取宽度(self.称谓) / 2 + 25, -35)
                人物字体:显示x(s + pys - 生成XY(tp.字体表.人物字体:取宽度(self.称谓) / 2, -15), self.称谓)
            elseif self.称谓 == '幕神梦幻' and self.幕神梦幻框 ~= nil then
                --    self.名称偏移 = xys(tp.字体表.人物字体:取宽度(self.名称) / 2,-60)
                self.幕神梦幻框:显示(s + pys - self.称谓偏移)
                self.称谓偏移 = 生成XY(tp.字体表.人物字体:取宽度(self.称谓) / 2 + 25, -35)
                人物字体:显示x(s + pys - 生成XY(tp.字体表.人物字体:取宽度(self.称谓) / 2, -15), self.称谓)
            elseif self.称谓 == '窈窕淑女' and self.窈窕淑女框 ~= nil then
                self.窈窕淑女框:显示(s + pys - self.称谓偏移)
                self.称谓偏移 = 生成XY(tp.字体表.人物字体:取宽度(self.称谓) / 2 + 25, -35)
                人物字体:显示x(s + pys - 生成XY(tp.字体表.人物字体:取宽度(self.称谓) / 2, -15), self.称谓)
            else
                rwzt:显示x(s + pys - self.称谓偏移, self.称谓)
            end
            rwzt:置阴影颜色(-1275068416)
            rwzt:置颜色(名称颜色)
            rwzt:显示x(s + pys - self.名称偏移, self.名称)
            rwzt:置阴影颜色(-1275068416)
        end
        if self.移动 then
            self:开始移动(dt)
        end
        if self.特效 ~= nil then
            self.特效:更新(dt * self.帧率)
            if (self.特效.已载入 >= self.特效.结束帧) then
                self.特效 = nil
                return false
            end
            self.特效:显示(s + pys)
        end
        self.坐标.x = s.x
        self.坐标.y = s.y
        self.显示1 = true
    else
        self.显示1 = false
    end
    -- self.喊话:显示(s.x + pys.x,s.y + pys.y,dt,x,y)
end

function 场景类_假人:置方向(d)
    if self.假人['静立'].方向数 < 4 then
        return false
    end
    if self.假人['行走'] ~= nil then
        self.假人['行走']:置方向(d)
    end
    self.假人['静立']:置方向(d)
    if self.假人['武器_静立'] ~= nil then
        self.假人['武器_静立']:置方向(d)
        self.假人['武器_行走']:置方向(d)
    end
    self.方向 = d
end

function 场景类_假人:PB置武器(假人, 饰品)
    if 饰品 == nil then
        local 资源 = qmxs(假人.model, tp:取武器子类(假人.weaponChildType))
        self.假人['静立'] = nil
        self.假人['行走'] = nil
        self.假人['静立'] = tp.资源:载入(资源[3], '网易假人动画', 资源[1])
        self.假人['行走'] = tp.资源:载入(资源[3], '网易假人动画', 资源[2])
        if 假人.锦衣 ~= nil and 假人.锦衣 ~= 0 then
            资源 = qmxs(假人.dress .. '_' .. 假人.model)
            self.假人 = {['静立'] = tp.资源:载入(资源[3], '网易假人动画', 资源[1]), ['行走'] = tp.资源:载入(资源[3], '网易假人动画', 资源[2])}
        -- end
        end
    end
    local n
    if 饰品 then
        n = qmxs('武器_' .. 假人.model)
    else
        if gbk.len(假人.weapon) > 0 then
            local 物品 = 引擎.取物品(假人.weapon)
            local m
            if 物品 ~= nil and 物品[11] ~= nil then
                m = tp:取武器附加名称(物品[4], 物品[5], 假人.weapon)
                n = qmxs(m .. '_' .. 假人.model)
            end
        end
    end
    if n ~= nil and n[3] ~= nil then
        self.假人['武器_静立'] = tp.资源:载入(n[3], '网易假人动画', n[1])
        self.假人['武器_行走'] = tp.资源:载入(n[3], '网易假人动画', n[2])
        if gbk.len(假人.dress) > 0 then
        else
            self.假人['武器_静立']:置差异(self.假人['武器_静立'].帧数 - self.假人['静立'].帧数)
        end
    end
    if 假人.colorW ~= nil and #假人.colorW > 0 then
        self.假人['武器_静立']:置染色(假人.colorW[4], 假人.colorW[1], 假人.colorW[2], 假人.colorW[3])
        self.假人['武器_行走']:置染色(假人.colorW[4], 假人.colorW[1], 假人.colorW[2], 假人.colorW[3])
    end
    if self.假人['行走'] ~= nil and self.假人['武器_行走'] ~= nil then
        if gbk.len(假人.dress) > 0 then
        else
            self.假人['武器_行走']:置差异(self.假人['武器_行走'].帧数 - self.假人['行走'].帧数)
        end
    end
    self:置方向(self.方向)
end

function 场景类_假人:置武器(假人, 饰品)
    if 饰品 == nil then
        local 资源 = qmxs(假人.模型, tp:取武器子类(假人.武器子类))
        self.假人['静立'] = nil
        self.假人['行走'] = nil
        self.假人['静立'] = tp.资源:载入(资源[3], '网易假人动画', 资源[1])
        self.假人['行走'] = tp.资源:载入(资源[3], '网易假人动画', 资源[2])
        if 假人.锦衣 ~= nil and 假人.锦衣 ~= 0 then
            -- if 假人.锦衣 == "夜影" or 假人.锦衣 == "夏日清凉" or 假人.锦衣 == "华风汉雅" or 假人.锦衣 == "萌萌小厨" then
            -- 		临时资源 = qzdjy(假人.模型.."_静立_"..假人.锦衣)
            -- 		临时资源1 = qzdjy(假人.模型.."_行走_"..假人.锦衣)
            -- 		临时资源包 = "shape0.npk"
            -- 		if 假人.锦衣 == "华风汉雅" or 假人.锦衣 == "萌萌小厨" then
            -- 			临时资源包 = "shape2.npk"
            -- 		end
            -- 		self.假人 = {["静立"] = tp.资源:载入(临时资源包,"网易锦衣动画",临时资源),["行走"] = tp.资源:载入(临时资源包,"网易锦衣动画",临时资源1)}
            -- 		if 假人.锦衣 == "夏日清凉" or 假人.锦衣 == "华风汉雅" or 假人.锦衣 == "萌萌小厨" then
            -- 			临时资源 = qzdjys(假人.模型.."_静立_"..假人.锦衣.."_头")
            -- 			临时资源1 = qzdjys(假人.模型.."_行走_"..假人.锦衣.."_头")
            -- 			self.假人["身体_静立"] = tp.资源:载入("shape0.npk","网易锦衣动画",临时资源)
            -- 			self.假人["身体_行走"] = tp.资源:载入("shape0.npk","网易锦衣动画",临时资源1)
            -- 		end
            -- 	else
            资源 = qmxs(假人.锦衣 .. '_' .. 假人.模型)
            self.假人 = {['静立'] = tp.资源:载入(资源[3], '网易假人动画', 资源[1]), ['行走'] = tp.资源:载入(资源[3], '网易假人动画', 资源[2])}
        -- end
        end
    end
    local n
    if 饰品 then
        n = qmxs('武器_' .. 假人.模型)
    else
        if 假人.武器 ~= nil then
            local 物品 = 引擎.取物品(假人.武器)
            local m
            if 物品 ~= nil and 物品[11] ~= nil then
                m = tp:取武器附加名称(物品[4], 物品[5], 假人.武器)
                n = qmxs(m .. '_' .. 假人.模型)
            end
        end
    end
    if n ~= nil and n[3] ~= nil then
        self.假人['武器_静立'] = tp.资源:载入(n[3], '网易假人动画', n[1])
        self.假人['武器_行走'] = tp.资源:载入(n[3], '网易假人动画', n[2])
        if 假人.锦衣 ~= nil and 假人.锦衣 ~= 0 then
        else
            self.假人['武器_静立']:置差异(self.假人['武器_静立'].帧数 - self.假人['静立'].帧数)
        end
    end
    if 假人.武器染色方案 ~= 0 and 假人.武器染色组 ~= 0 and 假人.武器染色组 ~= nil and #假人.武器染色组 > 0 then
        self.假人['武器_静立']:置染色(假人.武器染色方案, 假人.武器染色组[1], 假人.武器染色组[2], 假人.武器染色组[3])
        self.假人['武器_行走']:置染色(假人.武器染色方案, 假人.武器染色组[1], 假人.武器染色组[2], 假人.武器染色组[3])
    end
    if self.假人['行走'] ~= nil and self.假人['武器_行走'] ~= nil then
        if 假人.锦衣 ~= nil and 假人.锦衣 ~= 0 then
        else
            self.假人['武器_行走']:置差异(self.假人['武器_行走'].帧数 - self.假人['行走'].帧数)
        end
    end
    self:置方向(self.方向)
end

function 场景类_假人:置染色(染色方案, a, b, c)
    self.假人['静立']:置染色(染色方案, a, b, c)
    if self.假人['行走'] ~= nil then
        self.假人['行走']:置染色(染色方案, a, b, c)
    end
    self:置方向(self.方向)
end
function 场景类_假人:事件方向(a, b)
    if 取两点角度(b, a) ~= nil and 取八方向(floor(取两点角度(b, a))) ~= nil then
        if self.方向开关 then
            self:置方向(取八方向(floor(取两点角度(b, a))))
            tp.场景.人物:置方向(取八方向(floor(取两点角度(a, b))))
        else
            self:置方向(取四方向(floor(取两点角度(b, a))))
            tp.场景.人物:置方向(取八方向(floor(取两点角度(a, b))))
        end
    end
end

return 场景类_假人
