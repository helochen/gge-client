--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2021-04-17 16:51:18
-- 梦幻西游游戏资源破解 baidwwy@vip.qq.com(313738139) 老毕   和 C++PrimerPlus 717535046 这俩位大神破解所以资源
--======================================================================--
local 客户端类 = class()
local 回调 = require('script/网络/数据交换')

function 客户端类:初始化()
    self.连接账号 = ''
    self.连接密码 = ''
    self.连接结果 = false
    fgf = '*-*'
    fgc = '@+@'
end

function 客户端类:更新(dt)
end

function 发送数据(id, 内容)
    if 开发调试 then
        print('pb send..............' .. id)
        客户端类:发送PB数据(cmd, data)
    else
        if 内容 == nil then
            内容 = {}
        end
        if type(内容) == 'table' then
            print('send..............' .. id .. table.tostring(内容))
        else
            print('send..............' .. id .. 内容)
        end
        客户端:发送数据(id, 内容, 1)
    end
end

-- 发送protobuf数据格式
function 客户端类:发送PB数据(cmd, data)
    回调:BP数据发送(cmd, data)
end

function 客户端类:发送数据(序号, 内容, 数组转换)
    回调:发送数据(序号, 内容, 数组转换)
end

function 客户端类:连接处理(ip, 端口, 账号, 密码)
    self.连接结果 = 回调:连接(ip, 端口)
    if self.连接结果 == false then
        f函数.信息框('连接服务器失败，请确认服务器是否在维护中或本机网络出现故障', '通知')
        os.exit()
    --tp.提示:写入("#R/连接服务器失败，请确认服务器是否在维护中或本机网络出现故障")
    end
    self.连接结果 = false
end

function 客户端类:重新连接()
    os.exit()
end

function 客户端类:取状态(连接)
    return self:取状态()
end

function 客户端类:断开(数据)
    回调:断开(数据)
end

function 客户端类:数据到达(序号, 内容, 时间)
end

return 客户端类
