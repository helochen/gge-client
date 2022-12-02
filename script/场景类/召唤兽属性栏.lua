--======================================================================--
--	☆ 作者：飞蛾扑火 QQ：1415559882
--======================================================================--
local 场景类_召唤兽属性栏 = class()
local tx = 引擎.取头像
local bw = require('gge包围盒')(0, 0, 140, 34)
local box = 引擎.画矩形
local ani = 引擎.取战斗模型
local format = string.format
local floor = math.floor
local min = math.min
local max = math.max
local tp, zts, zts1, zts2, ztstt3
local ceil = math.ceil
local tostring = tostring
local bd0 = {'气血', '魔法', '攻击', '防御', '速度', '灵力'}
local bd = {'体质', '魔力', '力量', '耐力', '敏捷'}
local mousea = 引擎.鼠标按住
local mouseb = 引擎.鼠标弹起
local insert = table.insert

function 场景类_召唤兽属性栏:初始化(根)
    self.ID = 7
    self.x = 0
    self.y = 35
    self.xx = 0
    self.yy = 0
    self.注释 = '召唤兽属性栏'
    self.可视 = false
    self.鼠标 = false
    self.焦点 = false
    self.可移动 = true

    self.控件类 = require('ggeui/加载类')()
    local 总控件 = self.控件类:创建控件('召唤兽总控件')
    总控件:置可视(true, true)
    self.名称输入框 = 总控件:创建输入('名称输入', 0, 0, 100, 14)
    self.名称输入框:置可视(false, false)
    self.名称输入框:置限制字数(12)
    self.名称输入框:置光标颜色(-16777216)
    self.名称输入框:置文字颜色(-16777216)
    self.临时潜力 = {}
    self.预览属性 = {}
    for i = 0, 17 do
        self.临时潜力[i] = {体质 = 0, 魔力 = 0, 力量 = 0, 耐力 = 0, 敏捷 = 0}
        self.预览属性[i] = {气血 = 0, 魔法 = 0, 伤害 = 0, 速度 = 0, 灵力 = 0, 防御 = 0}
    end
    tp = 根
    zts = tp.字体表.普通字体
    zts1 = tp.字体表.普通字体__
    zts2 = tp.字体表.描边字体
    ztstt3 = tp.字体表.描边字体
end

function 场景类_召唤兽属性栏:打开()
    if self.可视 then
        for i = 1, 7 do
            if tp.队伍[1] ~= nil and tp.队伍[1].宝宝列表[i] ~= nil then
                tp.队伍[1].宝宝列表[i].潜力 =
                    tp.队伍[1].宝宝列表[i].潜力 +
                    (self.临时潜力[i].体质 + self.临时潜力[i].魔力 + self.临时潜力[i].力量 + self.临时潜力[i].耐力 + self.临时潜力[i].敏捷)
            end
            self.临时潜力[i] = {体质 = 0, 魔力 = 0, 力量 = 0, 耐力 = 0, 敏捷 = 0}
            self.预览属性[i] = {气血 = 0, 魔法 = 0, 伤害 = 0, 速度 = 0, 灵力 = 0, 防御 = 0}
        end
        self.加入 = 0
        self.选中 = 0
        self.拽拖计次 = 0
        self.拽拖对象 = 0
        self.拽拖事件 = 0
        self.插入选区 = 0
        self.头像组 = {}
        self.窗口时间 = 0
        self.名称输入框:置可视(false, false)
        self.可视 = false
        self:加载数据()
        self.资源组[35]:置起始点(0)
        if tp.窗口.召唤兽资质栏.可视 then
            tp.窗口.召唤兽资质栏:打开()
        end
        self.资源组 = nil
        self.头像组 = nil
        return
    else
        insert(tp.窗口_, self)
        self:加载数据()
        for i = 1, #tp.队伍[1].宝宝列表 do
            if tp.队伍[1].宝宝列表[i] ~= nil and tp.队伍[1].宝宝列表[i].参战信息 ~= nil then
                if i > 4 then
                    self.加入 = i - 4
                --self.资源组[35]:置起始点(self.资源组[35]:取百分比转换(self.加入,4,#tp.队伍[1].宝宝列表))
                end
                self.选中 = i
                self.名称输入框:置文本(tp.队伍[1].宝宝列表[self.选中].名称)
                self.名称输入框:置可视(true, true)
                if tp.窗口.召唤兽资质栏.可视 then
                    tp.窗口.召唤兽资质栏:打开(tp.队伍[1].宝宝列表[self.选中])
                end
                self:置形象()
                self.拽拖计次 = 0
                break
            end
        end
        self.加入 = 0
        self.选中 = 0
        self.拽拖计次 = 0
        self.拽拖对象 = 0
        self.拽拖事件 = 0
        self.插入选区 = 0
        self.操作 = nil
        self.窗口时间 = 0
        tp.运行时间 = tp.运行时间 + 1
        self.窗口时间 = tp.运行时间
        self.可视 = true
    end
end

function 场景类_召唤兽属性栏:加载数据()
    local 资源 = tp.资源
    local 按钮 = tp._按钮
    local 自适应 = tp._自适应
    self.资源组 = {
        [0] = 自适应.创建(1, 1, 332, 18, 1, 3, nil, 18),
        [1] = 自适应.创建(0, 1, 370, 453, 3, 9),
        [2] = 按钮.创建(自适应.创建(18, 4, 16, 16, 4, 3), 0, 0, 4, true, true),
        [3] = 按钮.创建(自适应.创建(12, 4, 43, 22, 1, 3), 0, 0, 4, true, true, '参战'),
        [4] = 按钮.创建(自适应.创建(12, 4, 43, 22, 1, 3), 0, 0, 4, true, true, '改名'),
        [5] = 按钮.创建(自适应.创建(25, 4, 19, 19, 4, 3), 0, 0, 4, true, true),
        [6] = 按钮.创建(自适应.创建(25, 4, 19, 19, 4, 3), 0, 0, 4, true, true),
        [7] = 按钮.创建(自适应.创建(25, 4, 19, 19, 4, 3), 0, 0, 4, true, true),
        [8] = 按钮.创建(自适应.创建(25, 4, 19, 19, 4, 3), 0, 0, 4, true, true),
        [9] = 按钮.创建(自适应.创建(25, 4, 19, 19, 4, 3), 0, 0, 4, true, true),
        [10] = 按钮.创建(自适应.创建(26, 4, 19, 19, 4, 3), 0, 0, 4, true, true),
        [11] = 按钮.创建(自适应.创建(26, 4, 19, 19, 4, 3), 0, 0, 4, true, true),
        [12] = 按钮.创建(自适应.创建(26, 4, 19, 19, 4, 3), 0, 0, 4, true, true),
        [13] = 按钮.创建(自适应.创建(26, 4, 19, 19, 4, 3), 0, 0, 4, true, true),
        [14] = 按钮.创建(自适应.创建(26, 4, 19, 19, 4, 3), 0, 0, 4, true, true),
        [15] = 按钮.创建(自适应.创建(12, 4, 72, 22, 1, 3), 0, 0, 4, true, true, '推荐加点'),
        [16] = 按钮.创建(自适应.创建(12, 4, 43, 22, 1, 3), 0, 0, 4, true, true, '预览'),
        [17] = 按钮.创建(自适应.创建(12, 4, 43, 22, 1, 3), 0, 0, 4, true, true, '繁殖'),
        [18] = 按钮.创建(自适应.创建(12, 4, 43, 22, 1, 3), 0, 0, 4, true, true, '放生'),
        [19] = 按钮.创建(自适应.创建(12, 4, 43, 22, 1, 3), 0, 0, 4, true, true, '鉴定'),
        [20] = 按钮.创建(自适应.创建(12, 4, 43, 22, 1, 3), 0, 0, 4, true, true, '认证'),
        [21] = 按钮.创建(自适应.创建(12, 4, 72, 22, 1, 3), 0, 0, 4, true, true, '确认加点'),
        [22] = 按钮.创建(自适应.创建(12, 4, 72, 22, 1, 3), 0, 0, 4, true, true, '查看资质'),
        [23] = 资源:载入('wzife.wdf', '网易WDF动画', 0x363AAF1B),
        [26] = 资源:载入('wzife.wd4', '网易WDF动画', 0x3906F9F1),
         --经验
        [27] = 按钮.创建(自适应.创建(20, 4, 18, 19, 4, 3), 0, 0, 4, true, true),
         --上滚动
        [28] = 按钮.创建(自适应.创建(21, 4, 18, 19, 4, 3), 0, 0, 4, true, true),
         --下滚动
        [29] = 自适应.创建(34, 1, 173, 182, 3, 9),
         --召唤兽选择框
        [30] = 资源:载入(tp.造型背景, '网易WDF动画', 0xA19838E8),
         --宠物显示框
        [31] = 自适应.创建(3, 1, 109, 19, 1, 3),
        [32] = 自适应.创建(3, 1, 97, 19, 1, 3),
        [33] = 自适应.创建(3, 1, 40, 19, 1, 3),
        [34] = 按钮.创建(tp.资源:载入('wzife.wd4', '网易WDF动画', 0x22E95BB5), 0, 0, 3, true, true),
        [35] = tp._滑块.创建(自适应.创建(11, 4, 15, 40, 2, 3, nil), 4, 14, 143, 2),
        [36] = 资源:载入('wzife.wdf', '网易WDF动画', 0X96AE4546),
        [37] = 按钮.创建(自适应.创建(12, 4, 43, 22, 1, 3), 0, 0, 4, true, true, '扩展')
    }
    self.资源组[22]:置偏移(0, 3)
    for i = 2, 28 do
        if i ~= 23 and i ~= 24 and i ~= 25 and i ~= 26 then
            self.资源组[i]:绑定窗口_(7)
        end
    end
    self.头像组 = {}

    local 格子 = require('script/显示类/物品_格子2')
    self.饰品 = {}
    for i = 1, 1 do
        self.饰品[i] = 格子(0, 0, i, '道具行囊_灵饰', 资源:载入('wzife.wd2', '网易WDF动画', 0xA4F1E391))
    end
    self.追加法术 = 资源:载入('wzife.wdf', '网易WDF动画', 0xef45cdc6)
end

function 场景类_召唤兽属性栏:置形象()
    self.资源组[24] = nil
    self.资源组[25] = nil
    self.资源组[40] = nil
    if tp.队伍[1].宝宝列表[self.选中] ~= nil then
        if tp.队伍[1].宝宝列表[self.选中].饰品 ~= nil then
            n = 引擎.取模型(tp.队伍[1].宝宝列表[self.选中].模型 .. '_饰品')
            self.资源组[25] = tp.资源:载入(n[3], '网易WDF动画', n[1])
            self.资源组[25]:置方向(0)

            local wp = tp._物品
            local qq = wp()
            qq:置对象(tp.队伍[1].宝宝列表[self.选中].模型 .. '饰品')
            self.饰品[1]:置物品(qq)
            self.饰品[1].物品.总类 = 57
            self.饰品[1].物品.玄天灵力 = tp.队伍[1].宝宝列表[self.选中].饰品.玄天灵力 or 0
            if tp.队伍[1].宝宝列表[self.选中].饰品.染色方案 ~= nil then
                self.资源组[25]:置染色(
                    tp.队伍[1].宝宝列表[self.选中].饰品.染色方案,
                    tp.队伍[1].宝宝列表[self.选中].饰品.染色组[1],
                    tp.队伍[1].宝宝列表[self.选中].饰品.染色组[2],
                    tp.队伍[1].宝宝列表[self.选中].饰品.染色组[3]
                )
                self.资源组[25]:置方向(0)
            end
        end

        if tp.队伍[1].宝宝列表[self.选中].模型 == '贪狼' then
            self.资源组[24] = pwd('53')
            self.资源组[24]:置方向(0)
            if tp.队伍[1].宝宝列表[self.选中].染色方案 ~= nil and tp.队伍[1].宝宝列表[self.选中].染色组 ~= nil then
                self.资源组[24]:置染色(
                    tp.队伍[1].宝宝列表[self.选中].染色方案,
                    tp.队伍[1].宝宝列表[self.选中].染色组[1],
                    tp.队伍[1].宝宝列表[self.选中].染色组[2],
                    tp.队伍[1].宝宝列表[self.选中].染色组[3]
                )
                self.资源组[24]:置方向(0)
            end
        else
            local n = ani(tp.队伍[1].宝宝列表[self.选中].模型)
            self.资源组[24] = tp.资源:载入(n[10], '网易WDF动画', n[6])
            self.资源组[24]:置方向(0)
            -- if ani(tp.队伍[1].宝宝列表[self.选中].模型.."_饰品") ~= nil and #ani(tp.队伍[1].宝宝列表[self.选中].模型.."_饰品") ~= 0 then
            -- 	n = ani(tp.队伍[1].宝宝列表[self.选中].模型.."_饰品")
            -- 	self.资源组[25] = tp.资源:载入(n[10],"网易WDF动画",n[6])
            -- 	self.资源组[25]:置方向(0)
            -- end
            if tp.队伍[1].宝宝列表[self.选中].染色方案 ~= nil and tp.队伍[1].宝宝列表[self.选中].染色组 ~= nil then
                self.资源组[24]:置染色(
                    tp.队伍[1].宝宝列表[self.选中].染色方案,
                    tp.队伍[1].宝宝列表[self.选中].染色组[1],
                    tp.队伍[1].宝宝列表[self.选中].染色组[2],
                    tp.队伍[1].宝宝列表[self.选中].染色组[3]
                )
                self.资源组[24]:置方向(0)
            end
        end
    end
end
function 场景类_召唤兽属性栏:放生()
    if self.可视 then
        self.临时潜力[self.选中] = {体质 = 0, 魔力 = 0, 力量 = 0, 耐力 = 0, 敏捷 = 0}
        self.预览属性[self.选中] = {气血 = 0, 魔法 = 0, 伤害 = 0, 速度 = 0, 灵力 = 0, 防御 = 0}
        if tp.窗口.道具行囊.可视 and tp.窗口.道具行囊.窗口 == '召唤兽' then
            if bb == tp.队伍[1].宝宝列表[tp.窗口.道具行囊.选中召唤兽] then
                tp.窗口.道具行囊.选中召唤兽 = 0
                tp.窗口.道具行囊.资源组[4] = nil
                for s = 1, 3 do
                    tp.窗口.道具行囊.召唤兽装备[s]:置物品(nil)
                end
            end
        end
        if v == 19 then
            table.insert(tp.召唤兽仓库, bb)
        end
        table.remove(tp.队伍[1].宝宝列表, self.选中)
        self.名称输入框:置可视(false, false)
        if tp.窗口.召唤兽资质栏.可视 then
            tp.窗口.召唤兽资质栏:打开()
        end
        self.选中 = 0
        self.加入 = max(self.加入 - 1, 0)
        self:置形象()
        if 禁止 == nil then
            self:打开()
            if 开发调试 then
                local pb_data = {
                    version = 版本,
                    action = 6 -- 宠物请求
                }
                客户端:发送PB数据(100, pb_data)
            else
                发送数据(5001)
            end
        end
    end
end
function 场景类_召唤兽属性栏:显示(dt, x, y)
    -- 变量
    local bbs = tp.队伍[1].宝宝列表
    local bbsa = #bbs
    local bb, ls, yl
    if self.选中 ~= 0 then
        bb = bbs[self.选中]
        ls = self.临时潜力[self.选中]
        yl = self.预览属性[self.选中]
        if bb.助战参战 == nil then
            if bb ~= nil and bb.参战信息 ~= nil then
                self.资源组[3]:置文字('休息')
            else
                self.资源组[3]:置文字('参战')
            end
        else
            self.资源组[3]:置文字('助战')
        end
    end
    -- 更新
    self.资源组[37]:更新(x, y)
    self.焦点 = false
    self.资源组[2]:更新(x, y)
    self.资源组[3]:更新(x, y, bb ~= nil and bb.助战参战 == nil)
    self.资源组[4]:更新(x, y, bb ~= nil)
    self.资源组[34]:更新(x, y)
    for i = 5, 9 do
        self.资源组[i]:更新(x, y, bb ~= nil and bb.潜力 > 0, 1)
        if self.资源组[i]:事件判断() then
            bb.潜力 = bb.潜力 - 1
            ls[bd[i - 4]] = ls[bd[i - 4]] + 1
        end
    end
    for i = 10, 14 do
        self.资源组[i]:更新(x, y, bb ~= nil and ls ~= nil and ls[bd[i - 9]] ~= nil and ls[bd[i - 9]] > 0, 1)
        if self.资源组[i]:事件判断() then
            bb.潜力 = bb.潜力 + 1
            ls[bd[i - 9]] = ls[bd[i - 9]] - 1
        end
    end
    self.资源组[15]:更新(x, y, bb ~= nil and bb.潜力 > 0)
    self.资源组[16]:更新(x, y, bb ~= nil)
    self.资源组[17]:更新(x, y, bb ~= nil)
    self.资源组[18]:更新(x, y, bb ~= nil)
    self.资源组[19]:更新(x, y, bb ~= nil)
    self.资源组[20]:更新(x, y, bb ~= nil)
    self.资源组[21]:更新(x, y, bb ~= nil)
    self.资源组[22]:更新(x, y, bb ~= nil)
    -- 显示
    self.资源组[1]:显示(self.x, self.y)
    self.资源组[0]:显示(self.x + 6, self.y + 3)
    tp.窗口标题背景_:置区域(0, 0, 92, 16)
    tp.窗口标题背景_:显示(self.x + 132, self.y + 3)
    zts2:置字间距(2)
    zts2:显示(self.x + 138, self.y + 3, '召唤兽属性')
    zts2:置字间距(0)
    self.资源组[37]:显示(self.x + 153, self.y + 218)
    if self.资源组[37]:事件判断() then
        发送数据(109.9)
    end
    self.资源组[29]:显示(self.x + 12, self.y + 29)
    self.资源组[30]:显示(self.x + 197, self.y + 28)
    self.资源组[31]:显示(self.x + 197, self.y + 217)
    tp.经验背景_:显示(self.x + 55, self.y + 423)
    zts:置颜色(4294967295)
    zts:显示(self.x + 10, self.y + 222, '召唤兽携带数量：' .. bbsa .. '/12')
    zts:显示(self.x + 21, self.y + 427, '经验')
    if bb == nil then
        zts:显示(self.x + 200, self.y + 194, '参战等级：--')
    else
        zts:显示(self.x + 200, self.y + 194, '参战等级：' .. bb.参战等级)
    end
    for i = 0, 5 do
        self.资源组[32]:显示(self.x + 54, self.y + 243 + i * 24)
        zts:显示(self.x + 20, self.y + 247 + i * 24, bd0[i + 1])
    end
    for i = 0, 4 do
        self.资源组[31]:显示(self.x + 197, self.y + 243 + i * 24)
        zts:显示(self.x + 163, self.y + 247 + i * 24, bd[i + 1])
    end
    zts:置颜色(-1404907)
    zts:显示(self.x + 20, self.y + 397, '忠诚')
    zts:显示(self.x + 163, self.y + 367, '潜能')
    self.资源组[33]:显示(self.x + 53, self.y + 393)
    self.资源组[33]:显示(self.x + 193, self.y + 363)
    self.资源组[2]:显示(self.x + 344, self.y + 6)
    self.资源组[3]:显示(self.x + 310, self.y + 186)
    self.资源组[4]:显示(self.x + 310, self.y + 215)
    for i = 5, 9 do
        self.资源组[i]:显示(self.x + 309, self.y + 242 + ((i - 5) * 25))
    end
    for i = 10, 14 do
        self.资源组[i]:显示(self.x + 330, self.y + 242 + ((i - 10) * 25))
    end
    self.资源组[15]:显示(self.x + 242, self.y + 365, true)
    self.资源组[16]:显示(self.x + 315, self.y + 366, true)
    self.资源组[17]:显示(self.x + 100, self.y + 393, true)
    self.资源组[18]:显示(self.x + 147, self.y + 393, true)
    self.资源组[19]:显示(self.x + 194, self.y + 393, true)
    self.资源组[20]:显示(self.x + 241, self.y + 393, true)
    self.资源组[21]:显示(self.x + 288, self.y + 393, true)
    self.资源组[22]:显示(self.x + 288, self.y + 418, true)

    if bb ~= nil and bb.饰品 ~= nil then
        self.饰品[1]:置坐标(self.x + 200, self.y + 145)
        self.饰品[1]:显示(dt, x, y, self.鼠标)
        if self.饰品[1].物品 ~= nil and self.饰品[1].焦点 then
            tp.提示:道具行囊(x, y, self.饰品[1].物品, true)
        end
    end

    tp.画线:置区域(0, 0, 15, 159)
     --滑块虚线
    tp.画线:显示(self.x + 171, self.y + 34)
    if bbsa > 4 then
        self.资源组[35]:置高度(min(floor(143 / (bbsa - 4)), 104))
        self.加入 = min(ceil((bbsa - 4) * self.资源组[35]:取百分比()), bbsa - 4)
    end
    self.资源组[27]:更新(x, y, self.加入 > 0)
    self.资源组[28]:更新(x, y, self.加入 < bbsa - 4)
    self.资源组[27]:显示(self.x + 167, self.y + 31)
    self.资源组[28]:显示(self.x + 167, self.y + 193)
    if bbsa > 4 then
        self.资源组[35]:显示(self.x + 168, self.y + 50, x, y, self.鼠标)
    end
    -- 真
    zts:置颜色(-16777216)
    for i = 1, 4 do
        if bbs[i + self.加入] ~= nil then
            local jx = self.x + 18
            local jy = self.y + (i * 43) - 6
            bw:置坐标(jx, jy + 1)
            if self.头像组[i + self.加入] == nil then
                local n = tx(bbs[i + self.加入].模型)
                self.头像组[i + self.加入] = tp.资源:载入(n[7], '网易WDF动画', n[1])
            end
            -- 拽拖
            local xz = bw:检查点(x, y)
            if not self.资源组[35].接触 and xz and self.鼠标 and not tp.消息栏焦点 and self.拽拖对象 == 0 then
                if mousea(0) then
                    self.拽拖计次 = self.拽拖计次 + 1
                    if self.拽拖计次 >= 28 then
                        self.拽拖对象 = i + self.加入
                        self.拽拖事件 = {self.头像组[i + self.加入]}
                        self.拽拖计次 = 0
                    end
                end
            end
            -- 其他
            if self.选中 ~= i + self.加入 then
                if not self.资源组[35].接触 and xz and not tp.消息栏焦点 and self.鼠标 then
                    if self.拽拖对象 ~= 0 then
                        box(jx + 70, jy + 34, jx + 125, jy + 39, -16777216)
                        self.插入选区 = i + self.加入
                    end
                    if mouseb(0) and self.拽拖对象 == 0 then
                        self.选中 = i + self.加入
                        self.名称输入框:置文本(bbs[self.选中].名称)
                        self.名称输入框:置可视(true, true)
                        if tp.窗口.召唤兽资质栏.可视 then
                            tp.窗口.召唤兽资质栏:打开(bbs[self.选中])
                        end
                        self:置形象()
                        self.拽拖计次 = 0
                    end
                    self.焦点 = true
                end
            else
                if not self.资源组[35].接触 and xz and not tp.消息栏焦点 and self.鼠标 then
                    self.焦点 = true
                end
                if self.拽拖对象 ~= i + self.加入 then
                    box(jx - 1, jy - 3, jx + 142, jy + 41, -10790181)
                end
            end
            self.资源组[23]:显示(jx + 1, jy)
            self.头像组[i + self.加入]:显示(jx + 4, jy + 4)
            if bbs[i + self.加入].参战信息 ~= nil then
                zts:置颜色(-256)
            else
                zts:置颜色(-16777216)
            end
            zts:显示(jx + 41, jy + 3, bbs[i + self.加入].名称)
            zts:显示(jx + 41, jy + 21, bbs[i + self.加入].等级 .. '级')
            if bbs[i + self.加入].被统御 ~= nil then
                zts2:显示(jx + 91, jy + 21, bbs[i + self.加入].被统御 .. '号助战')
            end
        end
    end
    if bb ~= nil then
        local jx = self.x + 280
        local jy = self.y + 145
        tp.影子:显示(jx, jy)
        if self.资源组[24] ~= nil then
            self.资源组[24]:更新(dt)
            self.资源组[24]:显示(jx, jy)
        end
        self.资源组[36]:显示(self.x + 200, self.y + 40)
        if self.资源组[25] ~= nil then
            self.资源组[25]:更新(dt)
            self.资源组[25]:显示(jx, jy)
        end
        if self.资源组[40] ~= nil then
            self.资源组[40]:更新(dt)
            self.资源组[40]:显示(jx, jy)
        end
        -- 文字
        self.名称输入框:置坐标(self.x + 204, self.y + 220)
        self.控件类:更新(dt, x, y)
        self.控件类:显示(dt, x, y)
        if self.名称输入框._已碰撞 then
            self.焦点 = true
        end
        if tp.队伍[1].宝宝列表[self.选中].种类 ~= nil then
            local 资源 = tp.资源
            if tp.队伍[1].宝宝列表[self.选中].种类 == '神兽' then
                self.资源组[41] = 资源:载入('wpal/121.wpal', '网易WDF动画', 0x00bbb118)
                self.资源组[41]:更新(x, y)
                self.资源组[41]:显示(self.x + 295, self.y + 145)
            elseif tp.队伍[1].宝宝列表[self.选中].种类 == '宝宝' then
                self.资源组[41] = 资源:载入('wpal/121.wpal', '网易WDF动画', 0x00bbb116)
                self.资源组[41]:更新(x, y)
                self.资源组[41]:显示(self.x + 295, self.y + 145)
            elseif tp.队伍[1].宝宝列表[self.选中].种类 == '仙灵' then
                self.资源组[41] = 资源:载入('wpal/121.wpal', '网易WDF动画', 0x00bbb117)
                self.资源组[41]:更新(x, y)
                self.资源组[41]:显示(self.x + 295, self.y + 145)
            elseif tp.队伍[1].宝宝列表[self.选中].种类 == '妖兽' then
                self.资源组[41] = 资源:载入('wpal/121.wpal', '网易WDF动画', 0x00bbb115)
                self.资源组[41]:更新(x, y)
                self.资源组[41]:显示(self.x + 295, self.y + 145)
            elseif tp.队伍[1].宝宝列表[self.选中].种类 == '至尊' then
                self.资源组[41] = 资源:载入('wpal/121.wpal', '网易WDF动画', 0x00bbb114)
                self.资源组[41]:更新(x, y)
                self.资源组[41]:显示(self.x + 295, self.y + 145)
            else
                ztstt3:显示(self.x + 204, self.y + 40, tp.队伍[1].宝宝列表[self.选中].种类)
             --########################################################?自己修改?##########################################
            end
        end
        self.资源组[34]:显示(self.x + 320, self.y + 35)
        zts:置颜色(-16777216)
        zts:显示(self.x + 60, self.y + 247, format('%d/%d', bb.气血, bb.最大气血))
        -- zts3:显示(self.x + 226,self.y + 46,"+"..yl.种类)
        if yl.气血 > 0 then
            zts1:置颜色(-65536)
            zts1:显示(self.x + 126, self.y + 248, '+' .. yl.气血)
        end
        zts:显示(self.x + 60, self.y + 271, format('%d/%d', bb.魔法, bb.最大魔法))
        if yl.魔法 > 0 then
            zts1:置颜色(-65536)
            zts1:显示(self.x + 126, self.y + 272, '+' .. yl.魔法)
        end
        zts:显示(self.x + 60, self.y + 295, bb.伤害)
        if yl.伤害 > 0 then
            zts1:置颜色(-65536)
            zts1:显示(self.x + 126, self.y + 295, '+' .. yl.伤害)
        end
        zts:显示(self.x + 60, self.y + 319, bb.防御)
        if yl.防御 > 0 then
            zts1:置颜色(-65536)
            zts1:显示(self.x + 126, self.y + 319, '+' .. yl.防御)
        end
        zts:显示(self.x + 60, self.y + 343, bb.速度)
        if yl.速度 > 0 then
            zts1:置颜色(-65536)
            zts1:显示(self.x + 126, self.y + 343, '+' .. yl.速度)
        end
        zts:显示(self.x + 60, self.y + 367, bb.灵力)
        if yl.灵力 > 0 then
            zts1:置颜色(-65536)
            zts1:显示(self.x + 126, self.y + 367, '+' .. yl.灵力)
        end
        zts:显示(self.x + 60, self.y + 397, bb.忠诚)
        -- ls
        zts:显示(self.x + 204, self.y + 247, bb.体质 + bb.装备属性.体质)
        if ls.体质 > 0 then
            zts:置颜色(-65536)
            zts:显示(self.x + 224 + (#tostring(bb.体质) * 7) + 1, self.y + 247, '+' .. ls.体质)
            zts:置颜色(-16777216)
        end
        zts:显示(self.x + 204, self.y + 271, bb.魔力 + bb.装备属性.魔力)
        if ls.魔力 > 0 then
            zts:置颜色(-65536)
            zts:显示(self.x + 224 + (#tostring(bb.魔力) * 7) + 1, self.y + 271, '+' .. ls.魔力)
            zts:置颜色(-16777216)
        end
        zts:显示(self.x + 204, self.y + 296, bb.力量 + bb.装备属性.力量)
        if ls.力量 > 0 then
            zts:置颜色(-65536)
            zts:显示(self.x + 224 + (#tostring(bb.力量) * 7) + 1, self.y + 295, '+' .. ls.力量)
            zts:置颜色(-16777216)
        end
        zts:显示(self.x + 204, self.y + 320, bb.耐力 + bb.装备属性.耐力)
        if ls.耐力 > 0 then
            zts:置颜色(-65536)
            zts:显示(self.x + 224 + (#tostring(bb.耐力) * 7) + 1, self.y + 319, '+' .. ls.耐力)
            zts:置颜色(-16777216)
        end
        zts:显示(self.x + 204, self.y + 344, bb.敏捷 + bb.装备属性.敏捷)
        if ls.敏捷 > 0 then
            zts:置颜色(-65536)
            zts:显示(self.x + 224 + (#tostring(bb.敏捷) * 7) + 1, self.y + 343, '+' .. ls.敏捷)
            zts:置颜色(-16777216)
        end
        if bb.进阶属性.体质 > 0 then
            zts:置颜色(0xFFFF00FF)
            zts:显示(self.x + 272, self.y + 247, '+' .. bb.进阶属性.体质)
            zts:置颜色(-16777216)
        end
        if bb.进阶属性.魔力 > 0 then
            zts:置颜色(0xFFFF00FF)
            zts:显示(self.x + 272, self.y + 271, '+' .. bb.进阶属性.魔力)
            zts:置颜色(-16777216)
        end
        if bb.进阶属性.力量 > 0 then
            zts:置颜色(0xFFFF00FF)
            zts:显示(self.x + 272, self.y + 295, '+' .. bb.进阶属性.力量)
            zts:置颜色(-16777216)
        end
        if bb.进阶属性.耐力 > 0 then
            zts:置颜色(0xFFFF00FF)
            zts:显示(self.x + 272, self.y + 319, '+' .. bb.进阶属性.耐力)
            zts:置颜色(-16777216)
        end
        if bb.进阶属性.敏捷 > 0 then
            zts:置颜色(0xFFFF00FF)
            zts:显示(self.x + 272, self.y + 343, '+' .. bb.进阶属性.敏捷)
            zts:置颜色(-16777216)
        end
        if bb.统御属性.体质 > 0 then
            zts:置颜色(0xFFde1862)
            zts:显示(self.x + 235, self.y + 247, '+' .. bb.统御属性.体质)
            zts:置颜色(-16777216)
        end
        if bb.统御属性.魔力 > 0 then
            zts:置颜色(0xFFde1862)
            zts:显示(self.x + 235, self.y + 271, '+' .. bb.统御属性.魔力)
            zts:置颜色(-16777216)
        end
        if bb.统御属性.力量 > 0 then
            zts:置颜色(0xFFde1862)
            zts:显示(self.x + 235, self.y + 295, '+' .. bb.统御属性.力量)
            zts:置颜色(-16777216)
        end
        if bb.统御属性.耐力 > 0 then
            zts:置颜色(0xFFde1862)
            zts:显示(self.x + 235, self.y + 319, '+' .. bb.统御属性.耐力)
            zts:置颜色(-16777216)
        end
        if bb.统御属性.敏捷 > 0 then
            zts:置颜色(0xFFde1862)
            zts:显示(self.x + 235, self.y + 343, '+' .. bb.统御属性.敏捷)
            zts:置颜色(-16777216)
        end
        zts:显示(self.x + 200, self.y + 367, bb.潜力)
        self.资源组[26]:置区域(0, 0, min(floor(bb.当前经验 / bb.最大经验 * 176), 176), 16)
        self.资源组[26]:显示(self.x + 60, self.y + 426)
        zts2:置描边颜色(-16240640)
        zts2:置颜色(4294967295)
        zts2:置描边颜色(-16777216)
        local ts = format('%d/%d', bb.当前经验, bb.最大经验)
        zts2:显示(
            self.x + ((255 - zts2:取宽度(ts)) / 2) + 8,
            self.y + 425,
            ts .. '(' .. 到整数(取百分比转换(bb.当前经验, 1, bb.最大经验) * 100) .. '%)'
        )

        if bb.套装效果 ~= nil then
            self.追加法术:显示(self.x + 80 + 250, self.y + 150)
            if self.追加法术:是否选中(x, y) then
                tp.提示:自定义(self.x + 80 + 250, self.y + 150, bb.套装效果[2] .. bb.套装效果[1])
            end
        end
    end
    if self.资源组[2]:事件判断() then
        self:打开()
        return false
    elseif self.资源组[3]:事件判断() then
        if bb.被统御 ~= nil then
            tp.提示:写入('#Y/该召唤兽已经被#R' .. bb.被统御 .. '#Y/号助战携带')
            return
        end

        发送数据(5002, {序列 = bb.认证码})
    elseif self.资源组[4]:事件判断() then
        tp.提示:写入('#Y/改名成功！')
        bb.名称 = self.名称输入框:取文本()
        发送数据(5003, {序列 = bb.认证码, 名称 = self.名称输入框:取文本()})
    elseif self.资源组[15]:事件判断() then
        -- 力耐加点
        local zt = 1
        while true do
            if zt == 1 then
                bb.潜力 = bb.潜力 - 1
                ls.体质 = ls.体质 + 1
                zt = 2
            elseif zt == 2 then
                bb.潜力 = bb.潜力 - 1
                ls.力量 = ls.力量 + 1
                zt = 3
            elseif zt == 3 then
                bb.潜力 = bb.潜力 - 1
                ls.力量 = ls.力量 + 1
                zt = 4
            elseif zt == 4 then
                bb.潜力 = bb.潜力 - 1
                ls.力量 = ls.力量 + 1
                zt = 5
            elseif zt == 5 then
                bb.潜力 = bb.潜力 - 1
                ls.力量 = ls.力量 + 1
                zt = 1
            end
            if bb.潜力 <= 0 then
                break
            end
        end
    elseif self.资源组[16]:事件判断() then
        if bb ~= nil then
            self.预览属性[self.选中] = self:取差异属性(ls, bb)
        end
    elseif self.资源组[17]:事件判断() then
        发送数据(5022)
    elseif self.资源组[18]:事件判断() then
        local 事件 = function()
            发送数据(5005, {序列 = bb.认证码})
        end
        tp.窗口.文本栏:载入('真的要放生#Y/' .. bb.等级 .. '级的#R/' .. bb.名称 .. '#W/吗?', nil, true, 事件)
    elseif self.资源组[20]:事件判断() then
        发送数据(51, {序列 = bb.认证码})
    elseif self.资源组[19]:事件判断() then
        tp.窗口.召唤兽鉴定:打开(bb)
        tp.窗口.召唤兽鉴定.x = self.x + 370
        tp.窗口.召唤兽鉴定.y = self.y
    elseif self.资源组[19]:事件判断() then
        tp.窗口.召唤兽资质栏:打开(bb)
        tp.窗口.召唤兽资质栏.x = self.x + 370
        tp.窗口.召唤兽资质栏.y = self.y
    elseif self.资源组[21]:事件判断() then
        self.临时潜力[self.选中] = {体质 = 0, 魔力 = 0, 力量 = 0, 耐力 = 0, 敏捷 = 0}
        self.预览属性[self.选中] = {气血 = 0, 魔法 = 0, 伤害 = 0, 速度 = 0, 灵力 = 0, 防御 = 0}
        ls.序列 = bb.认证码
        发送数据(5004, ls)
    elseif self.资源组[22]:事件判断() then
        tp.窗口.召唤兽资质栏:打开(bb)
        tp.窗口.召唤兽资质栏.x = self.x + 370
        tp.窗口.召唤兽资质栏.y = self.y
    elseif self.资源组[27]:事件判断() then --上滚动
        self.资源组[35]:置起始点(self.资源组[35]:取百分比转换(self.加入 - 1, 4, bbsa))
        self.头像组 = {}
    elseif self.资源组[28]:事件判断() then --下滚动
        self.资源组[35]:置起始点(self.资源组[35]:取百分比转换(self.加入 + 1, 4, bbsa))
        self.头像组 = {}
    elseif
        (self.资源组[29]:是否选中(x, y) or self.资源组[27]:是否选中(x, y) or self.资源组[35]:是否选中(x, y)) and 引擎.取鼠标滚轮() == 1 and
            self.加入 > 0
     then --鼠标上滚动
        self.资源组[35]:置起始点(self.资源组[35]:取百分比转换(self.加入 - 1, 4, bbsa))
        self.头像组 = {}
    elseif
        (self.资源组[29]:是否选中(x, y) or self.资源组[28]:是否选中(x, y) or self.资源组[35]:是否选中(x, y)) and 引擎.取鼠标滚轮() == -1 and
            self.加入 < bbsa - 4
     then --鼠标下滚动
        self.资源组[35]:置起始点(self.资源组[35]:取百分比转换(self.加入 + 1, 4, bbsa))
        self.头像组 = {}
    elseif self.资源组[34]:事件判断(x, y) then
        tp.窗口.召唤兽染色:打开(bb)
    end
    -- 拖拽事件
    if self.拽拖对象 ~= 0 then
        box(x - 70, y - 25, x + 73, y + 19, -849650981)
        self.资源组[23]:显示(x - 67, y - 22)
        self.拽拖事件[1]:显示(x - 63, y - 18)
        if bbs[self.拽拖对象].参战信息 ~= nil then
            zts:置颜色(-256)
        end
        zts:显示(x - 27, y - 19, bbs[self.拽拖对象].名称)
        zts:显示(x - 27, y, bbs[self.拽拖对象].等级 .. '级')
        if mouseb(0) then
            if self.鼠标 then
                if self.插入选区 == 0 then
                    self.拽拖计次 = 0
                    self.拽拖对象 = 0
                    self.拽拖事件 = 0
                    self.插入选区 = 0
                    tp.禁止关闭 = false
                else
                    self:排列(self.拽拖对象, self.插入选区)
                    self.拽拖计次 = 0
                    self.拽拖对象 = 0
                    self.拽拖事件 = 0
                    self.插入选区 = 0
                    tp.禁止关闭 = false
                end
            else
                self.拽拖计次 = 0
                self.拽拖对象 = 0
                self.拽拖事件 = 0
                self.插入选区 = 0
                tp.禁止关闭 = false
            end
        end
        tp.禁止关闭 = true
        self.焦点 = true
    end
    if self.资源组[35].接触 then
        self.焦点 = true
    end
end

function 场景类_召唤兽属性栏:取差异属性(sxb, 宠物)
    local sx1 = 宠物.最大气血
    local sx2 = 宠物.最大魔法
    local sx3 = 宠物.伤害
    local sx4 = 宠物.防御
    local sx5 = 宠物.速度
    local sx6 = 宠物.灵力
    if 宠物.装备属性 == nil then
        宠物.装备属性 = {
            气血 = 0,
            魔法 = 0,
            命中 = 0,
            伤害 = 0,
            防御 = 0,
            速度 = 0,
            躲避 = 0,
            灵力 = 0,
            体质 = 0,
            魔力 = 0,
            力量 = 0,
            耐力 = 0,
            敏捷 = 0
        }
    end
    local 体质 = 宠物.体质 + 宠物.装备属性.体质 + sxb.体质
    local 魔力 = 宠物.魔力 + 宠物.装备属性.魔力 + sxb.魔力
    local 力量 = 宠物.力量 + 宠物.装备属性.力量 + sxb.力量
    local 耐力 = 宠物.耐力 + 宠物.装备属性.耐力 + sxb.耐力
    local 敏捷 = 宠物.敏捷 + 宠物.装备属性.敏捷 + sxb.敏捷
    local 最大气血 = ceil(宠物.等级 * 宠物.体力资质 / 1000 + 体质 * 宠物.成长 * 6) + 宠物.装备属性.气血
    local 最大魔法 = ceil(宠物.等级 * 宠物.法力资质 / 500 + 魔力 * 宠物.成长 * 3) + 宠物.装备属性.魔法
    local 伤害1 = ceil(宠物.等级 * 宠物.攻击资质 * (宠物.成长 + 1.4) / 750 + 力量 * 宠物.成长) + 宠物.装备属性.伤害
    local 防御1 = ceil(宠物.等级 * 宠物.防御资质 * (宠物.成长 + 1.4) / 1143 + 耐力 * (宠物.成长 - 1 / 253) * 253 / 190) + 宠物.装备属性.防御
    local 速度1 = ceil(宠物.速度资质 * 敏捷 / 1000) + 宠物.装备属性.速度
    local 灵力1 = ceil(宠物.等级 * (宠物.法力资质 + 1666) / 3333 + 魔力 * 0.7 + 力量 * 0.4 + 体质 * 0.3 + 耐力 * 0.2) + 宠物.装备属性.灵力
    return {气血 = 最大气血 - sx1, 魔法 = 最大魔法 - sx2, 伤害 = 伤害1 - sx3, 防御 = 防御1 - sx4, 速度 = 速度1 - sx5, 灵力 = 灵力1 - sx6}
end

function 场景类_召唤兽属性栏:排列(a, b)
    local bbx = tp.队伍[1].宝宝列表
    local abs = bbx[a]
    local bbs = bbx[b]
    local aba = self.临时潜力[a]
    local bba = self.临时潜力[b]
    local abc = self.预览属性[a]
    local bbc = self.预览属性[b]
    bbx[a] = bbs
    self.临时潜力[a] = bba
    self.预览属性[a] = bbc
    bbx[b] = abs
    self.临时潜力[b] = aba
    self.预览属性[b] = abc
    if self.选中 ~= 0 then
        self.选中 = b
        self:置形象()
        self.名称输入框:置文本(bbx[self.选中].名称)
        self.名称输入框:置可视(true, true)
        if tp.窗口.召唤兽资质栏.可视 then
            tp.窗口.召唤兽资质栏:打开(bbx[self.选中])
        end
    end
    self.头像组 = {}
end

function 场景类_召唤兽属性栏:刷新(f)
    if tp.窗口.召唤兽资质栏.可视 then
        tp.窗口.召唤兽资质栏:打开()
    end
    self.加入 = 0
    self.选中 = 0
    self.拽拖计次 = 0
    self.拽拖对象 = 0
    self.拽拖事件 = 0
    self.插入选区 = 0
    self.头像组 = {}
    self.名称输入框:置可视(false, false)
end

function 场景类_召唤兽属性栏:检查点(x, y)
    if self.资源组 ~= nil and self.资源组[1]:是否选中(x, y) then
        return true
    end
end

function 场景类_召唤兽属性栏:初始移动(x, y)
    tp.运行时间 = tp.运行时间 + 1
    if not tp.消息栏焦点 then
        self.窗口时间 = tp.运行时间
    end
    if not self.焦点 then
        tp.移动窗口 = true
    end
    if self.鼠标 and not self.焦点 then
        self.xx = x - self.x
        self.yy = y - self.y
    end
end

function 场景类_召唤兽属性栏:开始移动(x, y)
    if self.鼠标 then
        self.x = x - self.xx
        self.y = y - self.yy
    end
end

return 场景类_召唤兽属性栏
