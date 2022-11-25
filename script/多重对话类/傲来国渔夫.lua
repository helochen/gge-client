--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2020-10-07 14:57:54
--======================================================================--
function 引擎.场景.窗口.对话栏:傲来国渔夫(页数)
	local nc = {}
	nc[1] = {"对虾","河虾","泥鳅","沙丁鱼"}
	nc[2] = {"草鱼","大黄鱼","河蟹","毛蟹","小黄鱼","鲫鱼"}
	nc[3] = {"大闸蟹","海马","海星","河豚","甲鱼","金枪鱼","鲤鱼","娃娃鱼"}
	local dh = false
	local nb = 0
	local nms = 0
	local nm = 0
	if 页数 == "随机二级鱼类" then
		for i=1,#nc[1] do
			if 物品判断(nc[1][i],10,true) then
				nb = 2
				nm = i
				dh = true
				break
			end
		end
		if dh then
			local item = nc[nb][引擎.取随机整数(1,#nc[nb])]
			增加物品(item)
			引擎.场景.窗口.对话栏:文本("男人_钓鱼","渔夫","消耗10只"..nc[1][nm].."兑换了一只"..item)
		else
			引擎.场景.窗口.对话栏:文本("男人_钓鱼","渔夫","必需要有任意10只一级鱼类才可以兑换，可是你身上没有我要的东西。")
		end
	elseif 页数 == "随机三级鱼类" then
		for i=1,#nc[2] do
			if 物品判断(nc[2][i],20,true) then
				nb = 3
				nm = i
				dh = true
				break
			end
		end
		if dh then
			local item = nc[nb][引擎.取随机整数(1,#nc[nb])]
			增加物品(item)
			引擎.场景.窗口.对话栏:文本("男人_钓鱼","渔夫","消耗20只"..nc[2][nm].."兑换了一只"..item)
		else
			引擎.场景.窗口.对话栏:文本("男人_钓鱼","渔夫","必需要有任意20只二级鱼类才可以兑换，可是你身上没有我要的东西。")
		end
	elseif 页数 == "随机属性人参果" then
		引擎.场景.窗口.对话栏:文本("男人_钓鱼","渔夫","还没有开放兑换该物品")
	elseif 页数 == "祥瑞腾蛇" then
		for i=1,#nc[3] do
			if 物品判断(nc[3][i],100,true) then
				nm = i
				dh = true
				break
			end
		end
		if dh then
			引擎.场景:获取宝宝("祥瑞腾蛇")
			引擎.场景.窗口.对话栏:文本("男人_钓鱼","渔夫","消耗100只"..nc[3][nm].."兑换了一只祥瑞腾蛇")
		else
			引擎.场景.窗口.对话栏:文本("男人_钓鱼","渔夫","必需要有任意100只三级鱼类才可以兑换，可是你身上没有我要的东西。")
		end
	end
end