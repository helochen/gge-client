local _Max = 0
local MaxSize = 0
local ffi  = require("ffi")
local new  = ffi.new
local wdf  = class()
local 文件 = require("文件类")
local _Ptr = new('char[10485760]')--全局共享内存

function wdf:初始化(路径,mim)

    self.File  = 文件(路径)
    self.List  = {}
    local head = self.File:读入数据(new("WDF_HEADER"))
    local flag = ffi.string(head.Flag,4)
    if flag == "PRGL" and mim ~= nil and mim~="1" then
        head.Offset=head.Offset-mim
        head.Number=head.Number-mim
    end
    self.File:移动读写位置(head.Offset,self.File.SEEK_SET)
    self.Clist = self.File:读入数据(new("FILELIST[?]",head.Number))

    -- for i=0,head.Number-1 do
    --     self.List[self.Clist[i].Hash] = self.Clist[i]
    -- end
    for i = 0, head.Number - 1, 1 do
        if flag == "PRGL" and mim ~= nil and mim~="1" then
            self.Clist[i].Offset=self.Clist[i].Offset-mim
        end
        self.List[self.Clist[i].Hash] = self.Clist[i]
        -- if MaxSize < self.Clist[i].Size then
        --     MaxSize = self.Clist[i].Size
        -- end
    end
    -- if _Max < MaxSize then
    --     _Max = MaxSize
    --     _Ptr = ffi.new("char[?]", MaxSize)
    -- end
end

function wdf:读数据(Hash)
    if type(Hash) == "string" then
        Hash = tonumber(Hash)
    end
    if self.List[Hash] then
        self.File:移动读写位置(self.List[Hash].Offset, self.File.SEEK_SET)
        self.File:读入数据(_Ptr, self.List[Hash].Size)

        return _Ptr, self.List[Hash].Size
    end
end

function wdf:读偏移(Hash)
    if self.List[Hash] then
        return self.List[Hash].Offset,self.List[Hash].Size
    end
end

return wdf