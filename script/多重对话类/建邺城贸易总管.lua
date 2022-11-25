--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2020-10-07 14:57:54
--======================================================================--
local tp = 引擎.场景
local insert = table.insert
local tostring = tostring
local number = number
local dw = require("script/属性控制/队伍")

function tp.窗口.对话栏:建邺城贸易总管(页数)
	local jc = tostring(5000)
	if 页数 ~= "我要更改角色的名字" and 页数 ~= "是的 我接受" and 页数 ~= "我钱不够呢。" then
		if #tp.队伍 < 5 then
			if tp.金钱 >= tonumber(jc) then
				if 页数 ~= "无角色" then
					local dy = dw()
					if 页数 == "飞燕女" then
						dy:置新对象(1)
						dy.名称 = "飞燕女"
						insert(tp.队伍, dy)
					elseif 页数 == "英女侠" then
						dy:置新对象(2)
						dy.名称 = "英女侠"
						insert(tp.队伍, dy)
					elseif 页数 == "巫蛮儿" then
						dy:置新对象(3)
						dy.名称 = "巫蛮儿"
						insert(tp.队伍, dy)
					elseif 页数 == "逍遥生" then
						dy:置新对象(4)
						dy.名称 = "逍遥生"
						insert(tp.队伍, dy)
					elseif 页数 == "剑侠客" then
						dy:置新对象(5)
						dy.名称 = "剑侠客"
						insert(tp.队伍, dy)
					elseif 页数 == "狐美人" then
						dy:置新对象(6)
						dy.名称 = "狐美人"
						insert(tp.队伍, dy)
					elseif 页数 == "骨精灵" then
						dy:置新对象(7)
						dy.名称 = "骨精灵"
						insert(tp.队伍, dy)
					elseif 页数 == "杀破狼" then
						dy:置新对象(8)
						dy.名称 = "杀破狼"
						insert(tp.队伍, dy)
					elseif 页数 == "巨魔王" then
						dy:置新对象(9)
						dy.名称 = "巨魔王"
						insert(tp.队伍, dy)
					elseif 页数 == "虎头怪" then
						dy:置新对象(10)
						dy.名称 = "虎头怪"
						insert(tp.队伍, dy)
					elseif 页数 == "舞天姬" then
						dy:置新对象(11)
						dy.名称 = "舞天姬"
						insert(tp.队伍, dy)
					elseif 页数 == "玄彩娥" then
						dy:置新对象(12)
						dy.名称 = "玄彩娥"
						insert(tp.队伍, dy)
					elseif 页数 == "羽灵神" then
						dy:置新对象(13)
						dy.名称 = "羽灵神"
						insert(tp.队伍, dy)
					elseif 页数 == "神天兵" then
						dy:置新对象(14)
						dy.名称 = "神天兵"
						insert(tp.队伍, dy)
					elseif 页数 == "龙太子" then
						dy:置新对象(15)
						dy.名称 = "龙太子"
						insert(tp.队伍, dy)
					elseif 页数 == "桃夭夭" then
						dy:置新对象(16)
						dy.名称 = "桃夭夭"
						insert(tp.队伍, dy)
					elseif 页数 == "偃无师" then
						dy:置新对象(17)
						dy.名称 = "偃无师"
						insert(tp.队伍, dy)
					elseif 页数 == "鬼潇潇" then
						dy:置新对象(18)
						dy.名称 = "鬼潇潇"
						insert(tp.队伍, dy)
					end
					wb = "以后我们就一起为三界奉献力量吧"
					tp.窗口.对话栏:文本(dy.模型,dy.名称,wb)
					tp.金钱 = tp.金钱 - tonumber(jc)
				else
					wb = "这个角色暂时不能招募"
					tp.窗口.对话栏:文本("男人_老财","贸易车队总管",wb)
				end
			else
				wb = "钱不够呢"
				tp.窗口.对话栏:文本("男人_老财","贸易车队总管",wb)
			end
		else
		    wb = "队伍人数太多了，无法在招募队员了"
			tp.窗口.对话栏:文本("男人_老财","贸易车队总管",wb)
		end
	else
		if 页数 == "我要更改角色的名字" then
		    tp.窗口.组合输入框:打开("改名",{"为你的角色取一个好听的名字吧",ARGB(255,255,255,0)})
		end
	end
	jc = 0
end