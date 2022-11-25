--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2021-04-25 06:29:11
-- 梦幻西游游戏资源破解 baidwwy@vip.qq.com(313738139) 老毕   和 C++PrimerPlus 717535046 这俩位大神破解所以资源
--======================================================================--
local 地图类 = class()
local ceil = math.ceil
local floor = math.floor
local abs = math.abs
local sort = table.sort
local tp,tps,hc
local hm = 取画面坐标
local insert = table.insert
local remove = table.remove
local pair = pairs
local fgjl = require("gge精灵类")()
local _lj = require("script/资源类/路径类")
local map = require("script/资源类/MAP")
local dtx = require("script/数据中心/特效")
local tytx = require("script/数据中心/庭院特效")
local h,l
local 飞行标准 =1
local 重新排序 = false
local function 排序(a,b)
	if a.坐标.y == b.坐标.y then
		重新排序 = true
	   	return false
	end
	return b.坐标.y > a.坐标.y
end

function 地图类:初始化(根,根1)
	tp = 根
	tps = 根1
	self.移动xy={}
	self.移动xy.x,self.移动xy.y=tp.角色坐标.x,tp.角色坐标.y
	self.飞行= false
end

function 地图类:加载(文件)
	if 文件==wdf配置.."/"..[[scene/6001.map]] then
		文件=wdf配置.."/"..[[scene/1131.map]]
	elseif 文件==wdf配置.."/"..[[scene/6002.map]] then
		文件=wdf配置.."/"..[[scene/1209.map]]
	elseif 文件==wdf配置.."/"..[[scene/6021.map]] then
		文件=wdf配置.."/"..[[scene/1204.map]]
	elseif 文件==wdf配置.."/"..[[scene/6022.map]] then
		文件=wdf配置.."/"..[[scene/1137.map]]
	elseif 文件==wdf配置.."/"..[[scene/6023.map]] then
		文件=wdf配置.."/"..[[scene/1111.map]]
	elseif 文件==wdf配置.."/"..[[scene/6024.map]] then
		文件=wdf配置.."/"..[[scene/1002.map]]
	elseif 文件==wdf配置.."/"..[[scene/6025.map]] then
		文件=wdf配置.."/"..[[scene/1001.map]]
	elseif 文件==wdf配置.."/"..[[scene/6026.map]] then
		文件=wdf配置.."/"..[[scene/1211.map]]
	end
	if hc ~= tp.当前地图 then
		hc = tp.当前地图
		self.mapzz = {}
		self.增加 = {x=0,y=0,z=0}
		self.db = {}
		self.map = map(文件)
		self.宽度,self.高度,self.行数,self.列数 = self.map.Width,self.map.Height,self.map.MapRowNum,self.map.MapColNum
		self.寻路 = _lj.创建(hc,self.列数*16,self.行数*12,self.map:取障碍())
		self.移动xy.x,self.移动xy.y=tp.角色坐标.x,tp.角色坐标.y
		self.房屋tx=nil
		if tp.当前地图 >= 1340  and tp.当前地图 <= 1342  then
			self.房屋tx={}
			local res = tonumber(string.sub(tp.当前地图,-1))
			if res == 0 then
				local ty = tp.房屋数据.庭院装饰
				if ty~=nil and #ty > 0 then
					for nw=1,#ty do
						if ty[nw]~=nil then
						    self.房屋tx[nw] = tytx(ty[nw].x,ty[nw].y,ty[nw].名称,ty[nw].方向,"庭院")
						    self.房屋tx[nw].编号 = nw
						end
					end
				end
			 else
			 	local ty = tp.房屋数据.室内装饰
			 	if ty~=nil and  #ty > 0 then
			 		for nw=1,#ty do
						if ty[nw]~=nil then
			 			    self.房屋tx[nw] = tytx(ty[nw].x,ty[nw].y,ty[nw].名称,ty[nw].方向,"室内")
			 			    self.房屋tx[nw].编号 = nw
			 			end
			 		end
			 	end
			 end
		end
		if tp.场景特效 then
		    self.传送tx = {}
			self.特效cw = 取传特效表(tp.当前地图)
			if #self.特效cw > 0 then
				for nw=1,#self.特效cw do
					if self.特效cw[nw]~=nil then
					    self.传送tx[nw] = dtx(self.特效cw[nw].x,self.特效cw[nw].y,self.特效cw[nw].切换,self.特效cw[nw].资源)
					end
				end
			end
		end
		全局临时路径=文件
	end
end

function 地图类:重新加载(文件)
	if 文件==wdf配置.."/"..[[scene/6001.map]] then
		文件=wdf配置.."/"..[[scene/1131.map]]
	elseif 文件==wdf配置.."/"..[[scene/6002.map]] then
		文件=wdf配置.."/"..[[scene/1209.map]]
	elseif 文件==wdf配置.."/"..[[scene/6021.map]] then
		文件=wdf配置.."/"..[[scene/1204.map]]
	elseif 文件==wdf配置.."/"..[[scene/6022.map]] then
		文件=wdf配置.."/"..[[scene/1137.map]]
	elseif 文件==wdf配置.."/"..[[scene/6023.map]] then
		文件=wdf配置.."/"..[[scene/1111.map]]
	elseif 文件==wdf配置.."/"..[[scene/6024.map]] then
		文件=wdf配置.."/"..[[scene/1002.map]]
	elseif 文件==wdf配置.."/"..[[scene/6025.map]] then
		文件=wdf配置.."/"..[[scene/1001.map]]
	elseif 文件==wdf配置.."/"..[[scene/6026.map]] then
		文件=wdf配置.."/"..[[scene/1211.map]]
	end
	hc = tp.当前地图
	self.mapzz = {}
	self.增加 = {x=0,y=0,z=0}
	self.db = {}
	self.map = map(文件)
	self.宽度,self.高度,self.行数,self.列数 = self.map.Width,self.map.Height,self.map.MapRowNum,self.map.MapColNum
	self.寻路 = _lj.创建(hc,self.列数*16,self.行数*12,self.map:取障碍())
	self.移动xy.x,self.移动xy.y=tp.角色坐标.x,tp.角色坐标.y
	self.房屋tx=nil
	if tp.当前地图 >= 1340  and tp.当前地图 <= 1342 then
		self.房屋tx={}
		local res = tonumber(string.sub(tp.当前地图,-1))
		if res == 0 then
			local ty = tp.房屋数据.庭院装饰
							table.print(ty)
			if #ty > 0 then
				for nw=1,#ty do
					if ty[nw]~=nil then
					    self.房屋tx[nw] = tytx(ty[nw].x,ty[nw].y,ty[nw].名称,ty[nw].方向,"庭院")
					    self.房屋tx[nw].编号 = nw
					end
				end
			end
		else
			local ty = tp.房屋数据.室内装饰
			if #ty > 0 then
				for nw=1,#ty do
					if ty[nw]~=nil then
					    self.房屋tx[nw] = tytx(ty[nw].x,ty[nw].y,ty[nw].名称,ty[nw].方向,"室内")
					    self.房屋tx[nw].编号 = nw
					end
				end
			end
		end
	end
	if tp.场景特效 then
	    self.传送tx = {}
		self.特效cw = 取传特效表(tp.当前地图)
		if #self.特效cw > 0 then
			for nw=1,#self.特效cw do
				if self.特效cw[nw]~=nil then
				    self.传送tx[nw] = dtx(self.特效cw[nw].x,self.特效cw[nw].y,self.特效cw[nw].切换,self.特效cw[nw].资源)
				end
			end
		end
	end
	全局临时路径=文件
end
function 地图类:取角色距离(x,y,距离)
 	local 距离=距离 or 1200
  	if 取两点距离a(tp.角色坐标.x,tp.角色坐标.y,x,y)<=距离 then
   		return true
  	else
   		return false
    end
end

function 地图类:房屋特效(sj)
	if tp.当前地图 >= 1340  and tp.当前地图 <= 1342 then
		local res = tonumber(string.sub(tp.当前地图,-1))
		if res == 1 then
			table.insert(tp.房屋数据.庭院装饰,sj)
			self.房屋tx[#self.房屋tx +1] = tytx(sj.x,sj.y,sj.名称,sj.方向,"庭院")
			self.房屋tx[#self.房屋tx].编号 = #self.房屋tx
			self.房屋tx[#self.房屋tx].可移动 = true
		else
			table.insert(tp.房屋数据.室内装饰,sj)
			self.房屋tx[#self.房屋tx +1] = tytx(sj.x,sj.y,sj.名称,sj.方向,"室内")
			self.房屋tx[#self.房屋tx].编号 = #self.房屋tx
			self.房屋tx[#self.房屋tx].可移动 = true
		end
	end
end

function 地图类:房屋特效2()
	if tp.当前地图 >= 1340 and tp.当前地图 <= 1342 then
		local res = tonumber(string.sub(tp.当前地图,-1))
		if res == 1 then
			local ty = tp.房屋数据.庭院装饰
			if #ty > 0 then
				for nw=1,#ty do
					if ty[nw]~=nil then
					    self.房屋tx[nw] = tytx(ty[nw].x,ty[nw].y,ty[nw].名称,ty[nw].方向,"庭院")
					    self.房屋tx[nw].编号 = nw
					end
				end
			end
		else
			local ty = tp.房屋数据.室内装饰
			if #ty > 0 then
				for nw=1,#ty do
					if ty[nw]~=nil then
					    self.房屋tx[nw] = tytx(ty[nw].x,ty[nw].y,ty[nw].名称,ty[nw].方向,"室内")
					    self.房屋tx[nw].编号 = nw
					end
				end
			end
		end
	end
end

function 地图类:飞行坐骑(开关)
	if 开关 and 飞行标准 >= 1 then
		self.飞行 = true
	elseif not 开关 and 飞行标准 <= 0.8 then
		self.飞行 = false
	end
end


function 地图类:显示(pos,偏移,xx,yy,dt,pys1)
	local mp = {}
	local 主角位置1 = ceil(pos.x/320)
	local 主角位置2 = ceil(pos.y/240)
	local 开始位置1 = 主角位置1 - 4
	local 结束位置1 = 主角位置1 + 4
	local 开始位置2 = 主角位置2 - 4
	local 结束位置2 = 主角位置2 + 4
	if self.列数==nil then
	    if 全局临时路径~=nil then
	        self:重新加载(全局临时路径)
	    end
	    return
	end
	if 结束位置1 > self.列数 then
		结束位置1 = self.列数
	end
	if 开始位置1 < 1 then
		开始位置1 = 1
		结束位置1 = 结束位置1 + 1
	end
	if 结束位置2 > self.行数 then
		结束位置2 = self.行数
	end
	if 开始位置2 < 1 then
		开始位置2 = 1
	end
	local id
	local zz
	for h = 开始位置2, 结束位置2 do
		for  l = 开始位置1, 结束位置1 do
			id = ((h-1)*self.列数+l)-1
			if self.db[id] == nil then
				self.db[id] = {{}}
				zz = self.map:取附近遮罩(id)
				for i=1,#zz do
					if self.mapzz[zz[i]] == nil then
						self.mapzz[zz[i]] = 1
						insert(self.db[id][1],{self.map:取遮罩(zz[i])})
					end  --服务端
				end
				self.db[id][2] = {(l-1)*320,(h-1)*240}
				self.db[id][3] = #self.db[id][1]
				self.map:取纹理(id)
				break
			end
		end
	end
	for i,v in pairs(self.db) do
		if self.db[i] ~= nil and self:取角色距离(self.db[i][2][1],self.db[i][2][2],2000) ==false then
			self.db[i] = nil
			self.map.缓存[i] = nil
		end
	end
	if self.飞行 and 飞行标准 > 0.8 then
		飞行标准 = 飞行标准  - 0.005
	elseif not self.飞行 and 飞行标准 < 1 then
		飞行标准 = 飞行标准  + 0.005
	end
	for h = 开始位置2, 结束位置2 do
		for  l = 开始位置1, 结束位置1 do
			id = ((h-1)*self.列数+l)-1
			if self.db[id] ~= nil then
				for i=1,#self.db[id][1] do
					insert(mp,self.db[id][1][i])
				end
				fgjl:置纹理(self.map.缓存[id])
				if 偏移 == nil or 偏移.x == nil or self.db[id][2] == nil or self.db[id][2][1] == nil or self.db[id][2][2] == nil then
					if 偏移 == nil or 偏移.x == nil then
						tp.窗口.消息框:添加文本("请截图给管理员,谢谢[ 偏移 ]地图问题","系统")
					else
						tp.窗口.消息框:添加文本("请截图给管理员,谢谢[ db ]地图问题","系统")
					end
				else
					fgjl:显示(self.db[id][2][1]+偏移.x,self.db[id][2][2]+偏移.y,飞行标准)
				end
			end
		end
	end
	if not tp.战斗中 then
		local cs
		if tp.第二场景开启 == false then
			tp.选中假人 = false
			local rw = tps.场景人物
			if tp.窗口.快捷技能栏:检查点(xx,yy) or tp.窗口.底图框:检查点(xx,yy) or tp.窗口.人物框:检查点(xx,yy) or tp.窗口.时辰:检查点(xx,yy) or tp.窗口.任务追踪栏:检查点(xx,yy)  then
				tp.禁止通行 = true
			end
			if self.房屋tx~=nil then
				sort(self.房屋tx,排序)
				for n=1,#self.房屋tx do
					if self.房屋tx[n]~=nil and self.房屋tx[n].资源是否最上面 ~= 1 then
					    self.房屋tx[n]:显示(dt,xx,yy,偏移)
					end
				end
			end
			if tps.传送~=nil and #tps.传送~=nil then
				for n=1,#tps.传送 do
					tps.传送[n]:显示(dt,xx,yy,偏移)
				end
			end
			if self.传送tx~=nil and tp.场景特效 then
				for n=1,#self.传送tx do
					if self.特效cw[n]~=nil and self.特效cw[n].资源是否最上面 ~= 1 then
					    self.传送tx[n]:显示(dt,xx,yy,偏移)
					end
				end
			end
			table.sort(rw,排序)
			for n=1,#rw do
				rw[n]:显示(dt,xx,yy,偏移)
			end
			if 重新排序 then
				table.sort(rw,排序)
				重新排序 = false
			end
		else
			--if tp.剧情处理.可视 and tp.剧情处理.显示方式 == 0 then
				if tp.第二场景.人物组 ~= nil then
				 	sort(tp.第二场景.人物组,排序)
				 	for i=1,#tp.第二场景.人物组 do
				 		local v = tp.第二场景.人物组[i]
				 		if v.出现特效 == nil then
				 			tp.影子:显示(v.坐标 + tps.屏幕坐标)
				 		end
				 		v:显示(dt,xx,yy,tps.屏幕坐标)
				 	end
				end
				if tp.场景特效==false then
				    self.传送tx=nil
				    self.特效cw=nil
				elseif self.传送tx~=nil and tp.场景特效 then
					for n=1,#self.传送tx do
						if self.特效cw[n]~=nil and self.特效cw[n].资源是否最上面 ~= 1 then
						    self.传送tx[n]:显示(dt,xx,yy,偏移)
						end
					end
				end
			--end
		end
		if not self.飞行 and 飞行标准 >=1 then
			for i=1,#mp do
				fgjl:置纹理(mp[i][1])
				fgjl:显示(mp[i][2]+偏移.x,mp[i][3]+偏移.y)
			end
		end
		if tp.第二场景.人物组 ~= nil then
			for i=1,#tp.第二场景.人物组 do
				local v = tp.第二场景.人物组[i]
				v.喊话:显示(v.坐标.x + tps.屏幕坐标.x,v.坐标.y + tps.屏幕坐标.y)
			end
		end
		if tp.场景特效==false then
			self.传送tx=nil
			self.特效cw=nil
		elseif self.传送tx~=nil and tp.场景特效 then
			for n=1,#self.传送tx do
				if self.特效cw[n]~=nil and self.特效cw[n].资源是否最上面 == 1 then
				    self.传送tx[n]:显示(dt,xx,yy,偏移)
				end
			end
		end
     -- if 取两点距离(self.移动xy,tp.角色坐标)<=50 then
     --     self.移动速度=1
     --   elseif 取两点距离(self.移动xy,tp.角色坐标)>50 and 取两点距离(self.移动xy,tp.角色坐标)<=100  then
     --     self.移动速度=3
     --   elseif 取两点距离(self.移动xy,tp.角色坐标)>100 and 取两点距离(self.移动xy,tp.角色坐标)<=150  then
     --     self.移动速度=4
     --    else
     --     self.移动速度=5
     -- 	 end
     -- 	if  静立时间<=0 then
     --    	self.移动xy=取移动坐标 (self.移动xy,tp.角色坐标,self.移动速度)
     --    end
		tps.屏幕坐标 = hm(tp.角色坐标.x,tp.角色坐标.y,self.宽度,self.高度)
	end
end
return 地图类;
