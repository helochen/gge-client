
local 资源类_加载 = class()
local aaaa = require("gge纹理类")
local aaab = require("gge精灵类")
local aaac = require("Fmod类")
local bbbb = require("Script/资源类/动画类")
local yq = 引擎

function 资源类_加载:初始化()
	self.wdf = {}
	self.记录={}
end

function 资源类_加载:打开()
	self.files = {
		"addon.wdf",
		"atom.wdf",
		"hfzr.wdf",
		"smap.wdf",
		"goods.wdf",
		"shape.wdf",
		"shape.wd5",
		"shape.dll",
		"wzife.wd1",
		"wzife.wd2",
		"wzife.wd3",
		"wzife.wd4",
		"wzife.wd5",
		"wzife.wd6",
		"wzife.wdf",
		"sound.wdf",
		"sound.wd1",
		"common/lbc.wdf",
		"common/sml.wdf",
		"common/wdd.wdf",
		"common/shape.wda",
		"common/shape.wdb",
		"common/shape.wdc",
		"common/add.wdf",
		"common/ski.wdf",
		"mapani.wdf",
		"mapani.wd2",
		"misc.wdf",
		"xzsc.wdf",
		 "magic.wd11",
		 "item.wd11",
		"npk/gx.npk",
		"npk/xtb.npk",
		"npk/bj.npk",
        "XJY.wdf",
        "item.wdf",
		"other.wdf",
		"自用",
		"1",
		"5",
		"7",
		"8",
		"11",
		"12",
		"13",
        "幕神.rpk",
        "幕神2.rpk",
        "lg.rpk",
        "wpal/121.wpal",
         "hungu.wdf",

	}


	self.filesmi = {}
	self.filesmi["1"] = 7654
	self.filesmi["5"] = 6548
	self.filesmi["7"] = 6755
	self.filesmi["8"] = 4686
	self.filesmi["11"] = 6765
	self.filesmi["12"] = 6576
	self.filesmi["13"] = 4353
	self.filesmi["自用"] = 9879




	local __wdf = require("script/资源类/WDF")
	local format = string.format
	local a = wdf配置--"WDF/"
	self.id2file = {}
	for n=1,#self.files do
		-- if files[n] == "sound.wdf" or files[n] == "sound.wd1" then
		-- 	a = "./"
		-- end
		self.wdf[self.files[n]] = __wdf(format("%s/%s",a,self.files[n]),self.filesmi[self.files[n]])
		self.记录[self.files[n]]={}
	end
	__wdf = require("script/资源类/锦衣wdf")

	local fileso = {
		"shape2.npk",
		"shape1.npk",
		"幕神.rpk",
		"幕神2.rpk",
		"lg.rpk",
		"shape0.npk"


	}

	for n=1,#fileso do
		self.wdf[fileso[n]] = __wdf(format("%s/%s",a,fileso[n]))
	end
end

function 资源类_加载:取偏移(file,id)
	return self.wdf[file]:读偏移(id)
end

function 资源类_加载:读数据(file,id)
	return self.wdf[file]:读数据(id)
end
function 资源类_加载:载入(文件,类型,文件号,音量,附加,fs,fs1)
	if 文件==nil or 文件=="" then
	    return self:载入未知WDF(nil,类型,文件号)
	end
		if 文件=="WP1.dll" or 文件=="item.wdf"  or 文件=="WP1.dll"  or 文件=="item.wd1" or 文件=="item.wd2"  or 文件=="common/item.wdf"   or 文件=="图标素材"  then
			文件="1"
		elseif 文件=="jy.wdf" or 文件=="1299.wdf" or 文件=="1303.wdf" or 文件=="1344.wdf" or 文件=="1381.wdf" or 文件=="1448.wdf" or 文件=="1500.wdf" or 文件=="1604.wdf" or 文件=="1609.wdf"then
			文件="7"
		elseif 文件=="magic.wdf" or 文件=="magic.wd1" then
			文件="8"
		-- elseif  文件号== 0x0267FB16 then
		-- 	文件="uisj.wdf"
		-- 	文件号=0x014FF746
		end
	if 类型 == "网易WDF动画" then
		if (文件==nil or (文件~=nil and 文件=="")) and 文件号~=nil then
		    for i=1,#self.files do
		    	if self.wdf[self.files[i]].List[到整数(文件号)]~=nil then
		    		-- print("1自动寻找",self.files[i],string.upper(string.format("%#x",到整数(文件号))),到整数(文件号))
		    		return bbbb(self.wdf[self.files[i]]:读数据(到整数(文件号))) -- break
		    	end
		    end
		    return bbbb(self.wdf["wzife.wdf"]:读数据(0X34EA0DBE))
		end
		if 文件~=nil and 文件号==nil then
		    log:debug("0注意WDF载入[ "..文件.." ]文件 函数:",文件,类型,文件号,音量,附加,fs,fs1,素材名称)
		    return bbbb(self.wdf["wzife.wdf"]:读数据(0X34EA0DBE))
		elseif 文件==nil and 文件号~=nil then
		    log:debug("1注意WDF载入没有[ NIL值 ]文件 函数:",文件,类型,文件号,音量,附加,fs,fs1,string.upper(string.format("%#x",文件号)),素材名称)
		    for i=1,#self.files do
		    	if self.wdf[self.files[i]].List[到整数(文件号)]~=nil then
		    		-- print("自动寻找",self.files[i],string.upper(string.format("%#x",到整数(文件号))),到整数(文件号))
		    		return bbbb(self.wdf[self.files[i]]:读数据(到整数(文件号))) -- break
		    	end
		    end
		    return bbbb(self.wdf["wzife.wdf"]:读数据(0X34EA0DBE))
		elseif 文件==nil and 文件号==nil then
		    log:debug("2注意WDF载入没有[ NIL值 ]WDF文件 没有[ NIL值 ]WAS文件 函数:",文件,类型,文件号,音量,附加,fs,fs1,素材名称)
		    return bbbb(self.wdf["wzife.wdf"]:读数据(0X34EA0DBE))
		elseif 文件~=nil and 文件=="ZHS.FT" and self.wdf[文件]~=nil and self.wdf[文件]:读数据(文件号)==nil then--ZHS.FT文件修复到shape.wdf里面
			-- print(123,66666666)
		    return bbbb(self.wdf["shape.wdf"]:读数据(文件号))
		elseif 文件~=nil and self.wdf[文件]==nil then
			if 文件号==nil then 文件号=0 end
		    print("3注意WDF载入没有[ "..文件.." ]文件 函数:",文件,类型,文件号,音量,附加,fs,fs1,string.upper(string.format("%#x",文件号)),素材名称)
		    return bbbb(self.wdf["wzife.wdf"]:读数据(0X34EA0DBE))
		elseif 文件~=nil and self.wdf[文件]~=nil and 文件号~=nil and self.wdf[文件]:读数据(文件号)==nil then
		    for i=1,#self.files do
		    	if self.wdf[self.files[i]].List[到整数(文件号)]~=nil then
		    		-- print("2自动寻找",self.files[i],string.upper(string.format("%#x",到整数(文件号))),到整数(文件号))
		    		return bbbb(self.wdf[self.files[i]]:读数据(到整数(文件号))) -- break
		    	end
		    end
		    return bbbb(self.wdf["wzife.wdf"]:读数据(0X34EA0DBE))
		end
		return bbbb(self.wdf[文件 or "wzife.wdf"]:读数据(文件号 or 0X34EA0DBE))
	elseif 类型 == "图片" then
		return aaab(aaaa(文件))
	elseif 类型 == "音乐" then
		return aaac(文件,2,nil,nil,0 or 0)
	elseif 类型 == "网易WDF动画s" then
		return bbbb(文件)
	elseif 类型 == "网易锦衣动画" then
		return WAS动画类动画(self.wdf[文件]:取文件(文件号 or 0xEC4818D8))
	elseif 类型 == "网易假人动画" then
		if self.记录[文件][文件号] == nil then
	 		local 资源=bbbb(self.wdf[文件 or "wzife.wdf"]:读数据(文件号 or 0xFF997CF6))
			self.记录[文件][文件号] = DeepCopy(资源.was)
			return 资源
		else
		    return bbbb(nil,nil,DeepCopy(self.记录[文件][文件号]),2)
		end
	end
end

function DeepCopy(object)
    local lookup_table = {}
    local function _copy(object)
        if type(object) ~= "table" then
            return object
        elseif lookup_table[object] then
            return lookup_table[object]
        end
        local new_table = {}
        lookup_table[object] = new_table
        for key, value in pairs(object) do
            new_table[_copy(key)] = _copy(value)
        end
        return setmetatable(new_table, getmetatable(object))
    end
    return _copy(object)
end


function 资源类_加载:载入未知WDF(file1,类型,id) -- String 例如 0x00FF 非法, 改为 0xFF 正确   资源:载入未知WDF(nil,"网易WDF动画","0xBECEA063")
	if id and tonumber(id) > 0 and file1 == nil then
		for i,o in pairs(self.files)  do
			if 读配置(wdf配置.."/ini/"..o..".ini","Resource",id)=="1" then
				local file = o
				if not self.wdf[file] then
					self:打开(file)
				end
				self.id2file[id] = file
				return self:载入(file,类型,到整数(id))
			end
		end
	end
	return self:载入("wzife.wdf",类型,0xFCD58523)
end

return 资源类_加载