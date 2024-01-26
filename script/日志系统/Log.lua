local Log = class()

  
function Log:初始化()
    self:info('初始化日志系统。')
end 
  
function Log:debug(...)
    local formattedMessage = "[" .. os.date("%Y-%m-%d %H:%M:%S") .. "] [DEBUG] " .. self:tostring(...)  -- 格式化带有时间和级别的消息  
    print(formattedMessage)  -- 打印消息  
end  
  
function Log:info(...)  
    local formattedMessage = "[" .. os.date("%Y-%m-%d %H:%M:%S") .. "] [INFO] " .. self:tostring(...)  -- 格式化带有时间和级别的消息  
    print(formattedMessage)  -- 打印消息  
end  
  
function Log:warning(...)  
    local formattedMessage = "[" .. os.date("%Y-%m-%d %H:%M:%S") .. "] [WARNING] " .. self:tostring(...)  -- 格式化带有时间和级别的消息  
    print(formattedMessage)  -- 打印消息  
end  
  
function Log:error(...)  
    local formattedMessage = "[" .. os.date("%Y-%m-%d %H:%M:%S") .. "] [ERROR] " .. self:tostring(...)  -- 格式化带有时间和级别的消息  
    print(formattedMessage)  -- 打印消息  
end

-- 打印lua的table对象到字符串功能
function Log:table2String(t , indent)
    local str = ''
    for k,v in pairs(t) do
        local keystr = type(k) == 'number' and '' or tostring(k) .. ' = '
        local indentStr = string.rep(' ', indent or 0)
        if type(v) == 'table' then
            str = str ..'\n' .. indentStr .. keystr  .. '{\n' .. self:table2String(v , (indent or 0) + 4) .. indentStr .. '}'
        else
            if type(v) == 'boolean' then
                str = str.. indentStr .. keystr .. (v and 'true' or 'false') .. ';\n' 
            elseif type(v) == 'number' then
                str = str.. indentStr .. keystr .. tostring(v) .. ';\n'
            else
                str = str.. indentStr .. keystr .. gbk.fromutf8(v) .. ';\n'
            end
        end
    end
    return str;
end


function Log:tostring(...)
    local args = {...}
    local result = ''
    for i, v in ipairs(args) do
        if type(v) == 'table' then
            result =  result .. self:table2String(v , 4)
        elseif type(v) == 'boolean' then
            result = result .. (v and 'true' or 'false')
        elseif type(v) == 'number' then
            result = result .. tostring(v)
        else
            result = result .. v
        end
    end
    return result
end

return Log