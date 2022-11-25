function 场景取名称(地图ID)---  +40
	local 传送名称 = {}
	if 地图ID == 1003 then--桃源村
		传送名称[1] = {x=13,y=128,名称="0一9级",等级字体=true,是否红字体=false}
		return 传送名称
	elseif 地图ID == 1126 then--东海岩洞
		传送名称[1] = {x=5,y=103,名称="0一9级",等级字体=true,是否红字体=false}
		传送名称[2] = {x=185,y=35,名称="女魃墓",等级字体=false,是否红字体=true}
		return 传送名称
	elseif 地图ID == 1508 then--沉船
		传送名称[1] = {x=26,y=10,名称="2一12级",等级字体=true,是否红字体=false}
		传送名称[2] = {x=150,y=160,名称="沉船内室",等级字体=false,是否红字体=false}
		return 传送名称
	elseif 地图ID == 1506 then--东海湾
		传送名称[1] = {x=100,y=102,名称="2一12级",等级字体=true,是否红字体=false}
		传送名称[2] = {x=100,y=120,名称="2一12级",等级字体=true,是否红字体=false}
		return 传送名称
	elseif 地图ID == 1501 then--建邺城
		传送名称[1] = {x=27,y=119,名称="6一16级",等级字体=true,是否红字体=false}
		传送名称[2] = {x=252,y=120,名称="0一9级",等级字体=true,是否红字体=false}
		传送名称[3] = {x=206,y=-4,名称="0一9级",等级字体=true,是否红字体=false}
		return 传送名称
	elseif 地图ID == 1193 then--江南野外
		传送名称[1] = {x=104,y=9,名称="南岭山",等级字体=false,是否红字体=false}
		return 传送名称
	elseif 地图ID == 1876 then--南岭山
		传送名称[1] = {x=180,y=100,名称="江南野外",等级字体=false,是否红字体=false}
		传送名称[2] = {x=1,y=135,名称="四方城",等级字体=false,是否红字体=false}
		return 传送名称
	elseif 地图ID == 16050 then--天鸣洞天
		传送名称[1] = {x=1,y=130,名称="潮音洞",等级字体=false,是否红字体=false}
		return 传送名称
	elseif 地图ID == 1135 then--方寸山
		传送名称[1] = {x=122,y=120,名称="观星台",等级字体=false,是否红字体=false}
		return 传送名称
	elseif 地图ID == 1237	 then--四方城
		传送名称[1] = {x=250,y=10,名称="南岭山",等级字体=false,是否红字体=false}
		return 传送名称
	elseif 地图ID == 1208	 then--朱紫国
		传送名称[1] = {x=76,y=105,名称="仙源洞天",等级字体=false,是否红字体=false}
		return 传送名称
	elseif 地图ID == 1514	 then--朱紫国
		传送名称[1] = {x=132,y=114,名称="幻境花果山",等级字体=false,是否红字体=true}
		return 传送名称
	elseif 地图ID == 1110	 then--朱紫国
		传送名称[1] = {x=71,y=6,名称="赤水洲",等级字体=false,是否红字体=false}
		return 传送名称
	elseif 地图ID == 1173	 then--朱紫国
		传送名称[1] = {x=71,y=46,名称="天机城",等级字体=false,是否红字体=true}
		return 传送名称

	--=================
	end
	return false
end

return 数据库