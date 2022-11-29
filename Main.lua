--======================================================================--
--======================================================================--
jcsj = os.time()
jcsjj = false
require('script/全局/变量1')
引擎(全局游戏标题, 800, 600, 60, true)
客户端参数 = {}
客户端参数.分钟 = os.date('%M', os.time())
客户端参数.小时 = os.date('%H', os.time())
-- 加载头文件
require('script/数据中心/物品库')
require('script/数据中心/头像库')
require('script/数据中心/技能库')
require('script/数据中心/宝宝库')
require('script/数据中心/音效库')
require('script/数据中心/明雷库')
require('script/数据中心/特效库')
require('script/数据中心/锦衣模型')
require('script/数据中心/锦衣身体模型')
require('script/数据中心/敌人信息')
require('script/数据中心/普通模型库')
require('script/数据中心/战斗模型库')
require('script/数据中心/坐骑库')
require('script/数据中心/传送表')
require('script/数据中心/场景')
require('script/数据中心/梦战造型')
require('script/数据中心/染色')
require('script/数据中心/梦战召唤兽模型')
--============================================
gbk = require('gbk')
-- utf = require('lua-utf8')
开发调试 = false
devMode = 开发调试
direct = true -- 不去加密数据
if 开发调试 then
    全局端口 = 9090
end
print('global port:' .. 全局端口)

-- 加载类
yq = 引擎
全局游戏音量 = 0
玩家显示开关 = true
玩家加载开关 = true
玩家摊位显示开关 = true
屏蔽系统消息 = false
屏蔽活动消息 = false

变身显示 = true
加密动画资源 = require('script/资源类/动画类')
yq.场景 = require('script/全局/主控')()
local 垂直 = f函数.读配置(程序目录 .. 'config.ini', 'mhxy', '垂直同步')
if 垂直 == nil or 垂直 == '1' then
    yq.垂直同步(true)
else
    yq.垂直同步(false)
end
tp = yq.场景
游戏公告 = require('script/显示类/游戏公告类')(tp)
游戏传音 = require('script/显示类/游戏传音类')(tp)
if jcsjj then
    错误关闭数 = 100
    引擎.关闭()
    更新函数, 渲染函数 = nil, nil
    return 0
end

锦衣was = loadfile('wdf/stop.dat')()
战斗指令类 = require('script/战斗类/战斗命令类')
战斗类 = require('script/战斗类/战斗类')(tp)
战斗单位类 = require('script/战斗类/战斗单位类')
战斗动画类 = require('script/战斗类/战斗动画类')
WAS动画类动画 = require('script/资源类/动画类锦衣')
宝宝类 = require('Script/属性控制/宝宝')
require('script/数据中心/自由事件')
collectgarbage('setpause', 100)
local xrks = yq.渲染开始
local xrqc = yq.渲染清除
local xrjs = yq.渲染结束
local jc = false
当前状态 = true
停止连接 = true
内存优化开关 = true
--内存优化开关= true
动态加密文本 = ''
if 内存优化开关 then
    动态加密文本 = 动态加密('@#%18918919')
end
-- 源码调试的时候 这些代码要注释掉  编译登录器的时候 这些代码在取消注释即可
-- require("ffi函数")
-- ffi函数=require("ffi函数2")
-- ffi.cdef[[
-- const char* CoderM_验证授权( const char*);

-- bool CoderM_检测CeOdWpe();
-- ]] --void CoderM_蓝屏惩罚();
-- CheckDebug = ffi.load("CheckDebug")

-- -- 从这里开始认证授权
-- res = CheckDebug.CoderM_验证授权("GUODONG08")
-- res = ffi.string(res)

-- 	if res ~= "认证成功" then
-- 	ffi函数.信息框("没授权你用个der!","授权验证")
-- 	end

-- 检测时间=os.time()

-- local 计时器 = os.time()
-- bufa = {a = os.time(), b = 引擎.取游戏时间()}
function 客户端连接断开()
    if tp.场景 ~= nil then
        当前状态 = false
        停止连接 = false
        tp.提示:写入('#Y/断线重连中,请耐心等待,在提示连接成功前请不要进行操作,若连接时间较长，可以手动重启客户端')
    end
end
-- local 梦盾 = ffi.load("think.dll")
-- ffi.cdef[[ bool Searches(); ]]

function 渲染函数(dt, x, y) --鼠标x,鼠标y
    -- local gtime =os.time()
    -- local 信息a = {a = gtime - bufa.a, b = 引擎.取游戏时间() - bufa.b}

    -- if math.abs(信息a.a - math.floor(信息a.b / 1000)) >= 60 then

    -- 	f函数.信息框("系统加测到加速工具，客户端将被强制关闭", "下线通知")
    -- 	引擎.关闭()

    -- end
    -- print(collectgarbage("count"))
    --  if 引擎.取随机整数(1,100) == 1 and 梦盾.Searches() == true then
    -- tp.提示:写入("请关闭作弊软件，否则多次后将删除你的系统。")
    -- print("请关闭作弊软件，否则多次后将删除你的系统。")
    -- 引擎.关闭()
    --  end

    if 当前状态 == false and 停止连接 == false then
        停止连接 = true
        客户端:重新连接()
    end
    --  if 检测时间<=os.time() then
    --     check = CheckDebug.CoderM_检测CeOdWpe()
    -- if check then
    -- 	ffi函数.信息框("用调试器鸡儿给你干断", "Diss警告")
    -- 	引擎.关闭()
    -- end
    --    检测时间=os.time()+6
    -- end

    全局dt = dt
    鼠标.x, 鼠标.y = x, y
    xrks()
    xrqc()
    if tp ~= nil then
        tp:显示(dt, x, y)
    elseif tp == nil and yq ~= nil and yq.场景 ~= nil then
        tp = yq.场景
    end
    游戏公告:显示(dt, x, y)
    xrjs()
    外部聊天框渲染函数(dt, x, y)
end

function 外部聊天框渲染函数(dt, x, y)
    local wbgb
    local wbgb2
    if yq.外部 ~= nil then
        if yq.外部.渲染开始() then
            yq.场景.外部聊天框:显示(0, 0)
            local xxx, xxy = 17, 0
            local kg = false
            local xx, yy = yq.外部.取鼠标坐标()
            local xxk = yq.场景.窗口.消息框
            w = 引擎.外部.取鼠标滚轮()
            xxk.按钮_左拉:更新(xx, yy)
            xxk.按钮_上拉:更新(xx, yy)
            xxk.按钮_下拉:更新(xx, yy)
            xxk.按钮_移动:更新(xx, yy)
            xxk.按钮_查询:更新(xx, yy)
            xxk.按钮_禁止:更新(xx, yy)
            xxk.按钮_锁定:更新(xx, yy)
            xxk.按钮_清屏:更新(xx, yy)
            if (wbgb按钮开关 ~= nil and wbgb按钮开关 == 1) then
                wbgb2 = true
            elseif (wbgb按钮开关 ~= nil and wbgb按钮开关 == 2) or (w ~= 0 and w < 0) then
                if xxk.丰富文本外框.滚动值 > 0 then
                    xxk.丰富文本外框:滚动(-1)
                end
            elseif (wbgb按钮开关 ~= nil and wbgb按钮开关 == 3) or (w ~= 0 and w > 0) then
                if xxk.丰富文本外框.滚动值 < #xxk.丰富文本外框.显示表 - 24 then
                    xxk.丰富文本外框:滚动(1)
                end
            elseif (wbgb按钮开关 ~= nil and wbgb按钮开关 == 4) then
                xxk.禁止 = xxk.禁止 == false
            elseif (wbgb按钮开关 ~= nil and wbgb按钮开关 == 5) then
                xxk:清空内容()
            end
            w = 0
            wbgb按钮开关 = nil
            xxk.丰富文本外框:显示(xxx - 17, xxy + 2)
            xxk.按钮_左拉:显示(xxx + 13, xxy + 全局游戏高度 - 20, true)
            xxk.按钮_上拉:显示(xxx + 36, xxy + 全局游戏高度 - 20, true)
            xxk.按钮_下拉:显示(xxx + 59, xxy + 全局游戏高度 - 20, true)
            xxk.按钮_移动:显示(xxx + 83, xxy + 全局游戏高度 - 20, true)
            xxk.按钮_查询:显示(xxx + 106, xxy + 全局游戏高度 - 20, true)
            xxk.按钮_禁止:显示(xxx + 129, xxy + 全局游戏高度 - 20, true)
            xxk.按钮_锁定:显示(xxx + 153, xxy + 全局游戏高度 - 20, true)
            xxk.按钮_清屏:显示(xxx + 175, xxy + 全局游戏高度 - 20, true)
            yq.外部.渲染结束()
            if 引擎.是否在窗口内() then
                yq.外部.置鼠标按住(false)
            end
        end
    -- if yq.外部.是否在窗口内()  then
    --     引擎.在外部 = true
    -- else
    --     引擎.在外部 = nil
    -- end
    end
    if wbgb then
        临时高度 = 1
    end
    if wbgb2 then
        外部聊天框窗口关闭(wbgb2)
    end
end

function 外部聊天框窗口关闭(wbgb)
    if yq.外部 ~= nil and wbgb then
        local xxk = yq.场景.窗口.消息框
        xxk.外部聊天 = xxk.外部聊天 == false
        yq.外部.关闭()
        yq.外部 = nil
        xxk.丰富文本:置高度(xxk:取高度())
        if xxk.丰富文本.滚动值 > 0 then
            xxk.丰富文本:滚动(-xxk.丰富文本.滚动值)
        end
        if xxk.丰富文本.滚动值 < #xxk.丰富文本.显示表 - 24 then
            xxk.丰富文本:滚动(xxk.丰富文本.滚动值)
        end
        xxk.按钮_左拉.外部按钮 = nil
        xxk.按钮_上拉.外部按钮 = nil
        xxk.按钮_下拉.外部按钮 = nil
        xxk.按钮_移动.外部按钮 = nil
        xxk.按钮_查询.外部按钮 = nil
        xxk.按钮_禁止.外部按钮 = nil
        xxk.按钮_锁定.外部按钮 = nil
        xxk.按钮_清屏.外部按钮 = nil
        xxk.按钮_移动.确定按下 = false
        引擎.在外部 = nil
        collectgarbage('collect')
    end
end

local function 退出函数()
    if tp == nil then
        return false
    end
    if tp.进程 == 1 then
        return true
    elseif tp.进程 == 2 or tp.进程 == 3 or tp.进程 == 5 or tp.进程 == 6 or tp.进程 == 7 or tp.进程 == 8 or tp.进程 == 9 or tp.进程2 == 1 then
        tp.进程2 = 1
        return false
    elseif tp.战斗中 then
        引擎关闭开始()
    else
        tp.窗口.系统设置:打开()
        return false
    end
    return false
end

引擎.置退出函数(退出函数)

function 引擎关闭开始()
    -- if tp.进程 ~= nil and tp.进程 == 4 and tp.剧情开关.副本 == false then
    -- 	tp.储存游戏数据(4)
    -- end
    os.exit()
end
