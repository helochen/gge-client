--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2021-04-29 17:55:47
-- 梦幻西游游戏资源破解 baidwwy@vip.qq.com(313738139) 老毕   和 C++PrimerPlus 717535046 这俩位大神破解所以资源
--======================================================================--
local 场景类_人物 = class()
local pi = math.pi / 8
local floor = math.floor
local ceil = math.ceil
local insert = table.insert
local remove = table.remove
local min = math.min
local random = 引擎.取随机整数
local xys = 生成XY
local mtb = 取八方向
local jlb = 取两点距离
local yds = 取移动坐标
local jdb = 取两点角度
local tp = 引擎.场景
local tpc = 引擎.场景.场景
local hds = 取两点孤度
local ARGB = ARGB
local qmxs = 引擎.取模型
local mouses = 引擎.鼠标按住
local mousea = 引擎.鼠标弹起
local mousax = 引擎.鼠标按下
local jcs = 0
local ems = 引擎.取敌人信息
local emj = 引擎.取等级怪
local zqj = 引擎.坐骑库
local tszq = 引擎.新增坐骑
local xrk = 引擎.祥瑞库
local bzs = 取四至八方向
local 坐骑补差x, 坐骑补差y = 0, 0
local 光环补差x, 光环补差y = 0, 0
local qzdjy = 引擎.取锦衣模型
local qzdjys = 取锦衣身体模型
local 临时资源
local 临时资源1
local 临时资源包
local 开关 = true
function 场景类_人物:初始化()
    self.人物模型 = tp.队伍[1].模型
    local 资源 = qmxs(tp.队伍[1].模型)
    -- 资源 = qmxs("大海龟")
    self.人物 = {['静立'] = tp.资源:载入(资源[3], '网易WDF动画', 资源[1]), ['行走'] = tp.资源:载入(资源[3], '网易WDF动画', 资源[2])}
    self.id = tp.队伍[1].数字id
    self.特效组 = {}
    self.队伍令牌 = false
    self.行为 = '静立'
    self.方向 = 4
    self.移动 = false
    self.目标格子 = {}
    self.名称偏移 = xys(tp.字体表.人物字体:取宽度(tp.队伍[1].名称) / 2, -15)
    self.称谓宽度 = 0
    self:置模型()
    self.鼠标点击动画组 = {}
    self.标识 = true
    self.坐标 = xys()
    self.类型 = '主角'
    self.x, self.y = tp.角色坐标.x, tp.角色坐标.y
    self.增加 = {x = 0, y = 0}
    self.延时 = 0
    self.标识 = true
    self.称谓特效 = true
    self.足迹特效 = true
    self.光环特效 = true
    self.锦衣特效 = true
    self.移动计时 = os.time()
    self.队伍令牌 = tp.资源:载入('addon.wdf', '网易WDF动画', 0x9259D354) --454C39FB  2843A984 474F2EE1 9259D354
    self.战斗动画 = tp.资源:载入('addon.wdf', '网易WDF动画', 0x97C79EDB)
    if tp.当前称谓 ~= nil and tp.当前称谓 ~= '' then
        if tp.当前称谓 == '至尊财神' then
            self.至尊财神 = tp.资源:载入('wzife.wd5', '网易假人动画', 0x01000051)
        elseif tp.当前称谓 == '狂暴之力' then
            self.狂暴之力 = tp.资源:载入('wzife.wd5', '网易假人动画', 0x01000074)
        elseif tp.当前称谓 == '武林圣者' then
            self.武林圣者 = tp.资源:载入('wzife.wd5', '网易假人动画', 0x01000076)
        elseif tp.当前称谓 == '超凡入圣' then
            self.超凡入圣 = tp.资源:载入('wzife.wd5', '网易假人动画', 0x01000087)
        elseif tp.当前称谓 == '洞察先机' then
            self.洞察先机 = pwd('39')
        elseif tp.当前称谓 == '独步青云' then
            self.独步青云 = pwd('40')
        elseif tp.当前称谓 == '风华绝代' then
            self.风华绝代 = pwd('41')
        elseif tp.当前称谓 == '风云再起' then
            self.风云再起 = pwd('42')
        elseif tp.当前称谓 == '盖世无双' then
            self.盖世无双 = pwd('43')
        elseif tp.当前称谓 == '盖世英豪' then
            self.盖世英豪 = pwd('44')
        elseif tp.当前称谓 == '九五之尊' then
            self.九五之尊 = pwd('45')
        elseif tp.当前称谓 == '龙皇' then
            self.龙皇 = pwd('46')
        elseif tp.当前称谓 == '神豪' then
            self.神豪 = pwd('47')
        elseif tp.当前称谓 == '战神' then
            self.战神 = pwd('48')
        elseif tp.当前称谓 == '纵横三界王者风云' then
            self.纵横三界王者风云 = pwd('49')
        elseif tp.当前称谓 == '武神坛甲组冠军' then
            self.甲组冠军 = tp.资源:载入('xzsc.wdf', '网易WDF动画', 0xC4A082C0)
        elseif tp.当前称谓 == '武神坛甲组亚军' then
            self.甲组亚军 = tp.资源:载入('xzsc.wdf', '网易WDF动画', 0xE7706EE2)
        elseif tp.当前称谓 == '武神坛甲组季军' then
            self.甲组季军 = tp.资源:载入('xzsc.wdf', '网易WDF动画', 0x6336F8B3)
        elseif tp.当前称谓 == '武神坛明星冠军' then
            self.明星冠军 = tp.资源:载入('xzsc.wdf', '网易WDF动画', 0xEB07CCCD)
        elseif tp.当前称谓 == '武神坛明星亚军' then
            self.明星亚军 = tp.资源:载入('xzsc.wdf', '网易WDF动画', 0x550B771D)
        elseif tp.当前称谓 == '武神坛明星季军' then
            self.明星季军 = tp.资源:载入('xzsc.wdf', '网易WDF动画', 0x69E88E4D)
        elseif tp.当前称谓 == '九天揽月' then
            self.九天揽月 = tp.资源:载入('xzsc.wdf', '网易WDF动画', 0xAAFEC211)
        elseif tp.当前称谓 == '剑指苍穹' then
            self.剑指苍穹 = tp.资源:载入('xzsc.wdf', '网易WDF动画', 0xFFAE13EE)
        elseif tp.当前称谓 == '势不可挡' then
            self.势不可挡 = tp.资源:载入('xzsc.wdf', '网易WDF动画', 0xBEBEAE78)
        elseif tp.当前称谓 == '王者风范' then
            self.王者风范 = tp.资源:载入('xzsc.wdf', '网易WDF动画', 0xCEAA7B7A)
        elseif tp.当前称谓 == '绝世豪侠' then
            self.绝世豪侠框 = tp.资源:载入('xzsc.wdf', '网易WDF动画', 0xF15069E9)
        elseif tp.当前称谓 == '江湖豪侠' then
            self.江湖豪侠框 = tp.资源:载入('xzsc.wdf', '网易WDF动画', 0xF15069E9)
        elseif tp.当前称谓 == '威震四方' then
            self.梦幻大亨框 = tp.资源:载入('xzsc.wdf', '网易WDF动画', 0x0975DF49)
        elseif tp.当前称谓 == '只手遮天' then
            self.黄称谓边框 = tp.资源:载入('xzsc.wdf', '网易WDF动画', 0xD7EA9DC8)
        elseif tp.当前称谓 == '降龙伏虎' then
            self.黄称谓边框 = tp.资源:载入('xzsc.wdf', '网易WDF动画', 0xD7EA9DC8)
        elseif tp.当前称谓 == '富可敌国' then
            self.富可敌国框 = tp.资源:载入('xzsc.wdf', '网易WDF动画', 0x21F08540)
        elseif tp.当前称谓 == '幕神梦幻' then
            self.幕神梦幻框 = tp.资源:载入('xzsc.wdf', '网易WDF动画', 0x21F08540)
        elseif tp.当前称谓 == '窈窕淑女' then
            self.窈窕淑女框 = tp.资源:载入('xzsc.wdf', '网易WDF动画', 0x800F661C)
        end
    end
    -- self.king=tp.资源:载入('commonm/effect.wd1',"网易WDF动画",0x466AA302)
    人物字体 = tp.字体表.人物字体
    tp.坐骑列表 = tp.队伍[1].坐骑列表
    tp.坐骑 = table.loadstring(table.tostring(tp.队伍[1].坐骑))
    if tp.坐骑 ~= nil then
        self:坐骑改变(tp.队伍[1].模型, tp.队伍[1].坐骑, tp.队伍[1].坐骑饰品)
    end
end
function 场景类_人物:取目标(xy)
    if self.目标格子[1] == nil then
        return
    end
    tp.场景.地图.增加.z = 2.5
    zd = xys(floor(self.目标格子[1].x * 20), floor(self.目标格子[1].y * 20))
end

function 场景类_人物:取跟随坐标(i)
    return xys(floor(tp.角色坐标.x), floor(tp.角色坐标.y) - i - 1)
end

function 场景类_人物:开始移动(pys)
    if self.目标格子 == nil or self.目标格子[1] == nil then
        self:停止移动(1)
        if tp.角色坐标 ~= nil then
        end
        return
    end
    self.行为 = '行走'
    local dsa = mtb(jdb(tp.角色坐标, zd))
    if tp.队伍[1].变身[1] then
        dsa = bzs(dsa)
    end
    if jlb(tp.角色坐标, {x = self.目标格子[#self.目标格子].x * 20, y = self.目标格子[#self.目标格子].y * 20}) <= self.移动距离 then
        self:停止移动(2)
        return
    end
    if jlb(tp.角色坐标, zd) <= 2 then -- 小于可移动点直接到达位置
        if #self.目标格子 == 1 then
            self:停止移动(3)
            return
        end
        self.目标格子 = tp.场景.地图.寻路:寻路1(self.目标格子)
        tp.场景.跟随坐标 = {self.目标格子}
        if self.目标格子 == nil or self.目标格子[1] == nil then
            return
        end
        self:取目标(self.目标格子[1])
    end
    if tp.坐骑速度 ~= nil then
        local 移动速度 = tp.坐骑速度 / 100 * 3
        tp.角色坐标 = yds(tp.角色坐标, zd, 3 + 移动速度)
    else
        tp.角色坐标 = yds(tp.角色坐标, zd, 3)
    end
    self.x, self.y = tp.角色坐标.x, tp.角色坐标.y
    if 系统参数.时间 - self.移动计时 >= 1 then
        self.移动计时 = os.time()
        if 开发调试 then
            local pb_data = {
                x = tp.角色坐标.x,
                y = tp.角色坐标.y,
                fx = math.floor(tp.角色坐标.x),
                fy = math.floor(tp.角色坐标.y),
                stop = false
            }
            客户端:发送PB数据(3000, pb_data)
        else
            客户端:发送数据(1002, {x = math.floor(tp.角色坐标.x), y = math.floor(tp.角色坐标.y)}, 1)
        end
    end
    self:置方向(dsa)
end

function 场景类_人物:停止移动(原因)
    if tp.角色坐标 ~= nil then
        if 开发调试 then
            local pb_data = {
                x = tp.角色坐标.x,
                y = tp.角色坐标.y,
                fx = math.floor(tp.角色坐标.x),
                fy = math.floor(tp.角色坐标.y),
                stop = true
            }
            客户端:发送PB数据(3000, pb_data)
        else
            发送数据(1002.1, {x = math.floor(tp.角色坐标.x), y = math.floor(tp.角色坐标.y)})
        end
    end
    self.目标格子 = {}
    self.行为 = '静立'
    self.移动 = false
    tpc.地图.增加.z = 1
    zd = nil
    tp.窗口.小地图:清空()
end
function 场景类_人物:更新(dt, x, y)
end

function 场景类_人物:显示(dt, x, y, pys)
    local gl天 = os.date('%w')
    local gl天2 = '0'
    if gl天 == '1' then
        gl天 = '一 (又是新的一星期)'
    elseif gl天 == '2' then
        gl天 = '二'
    elseif gl天 == '3' then
        gl天 = '三'
    elseif gl天 == '4' then
        gl天 = '四'
    elseif gl天 == '5' then
        gl天 = '五 - (明天周六，今晚通宵肝！)'
    elseif gl天 == '6' then
        gl天 = '六 - (假期请注意休息!)'
    elseif gl天 == '7' or gl天 == '0' then
        gl天 = '天 - (假期请注意休息!)'
    end
    if 开发调试 == false then
        引擎.置标题(
            全局游戏标题 ..
                ' - ' .. tp.队伍[1].名称 .. '  [ID:' .. tp.队伍[1].数字id .. '] ' .. os.date(' %Y年%m月%d日 %H:%M:%S 星期') .. gl天
        ) --.."  [ID:"..tp.队伍[1].数字id.."] "  --修改id显示
    end
    self:更新(dt, x, y, pys)
    人物点击 = false
    if self.隐藏 then
        return
    end
    self.队伍令牌:更新()
    self.战斗动画:更新()
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
    local asa = 1
    if self.行为 == '行走' then
        asa = 1
    end
    self.人物[self.行为]:更新(dt * asa)
    if self.人物['武器_' .. self.行为] ~= nil then
        self.人物['武器_' .. self.行为]:更新(dt * asa)
    end
    if self.人物['坐骑_' .. self.行为] ~= nil then
        self.人物['坐骑_' .. self.行为]:更新(dt * asa)
        if self.人物['坐骑饰品_' .. self.行为] ~= nil then
            self.人物['坐骑饰品_' .. self.行为]:更新(dt * asa)
        end
    end
    if self.人物['身体_' .. self.行为] ~= nil then
        self.人物['身体_' .. self.行为]:更新(dt * asa)
    end
    if self.人物['光环_' .. self.行为] ~= nil then
        self.人物['光环_' .. self.行为]:更新(dt * asa)
    end
    if self.人物['足迹_' .. self.行为] ~= nil then
        self.人物['足迹_' .. self.行为]:更新(dt * asa)
    end
    if self.人物['翅膀_' .. self.行为] ~= nil then
        self.人物['翅膀_' .. self.行为]:更新(dt * asa)
    end
    local 名称颜色 = 0xFF00FF00
    local 称谓颜色 = 0xFFFF0000

    if tp.强p开关 ~= nil or tp.队伍[1].名称 == '游戏管理员' then
        名称颜色 = 红色
    elseif tp.pk开关 ~= nil then
        名称颜色 = 黄色
    end
    local yx = false
    if self.人物['武器_' .. self.行为] ~= nil and self.人物['武器_' .. self.行为]:是否选中(x, y) then
        yx = true
    elseif self.人物['坐骑_' .. self.行为] ~= nil and self.人物['坐骑_' .. self.行为]:是否选中(x, y) then
        yx = true
    elseif self.人物['坐骑饰品_' .. self.行为] ~= nil and self.人物['坐骑饰品_' .. self.行为]:是否选中(x, y) then
        yx = true
    end
    if (self.人物[self.行为]:是否选中(x, y) or yx) and tp:可操作() and not tp.第一窗口移动中 then
        if self.人物['武器_' .. self.行为] ~= nil then
            self.人物['武器_' .. self.行为]:置高亮()
        elseif self.人物['坐骑_' .. self.行为] ~= nil then
            self.人物['坐骑_' .. self.行为]:置高亮()
            if self.人物['坐骑饰品_' .. self.行为] ~= nil then
                self.人物['坐骑饰品_' .. self.行为]:置高亮()
            end
        end
        if self.人物['光环_' .. self.行为] ~= nil then
            self.人物['光环_' .. self.行为]:置高亮()
        end
        if self.人物['足迹_' .. self.行为] ~= nil then
            self.人物['足迹_' .. self.行为]:置高亮()
        end
        if self.人物['翅膀_' .. self.行为] ~= nil then
            self.人物['翅膀_' .. self.行为]:置高亮()
        end
        -- if self.人物["身体_"..self.行为] ~= nil then
        -- 	self.人物["身体_"..self.行为]:置高亮()
        -- end
        self.人物[self.行为]:置高亮()
        local 名称颜色 = 0xFF00FF00
        local 称谓颜色 = 0xFFFF0000
    else
        if self.人物['武器_' .. self.行为] ~= nil then
            self.人物['武器_' .. self.行为]:取消高亮()
        elseif self.人物['坐骑_' .. self.行为] ~= nil then
            self.人物['坐骑_' .. self.行为]:取消高亮()
            if self.人物['坐骑饰品_' .. self.行为] ~= nil then
                self.人物['坐骑饰品_' .. self.行为]:取消高亮()
            end
        end
        if self.人物['光环_' .. self.行为] ~= nil then
            self.人物['光环_' .. self.行为]:取消高亮()
        end
        if self.人物['足迹_' .. self.行为] ~= nil then
            self.人物['足迹_' .. self.行为]:取消高亮()
        end
        if self.人物['翅膀_' .. self.行为] ~= nil then
            self.人物['翅膀_' .. self.行为]:取消高亮()
        end
        -- if self.人物["身体_"..self.行为] ~= nil then
        -- 	self.人物["身体_"..self.行为]:取消高亮()
        -- end
        self.人物[self.行为]:取消高亮()
    end
    if tp.当前称谓 ~= '' and tp.当前称谓 ~= '无称谓' and tp.当前称谓 ~= nil then
        if self.名称偏移.y ~= -35 then
            self.名称偏移.y = -35
        end
    else
        if self.名称偏移.y ~= -15 then
            self.名称偏移.y = -15
        end
    end
    if mouses(0) and (self.队长开关 == nil and #tp.队伍数据 >= 1) then
    else
        if self.队长开关 or #tp.队伍数据 == 0 and 摊位名称 == nil then
            if mouses(0) and not tp.选中假人 then
                if self.延时 <= 0 and tp:可通行() then
                    if 全局自动走路开关 == true then
                        全局自动走路开关 = false
                        全局自动走路秒 = 0
                        tp.提示:写入('#Y/自动挂机已关闭!在按住Ctrl + Z 开启自动遇怪.....')
                    end
                    if tp.鼠标.取当前() == '组队' and (self.人物[self.行为]:是否选中(x, y) or yx) then
                        人物点击 = true
                        客户端:发送数据(4002, {id = tp.队伍[1].数字id}, 1)
                        tp.鼠标.还原鼠标()
                    elseif tp.鼠标.取当前() == '普通' then
                        if self.延时 <= 0 then
                            tp.窗口.小地图:清空()
                            local 格子 = xys(floor(x / 20 - pys.x / 20), floor(y / 20 - pys.y / 20))
                            local v = {
                                x = floor(x - pys.x),
                                y = floor(y - pys.y),
                                ani = tp.资源:载入('addon.wdf', '网易WDF动画', 0x0D98AC0A)
                            }
                            insert(self.鼠标点击动画组, v)
                            local 内容 = {x = 格子.x, y = 格子.y, 距离 = 0}
                            self:设置路径(内容)
                            if 开发调试 then
                                local pb_data = {
                                    x = 格子.x,
                                    y = 格子.y,
                                    stop = false
                                }
                                客户端:发送PB数据(3000, pb_data)
                            else
                                客户端:发送数据(1001, 格子, 1)
                            end
                        end
                    end
                end
                鼠标延时2 = 鼠标延时2 + 1
            end
            if mousax(0) or mouses(1) or mouses(2) then
                鼠标延时2 = 0
            end
            if 鼠标延时2 >= 175 and not tp.选中假人 then
                if self.延时 <= 0 and tp:可通行() then
                    if 全局自动走路开关 == true then
                        全局自动走路开关 = false
                        全局自动走路秒 = 0
                        tp.提示:写入('#Y/自动挂机已关闭!在按住Ctrl + Z 开启自动遇怪.....')
                    end
                    tp.窗口.小地图:清空()
                    local 格子 = xys(floor(x / 20 - pys.x / 20), floor(y / 20 - pys.y / 20))
                    self.延时 = 10
                    self.移动 = true
                    local v = {
                        x = floor(x - pys.x),
                        y = floor(y - pys.y),
                        ani = tp.资源:载入('addon.wdf', '网易WDF动画', 0x0D98AC0A)
                        --鼠标点击特效
                    }
                    insert(self.鼠标点击动画组, v)
                    local 内容 = {x = 格子.x, y = 格子.y, 距离 = 0}
                    self:设置路径(内容)
                    if 开发调试 then
                        local pb_data = {
                            x = 格子.x,
                            y = 格子.y,
                            stop = false
                        }
                        客户端:发送PB数据(3000, pb_data)
                    else
                        客户端:发送数据(1001, 格子, 1)
                    end
                end
            end
            if 全局自动走路开关 and not tp.选中假人 and 全局自动走路秒 >= 175 and tp:可通行() and not self.移动 then
                全局自动走路秒 = 0
                local xxQ, yyQ, mmxQ, mmyQ
                mmxQ, mmyQ = floor(tp.场景.地图.宽度 / 20), floor(tp.场景.地图.高度 / 20)
                xxQ = random(3, mmxQ)
                yyQ = random(3, mmyQ)
                tp.窗口.小地图:清空()
                if self.延时 <= 0 and random(1, 10) == 10 then
                    tp.窗口.小地图:清空()
                    local 格子 = xys(xxQ, yyQ)
                    self.延时 = 10
                    self.移动 = true
                    local v = {
                        x = xxQ,
                        y = yyQ,
                        ani = tp.资源:载入('addon.wdf', '网易WDF动画', 0x0D98AC0A)
                    }
                    insert(self.鼠标点击动画组, v)
                    local 内容 = {x = 格子.x, y = 格子.y, 距离 = 0}
                    self:设置路径(内容)
                    if 开发调试 then
                        local pb_data = {
                            x = 格子.x,
                            y = 格子.y,
                            stop = false
                        }
                        客户端:发送PB数据(3000, pb_data)
                    else
                        客户端:发送数据(1001, 格子, 1)
                    end
                end
            end
        end
    end
    if self.延时 > 0 then
        self.延时 = self.延时 - 1
    end
    if not self.行走 and not self.移动 and self.行为 ~= '静立' then
        self.行为 = '静立'
    end
    if not self.移动 and mouses(1) or mouses(2) then
        if mouses(1) and not tp.选中假人 and tp:可通行() then
            self.移动 = false
            if self.行为 ~= '静立' then
                self.行为 = '静立'
            end
            --======
            local Qzd = xys(floor(x - pys.x), floor(y - pys.y))
            local dsaQ = mtb(jdb(tp.角色坐标, Qzd))
            self:置方向(dsaQ)
        end
    end
    for i = 1, #self.鼠标点击动画组 do
        if self.鼠标点击动画组[i] ~= nil then
            self.鼠标点击动画组[i].ani:更新(dt)
            self.鼠标点击动画组[i].ani:显示(self.鼠标点击动画组[i] + pys)
            if (self.鼠标点击动画组[i].ani.已载入 == 5) then
                self.鼠标点击动画组[i].ani = nil
                remove(self.鼠标点击动画组, i)
            end
        end
    end
    local s = xys(floor(tp.角色坐标.x), floor(tp.角色坐标.y))
    tp.影子:显示(s + pys)
    if self.人物['光环_' .. self.行为] ~= nil and self.光环特效 then
        self.人物['光环_' .. self.行为]:显示(s.x + pys.x, s.y + pys.y)
    --光环补差x,光环补差y=引擎.补差(tp.队伍[1].锦衣佩戴[3],self.人物模型)
    end
    if self.人物['足迹_' .. self.行为] ~= nil and self.足迹特效 then
        self.人物['足迹_' .. self.行为]:显示(s + pys)
    end

    if self.人物['坐骑_' .. self.行为] ~= nil then
        self.人物['坐骑_' .. self.行为]:显示(s + pys)
        if self.人物['坐骑饰品_' .. self.行为] ~= nil then
            self.人物['坐骑饰品_' .. self.行为]:显示(s + pys)
        end
    end
    if self.人物['身体_' .. self.行为] ~= nil then
        self.人物['身体_' .. self.行为]:显示(s.x + pys.x + 光环补差x + 坐骑补差x, s.y + pys.y + 光环补差y + 坐骑补差y)
    end
    self.人物[self.行为]:显示(s.x + pys.x + 光环补差x + 坐骑补差x, s.y + pys.y + 光环补差y + 坐骑补差y)
    if self.人物['武器_' .. self.行为] ~= nil then --武器偏移调整
        if self.人物模型 == '逍遥生' and self.方向 == 5 and tp:取武器子类(tp.队伍[1].装备[3].子类) ~= '剑' then
            self.人物['武器_' .. self.行为]:显示(s.x + pys.x + 光环补差x + 坐骑补差x + 7, s.y + pys.y + 光环补差y + 坐骑补差y - 5)
        elseif self.人物模型 == '逍遥生' and self.方向 == 7 and tp:取武器子类(tp.队伍[1].装备[3].子类) ~= '剑' then
            self.人物['武器_' .. self.行为]:显示(s.x + pys.x + 光环补差x + 坐骑补差x - 6, s.y + pys.y + 光环补差y + 坐骑补差y - 3)
        elseif self.人物模型 == '逍遥生' and self.方向 == 0 and tp:取武器子类(tp.队伍[1].装备[3].子类) ~= '剑' then
            self.人物['武器_' .. self.行为]:显示(s.x + pys.x + 光环补差x + 坐骑补差x - 7, s.y + pys.y + 光环补差y + 坐骑补差y - 7)
        elseif
            self.人物模型 == '逍遥生' and self.方向 ~= 0 and self.方向 ~= 5 and self.方向 ~= 7 and tp:取武器子类(tp.队伍[1].装备[3].子类) ~= '剑'
         then
            self.人物['武器_' .. self.行为]:显示(s.x + pys.x + 光环补差x + 坐骑补差x, s.y + pys.y + 光环补差y + 坐骑补差y - 7)
        elseif self.人物模型 == '剑侠客' then
            self.人物['武器_' .. self.行为]:显示(s.x + pys.x + 光环补差x + 坐骑补差x, s.y + pys.y + 光环补差y + 坐骑补差y - 5)
        else
            self.人物['武器_' .. self.行为]:显示(s.x + pys.x + 光环补差x + 坐骑补差x, s.y + pys.y + 光环补差y + 坐骑补差y)
        end
    end
    if self.人物['翅膀_' .. self.行为] ~= nil then
        self.人物['翅膀_' .. self.行为]:显示(s.x + pys.x + 5, s.y + pys.y + 22)
    end
    -- if 特效开关 then
    --     self.king:显示(s+pys)
    -- end
    if tp.当前称谓 ~= '无称谓' then
        if
            tp.当前称谓 == '后起之秀' or tp.当前称谓 == '三界菁英' or tp.当前称谓 == '武林高手' or tp.当前称谓 == '独孤求败' or tp.当前称谓 == '九天罗刹' or
                tp.当前称谓 == '皓月战神' or
                tp.当前称谓 == '梦幻元勋' or
                tp.当前称谓 == '叱咤三界' or
                tp.当前称谓 == '笑傲西游' or
                tp.当前称谓 == '唯吾独尊'
         then
            称谓颜色 = 0XFFce24ed
        elseif tp.当前称谓 ~= nil and tp.当前称谓 ~= '' and (string.match(tp.当前称谓, '娘子') or string.match(tp.当前称谓, '夫君')) then
            称谓颜色 = 0XFF000000
        elseif tp.当前称谓 == '富可敌国' or tp.当前称谓 == '降龙伏虎' or tp.当前称谓 == '只手遮天' or tp.当前称谓 == '幕神梦幻' then
            称谓颜色 = 黄色
        elseif tp.当前称谓 == '江湖豪侠' or tp.当前称谓 == '绝世豪侠' or tp.当前称谓 == '窈窕淑女' or tp.当前称谓 == '威震四方' then
            称谓颜色 = 0xFFFF68E1
        end
        人物字体:置颜色(称谓颜色)
        if self.称谓偏移 == nil then
            tp.场景.人物.称谓偏移 = 生成XY(tp.字体表.人物字体:取宽度(tp.队伍[1].当前称谓) / 2, -15)
        end
        if self.称谓特效 then
            if tp.当前称谓 == '至尊财神' and self.至尊财神 ~= nil then
                tp.场景.人物.称谓偏移 = 生成XY(tp.字体表.人物字体:取宽度(tp.队伍[1].当前称谓) / 2 + 65, 20)
                self.名称偏移 = xys(tp.字体表.人物字体:取宽度(tp.队伍[1].名称) / 2, -50)
                self.至尊财神:显示(s + pys - self.称谓偏移)
            elseif tp.当前称谓 == '狂暴之力' and self.狂暴之力 ~= nil then
                tp.场景.人物.称谓偏移 = 生成XY(tp.字体表.人物字体:取宽度(tp.队伍[1].当前称谓) / 2 + 115, 20)
                self.名称偏移 = xys(tp.字体表.人物字体:取宽度(tp.队伍[1].名称) / 2, -35)
                self.狂暴之力:显示(s + pys - self.称谓偏移)
            elseif tp.当前称谓 == '武林圣者' and self.武林圣者 ~= nil then
                tp.场景.人物.称谓偏移 = 生成XY(tp.字体表.人物字体:取宽度(tp.队伍[1].当前称谓) / 2 + 65, 20)
                self.名称偏移 = xys(tp.字体表.人物字体:取宽度(tp.队伍[1].名称) / 2, -35)
                self.武林圣者:显示(s + pys - self.称谓偏移)
            elseif tp.当前称谓 == '超凡入圣' and self.超凡入圣 ~= nil then
                tp.场景.人物.称谓偏移 = 生成XY(tp.字体表.人物字体:取宽度(tp.队伍[1].当前称谓) / 2 + 52, 0)
                self.名称偏移 = xys(tp.字体表.人物字体:取宽度(tp.队伍[1].名称) / 2, -35)
                self.超凡入圣:显示(s + pys - self.称谓偏移)
            elseif tp.当前称谓 == '洞察先机' and self.洞察先机 ~= nil then
                tp.场景.人物.称谓偏移 = 生成XY(tp.字体表.人物字体:取宽度(tp.队伍[1].当前称谓) / 2 - 30, -50)
                self.名称偏移 = xys(tp.字体表.人物字体:取宽度(tp.队伍[1].名称) / 2, -55)
                self.洞察先机:显示(s + pys - self.称谓偏移)
            elseif tp.当前称谓 == '独步青云' and self.独步青云 ~= nil then
                tp.场景.人物.称谓偏移 = 生成XY(tp.字体表.人物字体:取宽度(tp.队伍[1].当前称谓) / 2 - 30, -50)
                self.名称偏移 = xys(tp.字体表.人物字体:取宽度(tp.队伍[1].名称) / 2, -55)
                self.独步青云:显示(s + pys - self.称谓偏移)
            elseif tp.当前称谓 == '风华绝代' and self.风华绝代 ~= nil then
                tp.场景.人物.称谓偏移 = 生成XY(tp.字体表.人物字体:取宽度(tp.队伍[1].当前称谓) / 2 - 30, -40)
                self.名称偏移 = xys(tp.字体表.人物字体:取宽度(tp.队伍[1].名称) / 2, -55)
                self.风华绝代:显示(s + pys - self.称谓偏移)
            elseif tp.当前称谓 == '风云再起' and self.风云再起 ~= nil then
                tp.场景.人物.称谓偏移 = 生成XY(tp.字体表.人物字体:取宽度(tp.队伍[1].当前称谓) / 2 - 30, -40)
                self.名称偏移 = xys(tp.字体表.人物字体:取宽度(tp.队伍[1].名称) / 2, -45)
                self.风云再起:显示(s + pys - self.称谓偏移)
            elseif tp.当前称谓 == '盖世无双' and self.盖世无双 ~= nil then
                tp.场景.人物.称谓偏移 = 生成XY(tp.字体表.人物字体:取宽度(tp.队伍[1].当前称谓) / 2 - 30, -50)
                self.名称偏移 = xys(tp.字体表.人物字体:取宽度(tp.队伍[1].名称) / 2, -55)
                self.盖世无双:显示(s + pys - self.称谓偏移)
            elseif tp.当前称谓 == '盖世英豪' and self.盖世英豪 ~= nil then
                tp.场景.人物.称谓偏移 = 生成XY(tp.字体表.人物字体:取宽度(tp.队伍[1].当前称谓) / 2 - 30, -70)
                self.名称偏移 = xys(tp.字体表.人物字体:取宽度(tp.队伍[1].名称) / 2, -75)
                self.盖世英豪:显示(s + pys - self.称谓偏移)
            elseif tp.当前称谓 == '九五之尊' and self.九五之尊 ~= nil then
                tp.场景.人物.称谓偏移 = 生成XY(tp.字体表.人物字体:取宽度(tp.队伍[1].当前称谓) / 2 - 30, -80)
                self.名称偏移 = xys(tp.字体表.人物字体:取宽度(tp.队伍[1].名称) / 2, -85)
                self.九五之尊:显示(s + pys - self.称谓偏移)
            elseif tp.当前称谓 == '龙皇' and self.龙皇 ~= nil then
                tp.场景.人物.称谓偏移 = 生成XY(tp.字体表.人物字体:取宽度(tp.队伍[1].当前称谓) / 2 - 20, -55)
                self.名称偏移 = xys(tp.字体表.人物字体:取宽度(tp.队伍[1].名称) / 2, -60)
                self.龙皇:显示(s + pys - self.称谓偏移)
            elseif tp.当前称谓 == '神豪' and self.神豪 ~= nil then
                tp.场景.人物.称谓偏移 = 生成XY(tp.字体表.人物字体:取宽度(tp.队伍[1].当前称谓) / 2 - 20, -60)
                self.名称偏移 = xys(tp.字体表.人物字体:取宽度(tp.队伍[1].名称) / 2, -65)
                self.神豪:显示(s + pys - self.称谓偏移)
            elseif tp.当前称谓 == '战神' and self.战神 ~= nil then
                tp.场景.人物.称谓偏移 = 生成XY(tp.字体表.人物字体:取宽度(tp.队伍[1].当前称谓) / 2 - 20, -55)
                self.名称偏移 = xys(tp.字体表.人物字体:取宽度(tp.队伍[1].名称) / 2, -60)
                self.战神:显示(s + pys - self.称谓偏移)
            elseif tp.当前称谓 == '纵横三界王者风云' and self.纵横三界王者风云 ~= nil then
                tp.场景.人物.称谓偏移 = 生成XY(tp.字体表.人物字体:取宽度(tp.队伍[1].当前称谓) / 2 - 75, -70)
                self.名称偏移 = xys(tp.字体表.人物字体:取宽度(tp.队伍[1].名称) / 2, -75)
                self.纵横三界王者风云:显示(s + pys - self.称谓偏移)
            elseif tp.当前称谓 == '武神坛甲组冠军' and self.甲组冠军 ~= nil then
                tp.场景.人物.称谓偏移 = 生成XY(tp.字体表.人物字体:取宽度(tp.队伍[1].当前称谓) / 2 - 50, -25)
                --    self.名称偏移 = xys(tp.字体表.人物字体:取宽度(tp.队伍[1].名称) / 2,-60)
                self.甲组冠军:显示(s + pys - self.称谓偏移)
            elseif tp.当前称谓 == '武神坛甲组亚军' and self.甲组亚军 ~= nil then
                tp.场景.人物.称谓偏移 = 生成XY(tp.字体表.人物字体:取宽度(tp.队伍[1].当前称谓) / 2 - 50, -25)
                --    self.名称偏移 = xys(tp.字体表.人物字体:取宽度(tp.队伍[1].名称) / 2,-60)
                self.甲组亚军:显示(s + pys - self.称谓偏移)
            elseif tp.当前称谓 == '武神坛甲组季军' and self.甲组季军 ~= nil then
                tp.场景.人物.称谓偏移 = 生成XY(tp.字体表.人物字体:取宽度(tp.队伍[1].当前称谓) / 2 - 50, -25)
                --    self.名称偏移 = xys(tp.字体表.人物字体:取宽度(tp.队伍[1].名称) / 2,-60)
                self.甲组季军:显示(s + pys - self.称谓偏移)
            elseif tp.当前称谓 == '武神坛明星冠军' and self.明星冠军 ~= nil then
                tp.场景.人物.称谓偏移 = 生成XY(tp.字体表.人物字体:取宽度(tp.队伍[1].当前称谓) / 2 - 50, -25)
                --    self.名称偏移 = xys(tp.字体表.人物字体:取宽度(tp.队伍[1].名称) / 2,-60)
                self.明星冠军:显示(s + pys - self.称谓偏移)
            elseif tp.当前称谓 == '武神坛明星亚军' and self.明星亚军 ~= nil then
                tp.场景.人物.称谓偏移 = 生成XY(tp.字体表.人物字体:取宽度(tp.队伍[1].当前称谓) / 2 - 50, -25)
                --    self.名称偏移 = xys(tp.字体表.人物字体:取宽度(tp.队伍[1].名称) / 2,-60)
                self.明星亚军:显示(s + pys - self.称谓偏移)
            elseif tp.当前称谓 == '武神坛明星季军' and self.明星季军 ~= nil then
                tp.场景.人物.称谓偏移 = 生成XY(tp.字体表.人物字体:取宽度(tp.队伍[1].当前称谓) / 2 - 50, -25)
                --    self.名称偏移 = xys(tp.字体表.人物字体:取宽度(tp.队伍[1].名称) / 2,-60)
                self.明星季军:显示(s + pys - self.称谓偏移)
            elseif tp.当前称谓 == '九天揽月' and self.九天揽月 ~= nil then
                tp.场景.人物.称谓偏移 = 生成XY(tp.字体表.人物字体:取宽度(tp.队伍[1].当前称谓) / 2 + 60, 30)
                --    self.名称偏移 = xys(tp.字体表.人物字体:取宽度(tp.队伍[1].名称) / 2,-60)
                self.九天揽月:显示(s + pys - self.称谓偏移)
            elseif tp.当前称谓 == '剑指苍穹' and self.剑指苍穹 ~= nil then
                tp.场景.人物.称谓偏移 = 生成XY(tp.字体表.人物字体:取宽度(tp.队伍[1].当前称谓) / 2 + 60, 30)
                --    self.名称偏移 = xys(tp.字体表.人物字体:取宽度(tp.队伍[1].名称) / 2,-60)
                self.剑指苍穹:显示(s + pys - self.称谓偏移)
            elseif tp.当前称谓 == '势不可挡' and self.势不可挡 ~= nil then
                tp.场景.人物.称谓偏移 = 生成XY(tp.字体表.人物字体:取宽度(tp.队伍[1].当前称谓) / 2 + 60, 40)
                --    self.名称偏移 = xys(tp.字体表.人物字体:取宽度(tp.队伍[1].名称) / 2,-60)
                self.势不可挡:显示(s + pys - self.称谓偏移)
            elseif tp.当前称谓 == '王者风范' and self.王者风范 ~= nil then
                tp.场景.人物.称谓偏移 = 生成XY(tp.字体表.人物字体:取宽度(tp.队伍[1].当前称谓) / 2 + 65, 60)
                --    self.名称偏移 = xys(tp.字体表.人物字体:取宽度(tp.队伍[1].名称) / 2,-60)
                self.王者风范:显示(s + pys - self.称谓偏移)
            elseif tp.当前称谓 == '只手遮天' and self.黄称谓边框 ~= nil then
                --    self.名称偏移 = xys(tp.字体表.人物字体:取宽度(tp.队伍[1].名称) / 2,-60)
                self.黄称谓边框:显示(s + pys - self.称谓偏移)
                tp.场景.人物.称谓偏移 = 生成XY(tp.字体表.人物字体:取宽度(tp.队伍[1].当前称谓) / 2 + 25, -35)
                人物字体:显示x(s + pys - 生成XY(tp.字体表.人物字体:取宽度(tp.队伍[1].当前称谓) / 2, -15), tp.当前称谓)
            elseif tp.当前称谓 == '降龙伏虎' and self.黄称谓边框 ~= nil then
                --    self.名称偏移 = xys(tp.字体表.人物字体:取宽度(tp.队伍[1].名称) / 2,-60)
                self.黄称谓边框:显示(s + pys - self.称谓偏移)
                tp.场景.人物.称谓偏移 = 生成XY(tp.字体表.人物字体:取宽度(tp.队伍[1].当前称谓) / 2 + 25, -35)
                人物字体:显示x(s + pys - 生成XY(tp.字体表.人物字体:取宽度(tp.队伍[1].当前称谓) / 2, -10), tp.当前称谓)
            elseif tp.当前称谓 == '威震四方' and self.梦幻大亨框 ~= nil then
                self.梦幻大亨框:显示(s + pys - self.称谓偏移)
                tp.场景.人物.称谓偏移 = 生成XY(tp.字体表.人物字体:取宽度(tp.队伍[1].当前称谓) / 2 + 25, -35)
                人物字体:显示x(s + pys - 生成XY(tp.字体表.人物字体:取宽度(tp.队伍[1].当前称谓) / 2, -15), tp.当前称谓)
            elseif tp.当前称谓 == '江湖豪侠' and self.江湖豪侠框 ~= nil then
                --    self.名称偏移 = xys(tp.字体表.人物字体:取宽度(tp.队伍[1].名称) / 2,-60)
                self.江湖豪侠框:显示(s + pys - self.称谓偏移)
                tp.场景.人物.称谓偏移 = 生成XY(tp.字体表.人物字体:取宽度(tp.队伍[1].当前称谓) / 2 + 25, -35)
                人物字体:显示x(s + pys - 生成XY(tp.字体表.人物字体:取宽度(tp.队伍[1].当前称谓) / 2, -15), tp.当前称谓)
            elseif tp.当前称谓 == '绝世豪侠' and self.绝世豪侠框 ~= nil then
                --    self.名称偏移 = xys(tp.字体表.人物字体:取宽度(tp.队伍[1].名称) / 2,-60)
                self.绝世豪侠框:显示(s + pys - self.称谓偏移)
                tp.场景.人物.称谓偏移 = 生成XY(tp.字体表.人物字体:取宽度(tp.队伍[1].当前称谓) / 2 + 25, -35)
                人物字体:显示x(s + pys - 生成XY(tp.字体表.人物字体:取宽度(tp.队伍[1].当前称谓) / 2, -15), tp.当前称谓)
            elseif tp.当前称谓 == '富可敌国' and self.富可敌国框 ~= nil then
                --    self.名称偏移 = xys(tp.字体表.人物字体:取宽度(tp.队伍[1].名称) / 2,-60)
                self.富可敌国框:显示(s + pys - self.称谓偏移)
                tp.场景.人物.称谓偏移 = 生成XY(tp.字体表.人物字体:取宽度(tp.队伍[1].当前称谓) / 2 + 25, -35)
                人物字体:显示x(s + pys - 生成XY(tp.字体表.人物字体:取宽度(tp.队伍[1].当前称谓) / 2, -15), tp.当前称谓)
            elseif tp.当前称谓 == '幕神梦幻' and self.幕神梦幻框 ~= nil then
                --    self.名称偏移 = xys(tp.字体表.人物字体:取宽度(tp.队伍[1].名称) / 2,-60)
                self.幕神梦幻框:显示(s + pys - self.称谓偏移)
                tp.场景.人物.称谓偏移 = 生成XY(tp.字体表.人物字体:取宽度(tp.队伍[1].当前称谓) / 2 + 25, -35)
                人物字体:显示x(s + pys - 生成XY(tp.字体表.人物字体:取宽度(tp.队伍[1].当前称谓) / 2, -15), tp.当前称谓)
            elseif tp.当前称谓 == '窈窕淑女' and self.窈窕淑女框 ~= nil then
                --    self.名称偏移 = xys(tp.字体表.人物字体:取宽度(tp.队伍[1].名称) / 2,-60)
                self.窈窕淑女框:显示(s + pys - self.称谓偏移)
                tp.场景.人物.称谓偏移 = 生成XY(tp.字体表.人物字体:取宽度(tp.队伍[1].当前称谓) / 2 + 25, -35)
                人物字体:显示x(s + pys - 生成XY(tp.字体表.人物字体:取宽度(tp.队伍[1].当前称谓) / 2, -15), tp.当前称谓)
            else
                人物字体:显示x(s + pys - self.称谓偏移, tp.当前称谓)
            end

            人物字体:置阴影颜色(-1275068416)
            人物字体:置颜色(名称颜色)
            人物字体:显示x(s + pys - self.名称偏移, tp.队伍[1].名称)
            -- 人物字体:置颜色(0xFF70FC70):置阴影颜色(ARGB(170,0,0,0)):显示x(s + pys - self.名称偏移,tp.队伍[1].名称)
            人物字体:置阴影颜色(-1275068416)
        else
            人物字体:置颜色(名称颜色)
            人物字体:置颜色(0xFF70FC70):置阴影颜色(ARGB(170, 0, 0, 0)):显示x(s + pys - self.名称偏移, tp.队伍[1].名称)
            人物字体:置阴影颜色(-1275068416)
        end
    end
    --显示摊位
    if 摊位名称 ~= nil then
        local 摊位xy = s + pys
        local 摊位长度 = string.len(摊位名称)
        if 摊位长度 <= 4 then
            小摊位:显示(摊位xy.x + 坐骑补差x, 摊位xy.y - 100 + 坐骑补差y)
            摊位文字:显示(摊位xy.x - 13 + (4 - 摊位长度) * 1.8 + 坐骑补差x, 摊位xy.y - 114 + 坐骑补差y, 摊位名称)
            if 小摊位:是否选中(x, y) and 引擎.鼠标弹起(右键) then
                发送数据(3720, tp.队伍[1].bb)
            end
        elseif 摊位长度 <= 4 then
            中摊位:显示(摊位xy.x + 坐骑补差x, 摊位xy.y - 100 + 坐骑补差y)
            摊位文字:显示(摊位xy.x - 25 + (8 - 摊位长度) * 1.8 + 坐骑补差x, 摊位xy.y - 114 + 坐骑补差y, 摊位名称)
            if 中摊位:是否选中(x, y) and 引擎.鼠标弹起(右键) then
                发送数据(3720, tp.队伍[1].bb)
            end
        else
            大摊位:显示(摊位xy.x + 坐骑补差x, 摊位xy.y - 100 + 坐骑补差y)
            摊位文字:显示(摊位xy.x - 40 + (12 - 摊位长度) * 1.8 + 坐骑补差x, 摊位xy.y - 114 + 坐骑补差y, 摊位名称)
            if 大摊位:是否选中(x, y) and 引擎.鼠标弹起(右键) then
                发送数据(3720, tp.队伍[1].bb)
            end
        end
    end
    for i = 1, #self.特效组 do
        if self.特效组[i] ~= nil then
            self.特效组[i]:更新(dt)
            self.特效组[i]:显示(s + pys)
            if (self.特效组[i].已载入 >= self.特效组[i].帧数 - 2) then
                self.特效组[i] = nil
                remove(self.特效组, i)
            end
        end
    end
    if self.队长开关 then
        self.显示坐标 = s + pys
        if self.人物['坐骑_' .. self.行为] ~= nil then
            self.队伍令牌:显示(self.显示坐标.x, self.显示坐标.y - 130 + 坐骑补差y / 2)
        else
            self.队伍令牌:显示(self.显示坐标.x, self.显示坐标.y - 100)
        end
    end
    if self.移动 then
        self:开始移动(pys)
    end
    self.坐标.x = floor(tp.角色坐标.x)
    self.坐标.y = floor(tp.角色坐标.y)
end

function 场景类_人物:设置坐标(格子)
    tp.角色坐标.x, tp.角色坐标.y = 格子.x, 格子.y
    tp.场景.滑屏.x, tp.场景.滑屏.y = tp.角色坐标.x, tp.角色坐标.y
    --tp.场景.屏幕坐标 = 取画面坐标(tp.角色坐标.x,tp.角色坐标.y,tp.场景.地图.宽度,tp.场景.地图.高度)
    self:停止移动()
end

function 场景类_人物:设置路径(格子)
    self.移动计时 = os.time()
    tp.窗口.小地图:清空()
    self.移动距离 = 格子.距离
    local a = xys(floor(tp.角色坐标.x / 20), floor(tp.角色坐标.y / 20))
    self.目标格子 = tp.场景.地图.寻路:寻路(a, 格子)
    if self.目标格子 ~= nil and self.目标格子[1] ~= nil then
        tp.场景.跟随坐标 = {self.目标格子}
        self.延时 = 10
        self.移动 = true
        self:取目标(self.目标格子[1])
    else
        self.目标格子 = {}
    end
end

function 场景类_人物:置方向(d)
    if tp.队伍[1].变身数据 ~= nil and 变身显示 then
        d = 取四至八方向(d)
    end
    self.人物['静立']:置方向(d)
    self.人物['行走']:置方向(d)
    if self.人物['武器_静立'] ~= nil and self.人物['武器_行走'] ~= nil then
        self.人物['武器_静立']:置方向(d)
        self.人物['武器_行走']:置方向(d)
    end
    if self.人物['坐骑_静立'] ~= nil then
        self.人物['坐骑_静立']:置方向(d)
        self.人物['坐骑_行走']:置方向(d)
        if self.人物['坐骑饰品_静立'] ~= nil then
            self.人物['坐骑饰品_静立']:置方向(d)
            self.人物['坐骑饰品_行走']:置方向(d)
        end
    end
    if self.人物['身体_静立'] ~= nil and self.人物['身体_行走'] ~= nil then
        self.人物['身体_静立']:置方向(d)
        self.人物['身体_行走']:置方向(d)
    end
    if self.人物['翅膀_静立'] ~= nil then
        self.人物['翅膀_静立']:置方向(d)
        self.人物['翅膀_行走']:置方向(d)
    end
    if self.人物['足迹_行走'] ~= nil then
        self.人物['足迹_行走']:置方向(d)
    end
    self.方向 = d
end

function 场景类_人物:置染色(染色方案, a, b, c, d)
    if tp.队伍[1].变身[1] ~= nil then
        return false
    end
    if 染色方案 ~= nil and 染色方案 ~= 0 then
        self.人物['静立']:置染色(染色方案, a, b, c, 0)
        self.人物['行走']:置染色(染色方案, a, b, c, 0)
        self:置方向(self.方向)
    end
end
function 场景类_人物:置模型2(开关)
    local mx = tp.队伍[1].模型
    if tp.队伍[1].变身数据 ~= nil and 变身显示 then
        mx = tp.队伍[1].变身数据
    end
    self.方向 = 1
    local 资源 = qmxs(mx)
    if (tp.队伍[1].变身数据 == nil or 变身显示 == false) and 开关 then
        if tp.队伍[1].锦衣佩戴[1] ~= nil and tp.队伍[1].锦衣佩戴[1].名称 ~= nil then
            if
                tp.队伍[1].锦衣佩戴[1].名称 == '夜影' or tp.队伍[1].锦衣佩戴[1].名称 == '夏日清凉' or tp.队伍[1].锦衣佩戴[1].名称 == '华风汉雅' or
                    tp.队伍[1].锦衣佩戴[1].名称 == '萌萌小厨'
             then
                临时资源 = qzdjy(mx .. '_静立_' .. tp.队伍[1].锦衣佩戴[1].名称)
                临时资源1 = qzdjy(mx .. '_行走_' .. tp.队伍[1].锦衣佩戴[1].名称)
                临时资源包 = 'shape0.npk'
                if tp.队伍[1].锦衣佩戴[1].名称 == '华风汉雅' or tp.队伍[1].锦衣佩戴[1].名称 == '萌萌小厨' then
                    临时资源包 = 'shape2.npk'
                end
                self.人物 = {['静立'] = tp.资源:载入(临时资源包, '网易锦衣动画', 临时资源), ['行走'] = tp.资源:载入(临时资源包, '网易锦衣动画', 临时资源1)}
                if tp.队伍[1].锦衣佩戴[1].名称 == '夏日清凉' or tp.队伍[1].锦衣佩戴[1].名称 == '华风汉雅' or tp.队伍[1].锦衣佩戴[1].名称 == '萌萌小厨' then
                    临时资源 = qzdjys(mx .. '_静立_' .. tp.队伍[1].锦衣佩戴[1].名称 .. '_头')
                    临时资源1 = qzdjys(mx .. '_行走_' .. tp.队伍[1].锦衣佩戴[1].名称 .. '_头')
                    self.人物['身体_静立'] = tp.资源:载入('shape0.npk', '网易锦衣动画', 临时资源)
                    self.人物['身体_行走'] = tp.资源:载入('shape0.npk', '网易锦衣动画', 临时资源1)
                end
            else
                资源 = qmxs(tp.队伍[1].锦衣佩戴[1].名称 .. '_' .. mx)
                self.人物 = {['静立'] = tp.资源:载入(资源[3], '网易WDF动画', 资源[1]), ['行走'] = tp.资源:载入(资源[3], '网易WDF动画', 资源[2])}
            end
        else
            self.人物 = {['静立'] = tp.资源:载入(资源[3], '网易WDF动画', 资源[1]), ['行走'] = tp.资源:载入(资源[3], '网易WDF动画', 资源[2])}
        end
    else
        self.人物 = {['静立'] = tp.资源:载入(资源[3], '网易WDF动画', 资源[1]), ['行走'] = tp.资源:载入(资源[3], '网易WDF动画', 资源[2])}
        if tp.队伍[1].变异 and 染色信息[mx] ~= nil then
            self.染色方案 = 染色信息[mx].id
            self.染色组 = 染色信息[mx].方案
            self:置染色(self.染色方案, self.染色组[1], self.染色组[2], self.染色组[3])
            self:置方向(self.方向)
        end
    end
    tp.队伍[1]:刷新信息()
    if tp.队伍[1].装备[3] ~= nil and (tp.队伍[1].变身数据 == nil or 变身显示 == false) then
        self:穿戴装备()
    else
        if (tp.队伍[1].锦衣佩戴[1] ~= nil and tp.队伍[1].锦衣佩戴[1].名称 ~= nil) or (tp.队伍[1].变身数据 ~= nil and 变身显示) then
        else
            self:置染色(tp.队伍[1].染色方案, tp.队伍[1].染色组[1], tp.队伍[1].染色组[2], tp.队伍[1].染色组[3])
            self:置方向(self.方向)
        end
    end
    if tp.队伍[1].坐骑 ~= nil and (tp.队伍[1].变身数据 == nil or 变身显示 == false) then
        self:坐骑改变(mx, tp.队伍[1].坐骑)
    end
    if tp.队伍[1].锦衣佩戴[3] ~= nil and tp.队伍[1].锦衣佩戴[3].名称 ~= nil and (tp.队伍[1].变身数据 == nil or 变身显示 == false) then
        self:穿戴光环()
    else
        self:卸下光环()
    end
    if tp.队伍[1].锦衣佩戴[4] ~= nil and tp.队伍[1].锦衣佩戴[4].名称 ~= nil and (tp.队伍[1].变身数据 == nil or 变身显示 == false) then
        self:穿戴足迹()
    else
        self:卸下足迹()
    end
    -- self:穿戴翅膀()
    self:置方向(self.方向)
end
function 场景类_人物:置模型()
    local mx = tp.队伍[1].模型
    if tp.队伍[1].变身数据 ~= nil and 变身显示 then
        mx = tp.队伍[1].变身数据
    end
    self.方向 = 1
    local 资源 = qmxs(mx)
    if (tp.队伍[1].变身数据 == nil or 变身显示 == false) then
        if tp.队伍[1].锦衣佩戴[1] ~= nil and tp.队伍[1].锦衣佩戴[1].名称 ~= nil then
            if
                tp.队伍[1].锦衣佩戴[1].名称 == '夜影' or tp.队伍[1].锦衣佩戴[1].名称 == '夏日清凉' or tp.队伍[1].锦衣佩戴[1].名称 == '华风汉雅' or
                    tp.队伍[1].锦衣佩戴[1].名称 == '萌萌小厨'
             then
                临时资源 = qzdjy(mx .. '_静立_' .. tp.队伍[1].锦衣佩戴[1].名称)
                临时资源1 = qzdjy(mx .. '_行走_' .. tp.队伍[1].锦衣佩戴[1].名称)
                临时资源包 = 'shape0.npk'
                if tp.队伍[1].锦衣佩戴[1].名称 == '华风汉雅' or tp.队伍[1].锦衣佩戴[1].名称 == '萌萌小厨' then
                    临时资源包 = 'shape2.npk'
                end
                self.人物 = {['静立'] = tp.资源:载入(临时资源包, '网易锦衣动画', 临时资源), ['行走'] = tp.资源:载入(临时资源包, '网易锦衣动画', 临时资源1)}
                if tp.队伍[1].锦衣佩戴[1].名称 == '夏日清凉' or tp.队伍[1].锦衣佩戴[1].名称 == '华风汉雅' or tp.队伍[1].锦衣佩戴[1].名称 == '萌萌小厨' then
                    临时资源 = qzdjys(mx .. '_静立_' .. tp.队伍[1].锦衣佩戴[1].名称 .. '_头')
                    临时资源1 = qzdjys(mx .. '_行走_' .. tp.队伍[1].锦衣佩戴[1].名称 .. '_头')
                    self.人物['身体_静立'] = tp.资源:载入('shape0.npk', '网易锦衣动画', 临时资源)
                    self.人物['身体_行走'] = tp.资源:载入('shape0.npk', '网易锦衣动画', 临时资源1)
                end
            else
                资源 = qmxs(tp.队伍[1].锦衣佩戴[1].名称 .. '_' .. mx)
                self.人物 = {['静立'] = tp.资源:载入(资源[3], '网易WDF动画', 资源[1]), ['行走'] = tp.资源:载入(资源[3], '网易WDF动画', 资源[2])}
            end
        else
            self.人物 = {['静立'] = tp.资源:载入(资源[3], '网易WDF动画', 资源[1]), ['行走'] = tp.资源:载入(资源[3], '网易WDF动画', 资源[2])}
        end
    else
        self.人物 = {['静立'] = tp.资源:载入(资源[3], '网易WDF动画', 资源[1]), ['行走'] = tp.资源:载入(资源[3], '网易WDF动画', 资源[2])}
        if tp.队伍[1].变异 and 染色信息[mx] ~= nil then
            self.染色方案 = 染色信息[mx].id
            self.染色组 = 染色信息[mx].方案
            self:置染色(self.染色方案, self.染色组[1], self.染色组[2], self.染色组[3])
            self:置方向(self.方向)
        end
    end
    tp.队伍[1]:刷新信息()
    if tp.队伍[1].装备[3] ~= nil and (tp.队伍[1].变身数据 == nil or 变身显示 == false) then
        self:穿戴装备()
    else
        if (tp.队伍[1].锦衣佩戴[1] ~= nil and tp.队伍[1].锦衣佩戴[1].名称 ~= nil) or (tp.队伍[1].变身数据 ~= nil and 变身显示) then
        else
            self:置染色(tp.队伍[1].染色方案, tp.队伍[1].染色组[1], tp.队伍[1].染色组[2], tp.队伍[1].染色组[3])
            self:置方向(self.方向)
        end
    end
    if tp.队伍[1].坐骑 ~= nil and (tp.队伍[1].变身数据 == nil or 变身显示 == false) then
        self:坐骑改变(mx, tp.队伍[1].坐骑)
    end
    if tp.队伍[1].锦衣佩戴[3] ~= nil and tp.队伍[1].锦衣佩戴[3].名称 ~= nil and (tp.队伍[1].变身数据 == nil or 变身显示 == false) then
        self:穿戴光环()
    else
        self:卸下光环()
    end
    if tp.队伍[1].锦衣佩戴[4] ~= nil and tp.队伍[1].锦衣佩戴[4].名称 ~= nil and (tp.队伍[1].变身数据 == nil or 变身显示 == false) then
        self:穿戴足迹()
    else
        self:卸下足迹()
    end
    -- self:穿戴翅膀()
    self:置方向(self.方向)
end

function 场景类_人物:坐骑改变(模型, 坐骑, 饰品)
    if tp.队伍[1].变身数据 ~= nil and 变身显示 then
        tp.提示:写入('#Y/当前正处于变身状态中，无法显示坐骑效果')
        return false
    end

    if 坐骑 == nil or 坐骑.模型 == nil then
        return
    end
    local 资源组 = {}
    local 站立坐骑 = 0
    if tszq(模型, 坐骑.模型, '奔跑') ~= '' then
        资源组.人物资源 = 'xzsc.wdf' or 'wpal/121.wpal'
        资源组.人物站立 = tszq(模型, 坐骑.模型, '站立')
        资源组.人物行走 = tszq(模型, 坐骑.模型, '奔跑')
        资源组.坐骑资源 = 'xzsc.wdf' or 'wpal/121.wpal'
        资源组.坐骑行走 = tszq(模型, 坐骑.模型, '奔跑')
        资源组.坐骑站立 = tszq(模型, 坐骑.模型, '站立')
    elseif 引擎.取站立坐骑(坐骑.模型) ~= nil then
        站立坐骑 = 1
        资源组.坐骑资源 = 'xzsc.wdf' or 'wpal/121.wpal'
        资源组.坐骑行走 = 引擎.取站立坐骑(坐骑.模型)[1]
        资源组.坐骑站立 = 引擎.取站立坐骑(坐骑.模型)[2]
    else
        资源组 = zqj(模型, 坐骑.模型, 坐骑.饰品 or '空')
    end
    if 资源组 == nil then
        return
    end
    if 站立坐骑 == 0 then
        self.人物 = {['静立'] = tp.资源:载入(资源组.人物资源, '网易WDF动画', 资源组.人物站立), ['行走'] = tp.资源:载入(资源组.人物资源, '网易WDF动画', 资源组.人物行走)}
    else
        self:置站立模型()
    end
    self.人物['坐骑_静立'] = tp.资源:载入(资源组.坐骑资源, '网易WDF动画', 资源组.坐骑站立)
    self.人物['坐骑_行走'] = tp.资源:载入(资源组.坐骑资源, '网易WDF动画', 资源组.坐骑行走)
    if 坐骑.染色方案 ~= nil and 坐骑.染色组 ~= 0 and #坐骑.染色组 ~= 0 then
        self.人物['坐骑_静立']:置染色(坐骑.染色方案, 坐骑.染色组[1], 坐骑.染色组[2], 坐骑.染色组[3])
        self.人物['坐骑_行走']:置染色(坐骑.染色方案, 坐骑.染色组[1], 坐骑.染色组[2], 坐骑.染色组[3])
    end
    if 资源组.坐骑饰品站立 ~= nil then
        self.人物['坐骑饰品_静立'] = tp.资源:载入(资源组.坐骑饰品资源, '网易WDF动画', 资源组.坐骑饰品站立)
        self.人物['坐骑饰品_行走'] = tp.资源:载入(资源组.坐骑饰品资源, '网易WDF动画', 资源组.坐骑饰品行走)
        if 坐骑.饰品物件 ~= nil and 坐骑.饰品物件.染色方案 ~= nil and 坐骑.饰品物件.染色组 ~= 0 and #坐骑.饰品物件.染色组 ~= 0 then
            self.人物['坐骑饰品_静立']:置染色(坐骑.饰品物件.染色方案, 坐骑.饰品物件.染色组[1], 坐骑.饰品物件.染色组[2], 坐骑.饰品物件.染色组[3])
            self.人物['坐骑饰品_行走']:置染色(坐骑.饰品物件.染色方案, 坐骑.饰品物件.染色组[1], 坐骑.饰品物件.染色组[2], 坐骑.饰品物件.染色组[3])
        end
    end
    if 站立坐骑 == 0 then
        self.人物['武器_静立'] = nil
        self.人物['武器_行走'] = nil
    end
    -- if tp.队伍[1].锦衣佩戴[1] ~= nil and tp.队伍[1].锦衣佩戴[1].名称 ~= nil and tp.队伍[1].变身数据 == nil  then
    -- else
    if
        (tp.队伍[1].锦衣佩戴 == nil or tp.队伍[1].锦衣佩戴[1] == nil) and 坐骑.模型 ~= '独角兽' and 坐骑.模型 ~= '独角兽1' and 坐骑.模型 ~= '飞天龙马' and
            坐骑.模型 ~= '霜雪龙宝' and
            坐骑.模型 ~= '冰晶雪魄' and
            坐骑.模型 ~= '冰晶魅灵' and
            坐骑.模型 ~= '青梅竹马' and
            坐骑.模型 ~= '深海狂鲨' and
            坐骑.模型 ~= '独角马' and
            坐骑.模型 ~= '海豚恋人' and
            坐骑.模型 ~= '冰晶魅灵' and
            坐骑.模型 ~= '炫影天马' and
            坐骑.模型 ~= '玲珑雪狐' and
            坐骑.模型 ~= '玲珑雪狐女' and
            坐骑.模型 ~= '烈焰雄狮' and
            坐骑.模型 ~= '九尾神狐1'
     then
        self:置染色(tp.队伍[1].染色方案, tp.队伍[1].染色组[1], tp.队伍[1].染色组[2], tp.队伍[1].染色组[3])
    end
    if tp.队伍[1].锦衣佩戴[3] ~= nil and tp.队伍[1].锦衣佩戴[3].名称 ~= nil and (tp.队伍[1].变身数据 == nil or 变身显示 == false) then
        self:穿戴光环()
    else
        self:卸下光环()
    end
    if tp.队伍[1].锦衣佩戴[4] ~= nil and tp.队伍[1].锦衣佩戴[4].名称 ~= nil and (tp.队伍[1].变身数据 == nil or 变身显示 == false) then
        self:穿戴足迹()
    else
        self:卸下足迹()
    end
    self:置方向(self.方向)
    -- end
    坐骑补差x, 坐骑补差y = 0, 0
    坐骑补差x, 坐骑补差y = 引擎.补差(tp.队伍[1].坐骑.模型, self.人物模型)
end

function 场景类_人物:置站立模型()
    local mx = tp.队伍[1].模型
    if tp.队伍[1].变身数据 ~= nil and 变身显示 then
        mx = tp.队伍[1].变身数据
    end
    self.方向 = 1
    local 资源 = qmxs(mx)
    if (tp.队伍[1].变身数据 == nil or 变身显示 == false) then
        if tp.队伍[1].锦衣佩戴[1] ~= nil and tp.队伍[1].锦衣佩戴[1].名称 ~= nil then
            if
                tp.队伍[1].锦衣佩戴[1].名称 == '夜影' or tp.队伍[1].锦衣佩戴[1].名称 == '夏日清凉' or tp.队伍[1].锦衣佩戴[1].名称 == '华风汉雅' or
                    tp.队伍[1].锦衣佩戴[1].名称 == '萌萌小厨'
             then
                临时资源 = qzdjy(mx .. '_静立_' .. tp.队伍[1].锦衣佩戴[1].名称)
                临时资源1 = qzdjy(mx .. '_行走_' .. tp.队伍[1].锦衣佩戴[1].名称)
                临时资源包 = 'shape0.npk'
                if tp.队伍[1].锦衣佩戴[1].名称 == '华风汉雅' or tp.队伍[1].锦衣佩戴[1].名称 == '萌萌小厨' then
                    临时资源包 = 'shape2.npk'
                end
                self.人物 = {['静立'] = tp.资源:载入(临时资源包, '网易锦衣动画', 临时资源), ['行走'] = tp.资源:载入(临时资源包, '网易锦衣动画', 临时资源)}
                if tp.队伍[1].锦衣佩戴[1].名称 == '夏日清凉' or tp.队伍[1].锦衣佩戴[1].名称 == '华风汉雅' or tp.队伍[1].锦衣佩戴[1].名称 == '萌萌小厨' then
                    临时资源 = qzdjys(mx .. '_静立_' .. tp.队伍[1].锦衣佩戴[1].名称 .. '_头')
                    self.人物['身体_静立'] = tp.资源:载入('shape0.npk', '网易锦衣动画', 临时资源)
                    self.人物['身体_行走'] = tp.资源:载入('shape0.npk', '网易锦衣动画', 临时资源)
                end
            else
                资源 = qmxs(tp.队伍[1].锦衣佩戴[1].名称 .. '_' .. mx)
                self.人物 = {['静立'] = tp.资源:载入(资源[3], '网易WDF动画', 资源[1]), ['行走'] = tp.资源:载入(资源[3], '网易WDF动画', 资源[1])}
            end
        else
            self.人物 = {['静立'] = tp.资源:载入(资源[3], '网易WDF动画', 资源[1]), ['行走'] = tp.资源:载入(资源[3], '网易WDF动画', 资源[1])}
        end
    else
        self.人物 = {['静立'] = tp.资源:载入(资源[3], '网易WDF动画', 资源[1]), ['行走'] = tp.资源:载入(资源[3], '网易WDF动画', 资源[1])}
        if tp.队伍[1].变异 and 染色信息[mx] ~= nil then
            self.染色方案 = 染色信息[mx].id
            self.染色组 = 染色信息[mx].方案
            self:置染色(self.染色方案, self.染色组[1], self.染色组[2], self.染色组[3])
            self:置方向(self.方向)
        end
    end
    tp.队伍[1]:刷新信息()
    if tp.队伍[1].装备[3] ~= nil and (tp.队伍[1].变身数据 == nil or 变身显示 == false) then
        self:穿戴装备(1)
    else
        if (tp.队伍[1].锦衣佩戴[1] ~= nil and tp.队伍[1].锦衣佩戴[1].名称 ~= nil) or (tp.队伍[1].变身数据 ~= nil and 变身显示) then
        else
            self:置染色(tp.队伍[1].染色方案, tp.队伍[1].染色组[1], tp.队伍[1].染色组[2], tp.队伍[1].染色组[3])
            self:置方向(self.方向)
        end
    end
    self:置方向(self.方向)
end

function 场景类_人物:卸下坐骑()
    if tp.队伍[1].变身数据 ~= nil and 变身显示 then
        tp.提示:写入('#Y/当前正处于变身状态中，无法显示坐骑效果')
        return false
    end
    self.人物['坐骑_静立'] = nil
    self.人物['坐骑_行走'] = nil
    self.人物['坐骑饰品_静立'] = nil
    self.人物['坐骑饰品_行走'] = nil
    坐骑补差x, 坐骑补差y = 0, 0
    self:置模型()
end

function 场景类_人物:穿戴装备(数字)
    if tp.队伍[1].变身[1] ~= nil and 变身显示 then
        tp.提示:写入('#Y/当前正处于变身状态中，无法取消')
        return false
    end
    if self.人物['坐骑_静立'] ~= nil then
        if 引擎.取站立坐骑(tp.队伍[1].坐骑.模型) ~= nil then
            local 资源 = qmxs(tp.队伍[1].模型, v)
            local m = tp:取武器附加名称(tp.队伍[1].装备[3].子类, tp.队伍[1].装备[3].级别限制, tp.队伍[1].装备[3].名称)
            local n = qmxs(m .. '_' .. tp.队伍[1].模型)
            self.人物['武器_静立'] = tp.资源:载入(n[3], '网易WDF动画', n[1])
            self.人物['武器_行走'] = tp.资源:载入(n[3], '网易WDF动画', n[1])
            self.人物['武器_静立']:置差异(self.人物['武器_静立'].帧数 - self.人物['静立'].帧数)
            self.人物['武器_行走']:置差异(self.人物['武器_行走'].帧数 - self.人物['行走'].帧数)
            if
                tp.队伍[1].装备[3].染色方案 ~= 0 and tp.队伍[1].装备[3].染色组 ~= 0 and tp.队伍[1].装备[3].染色组 ~= nil and
                    #tp.队伍[1].装备[3].染色组 > 0
             then
                self.人物['武器_静立']:置染色(
                    tp.队伍[1].装备[3].染色方案,
                    tp.队伍[1].装备[3].染色组[1],
                    tp.队伍[1].装备[3].染色组[2],
                    tp.队伍[1].装备[3].染色组[3]
                )
                self.人物['武器_行走']:置染色(
                    tp.队伍[1].装备[3].染色方案,
                    tp.队伍[1].装备[3].染色组[1],
                    tp.队伍[1].装备[3].染色组[2],
                    tp.队伍[1].装备[3].染色组[3]
                )
            end
            self:置方向(self.方向)
        end
        return false
    end
    local v = tp:取武器子类(tp.队伍[1].装备[3].子类)
    if tp.队伍[1].装备[3].名称 == '龙鸣寒水' or tp.队伍[1].装备[3].名称 == '非攻' then
        v = '弓弩1'
    end
    local 资源 = qmxs(tp.队伍[1].模型, v)
    local m = tp:取武器附加名称(tp.队伍[1].装备[3].子类, tp.队伍[1].装备[3].级别限制, tp.队伍[1].装备[3].名称)
    local n = qmxs(m .. '_' .. tp.队伍[1].模型)
    if 数字 ~= nil then
        self.人物['武器_静立'] = tp.资源:载入(n[3], '网易WDF动画', n[1])
        self.人物['武器_行走'] = tp.资源:载入(n[3], '网易WDF动画', n[1])
    else
        self.人物['武器_静立'] = tp.资源:载入(n[3], '网易WDF动画', n[1])
        self.人物['武器_行走'] = tp.资源:载入(n[3], '网易WDF动画', n[2])
    end
    if tp.队伍[1].锦衣佩戴[1] ~= nil and tp.队伍[1].锦衣佩戴[1].名称 ~= nil and (tp.队伍[1].变身数据 == nil or 变身显示 == false) then
    else
        self.人物['武器_静立']:置差异(self.人物['武器_静立'].帧数 - self.人物['静立'].帧数)
        self.人物['武器_行走']:置差异(self.人物['武器_行走'].帧数 - self.人物['行走'].帧数)
        self:置染色(tp.队伍[1].染色方案, tp.队伍[1].染色组[1], tp.队伍[1].染色组[2], tp.队伍[1].染色组[3])
    end
    if tp.队伍[1].装备[3].染色方案 ~= 0 and tp.队伍[1].装备[3].染色组 ~= 0 and tp.队伍[1].装备[3].染色组 ~= nil and #tp.队伍[1].装备[3].染色组 > 0 then
        self.人物['武器_静立']:置染色(tp.队伍[1].装备[3].染色方案, tp.队伍[1].装备[3].染色组[1], tp.队伍[1].装备[3].染色组[2], tp.队伍[1].装备[3].染色组[3])
        self.人物['武器_行走']:置染色(tp.队伍[1].装备[3].染色方案, tp.队伍[1].装备[3].染色组[1], tp.队伍[1].装备[3].染色组[2], tp.队伍[1].装备[3].染色组[3])
    end
    self:置方向(self.方向)
    if tp.队伍[1].锦衣佩戴[3] ~= nil and tp.队伍[1].锦衣佩戴[3].名称 ~= nil and (tp.队伍[1].变身数据 == nil or 变身显示 == false) then
        self:穿戴光环()
    else
        self:卸下光环()
    end
    if tp.队伍[1].锦衣佩戴[4] ~= nil and tp.队伍[1].锦衣佩戴[4].名称 ~= nil and (tp.队伍[1].变身数据 == nil or 变身显示 == false) then
        self:穿戴足迹()
    else
        self:卸下足迹()
    end
    -- self:穿戴翅膀()
end
function 场景类_人物:卸下锦衣()
    if tp.队伍[1].变身[1] ~= nil then
        tp.提示:写入('#Y/当前正处于变身状态中，无法取消')
        return false
    end
    --if self.人物["坐骑_静立"] ~= nil then
    --	return false
    --end
    if tp.队伍[1].装备[3] ~= nil then
        local v = tp:取武器子类(tp.队伍[1].装备[3].子类)
        local 资源 = qmxs(tp.队伍[1].模型, v)
        local m = tp:取武器附加名称(tp.队伍[1].装备[3].子类, tp.队伍[1].装备[3].级别限制, tp.队伍[1].装备[3].名称)
        local n = qmxs(m .. '_' .. tp.队伍[1].模型)

        self.人物 = {['静立'] = tp.资源:载入(资源[3], '网易WDF动画', 资源[1]), ['行走'] = tp.资源:载入(资源[3], '网易WDF动画', 资源[2])}
        self:置染色(tp.队伍[1].染色方案, tp.队伍[1].染色组[1], tp.队伍[1].染色组[2], tp.队伍[1].染色组[3])

        if tp.队伍[1].装备[3].名称 == '龙鸣寒水' or tp.队伍[1].装备[3].名称 == '非攻' then
            v = '弓弩1'
        end
        self.人物['武器_静立'] = tp.资源:载入(n[3], '网易WDF动画', n[1])
        self.人物['武器_行走'] = tp.资源:载入(n[3], '网易WDF动画', n[2])

        if tp.队伍[1].锦衣[1] ~= nil and tp.队伍[1].锦衣[1].名称 ~= nil and tp.队伍[1].变身数据 == nil then
        else
            self.人物['武器_静立']:置差异(self.人物['武器_静立'].帧数 - self.人物['静立'].帧数)
            self.人物['武器_行走']:置差异(self.人物['武器_行走'].帧数 - self.人物['行走'].帧数)
            self:置染色(tp.队伍[1].染色方案, tp.队伍[1].染色组[1], tp.队伍[1].染色组[2], tp.队伍[1].染色组[3])
        end
        if
            tp.队伍[1].装备[3].染色方案 ~= 0 and tp.队伍[1].装备[3].染色组 ~= 0 and tp.队伍[1].装备[3].染色组 ~= nil and
                #tp.队伍[1].装备[3].染色组 > 0
         then
            self.人物['武器_静立']:置染色(
                tp.队伍[1].装备[3].染色方案,
                tp.队伍[1].装备[3].染色组[1],
                tp.队伍[1].装备[3].染色组[2],
                tp.队伍[1].装备[3].染色组[3]
            )
            self.人物['武器_行走']:置染色(
                tp.队伍[1].装备[3].染色方案,
                tp.队伍[1].装备[3].染色组[1],
                tp.队伍[1].装备[3].染色组[2],
                tp.队伍[1].装备[3].染色组[3]
            )
        end
    end
    self:置方向(self.方向)
    if tp.坐骑 ~= nil and tp.队伍[1].变身数据 == nil then
        self:坐骑改变(tp.队伍[1].模型, tp.坐骑)
    end
    if tp.队伍[1].锦衣[2] ~= nil and tp.队伍[1].锦衣[2].名称 ~= nil then
        self:穿戴光环()
    else
        self:卸下光环()
    end
    if tp.队伍[1].锦衣[3] ~= nil and tp.队伍[1].锦衣[3].名称 ~= nil then
        self:穿戴足迹()
    else
        self:卸下足迹()
    end
    if tp.队伍[1].锦衣[4] ~= nil and tp.队伍[1].锦衣[4].名称 ~= nil then
        self:穿戴翅膀()
    else
        self:卸下翅膀()
    end
end
function 场景类_人物:卸下装备()
    if self.人物['坐骑_静立'] ~= nil then
        if 引擎.取站立坐骑(tp.队伍[1].坐骑.模型) ~= nil then
            self.人物['武器_静立'] = nil
            self.人物['武器_行走'] = nil
        end
        return false
    end
    local 资源 = qmxs(tp.队伍[1].模型)
    if tp.队伍[1].锦衣佩戴[1] ~= nil and tp.队伍[1].锦衣佩戴[1].名称 ~= nil and (tp.队伍[1].变身数据 == nil or 变身显示 == false) then
        if
            tp.队伍[1].锦衣佩戴[1].名称 == '夜影' or tp.队伍[1].锦衣佩戴[1].名称 == '夏日清凉' or tp.队伍[1].锦衣佩戴[1].名称 == '华风汉雅' or
                tp.队伍[1].锦衣佩戴[1].名称 == '萌萌小厨'
         then
            临时资源 = qzdjy(tp.队伍[1].模型 .. '_静立_' .. tp.队伍[1].锦衣佩戴[1].名称)
            临时资源1 = qzdjy(tp.队伍[1].模型 .. '_行走_' .. tp.队伍[1].锦衣佩戴[1].名称)
            临时资源包 = 'shape0.npk'
            if tp.队伍[1].锦衣佩戴[1].名称 == '华风汉雅' or tp.队伍[1].锦衣佩戴[1].名称 == '萌萌小厨' then
                临时资源包 = 'shape2.npk'
            end
            self.人物 = {['静立'] = tp.资源:载入(临时资源包, '网易锦衣动画', 临时资源), ['行走'] = tp.资源:载入(临时资源包, '网易锦衣动画', 临时资源1)}
            if tp.队伍[1].锦衣佩戴[1].名称 == '夏日清凉' or tp.队伍[1].锦衣佩戴[1].名称 == '华风汉雅' or tp.队伍[1].锦衣佩戴[1].名称 == '萌萌小厨' then
                临时资源 = qzdjys(tp.队伍[1].模型 .. '_静立_' .. tp.队伍[1].锦衣佩戴[1].名称 .. '_头')
                临时资源1 = qzdjys(tp.队伍[1].模型 .. '_行走_' .. tp.队伍[1].锦衣佩戴[1].名称 .. '_头')
                self.人物['身体_静立'] = tp.资源:载入('shape0.npk', '网易锦衣动画', 临时资源)
                self.人物['身体_行走'] = tp.资源:载入('shape0.npk', '网易锦衣动画', 临时资源1)
            end
        else
            资源 = qmxs(tp.队伍[1].锦衣佩戴[1].名称 .. '_' .. tp.队伍[1].模型)
            self.人物 = {['静立'] = tp.资源:载入(资源[3], '网易WDF动画', 资源[1]), ['行走'] = tp.资源:载入(资源[3], '网易WDF动画', 资源[2])}
        end
    else
        self.人物 = {['静立'] = tp.资源:载入(资源[3], '网易WDF动画', 资源[1]), ['行走'] = tp.资源:载入(资源[3], '网易WDF动画', 资源[2])}
    end
    self.人物['武器_静立'] = nil
    self.人物['武器_行走'] = nil
    if (tp.队伍[1].锦衣佩戴[1] ~= nil and tp.队伍[1].锦衣佩戴[1].名称 ~= nil) or (tp.队伍[1].变身数据 == nil or 变身显示 == false) then
    else
        self:置染色(tp.队伍[1].染色方案, tp.队伍[1].染色组[1], tp.队伍[1].染色组[2], tp.队伍[1].染色组[3])
        self:置方向(self.方向)
    end
    if tp.队伍[1].锦衣佩戴[3] ~= nil and tp.队伍[1].锦衣佩戴[3].名称 ~= nil then
        self:穿戴光环()
    else
        self:卸下光环()
    end
    if tp.队伍[1].锦衣佩戴[4] ~= nil and tp.队伍[1].锦衣佩戴[4].名称 ~= nil then
        self:穿戴足迹()
    else
        self:卸下足迹()
    end
    -- self:穿戴翅膀()
end

function 场景类_人物:穿戴光环()
    if tp.队伍[1].变身[1] ~= nil then
        tp.提示:写入('#Y/当前正处于变身状态中，无法取消')
        return false
    end
    local n = 引擎.取光环(tp.队伍[1].锦衣佩戴[3].名称)
    self.人物['光环_静立'] = tp.资源:载入(n[4], '网易假人动画', n[1])
    self.人物['光环_行走'] = tp.资源:载入(n[4], '网易假人动画', n[2])
    self:置方向(self.方向)
end

function 场景类_人物:卸下光环()
    self.人物['光环_静立'] = nil
    self.人物['光环_行走'] = nil
end

function 场景类_人物:穿戴足迹()
    if tp.队伍[1].变身[1] ~= nil then
        tp.提示:写入('#Y/当前正处于变身状态中，无法取消')
        return false
    end
    local n = 引擎.取足迹(tp.队伍[1].锦衣佩戴[4].名称)
    self.人物['足迹_行走'] = tp.资源:载入(n[4], '网易假人动画', n[1])
    self:置方向(self.方向)
end

function 场景类_人物:卸下足迹()
    self.人物['足迹_行走'] = nil
end

function 场景类_人物:穿戴翅膀()
    if tp.队伍[1].变身[1] ~= nil then
        tp.提示:写入('#Y/当前正处于变身状态中，无法取消')
        return false
    end
    -- local n = qmxs(tp.队伍[1].灵饰[5].名称)
    -- self.人物["翅膀_静立"] = pwd("54")
    -- self.人物["翅膀_行走"] = pwd("54")
    self:置方向(self.方向)
end

function 场景类_人物:卸下翅膀()
    self.人物['翅膀_静立'] = nil
    self.人物['翅膀_行走'] = nil
end

function 场景类_人物:加入动画(动画)
    insert(self.特效组, tp:载入特效(动画))
end

function 场景类_人物:置模型3()
    local mx = tp.队伍[1].模型
    if tp.队伍[1].变身数据 ~= nil and 变身显示 then
        mx = tp.队伍[1].变身数据
    end
    self.方向 = 1
    local 资源 = qmxs(mx)
    if (tp.队伍[1].变身数据 == nil or 变身显示 == false) then
        if tp.队伍[1].锦衣佩戴[1] ~= nil and tp.队伍[1].锦衣佩戴[1].名称 ~= nil then
            if
                tp.队伍[1].锦衣佩戴[1].名称 == '夜影' or tp.队伍[1].锦衣佩戴[1].名称 == '夏日清凉' or tp.队伍[1].锦衣佩戴[1].名称 == '华风汉雅' or
                    tp.队伍[1].锦衣佩戴[1].名称 == '萌萌小厨'
             then
                临时资源 = qzdjy(mx .. '_静立_' .. tp.队伍[1].锦衣佩戴[1].名称)
                临时资源1 = qzdjy(mx .. '_行走_' .. tp.队伍[1].锦衣佩戴[1].名称)
                临时资源包 = 'shape0.npk'
                if tp.队伍[1].锦衣佩戴[1].名称 == '华风汉雅' or tp.队伍[1].锦衣佩戴[1].名称 == '萌萌小厨' then
                    临时资源包 = 'shape2.npk'
                end
                self.人物 = {['静立'] = tp.资源:载入(临时资源包, '网易锦衣动画', 临时资源), ['行走'] = tp.资源:载入(临时资源包, '网易锦衣动画', 临时资源1)}
                if tp.队伍[1].锦衣佩戴[1].名称 == '夏日清凉' or tp.队伍[1].锦衣佩戴[1].名称 == '华风汉雅' or tp.队伍[1].锦衣佩戴[1].名称 == '萌萌小厨' then
                    临时资源 = qzdjys(mx .. '_静立_' .. tp.队伍[1].锦衣佩戴[1].名称 .. '_头')
                    临时资源1 = qzdjys(mx .. '_行走_' .. tp.队伍[1].锦衣佩戴[1].名称 .. '_头')
                    self.人物['身体_静立'] = tp.资源:载入('shape0.npk', '网易锦衣动画', 临时资源)
                    self.人物['身体_行走'] = tp.资源:载入('shape0.npk', '网易锦衣动画', 临时资源1)
                end
            else
                资源 = qmxs(tp.队伍[1].锦衣佩戴[1].名称 .. '_' .. mx)
                self.人物 = {['静立'] = tp.资源:载入(资源[3], '网易WDF动画', 资源[1]), ['行走'] = tp.资源:载入(资源[3], '网易WDF动画', 资源[2])}
            end
        else
            self.人物 = {['静立'] = tp.资源:载入(资源[3], '网易WDF动画', 资源[1]), ['行走'] = tp.资源:载入(资源[3], '网易WDF动画', 资源[2])}
        end
    else
        self.人物 = {['静立'] = tp.资源:载入(资源[3], '网易WDF动画', 资源[1]), ['行走'] = tp.资源:载入(资源[3], '网易WDF动画', 资源[2])}
        if tp.队伍[1].变异 and 染色信息[mx] ~= nil then
            self.染色方案 = 染色信息[mx].id
            self.染色组 = 染色信息[mx].方案
            self:置染色(self.染色方案, self.染色组[1], self.染色组[2], self.染色组[3])
            self:置方向(self.方向)
        end
    end
    tp.队伍[1]:刷新信息()
    if tp.队伍[1].装备[3] ~= nil and (tp.队伍[1].变身数据 == nil or 变身显示 == false) then
        self:穿戴装备()
    else
        -- if (tp.队伍[1].锦衣佩戴[1] ~= nil and tp.队伍[1].锦衣佩戴[1].名称 ~= nil) or (tp.队伍[1].变身数据 ~= nil and 变身显示)  then
        -- else
        -- 	self:置染色(tp.队伍[1].染色方案,tp.队伍[1].染色组[1],tp.队伍[1].染色组[2],tp.队伍[1].染色组[3])
        -- 	self:置方向(self.方向)
        -- end
    end
    -- if tp.队伍[1].坐骑 ~= nil  and (tp.队伍[1].变身数据 == nil or 变身显示 == false) then
    -- 	self:坐骑改变(mx,tp.队伍[1].坐骑)
    -- end
    -- if tp.队伍[1].锦衣佩戴[3] ~= nil and tp.队伍[1].锦衣佩戴[3].名称 ~= nil and (tp.队伍[1].变身数据 == nil or 变身显示 == false)  then
    -- 	self:穿戴光环()
    --    else
    --    	self:卸下光环()
    -- end
    -- if tp.队伍[1].锦衣佩戴[4] ~= nil and tp.队伍[1].锦衣佩戴[4].名称 ~= nil and (tp.队伍[1].变身数据 == nil or 变身显示 == false)  then
    -- 	self:穿戴足迹()
    --    else
    --    	self:卸下足迹()
    -- end
    -- self:穿戴翅膀()
    self:置方向(self.方向)
    坐骑补差x, 坐骑补差y = 0, 0
end

function 场景类_人物:置模型4()
    local mx = tp.队伍[1].模型
    if tp.队伍[1].变身数据 ~= nil and 变身显示 then
        mx = tp.队伍[1].变身数据
    end
    self.方向 = 1
    local 资源 = qmxs(mx)
    self.人物 = {['静立'] = tp.资源:载入(资源[3], '网易WDF动画', 资源[1]), ['行走'] = tp.资源:载入(资源[3], '网易WDF动画', 资源[2])}
    -- if tp.队伍[1].变异 and 染色信息[mx]~=nil then
    --     self.染色方案 = 染色信息[mx].id
    -- 	self.染色组 = 染色信息[mx].方案
    --    	self:置染色(self.染色方案,self.染色组[1],self.染色组[2],self.染色组[3])
    -- 	self:置方向(self.方向)
    -- end
    tp.队伍[1]:刷新信息()
    if tp.队伍[1].装备[3] ~= nil and (tp.队伍[1].变身数据 == nil or 变身显示 == false) then
        self:穿戴装备()
    else
        -- if (tp.队伍[1].锦衣佩戴[1] ~= nil and tp.队伍[1].锦衣佩戴[1].名称 ~= nil) or (tp.队伍[1].变身数据 ~= nil and 变身显示)  then
        -- else
        -- 	self:置染色(tp.队伍[1].染色方案,tp.队伍[1].染色组[1],tp.队伍[1].染色组[2],tp.队伍[1].染色组[3])
        -- 	self:置方向(self.方向)
        -- end
    end
    -- if tp.队伍[1].坐骑 ~= nil  and (tp.队伍[1].变身数据 == nil or 变身显示 == false) then
    -- 	self:坐骑改变(mx,tp.队伍[1].坐骑)
    -- end
    -- if tp.队伍[1].锦衣佩戴[3] ~= nil and tp.队伍[1].锦衣佩戴[3].名称 ~= nil and (tp.队伍[1].变身数据 == nil or 变身显示 == false)  then
    -- 	self:穿戴光环()
    --    else
    --    	self:卸下光环()
    -- end
    -- if tp.队伍[1].锦衣佩戴[4] ~= nil and tp.队伍[1].锦衣佩戴[4].名称 ~= nil and (tp.队伍[1].变身数据 == nil or 变身显示 == false)  then
    -- 	self:穿戴足迹()
    --    else
    --    	self:卸下足迹()
    -- end
    -- self:穿戴翅膀()
    self:置方向(self.方向)
    --坐骑补差x,坐骑补差y=0,0
end

return 场景类_人物
