--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2021-03-10 20:34:35
--======================================================================--
local 场景类_召唤兽资质栏 = class()
local zts, bb, tp, zts1
local yx = {{68, 4}, {25, 28}, {111, 28}, {24, 75}, {111, 75}, {68, 97}}
local insert = table.insert
local bds = {'攻击资质', '防御资质', '体力资质', '法力资质', '速度资质', '躲闪资质'}
local bds1 = {'寿命', '成长', '五行'}

function 场景类_召唤兽资质栏:初始化(根)
    self.ID = 8
    self.xx = 0
    self.yy = 0
    self.注释 = '召唤兽资质栏'
    self.可视 = false
    self.鼠标 = false
    self.焦点 = false
    self.可移动 = true
    self.内丹 = {}
    tp = 根
    zts = tp.字体表.普通字体
    zts1 = tp.字体表.描边字体
    self.技能数量 = 0
    self.技能页数 = 1
    self.状态 = 1
    self.窗口时间 = 0
end
function 场景类_召唤兽资质栏:刷新数据(b)
    if 开发调试 then
        self:PB刷新数据(b)
    else
        bb = b
        for i = 1, 3 do
            self.物品[i]:置物品(bb.装备[i])
        end
        for i = 1, #bb.技能 do
            self.技能[i]:置技能(bb.技能[i])
        end
        self.技能数量 = #bb.技能
        self.技能页数 = 1
        for i = 1, 6 do
            if bb.内丹[i] ~= nil and bb.内丹[i].技能 ~= nil then
                self.内丹[i] = bb.内丹[i]
                item = self:取内丹数据(bb.内丹[i].技能, bb.内丹[i].等级)
                self.内丹[i].说明 = item.说明
                self.内丹[i].效果 = item.效果
                self.内丹[i].模型 = 引擎.场景.资源:载入(item.资源, '网易WDF动画', item.模型)
                self.内丹[i].小模型 = 引擎.场景.资源:载入(item.资源, '网易WDF动画', item.模型)
            else
                self.内丹[i] = nil
            end
        end
    end
end
function 场景类_召唤兽资质栏:PB刷新数据(b)
    bb = b
    for i = 1, 3 do
        -- TODO 装备处理
        -- self.物品[i]:置物品(bb.equip[i])
    end
    for i = 1, #bb.skill do
        self.技能[i]:置技能(bb.技能[i])
    end
    self.技能数量 = #bb.skill
    self.技能页数 = 1
    for i = 1, 6 do
        if bb.内丹[i] ~= nil and bb.innerBall[i].name ~= nil then
            self.内丹[i] = bb.innerBall[i]
            item = self:取内丹数据(bb.innerBall[i].name, bb.innerBall[i].lv)
            self.内丹[i].说明 = item.说明
            self.内丹[i].效果 = item.效果
            self.内丹[i].模型 = 引擎.场景.资源:载入(item.资源, '网易WDF动画', item.模型)
            self.内丹[i].小模型 = 引擎.场景.资源:载入(item.资源, '网易WDF动画', item.模型)
        else
            self.内丹[i] = nil
        end
    end
end


function 场景类_召唤兽资质栏:PB打开(b)
    if self.可视 then
        if b ~= nil and b ~= bb then
            bb = b
            for i = 1, 3 do
                -- self.物品[i]:置物品(bb.装备[i])
            end
            local 序号 = 0
            for i = 1, #bb.skillObjects do
                if bb.skillObjects[i].名称 == bb.authSkill then
                    self.认证格子:置技能(bb.skillObjects[i])
                else
                    序号 = 序号 + 1
                    local 临时技能 = tp._技能.创建()
                    临时技能:置对象(bb.skillObjects[i], 2)
                    self.技能[序号]:置技能(bb.skillObjects[i])
                end
            end
            self.技能数量 = #bb.skillObjects
            self.技能页数 = 1
            for i = 1, 6 do
                -- 内丹配置
                if bb.innerBall[i] ~= nil and bb.innerBall[i].name ~= nil then
                    self.内丹[i] = bb.innerBall[i]
                    item = self:取内丹数据(bb.innerBall[i].name, bb.innerBall[i].lv)
                    self.内丹[i].说明 = item.说明
                    self.内丹[i].效果 = item.效果
                    self.内丹[i].模型 = 引擎.场景.资源:载入(item.资源, '网易WDF动画', item.模型)
                    self.内丹[i].小模型 = 引擎.场景.资源:载入(item.资源, '网易WDF动画', item.模型)
                else
                    self.内丹[i] = nil
                end
            end
            return
        end
        self.技能数量 = 0
        self.技能页数 = 1
        self.状态 = nil
        self.可视 = false
        self.资源组 = nil
        self.进阶 = nil
        self.物品 = nil
        self.技能 = nil
    else
        insert(tp.窗口_, self)
        self:加载资源()
        bb = b
        for i = 1, 3 do
            -- self.物品[i]:置物品(bb.装备[i])
        end
        local 序号 = 0
        for i = 1, #bb.skillObjects do
            if bb.skillObjects[i].名称 == bb.authSkill then
                self.认证格子:置技能(bb.skillObjects[i])
            else
                序号 = 序号 + 1
                local 临时技能 = tp._技能.创建()
                临时技能:置对象(bb.skillObjects[i], 2)
                self.技能[序号]:置技能(bb.skillObjects[i])
            end
        end
        self.技能数量 = #bb.skillObjects
        for i = 1, 6 do
            if bb.innerBall[i] ~= nil and bb.innerBall[i].name ~= nil then
                self.内丹[i] = bb.innerBall[i]
                item = self:取内丹数据(bb.innerBall[i].name, bb.innerBall[i].lv)
                self.内丹[i].说明 = item.说明
                self.内丹[i].效果 = item.效果
                self.内丹[i].模型 = 引擎.场景.资源:载入(item.资源, '网易WDF动画', item.模型)
                self.内丹[i].小模型 = 引擎.场景.资源:载入(item.资源, '网易WDF动画', item.模型)
            else
                self.内丹[i] = nil
            end
        end
        self.状态 = 1
        tp.运行时间 = tp.运行时间 + 1
        self.窗口时间 = tp.运行时间
        self.可视 = true
    end
end

function 场景类_召唤兽资质栏:打开(b)
    if 开发调试 then
        self:PB打开(b)
    else
        if self.可视 then
            if b ~= nil and b ~= bb then
                bb = b
                for i = 1, 3 do
                    self.物品[i]:置物品(bb.装备[i])
                end
                local 序号 = 0
                for i = 1, #bb.技能 do
                    if bb.技能[i].名称 == bb.法术认证 then
                        self.认证格子:置技能(bb.技能[i])
                    else
                        序号 = 序号 + 1
                        local 临时技能 = tp._技能.创建()
                        临时技能:置对象(bb.技能[i], 2)
                        self.技能[序号]:置技能(bb.技能[i])
                    end
                end
                self.技能数量 = #bb.技能
                self.技能页数 = 1
                for i = 1, 6 do
                    if bb.内丹[i] ~= nil and bb.内丹[i].技能 ~= nil then
                        self.内丹[i] = bb.内丹[i]
                        item = self:取内丹数据(bb.内丹[i].技能, bb.内丹[i].等级)
                        self.内丹[i].说明 = item.说明
                        self.内丹[i].效果 = item.效果
                        self.内丹[i].模型 = 引擎.场景.资源:载入(item.资源, '网易WDF动画', item.模型)
                        self.内丹[i].小模型 = 引擎.场景.资源:载入(item.资源, '网易WDF动画', item.模型)
                    else
                        self.内丹[i] = nil
                    end
                end
                return
            end
            self.技能数量 = 0
            self.技能页数 = 1
            self.状态 = nil
            self.可视 = false
            self.资源组 = nil
            self.进阶 = nil
            self.物品 = nil
            self.技能 = nil
        else
            insert(tp.窗口_, self)
            self:加载资源()
            bb = b
            for i = 1, 3 do
                self.物品[i]:置物品(bb.装备[i])
            end
            local 序号 = 0
            for i = 1, #bb.技能 do
                if bb.技能[i].名称 == bb.法术认证 then
                    self.认证格子:置技能(bb.技能[i])
                else
                    序号 = 序号 + 1
                    local 临时技能 = tp._技能.创建()
                    临时技能:置对象(bb.技能[i], 2)
                    self.技能[序号]:置技能(bb.技能[i])
                end
            end
            self.技能数量 = #bb.技能
            for i = 1, 6 do
                if bb.内丹[i] ~= nil and bb.内丹[i].技能 ~= nil then
                    self.内丹[i] = bb.内丹[i]
                    item = self:取内丹数据(bb.内丹[i].技能, bb.内丹[i].等级)
                    self.内丹[i].说明 = item.说明
                    self.内丹[i].效果 = item.效果
                    self.内丹[i].模型 = 引擎.场景.资源:载入(item.资源, '网易WDF动画', item.模型)
                    self.内丹[i].小模型 = 引擎.场景.资源:载入(item.资源, '网易WDF动画', item.模型)
                else
                    self.内丹[i] = nil
                end
            end
            self.状态 = 1
            tp.运行时间 = tp.运行时间 + 1
            self.窗口时间 = tp.运行时间
            self.可视 = true
        end
    end
end

function 场景类_召唤兽资质栏:加载资源()
    local 资源 = tp.资源
    local 按钮 = tp._按钮
    local 自适应 = tp._自适应
    self.认证圈圈 = 资源:载入('wzife.wdf', '网易WDF动画', 0x10921CA7)
    self.资源组 = {
        [1] = 自适应.创建(0, 1, 242, 453, 3, 9),
        [2] = 按钮.创建(自适应.创建(18, 4, 16, 16, 4, 3), 0, 0, 4, true, true),
        [3] = 按钮.创建(资源:载入(tp.宠物属性按钮, '网易WDF动画', 0x1F996671), 0, 0, 4, true, true),
        [4] = 按钮.创建(资源:载入(tp.宠物属性按钮, '网易WDF动画', 0x9C24F376), 0, 0, 4, true, true),
        [5] = 按钮.创建(资源:载入(tp.宠物属性按钮, '网易WDF动画', 0xCD999F0B), 0, 0, 4, true, true),
        [6] = tp.技能背景,
        [7] = 资源:载入(tp.宠物属性背景, '网易WDF动画', 0x7367031D),
        [8] = 资源:载入(tp.宠物属性背景, '网易WDF动画', 0x1E714129),
        [9] = 资源:载入(tp.宠物属性背景, '网易WDF动画', 0xF2FC2425),
        [10] = 资源:载入('wzife.wd2', '网易WDF动画', 0x10E2B4A7),
        [11] = 资源:载入('wzife.wd3', '网易WDF动画', 0xC361C087),
        [12] = 资源:载入('wzife.wdf', '网易WDF动画', 0x4FC09361),
        [13] = 自适应.创建(3, 1, 95, 19, 1, 3),
        [14] = 自适应.创建(1, 1, 204, 18, 1, 3, nil, 18),
        [15] = 资源:载入('wzife.wd1', '网易WDF动画', 0x3FEEB486),
        [16] = 按钮.创建(资源:载入(tp.宠物技能箭头, '网易WDF动画', 0x7AB5584C), 0, 0, 4, true, true),
        [17] = 按钮.创建(资源:载入(tp.宠物技能箭头, '网易WDF动画', 0xCB50AB1D), 0, 0, 4, true, true)
    }
    self.进阶 = {
        [16] = 资源:载入('wzife.wd3', '网易WDF动画', 0x1094AD16),
        ----进阶界面
        [1] = 资源:载入('wzife.wd3', '网易WDF动画', 0x4536A03D),
        --进阶1
        [2] = 资源:载入('wzife.wd3', '网易WDF动画', 0x714C3706),
        --2
        [3] = 资源:载入('wzife.wd3', '网易WDF动画', 0xD60014B8),
        -----3
        [4] = 资源:载入('wzife.wd3', '网易WDF动画', 0xF7EBF987), ----4
        [5] = 资源:载入('wzife.wd3', '网易WDF动画', 0x11963488),
        ----5
        [6] = 资源:载入('wzife.wd3', '网易WDF动画', 0x9A4F1961),
        --6
        [7] = 资源:载入('wzife.wd3', '网易WDF动画', 0x1E7ABB94), --7
        [8] = 资源:载入('wzife.wd3', '网易WDF动画', 0xA6C9A76A),
        --8
        [9] = 资源:载入('wzife.wd3', '网易WDF动画', 0x2982E3F7),
        ---9
        [10] = 资源:载入('wzife.wd3', '网易WDF动画', 0x1D0717D7),
        ---91
        [11] = 资源:载入('wzife.wd3', '网易WDF动画', 0xC44F0602),
        --94
        [12] = 资源:载入('wzife.wd3', '网易WDF动画', 0x9765D0B3),
        --97
        [13] = 资源:载入('wzife.wd3', '网易WDF动画', 0x36A2C1A6),
        --100
        [14] = 资源:载入('wzife.wd3', '网易WDF动画', 0xAFC2E161), --未完成内框
        [15] = 资源:载入('wzife.wd3', '网易WDF动画', 0x27E24CFA) --完成
    }
    self.资源组[12]:置区域(14, 31, 184, 66)
    for i = 2, 5 do
        self.资源组[i]:绑定窗口_(8)
    end
    self.物品 = {}
    local wp = tp._物品格子
    local 底图 = 资源:载入('wzife.wdf', '网易WDF动画', 0xA393A808)
    for i = 1, 3 do
        self.物品[i] = wp(0, 0, i, '召唤兽资质物品', 底图)
    end
    self.技能 = {}
    local jn = tp._技能格子
    for i = 1, 24 do
        self.技能[i] = jn(0, 0, i, '召唤兽资质技能')
    end
    self.认证格子 = {}
    self.认证格子 = jn(0, 0, i, '召唤兽资质技能')
end

function 场景类_召唤兽资质栏:BP显示(dt, x, y)
    self.焦点 = false
    self.资源组[2]:更新(x, y)
    self.资源组[3]:更新(x, y, self.状态 ~= 1)
    self.资源组[4]:更新(x, y, self.状态 ~= 2)
    self.资源组[5]:更新(x, y, self.状态 ~= 3)
    self.资源组[15]:更新()
    if self.资源组[2]:事件判断() then
        self:打开()
        return false
    elseif self.资源组[3]:事件判断() then
        self.状态 = 1 -- 状态 1、2、3代表资质栏三个选项
    elseif self.资源组[4]:事件判断() then
        self.状态 = 2
    elseif self.资源组[5]:事件判断() then
        self.状态 = 3
    end
    self.资源组[1]:显示(self.x, self.y)
    self.资源组[14]:显示(self.x + 6, self.y + 3)
    tp.窗口标题背景_:置区域(0, 0, 84, 16)
    tp.窗口标题背景_:显示(self.x + 71, self.y + 3)
    zts1:置字间距(1)
    zts1:显示(self.x + 76, self.y + 3, '召唤兽资质')
    zts1:置字间距(0)
    --self.资源组[12]:显示(self.x+30,self.y+27)
    for i = 1, 3 do
        tp.宝宝装备背景[i]:显示(self.x + 35 + (i - 1) * 60, self.y + 31)
    end
    zts1:置字间距(10)
    for i = 0, 5 do
        zts1:显示(self.x + 23, self.y + 98 + i * 23, bds[i + 1])
        self.资源组[13]:显示(self.x + 124, self.y + 96 + i * 23)
    end
    zts1:置字间距(58)
    zts1:置颜色(-1404907)
    for i = 0, 2 do
        zts1:显示(self.x + 23, self.y + 236 + i * 23, bds1[i + 1])
        self.资源组[13]:显示(self.x + 124, self.y + 234 + i * 23)
    end
    zts1:置颜色(4294967295)
    zts1:置字间距(0)
    self.资源组[2]:显示(self.x + 216, self.y + 5)
    self.资源组[3]:显示(self.x + 208, self.y + 305, true, nil, nil, self.状态 == 1, 2)
    self.资源组[4]:显示(self.x + 208, self.y + 351, true, nil, nil, self.状态 == 2, 2)
    self.资源组[5]:显示(self.x + 208, self.y + 397, true, nil, nil, self.状态 == 3, 2)
    local xx = 0
    local yy = 0
    if self.状态 == 1 then
        for i = 1, 12 do
            local jx = self.x + 20 + (xx * 41)
            local jy = self.y + 309 + (yy * 41)
            self.资源组[6]:显示(jx, jy)
            xx = xx + 1
            if xx > 3 then
                xx = 0
                yy = yy + 1
            end
        end
        self.b = 0
        if self.技能数量 > 12 or (bb.authSkill ~= nil and gbk.len(bb.authSkill) > 0 and self.技能数量 > 12) then
            self.显示数量 = 12
            if self.技能页数 == 1 then
                self.资源组[17]:更新(x, y)
                self.资源组[17]:显示(self.x + 192, self.y + 406)
                if self.资源组[17]:事件判断() then
                    self.技能页数 = self.技能页数 + 1
                end
            else
                self.资源组[16]:更新(x, y)
                self.资源组[16]:显示(self.x + 192, self.y + 326)
                if self.资源组[16]:事件判断() then
                    self.技能页数 = self.技能页数 - 1
                end
            end
        else
            self.显示数量 = self.技能数量
        end
        if bb.authSkill ~= nil and gbk.len(bb.authSkill) > 0 then
            if #bb.skill > 12 and self.技能页数 == 2 then
                local xx = 3
                local yy = 2
                local jx = self.x + 20 + (xx * 41)
                local jy = self.y + 309 + (yy * 41)
                self.资源组[6]:显示(jx, jy)
                self.认证格子:置坐标(jx + 3, jy + 2)
                self.认证格子:显示(x, y, self.鼠标)
                引擎.画线(jx + 3, jy + 2, jx + 3 + 40, jy + 2, 红色)
                引擎.画线(jx + 3, jy + 2 + 40, jx + 3 + 40, jy + 2 + 40, 红色)
                引擎.画线(jx + 3, jy + 2, jx + 3, jy + 2 + 40, 红色)
                引擎.画线(jx + 3 + 40, jy + 2, jx + 3 + 40, jy + 2 + 40, 红色)
                if self.认证格子.焦点 and self.认证格子.技能 ~= nil then
                    tp.提示:技能(x, y, self.认证格子.技能)
                end
            elseif #bb.skill <= 12 and self.技能页数 == 1 then
                local xx = 3
                local yy = 2
                local jx = self.x + 20 + (xx * 41)
                local jy = self.y + 309 + (yy * 41)
                self.资源组[6]:显示(jx, jy)
                self.认证格子:置坐标(jx + 3, jy + 2)
                self.认证格子:显示(x, y, self.鼠标)
                引擎.画线(jx + 3, jy + 2, jx + 3 + 40, jy + 2, 红色)
                引擎.画线(jx + 3, jy + 2 + 40, jx + 3 + 40, jy + 2 + 40, 红色)
                引擎.画线(jx + 3, jy + 2, jx + 3, jy + 2 + 40, 红色)
                引擎.画线(jx + 3 + 40, jy + 2, jx + 3 + 40, jy + 2 + 40, 红色)
                if self.认证格子.焦点 and self.认证格子.技能 ~= nil then
                    tp.提示:技能(x, y, self.认证格子.技能)
                end
            end
        end
        for n = 1, self.显示数量 do
            self.a = n / 4
            if (self.a < 1) then
                self.a = 1
            elseif (self.a > 1 and self.a < 2) then
                self.a = 2
            elseif (self.a > 2 and self.a < 3) then
                self.a = 3
            end
            self.b = self.b + 1
            if (self.b == 5) then
                self.b = 1
            end
            self.显示序列 = self.技能页数 * 12 - 12 + n
            if self.显示序列 > self.技能数量 then
                return 0
            end
            local jx = self.x + 20 + (self.b * 41 - 41)
            local jy = self.y + 309 + (self.a * 41 - 41)
            self.技能[self.显示序列]:置坐标(jx + 3, jy + 2)
            self.技能[self.显示序列]:显示(x, y, self.鼠标)
            if self.技能[self.显示序列].焦点 and self.技能[self.显示序列].技能 ~= nil then
                tp.提示:技能(x, y, self.技能[self.显示序列].技能)
            end
            zts:置颜色(-16777216)
            zts:显示(self.x + 131, self.y + 100, bb.intelligence[1])
            zts:显示(self.x + 131, self.y + 123, bb.intelligence[2])
            zts:显示(self.x + 131, self.y + 146, bb.intelligence[3])
            zts:显示(self.x + 131, self.y + 169, bb.intelligence[4])
            zts:显示(self.x + 131, self.y + 192, bb.intelligence[5])
            zts:显示(self.x + 131, self.y + 215, bb.intelligence[6])
            if bb.type == '神兽' then
                zts:显示(self.x + 131, self.y + 238, '★永生★')
            else
                zts:显示(self.x + 131, self.y + 238, bb.age)
            end
            zts:显示(self.x + 131, self.y + 261, bb.growth)
            zts:显示(self.x + 131, self.y + 284, bb.element)
        end
    elseif self.状态 == 2 then
        local jx = self.x + 20
        local jy = self.y + 309
        self.资源组[7]:显示(jx, jy)
        local v1 = bb.maxExtend
        for i = 1, 6 do
            local jxx = jx + yx[i][1]
            local jxy = jy + yx[i][2]
            if i <= v1 then
                self.资源组[9]:显示(jxx, jxy)
                if self.鼠标 and self.资源组[9]:是否选中(x, y) then
                    tp.提示:内丹提示(x, y, self.资源组[9], {名称 = '可用的内丹技能格', 说明 = '可以学习的内丹技能'})
                    self.焦点 = true
                end
            else
                self.资源组[8]:显示(jxx, jxy)
                if self.鼠标 and self.资源组[8]:是否选中(x, y) then
                    tp.提示:内丹提示(x, y, self.资源组[8], {名称 = '不可用内丹技能格', 说明 = '召唤兽可用内丹格数量与其参战等级相关'})
                    self.焦点 = true
                end
            end
            if self.内丹[i] ~= nil then
                self.内丹[i].模型:显示(jxx, jxy)
                self.资源组[15]:显示(jxx, jxy)
                if self.内丹[i].模型:是否选中(鼠标.x, 鼠标.y) then
                    tp.提示:内丹提示(鼠标.x, 鼠标.y, self.内丹[i].模型, self.内丹[i])
                end
            end
        end
    elseif self.状态 == 3 then
        local jx = self.x + 20
        local jy = self.y + 309
        self.资源组[11]:显示(jx, jy)
        self.进阶[16]:显示(jx + 40, jy + 7)
        if self.进阶[16]:是否选中(鼠标.x, 鼠标.y) then
            tp.提示:自定义(鼠标.x, 鼠标.y, '#W/使用#Y/易经丹#W/可以提升该召唤兽灵性,当灵性到达到50可以获得新的造型')
        end
        if bb.spirituality > 0 and bb.spirituality < 0 then
        elseif bb.spirituality > 0 and bb.spirituality <= 10 then
            self.进阶[1]:显示(jx + 39, jy + 6)
        elseif bb.spirituality > 10 and bb.spirituality <= 20 then
            self.进阶[2]:显示(jx + 39, jy + 6)
        elseif bb.spirituality > 20 and bb.spirituality <= 30 then
            self.进阶[3]:显示(jx + 39, jy + 6)
        elseif bb.spirituality > 30 and bb.spirituality <= 40 then
            self.进阶[4]:显示(jx + 39, jy + 6)
        elseif bb.spirituality > 40 and bb.spirituality <= 50 then
            self.进阶[5]:显示(jx + 39, jy + 6)
        elseif bb.spirituality > 50 and bb.spirituality <= 60 then
            self.进阶[6]:显示(jx + 39, jy + 6)
        elseif bb.spirituality > 60 and bb.spirituality <= 70 then
            self.进阶[7]:显示(jx + 39, jy + 6)
        elseif bb.spirituality > 70 and bb.spirituality <= 80 then
            self.进阶[8]:显示(jx + 39, jy + 6)
        elseif bb.spirituality > 80 and bb.spirituality <= 90 then
            self.进阶[9]:显示(jx + 39, jy + 6)
        elseif bb.spirituality > 90 and bb.spirituality <= 91 then
            self.进阶[10]:显示(jx + 39, jy + 6)
        elseif bb.spirituality > 91 and bb.spirituality <= 93 then
            self.进阶[11]:显示(jx + 39, jy + 6)
        elseif bb.spirituality > 93 and bb.spirituality <= 97 then
            self.进阶[12]:显示(jx + 39, jy + 6)
        elseif bb.spirituality >= 98 then
            self.进阶[13]:显示(jx + 39, jy + 6)
        end
        if bb.spirituality > 80 and bb.extSkill == '无' then
            self.进阶[14]:显示(jx + 51, jy + 30)
        elseif bb.spirituality > 80 and bb.extSkill ~= '无' then
            self.进阶[15]:显示(jx + 67, jy + 36)
        end
        if bb.extSkill ~= '无' then
            zts1:置颜色(0xFFFFFFA4)
            zts1:显示(jx + 74, jy + 45, bb.extSkill)
            zts1:置颜色(0xFFFFFFFF)
        end
        if (self.进阶[14]:是否选中(鼠标.x, 鼠标.y) or self.进阶[15]:是否选中(鼠标.x, 鼠标.y)) and bb.特性几率 ~= 0 and bb.特性 ~= '无' then
            -- tp.提示:特性(鼠标.x, 鼠标.y, bb.extSkill, bb.lv, bb.特性几率)
            tp.提示:特性(鼠标.x, 鼠标.y, bb.extSkill, bb.lv, 43)
        end
        zts1:置颜色(0xFFFFFFFF)
        zts1:显示(jx + 65, jy + 115, '灵性:' .. bb.spirituality)
    end
    for i = 1, 3 do
        self.物品[i]:置坐标(self.x + 37 + (i - 1) * 60, self.y + 31)
        self.物品[i]:显示(dt, x, y, self.鼠标)
        if self.物品[i].物品 ~= nil and self.物品[i].焦点 then
            tp.提示:道具行囊(x, y, self.物品[i].物品)
        end
    end
    zts:置颜色(-16777216)
    zts:显示(self.x + 131, self.y + 100, bb.intelligence[1])
    zts:显示(self.x + 131, self.y + 123, bb.intelligence[2])
    zts:显示(self.x + 131, self.y + 146, bb.intelligence[3])
    zts:显示(self.x + 131, self.y + 169, bb.intelligence[4])
    zts:显示(self.x + 131, self.y + 192, bb.intelligence[5])
    zts:显示(self.x + 131, self.y + 215, bb.intelligence[6])
    if bb.type == '神兽' then
        zts:显示(self.x + 131, self.y + 238, '★永生★')
    else
        zts:显示(self.x + 131, self.y + 238, bb.age)
    end
    zts:显示(self.x + 131, self.y + 261, bb.growth)
    zts:显示(self.x + 131, self.y + 284, bb.element)
end

function 场景类_召唤兽资质栏:显示(dt, x, y)
    if 开发调试 then
        self:BP显示(dx, x, y)
    else
        self.焦点 = false
        self.资源组[2]:更新(x, y)
        self.资源组[3]:更新(x, y, self.状态 ~= 1)
        self.资源组[4]:更新(x, y, self.状态 ~= 2)
        self.资源组[5]:更新(x, y, self.状态 ~= 3)
        self.资源组[15]:更新()
        if self.资源组[2]:事件判断() then
            self:打开()
            return false
        elseif self.资源组[3]:事件判断() then
            self.状态 = 1
        elseif self.资源组[4]:事件判断() then
            self.状态 = 2
        elseif self.资源组[5]:事件判断() then
            self.状态 = 3
        end
        self.资源组[1]:显示(self.x, self.y)
        self.资源组[14]:显示(self.x + 6, self.y + 3)
        tp.窗口标题背景_:置区域(0, 0, 84, 16)
        tp.窗口标题背景_:显示(self.x + 71, self.y + 3)
        zts1:置字间距(1)
        zts1:显示(self.x + 76, self.y + 3, '召唤兽资质')
        zts1:置字间距(0)
        --self.资源组[12]:显示(self.x+30,self.y+27)
        for i = 1, 3 do
            tp.宝宝装备背景[i]:显示(self.x + 35 + (i - 1) * 60, self.y + 31)
        end
        zts1:置字间距(10)
        for i = 0, 5 do
            zts1:显示(self.x + 23, self.y + 98 + i * 23, bds[i + 1])
            self.资源组[13]:显示(self.x + 124, self.y + 96 + i * 23)
        end
        zts1:置字间距(58)
        zts1:置颜色(-1404907)
        for i = 0, 2 do
            zts1:显示(self.x + 23, self.y + 236 + i * 23, bds1[i + 1])
            self.资源组[13]:显示(self.x + 124, self.y + 234 + i * 23)
        end
        zts1:置颜色(4294967295)
        zts1:置字间距(0)
        self.资源组[2]:显示(self.x + 216, self.y + 5)
        self.资源组[3]:显示(self.x + 208, self.y + 305, true, nil, nil, self.状态 == 1, 2)
        self.资源组[4]:显示(self.x + 208, self.y + 351, true, nil, nil, self.状态 == 2, 2)
        self.资源组[5]:显示(self.x + 208, self.y + 397, true, nil, nil, self.状态 == 3, 2)
        local xx = 0
        local yy = 0
        if self.状态 == 1 then
            for i = 1, 12 do
                local jx = self.x + 20 + (xx * 41)
                local jy = self.y + 309 + (yy * 41)
                self.资源组[6]:显示(jx, jy)
                xx = xx + 1
                if xx > 3 then
                    xx = 0
                    yy = yy + 1
                end
            end
            self.b = 0
            if self.技能数量 > 12 or (bb.法术认证 ~= nil and self.技能数量 > 12) then
                self.显示数量 = 12
                if self.技能页数 == 1 then
                    self.资源组[17]:更新(x, y)
                    self.资源组[17]:显示(self.x + 192, self.y + 406)
                    if self.资源组[17]:事件判断() then
                        self.技能页数 = self.技能页数 + 1
                    end
                else
                    self.资源组[16]:更新(x, y)
                    self.资源组[16]:显示(self.x + 192, self.y + 326)
                    if self.资源组[16]:事件判断() then
                        self.技能页数 = self.技能页数 - 1
                    end
                end
            else
                self.显示数量 = self.技能数量
            end
            if bb.法术认证 ~= nil then
                if #bb.技能 > 12 and self.技能页数 == 2 then
                    local xx = 3
                    local yy = 2
                    local jx = self.x + 20 + (xx * 41)
                    local jy = self.y + 309 + (yy * 41)
                    self.资源组[6]:显示(jx, jy)
                    self.认证格子:置坐标(jx + 3, jy + 2)
                    self.认证格子:显示(x, y, self.鼠标)
                    引擎.画线(jx + 3, jy + 2, jx + 3 + 40, jy + 2, 红色)
                    引擎.画线(jx + 3, jy + 2 + 40, jx + 3 + 40, jy + 2 + 40, 红色)
                    引擎.画线(jx + 3, jy + 2, jx + 3, jy + 2 + 40, 红色)
                    引擎.画线(jx + 3 + 40, jy + 2, jx + 3 + 40, jy + 2 + 40, 红色)
                    if self.认证格子.焦点 and self.认证格子.技能 ~= nil then
                        tp.提示:技能(x, y, self.认证格子.技能)
                    end
                elseif #bb.技能 <= 12 and self.技能页数 == 1 then
                    local xx = 3
                    local yy = 2
                    local jx = self.x + 20 + (xx * 41)
                    local jy = self.y + 309 + (yy * 41)
                    self.资源组[6]:显示(jx, jy)
                    self.认证格子:置坐标(jx + 3, jy + 2)
                    self.认证格子:显示(x, y, self.鼠标)
                    引擎.画线(jx + 3, jy + 2, jx + 3 + 40, jy + 2, 红色)
                    引擎.画线(jx + 3, jy + 2 + 40, jx + 3 + 40, jy + 2 + 40, 红色)
                    引擎.画线(jx + 3, jy + 2, jx + 3, jy + 2 + 40, 红色)
                    引擎.画线(jx + 3 + 40, jy + 2, jx + 3 + 40, jy + 2 + 40, 红色)
                    if self.认证格子.焦点 and self.认证格子.技能 ~= nil then
                        tp.提示:技能(x, y, self.认证格子.技能)
                    end
                end
            end
            for n = 1, self.显示数量 do
                self.a = n / 4
                if (self.a < 1) then
                    self.a = 1
                elseif (self.a > 1 and self.a < 2) then
                    self.a = 2
                elseif (self.a > 2 and self.a < 3) then
                    self.a = 3
                end
                self.b = self.b + 1
                if (self.b == 5) then
                    self.b = 1
                end
                self.显示序列 = self.技能页数 * 12 - 12 + n
                if self.显示序列 > self.技能数量 then
                    return 0
                end
                local jx = self.x + 20 + (self.b * 41 - 41)
                local jy = self.y + 309 + (self.a * 41 - 41)
                self.技能[self.显示序列]:置坐标(jx + 3, jy + 2)
                self.技能[self.显示序列]:显示(x, y, self.鼠标)
                if self.技能[self.显示序列].焦点 and self.技能[self.显示序列].技能 ~= nil then
                    tp.提示:技能(x, y, self.技能[self.显示序列].技能)
                end
                zts:置颜色(-16777216)
                zts:显示(self.x + 131, self.y + 100, bb.攻击资质)
                zts:显示(self.x + 131, self.y + 123, bb.防御资质)
                zts:显示(self.x + 131, self.y + 146, bb.体力资质)
                zts:显示(self.x + 131, self.y + 169, bb.法力资质)
                zts:显示(self.x + 131, self.y + 192, bb.速度资质)
                zts:显示(self.x + 131, self.y + 215, bb.躲闪资质)
                if bb.种类 == '神兽' then
                    zts:显示(self.x + 131, self.y + 238, '★永生★')
                else
                    zts:显示(self.x + 131, self.y + 238, bb.寿命)
                end
                zts:显示(self.x + 131, self.y + 261, bb.成长)
                zts:显示(self.x + 131, self.y + 284, bb.五行)
            end
        elseif self.状态 == 2 then
            local jx = self.x + 20
            local jy = self.y + 309
            self.资源组[7]:显示(jx, jy)
            local v1 = bb.内丹.内丹上限
            for i = 1, 6 do
                local jxx = jx + yx[i][1]
                local jxy = jy + yx[i][2]
                if i <= v1 then
                    self.资源组[9]:显示(jxx, jxy)
                    if self.鼠标 and self.资源组[9]:是否选中(x, y) then
                        tp.提示:内丹提示(x, y, self.资源组[9], {名称 = '可用的内丹技能格', 说明 = '可以学习的内丹技能'})
                        self.焦点 = true
                    end
                else
                    self.资源组[8]:显示(jxx, jxy)
                    if self.鼠标 and self.资源组[8]:是否选中(x, y) then
                        tp.提示:内丹提示(x, y, self.资源组[8], {名称 = '不可用内丹技能格', 说明 = '召唤兽可用内丹格数量与其参战等级相关'})
                        self.焦点 = true
                    end
                end
                if self.内丹[i] ~= nil then
                    self.内丹[i].模型:显示(jxx, jxy)
                    self.资源组[15]:显示(jxx, jxy)
                    if self.内丹[i].模型:是否选中(鼠标.x, 鼠标.y) then
                        tp.提示:内丹提示(鼠标.x, 鼠标.y, self.内丹[i].模型, self.内丹[i])
                    end
                end
            end
        elseif self.状态 == 3 then
            local jx = self.x + 20
            local jy = self.y + 309
            self.资源组[11]:显示(jx, jy)
            self.进阶[16]:显示(jx + 40, jy + 7)
            if self.进阶[16]:是否选中(鼠标.x, 鼠标.y) then
                tp.提示:自定义(鼠标.x, 鼠标.y, '#W/使用#Y/易经丹#W/可以提升该召唤兽灵性,当灵性到达到50可以获得新的造型')
            end
            if bb.灵性 > 0 and bb.灵性 < 0 then
            elseif bb.灵性 > 0 and bb.灵性 <= 10 then
                self.进阶[1]:显示(jx + 39, jy + 6)
            elseif bb.灵性 > 10 and bb.灵性 <= 20 then
                self.进阶[2]:显示(jx + 39, jy + 6)
            elseif bb.灵性 > 20 and bb.灵性 <= 30 then
                self.进阶[3]:显示(jx + 39, jy + 6)
            elseif bb.灵性 > 30 and bb.灵性 <= 40 then
                self.进阶[4]:显示(jx + 39, jy + 6)
            elseif bb.灵性 > 40 and bb.灵性 <= 50 then
                self.进阶[5]:显示(jx + 39, jy + 6)
            elseif bb.灵性 > 50 and bb.灵性 <= 60 then
                self.进阶[6]:显示(jx + 39, jy + 6)
            elseif bb.灵性 > 60 and bb.灵性 <= 70 then
                self.进阶[7]:显示(jx + 39, jy + 6)
            elseif bb.灵性 > 70 and bb.灵性 <= 80 then
                self.进阶[8]:显示(jx + 39, jy + 6)
            elseif bb.灵性 > 80 and bb.灵性 <= 90 then
                self.进阶[9]:显示(jx + 39, jy + 6)
            elseif bb.灵性 > 90 and bb.灵性 <= 91 then
                self.进阶[10]:显示(jx + 39, jy + 6)
            elseif bb.灵性 > 91 and bb.灵性 <= 93 then
                self.进阶[11]:显示(jx + 39, jy + 6)
            elseif bb.灵性 > 93 and bb.灵性 <= 97 then
                self.进阶[12]:显示(jx + 39, jy + 6)
            elseif bb.灵性 >= 98 then
                self.进阶[13]:显示(jx + 39, jy + 6)
            end
            if bb.灵性 > 80 and bb.特性 == '无' then
                self.进阶[14]:显示(jx + 51, jy + 30)
            elseif bb.灵性 > 80 and bb.特性 ~= '无' then
                self.进阶[15]:显示(jx + 67, jy + 36)
            end
            if bb.特性 ~= '无' then
                zts1:置颜色(0xFFFFFFA4)
                zts1:显示(jx + 74, jy + 45, bb.特性)
                zts1:置颜色(0xFFFFFFFF)
            end
            if (self.进阶[14]:是否选中(鼠标.x, 鼠标.y) or self.进阶[15]:是否选中(鼠标.x, 鼠标.y)) and bb.特性几率 ~= 0 and bb.特性 ~= '无' then
                tp.提示:特性(鼠标.x, 鼠标.y, bb.特性, bb.等级, bb.特性几率)
            end
            zts1:置颜色(0xFFFFFFFF)
            zts1:显示(jx + 65, jy + 115, '灵性:' .. bb.灵性)
        end
        for i = 1, 3 do
            self.物品[i]:置坐标(self.x + 37 + (i - 1) * 60, self.y + 31)
            self.物品[i]:显示(dt, x, y, self.鼠标)
            if self.物品[i].物品 ~= nil and self.物品[i].焦点 then
                tp.提示:道具行囊(x, y, self.物品[i].物品)
            end
        end
        zts:置颜色(-16777216)
        zts:显示(self.x + 131, self.y + 100, bb.攻击资质)
        zts:显示(self.x + 131, self.y + 123, bb.防御资质)
        zts:显示(self.x + 131, self.y + 146, bb.体力资质)
        zts:显示(self.x + 131, self.y + 169, bb.法力资质)
        zts:显示(self.x + 131, self.y + 192, bb.速度资质)
        zts:显示(self.x + 131, self.y + 215, bb.躲闪资质)
        if bb.种类 == '神兽' then
            zts:显示(self.x + 131, self.y + 238, '★永生★')
        else
            zts:显示(self.x + 131, self.y + 238, bb.寿命)
        end
        zts:显示(self.x + 131, self.y + 261, bb.成长)
        zts:显示(self.x + 131, self.y + 284, bb.五行)
    end
end

function 场景类_召唤兽资质栏:取内丹数据(wd, s)
    local wds = {}

    if wd == '迅敏' then
        wds.说明 = '提升召唤兽伤害力与速度，提升效果受召唤兽自身等级影响。'
        wds.效果 = '增加' .. (s * 20) .. '点伤害与' .. (s * 10) .. '点速度，随内丹等级提升而增加。'
        wds.资源 = 'item.wdf'
        wds.模型 = 0x6FA0B3A8
    elseif wd == '狂怒' then
        wds.说明 = '提升必杀/高级必杀技能触发时造成的伤害，但是受到水、土二系法术攻击时将承受额外的伤害。'
        wds.效果 = '必杀时增加' .. (s * 80) .. '点伤害，但是额外受到15%水、土系法术伤害。'
        wds.资源 = 'item.wdf'
        wds.模型 = 0x956BD457
    elseif wd == '阴伤' then
        wds.说明 = '提升连击/高级连击技能第二次攻击造成的伤害，但是受到火、雷二系法术攻击时将承受额外的伤害。'
        wds.效果 = '连击时增加' .. (s * 50) .. '点伤害，但是额外受到15%火、雷系法术伤害。'
        wds.资源 = 'item.wdf'
        wds.模型 = 0x3EF0A9BF
    elseif wd == '静岳' then
        wds.说明 = '提升召唤兽灵力与气血，提升效果受召唤兽自身等级影响。'
        wds.效果 = '增加' .. (s * 32) .. '点灵力与' .. (s * 80) .. '点气血，随内丹等级提升而增加。'
        wds.资源 = 'item.wdf'
        wds.模型 = 0xF58C6B1D
    elseif wd == '擅咒' then
        wds.说明 = '你对目标的法术伤害得到提升。'
        wds.效果 = '法术伤害结果增加' .. (s * 12) .. '点。'
        wds.资源 = 'item.wdf'
        wds.模型 = 0x4D74B795
    elseif wd == '灵身' then
        wds.说明 = '提升法术爆击/高级法术爆击触发时的伤害，但是受到携带强力与高级强力技能召唤兽物理攻击时，承受额外的伤害。'
        wds.效果 = '法术暴击伤害增加' .. (s * 7) .. '%，但是受到强力、高强力技能额外伤害。'
        wds.资源 = 'item.wdf'
        wds.模型 = 0x55124270
    elseif wd == '矫健' then
        wds.说明 = '提升召唤兽气血与速度，提升效果受召唤兽自身等级影响。'
        wds.效果 = '增加' .. (s * 120) .. '点气血与' .. (s * 15) .. '点速度，随召唤兽等级提升而增加。'
        wds.资源 = 'item.wdf'
        wds.模型 = 0x3877515B
    elseif wd == '深思' then
        wds.说明 = '提升高冥思技能效果。'
        wds.效果 = '高冥思效果增加' .. (s * 5) .. '点'
        wds.资源 = 'item.wdf'
        wds.模型 = 0x9912B979
    elseif wd == '钢化' then
        wds.说明 = '拥有防御或高级防御技能的召唤兽能提升防御效果，但在受到除固定伤害外的其他法术攻击时，受到的伤害增加。'
        wds.效果 = '防御、高级防御效果增加' .. (s * 20) .. '点，随召唤兽等级提升而增加，所受法术伤害增加10%。'
        wds.资源 = 'item.wdf'
        wds.模型 = 0x89C1F027
    elseif wd == '坚甲' then
        wds.说明 = '拥有反震或高级反震技能的召唤兽能提升对敌人造成的反震伤害。'
        wds.效果 = '对敌人所造成的反震伤害增加' .. (s * 100) .. '点。'
        wds.资源 = 'item.wdf'
        wds.模型 = 0x2788B6E8
    elseif wd == '慧心' then
        wds.说明 = '提升召唤兽抵抗封印几率。'
        wds.效果 = '增加' .. (s * 6) .. '%的抗封印几率。'
        wds.资源 = 'item.wdf'
        wds.模型 = 0xB6A27748
    elseif wd == '撞击' then
        wds.说明 = '提升召唤兽物理攻击命中几率，提升效果受召唤兽体质点影响，同时提升一定的伤害结果。'
        wds.效果 = '物理攻击时增加' .. (s * 5) .. '%命中几率，效果与召唤兽体质点相关，同时增加5点伤害结果。'
        wds.资源 = 'item.wdf'
        wds.模型 = 0xE837F9B1
    elseif wd == '无畏' then
        wds.说明 = '提升对拥有反震/高级反震技能目标的物理伤害。'
        wds.效果 = '对待有反震、高级反震技能的目标造成的物理伤害增加' .. (s * 2) .. '%。'
        wds.资源 = 'item.wdf'
        wds.模型 = 0xE8FDD3F4
    elseif wd == '愤恨' then
        wds.说明 = '提升召唤兽对拥有幸运/高级幸运技能目标的物理伤害。'
        wds.效果 = '对待有幸运、高级幸运技能的目标造成的物理伤害增加' .. (s * 2) .. '%。'
        wds.资源 = 'item.wdf'
        wds.模型 = 0x9F97DB7F
    elseif wd == '淬毒' then
        wds.说明 = '提升毒/高级毒技能的中毒触发几率。'
        wds.效果 = '命中目标后致毒的几率增加' .. (s * 5) .. '%。'
        wds.资源 = 'item.wdf'
        wds.模型 = 0x4A491950
    elseif wd == '狙刺' then
        wds.说明 = '提升召唤兽对施法选定目标的法术伤害，提升效果受召唤兽等级影响'
        wds.效果 = '对施法选定目标法术伤害增加' .. (s * 35) .. '点，效果随召唤兽等级提升而增加。'
        wds.资源 = 'item.wdf'
        wds.模型 = 0x9762CCF9
    elseif wd == '连环' then
        wds.说明 = '提升连击/高级连击技能触发连击的几率。'
        wds.效果 = '连击的几率增加' .. (s * 2) .. '%。'
        wds.资源 = 'item.wdf'
        wds.模型 = 0xE2D19F8F
    elseif wd == '圣洁' then
        wds.说明 = '提升驱鬼/高级驱鬼技对于鬼魂/高级鬼魂技能召唤兽的法术伤害'
        wds.效果 = '驱鬼的效果在原基础上增加' .. (s * 10) .. '%。'
        wds.资源 = 'item.wdf'
        wds.模型 = 0x809E53A3
    elseif wd == '灵光' then
        wds.说明 = '提升召唤兽法术伤害，提升效果受召唤兽自身法力点数影响。'
        wds.效果 = '增加' .. (s * 30) .. '点法术伤害，效果受自身法力点数影响。'
        wds.资源 = 'item.wdf'
        wds.模型 = 0xC0EAFCA3
    elseif wd == '神机步' then
        wds.说明 = '进入战斗后三回合内提升召唤兽躲避力。'
        wds.效果 = '进入战斗时，' .. (s * 3) .. '回合内的躲避值增加100%。'
        wds.资源 = 'item.wdf'
        wds.模型 = 0x19D18973
    elseif wd == '腾挪劲' then
        wds.说明 = '召唤兽受到物理攻击时，有一定几率化解部分伤害。'
        wds.效果 = '受到物理攻击时有' .. (s * 3) .. '%的几率抵挡50%的伤害。'
        wds.资源 = 'item.wdf'
        wds.模型 = 0x06EF9E7B
    elseif wd == '玄武躯' then
        wds.说明 = '提升召唤兽气血，提升效果受召唤兽等级影响，但是将减少召唤兽所有攻击方式造成的伤害。'
        wds.效果 = '增加' .. (s * 30) .. '点气血，随召唤兽等级提升而增加，对目标造成伤害减少50%。'
        wds.资源 = 'item.wdf'
        wds.模型 = 0xC842B66C
    elseif wd == '龙胄铠' then
        wds.说明 = '提升召唤兽防御，提升效果受召唤兽等级影响，但是将减少召唤兽所有攻击方式造成的伤害。'
        wds.效果 = '增加' .. (s * 20) .. '点防御，随召唤兽等级提升而增加，对目标造成伤害减少50%。'
        wds.资源 = 'item.wdf'
        wds.模型 = 0x4E9FBEE0
    elseif wd == '玉砥柱' then
        wds.说明 = '降低召唤兽受到壁垒击破技能攻击时所承受的伤害，但是将减少召唤兽所有攻击方式造成的伤害。'
        wds.效果 = '受到壁垒击破技能伤害减少' .. (s * 7) .. '%；但是对其他目标造成的伤害减少20%。'
        wds.资源 = 'item.wdf'
        wds.模型 = 0x5DAD21DF
    elseif wd == '碎甲刃' then
        wds.说明 = '召唤兽普通物理攻击时将有一定几率降低攻击目标的物理防御，效果持续两回合。'
        wds.效果 = '普通物理攻击后减低目标后有30%几率降低目标' .. (s * 20) .. '点防御值，持续2回合，效果受自身力量点影响。'
        wds.资源 = 'item.wdf'
        wds.模型 = 0xCDDAE9FF
    elseif wd == '阴阳护' then
        wds.说明 = '降低召唤兽保护其他目标时所承受的伤害。'
        wds.效果 = '保护目标时承受的伤害减少' .. (s * 10) .. '%。'
        wds.资源 = 'item.wdf'
        wds.模型 = 0x9041DD3F
    elseif wd == '凛冽气' then
        wds.说明 = '携带此内丹的召唤兽在战斗中降低本方包含其在内所有召唤兽的逃跑几率。'
        wds.效果 = '本方所有召唤兽逃跑的几率减少' .. (s * 10) .. '%。'
        wds.资源 = 'item.wdf'
        wds.模型 = 0x38808205
    elseif wd == '舍身击' then
        wds.说明 = '提升物理攻击造成的伤害，提升效果受召唤兽自身力量点数影响。'
        wds.效果 = '物理攻击伤害结果增加' .. (s * 30) .. '点，效果受自身力量点影响。'
        wds.资源 = 'item.wdf'
        wds.模型 = 0x10E2B4A7
    elseif wd == '电魂闪' then
        wds.说明 = '使用单体法术命中目标时将有一定几率驱散目标的某种增益状态。'
        wds.效果 = '单体法术命中目标时有' .. (s * 8) .. '%几率驱散目标随机一种状态。'
        wds.资源 = 'item.wdf'
        wds.模型 = 0x624D3F68
    elseif wd == '通灵法' then
        wds.说明 = '提升召唤兽忽视目标法术减免效果的能力。'
        wds.效果 = '忽视' .. (s * 4) .. '%的法术伤害减免能力。'
        wds.资源 = 'item.wdf'
        wds.模型 = 0xBD739B98
    elseif wd == '双星爆' then
        wds.说明 = '提升法术连击/高级法术连击技能触发第二次法术攻击造成的伤害。'
        wds.效果 = '法术连击第二下伤害增加' .. (s * 12) .. '%。'
        wds.资源 = 'item.wdf'
        wds.模型 = 0x8AD71FAF
    elseif wd == '催心浪' then
        wds.说明 = '提升法术波动/高级法术波动技能触发时的伤害波动下限。'
        wds.效果 = '法术波动下限提升了。'
        wds.资源 = 'item.wdf'
        wds.模型 = 0x5CEDA8EC
    elseif wd == '隐匿击' then
        wds.说明 = '降低拥有隐身/高级隐身技能的召唤兽在隐身状态下减少的伤害值，但隐身结束后将消耗额外的魔法。'
        wds.效果 = '隐身状态下降低的伤害降低' .. (s * 1) .. '%，同时隐身结束后额外消耗100%的魔法值。'
        wds.资源 = 'item.wdf'
        wds.模型 = 0x0A21302B
    elseif wd == '生死决' then
        wds.说明 = '提升召唤兽将自身防御的一部分转化为伤害力的几率，提升效果持续到本回合结束。'
        wds.效果 = '增加' .. (s * 3) .. '%的狂暴几率。'
        wds.资源 = 'item.wdf'
        wds.模型 = 0x2AA03A67
    elseif wd == '血债偿' then
        wds.说明 = '本方不带本技能召唤兽每被击飞一次，提升一次拥有本技能召唤兽对目标造成的法术伤害，持续到战斗结束。提升效果最多叠加5次，且受召唤兽自身魔力点数影响，不能与鬼魂和高级鬼魂技能共存。'
        wds.效果 = '本方每被击飞一个不带有此技能的召唤兽，自身对目标造成的法术伤害增加' .. (s * 50) .. '点。持续到战斗结束，最多可叠加5次，此技能与鬼魂、高鬼魂冲突，效果受自身魔力点数影响。'
        wds.资源 = 'item.wdf'
        wds.模型 = 0x97117DEE
    end
    return wds
end

function 场景类_召唤兽资质栏:检查点(x, y)
    if self.资源组 ~= nil and self.资源组[1]:是否选中(x, y) then
        return true
    end
end

function 场景类_召唤兽资质栏:初始移动(x, y)
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

function 场景类_召唤兽资质栏:开始移动(x, y)
    if self.鼠标 then
        self.x = x - self.xx
        self.y = y - self.yy
    end
end

return 场景类_召唤兽资质栏
