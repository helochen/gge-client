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
    self._define[1006] = 'GGEGaming.ActorJoinRequest'
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

function protobuf:bufToInt32(num1, num2, num3, num4)
    local num = 0
    num = num + self:leftShift(num1, 24)
    num = num + self:leftShift(num2, 16)
    num = num + self:leftShift(num3, 8)
    num = num + num4
    return num
end

-- int转二进制
function protobuf:int32ToBufStr(num)
    local str = ''
    str = str .. self:numToAscii(self:rightShift(num, 24))
    str = str .. self:numToAscii(self:rightShift(num, 16))
    str = str .. self:numToAscii(self:rightShift(num, 8))
    str = str .. self:numToAscii(num)
    return str
end

-- 二进制转shot
function protobuf:bufToInt16(num1, num2)
    local num = 0
    num = num + self:leftShift(num1, 8)
    num = num + num2
    return num
end

-- shot转二进制
function protobuf:int16ToBufStr(num)
    local str = ''
    str = str .. self:numToAscii(self:rightShift(num, 8))
    str = str .. self:numToAscii(num)
    return str
end

-- 左移
function protobuf:leftShift(num, shift)
    return math.floor(num * (2 ^ shift))
end

-- 右移
function protobuf:rightShift(num, shift)
    return math.floor(num / (2 ^ shift))
end

-- 转成Ascii
function protobuf:numToAscii(num)
    num = num % 256
    return string.char(num)
end

return protobuf
