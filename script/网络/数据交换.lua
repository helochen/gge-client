--======================================================================--

--======================================================================--
local 回调 = require('Script/网络/HPClient类')()
封包加密 = require('Script/网络/封包加密')
local protobuf = require('script/网络/Protobuf')()
--回调:置收发BUF(封包加密(1024*1024*10), 封包加密(1024*1024*10))
local 数据记录 = ''

function 回调:初始化()
    self.连接账号 = ''
    self.连接密码 = ''
    self.连接结果 = false
end

-- 发送protobuf数据
function 回调:BP数据发送(cmd, 内容)
    local pb_data = protobuf:encode(cmd, 内容)
    if pb_data ~= nil then
        self:发送(pb_data)
    end
end

function 回调:发送数据(序号, 内容, 数组转换)
    if 内容 == nil then
        内容 = '1'
    end
    print('-====send :=========', 序号, 内容, '===========')
    if 数组转换 ~= nil then
        内容 = table.tostring(内容)
    end
    self.组合数据 = 序号 .. fgf .. 内容
    --if 数据记录==self.组合数据..时间 then return  end

    self:发送(jm(self.组合数据))
    -- 数据记录=self.组合数据..时间
    -- print(self.组合数据)
end

function 回调:数据到达(内容)
    if 开发调试 then
        -- 二进制的数据
        local cmd, pb_entity = protobuf:decode(内容)
        if cmd ~= -1 then
            -- TODO 业务逻辑
            self:系统处理PB(cmd, pb_entity)
        end
    else
        -- 内容=jm1(内容)
        print('receive:----------------------', 内容, '--------------------')
        if 内容 == nil or 内容 == '' then
            return
        end
        local 数据 = table.loadstring(内容)
        if 数据 == nil or 数据.序号 == nil then
            return
        end
        数据.序号 = 数据.序号 + 0
        if 调试模式 and 数据.序号 ~= 99 then
        --  print(table.loadstring)a
        end
        if tp == nil then
            tp = yq.场景
        end
        -- print(内容)
        if 数据.序号 <= 1000 then
            self:系统处理(数据.序号, 数据.内容, 内容)
        elseif 数据.序号 > 1000 and 数据.序号 <= 1500 then
            self:地图处理(数据.序号, 数据.内容)
        elseif 数据.序号 > 1500 and 数据.序号 <= 2000 then
            self:对话处理(数据.序号, 数据.内容)
        elseif 数据.序号 > 3500 and 数据.序号 <= 4000 then
            self:道具处理(数据.序号, 数据.内容)
        elseif 数据.序号 > 4000 and 数据.序号 <= 4500 then
            self:队伍处理(数据.序号, 数据.内容)
        elseif 数据.序号 > 5500 and 数据.序号 <= 6000 then
            self:战斗处理(数据.序号, 数据.内容)
        elseif 数据.序号 > 7000 and 数据.序号 <= 8000 then
            self:助战处理(数据.序号, 数据.内容)
        end
    end
end
function 回调:助战处理(序号, 内容)
    if 序号 == 7001 then
        tp.窗口.助战修炼界面:打开(内容)
    elseif 序号 == 7002 then
        tp.窗口.助战修炼界面:刷新(内容)
    elseif 序号 == 7003 then
        tp.窗口.助战技能学习:打开(内容)
    elseif 序号 == 7004 then
        tp.窗口.助战技能学习:刷新(内容)
    elseif 序号 == 7005 then
        tp.窗口.助战辅助技能:打开(内容)
    elseif 序号 == 7006 then
        tp.窗口.助战辅助技能:刷新(内容)
    elseif 序号 == 7007 then
        tp.窗口.助战奇经八脉:打开(内容)
    elseif 序号 == 7008 then
        tp.窗口.助战奇经八脉:刷新(内容)
    end
end
function 回调:战斗处理(序号, 内容)
    if 序号 == 5501 then
        tp.战斗中 = true
        战斗类.队伍id = 内容.id
        战斗类.单位总数 = 内容.总数
        self.地图音乐 = nil
        if tp.音乐 ~= nil then
            tp.音乐:停止()
        end
        战斗音乐 = tp.资源:载入(wdf配置 .. '/Audio/战斗' .. 取随机数(1, 9) .. '.mp3', '音乐', nil)
        if tp.音量 > 0 and tp.音乐开启 then
            战斗音乐:播放(true)
            战斗音乐:置音量(tp.音量)
        end
        if tp.场景.抓取物品 ~= nil then
            tp.场景.抓取物品 = nil
            tp.鼠标.置鼠标('普通')
        end
        战斗类.进程 = '等待'
        战斗类.执行流程 = 0
        战斗类.拼接特效 = nil
        战斗类.掉血流程 = nil
        战斗类.背景状态 = nil
    elseif 序号 == 5502 then
        战斗类:加载单位(内容)
    elseif 序号 == 5503 then
        战斗类:设置命令回合(内容)
    elseif 序号 == 5503.1 then --断线重连
        战斗类.命令数据 = {计时 = 时间, 分 = 3, 秒 = 0}
        local 剩余时间 = 30 - 内容
        if 剩余时间 < 10 then
            战斗类.命令数据.分 = 0
            战斗类.命令数据.秒 = 剩余时间
        elseif 剩余时间 >= 20 then
            战斗类.命令数据.分 = 2
            战斗类.命令数据.秒 = 剩余时间 - 20
        elseif 剩余时间 >= 10 then
            战斗类.命令数据.分 = 1
            战斗类.命令数据.秒 = 剩余时间 - 10
        end
    elseif 序号 == 5504 then
        战斗类:设置战斗流程(内容)
    elseif 序号 == 5505 then
        tp.战斗中 = false
        战斗类.战斗单位 = {}
        战斗类.观战模式 = false
        战斗类.战斗类型 = 0
        if 战斗音乐 ~= nil then
            战斗音乐:停止()
            战斗音乐 = nil
        end
        触碰延时 = 时间
        if tp.音乐 ~= nil then
            tp.音乐:播放()
            tp.音乐:置音量(tp.音量)
        end
        if tp.窗口.人物状态栏.可视 then
            tp.窗口.人物状态栏:打开()
        end
        if tp.窗口.召唤兽属性栏.可视 then
            tp.窗口.召唤兽属性栏:打开()
        end
        if tp.窗口.坐骑属性栏.可视 then
            tp.窗口.坐骑属性栏:打开()
        end
        if tp.窗口.助战界面.可视 then
            tp.窗口.助战界面:打开()
        end
        tp.鼠标.置鼠标('普通')
    elseif 序号 == 5506 then
        if tp.队伍 ~= nil and tp.队伍[1] ~= nil then
            tp.队伍[1].气血 = 内容[1].气血
            tp.队伍[1].最大气血 = 内容[1].最大气血
            tp.队伍[1].魔法 = 内容[1].魔法
            tp.队伍[1].最大魔法 = 内容[1].最大魔法
            tp.队伍[1].愤怒 = 内容[1].愤怒
            if 内容[2] ~= nil then
                tp.队伍[1].参战宝宝.气血 = 内容[2].气血
                tp.队伍[1].参战宝宝.最大气血 = 内容[2].最大气血
                tp.队伍[1].参战宝宝.魔法 = 内容[2].魔法
                tp.队伍[1].参战宝宝.最大魔法 = 内容[2].最大魔法
            end
        end
    elseif 序号 == 5507 then
        战斗类:取消状态(内容)
    elseif 序号 == 5508 then
        战斗类:鬼魂复活(内容)
    elseif 序号 == 5509 then
        tp.道具列表 = 内容.道具
        战斗类.战斗指令:设置道具()
    elseif 序号 == 5510 then
        tp.队伍[1].宝宝列表 = 内容[1]
        战斗类.战斗指令.召唤界面:打开(tp.队伍[1], 内容[2])
    elseif 序号 == 5511 then --开启自动战斗后进入等待
        战斗类.进程 = '等待'
    elseif 序号 == 5512 then
        local 编号 = 内容.id
        if 战斗类.战斗单位[编号] == nil then
            return
        end
        战斗类.战斗单位[编号].喊话:写入(战斗类.战斗单位[编号], 战斗类.战斗单位[编号].动画.动画, 内容.文本)
    elseif 序号 == 5513 then
        for n = 1, #内容 do
            战斗类.战斗单位[内容[n].id].数据.自动指令 = 内容[n].自动
        end
    elseif 序号 == 5514 then
        for n = 1, #内容 do
            战斗类.战斗单位[内容[n].id].数据.自动战斗 = 内容[n].自动
        end
    elseif 序号 == 5515 then
        if 内容 == nil then
            return
        end
        for n = 1, #内容 do
            战斗类:加载单位(内容[n])
        end
    elseif 序号 == 5516 then
        if 内容 == nil then
            return
        end
        for n = 1, #内容 do
            战斗类:加载单位(内容[n], '观战')
        end
    elseif 序号 == 5517 then
        tp.队伍[1].参战宝宝.气血 = 内容.气血
        tp.队伍[1].参战宝宝.最大气血 = 内容.最大气血
        tp.队伍[1].参战宝宝.魔法 = 内容.魔法
        tp.队伍[1].参战宝宝.最大魔法 = 内容.最大魔法
    elseif 序号 == 5518 then
        战斗类:刷新技能(内容)

    --elseif 序号==5519 then
    --tp.窗口.死亡提示:打开()
    end
end

function 回调:队伍处理(序号, 内容)
    -- 4001 更改队伍图标
    -- 4002 创建队伍界面
    -- 4003 创建申请界面
    -- 4004 刷新队伍信息
    -- 4005 刷新队伍头像
    -- 4006 添加自身队伍图标
    -- 4007 添加玩家队伍图标
    -- 4008 删除自身队伍图标
    -- 4009 删除玩家队伍图标
    -- 4010 获取申请列表信息
    -- 4011 刷新申请列表
    -- 4012 清除队伍信息
    if 序号 == 4001 then
        tp.鼠标.置鼠标('组队')
    elseif 序号 == 4002 then
        --tp.窗口.底图框:刷新队伍头像(内容)
        tp.队伍数据 = 内容
        tp.窗口.队伍栏:打开()
    elseif 序号 == 4004 then
        tp.队伍数据 = 内容
        申请队伍 = false
        if tp.窗口.队伍栏.可视 then
            tp.窗口.队伍栏:刷新人物()
        end
    elseif 序号 == 4006 then
        tp.场景.人物.队长开关 = true
    elseif 序号 == 4007 then
        if 内容.逻辑 == nil then
            内容.逻辑 = false
        end
        tp.场景.玩家[内容.id].队长开关 = 内容.逻辑
    elseif 序号 == 4008 then
        tp.场景.人物.队长开关 = false
    elseif 序号 == 4010 then
        tp.窗口.队伍申请表:打开(内容)
    elseif 序号 == 4011 then
        tp.窗口.队伍申请表:刷新(内容)
        申请队伍 = true
    elseif 序号 == 4012 then
        tp.队伍数据 = {}
        if tp.窗口.队伍栏.可视 then
            tp.窗口.队伍栏:打开()
        end
        if tp.窗口.队伍申请表.可视 then
            tp.窗口.队伍申请表:打开()
        end
    elseif 序号 == 4013 then
        --tp.窗口.队伍申请表:刷新(内容)
        tp.窗口.队伍阵型栏:打开(内容)
    elseif 序号 == 4014 then
        if 内容.逻辑 == nil then
            内容.逻辑 = false
        end
        tp.场景.玩家[内容.id].战斗开关 = 内容.逻辑
    elseif 序号 == 4015 then
        tp.窗口.好友查看:打开(内容, nil, nil, true)
    end
end

function 回调:道具处理(序号, 内容, 原内容)
    if 序号 == 3501 then
        --tp.窗口.对话栏:文本(内容.模型,内容.名称,内容.对话,内容.选项)
        tp.金钱 = 内容.银子
        tp.储备 = 内容.储备
        tp.存银 = 内容.存银
        tp.回收 = 内容.回收
        内容.银子 = nil
        内容.储备 = nil
        内容.存银 = nil
        tp.道具列表 = 内容.道具
        --table.print(tp.道具列表)
        if tp.窗口.道具行囊.可视 == false then
            tp.窗口.道具行囊:打开()
        else
            tp.窗口.道具行囊:刷新道具资源()
            tp.窗口.道具行囊.点击类型 = '道具'
            if tp.窗口.道具行囊.窗口 ~= '坐骑' and tp.窗口.道具行囊.窗口 ~= '召唤兽' then
                tp.窗口.道具行囊.窗口 = '主人公'
                local n = 引擎.取头像(tp.队伍[1].模型)
                tp.窗口.道具行囊.资源组[4] = tp.资源:载入(n[7], '网易WDF动画', n[3])
            end
        end
        if tp.窗口.助战物品界面.可视 then
            tp.窗口.助战物品界面:刷新物品(内容.道具)
        end
    elseif 序号 == 3502 then
        --tp.窗口.对话栏:文本(内容.模型,内容.名称,内容.对话,内容.选项)
        tp.金钱 = 内容.银子
        tp.储备 = 内容.储备
        tp.存银 = 内容.存银
        内容.银子 = nil
        内容.储备 = nil
        内容.存银 = nil
        tp.道具列表 = 内容.道具
        --table.print(tp.道具列表)
        if tp.窗口.道具行囊.可视 == false then
            tp.窗口.道具行囊:打开()
        else
            tp.窗口.道具行囊:刷新道具资源()
            if tp.窗口.道具行囊.窗口 ~= '坐骑' and tp.窗口.道具行囊.窗口 ~= '召唤兽' then
                tp.窗口.道具行囊.点击类型 = '行囊'
                tp.窗口.道具行囊.窗口 = '主人公'
                local n = 引擎.取头像(tp.队伍[1].模型)
                tp.窗口.道具行囊.资源组[4] = tp.资源:载入(n[7], '网易WDF动画', n[3])
            end
        end
    elseif 序号 == 3503 then --更新装备
        tp.队伍[1].装备 = 内容
        tp.窗口.道具行囊:刷新装备()
    elseif 序号 == 3504 then --佩戴装备
        tp.场景.人物:穿戴装备()
    elseif 序号 == 3505 then --佩戴装备
        tp.场景.人物:卸下装备()
    elseif 序号 == 3506 then --更新装备
        tp.队伍[1].灵饰 = 内容
        if tp.窗口.灵饰.可视 then
            tp.窗口.灵饰:刷新()
        end
    elseif 序号 == 3507 then
        --tp.窗口.对话栏:文本(内容.模型,内容.名称,内容.对话,内容.选项)
        tp.金钱 = 内容.道具.银子
        tp.储备 = 内容.道具.储备
        tp.存银 = 内容.道具.存银
        内容.银子 = nil
        内容.储备 = nil
        内容.存银 = nil
        tp.道具列表 = 内容.道具.道具
        tp.窗口.给予:打开(nil, 内容.名称, 内容.等级, 内容.类型)
    elseif 序号 == 3508 then
        tp.窗口.交易.锁定状态 = true
        tp.窗口.交易.选择:置打勾框(true)
    elseif 序号 == 3509 then
        tp.窗口.交易.选择1:置打勾框(true)
    elseif 序号 == 3510 then
        tp.窗口.交易:设置对方数据(内容)
    elseif 序号 == 3511 then
        if tp.窗口.交易.可视 then
            tp.窗口.交易:打开()
        end
    elseif 序号 == 3512 then
        tp.队伍[1].宝宝列表 = 内容
        if tp.窗口.交易.可视 then
            tp.窗口.交易.bb = {}
        end
    elseif 序号 == 3513 then
        tp.道具列表 = 内容.道具
    elseif 序号 == 3514 then
        tp.窗口.交易:打开(内容.名称, 内容.等级)
    elseif 序号 == 3515 then
        tp.窗口.摊位出售:打开(内容.名称, 内容.摊主名称, 内容.id, 内容.物品, 内容.bb, 内容.制造)
        摊位名称 = 内容.名称
    elseif 序号 == 3516 then --更改自己摊位名称
        摊位名称 = 内容
    elseif 序号 == 3517 then
        tp.窗口.摊位出售:刷新(内容.名称, 内容.摊主名称, 内容.id, 内容.物品, 内容.bb, 内容.制造)
    elseif 序号 == 3518 then
        摊位名称 = nil
        if tp.窗口.摊位出售.可视 then
            tp.窗口.摊位出售:打开()
        end
    elseif 序号 == 3519 then
        tp.场景.玩家[内容.id].摊位名称 = 内容.名称
    elseif 序号 == 3520 then
        tp.金钱 = 内容 + 0
    elseif 序号 == 3521 then
        tp.窗口.摊位购买:打开(内容.名称, 内容.摊主名称, 内容.id, 内容.物品, 内容.bb, 内容.制造)
    elseif 序号 == 3522 then
        tp.窗口.摊位购买:刷新(内容.名称, 内容.摊主名称, 内容.id, 内容.物品, 内容.bb, 内容.制造)
    elseif 序号 == 3523 then
        tp.窗口.道具仓库:打开(内容.道具.道具, 内容.总数)
    elseif 序号 == 3524 then
        tp.窗口.道具仓库:刷新仓库(内容.道具.道具, 内容.页数)
    elseif 序号 == 3525 then
        tp.窗口.道具仓库:刷新道具()
    elseif 序号 == 3529.1 then
        tp.窗口.图鉴系统:打开(内容)
    elseif 序号 == 3529.2 then
        if tp.窗口.图鉴系统.可视 then
            tp.窗口.图鉴系统:刷新图鉴(内容)
        end
    elseif 序号 == 3526 then
        tp.窗口.召唤兽仓库:打开()
    elseif 序号 == 3527 then
        tp.法宝列表 = 内容.法宝
        tp.法宝佩戴 = 内容.佩戴
        tp.窗口.道具行囊:刷新法宝资源()
        tp.窗口.道具行囊.点击类型 = '法宝'
        tp.窗口.道具行囊.窗口 = '法宝'
    elseif 序号 == 3528 then
        tp.窗口.道具行囊:更新法宝经验(内容)
    elseif 序号 == 3529 then
        tp.窗口.合成旗:打开(内容)
    elseif 序号 == 3530 then --更新装备
        tp.锦衣列表 = 内容.锦衣
        tp.锦衣佩戴 = 内容.佩戴
        tp.窗口.道具行囊:刷新锦衣资源()
        tp.窗口.道具行囊.点击类型 = '锦衣'
        tp.窗口.道具行囊.窗口 = '锦衣'
    elseif 序号 == 3531 then --更新坐骑饰品
        tp.窗口.道具行囊:刷新坐骑饰品()
    elseif 序号 == 3532 then
        local 人物组 = {
            {名称 = '唐太宗', 模型 = '皇帝', X = 40, Y = 20, 方向 = 0, 编号 = 1},
            {名称 = '玄奘法师', 模型 = '唐僧', X = 47, Y = 20, 方向 = 0, 编号 = 2},
            {主角 = true, X = 45, Y = 22, 方向 = 2, 编号 = 3}
        }
        local 事件组 = {
            [1] = {
                [[引擎.场景.第二场景:加入喊话(5,1,"御弟，朗朗乾坤却有如此浊物危害天下苍生，实在令寡人忧心如焚。",300)]],
                [[引擎.场景.第二场景:加入喊话(5,2,"圣上不必忧恼，此类妖孽乃远古凶兽意念衍生之物，方才辛有这些少侠相助，现已平安无事了。",300)]],
                [[引擎.场景.第二场景:加入喊话(5,1,"感谢少侠解救，小小礼物不成敬意！",500)]],
                [[引擎.场景.第二场景:置人物方向(10,2,0)]],
                [[引擎.场景.第二场景:加进度(0,1)]]
            }
        }
        tp.第二场景:载入显示(人物组, 事件组)
    elseif 序号 == 3699 then --刷新道具数据
        -- if tp.窗口.幻化界面.可视 then
        --   发送数据(3766)
        -- end
        if tp.窗口.道具行囊.可视 then
            tp.场景.抓取物品 = nil
            tp.场景.抓取物品ID = nil
            tp.场景.抓取物品注释 = nil
            if tp.窗口.道具行囊.点击类型 == '道具' then
                发送数据(3699)
            elseif tp.窗口.道具行囊.点击类型 == '行囊' then
                发送数据(3700)
            elseif tp.窗口.道具行囊.点击类型 == '法宝' then
                发送数据(3732)
            elseif tp.窗口.道具行囊.点击类型 == '锦衣' then
                发送数据(3800)
            end
        end
        if tp.窗口.打造.可视 then
            发送数据(3707)
        elseif tp.窗口.附魔.可视 then
            tp.窗口.附魔:打开()
        end
    elseif 序号 == 3700 then
        tp.窗口.商城类:打开(内容)
    elseif 序号 == 3701 then
        tp.窗口.活跃商城:打开(内容)
    elseif 序号 == 3703 then
        if tp.窗口.商城类.可视 then
            tp.窗口.商城类:刷新余额(内容)
        end
    elseif 序号 == 3702 then
        tp.队伍[1].锦衣佩戴 = 内容
        tp.场景.人物:置模型()
    elseif 序号 == 3704 then
        tp.召唤兽仓库 = 内容
    elseif 序号 == 3816 then
        tp.召唤兽仓库 = 内容
    end
end

-- 3699 刷新所有跟道具有关的界面
function 回调:对话处理(序号, 内容)
    if 序号 == 1501 then
        tp.窗口.对话栏:文本(内容.模型, 内容.名称, 内容.对话, 内容.选项)
    end
end

function 回调:地图处理(序号, 内容)
    if 序号 == 1001 then
        if tp.场景.人物 ~= nil then
            tp.场景.人物:设置路径(内容)
        end
    elseif 序号 == 1003 then
        tp.场景:设置假人(内容)
    elseif 序号 == 1004 then
        if tp.场景.人物 ~= nil then
            tp.场景.人物:停止移动(1)
        end
        tp.场景.玩家 = {}
        tp.场景:设置传送(内容)
    elseif 序号 == 1005 then
        --table.print(内容[1],内容[3],内容[2])
        tp.场景:传送至(内容[1], 内容[2], 内容[3], true)
        if 坐标显示 then
            tp.窗口.消息框:添加文本('地图编号:' .. 内容[1])
        end
        tp.队伍[1].地图数据.编号 = 内容[1]
    elseif 序号 == 1006 then --地图添加玩家
        tp.场景:添加玩家(内容)
    elseif 序号 == 1007 then --删除玩家
        if tp.场景.玩家[内容.id] == nil then
            return
        end
        tp.场景:删除玩家(内容.id)
    elseif 序号 == 1008 then
        内容.路径.id = 内容.路径.数字id + 0
        tp.场景:更新行走(内容.路径, 内容.路径.id)
    elseif 序号 == 1009 then
        tp.场景.玩家[内容.id]:穿戴装备(内容.武器)
    elseif 序号 == 1014 then
        if 内容.锦衣隐藏 == 1 then
            tp.场景.玩家[内容.id]:穿戴锦衣(内容.锦衣)
        end
    elseif 序号 == 1010 then
        tp.场景.玩家[内容.id]:设置动画(内容.类型)
    elseif 序号 == 1011 then
        if tp.场景.人物 ~= nil then
            tp.场景.人物:设置坐标(内容)
        end
    elseif 序号 == 1012 then
        if tp.场景.玩家[内容.id] == nil then
            return
        end
        tp.场景.玩家[内容.id]:设置坐标(内容)
    elseif 序号 == 1013 then
        if tp.场景.玩家[内容.id] == nil or tp.场景.玩家[内容.id].玩家 == nil or tp.场景.玩家[内容.id].玩家['静立'] == nil then
            return
        end
        tp.场景.玩家[内容.id].玩家['静立']:置染色(内容.染色方案, 内容.染色组[1], 内容.染色组[2], 内容.染色组[3], 0)
        tp.场景.玩家[内容.id].玩家['行走']:置染色(内容.染色方案, 内容.染色组[1], 内容.染色组[2], 内容.染色组[3], 0)
    elseif 序号 == 1015 then
        tp.假人库:添加地图单位(内容)
    elseif 序号 == 1015.1 then
        tp.假人库:更改地图单位(内容)
    elseif 序号 == 1016 then --删除编号
        tp.假人库:删除指定Npc(地图, 名称, 模型, 事件ID, 内容.编号, 执行事件)
    elseif 序号 == 1017 then --添加喊话
        tp.喊话:写入(tp.场景.人物, tp.场景.人物.人物, 内容)
    elseif 序号 == 1018 then
        内容.id = 内容.id + 0
        if tp.场景.玩家[内容.id] == nil then
            return
        end
        tp.场景.玩家[内容.id].喊话:写入(tp.场景.玩家[内容.id], tp.场景.玩家[内容.id].玩家, 内容.文本)
    elseif 序号 == 1019 then
        if tp.场景.玩家[内容.id] == nil then
            return
        end
        tp.场景.玩家[内容.id].坐骑 = 内容.坐骑
        if 内容.坐骑 == nil then
            tp.场景.玩家[内容.id]:卸下坐骑()
        else
            tp.场景.玩家[内容.id]:坐骑改变()
        end
    elseif 序号 == 1020 then
        if 内容.当前称谓 == nil then
            内容.当前称谓 = ''
        end
        tp.场景.玩家[内容.id]:更改称谓(内容)
    elseif 序号 == 1021 then
        if 内容 == nil then
            return
        end
        for i = 1, #内容 do
            tp.假人库:添加地图单位(内容[i])
            -- tp.假人库:添加地图单位(内容)
        end
    elseif 序号 == 1022 then --地图添加玩家
        if 内容 == nil then
            return
        end
        for i = 1, #内容 do
            tp.场景:添加玩家(内容[i])
            -- tp.场景:添加玩家(内容)
        end
    elseif 序号 == 1023 then
        tp.场景.玩家[内容.id].pk开关 = 内容.开关
    elseif 序号 == 1024 then
        tp.场景.玩家[内容.id].变身 = 内容.变身
        tp.场景.玩家[内容.id].变异 = 内容.变异
        tp.场景.玩家[内容.id]:刷新动画()
    elseif 序号 == 1025 then
        tp.场景.玩家[内容.id].强p开关 = 内容.开关
    elseif 序号 == 1026 then
        tp.房屋数据 = 内容[1]
        print(tp.房屋数据)
    elseif 序号 == 1027 then
        tp.场景.地图:房屋特效(内容[1])
    elseif 序号 == 1028 then
        tp.如意符 = true
    elseif 序号 == 1029 then
        if 内容[2] == '庭院' then
            tp.房屋数据.庭院装饰 = 内容[1]
            tp.场景.地图:房屋特效2()
        elseif 内容[2] == '室内' then
            tp.房屋数据.室内装饰 = 内容[1]
            tp.场景.地图:房屋特效2()
        end
    elseif 序号 == 1030 then
        if 内容[2] == '庭院' then
            --tp.场景.地图:房屋特效2()
            tp.房屋数据.庭院装饰 = 内容[1]
        elseif 内容[2] == '室内' then
            tp.房屋数据.室内装饰 = 内容[1]
        --tp.场景.地图:房屋特效2()
        end
    elseif 序号 == 1031 then
        tp.窗口.房屋拜访:打开()
    -- elseif 序号==1032 then
    --   tp.场景.玩家[内容.id].炫彩 = 内容.炫彩
    --   tp.场景.玩家[内容.id].炫彩组 = 内容.炫彩组
    --   tp.场景.玩家[内容.id]:炫彩染色(内容.炫彩,内容.炫彩组,"人物")
    end
end
function 回调:系统处理(序号, 内容, 数据)
    if 序号 == 1 and 内容.用户 == nil then
        self:发送数据(1, 版本 .. fgc .. 系统参数.账号 .. fgc .. 系统参数.密码 .. fgc .. f函数.取硬盘序列号())
    elseif 序号 == 2 then --选择角色
        tp.进程 = 2
    elseif 序号 == 3 then --创建角色
        tp.进程 = 3
    elseif 序号 == 4 then --选择角色 加载数据
        tp.读取:添加角色信息(内容)
    elseif 序号 == 5 then
        全局游戏宽度 = 读配置('./配置.ini', 'mhxy', '宽度') + 0
        全局游戏高度 = 读配置('./配置.ini', 'mhxy', '高度') + 0
        引擎.置宽高(全局游戏宽度, 全局游戏高度)
        引擎.置宽度(全局游戏宽度)
        引擎.置高度(全局游戏高度)
        tp.场景 = require('script/全局/主显').创建(tp)
        tp.第二场景 = require('script/场景类/第二场景').创建(tp)
        tp.提示误差 = 0
        tp.队伍[1] = tp._队伍.创建()
        tp.队伍[1]:重置属性(内容)
        tp.宠物 = 内容.宠物
        -- tp.登录类.音乐:停止()
        -- 引擎.置宽度(800)
        -- 引擎.置高度(600)
        withs = 全局游戏宽度
        hegts = 全局游戏高度
        with = 全局游戏宽度 / 2
        hegt = 全局游戏高度 / 2

        tp.音乐:停止()
        tp.场景:转移(内容.地图数据.编号, 内容.地图数据.x, 内容.地图数据.y, 内容.NPC数据)
        tp.游戏进程 = 1
        local 地图等级 = {}
        地图等级[1], 地图等级[2] = 引擎.取场景等级(tp.当前地图)
        if 地图等级[1] ~= nil then
            tp.场景.场景最低等级 = 地图等级[1]
            tp.场景.场景最高等级 = 地图等级[2]
            tp.窗口.消息框:添加文本('#Y/本场景等级为' .. 地图等级[1] .. '-' .. 地图等级[2] .. '级', 'xt')
        else
            tp.场景.场景最低等级 = nil
            tp.场景.场景最高等级 = nil
        end
        tp.缓冲 = nil
        tp.标题 = nil
        tp.注册 = nil
        tp.分区 = nil
        tp.登陆 = nil
        tp.充值 = nil
        tp.创建 = nil
        tp.读取 = nil
        tp.退出 = nil

        local 音乐开启 = 读配置('./配置.ini', 'mhxy', '音乐播放')
        tp.音量 = 读配置('./配置.ini', 'mhxy', '音量') + 0
        tp.音乐:置音量(tp.音量)
        if 音乐开启 == 'false' then
            tp.音乐开启 = false
            tp.音乐:停止()
        else
            tp.音乐开启 = true
            tp.音乐:播放(true)
        end
        local 音效开启 = 读配置('./配置.ini', 'mhxy', '音效开启')
        if 音效开启 == 'false' then
            tp.音效开启 = false
        else
            tp.音效开启 = true
        end

        local fc = tp._自适应.创建()
        if 界面风格 == 1 then
            fc:加载(tp)
        elseif 界面风格 == 2 then
            fc:加载2(tp)
        elseif 界面风格 == 3 then
            fc:加载3(tp)
        elseif 界面风格 == 4 then
            fc:加载4(tp)
        end
        tp.窗口.底图框:加载()
        tp.窗口.消息框:加载()
        tp.窗口.时辰:加载()
        tp.窗口.人物框:加载()

        tp.窗口.道具行囊:加载资源()

        if 界面字体 == 1 then
            tp.字体表.描边字体 = require('gge文字类')(nil, 16, false, true, false)
            tp.字体表.描边字体:置描边颜色(-16777216)
            tp.字体表.描边字体:置颜色(4294967295)
        elseif 界面字体 == 2 then
            tp.字体表.描边字体 = require('gge文字类')('wdf/font/hksnt.ttf', 16, false, true, false)
            tp.字体表.描边字体:置描边颜色(-16777216)
            tp.字体表.描边字体:置颜色(4294967295)
        elseif 界面字体 == 3 then
            tp.字体表.描边字体 = require('gge文字类')('wdf/font/hkyt.ttf', 16, false, true, false)
            tp.字体表.描边字体:置描边颜色(-16777216)
            tp.字体表.描边字体:置颜色(4294967295)
        elseif 界面字体 == 4 then
            tp.字体表.描边字体 = require('gge文字类')('wdf/font/hyb1gjm.ttf', 16, false, true, false)
            tp.字体表.描边字体:置描边颜色(-16777216)
            tp.字体表.描边字体:置颜色(4294967295)
        elseif 界面字体 == 5 then
            tp.字体表.描边字体 = require('gge文字类')('wdf/font/hyh1gjm.ttf', 16, false, true, false)
            tp.字体表.描边字体:置描边颜色(-16777216)
            tp.字体表.描边字体:置颜色(4294967295)
        elseif 界面字体 == 6 then
            tp.字体表.描边字体 = require('gge文字类')('wdf/font/hyj4gjm.ttf', 16, false, true, false)
            tp.字体表.描边字体:置描边颜色(-16777216)
            tp.字体表.描边字体:置颜色(4294967295)
        elseif 界面字体 == 7 then
            tp.字体表.描边字体 = require('gge文字类')('wdf/font/ygyxsziti2.0.ttf', 16, false, true, false)
            tp.字体表.描边字体:置描边颜色(-16777216)
            tp.字体表.描边字体:置颜色(4294967295)
        elseif 界面字体 == 8 then
            tp.字体表.描边字体 = require('gge文字类')('wdf/font/方正琥珀简体.ttf', 16, false, true, false)
            tp.字体表.描边字体:置描边颜色(-16777216)
            tp.字体表.描边字体:置颜色(4294967295)
        end
        引擎.置标题(全局游戏标题 .. '-[ ' .. tp.队伍[1].数字id .. ' ]')

        collectgarbage('collect')
    elseif 序号 == 6 then
        tp.窗口.宠物领养栏:打开()
    elseif 序号 == 7 then
        tp.提示:写入(内容)
    elseif 序号 == 8 then --检查宠物领养
        tp.宠物 = 内容
        if tp.窗口.宠物状态栏.可视 then
            tp.窗口.宠物状态栏:打开()
            tp.窗口.宠物状态栏:打开()
        end
    elseif 序号 == 9 then --商店
        tp.金钱 = 内容.银子
        tp.窗口.商店:打开(内容.商品, 内容.名称)
    elseif 序号 == 10 then --更新人物界面
        --tp.队伍[1].装备=table.loadstring(table.tostring(self.临时装备))
        -- if tp.窗口.人物状态栏.可视==false then
        --  tp.窗口.人物状态栏:打开()
        -- end
        self.临时装备 = table.loadstring(table.tostring(tp.队伍[1].装备))
        tp.队伍[1]:重置属性(内容, 1)
    elseif 序号 == 11 then
        tp.场景.人物:加入动画('升级')
    elseif 序号 == 12 then
        if tp.窗口.人物状态栏.可视 then
            发送数据(7)
        end
    elseif 序号 == 13 then
        tp.窗口.飞行符:打开()
    elseif 序号 == 14 then
        tp.金钱 = 内容.银子
        if tp.窗口.打造.可视 == false then
            tp.窗口.打造:打开(内容.道具)
        else
            tp.窗口.打造:刷新道具(内容.道具)
        end
        tp.道具列表 = 内容.道具
    elseif 序号 == 14.44 then
        tp.金钱 = 内容.银子
        if tp.窗口.修理.可视 == false then
            tp.窗口.修理:打开(内容.道具)
        else
            tp.窗口.修理:刷新道具(内容.道具)
        end
        tp.道具列表 = 内容.道具
    elseif 序号 == 15 then
        if tp.队伍[1].体力 == nil then
            return
        end
        tp.队伍[1].体力 = 内容.体力
        tp.队伍[1].活力 = 内容.活力
    elseif 序号 == 16 then
        --table.print(内容)
        -- print(内容,tp.队伍[1])
        tp.队伍[1].宝宝列表 = 内容
        tp.队伍[1]:刷新宝宝技能()
        tp.队伍[1]:刷新宝宝认证技能()
    elseif 序号 == 16.1 then
        tp.队伍[1]:刷新宝宝技能(内容[1], 内容[2].技能)
        if tp.窗口.召唤兽资质栏.可视 then
            tp.窗口.召唤兽资质栏:刷新数据(内容[2])
        end
    elseif 序号 == 16.2 then
        if tp.窗口.召唤兽鉴定.可视 then
            tp.窗口.召唤兽鉴定:刷新数据(内容)
        end
        if tp.窗口.召唤兽资质栏.可视 then
            tp.窗口.召唤兽资质栏:刷新数据(内容)
        end
    elseif 序号 == 17 then
        tp.队伍[1].宝宝列表 = 内容
        tp.队伍[1]:刷新宝宝技能()
        tp.队伍[1]:刷新宝宝认证技能()
        tp.窗口.召唤兽属性栏:打开()
    elseif 序号 == 17.1 then
        tp.队伍[1].宝宝列表 = 内容
    elseif 序号 == 17.2 then
        tp.队伍[1].子女列表 = 内容
    elseif 序号 == 18 then
        --print(#内容)
        for n = 1, #tp.队伍[1].宝宝列表 do
            tp.队伍[1].宝宝列表[n].参战信息 = nil
            if 内容.认证码 == tp.队伍[1].宝宝列表[n].认证码 then
                tp.队伍[1].宝宝列表[n].参战信息 = 1
            end
        end
        tp.队伍[1].参战宝宝 = 内容
    elseif 序号 == 19 then
        --tp.窗口.召唤兽属性栏.bb.名称=内容.名称
        tp.队伍[1].宝宝列表[内容.序列].名称 = 内容.名称
    elseif 序号 == 20 then
        --print(#内容)
        for n = 1, #tp.队伍[1].宝宝列表 do
            if 内容.认证码 == tp.队伍[1].宝宝列表[n].认证码 then
                tp.队伍[1].宝宝列表[n] = 内容
            end
        end
    elseif 序号 == 21 then
        tp.窗口.召唤兽属性栏:放生()
    elseif 序号 == 22 then
        tp.宠物 = 内容
        tp.窗口.宠物状态栏:打开()
    elseif 序号 == 22.5 then
        tp.物品数据库提示 = 内容
        tp.窗口.抽奖系统:打开()
    elseif 序号 == 23 then
        tp.窗口.宠物洗练栏:打开(内容.道具)
    elseif 序号 == 22.1 then
        tp.成就 = 内容
        tp.窗口.成就系统栏:打开()
    elseif 序号 == 22.2 then
        tp.宝图提示 = 内容
        tp.窗口.宝图提示:打开()
    elseif 序号 == 22.3 then
        tp.成就提示 = 内容
        tp.窗口.成就提示:打开()
    elseif 序号 == 22.4 then
        tp.成就提示1 = 内容
        tp.窗口.成就提示1:打开()
    elseif 序号 == 24 then
        tp.窗口.宠物洗练栏:刷新道具(内容.道具)
    elseif 序号 == 25 then
        tp.窗口.宠物洗练栏:清除()
    elseif 序号 == 26 then
        tp.窗口.宠物合宠栏:清除()
    elseif 序号 == 27 then --聊天框文本
        tp.窗口.消息框:添加文本(内容.文本, 内容.频道)
    elseif 序号 == 28 then
        tp.窗口.道具行囊:置形象()
    elseif 序号 == 29 then
        tp.窗口.染色:打开()
    elseif 序号 == 29.1 then
        tp.窗口.组合输入框:打开('改名', {'为你的角色取一个好听的名字吧，费用1亿', ARGB(255, 255, 255, 0)})
    elseif 序号 == 29.4 then
        tp.窗口.组合输入框:打开('更改宠物造型', {'请输入正确的召唤兽名字，名字输入错误无效！！', ARGB(255, 255, 255, 0)})
    elseif 序号 == 30 then
        --tp.窗口.染色:打开()
        tp.队伍[1].染色组 = 内容
        tp.场景.人物:置染色(tp.队伍[1].染色方案, 内容[1], 内容[2], 内容[3])
    elseif 序号 == 31 then --更新人物界面
        self.临时装备 = table.loadstring(table.tostring(tp.队伍[1].装备))
        -- print(table.tostring(内容))
        tp.队伍[1]:重置属性(内容)
        tp.金钱 = 内容.银子
        tp.储备 = 内容.储备
        tp.存银 = 内容.存银
    elseif 序号 == 32 then
        tp.窗口.技能学习:打开()
    elseif 序号 == 33 then
        self.临时装备 = table.loadstring(table.tostring(tp.队伍[1].装备))
        tp.队伍[1]:重置属性(内容)
    elseif 序号 == 34 then --更新辅助技能
        tp.队伍[1].辅助技能[内容.序列].等级 = 内容.等级
        if tp.窗口.人物状态栏.可视 and tp.窗口.人物状态栏.辅助技能[内容.序列].技能 ~= nil then
            tp.窗口.人物状态栏.辅助技能[内容.序列].技能.等级 = 内容.等级
            local 临时消耗 = 生活技能消耗(内容.等级 + 1)
            tp.窗口.人物状态栏.辅助技能[内容.序列].技能.介绍 =
                tp.窗口.人物状态栏.辅助技能[内容.序列].技能.原介绍 ..
                '\n' .. '#Y/学习消耗：' .. 临时消耗.经验 .. '点人物经验、' .. 临时消耗.金钱 .. '两银子#R/（>=40级的生活技能必须在加入帮派后才可学习）'
        end
    elseif 序号 == 34.1 then
        tp.队伍[1].强化技能[内容.序列].等级 = 内容.等级
        if tp.窗口.人物状态栏.可视 and tp.窗口.人物状态栏.强化技能[内容.序列].技能 ~= nil then
            tp.窗口.人物状态栏.强化技能[内容.序列].技能.等级 = 内容.等级
            local 临时消耗 = 强化技能消耗1(内容.等级 + 1, tp.队伍[1].强化技能[内容.序列].名称)
            tp.窗口.人物状态栏.强化技能[内容.序列].技能.介绍 =
                tp.窗口.人物状态栏.强化技能[内容.序列].技能.原介绍 ..
                '\n' .. '#Y/学习消耗：' .. 临时消耗.经验 .. '点人物经验、' .. 临时消耗.金钱 .. '两银子#R/（>=40级的生活技能必须在加入帮派后才可学习）'
        end
    elseif 序号 == 35 then
        tp.金钱 = 内容.银子
        tp.储备 = 内容.储备
        tp.存银 = 内容.存银
        tp.队伍[1].当前经验 = 内容.经验
    elseif 序号 == 36 then
        tp.场景.人物:加入动画(内容.动画)
    elseif 序号 == 37 then
        if 内容 == '1' then
            内容.变身数据 = nil
        end
        tp.队伍[1].变身数据 = 内容.变身数据
        tp.队伍[1].变异 = 内容.变异
        tp.场景.人物:置模型()
    elseif 序号 == 38 then
        if 内容.频道 == 'xt' and 屏蔽系统消息 then
        elseif 内容.频道 == 'hd' and 屏蔽活动消息 then
        else
            tp.窗口.消息框:添加文本(内容.内容, 内容.频道)
        end
    elseif 序号 == 39 then
        if tp.窗口.任务栏.可视 then
            发送数据(10)
        end
    elseif 序号 == 40 then
        if tp.窗口.任务栏.可视 then
            tp.窗口.任务栏:打开()
        end
        tp.窗口.任务栏:打开(内容)
    elseif 序号 == 41 then
        tp.窗口.快捷技能栏:刷新(内容)
    elseif 序号 == 42 then
        tp.窗口.快捷技能栏:刷新(内容, 1)
    elseif 序号 == 43 then
        tp.窗口.时辰.序列 = 内容.时辰
    elseif 序号 == 44 then
        tp.队伍[1].修炼 = 内容.人物
        tp.队伍[1].bb修炼 = 内容.bb
    elseif 序号 == 45 then
        tp.窗口.召唤兽属性栏:放生(1)
    elseif 序号 == 46 then
        tp.窗口.任务追踪栏:刷新(内容[1], 内容[2], 内容[3], 内容[4])
    elseif 序号 == 47 then
        tp.窗口.任务追踪栏.介绍文本:清空()
        tp.窗口.任务追踪栏.数据记录 = {}
    elseif 序号 == 48 then
        tp.队伍[1].自动遇怪 = 内容.遇怪
    elseif 序号 == 49 then
        tp.窗口.排行榜:刷新(内容)
    elseif 序号 == 49.1 then
        tp.窗口.天梯:刷新排行(内容)
    elseif 序号 == 50 then
        tp.窗口.好友列表:打开(内容)
    elseif 序号 == 51 then
        tp.窗口.好友列表.查找结果 = 内容
    elseif 序号 == 52 then
        if tp.窗口.好友列表.可视 then
            发送数据(19)
        end
    elseif 序号 == 53 then
        if tp.窗口.好友列表.可视 then
            tp.窗口.好友列表.数据 = 内容
        end
    elseif 序号 == 54 then
        if tp.窗口.好友列表.可视 then
            --tp.窗口.好友列表.数据=内容
            for i, v in pairs(内容.数据) do
                tp.窗口.好友列表.数据[内容.类型][内容.序列][i] = 内容.数据[i]
                if i ~= '模型' then
                    tp.窗口.好友列表.显示信息[i] = 内容.数据[i]
                end
            end
        --  tp.窗口.好友列表.显示信息.名称=内容.
        end
    elseif 序号 == 55 then
        if tp.窗口.好友消息.可视 then
            tp.窗口.好友消息.丰富文本:添加文本('#R' .. 内容.信息)
            tp.窗口.好友消息.丰富文本:添加文本('#H' .. 内容.内容)
            local 临时内容 = 读入文件([[data\]] .. tp.队伍[1].数字id .. [[\]] .. 内容.id .. [[\记录.txt]])
            临时内容 = 临时内容 .. '\n' .. '#R' .. 内容.信息 .. '\n' .. '#H' .. 内容.内容
            local file = io.open([[data\]] .. tp.队伍[1].数字id .. [[\]] .. 内容.id .. [[\记录.txt]], 'w')
            file:write(临时内容)
            file:close()
        end
    elseif 序号 == 56 then
        消息闪烁 = true
    elseif 序号 == 57 then
        消息闪烁 = false
    elseif 序号 == 58 then
        tp.窗口.好友消息:打开(内容.名称, 内容.id, 内容.好友度, 内容.等级, 内容.模型, 1, 消息)
        tp.窗口.好友消息.丰富文本:添加文本('#R' .. 内容.信息)
        tp.窗口.好友消息.丰富文本:添加文本('#H' .. 内容.内容)
        local 临时内容 = 读入文件([[data\]] .. tp.队伍[1].数字id .. [[\]] .. 内容.id .. [[\记录.txt]])
        临时内容 = 临时内容 .. '\n' .. '#R' .. 内容.信息 .. '\n' .. '#H' .. 内容.内容
        local file = io.open([[data\]] .. tp.队伍[1].数字id .. [[\]] .. 内容.id .. [[\记录.txt]], 'w')
        file:write(临时内容)
        file:close()
    elseif 序号 == 59 then
        tp.窗口.消息框:添加文本(内容.内容, 内容.频道)
        游戏公告:添加公告(内容)
    elseif 序号 == 59.1 then
        游戏传音:添加公告(内容)
    elseif 序号 == 60 then
        tp.坐骑 = 内容
        tp.队伍[1].坐骑 = tp.坐骑
        if tp.坐骑 == '1' then
            tp.坐骑 = nil
        end
        if tp.坐骑 == nil then
            tp.场景.人物:卸下坐骑()
        else
            tp.场景.人物:坐骑改变(tp.队伍[1].模型, tp.坐骑)
        end
    elseif 序号 == 60.1 then
        --  elseif 序号==60.4 then
        -- tp.锦衣隐藏=1
        --   tp.场景.人物:卸下锦衣()
        tp.坐骑速度 = 内容
    elseif 序号 == 61 then
        tp.坐骑列表 = 内容
    elseif 序号 == 61.2 then
        tp.坐骑列表 = 内容
        tp.窗口.坐骑属性栏:打开()
    elseif 序号 == 61.1 then
        tp.坐骑列表[内容.编号] = 内容.数据
        if tp.窗口.坐骑属性栏.可视 then
            tp.窗口.坐骑属性栏:刷新统御()
        end
        if tp.窗口.坐骑技能栏.可视 then
            tp.窗口.坐骑技能栏:刷新技能(tp.坐骑列表[内容.编号], 内容.编号)
        end
    elseif 序号 == 62 then
        tp.窗口.装备开运:打开(内容)
    elseif 序号 == 63 then
        tp.窗口.装备开运:刷新(内容)
    elseif 序号 == 64 then
        tp.窗口.鉴定:打开(内容)
    elseif 序号 == 65 then
        tp.窗口.附魔:打开(内容)
    elseif 序号 == 65.1 then
        tp.窗口.分解:打开(内容)
    elseif 序号 == 66 then --对话输入框系统
        tp.窗口.组合输入框:打开('创建帮派', {'为你的帮派取一个好听的名字吧', ARGB(255, 255, 255, 0)})
    elseif 序号 == 66.3 then
        tp.窗口.魂环穿戴与洗练:打开(内容)
    elseif 序号 == 66.4 then
        tp.窗口.魂环洗练:刷新(内容)
    elseif 序号 == 67 then --对话输入框系统
        tp.窗口.帮派查看:打开(内容, '1')
    elseif 序号 == 68 then --加入帮派
        tp.窗口.帮派申请:打开(内容)
    elseif 序号 == 69 then --1 帮派数据 2 称谓数据 3 退出帮派
        if 内容.项目 == '1' then
            tp.队伍[1].帮派数据 = 内容
        elseif 内容.项目 == '2' then
            tp.称谓 = 内容.称谓
            tp.当前称谓 = 内容.当前称谓
            if tp.窗口.人物称谓栏.可视 then
                tp.窗口.人物称谓栏:刷新()
            end
        elseif 内容.项目 == '3' then
            tp.队伍[1].帮派数据 = nil
        end
    elseif 序号 == 70 then
        tp.窗口.跑商商店:打开(内容.商品, 内容.银子, 内容.道具)
    elseif 序号 == 71 then
        tp.窗口.钱庄存取钱:打开(内容.银子, 内容.存银)
    elseif 序号 == 72 then
        tp.窗口.钱庄存取钱:刷新(内容.银子, 内容.存银)
    elseif 序号 == 73 then
        tp.进程 = 1
    elseif 序号 == 74 then
        tp.窗口.帮派点修:打开(内容.银子, 内容.存银)
    elseif 序号 == 75 then
        tp.窗口.帮派技能学习:打开(内容.银子, 内容.储备, 内容.帮派数据)
    elseif 序号 == 76 then
        tp.窗口.武器染色:打开()
    elseif 序号 == 77 then
        tp.窗口.奇经八脉:打开(内容)
    elseif 序号 == 78 then
        红尘进度 = 内容.进度
    elseif 序号 == 79 then
        tp.窗口.符石合成:打开(内容)
    elseif 序号 == 79.1 then
        tp.窗口.钟灵石合成:打开(内容)
    elseif 序号 == 80 then
        tp.窗口.坐骑染色:打开(内容)
    elseif 序号 == 81 then
        tp.窗口.坐骑饰品染色:打开(内容)
    elseif 序号 == 82 then
        tp.窗口.人物称谓栏:打开()
    elseif 序号 == 83 then
        tp.窗口.法宝合成:打开(内容)
    elseif 序号 == 84 then
        tp.窗口.附魔宝珠:打开(内容)
    elseif 序号 == 84.1 then
        tp.窗口.碎星锤:打开(内容)
    elseif 序号 == 84.2 then
        tp.窗口.灵箓:打开(内容)
    elseif 序号 == 84.3 then
        tp.窗口.点化石:打开(内容)
    elseif 序号 == 84.12 then
        tp.窗口.洗炼丹:打开(内容)
    elseif 序号 == 84.13 then
        tp.窗口.高级洗炼丹:打开(内容)
    elseif 序号 == 85 then
        if tp.窗口.神秘宝箱.可视 then
            tp.窗口.神秘宝箱:打开()
        end
        tp.窗口.神秘宝箱:打开(内容)
    elseif 序号 == 86 then
        self.发送信息 = {}
        self.发送信息.分类 = '积分商城'
        发送数据(29, self.发送信息)
    elseif 序号 == 87 then
        tp.窗口.生死劫:打开()
    elseif 序号 == 88 then
        -- elseif 序号 == 88.1 then
        -- if tp.窗口.VIP系统.可视 then
        --   tp.窗口.VIP系统:首冲刷新(内容.分类,内容.次数)
        -- end
        tp.窗口.梦幻指引:打开(内容)
    elseif 序号 == 89 then
        tp.窗口.组合输入框:打开('帮派竞赛报名', {'请输入报名帮费(最低费用50W)', ARGB(255, 255, 255, 0)})
    elseif 序号 == 90 then
        tp.窗口.签到界面:打开(内容)
    elseif 序号 == 90.1 then
        tp.窗口.签到界面:刷新(内容)
    elseif 序号 == 92 then
        tp.窗口.充值系统:打开(内容)
        tp.点卡 = 内容.点卡
    elseif 序号 == 92.1 then
        tp.窗口.充值系统:刷新(内容)
        tp.点卡 = 内容.点卡
    elseif 序号 == 92.2 then
        tp.点卡 = 内容.点卡
    elseif 序号 == 93 then
        tp.pk开关 = 内容.开关
    elseif 序号 == 94 then
        tp.强p开关 = 内容.开关
    elseif 序号 == 95 then
        tp.窗口.宠物打书内丹栏:清除()
    elseif 序号 == 96 then
        tp.窗口.宠物打书内丹栏:刷新道具(内容.道具)
    elseif 序号 == 99 then ---=================屏蔽fwd向客户端发送时间
        local 临时数据 = table.loadstring(数据)
        if 临时数据.内容 ~= nil and 临时数据.内容.内容 ~= nil and 临时数据.内容.频道 ~= nil then
            tp.窗口.消息框:添加文本(临时数据.内容.内容, 临时数据.内容.频道)
        end
    elseif 序号 == 100 then
        tp.助战列表[内容.编号] = 内容.数据
    elseif 序号 == 100.43 then
        tp.窗口.天梯:打开(内容)
    elseif 序号 == 100.46 then
        tp.窗口.天梯.进程 = 3
    elseif 序号 == 100.47 then
        tp.窗口.天梯.进程 = 1
    elseif 序号 == 100.48 then
        tp.窗口.天梯.是否模式 = 内容.模式
    elseif 序号 == 100.41 then
        tp.窗口.超级传送.信息 = 内容
    elseif 序号 == 101 then
        tp.助战列表 = 内容
        tp.窗口.助战界面:打开()
    elseif 序号 == 102 then
        tp.助战列表 = 内容
        if tp.窗口.助战界面.可视 then
            tp.窗口.助战界面:刷新()
        end
    elseif 序号 == 103 then --获取助战物品数据
        tp.窗口.助战物品界面:打开(内容)
    elseif 序号 == 104 then
        tp.窗口.助战物品界面:刷新装备(内容)
    elseif 序号 == 105 then
        local 数据 = 内容.道具
        tp.窗口.助战物品界面:刷新物品(数据)
    elseif 序号 == 106 then
        tp.助战列表[内容.编号].武器数据 = 内容.数据
        if tp.窗口.助战界面.可视 then
            tp.窗口.助战界面:刷新武器(内容.编号)
        end
    elseif 序号 == 107 then
        tp.窗口.助战物品界面:刷新灵饰(内容)
    elseif 序号 == 107.1 then
        tp.窗口.助战物品界面:刷新锦衣(内容)
    elseif 序号 == 107.2 then
        tp.窗口.助战物品界面:刷新法宝(内容)
    elseif 序号 == 107.3 then
        tp.窗口.助战物品界面:刷新修炼(内容)
    elseif 序号 == 107.4 then
        tp.窗口.助战物品界面:刷新门派(内容)
    elseif 序号 == 108 then
        tp.窗口.炼丹炉:打开(内容)
    elseif 序号 == 108.1 then
        tp.窗口.炼丹炉:更新(内容)
    elseif 序号 == 108.2 then
        tp.窗口.炼丹炉:开奖(内容)
    elseif 序号 == 109 then
        tp.窗口.炼丹炉:刷新(内容)
    elseif 序号 == 110 then
        tp.窗口.指定系统:打开(内容)
    elseif 序号 == 110.1 then ---改
        tp.窗口.武魂界面:刷新(内容)
        print(内容)
    elseif 序号 == 111 then
        tp.房屋数据 = 内容
    elseif 序号 == 112 then
        tp.窗口.商店召唤兽:打开(内容)
    elseif 序号 == 113 then
        tp.窗口.商店召唤兽:更新数据(内容)
    elseif 序号 == 117.1 then
        tp.窗口.点歌台:打开(内容)
    elseif 序号 == 118.1 then
        tp.窗口.点歌播放:打开(内容.地址, 内容.祝福)
    elseif 序号 == 119 then
        tp.窗口.助战宠物:打开(内容, tp.窗口.助战界面.选中)
    elseif 序号 == 120 then
        tp.助战列表 = 内容.助战数据
        tp.窗口.助战宠物:刷新(内容.召唤兽数据)
    elseif 序号 == 120.0 then
        tp.窗口.取经之路:刷新(内容)
    elseif 序号 == 121.1 then
        tp.窗口.取经图鉴:打开(内容)
    elseif 序号 == 122.2 then
        tp.窗口.取经图鉴:刷新(内容)
    elseif 序号 == 123 then
        tp.金钱 = 内容.银子
        if tp.窗口.幻化界面.可视 == false then
            tp.窗口.幻化界面:打开(内容.道具)
        else
            tp.窗口.幻化界面:刷新道具(内容.道具)
        end
    elseif 序号 == 124.4 then
        tp.队伍[1].宝宝列表 = 内容
        tp.队伍[1]:刷新宝宝技能()
        tp.队伍[1]:刷新宝宝认证技能()
        tp.窗口.召唤兽繁殖:打开()
    elseif 序号 == 141 then
        tp.窗口.宠物合宠栏:打开(内容.道具)
    elseif 序号 == 142 then
        tp.窗口.宠物打书内丹栏:打开(内容.道具, 1)
    elseif 序号 == 143 then
        --   elseif 序号 == 145 then
        --   tp.窗口.人物炫彩:打开()
        -- elseif 序号 == 146 then
        --   if tp.队伍[1].炫彩 == nil then
        --     tp.队伍[1].炫彩 = 1
        --     tp.队伍[1].炫彩组 = {}
        --   end
        --   tp.队伍[1].炫彩 = 内容.炫彩
        --   tp.队伍[1].炫彩组 = 内容.炫彩组
        --   tp.场景.人物:炫彩染色(tp.队伍[1].染色方案,tp.队伍[1].炫彩组,"人物")
        tp.窗口.宠物打书内丹栏:打开(内容.道具, 2)
    elseif 序号 == 201 then
        tp.窗口.拍卖系统:打开(内容)
    elseif 序号 == 202 then
        if tp.窗口.拍卖系统.可视 then
            tp.窗口.拍卖系统:刷新拍卖数据(内容)
        end
    elseif 序号 == 203 then
        if tp.窗口.拍卖系统.可视 then
            tp.窗口.拍卖系统:打开竞拍数据(内容)
        end
    elseif 序号 == 204 then
        tp.窗口.拍卖系统管理:打开(内容.道具)
    elseif 序号 == 205 then
        if tp.窗口.拍卖系统管理.可视 then
            tp.窗口.拍卖系统管理:刷新数据(内容.道具)
        end
    elseif 序号 == 206 then
        if tp.窗口.拍卖系统.可视 then
            tp.窗口.拍卖系统:刷新竞价数据(内容)
        end
    elseif 序号 == 120.000 then
        tp.窗口.VIP系统:刷新数据(内容)
    elseif 序号 == 121.111 then
        tp.窗口.VIP系统:刷新回收(内容)
    elseif 序号 == 122.222 then
        tp.窗口.VIP系统:打开(内容)
    elseif 序号 == 123.33 then
        全局地址 = 内容
    elseif 序号 == 124 then
        tp.窗口.孩子技能学习:打开(内容)
    elseif 序号 == 125 then
        tp.窗口.孩子技能学习:刷新数据(内容)
    elseif 序号 == 126 then
        tp.怪物信息 = 内容[1]
        tp.活动信息 = 内容[2]
    elseif 序号 == 127 then --打开藏宝阁
        tp.窗口.藏宝阁:打开(内容)
    elseif 序号 == 128 then
        tp.窗口.藏宝阁出售:打开(内容, '道具')
    elseif 序号 == 130 then
        tp.窗口.藏宝阁出售:打开(内容, '召唤兽')
    elseif 序号 == 129 then
        -- elseif 序号 == 129 then
        --   if tp.窗口.藏宝阁.可视 then
        --     tp.窗口.藏宝阁:刷新数据(内容)
        --   else
        --     发送数据(60.7)
        --   end
        tp.窗口.藏宝阁银子出售:打开(内容)
    elseif 序号 == 131 then
        tp.窗口.角色查看:打开(内容)
    elseif 序号 == 132 then
        tp.窗口.藏宝阁角色取回:打开()
    elseif 序号 == 133 then
        tp.窗口.神秘宝箱:刷新数据(内容)
    elseif 序号 == 134 then
        tp.窗口.神秘宝箱:打开(内容)
    elseif 序号 == 135 then
        tp.窗口.神秘宝箱:刷新下注(内容)
    elseif 序号 == 136 then
        tp.窗口.神秘宝箱:刷新时间(内容)
    elseif 序号 == 137 then
        tp.窗口.召唤兽查看栏:打开(内容)
    elseif 序号 == 138 then
        tp.窗口.没名系统:打开(内容)
    elseif 序号 == 139 then
        tp.窗口.没名系统:刷新数据(内容)
    elseif 序号 == 140 then
        tp.窗口.没名系统处理:刷新数据(内容)
    elseif 序号 == 141.111 then
        tp.窗口.VIP系统:征战刷新(内容)
    elseif 序号 == 142.2 then
        tp.窗口.仙玉兑换:打开(内容)
    elseif 序号 == 143.3 then
        tp.窗口.仙玉兑换:打开(内容)
    elseif 序号 == 100.44 then
        --table.print(内容)
        tp.窗口.元神:打开(内容)
    elseif 序号 == 100.45 then
        if tp.窗口.元神.可视 then
            tp.窗口.元神:刷新(内容)
        end
    elseif 序号 == 200 then
        tp.窗口.内充抽奖:打开(内容)
    elseif 序号 == 300 then
        tp.窗口.内充抽奖:刷新(内容)
    elseif 序号 == 142.142 then
        tp.窗口.成就特效:打开(内容)
    elseif 序号 == 992 then --介绍分类
        玩法介绍 = 内容.内容
        tp.窗口.梦幻指引.状态 = 2
        tp.窗口.梦幻指引.子类状态 = 1
        tp.窗口.梦幻指引.分类 = {}
        tp.窗口.梦幻指引.子类 = {}
        if 玩法介绍 ~= nil and 玩家介绍 ~= {} then
            for i = 1, #玩法介绍 do
                tp.窗口.梦幻指引.分类[#tp.窗口.梦幻指引.分类 + 1] = 玩法介绍[i]['分类']
            end
        end
    elseif 序号 == 991 then --玩法介绍内容
        tp.窗口.梦幻指引.玩法介绍内容 = 内容.内容
        if tp.窗口.梦幻指引.玩法介绍内容 ~= nil and tp.窗口.梦幻指引.玩法介绍内容 ~= '' then
            tp.窗口.梦幻指引.丰富文本说明:置文本(tp.窗口.梦幻指引.玩法介绍内容)
            tp.窗口.梦幻指引.丰富文本说明.滚动值 = tp.窗口.梦幻指引.丰富文本说明.行数量
            tp.窗口.梦幻指引.丰富文本说明:滚动(tp.窗口.梦幻指引.丰富文本说明.滚动值)
            tp.窗口.梦幻指引.丰富文本说明:滚动(-14)
        end
    elseif 序号 == 998 then --
        f函数.信息框(内容, '下线通知')
        引擎.关闭()
    elseif 序号 == 999 then
        f函数.信息框(内容, '下线通知')
        os.exit()
    end
end

function 回调:更新(dt)
end

function 回调:断开连接(连接)
    print('与服务器连接被断开1')
end

-- function 回调:连接断开(连接)
--   -- if 系统退出 then
--   --   系统退出=false
--   --   tp.进程 = 1
--   --   引擎.置标题(全局游戏标题)
--   -- else
--   --   print(debug.traceback())
--   --   f函数.信息框("服务器连接断开!.....")
--   --   引擎.关闭()
--   -- end
-- end

function 回调:数据到达2(序号, 内容, 时间)
    print('---------回调:数据到达2---------')
    客户端:数据到达(序号)
end

-- protobuf 协议的服务处理
function 回调:系统处理PB(cmd, pb_entity)
    print(cmd .. '=============')
    if cmd < 999 then
        self:基础系统逻辑处理(cmd, pb_entity)
    elseif cmd == 1001 then
        tp.读取:添加角色信息PB(pb_entity)
    end
end

function 回调:基础系统逻辑处理(cmd, pb_entity)
    if cmd == 101 and pb_entity ~= nil and pb_entity.ok == 1 then
        if pb_entity.action == 2 then
            tp.进程 = 2
        elseif pb_entity.action == 3 then
            tp.进程 = 3
        elseif pb_entity.action == 4 then
            -- TODO 重新获取任务信息发送请求

        end
    end
end

return 回调
