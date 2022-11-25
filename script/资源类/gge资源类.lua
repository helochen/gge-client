-- @Author: baidwwy
-- @Date:   2018-06-09 08:26:52
-- @Last Modified by:   Administrator
-- @Last Modified time: 2020-09-29 20:40:58
local _GGE = require("__ggebase__")()
local GGELUA = class()


function GGELUA:初始化(...)
    for i,v in ipairs({...}) do
        self:添加路径(v)
    end
end
--添加一个GPK包
-- @param filename 文件名
-- @param password 密码
-- @return 绑定成功返回true，否则返回false
function GGELUA:添加包(filename,password)
    assert(_GGE:Resource_AttachPack(filename,password), '添加失败！')
    return self
end
-- @brief 移除文件包
-- @param filename 文件名
function GGELUA:删除包(filename)
    _GGE:Resource_RemovePack(filename)
end
--@brief 添加资源文件搜索路径
function GGELUA:添加路径(pathname)
    _GGE:Resource_AddPath(pathname)
    return self
end
--@参数 包内文件名,或磁盘文件名.
--@返回 文件指针
function GGELUA:取文件(filename,size)
    local data = _GGE:Resource_Load(filename)
    if data and size then
        return data,#data
    end
    return data
end
function GGELUA:取动画(filename)
    return require("gge动画类")(filename)
end

function GGELUA:取纹理(filename)
    return require("gge纹理类")(filename)
end
function GGELUA:取精灵(filename)
    return require("gge精灵类")(self:取纹理(filename))
end
function GGELUA:取音效(filename)
    return require("gge音效类")(filename)
end
function GGELUA:取文字(filename)
    return require("gge文字类")(filename)
end
-- @brief 读取资源文件到指定的内存中
-- @param filename 资源文件名
-- @param buf 用于保存资源文件的内存
-- @param size 内存大小，如果小于文件大小读取将会失败
-- @return 读取成功返回实际读取的字节数，读取失败返回0
function GGELUA:取文件到(filename,buf,size)
    return _GGE:Resource_LoadTo(filename,buf,size)
end
--@参数 包内文件名,或磁盘文件名.
--@返回 文件长度
function GGELUA:取长度(filename)
    return _GGE:Resource_GetSize(filename)
end
--@参数 包内文件名,或磁盘文件名.
--@返回 存在返回true
function GGELUA:检查文件(filename)
    return _GGE:Resource_IsExist(filename)
end

return GGELUA