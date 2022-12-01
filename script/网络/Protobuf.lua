local pb = require('pb')
local buffer = require('pb.buffer')
local slice = require('pb.slice')

local protobuf = class()

function protobuf:初始化()
    for file in lfs.dir('proto') do
        if file ~= '.' and file ~= '..' then
            local f = 'proto' .. '/' .. file
            local attr = lfs.attributes(f)
            pb.loadfile(f)
        end
    end
    self._define = {}
    --系统相关
    self._define[100] = 'GGESystem.SystemRequest'
    self._define[101] = 'GGESystem.SystemResponse'
    -- 登陆
    self._define[1000] = 'GGEGaming.LoginRequest'
    self._define[1001] = 'GGEGaming.LoginResponse'
    self._define[1004] = 'GGEGaming.RegisterRequest'
    self._define[1005] = 'GGEGaming.AccountRequest'
    self._define[1006] = 'GGEGaming.ActorJoinRequest'
    -- 角色进入游戏
    self._define[2000] = 'GGEGaming.ActorJoinResponse'
    -- 移动基础命令
    self._define[3000] = 'GGEGaming.MovingRequest'
    -- 推送命令
    self._define[2005] = 'GGEGaming.NpcInfoAutoPush'
end

-- 查询返回的内容数据
function protobuf:q(cmd)
    return self._define[cmd]
end

-- 转换二进制数据
function protobuf:encode(cmd, content)
    local b_data = pb.encode(self:q(cmd), content)
    if b_data then
        local b = buffer.new()
        b:pack('xs', cmd, b_data)
        local r = b:result()
        b:delete()
        return r
    end
end

-- 解析数据结构
function protobuf:decode(b_data)
    if b_data ~= nil then
        local s = slice.new(b_data)
        local cmd = s:unpack('y')
        local pb_entity = pb.decode(self:q(cmd), s:result())
        s:delete()
        return cmd, pb_entity
    end
    return -1, {}
end

return protobuf
