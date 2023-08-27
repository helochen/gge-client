--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2021-03-05 07:30:45
--======================================================================--
local collectgarbage = collectgarbage
local xys = 生成XY
local jr = require('script/全局/假人')
local wjtp = require('script/全局/玩家')
local cs = require('script/场景类/传送点')
local zys = require('script/场景类/自由事件')
local jl = require('gge精灵类')
local tp = nil
local floor = math.floor
local lsph = nil
local insert = table.insert
local ygs = 引擎.取野怪
local mls = 引擎.取明雷
local zysj, zt, lsph
local BGM = 取Bgm
local cjs = 引擎.取场景等级
local jtus = 引擎.截图到纹理
local hmzb = 取画面坐标
local wj = 引擎.文件是否存在
local 场景类_地图 = class()

function 场景类_地图:初始化(根)
    tp = 根
    zt = tp.字体表.描边字体
    self.战斗 = {}
    self.地图 = require('script/资源类/地图类')(根, self)
    self.选中窗口 = 0
    self.移动窗口 = false
    self.抓取物品 = nil
    self.抓取物品ID = nil
    self.抓取物品注释 = nil
    self.战斗提示 = ''
    self.战斗提示时间 = 0
    self.过度纹理 = require('gge纹理类')():渲染目标(全局游戏宽度, 全局游戏高度)
    -- 创建一个截图的背景，实现官网的过度功能
    self.过度进度 = 155
    self.过度时间 = 30
    self.开启场景加载 = false
    self.屏幕坐标 = xys()
    self.滑屏 = xys()
    self.自由事件 = nil
    self.传送区 = nil
    self.传送时间 = 0
    self.当前刷新 = nil
    self.场景最低等级 = nil
    self.场景最高等级 = nil
    self.假人 = {}
    self.玩家 = {}
    self.传送 = {}
end

function 场景类_地图:转移(地图, X, Y, 内容, 传送点)
    tp.进程 = 4
    zysj = 引擎.自由事件
    tp.角色坐标.x, tp.角色坐标.y = floor(X), floor(Y)
    self.滑屏.x, self.滑屏.y = floor(X), floor(Y)
    tp.当前地图 = 地图
    local res = tonumber(string.sub(tp.当前地图, -1))
    local bp = tonumber(string.sub(tp.当前地图, -1))
    if tp.窗口.小地图.可视 then
        tp.窗口.小地图:打开(9999999999999999999999)
    end
    if 地图 >= 1600 and 地图 <= 1620 then
        self.地图:加载(wdf配置 .. '/scene/1514.map')
    elseif tp.当前地图 == 5001 then
        self.地图:加载(wdf配置 .. '/scene/1042.map')
    elseif 地图 >= 6003 and 地图 <= 6009 then
        self.地图:加载(wdf配置 .. '/scene/1197.map')
    elseif 地图 >= 6010 and 地图 <= 6019 then
        self.地图:加载(wdf配置 .. '/scene/1876.map')
    elseif 地图 == 6020 then
        self.地图:加载(wdf配置 .. '/scene/1514.map')
    else
        self.地图:加载(wdf配置 .. '/scene/' .. tp.当前地图 .. '.map')
    end
    --self.地图:加载(wdf配置.."/scene/"..地图..".map")
    self.人物 = require('script/全局/人物')(tp)
    -- self:播放音乐()
    tp.音乐 = tp.资源:载入(wdf配置 .. '/Audio/' .. tp.当前地图 .. '.mp3', '音乐', nil)
    tp.音乐:播放(true)
    tp.音乐:置音量(tp.音量)

    self.玩家 = {}
    self.传送 = {}

    self.场景人物 = {}
    insert(self.场景人物, self.人物)
    -- 开发调试
    if 开发调试 then
        local v = 内容
        local b = mls(tp.当前地图)
        if v ~= nil and v ~= '' and #v > 0 then
            for n = 1, #v do
                if v[n] ~= nil then
                    v[n].idx = n
                    insert(self.假人[tp.当前地图], jr(v[n]))
                end
            end
        end
        local c = 传送点
        if c ~= nil and #c > 0 then
            for n = 1, #c do
                self.传送[n] = cs(c[n].x, c[n].y, c[n].id)
                q = nil
            end
        end
    else
        -- self.场景人物 = {}
        -- insert(self.场景人物, self.人物)
        -- 原始处理数据方法
        -- tp.假人库:刷新远古()
        -- tp.假人库:刷新远古(tp.当前地图)
        local v = 内容[1]
        local b = mls(tp.当前地图)
        if #v > 0 then
            for n = 1, #v do
                if v[n] ~= nil then
                    v[n].编号 = n
                    insert(self.假人, jr(v[n]))
                end
            end
        end
        local c = 内容[2]
        if #c > 0 then
            for n = 1, #c do
                self.传送[n] = cs(c[n].x, c[n].y, c[n].切换)
                q = nil
            end
        end
    end
    -- 自由事件
    local zy = zysj(tp.当前地图) -- TODO 自由事件逻辑处理
    if zy ~= nil then
        self.自由事件 = {}
        for i = 1, #zy do
            if
                ((zy[i][3] ~= nil and tp.剧情进度[zy[i][3]] == zy[i][4]) or zy[i][3] == nil) and
                    ((zy[i][5] ~= nil and tp.剧情开关[zy[i][5]] == zy[i][6]) or zy[i][5] == nil)
             then
                local ab = zys(zy[i])
                insert(self.自由事件, ab)
            end
        end
    end
    tp.窗口.时辰:刷新()
    jtus(self.过度纹理)
    self.过度精灵 = jl(self.过度纹理)
    self.过度进度 = 255
    self.过度时间 = 3
    tp.隐藏UI = true
    tp.恢复UI = true
    self.人物:停止移动()
    collectgarbage('collect')
end

function 场景类_地图:添加玩家(sj)
    if 开发调试 then
        self.玩家[sj.roleId] = wjtp(sj)
        insert(self.场景人物, self.玩家[sj.roleId])
    else
        self.玩家[sj.id] = wjtp(sj)
        insert(self.场景人物, self.玩家[sj.id])
    end
end

function 场景类_地图:删除玩家(角色ID)
    print('删除玩家对象', 角色ID)
    table.remove(self.玩家, 角色ID)
    for i = 1, #self.场景人物 do
        if self.场景人物[i] ~= nil and self.场景人物[i].类型 == '玩家' and self.场景人物[i].玩家ID ~= nil and self.场景人物[i].玩家ID == 角色ID then
            table.remove(self.场景人物, i)
        end
    end
end

function 场景类_地图:玩家队长(角色ID, 是否)
    self.玩家[角色ID].队长开关 = 是否
end

function 场景类_地图:玩家战斗(角色ID, 是否)
    self.玩家[角色ID].战斗开关 = 是否
end

function 场景类_地图:更新行走(路径, 行走玩家ID)
    if self.玩家[行走玩家ID] ~= nil and self.玩家[行走玩家ID].玩家ID ~= nil and self.玩家[行走玩家ID].玩家ID == 行走玩家ID and self.地图.寻路 ~= nil then
        local a = xys(floor(self.玩家[行走玩家ID].坐标.x / 20), floor(self.玩家[行走玩家ID].坐标.y / 20))
        if 开发调试 then 
            local move= {};
            move.x = 路径.x;
            move.y = 路径.y;
            move.数字id = 路径.id;
            move.序号 = 1001;-- ?
            move.距离 = 0;
            self.玩家[行走玩家ID].目标格子 = self.地图.寻路:寻路(a, move)
        else
            self.玩家[行走玩家ID].目标格子 = self.地图.寻路:寻路(a, 路径)
        end
        self.玩家[行走玩家ID].行走开关 = true
    else
        print('玩家问题...', table.tostring(self.玩家[行走玩家ID]));
    end
end

function 场景类_地图:设置传送(内容)
    local c = 内容
    if #c > 0 then
        for n = 1, #c do
            if 开发调试 then
                self.传送[n] = cs(c[n].x, c[n].y, c[n].id)
            else
                self.传送[n] = cs(c[n].x, c[n].y, n)
            end
            q = nil
        end
    end
    local res = tonumber(string.sub(tp.当前地图, -1))
    local bp = tonumber(string.sub(tp.当前地图, -1))
    -- if tp.当前地图 >= 1340 and tp.当前地图<=1342  then
    -- 	if res == 0 then
    -- 		local c = tp.房屋数据.庭院传送
    -- 		if #c > 0 then
    -- 			for n=1,#c do
    -- 			 	self.传送[n] = cs(c[n].x,c[n].y,n)
    -- 			 	q = nil
    -- 			end
    -- 		end
    -- 	else
    -- 		local c = tp.房屋数据.室内传送
    -- 		if #c > 0 then
    -- 			for n=1,#c do
    -- 			 	self.传送[n] = cs(c[n].x,c[n].y,n)
    -- 			 	q = nil
    -- 			end
    -- 		end
    -- 	end
    -- end
end

function 场景类_地图:设置假人(内容)
    --table.sort(内容,排序)
    if self.玩家 == nil then
        self.玩家 = {}
    end
    if self.传送 == nil then 
        self.传送 = {}
    end
    if self.假人 == nil then
        self.假人 = {}
    end
    collectgarbage('collect')

    if 开发调试 then
        if self.假人[tp.当前地图] == nil then
            self.假人[tp.当前地图] = {}
        end
        local v = 内容.npc
        if v ~= nil and #v > 0 then
            for i = 1, #v do
                if v[i] ~= nil then
                    v[i].idx = i
                    insert(self.假人[tp.当前地图], jr(v[i]))
                end
            end
        end
    else
        local v = 内容
        if self.假人[tp.当前地图] == nil then
            self.假人[tp.当前地图] = {}
            if #v > 0 then
                for i, n in pairs(v) do
                    if v[i] ~= nil then
                        v[i].编号 = i
                        insert(self.假人[tp.当前地图], jr(v[i]))
                    end
                end
            end
        end
    end
    if tp.当前地图 >= 1340 and tp.当前地图 <= 1342 then
        local res = tonumber(string.sub(tp.当前地图, -1))
        if res == 1 then
            local ty = tp.房屋数据.庭院npc
            if #ty > 0 then
                for n = 1, #ty do
                    ty[n].编号 = n
                    insert(self.假人, jr(ty[n]))
                end
            end
        else
            -- local ty = tp.房屋数据.室内npc
            -- if #ty > 0 then
            -- 	for n=1,#ty do
            -- 		ty[n].编号 = n
            -- 	    insert(self.假人,jr(ty[n]))
            -- 	end
            -- end
        end
    end
    if self.场景人物 ~= nil then
        print('场景人物:', table.tostring(self.场景人物) , #self.场景人物)
    else
        print('初始化场景人物')
        self.场景人物 = {}
    end
    insert(self.场景人物, self.人物)
    for i = 1, #self.假人[tp.当前地图] do
        insert(self.场景人物, self.假人[tp.当前地图][i])
    end
    -- for i=1,#lsb do
    -- 	if lsb[i].地图 == 地图 then
    -- 		local npc = jr(lsb[i])
    -- 		insert(self.假人[tp.当前底图],npc)
    -- 		insert(self.场景人物, npc)
    -- 	end
    -- end
end

function 场景类_地图:删除单位(编号)
    local 删除序列 = 0
    for n, v in pairs(tp.场景.场景人物) do
        if tp.场景.场景人物[n].真实编号 == 编号 then
            删除序列 = 编号
        end
    end
    if 删除序列 ~= 0 then
        table.remove(tp.场景.场景人物, 删除序列)
    end
    local 删除序列 = 0
    for n, v in pairs(self.假人[tp.当前地图]) do
        if self.假人[tp.当前地图][n].真实编号 == 编号 then
            删除序列 = 编号
        end
    end
    if 删除序列 ~= 0 then
        table.remove(self.假人[tp.当前地图], 删除序列)
    end
end

function 场景类_地图:传送至(地图, 坐标x, 坐标y, fc)
    if fc ~= nil then
        collectgarbage('collect')
        jtus(self.过度纹理)
        self.过度精灵 = jl(self.过度纹理)
        self.过度进度 = 255
        self.过度时间 = 3
        tp.角色坐标.x, tp.角色坐标.y = floor(坐标x * 20), floor(坐标y * 20)
        self.地图.移动xy.x, self.地图.移动xy.y = tp.角色坐标.x, tp.角色坐标.y
        self.滑屏.x, self.滑屏.y = tp.角色坐标.x, tp.角色坐标.y
        tp.当前地图 = 地图
        if tp.窗口.小地图.可视 then
            tp.窗口.小地图:打开(9999999999999999999999)
        end
        if tp.窗口.跑商商店.可视 then
            tp.窗口.跑商商店:打开()
        end
        self.屏幕坐标 = hmzb(self.滑屏.x, self.滑屏.y, self.地图.宽度, self.地图.高度)
        if tp.当前地图 >= 1600 and tp.当前地图 <= 1620 then
            self.地图:加载(wdf配置 .. '/scene/1514.map')
        elseif tp.当前地图 == 5001 then
            self.地图:加载(wdf配置 .. '/scene/1042.map')
        elseif 地图 >= 6003 and 地图 <= 6009 then
            self.地图:加载(wdf配置 .. '/scene/1197.map')
        elseif 地图 >= 6010 and 地图 <= 6019 then
            self.地图:加载(wdf配置 .. '/scene/1876.map')
        elseif 地图 == 6020 then
            self.地图:加载(wdf配置 .. '/scene/1514.map')
        else
            self.地图:加载(wdf配置 .. '/scene/' .. tp.当前地图 .. '.map')
        end
        self:传送指定()
        local 地图等级 = {}
        地图等级[1], 地图等级[2] = cjs(tp.当前地图)
        if 地图等级[1] ~= nil then
            tp.场景.场景最低等级 = 地图等级[1]
            tp.场景.场景最高等级 = 地图等级[2]
            tp.窗口.消息框:添加文本('#Y/本场景等级为' .. 地图等级[1] .. '-' .. 地图等级[2] .. '级', 'xt')
        else
            tp.场景.场景最低等级 = nil
            tp.场景.场景最高等级 = nil
        end
        return
    end
    self.传送区 = {地图, 坐标x, 坐标y, fc}
end

-- function 场景类_地图:播放音乐(位置)
-- 	local yu = BGM(tp.当前地图)
-- 	if tp.音乐.文件 ~= wdf配置.."/Audio/"..yu..".mp3" then
-- 		if wj(wdf配置.."/Audio/"..yu..".mp3") then
-- 			tp.音乐:停止()
-- 			tp.音乐 = nil
-- 			tp.音乐 = tp.资源:载入(wdf配置.."/Audio/"..yu..".mp3","音乐",nil)
-- 			if tp.音乐开启 then
-- 				tp.音乐:播放(true)
-- 				tp.音乐:置音量(tp.音量)
-- 			end
-- 		end
-- 	end
-- end

function 场景类_地图:传送指定()
    local yu = BGM(tp.当前地图)
    if tp.音乐.文件 ~= wdf配置 .. '/Audio/' .. yu .. '.mp3' then
        if wj(wdf配置 .. '/Audio/' .. yu .. '.mp3') then
            tp.音乐:停止()
            tp.音乐 = nil
            tp.音乐 = tp.资源:载入(wdf配置 .. '/Audio/' .. yu .. '.mp3', '音乐', nil)
            if tp.音乐开启 then
                tp.音乐:播放(true)
                tp.音乐:置音量(tp.音量)
            end
        end
    end
    self.人物:停止移动()
    self.场景人物 = {}
    self.传送 = {}
    self.玩家 = {}
    self.地图.移动xy.x, self.地图.移动xy.y = tp.角色坐标.x, tp.角色坐标.y
    insert(self.场景人物, self.人物)
    tp.窗口.时辰:刷新()
end

function 场景类_地图:显示(dt, x, y)
    self.地图:显示(tp.角色坐标, self.屏幕坐标, x, y, dt)
    全局时辰刷新()
    if tp.战斗中 then
        战斗类:更新(dt, x, y)
        战斗类:显示(dt, x, y)
    else
        if self.战斗.跳转事件 ~= nil then
            if self.战斗.跳转事件 == '贼王' then
                引擎.强盗战斗(true, '贼王', tp.当前地图, 0)
            end
            self.战斗.跳转事件 = nil
        end
        if self.自由事件 ~= nil then
            for i = 1, #self.自由事件 do
                self.自由事件[i]:显示()
            end
        end
    end
    if self.传送 ~= nil and #self.传送 ~= nil then
        for n = 1, #self.传送 do
            if self.传送[n] ~= nil then
                self.传送[n]:更新(dt, xx, yy, 偏移)
            end
        end
    end
end

function 刷新道具逻辑(物品, 指定ID, 及时刷新) -- 及时刷新物品逻辑
    if tp.消息栏焦点 then
        return
    end
    -- 及时刷新有关道具的数据
    if 物品 ~= nil or 及时刷新 ~= nil then
        tp.道具列表[指定ID] = 物品
    end
    if tp.窗口.道具行囊.可视 then
        tp.窗口.道具行囊.物品[指定ID]:置物品(tp.道具列表[指定ID])
    end
    if tp.窗口.宠物炼妖栏.可视 then
        tp.窗口.宠物炼妖栏.物品[指定ID]:置物品(tp.道具列表[指定ID])
    end
    if tp.窗口.宠物洗练栏.可视 then
        tp.窗口.宠物洗练栏.物品[指定ID]:置物品(tp.道具列表[指定ID])
    end
    if tp.窗口.宠物打书内丹栏.可视 then
        tp.窗口.宠物打书内丹栏.物品[指定ID]:置物品(tp.道具列表[指定ID])
    end
    if tp.窗口.打造.可视 then
        tp.窗口.打造.物品[指定ID]:置物品(tp.道具列表[指定ID])
    end
    if tp.窗口.装备开运.可视 then
        tp.窗口.装备开运.物品[指定ID]:置物品(tp.道具列表[指定ID])
    end
    if tp.窗口.符石合成.可视 then
        tp.窗口.符石合成.物品[指定ID]:置物品(tp.道具列表[指定ID])
    end
    if tp.窗口.合成.可视 and 指定ID <= 20 then
        tp.窗口.合成.物品[指定ID]:置物品(tp.道具列表[指定ID])
    end
    if tp.窗口.出售.可视 then
        tp.窗口.出售.物品[指定ID]:置物品(tp.道具列表[指定ID])
    end
    if tp.窗口.道具仓库.可视 then
        tp.窗口.道具仓库.物品[指定ID]:置物品(tp.道具列表[指定ID])
    end
end

return 场景类_地图
