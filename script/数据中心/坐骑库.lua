--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2021-03-28 03:38:28
--======================================================================--
function 引擎.补差(zq,角色)  --y  负数向上  正数向下
	local zqs={}
	zqs.x,zqs.y=0,0
	if zq=="汗血宝马" and (角色=="桃夭夭" or 角色=="神天兵" ) then
		zqs.x,zqs.y=0,0
	    return zqs.x,zqs.y
	elseif zq=="魔骨战熊" or zq=="月影天马" then
		zqs.x,zqs.y=3,-12
	    return zqs.x,zqs.y
	elseif zq=="九尾神狐" then
		zqs.x,zqs.y=5,0
	    return zqs.x,zqs.y
	elseif zq=="暗影战豹" then
		zqs.x,zqs.y=0,-12
	    return zqs.x,zqs.y
	elseif zq == "金鳞仙子" then
	    zqs.x,zqs.y=50,0
	    return zqs.x,zqs.y
	elseif zq == "流云玉佩" or zq == "山河画卷" or zq == "凌霄飞剑" then
	    zqs.x,zqs.y=0,-70
	    return zqs.x,zqs.y
	elseif zq == "齐天小轿" then
	    zqs.x,zqs.y=0,-55
	    return zqs.x,zqs.y
	elseif zq == "落英纷飞" then
	    zqs.x,zqs.y=0,-40
	    return zqs.x,zqs.y
	elseif zq == "风火飞轮" then
	    zqs.x,zqs.y=0,-65
	    return zqs.x,zqs.y
	elseif zq == "凤舞灵蝶" then
	    zqs.x,zqs.y=0,-63
	    return zqs.x,zqs.y
	elseif zq == "七彩祥云" or zq == "瑞彩祥云" then
	    zqs.x,zqs.y=0,-27
	    return zqs.x,zqs.y
	end
	return zqs.x,zqs.y
end

function 引擎.坐骑库(id,zq,sp)
	if zq==nil then
	    return
	end

	local zqs = {
		宝贝葫芦 = {0x63C1AA04,0x939B6AA2,1,"shape.wd5"},
		神气小龟 = {0xE88353,0x702610D3,2,"shape.wd5"},
		汗血宝马 = {0x7B49FA9A,0x3F76F5B2,3,"shape.wd5"},
		欢喜羊羊 = {0x8D4DBAAE,0x2636063C,4,"shape.wd5"},
		魔力斗兽 = {0x4B0E16F1,0x28F7499E,3,"shape.wd5"},
		披甲战狼 = {0x3B0CC9,0xF6B76F79,4,"shape.wd5"},
		闲云野鹤 = {0x49CAB729,0x1544FBAD,3,"shape.wd5"},
		云魅仙鹿 = {0x621ECF47,0x98D7DB2,4,"shape.wd5"},
		七彩神驴 = {0x03633E07,0x01040DCE,3,"shape.wd5"},
		银色穷奇 = {0x0536E9A0,0x023E3D97,3,"shape.wd5"},
		天使猪猪 = {0x02549905,0x055833D5,3,"shape.wd5"},
		九尾神狐 = {0x03C81881,0x03E53AEF,2,"shape.wd5"},
		金鳞仙子 = {0x05B30629,0x065C9E28,3,"shape.wd5"},
		踏雪灵熊 = {0x0773EB94,0x23C8E5DE,3,"shape.wd5"},
		九霄冰凤 = {0x08DB9888,0x0C2671A9,3,"shape.wd5"},
		战火穷奇 = {0x0A5927A8,0x0BDDE762,3,"shape.wd5"},
		玄冰灵虎 = {0x0A648F68,0x0A8F525E,3,"shape.wd5"},
		御风灵貂 = {0x5BCF5B7B,0x0A6E3345,3,"shape.wd5"},
		青霄天麟 = {0x0BBA930C,0xF5B6264C,3,"shape.wd5"},
		琉璃宝象 = {0xC01D7558,0x343087B3,3,"shape.wd5"},
		莽林猛犸 = {0xBE8BCD59,0x1EE017FE,3,"shape.wd5"},
		暗影战豹 = {0x2283C8E4,0x256B2E02,4,"shape.wd5"},
		鹤雪锦犀 = {0x2C490405,0x61F5973D,3,"shape.wd5"},
		猪猪小侠 = {0x2D5B61B8,0x366A7D69,3,"shape.wd5"},
		飞天猪猪 = {0x2D7948EF,0xD9195AA8,3,"shape.wd5"},
		沉星寒犀 = {0x43E7BE1F,0x77C1746C,3,"shape.wd5"},
		妙缘暖犀 = {0x52282FC2,0x843816AD,3,"shape.wd5"},
		玄火神驹 = {0x5504B0BE,0xE8DD3341,3,"shape.wd5"},
		怒雷狂狮 = {0xEC31AF3B,0x55E4FB5C,3,"shape.wd5"},
		月影天马 = {0xC9086441,0x76C33E92,3,"shape.wd5"},
		魔骨战熊 = {0xBB49CBB2,0x8247EBC3,3,"shape.wd5"},
		轻云羊驼 = {0x9BDE4F15,0xC5C3525E,3,"shape.wd5"},
		粉红小驴 = {0xC7655C83,0xAD4889BD,3,"shape.wd5"},
		粉红小驴 = {0xC7655C83,0xAD4889BD,3,"shape.wd5"},
		独角兽 = {0xFF100011,0xFF100010,5,"jy.wdf"},
		独角兽1 = {0x30303016,0x30303017,6,"jy.wdf"},
		海豚恋人 = {0x00300100,0x00300101,5,"jy.wdf"},
		冰晶魅灵 = {0x00300601,0x00300602,6,"wzife.wd5"},
		炫影天马 = {0x02010225,0x02010226,5,"wzife.wd5"},
		玲珑雪狐 = {0x01000078,0x01000077,7,"wzife.wd5"},
		玲珑雪狐女 = {0x01000080,0x01000079,5,"wzife.wd5"},
		烈焰雄狮 = {0x01000083,0x01000082,5,"wzife.wd5"},
		九尾神狐1 = {0x01000084,0x01000085,8,"wzife.wd5"},
		青梅竹马 = {0xFC060E32,0x69CC2D84,6,"xzsc.wdf"},
		独角马 = {0xBC647367,0xDD195E16,6,"xzsc.wdf"},
		深海狂鲨 = {0xEF30F5E4,0xD4001A88,6,"xzsc.wdf"},
		冰晶雪魄 = {0xE3EFB84D,0x0C15DCDE,6,"xzsc.wdf"},
		霜雪龙宝 = {0xEFACD8B5,0xA97E7654,6,"xzsc.wdf"},
		呆萌鸭鸭 = {0x00000263,0x00000264,6,"xzsc.wdf"},
		寒梅纨扇 = {0x00000227,0x00000228,6,"xzsc.wdf"},
		年兽 = {0x00000191,0x00000192,6,"xzsc.wdf"},
		北冥巨鲸 = {0x00000155,0x00000156,6,"xzsc.wdf"},
		赤焰战狼 = {0x00000109,0x00000110,6,"xzsc.wdf"},
		玲珑雪狐 = {0x00000073,0x00000074,6,"xzsc.wdf"},
		馋嘴刺猬 = {0x10000001,0x10000002,6,"xzsc.wdf"},
		幻·帝江 = {0x60000048,0x60000047,8,"xzsc.wdf"},
		幻·帝江·月白 = {0x50000012,0x50000011,8,"xzsc.wdf"},--静立---行走
		山河画卷 = {0x0FF3F9E2,0x2D6915E1,8,"xzsc.wdf"},
		凌霄飞剑 = {0x4931C9EC,0xEEB83B53,8,"xzsc.wdf"},
		瑞彩祥云 = {0x089A78C7,0x43FB6660,8,"xzsc.wdf"},
		风火飞轮 = {0x3815C169,0x3815C169,8,"xzsc.wdf"},
		落英纷飞 = {0x32BE003F,0x32BE003F,8,"xzsc.wdf"},
		凤舞灵蝶 = {0x6D33C1DB,0xF809B4D1,8,"xzsc.wdf"},
		七彩祥云 = {0xD4CED8F7,0x4391944D,8,"xzsc.wdf"},
		齐天小轿 = {0x6ED61C4C,0xD81F56A7,8,"xzsc.wdf"},
		流云玉佩 = {0xF92EAB94,0x40DBF469,8,"xzsc.wdf"},
		恶魔蝙蝠 = {0x30000103,0x30000104,7,"zq.wdf"},
		幽冥白虎 = {0x30000175,0x30000176,7,"zq.wdf"},
		月影豹   = {0x30303012,0x30303013,7,"zq.wdf"},
		万年异兽 = {0x30303021,0x30303020,7,"zq.wdf"},
	}
	local sps = {
		展翅高飞 = {0x2DC16EF4,0x47A59E6C,"shape.wd5"},
		旗开得胜 = {0x4FB7A645,0xC89B8D7B,"shape.wd5"},
		霸王雄风 = {0x8AC5514E,0xD30116BE,"shape.wd5"},
		独眼观天 = {0xCB41BF07,0x6D415352,"shape.wd5"},
		威武不屈 = {0xE385373B,0x71FE0155,"shape.wd5"},
		深藏不露 = {0x2529E5A5,0x51C03CD4,"shape.wd5"},
		异域浓情 = {0xE8B35E96,0x3949C769,"shape.wd5"},
		流星天马 = {0x72489CFD,0x4D136355,"shape.wd5"},
		威猛将军 = {0x5BDBA7CB,0x5CDC5A5E,"shape.wd5"},
		知情达理 = {0xCCBF24B8,0xFE4B37F2,"shape.wd5"},
		气宇轩昂 = {0xEC4C09DF,0x57B096DF,"shape.wd5"},
		如花似玉 = {0xA6966FD2,0xCA8864D1,"shape.wd5"},
		傲视天下 = {0xBB906984,0x2549904, "shape.wd5"},
		铁血豪情 = {0x742FBF19,0x103FFB93,"shape.wd5"},
		唯我独尊 = {0x7F6FFC35,0x716B5DC1,"shape.wd5"},
		异域风情 = {0x1FED0CD8,0xD8EB6880,"shape.wd5"},
		叱咤风云 = {0xAB007164,0x2E177381,"shape.wd5"},
		假面勇者 = {0xE7CB8205,0xE615404,"shape.wd5"},
		霓裳魅影 = {0xE0CB07C8,0xD9D958E6,"shape.wd5"},
		披星戴月 = {0x8ED6D8CC,0xC5D8F53D,"shape.wd5"},
		烈焰燃情 = {0x8C575D26,0x7B15590A,"shape.wd5"},
		天雨流芳 = {0x503F394B,0x23BF657B,"shape.wd5"},
		灵光再现 = {0xC4D118C5,0xCBC6930A,"shape.wd5"},
		倾国倾城 = {0x1F01B8BE,0xBDA4DDAB,"shape.wd5"},
		空 = {}
	}
	local scs
	if id == "飞燕女" then
		scs = {{0x4492502E,0xF6D6D5E6,"shape.wd5"},{0xDCB946EC,0xDCC84D4E,"shape.wd5"},{0xDF01F29D,0xA77B55E4,"shape.wd5"},{0x6E0AD379,0x87C7A650,"shape.wd5"}}
	elseif id == "英女侠" then
		scs = {{0xD43912A9,0xD2D4CAD3,"shape.wd5"},{0x70291C50,0x30CABF19,"shape.wd5"},{0x726C392E,0x68FB1969,"shape.wd5"},{0x2474769B,0xACD868DE,"shape.wd5"}}
	elseif id == "巫蛮儿" then
		scs = {{0xF2BC9369,0xB11F6642,"shape.wdf"},{0x9B73C75F,0xDA0A8B06,"shape.wdf"},{0x2F5EAD3F,0x499F9D37,"shape.wdf"},{0xCCC0985C,0xC8F56BA3,"shape.wdf"}}
	elseif id == "偃无师" then
		scs = {{0x00000110,0x00000111,"common/shape.wda"},{0x00000110,0x00000111,"common/shape.wda"},{0x00000110,0x00000111,"common/shape.wda"},{0x00000110,0x00000111,"common/shape.wda"}}
	elseif id == "逍遥生" then
		scs = {{0xA35491C9,0x49D7C76E,"shape.wd5"},{0xB770EAD4,0x9A1479D8,"shape.wd5"},{0x76D629EA,0xFB50C58F,"shape.wd5"},{0x3D392EF4,0xA5E02A65,"shape.wd5"},{0x02010225,0x02010226,"wzife.wd5"},}
	elseif id == "剑侠客" then
		scs = {{0x67101CB7,0x9C8790BA,"shape.wd5"},{0x32DA9583,0xEC9AC961,"shape.wd5"},{0x766731D,0x8C50358A,"shape.wd5"},{0xA95A126D,0x513DDE6C,"shape.wd5"},{0xFF100011,0xFF100010,"jy.wdf"},{0x30303016,0x30303017,"jy.wdf"},{0x01000078,0x01000077,"wzife.wd5"},{0x01000084,0x01000085,"wzife.wd5"}}
	elseif id == "狐美人" then
		scs = {{0xE3123BDA,0x956305B5,"shape.wd5"},{0xFB798485,0xD1997415,"shape.wd5"},{0x64C21A63,0xD5D2FA14,"shape.wd5"},{0xBCD86DDA,0xF0062006,"shape.wd5"}}
	elseif id == "骨精灵" then
		scs = {{0xBEEF3795,0x3C6BF98F,"shape.wd5"},{0xE2C1CDE4,0xBAD0F711,"shape.wd5"},{0x75B09FA1,0x5E5736EE,"shape.wd5"},{0x83DD50D3,0xB84C7C38,"shape.wd5"}}
	elseif id == "鬼潇潇" then
		scs = {{0x00000118,0x00000119,"common/shape.wdc"},{0x00000118,0x00000119,"common/shape.wdc"},{0x00000118,0x00000119,"common/shape.wdc"},{0x00000118,0x00000119,"common/shape.wdc"}}
	elseif id == "杀破狼" then
		scs = {{0xE137A55D,0xDB553291,"shape.wdf"},{0x8BEA762D,0x14EE7109,"shape.wdf"},{0x46A79E5,0x3CD5444,"shape.wdf"},{0xF974CEB,0x54A8F096,"shape.wdf"}}
	elseif id == "巨魔王" then
		scs = {{0x21ED721D,0x5A05E1C0,"shape.wd5"},{0x9DFEB143,0x77C20678,"shape.wd5"},{0x1AF61311,0x6E370D46,"shape.wd5"},{0xCC1426ED,0x39FE09DB,"shape.wd5"}}
	elseif id == "虎头怪" then
		scs = {{0x99AD84CD,0x9FA6D533,"shape.wd5"},{0xF56603D1,0x83DBBA94,"shape.wd5"},{0x37FFB9DF,0x64426F93,"shape.wd5"},{0x95BC0425,0xC6053278,"shape.wd5"},{0x01000083,0x01000082,"wzife.wd5"}}
	elseif id == "舞天姬" then
		scs = {{0x54DB4F4D,0xCB722714,"shape.wd5"},{0xD92FC3DE,0x809F42FE,"shape.wd5"},{0x212848A1,0xAAD7CB93,"shape.wd5"},{0xB44DF735,0xECA5DB49,"shape.wd5"},{0x01000080,0x01000079,"wzife.wd5"}}
	elseif id == "玄彩娥" then
		scs = {{0x861EE4D9,0x9F2F9C11,"shape.wd5"},{0x3316877C,0x31F77503,"shape.wd5"},{0x779A3DF,0x622664DC,"shape.wd5"},{0xA6FD7850,0xB9FD9DBD,"shape.wd5"}}
	elseif id == "桃夭夭" then
		scs = {{0x00000109,0x00000110,"common/shape.wdb"},{0x00000109,0x00000110,"common/shape.wdb"},{0x00000109,0x00000110,"common/shape.wdb"},{0x00000109,0x00000110,"common/shape.wdb"}}
	elseif id == "羽灵神" then
		scs = {{0x7D31F43E,0x76E4E3D6,"shape.wdf"},{0x7B86A5F4,0xE496A2D7,"shape.wdf"},{0x8072202A,0x6528F013,"shape.wdf"},{0x4BBD02E6,0x694A236B,"shape.wdf"}}
	elseif id == "神天兵" then
		scs = {{0x77104303,0xBC38000F,"shape.wd5"},{0xF4EF98B5,0x7C731501,"shape.wd5"},{0x7F6D09AB,0x13AD1C23,"shape.wd5"},{0x60A47C21,0x63930A54,"shape.wd5"}}
	elseif id == "龙太子" then
		scs = {{0x4F27A59F,0x801F438D,"shape.wd5"},{0x46F4FDF6,0xC9EF2751,"shape.wd5"},{0x5B0EDDAD,0xB227D39F,"shape.wd5"},{0x643F7DDE,0xCC8E0921,"shape.wd5"},{0x00300100,0x00300101,"jy.wdf"},{0x00300601,0x00300602,"wzife.wd5"}}
	elseif id == "鬼潇潇" then
		scs = {{0x00000118,0x00000119,"common/shape.wdc"},{0,0,"common/shape.wdc"},{0,0,"common/shape.wdc"},{0,0,"common/shape.wdc"}}
	elseif id == "桃夭夭" then
		scs = {{0x00000109,0x00000110,"common/shape.wdb"},{0,0,"common/shape.wdb"},{0,0,"common/shape.wdb"},{0,0,"common/shape.wdb"}}
	elseif id == "偃无师" then
		scs = {{0x00000110,0x00000111,"common/shape.wda"},{0,0,"common/shape.wda"},{0,0,"common/shape.wda"},{0,0,"common/shape.wda"}}
	end
	if zq==nil then
		tp.窗口.消息框:添加文本("坐骑zp1为空"..zq,"xt")
	elseif  zq~=nil and zqs[zq]==nil then
		tp.窗口.消息框:添加文本("坐骑zp2为空"..zq,"xt")
	elseif  zq~=nil and zqs[zq]~=nil and zqs[zq][3]==nil then
		tp.窗口.消息框:添加文本("坐骑zp3为空"..zq,"xt")
	end
	if zqs[zq]==nil then
		return
	end
	local bh = zqs[zq][3]
	if scs[bh]==nil then
	   bh = 3
	end
	return {坐骑资源=zqs[zq][4],坐骑站立=zqs[zq][1],坐骑行走=zqs[zq][2],人物资源=scs[bh][3],人物站立=scs[bh][1],人物行走=scs[bh][2],坐骑饰品站立=sps[sp][1],坐骑饰品行走=sps[sp][2],坐骑饰品资源=sps[sp][3]}
end

function 引擎.新增坐骑(人物,坐骑,动作)

	local 名称 = 人物.."_"..坐骑.."_"..动作
	if 名称 == "剑侠客_独角马_奔跑"	 then
		return 0xDD195E16
	elseif 名称 == "剑侠客_独角马_站立"	 then
		return 0xBC647367
	elseif 名称 == "剑侠客_深海狂鲨_站立"	 then
		return 0xEF30F5E4
	elseif 名称 == "剑侠客_深海狂鲨_奔跑"	 then
		return 0xD4001A88
	elseif 名称 == "剑侠客_青梅竹马_站立"	 then
		return 0xFC060E32
	elseif 名称 == "剑侠客_青梅竹马_奔跑"	 then
		return 0x69CC2D84
	elseif 名称 == "剑侠客_冰晶魅灵_站立"	 then
		return 0xCE5F651C
	elseif 名称 == "剑侠客_冰晶魅灵_奔跑"	 then
		return 0x7F1049D7
	elseif 名称 == "剑侠客_冰晶雪魄_站立"	 then
		return 0xE3EFB84D
	elseif 名称 == "剑侠客_冰晶雪魄_奔跑"	 then
		return 0x0C15DCDE
	elseif 名称 == "剑侠客_霜雪龙宝_站立"	 then
		return 0xEFACD8B5
	elseif 名称 == "剑侠客_霜雪龙宝_奔跑"	 then
		return 0xA97E7654
	elseif 名称 == "剑侠客_飞天龙马_站立"	 then
		return 0xB77C05F8
	elseif 名称 == "剑侠客_飞天龙马_奔跑"	 then
		return 0x7336C5AB

	-----飞燕女

	elseif 名称 == "飞燕女_独角马_站立"	 then
		return 0xE14EA35A
	elseif 名称 == "飞燕女_独角马_奔跑"	 then
		return 0x10ACEF55

	elseif 名称 == "飞燕女_青梅竹马_站立"	 then
		return 0x048FAED8
	elseif 名称 == "飞燕女_青梅竹马_奔跑"	 then
		return 0x0EA3F791

	elseif 名称 == "飞燕女_深海狂鲨_站立"	 then
		return 0xEA547557
	elseif 名称 == "飞燕女_深海狂鲨_奔跑"	 then
		return 0x6D603700

	elseif 名称 == "飞燕女_霜雪龙宝_站立"	 then
		return 0xB3C53F3A
	elseif 名称 == "飞燕女_霜雪龙宝_奔跑"	 then
		return 0xA0F59CD4

	elseif 名称 == "飞燕女_冰晶雪魄_站立"	 then
		return 0x8479C234
	elseif 名称 == "飞燕女_冰晶雪魄_奔跑"	 then
		return 0x25936E8E

	elseif 名称 == "飞燕女_冰晶魅灵_站立"	 then
		return 0x484F7A84
	elseif 名称 == "飞燕女_冰晶魅灵_奔跑"	 then
		return 0x9C7E2DE5

	elseif 名称 == "飞燕女_飞天龙马_站立"	 then
		return 0xBA96E2CF
	elseif 名称 == "飞燕女_飞天龙马_奔跑"	 then
		return 0xC93D6B43


	-----------骨精灵

	elseif 名称 == "骨精灵_独角马_站立"  	 then
		return 0xECF29BBB
	elseif 名称 == "骨精灵_独角马_奔跑"  	 then
		return 0x03DCA686

	elseif 名称 == "骨精灵_青梅竹马_站立"	 then
		return 0xDB94B112
	elseif 名称 == "骨精灵_青梅竹马_奔跑"	 then
		return 0xD0522308

	elseif 名称 == "骨精灵_深海狂鲨_站立"	 then
		return 0x7710A334
	elseif 名称 == "骨精灵_深海狂鲨_奔跑"	 then
		return 0xA3274661

	elseif 名称 == "骨精灵_霜雪龙宝_站立"	 then
		return 0xD9438601
	elseif 名称 == "骨精灵_霜雪龙宝_奔跑"	 then
		return 0x40DC127D

	elseif 名称 == "骨精灵_冰晶雪魄_站立"	 then
		return 0x6CB98F54
	elseif 名称 == "骨精灵_冰晶雪魄_奔跑"	 then
		return 0xF197C6A3

	elseif 名称 == "骨精灵_冰晶魅灵_站立"	 then
		return 0xA52D57A2
	elseif 名称 == "骨精灵_冰晶魅灵_奔跑"	 then
		return 0x2224131A

	elseif 名称 == "骨精灵_飞天龙马_站立"	 then
		return 0x2D613E27
	elseif 名称 == "骨精灵_飞天龙马_奔跑"	 then
		return 0x7C6C1872

	---------------   英女侠

	elseif 名称 == "英女侠_独角马_站立"	 then
		return 0x8D1C9B16
	elseif 名称 == "英女侠_独角马_奔跑"	 then
		return 0xBD83A424

	elseif 名称 == "英女侠_青梅竹马_站立"	 then
		return 0x03A9C116
	elseif 名称 == "英女侠_青梅竹马_奔跑"	 then
		return 0xED3C864C

	elseif 名称 == "英女侠_深海狂鲨_站立"	 then
		return 0xCFA88113
	elseif 名称 == "英女侠_深海狂鲨_奔跑"	 then
		return 0xAC91B75A

	elseif 名称 == "英女侠_霜雪龙宝_站立"	 then
		return 0x41E52168
	elseif 名称 == "英女侠_霜雪龙宝_奔跑"	 then
		return 0x53B3F1E0

	elseif 名称 == "英女侠_冰晶雪魄_站立"	 then
		return 0x1476C1E4
	elseif 名称 == "英女侠_冰晶雪魄_奔跑"	 then
		return 0x3BEC7A28

	elseif 名称 == "英女侠_冰晶魅灵_站立"	 then
		return 0xF8696164
	elseif 名称 == "英女侠_冰晶魅灵_奔跑"	 then
		return 0xD6B0B056

	elseif 名称 == "英女侠_飞天龙马_站立"	 then
		return 0xD40C60C5
	elseif 名称 == "英女侠_飞天龙马_奔跑"	 then
		return 0x9B4C9F9C

	---------------狐美人

	elseif 名称 == "狐美人_独角马_奔跑"	 then
		return 0x8A122388
	elseif 名称 == "狐美人_独角马_站立"	 then
		return 0x2D8A3513
	elseif 名称 == "狐美人_青梅竹马_站立"	 then
		return 0xEC48F0DC
	elseif 名称 == "狐美人_青梅竹马_奔跑"	 then
		return 0x0917AA70
	elseif 名称 == "狐美人_深海狂鲨_站立"	 then
		return 0x43D43BC3
	elseif 名称 == "狐美人_深海狂鲨_奔跑"	 then
		return 0xE5B707B3
	elseif 名称 == "狐美人_霜雪龙宝_站立"	 then
		return 0xCD5A958F
	elseif 名称 == "狐美人_霜雪龙宝_奔跑"	 then
		return 0x59166107
	elseif 名称 == "狐美人_冰晶雪魄_站立"	 then
		return 0x16B2E033
	elseif 名称 == "狐美人_冰晶雪魄_奔跑"	 then
		return 0xC155D8B3
	elseif 名称 == "狐美人_冰晶魅灵_站立"	 then
		return 0xBB82C17C
	elseif 名称 == "狐美人_冰晶魅灵_奔跑"	 then
		return 0xA466DED1
	elseif 名称 == "狐美人_飞天龙马_站立"	 then
		return 0x1E3B47E4
	elseif 名称 == "狐美人_飞天龙马_奔跑"	 then
		return 0xCE322B80

	-------------------虎头怪

	elseif 名称 == "虎头怪_独角马_奔跑"	 then
		return 0x1133B493
	elseif 名称 == "虎头怪_独角马_站立"	 then
		return 0xAE1FE52C
	elseif 名称 == "虎头怪_青梅竹马_站立"	 then
		return 0x0E745545
	elseif 名称 == "虎头怪_青梅竹马_奔跑"	 then
		return 0x749A8DE7
	elseif 名称 == "虎头怪_深海狂鲨_站立"	 then
		return 0x5D3976CB
	elseif 名称 == "虎头怪_深海狂鲨_奔跑"	 then
		return 0x3CD5A1C1
	elseif 名称 == "虎头怪_霜雪龙宝_站立"	 then
		return 0x9561FCA8
	elseif 名称 == "虎头怪_霜雪龙宝_奔跑"	 then
		return 0x162A74B1
	elseif 名称 == "虎头怪_冰晶雪魄_站立"	 then
		return 0xE2A1D30F
	elseif 名称 == "虎头怪_冰晶雪魄_奔跑"	 then
		return 0x47810AE4
	elseif 名称 == "虎头怪_冰晶魅灵_站立"	 then
		return 0xECE6D460
	elseif 名称 == "虎头怪_冰晶魅灵_奔跑"	 then
		return 0x822EDE52
	elseif 名称 == "虎头怪_飞天龙马_站立"	 then
		return 0x71746931
	elseif 名称 == "虎头怪_飞天龙马_奔跑"	 then
		return 0xFFC56CAC

	-----------------------巨魔王

	elseif 名称 == "巨魔王_独角马_站立"	 then
		return 0x57B2FF33
	elseif 名称 == "巨魔王_独角马_奔跑"	 then
		return 0x534E2BC7
	elseif 名称 == "巨魔王_深海狂鲨_站立"	 then
		return 0x36FEC0EE
	elseif 名称 == "巨魔王_深海狂鲨_奔跑"	 then
		return 0xEEA4726F
	elseif 名称 == "巨魔王_青梅竹马_站立"	 then
		return 0x43853A2F
	elseif 名称 == "巨魔王_青梅竹马_奔跑"	 then
		return 0x958ACF12
	elseif 名称 == "巨魔王_冰晶魅灵_站立"	 then
		return 0x64D8CADE
	elseif 名称 == "巨魔王_冰晶魅灵_奔跑"	 then
		return 0xC9368BE9
	elseif 名称 == "巨魔王_冰晶雪魄_站立"	 then
		return 0xA75F8D0D
	elseif 名称 == "巨魔王_冰晶雪魄_奔跑"	 then
		return 0xCC5DD99C
	elseif 名称 == "巨魔王_霜雪龙宝_站立"	 then
		return 0x2F988214
	elseif 名称 == "巨魔王_霜雪龙宝_奔跑"	 then
		return 0xC59023F1
	elseif 名称 == "巨魔王_飞天龙马_站立"	 then
		return 0x6963D165
	elseif 名称 == "巨魔王_飞天龙马_奔跑"	 then
		return 0x7CF14A8C


	------------------龙太子

	elseif 名称 == "龙太子_独角马_奔跑"	 then
		return 0x966FD5CD
	elseif 名称 == "龙太子_独角马_站立"	 then
		return 0x6D8CBB1A
	elseif 名称 == "龙太子_深海狂鲨_站立"	 then
		return 0xB590C8E6
	elseif 名称 == "龙太子_深海狂鲨_奔跑"	 then
		return 0x3611E764
	elseif 名称 == "龙太子_青梅竹马_站立"	 then
		return 0xE873EBDA
	elseif 名称 == "龙太子_青梅竹马_奔跑"	 then
		return 0x2B479E5D
	elseif 名称 == "龙太子_冰晶魅灵_站立"	 then
		return 0x021B9BBE
	elseif 名称 == "龙太子_冰晶魅灵_奔跑"	 then
		return 0x31FC79B2
	elseif 名称 == "龙太子_冰晶雪魄_站立"	 then
		return 0xEF3E35B6
	elseif 名称 == "龙太子_冰晶雪魄_奔跑"	 then
		return 0xD4582E5C
	elseif 名称 == "龙太子_霜雪龙宝_站立"	 then
		return 0x38D9122F
	elseif 名称 == "龙太子_霜雪龙宝_奔跑"	 then
		return 0x291F1300
	elseif 名称 == "龙太子_飞天龙马_站立"	 then
		return 0x6FC9A4F8
	elseif 名称 == "龙太子_飞天龙马_奔跑"	 then
		return 0x8E5DC844

	-------------------神天兵

	elseif 名称 == "神天兵_独角马_站立"	 then
		return 0x7E810230
	elseif 名称 == "神天兵_独角马_奔跑"	 then
		return 0xC6495528
	elseif 名称 == "神天兵_深海狂鲨_站立"	 then
		return 0x4D8E639F
	elseif 名称 == "神天兵_深海狂鲨_奔跑"	 then
		return 0x373D5C17
	elseif 名称 == "神天兵_青梅竹马_站立"	 then
		return 0xE71A42E5
	elseif 名称 == "神天兵_青梅竹马_奔跑"	 then
		return 0xDD6A29AE
	elseif 名称 == "神天兵_冰晶魅灵_站立"	 then
		return 0xEEF34E15
	elseif 名称 == "神天兵_冰晶魅灵_奔跑"	 then
		return 0xCDAF25A6
	elseif 名称 == "神天兵_冰晶雪魄_站立"	 then
		return 0xB50CCD0A
	elseif 名称 == "神天兵_冰晶雪魄_奔跑"	 then
		return 0x12B7F681
	elseif 名称 == "神天兵_霜雪龙宝_站立"	 then
		return 0x9662814C
	elseif 名称 == "神天兵_霜雪龙宝_奔跑"	 then
		return 0xDD1346DC
	elseif 名称 == "神天兵_飞天龙马_站立"	 then
		return 0x35997A39
	elseif 名称 == "神天兵_飞天龙马_奔跑"	 then
		return 0x09AE42B3


	-------------------舞天姬

	elseif 名称 == "舞天姬_独角马_站立"	 then
		return 0xA5C0843E
	elseif 名称 == "舞天姬_独角马_奔跑"	 then
		return 0xFB18050C
	elseif 名称 == "舞天姬_青梅竹马_站立"	 then
		return 0x1D952151
	elseif 名称 == "舞天姬_青梅竹马_奔跑"	 then
		return 0xA86184D9
	elseif 名称 == "舞天姬_深海狂鲨_站立"	 then
		return 0xF019303B
	elseif 名称 == "舞天姬_深海狂鲨_奔跑"	 then
		return 0xDDCB9DA7
	elseif 名称 == "舞天姬_霜雪龙宝_站立"	 then
		return 0x970FA734
	elseif 名称 == "舞天姬_霜雪龙宝_奔跑"	 then
		return 0x2AEF0F24
	elseif 名称 == "舞天姬_冰晶雪魄_站立"	 then
		return 0x88C32E14
	elseif 名称 == "舞天姬_冰晶雪魄_奔跑"	 then
		return 0xA2F9250A
	elseif 名称 == "舞天姬_冰晶魅灵_站立"	 then
		return 0xF753388E
	elseif 名称 == "舞天姬_冰晶魅灵_奔跑"	 then
		return 0x7924DC61
	elseif 名称 == "舞天姬_飞天龙马_站立"	 then
		return 0x4547C5EF
	elseif 名称 == "舞天姬_飞天龙马_奔跑"	 then
		return 0x3B7D42C9

	-------------------------逍遥生

	elseif 名称 == "逍遥生_独角马_站立"	 then
		return 0x3970879B
	elseif 名称 == "逍遥生_独角马_奔跑"   then
		return 0x8986C2B8
	elseif 名称 == "逍遥生_深海狂鲨_站立"	 then
		return 0x1F389D5C
	elseif 名称 == "逍遥生_深海狂鲨_奔跑"	 then
		return 0x085E408B
	elseif 名称 == "逍遥生_青梅竹马_站立"	 then
		return 0x788960BB
	elseif 名称 == "逍遥生_青梅竹马_奔跑"	 then
		return 0x19AFB2FD
	elseif 名称 == "逍遥生_冰晶魅灵_站立"	 then
		return 0xDB9D4A0F
	elseif 名称 == "逍遥生_冰晶魅灵_奔跑"	 then
		return 0xA02C51DB
	elseif 名称 == "逍遥生_冰晶雪魄_站立"	 then
		return 0x6C7143EF
	elseif 名称 == "逍遥生_冰晶雪魄_奔跑"	 then
		return 0xA5781F59
	elseif 名称 == "逍遥生_霜雪龙宝_站立"	 then
		return 0x68F0DA23
	elseif 名称 == "逍遥生_霜雪龙宝_奔跑"	 then
		return 0x80D12303
	elseif 名称 == "逍遥生_飞天龙马_站立"	 then
		return 0x34F3E6FA
	elseif 名称 == "逍遥生_飞天龙马_奔跑"	 then
		return 0xD941BC31

	---------------玄彩娥

	elseif 名称 == "玄彩娥_独角马_奔跑"	 then
		return 0x6E75C55E
	elseif 名称 == "玄彩娥_独角马_站立"	 then
		return 0x1802F06C
	elseif 名称 == "玄彩娥_青梅竹马_站立"	 then
		return 0xF1BEC5D7
	elseif 名称 == "玄彩娥_青梅竹马_奔跑"	 then
		return 0x4A4B88A5
	elseif 名称 == "玄彩娥_深海狂鲨_站立"	 then
		return 0x8ED10798
	elseif 名称 == "玄彩娥_深海狂鲨_奔跑"	 then
		return 0x2ECBC105
	elseif 名称 == "玄彩娥_霜雪龙宝_站立"	 then
		return 0x7EF80073
	elseif 名称 == "玄彩娥_霜雪龙宝_奔跑"	 then
		return 0x9B75BD21
	elseif 名称 == "玄彩娥_冰晶雪魄_站立"	 then
		return 0x5E1DC5ED
	elseif 名称 == "玄彩娥_冰晶雪魄_奔跑"	 then
		return 0xB3589DB5
	elseif 名称 == "玄彩娥_冰晶魅灵_站立"	 then
		return 0xE14D7033
	elseif 名称 == "玄彩娥_冰晶魅灵_奔跑"	 then
		return 0xE8E3C910
	elseif 名称 == "玄彩娥_飞天龙马_站立"	 then
		return 0x62576574
	elseif 名称 == "玄彩娥_飞天龙马_奔跑"	 then
		return 0x1FE2A757

	----------------------------------巫蛮儿

	elseif 名称 == "巫蛮儿_独角马_奔跑"	 then
		return 0xA3E461E0
	elseif 名称 == "巫蛮儿_独角马_站立"	 then
		return 0xFE72755B
	elseif 名称 == "巫蛮儿_青梅竹马_站立"	 then
		return 0x6E1F9949
	elseif 名称 == "巫蛮儿_青梅竹马_奔跑"	 then
		return 0xDF3EB09B
	elseif 名称 == "巫蛮儿_深海狂鲨_站立"	 then
		return 0xEC841CBB
	elseif 名称 == "巫蛮儿_深海狂鲨_奔跑"	 then
		return 0xA666FD13
	elseif 名称 == "巫蛮儿_霜雪龙宝_站立"	 then
		return 0xD78204FC
	elseif 名称 == "巫蛮儿_霜雪龙宝_奔跑"	 then
		return 0x1C93E78C
	elseif 名称 == "巫蛮儿_冰晶雪魄_站立"	 then
		return 0xEABCDF89
	elseif 名称 == "巫蛮儿_冰晶雪魄_奔跑"	 then
		return 0xA4D974C2
	elseif 名称 == "巫蛮儿_冰晶魅灵_站立"	 then
		return 0x335339A5
	elseif 名称 == "巫蛮儿_冰晶魅灵_奔跑"	 then
		return 0xFD182818
	elseif 名称 == "巫蛮儿_飞天龙马_站立"	 then
		return 0x9F6EDC5B
	elseif 名称 == "巫蛮儿_飞天龙马_奔跑"	 then
		return 0x4F87C814

	----------------------------------羽灵神

	elseif 名称 == "羽灵神_独角马_奔跑"	 then
		return 0x72B05C62
	elseif 名称 == "羽灵神_独角马_站立"	 then
		return 0xF70BF42D
	elseif 名称 == "羽灵神_深海狂鲨_站立"	 then
		return 0x68596FB3
	elseif 名称 == "羽灵神_深海狂鲨_奔跑"	 then
		return 0x402D59BB
	elseif 名称 == "羽灵神_青梅竹马_站立"	 then
		return 0xC8DCE357
	elseif 名称 == "羽灵神_青梅竹马_奔跑"	 then
		return 0xBA7CA01F
	elseif 名称 == "羽灵神_冰晶魅灵_站立"	 then
		return 0xE8376979
	elseif 名称 == "羽灵神_冰晶魅灵_奔跑"	 then
		return 0x977D7705
	elseif 名称 == "羽灵神_冰晶雪魄_站立"	 then
		return 0xD0472BDB
	elseif 名称 == "羽灵神_冰晶雪魄_奔跑"	 then
		return 0x11E849D5
	elseif 名称 == "羽灵神_霜雪龙宝_站立"	 then
		return 0x95923CD3
	elseif 名称 == "羽灵神_霜雪龙宝_奔跑"	 then
		return 0x3B1D456E
	elseif 名称 == "羽灵神_飞天龙马_站立"	 then
		return 0x94970693
	elseif 名称 == "羽灵神_飞天龙马_奔跑"	 then
		return 0x53494D3F


	--------------------------杀破狼

	elseif 名称 == "杀破狼_独角马_奔跑"	 then
		return 0x2A858ABF
	elseif 名称 == "杀破狼_独角马_站立"	 then
		return 0x2A858ABF
	elseif 名称 == "杀破狼_深海狂鲨_站立"	 then
		return 0xADFDC47A
	elseif 名称 == "杀破狼_深海狂鲨_奔跑"	 then
		return 0x19668C39
	elseif 名称 == "杀破狼_青梅竹马_站立"	 then
		return 0x4488275C
	elseif 名称 == "杀破狼_青梅竹马_奔跑"	 then
		return 0x5FF1A254
	elseif 名称 == "杀破狼_冰晶魅灵_站立"	 then
		return 0xA1DB3447
	elseif 名称 == "杀破狼_冰晶魅灵_奔跑"	 then
		return 0x3BA5C4F6
	elseif 名称 == "杀破狼_冰晶雪魄_站立"	 then
		return 0xE01FC948
	elseif 名称 == "杀破狼_冰晶雪魄_奔跑"	 then
		return 0x33181B3E
	elseif 名称 == "杀破狼_霜雪龙宝_站立"	 then
		return 0x3A4FB4E6
	elseif 名称 == "杀破狼_霜雪龙宝_奔跑"	 then
		return 0x38B5ADC6
	elseif 名称 == "杀破狼_飞天龙马_站立"	 then
		return 0xF8D7516B
	elseif 名称 == "杀破狼_飞天龙马_奔跑"	 then
		return 0xC07BE47B


	-----------------鬼潇潇

	elseif 名称 == "鬼潇潇_独角马_站立"	 then
		return 0x74EF6D5E
	elseif 名称 == "鬼潇潇_独角马_奔跑"	 then
		return 0xF1AA1CDC

	elseif 名称 == "鬼潇潇_青梅竹马_站立"	 then
		return 0xD78587D1
	elseif 名称 == "鬼潇潇_青梅竹马_奔跑"	 then
		return 0xDEC76AF6
	elseif 名称 == "鬼潇潇_深海狂鲨_站立"	 then
		return 0x9FAC7C21
	elseif 名称 == "鬼潇潇_深海狂鲨_奔跑"	 then
		return 0xF0698B61
	elseif 名称 == "鬼潇潇_霜雪龙宝_站立"	 then
		return 0x4D5F3B18
	elseif 名称 == "鬼潇潇_霜雪龙宝_奔跑"	 then
		return 0xBBA82846
	elseif 名称 == "鬼潇潇_冰晶雪魄_站立"	 then
		return 0x264A5EC9
	elseif 名称 == "鬼潇潇_冰晶雪魄_奔跑"	 then
		return 0x338882F8
	elseif 名称 == "鬼潇潇_冰晶魅灵_站立"	 then
		return 0x9CB213E0
	elseif 名称 == "鬼潇潇_冰晶魅灵_奔跑"	 then
		return 0xF24B1171
	elseif 名称 == "鬼潇潇_飞天龙马_站立"	 then
		return 0x17520E38
	elseif 名称 == "鬼潇潇_飞天龙马_奔跑"	 then
		return 0x24B0DB4B

	-------------------偃无师

	elseif 名称 == "偃无师_独角马_奔跑"	 then
		return 0x4853B8FA
	elseif 名称 == "偃无师_独角马_站立"	 then
		return 0x1DD23345
	elseif 名称 == "偃无师_深海狂鲨_站立"	 then
		return 0x71666D92
	elseif 名称 == "偃无师_深海狂鲨_奔跑"	 then
		return 0x70526BE6
	elseif 名称 == "偃无师_青梅竹马_站立"	 then
		return 0x4C1BA5B0
	elseif 名称 == "偃无师_青梅竹马_奔跑"	 then
		return 0x4B24E1A5
	elseif 名称 == "偃无师_冰晶魅灵_站立"	 then
		return 0x4527CD80
	elseif 名称 == "偃无师_冰晶魅灵_奔跑"	 then
		return 0x41B08225
	elseif 名称 == "偃无师_冰晶雪魄_站立"	 then
		return 0x283DA162
	elseif 名称 == "偃无师_冰晶雪魄_奔跑"	 then
		return 0x83A5CFDA
	elseif 名称 == "偃无师_霜雪龙宝_站立"	 then
		return 0x56BBF2A8
	elseif 名称 == "偃无师_霜雪龙宝_奔跑"	 then
		return 0x9780A89A
	elseif 名称 == "偃无师_飞天龙马_站立"	 then
		return 0xE9EAE8CC
	elseif 名称 == "偃无师_飞天龙马_奔跑"	 then
		return 0x4FFD83D8

	------------------桃夭夭

	elseif 名称 == "桃夭夭_独角马_奔跑"	 then
		return 0xE6265000
	elseif 名称 == "桃夭夭_独角马_站立"	 then
		return 0x1D00C78D
	elseif 名称 == "桃夭夭_青梅竹马_站立"	 then
		return 0xA9B71F42
	elseif 名称 == "桃夭夭_青梅竹马_奔跑"	 then
		return 0xCA7094E6
	elseif 名称 == "桃夭夭_深海狂鲨_站立"	 then
		return 0x368DA460
	elseif 名称 == "桃夭夭_深海狂鲨_奔跑"	 then
		return 0x3291E592
	elseif 名称 == "桃夭夭_霜雪龙宝_站立"	 then
		return 0xF001907F
	elseif 名称 == "桃夭夭_霜雪龙宝_奔跑"	 then
		return 0xBED2AAC0
	elseif 名称 == "桃夭夭_冰晶雪魄_站立"	 then
		return 0xCCA34401
	elseif 名称 == "桃夭夭_冰晶雪魄_奔跑"	 then
		return 0x70459F4E
	elseif 名称 == "桃夭夭_冰晶魅灵_站立"	 then
		return 0x1981A498
	elseif 名称 == "桃夭夭_冰晶魅灵_奔跑"	 then
		return 0x11C5B94D
	elseif 名称 == "桃夭夭_飞天龙马_站立"	 then
		return 0xE43EE153
	elseif 名称 == "桃夭夭_飞天龙马_奔跑"	 then
		return 0xE649E0EA
---------------------------------------------------幻·帝江
    elseif 名称 == "飞燕女_幻·帝江_站立" then
	    return 0x60000028
    elseif 名称 == "飞燕女_幻·帝江_奔跑" then
        return 0x60000027
	elseif 名称 == "英女侠_幻·帝江_站立" then
	    return 0x60000030
    elseif 名称 == "英女侠_幻·帝江_奔跑" then
        return 0x60000029
	elseif 名称 == "狐美人_幻·帝江_站立" then
	    return 0x60000032
    elseif 名称 == "狐美人_幻·帝江_奔跑" then
        return 0x60000031
	elseif 名称 == "乌蛮儿_幻·帝江_站立" then
	    return 0x60000034
    elseif 名称 == "乌蛮儿_幻·帝江_奔跑" then
        return 0x60000033
	elseif 名称 == "神天兵_幻·帝江_站立" then
	    return 0x60000046
    elseif 名称 == "神天兵_幻·帝江_奔跑" then
        return 0x60000045
	elseif 名称 == "桃夭夭_幻·帝江_站立" then
	    return 0x60000028
    elseif 名称 == "桃夭夭_幻·帝江_奔跑" then
        return 0x60000027
 	elseif 名称 == "玄彩娥_幻·帝江_站立" then
	    return 0x60000028
    elseif 名称 == "玄彩娥_幻·帝江_奔跑" then
        return 0x60000027
    elseif 名称 == "舞天姬_幻·帝江_站立" then
	    return 0x60000028
    elseif 名称 == "舞天姬_幻·帝江_奔跑" then
        return 0x60000027
    elseif 名称 == "骨精灵_幻·帝江_站立" then
	    return 0x60000028
    elseif 名称 == "骨精灵_幻·帝江_奔跑" then
        return 0x60000027
    elseif 名称 == "鬼潇潇_幻·帝江_站立" then
	    return 0x60000028
    elseif 名称 == "鬼潇潇_幻·帝江_奔跑" then
        return 0x60000027
    elseif 名称 == "剑侠客_幻·帝江_站立" then
	    return 0x60000048
    elseif 名称 == "剑侠客_幻·帝江_奔跑" then
        return 0x60000047
    elseif 名称 == "虎头怪_幻·帝江_站立" then
	    return 0x60000050
    elseif 名称 == "虎头怪_幻·帝江_奔跑" then
        return 0x60000049
    elseif 名称 == "巨魔王_幻·帝江_站立" then
	    return 0x60000052
    elseif 名称 == "巨魔王_幻·帝江_奔跑" then
        return 0x60000051
    elseif 名称 == "逍遥生_幻·帝江_站立" then
	    return 0x60000054
    elseif 名称 == "逍遥生_幻·帝江_奔跑" then
        return 0x60000053
    elseif 名称 == "龙太子_幻·帝江_站立" then
	    return 0x60000042
    elseif 名称 == "龙太子_幻·帝江_奔跑" then
        return 0x60000041
    elseif 名称 == "杀破狼_幻·帝江_站立" then
	    return 0x60000058
    elseif 名称 == "杀破狼_幻·帝江_奔跑" then
        return 0x60000057
    elseif 名称 == "偃无师_幻·帝江_站立" then
	    return 0x60000062
    elseif 名称 == "偃无师_幻·帝江_奔跑" then
        return 0x60000063
    elseif 名称 == "羽灵神_幻·帝江_站立" then
	    return 0x60000062
    elseif 名称 == "羽灵神_幻·帝江_奔跑" then
        return 0x60000061
-----------------------------------------幻·帝江·月白
        elseif 名称 == "飞燕女_幻·帝江·月白_站立" then
	        return  0x50000002
        elseif 名称 == "飞燕女_幻·帝江·月白_奔跑" then
            return  0x50000001
		elseif 名称 == "英女侠_幻·帝江·月白_站立" then
	        return  0x50000032
        elseif 名称 == "英女侠_幻·帝江·月白_奔跑" then
            return  0x50000031
		elseif 名称 == "狐美人_幻·帝江·月白_站立" then
	        return  0x50000008
        elseif 名称 == "狐美人_幻·帝江·月白_奔跑" then
            return  0x50000007
		elseif 名称 == "乌蛮儿_幻·帝江·月白_站立" then
	        return  0x50000024
        elseif 名称 == "乌蛮儿_幻·帝江·月白_奔跑" then
            return  0x50000023
		elseif 名称 == "神天兵_幻·帝江·月白_站立" then
	        return  0x50000020
        elseif 名称 == "神天兵_幻·帝江·月白_奔跑" then
            return  0x50000019
		elseif 名称 == "桃夭夭_幻·帝江·月白_站立" then
	        return  0x50000022
        elseif 名称 == "桃夭夭_幻·帝江·月白_奔跑" then
            return  0x50000021
 		elseif 名称 == "玄彩娥_幻·帝江·月白_站立" then
	        return  0x50000028
        elseif 名称 == "玄彩娥_幻·帝江·月白_奔跑" then
            return  0x50000027
        elseif 名称 == "舞天姬_幻·帝江·月白_站立" then
	        return  0x50000024
        elseif 名称 == "舞天姬_幻·帝江·月白_奔跑" then
            return  0x50000023
        elseif 名称 == "骨精灵_幻·帝江·月白_站立" then
	        return  0x50000004
        elseif 名称 == "骨精灵_幻·帝江·月白_奔跑" then
            return  0x50000003
        elseif 名称 == "鬼潇潇_幻·帝江·月白_站立" then
	        return  0x50000006
        elseif 名称 == "鬼潇潇_幻·帝江·月白_奔跑" then
            return  0x50000005
        elseif 名称 == "剑侠客_幻·帝江·月白_站立" then
	        return  0x50000012
        elseif 名称 == "剑侠客_幻·帝江·月白_奔跑" then
            return  0x50000011
        elseif 名称 == "虎头怪_幻·帝江·月白_站立" then
	        return  0x50000010
        elseif 名称 == "虎头怪_幻·帝江·月白_奔跑" then
            return  0x50000009
        elseif 名称 == "巨魔王_幻·帝江·月白_站立" then
	        return  0x50000014
        elseif 名称 == "巨魔王_幻·帝江·月白_奔跑" then
            return  0x50000013
        elseif 名称 == "逍遥生_幻·帝江·月白_站立" then
	        return  0x50000012
        elseif 名称 == "逍遥生_幻·帝江·月白_奔跑" then
            return  0x50000011
        elseif 名称 == "龙太子_幻·帝江·月白_站立" then
	        return  0x50000016
        elseif 名称 == "龙太子_幻·帝江·月白_奔跑" then
            return  0x50000015
        elseif 名称 == "杀破狼_幻·帝江·月白_站立" then
	        return  0x50000018
        elseif 名称 == "杀破狼_幻·帝江·月白_奔跑" then
            return  0x50000017
        elseif 名称 == "偃无师_幻·帝江·月白_站立" then
	        return  0x50000030
        elseif 名称 == "偃无师_幻·帝江·月白_奔跑" then
            return  0x50000029
        elseif 名称 == "羽灵神_幻·帝江·月白_站立" then
	        return  0x50000034
        elseif 名称 == "羽灵神_幻·帝江·月白_奔跑" then
            return  0x50000033

--------------------------------------------------------------馋嘴刺猬
elseif 名称 == "神天兵_馋嘴刺猬_站立" then
        return 0x10000001
elseif 名称 == "神天兵_馋嘴刺猬_奔跑"	 then
		return 0x10000002
elseif 名称 == "飞燕女_馋嘴刺猬_站立" then
        return 0x10000003
elseif 名称 == "飞燕女_馋嘴刺猬_奔跑"	 then
		return 0x10000004
elseif 名称 == "骨精灵_馋嘴刺猬_站立" then
        return 0x10000005
elseif 名称 == "骨精灵_馋嘴刺猬_奔跑"	 then
		return 0x10000006
elseif 名称 == "鬼潇潇_馋嘴刺猬_站立" then
        return 0x10000007
elseif 名称 == "鬼潇潇_馋嘴刺猬_奔跑"	 then
		return 0x10000008
elseif 名称 == "狐美人_馋嘴刺猬_站立" then
 		return 0x10000009
elseif 名称 == "狐美人_馋嘴刺猬_奔跑"	 then
		return 0x10000010
elseif 名称 == "虎头怪_馋嘴刺猬_站立" then
 		return 0x10000011
elseif 名称 == "虎头怪_馋嘴刺猬_奔跑"	 then
		return 0x10000012
elseif 名称 == "剑侠客_馋嘴刺猬_站立" then
 		return 0x00000013
elseif 名称 == "剑侠客_馋嘴刺猬_奔跑"	 then
		return 0x00000014
elseif 名称 == "巨魔王_馋嘴刺猬_站立" then
 		return 0x000000015
elseif 名称 == "巨魔王_馋嘴刺猬_奔跑"	 then
		return 0x000000016
elseif 名称 == "龙太子_馋嘴刺猬_站立" then
 		return 0x00000017
elseif 名称 == "龙太子_馋嘴刺猬_奔跑"	 then
		return 0x00000018
elseif 名称 == "杀破狼_馋嘴刺猬_站立" then
 		return 0x000000019
elseif 名称 == "杀破狼_馋嘴刺猬_奔跑"	 then
		return 0x000000020
elseif 名称 == "桃夭夭_馋嘴刺猬_站立" then
 		return 0x00000021
elseif 名称 == "桃夭夭_馋嘴刺猬_奔跑"	 then
		return 0x00000022
elseif 名称 == "巫蛮儿_馋嘴刺猬_站立" then
 		return 0x000000023
elseif 名称 == "巫蛮儿_馋嘴刺猬_奔跑"	 then
		return 0x000000024
elseif 名称 == "舞天姬_馋嘴刺猬_站立" then
 		return 0x00000025
elseif 名称 == "舞天姬_馋嘴刺猬_奔跑"	 then
		return 0x00000026
elseif 名称 == "逍遥生_馋嘴刺猬_站立" then
 		return 0x000000027
elseif 名称 == "逍遥生_馋嘴刺猬_奔跑"	 then
		return 0x000000028
elseif 名称 == "玄彩娥_馋嘴刺猬_站立" then
 		return 0x00000029
elseif 名称 == "玄彩娥_馋嘴刺猬_奔跑"	 then
		return 0x00000030
elseif 名称 == "偃无师_馋嘴刺猬_站立" then
 		return 0x000000031
elseif 名称 == "偃无师_馋嘴刺猬_奔跑"	 then
		return 0x000000032
elseif 名称 == "英女侠_馋嘴刺猬_站立" then
 		return 0x00000033
elseif 名称 == "英女侠_馋嘴刺猬_奔跑"	 then
		return 0x00000034
elseif 名称 == "羽灵神_馋嘴刺猬_站立" then
 		return 0x000000035
elseif 名称 == "羽灵神_馋嘴刺猬_奔跑"	 then
		return 0x000000036

----------------------------------------------------------玲珑雪狐
		  elseif 名称 == "飞燕女_玲珑雪狐_站立" then
 return 0x00000073
 		  elseif 名称 == "飞燕女_玲珑雪狐_奔跑" then
 return 0x00000074
  		  elseif 名称 == "骨精灵_玲珑雪狐_站立" then
 return 0x000000075
 		  elseif 名称 == "骨精灵_玲珑雪狐_奔跑" then
 return 0x000000076
		  elseif 名称 == "鬼潇潇_玲珑雪狐_站立" then
 return 0x00000077
 		  elseif 名称 == "鬼潇潇_玲珑雪狐_奔跑" then
 return 0x00000078
   		  elseif 名称 == "狐美人_玲珑雪狐_站立" then
 return 0x000000079
 		  elseif 名称 == "狐美人_玲珑雪狐_奔跑" then
 return 0x000000080
		  elseif 名称 == "虎头怪_玲珑雪狐_站立" then
 return 0x00000081
 		  elseif 名称 == "虎头怪_玲珑雪狐_奔跑" then
 return 0x00000082
  		  elseif 名称 == "剑侠客_玲珑雪狐_站立" then
 return 0x000000083
 		  elseif 名称 == "剑侠客_玲珑雪狐_奔跑" then
 return 0x000000084
		  elseif 名称 == "巨魔王_玲珑雪狐_站立" then
 return 0x00000085
 		  elseif 名称 == "巨魔王_玲珑雪狐_奔跑" then
 return 0x00000086
  		  elseif 名称 == "龙太子_玲珑雪狐_站立" then
 return 0x000000087
 		  elseif 名称 == "龙太子_玲珑雪狐_奔跑" then
 return 0x000000088
		  elseif 名称 == "杀破狼_玲珑雪狐_站立" then
 return 0x00000089
 		  elseif 名称 == "杀破狼_玲珑雪狐_奔跑" then
 return 0x00000090
  		  elseif 名称 == "神天兵_玲珑雪狐_站立" then
 return 0x000000091
 		  elseif 名称 == "神天兵_玲珑雪狐_奔跑" then
 return 0x000000092
		  elseif 名称 == "桃夭夭_玲珑雪狐_站立" then
 return 0x00000093
 		  elseif 名称 == "桃夭夭_玲珑雪狐_奔跑" then
 return 0x00000094
  		  elseif 名称 == "巫蛮儿_玲珑雪狐_站立" then
 return 0x000000096
 		  elseif 名称 == "巫蛮儿_玲珑雪狐_奔跑" then
 return 0x000000097
		  elseif 名称 == "舞天姬_玲珑雪狐_站立" then
 return 0x00000097
 		  elseif 名称 == "舞天姬_玲珑雪狐_奔跑" then
 return 0x00000098
  		  elseif 名称 == "逍遥生_玲珑雪狐_站立" then
 return 0x000000100
 		  elseif 名称 == "逍遥生_玲珑雪狐_奔跑" then
 return 0x000000101
		  elseif 名称 == "玄彩娥_玲珑雪狐_站立" then
 return 0x00000101
 		  elseif 名称 == "玄彩娥_玲珑雪狐_奔跑" then
 return 0x00000102
  		  elseif 名称 == "偃无师_玲珑雪狐_站立" then
 return 0x000000103
 		  elseif 名称 == "偃无师_玲珑雪狐_奔跑" then
 return 0x000000064
		  elseif 名称 == "英女侠_玲珑雪狐_站立" then
 return 0x00000105
 		  elseif 名称 == "英女侠_玲珑雪狐_奔跑" then
 return 0x00000106
  		  elseif 名称 == "羽灵神_玲珑雪狐_站立" then
 return 0x000000107
 		  elseif 名称 == "羽灵神_玲珑雪狐_奔跑" then
 return 0x000000108

 -------------------------------------------------------------赤焰战狼

		  elseif 名称 == "飞燕女_赤焰战狼_站立" then
 return 0x00000109
		  elseif 名称 == "飞燕女_赤焰战狼_奔跑" then
 return 0x00000110
		  elseif 名称 == "骨精灵_赤焰战狼_站立" then
 return 0x00000111
 		  elseif 名称 == "骨精灵_赤焰战狼_奔跑" then
 return 0x00000112
 		  elseif 名称 == "鬼潇潇_赤焰战狼_站立" then
 return 0x00000113
  		  elseif 名称 == "鬼潇潇_赤焰战狼_奔跑" then
 return 0x00000114
		  elseif 名称 == "狐美人_赤焰战狼_站立" then
 return 0x00000115
 		  elseif 名称 == "狐美人_赤焰战狼_奔跑" then
 return 0x00000116
		  elseif 名称 == "虎头怪_赤焰战狼_站立" then
 return 0x00000117
 		  elseif 名称 == "虎头怪_赤焰战狼_奔跑" then
 return 0x00000118
		  elseif 名称 == "剑侠客_赤焰战狼_站立" then
 return 0x00000119
 		  elseif 名称 == "剑侠客_赤焰战狼_奔跑" then
 return 0x00000120
		  elseif 名称 == "巨魔王_赤焰战狼_站立" then
 return 0x00000121
 		  elseif 名称 == "巨魔王_赤焰战狼_奔跑" then
 return 0x00000122
		  elseif 名称 == "龙太子_赤焰战狼_站立" then
 return 0x00000123
 		  elseif 名称 == "龙太子_赤焰战狼_奔跑" then
 return 0x00000124
		  elseif 名称 == "杀破狼_赤焰战狼_站立" then
 return 0x00000125
 		  elseif 名称 == "杀破狼_赤焰战狼_奔跑" then
 return 0x00000126
		  elseif 名称 == "神天兵_赤焰战狼_站立" then
 return 0x00000127
 		  elseif 名称 == "神天兵_赤焰战狼_奔跑" then
 return 0x00000128
 		  elseif 名称 == "桃夭夭_赤焰战狼_站立" then
 return 0x00000129
  		  elseif 名称 == "桃夭夭_赤焰战狼_奔跑" then
 return 0x00000130
		  elseif 名称 == "巫蛮儿_赤焰战狼_站立" then
 return 0x00000131
 		  elseif 名称 == "巫蛮儿_赤焰战狼_奔跑" then
 return 0x00000132
		  elseif 名称 == "舞天姬_赤焰战狼_站立" then
 return 0x00000133
 		  elseif 名称 == "舞天姬_赤焰战狼_奔跑" then
 return 0x00000134
		  elseif 名称 == "逍遥生_赤焰战狼_站立" then
 return 0x00000135
 		  elseif 名称 == "逍遥生_赤焰战狼_奔跑" then
 return 0x00000136
		  elseif 名称 == "玄彩娥_赤焰战狼_站立" then
 return 0x00000137
 		  elseif 名称 == "玄彩娥_赤焰战狼_奔跑" then
 return 0x00000138
		  elseif 名称 == "偃无师_赤焰战狼_站立" then
 return 0x00000139
 		  elseif 名称 == "偃无师_赤焰战狼_奔跑" then
 return 0x00000140
		  elseif 名称 == "英女侠_赤焰战狼_站立" then
 return 0x00000141
 		  elseif 名称 == "英女侠_赤焰战狼_奔跑" then
 return 0x00000142
		  elseif 名称 == "羽灵神_赤焰战狼_站立" then
 return 0x00000143
 		  elseif 名称 == "羽灵神_赤焰战狼_奔跑" then
 return 0x00000144
------------------------------------------------------------北冥巨鲸

		  elseif 名称 == "飞燕女_北冥巨鲸_站立" then
 return 0x00000145
		  elseif 名称 == "飞燕女_北冥巨鲸_奔跑" then
 return 0x00000146
		  	elseif 名称 == "骨精灵_北冥巨鲸_站立" then
 return 0x00000147
		  	elseif 名称 == "骨精灵_北冥巨鲸_奔跑" then
 return 0x00000148
		  elseif 名称 == "鬼潇潇_北冥巨鲸_站立" then
 return 0x00000149
		  elseif 名称 == "鬼潇潇_北冥巨鲸_奔跑" then
 return 0x00000150
		  	elseif 名称 == "狐美人_北冥巨鲸_站立" then
 return 0x00000151
		  	elseif 名称 == "狐美人_北冥巨鲸_奔跑" then
 return 0x00000152
		  elseif 名称 == "虎头怪_北冥巨鲸_站立" then
 return 0x00000153
		  elseif 名称 == "虎头怪_北冥巨鲸_奔跑" then
 return 0x00000154
		  	elseif 名称 == "剑侠客_北冥巨鲸_站立" then
 return 0x00000155
		  	elseif 名称 == "剑侠客_北冥巨鲸_奔跑" then
 return 0x00000156
		  elseif 名称 == "巨魔王_北冥巨鲸_站立" then
 return 0x00000157
		  elseif 名称 == "巨魔王_北冥巨鲸_奔跑" then
 return 0x00000158
		  	elseif 名称 == "龙太子_北冥巨鲸_站立" then
 return 0x00000159
		  	elseif 名称 == "龙太子_北冥巨鲸_奔跑" then
 return 0x00000160
		  elseif 名称 == "杀破狼_北冥巨鲸_站立" then
 return 0x00000161
		  elseif 名称 == "杀破狼_北冥巨鲸_奔跑" then
 return 0x00000162
		  	elseif 名称 == "神天兵_北冥巨鲸_站立" then
 return 0x00000163
		  	elseif 名称 == "神天兵_北冥巨鲸_奔跑" then
 return 0x00000164
		  elseif 名称 == "桃夭夭_北冥巨鲸_站立" then
 return 0x00000165
		  elseif 名称 == "桃夭夭_北冥巨鲸_奔跑" then
 return 0x00000166
		  	elseif 名称 == "巫蛮儿_北冥巨鲸_站立" then
 return 0x00000167
		  	elseif 名称 == "巫蛮儿_北冥巨鲸_奔跑" then
 return 0x00000168
		  elseif 名称 == "舞天姬_北冥巨鲸_站立" then
 return 0x00000169
		  	elseif 名称 == "舞天姬_北冥巨鲸_奔跑" then
 return 0x00000170
		  	elseif 名称 == "逍遥生_北冥巨鲸_站立" then
 return 0x00000171
		  	elseif 名称 == "逍遥生_北冥巨鲸_奔跑" then
 return 0x00000172
		  elseif 名称 == "玄彩娥_北冥巨鲸_站立" then
 return 0x00000173
 		  elseif 名称 == "玄彩娥_北冥巨鲸_奔跑" then
 return 0x00000174
		  	elseif 名称 == "偃无师_北冥巨鲸_站立" then
 return 0x00000175
		  	elseif 名称 == "偃无师_北冥巨鲸_奔跑" then
 return 0x00000176
		  elseif 名称 == "英女侠_北冥巨鲸_站立" then
 return 0x00000177
		  elseif 名称 == "英女侠_北冥巨鲸_奔跑" then
 return 0x00000178
		  	elseif 名称 == "羽灵神_北冥巨鲸_站立" then
 return 0x00000179
		  	elseif 名称 == "羽灵神_北冥巨鲸_奔跑" then
 return 0x00000180
-----------------------------------------------------------------年兽

		  elseif 名称 == "飞燕女_年兽_站立" then
 return 0x00000181
		  elseif 名称 == "飞燕女_年兽_奔跑" then
 return 0x00000182
		  elseif 名称 == "骨精灵_年兽_站立" then
 return 0x00000183
		  elseif 名称 == "骨精灵_年兽_奔跑" then
 return 0x00000184
		  elseif 名称 == "鬼潇潇_年兽_站立" then
 return 0x00000185
		  elseif 名称 == "鬼潇潇_年兽_奔跑" then
 return 0x00000186
		  elseif 名称 == "狐美人_年兽_站立" then
 return 0x00000187
		  elseif 名称 == "狐美人_年兽_奔跑" then
 return 0x00001088
		  elseif 名称 == "虎头怪_年兽_站立" then
 return 0x00000189
		  elseif 名称 == "虎头怪_年兽_奔跑" then
 return 0x00000190
		  elseif 名称 == "剑侠客_年兽_站立" then
 return 0x00000191
		  elseif 名称 == "剑侠客_年兽_奔跑" then
 return 0x00000192
		  elseif 名称 == "巨魔王_年兽_站立" then
 return 0x00000193
		  elseif 名称 == "巨魔王_年兽_奔跑" then
 return 0x00000194
		  elseif 名称 == "龙太子_年兽_站立" then
 return 0x00000195
		  elseif 名称 == "龙太子_年兽_奔跑" then
 return 0x00000196
		  elseif 名称 == "杀破狼_年兽_站立" then
 return 0x00000197
		  elseif 名称 == "杀破狼_年兽_奔跑" then
 return 0x00000198
		  elseif 名称 == "神天兵_年兽_站立" then
 return 0x00000199
		  elseif 名称 == "神天兵_年兽_奔跑" then
 return 0x00000200
		  elseif 名称 == "桃夭夭_年兽_站立" then
 return 0x00000201
		  elseif 名称 == "桃夭夭_年兽_奔跑" then
 return 0x00000202
		  elseif 名称 == "巫蛮儿_年兽_站立" then
 return 0x00000203
		  elseif 名称 == "巫蛮儿_年兽_奔跑" then
 return 0x00000204
		  elseif 名称 == "舞天姬_年兽_站立" then
 return 0x00000205
		  elseif 名称 == "舞天姬_年兽_奔跑" then
 return 0x00000206
		  elseif 名称 == "逍遥生_年兽_站立" then
 return 0x00000207
		  elseif 名称 == "逍遥生_年兽_奔跑" then
 return 0x00000218
		  elseif 名称 == "玄彩娥_年兽_站立" then
 return 0x00000209
		  elseif 名称 == "玄彩娥_年兽_奔跑" then
 return 0x00000210
		  elseif 名称 == "偃无师_年兽_站立" then
 return 0x00000211
		  elseif 名称 == "偃无师_年兽_奔跑" then
 return 0x00000212
		  elseif 名称 == "英女侠_年兽_站立" then
 return 0x00000213
		  elseif 名称 == "英女侠_年兽_奔跑" then
 return 0x00000214
		  elseif 名称 == "羽灵神_年兽_站立" then
 return 0x00000215
		  elseif 名称 == "羽灵神_年兽_奔跑" then
 return 0x00000216
 ---------------------------------------------------------寒梅纨扇
		  elseif 名称 == "飞燕女_寒梅纨扇_站立" then
 return 0x00000217
		  elseif 名称 == "飞燕女_寒梅纨扇_奔跑" then
 return 0x00000218
		  elseif 名称 == "骨精灵_寒梅纨扇_站立" then
 return 0x00000219
		  elseif 名称 == "骨精灵_寒梅纨扇_奔跑" then
 return 0x00000220
		  elseif 名称 == "鬼潇潇_寒梅纨扇_站立" then
 return 0x00000221
		  elseif 名称 == "鬼潇潇_寒梅纨扇_奔跑" then
 return 0x00000222
		  elseif 名称 == "狐美人_寒梅纨扇_站立" then
 return 0x00000223
		  elseif 名称 == "狐美人_寒梅纨扇_奔跑" then
 return 0x00000224
		  elseif 名称 == "虎头怪_寒梅纨扇_站立" then
 return 0x00000225
		  elseif 名称 == "虎头怪_寒梅纨扇_奔跑" then
 return 0x00000226
		  elseif 名称 == "剑侠客_寒梅纨扇_站立" then
 return 0x00000227
		  elseif 名称 == "剑侠客_寒梅纨扇_奔跑" then
 return 0x00000228
		  elseif 名称 == "巨魔王_寒梅纨扇_站立" then
 return 0x00000229
		  elseif 名称 == "巨魔王_寒梅纨扇_奔跑" then
 return 0x00000230
		  elseif 名称 == "龙太子_寒梅纨扇_站立" then
 return 0x00000231
		  elseif 名称 == "龙太子_寒梅纨扇_奔跑" then
 return 0x00000232
		  elseif 名称 == "杀破狼_寒梅纨扇_站立" then
 return 0x00000233
		  elseif 名称 == "杀破狼_寒梅纨扇_奔跑" then
 return 0x00000234
		  elseif 名称 == "神天兵_寒梅纨扇_站立" then
 return 0x00000235
		  elseif 名称 == "神天兵_寒梅纨扇_奔跑" then
 return 0x00000236
		  elseif 名称 == "桃夭夭_寒梅纨扇_站立" then
 return 0x00000237
		  elseif 名称 == "桃夭夭_寒梅纨扇_奔跑" then
 return 0x00000238
		  elseif 名称 == "巫蛮儿_寒梅纨扇_站立" then
 return 0x00000239
		  elseif 名称 == "巫蛮儿_寒梅纨扇_奔跑" then
 return 0x00000240
		  elseif 名称 == "舞天姬_寒梅纨扇_站立" then
 return 0x00000241
		  elseif 名称 == "舞天姬_寒梅纨扇_奔跑" then
 return 0x00000242
		  elseif 名称 == "逍遥生_寒梅纨扇_站立" then
 return 0x00000243
		  elseif 名称 == "逍遥生_寒梅纨扇_奔跑" then
 return 0x00000244
		  elseif 名称 == "玄彩娥_寒梅纨扇_站立" then
 return 0x00000245
		  elseif 名称 == "玄彩娥_寒梅纨扇_奔跑" then
 return 0x00000246
		  elseif 名称 == "偃无师_寒梅纨扇_站立" then
 return 0x00000247
		  elseif 名称 == "偃无师_寒梅纨扇_奔跑" then
 return 0x00000248
		  elseif 名称 == "英女侠_寒梅纨扇_站立" then
 return 0x00000249
		  elseif 名称 == "英女侠_寒梅纨扇_奔跑" then
 return 0x00000250
		  elseif 名称 == "羽灵神_寒梅纨扇_站立" then
 return 0x00000251
		  elseif 名称 == "羽灵神_寒梅纨扇_奔跑" then
 return 0x00000252
-----------------------------------------------------------呆萌鸭鸭
		  elseif 名称 == "飞燕女_呆萌鸭鸭_站立" then
		  	return 0x00000253
		  elseif 名称 == "飞燕女_呆萌鸭鸭_奔跑" then
 		  	return 0x00000254
		  elseif 名称 == "骨精灵_呆萌鸭鸭_站立" then
		  	return 0x00000255
		  elseif 名称 == "骨精灵_呆萌鸭鸭_奔跑" then
 		  	return 0x00000256
		  elseif 名称 == "鬼潇潇_呆萌鸭鸭_站立" then
		  	return 0x00000257
		  elseif 名称 == "鬼潇潇_呆萌鸭鸭_奔跑" then
 		  	return 0x00000258
		  elseif 名称 == "狐美人_呆萌鸭鸭_站立" then
 			return 0x00000259
		  elseif 名称 == "狐美人_呆萌鸭鸭_奔跑" then
 		  	return 0x00000260
		  elseif 名称 == "虎头怪_呆萌鸭鸭_站立" then
		  	return 0x00000261
		  elseif 名称 == "虎头怪_呆萌鸭鸭_奔跑" then
 		  	return 0x00000262
		  elseif 名称 == "剑侠客_呆萌鸭鸭_站立" then
 	        return 0x00000263
		  elseif 名称 == "剑侠客_呆萌鸭鸭_奔跑" then
 		  	return 0x00000264
		  elseif 名称 == "巨魔王_呆萌鸭鸭_站立" then
		  	return 0x00000265
		  elseif 名称 == "巨魔王_呆萌鸭鸭_奔跑" then
 		  	return 0x00000266
		  elseif 名称 == "龙太子_呆萌鸭鸭_站立" then
 			return 0x00000267
		  elseif 名称 == "龙太子_呆萌鸭鸭_奔跑" then
 		  	return 0x00000267
		  elseif 名称 == "杀破狼_呆萌鸭鸭_站立" then
		  	return 0x00000269
		  elseif 名称 == "杀破狼_呆萌鸭鸭_奔跑" then
 		  	return 0x00000270
		  elseif 名称 == "神天兵_呆萌鸭鸭_站立" then
 	        return 0x00000271
		  elseif 名称 == "神天兵_呆萌鸭鸭_奔跑" then
 		  	return 0x00000272
		  elseif 名称 == "桃夭夭_呆萌鸭鸭_站立" then
		  	return 0x00000273
		  elseif 名称 == "桃夭夭_呆萌鸭鸭_奔跑" then
 		  	return 0x00000274
		  elseif 名称 == "巫蛮儿_呆萌鸭鸭_站立" then
 	        return 0x00000275
		  elseif 名称 == "巫蛮儿_呆萌鸭鸭_奔跑" then
 		  	return 0x00000276
		  elseif 名称 == "舞天姬_呆萌鸭鸭_站立" then
		  	return 0x00000277
		  elseif 名称 == "舞天姬_呆萌鸭鸭_奔跑" then
 		  	return 0x00000278
		  elseif 名称 == "逍遥生_呆萌鸭鸭_站立" then
 	        return 0x00000279
		  elseif 名称 == "逍遥生_呆萌鸭鸭_奔跑" then
 		  	return 0x00000280
		  elseif 名称 == "玄彩娥_呆萌鸭鸭_站立" then
		  	return 0x00000281
		  elseif 名称 == "玄彩娥_呆萌鸭鸭_奔跑" then
 		  	return 0x00000282
		  elseif 名称 == "偃无师_呆萌鸭鸭_站立" then
 	        return 0x00000283
		  elseif 名称 == "偃无师_呆萌鸭鸭_奔跑" then
 		  	return 0x00000284
		  elseif 名称 == "英女侠_呆萌鸭鸭_站立" then
		  	return 0x00000285
		  elseif 名称 == "英女侠_呆萌鸭鸭_奔跑" then
 		  	return 0x00000286
		  elseif 名称 == "羽灵神_呆萌鸭鸭_站立" then
 	        return 0x00000287
		  elseif 名称 == "羽灵神_呆萌鸭鸭_奔跑" then
 		  	return 0x00000288
elseif 名称 == "剑侠客_恶魔蝙蝠_站立" or 名称 == "龙太子_恶魔蝙蝠_站立"  or  名称 == "杀破狼_恶魔蝙蝠_站立" or 名称 == "神天兵_恶魔蝙蝠_站立"  or  名称 == "逍遥生_恶魔蝙蝠_站立"  or  名称 == "偃无师_恶魔蝙蝠_站立"  or  名称 == "羽灵神_恶魔蝙蝠_站立"   then
		return   0x30000103
elseif 名称 == "剑侠客_恶魔蝙蝠_奔跑" or 名称 == "龙太子_恶魔蝙蝠_奔跑"  or  名称 == "杀破狼_恶魔蝙蝠_奔跑" or 名称 == "神天兵_恶魔蝙蝠_奔跑"  or  名称 == "逍遥生_恶魔蝙蝠_奔跑"  or  名称 == "偃无师_恶魔蝙蝠_奔跑"  or  名称 == "羽灵神_恶魔蝙蝠_奔跑"   then
		return   0x30000104
elseif 名称 == "巨魔王_恶魔蝙蝠_站立"  then
		return   0x30000105
elseif  名称 == "巨魔王_恶魔蝙蝠_奔跑" then
		return   0x30000106
elseif 名称 == "虎头怪_恶魔蝙蝠_站立"  then
		return   0x30000101
elseif  名称 == "虎头怪_恶魔蝙蝠_奔跑" then
		return   0x30000102
elseif 名称 == "飞燕女_恶魔蝙蝠_站立" or 名称 == "骨精灵_恶魔蝙蝠_站立" or 名称 == "鬼潇潇_恶魔蝙蝠_站立" or 名称 == "狐美人_恶魔蝙蝠_站立" or 名称 == "桃夭夭_恶魔蝙蝠_站立" or 名称 == "巫蛮儿_恶魔蝙蝠_站立" or 名称 == "舞天姬_恶魔蝙蝠_站立" or 名称 == "玄彩娥_恶魔蝙蝠_站立" or 名称 == "英女侠_恶魔蝙蝠_站立"  then
		return   0x30000093
elseif 名称 == "飞燕女_恶魔蝙蝠_奔跑" or 名称 == "骨精灵_恶魔蝙蝠_奔跑" or 名称 == "鬼潇潇_恶魔蝙蝠_奔跑" or 名称 == "狐美人_恶魔蝙蝠_奔跑" or 名称 == "桃夭夭_恶魔蝙蝠_奔跑" or 名称 == "巫蛮儿_恶魔蝙蝠_奔跑" or 名称 == "舞天姬_恶魔蝙蝠_奔跑" or 名称 == "玄彩娥_恶魔蝙蝠_奔跑" or 名称 == "英女侠_恶魔蝙蝠_奔跑"  then
		return   0x30000094

elseif 名称 == "剑侠客_幽冥白虎_站立" or 名称 == "龙太子_幽冥白虎_站立"  or  名称 == "杀破狼_幽冥白虎_站立" or 名称 == "神天兵_幽冥白虎_站立"  or  名称 == "逍遥生_幽冥白虎_站立"  or  名称 == "偃无师_幽冥白虎_站立"  or  名称 == "羽灵神_幽冥白虎_站立"   then
		return   0x30000175
elseif 名称 == "剑侠客_幽冥白虎_奔跑" or 名称 == "龙太子_幽冥白虎_奔跑"  or  名称 == "杀破狼_幽冥白虎_奔跑" or 名称 == "神天兵_幽冥白虎_奔跑"  or  名称 == "逍遥生_幽冥白虎_奔跑"  or  名称 == "偃无师_幽冥白虎_奔跑"  or  名称 == "羽灵神_幽冥白虎_奔跑"   then
		return   0x30000176
elseif 名称 == "巨魔王_幽冥白虎_站立"  then
		return   0x30000177
elseif  名称 == "巨魔王_幽冥白虎_奔跑" then
		return   0x30000178
elseif 名称 == "虎头怪_幽冥白虎_站立"  then
		return   0x30000173
elseif  名称 == "虎头怪_幽冥白虎_奔跑" then
		return   0x30000174
elseif 名称 == "飞燕女_幽冥白虎_站立" or 名称 == "骨精灵_幽冥白虎_站立" or 名称 == "鬼潇潇_幽冥白虎_站立" or 名称 == "狐美人_幽冥白虎_站立" or 名称 == "桃夭夭_幽冥白虎_站立" or 名称 == "巫蛮儿_幽冥白虎_站立" or 名称 == "舞天姬_幽冥白虎_站立" or 名称 == "玄彩娥_幽冥白虎_站立" or 名称 == "英女侠_幽冥白虎_站立"  then
		return   0x30000165
elseif 名称 == "飞燕女_幽冥白虎_奔跑" or 名称 == "骨精灵_幽冥白虎_奔跑" or 名称 == "鬼潇潇_幽冥白虎_奔跑" or 名称 == "狐美人_幽冥白虎_奔跑" or 名称 == "桃夭夭_幽冥白虎_奔跑" or 名称 == "巫蛮儿_幽冥白虎_奔跑" or 名称 == "舞天姬_幽冥白虎_奔跑" or 名称 == "玄彩娥_幽冥白虎_奔跑" or 名称 == "英女侠_幽冥白虎_奔跑"  then
		return   0x30000166

elseif 名称 == "剑侠客_月影豹_站立" or 名称 == "龙太子_月影豹_站立"  or  名称 == "杀破狼_月影豹_站立" or 名称 == "神天兵_月影豹_站立"  or  名称 == "逍遥生_月影豹_站立"  or  名称 == "偃无师_月影豹_站立"  or  名称 == "羽灵神_月影豹_站立"   then
		return   0x30303012
elseif 名称 == "剑侠客_月影豹_奔跑" or 名称 == "龙太子_月影豹_奔跑"  or  名称 == "杀破狼_月影豹_奔跑" or 名称 == "神天兵_月影豹_奔跑"  or  名称 == "逍遥生_月影豹_奔跑"  or  名称 == "偃无师_月影豹_奔跑"  or  名称 == "羽灵神_月影豹_奔跑"   then
		return   0x30303013
elseif 名称 == "巨魔王_月影豹_站立"  then
		return   0x30303117
elseif  名称 == "巨魔王_月影豹_奔跑" then
		return   0x30303116
elseif 名称 == "虎头怪_月影豹_站立"  then
		return   0x30303014
elseif  名称 == "虎头怪_月影豹_奔跑" then
		return   0x30303019
elseif 名称 == "飞燕女_月影豹_站立" or 名称 == "骨精灵_月影豹_站立" or 名称 == "鬼潇潇_月影豹_站立" or 名称 == "狐美人_月影豹_站立" or 名称 == "桃夭夭_月影豹_站立" or 名称 == "巫蛮儿_月影豹_站立" or 名称 == "舞天姬_月影豹_站立" or 名称 == "玄彩娥_月影豹_站立" or 名称 == "英女侠_月影豹_站立"  then
		return   0x30303018
elseif 名称 == "飞燕女_月影豹_奔跑" or 名称 == "骨精灵_月影豹_奔跑" or 名称 == "鬼潇潇_月影豹_奔跑" or 名称 == "狐美人_月影豹_奔跑" or 名称 == "桃夭夭_月影豹_奔跑" or 名称 == "巫蛮儿_月影豹_奔跑" or 名称 == "舞天姬_月影豹_奔跑" or 名称 == "玄彩娥_月影豹_奔跑" or 名称 == "英女侠_月影豹_奔跑"  then
		return   0x30303015

elseif 名称 == "剑侠客_万年异兽_站立" or 名称 == "龙太子_万年异兽_站立"  or  名称 == "杀破狼_万年异兽_站立" or 名称 == "神天兵_万年异兽_站立"  or  名称 == "逍遥生_万年异兽_站立"  or  名称 == "偃无师_万年异兽_站立"  or  名称 == "羽灵神_万年异兽_站立"   then
		return   0x30303027
elseif 名称 == "剑侠客_万年异兽_奔跑" or 名称 == "龙太子_万年异兽_奔跑"  or  名称 == "杀破狼_万年异兽_奔跑" or 名称 == "神天兵_万年异兽_奔跑"  or  名称 == "逍遥生_万年异兽_奔跑"  or  名称 == "偃无师_万年异兽_奔跑"  or  名称 == "羽灵神_万年异兽_奔跑"   then
		return   0x30303026
elseif 名称 == "巨魔王_万年异兽_站立"  then
		return   0x30303021
elseif  名称 == "巨魔王_万年异兽_奔跑" then
		return   0x30303020
elseif 名称 == "虎头怪_万年异兽_站立"  then
		return   0x30303024
elseif  名称 == "虎头怪_万年异兽_奔跑" then
		return   0x30303023
elseif 名称 == "飞燕女_万年异兽_站立" or 名称 == "骨精灵_万年异兽_站立" or 名称 == "鬼潇潇_万年异兽_站立" or 名称 == "狐美人_万年异兽_站立" or 名称 == "桃夭夭_万年异兽_站立" or 名称 == "巫蛮儿_万年异兽_站立" or 名称 == "舞天姬_万年异兽_站立" or 名称 == "玄彩娥_万年异兽_站立" or 名称 == "英女侠_万年异兽_站立"  then
		return   0x30303025
elseif 名称 == "飞燕女_万年异兽_奔跑" or 名称 == "骨精灵_万年异兽_奔跑" or 名称 == "鬼潇潇_万年异兽_奔跑" or 名称 == "狐美人_万年异兽_奔跑" or 名称 == "桃夭夭_万年异兽_奔跑" or 名称 == "巫蛮儿_万年异兽_奔跑" or 名称 == "舞天姬_万年异兽_奔跑" or 名称 == "玄彩娥_万年异兽_奔跑" or 名称 == "英女侠_万年异兽_奔跑"  then
		return   0x30303022


--------------------------------------------------
elseif 名称 == "剑侠客_祥瑞套装1_站立" or 名称 == "龙太子_祥瑞套装1_站立"  or  名称 == "杀破狼_祥瑞套装1_站立" or 名称 == "神天兵_祥瑞套装1_站立"  or  名称 == "逍遥生_祥瑞套装1_站立"  or  名称 == "偃无师_祥瑞套装1_站立"  or  名称 == "羽灵神_祥瑞套装1_站立" then
		return  0x00300105
elseif 名称 == "剑侠客_祥瑞套装1_奔跑" or 名称 == "龙太子_祥瑞套装1_奔跑"  or  名称 == "杀破狼_祥瑞套装1_奔跑" or 名称 == "神天兵_祥瑞套装1_奔跑"  or  名称 == "逍遥生_祥瑞套装1_奔跑"  or  名称 == "偃无师_祥瑞套装1_奔跑"  or  名称 == "羽灵神_祥瑞套装1_奔跑" then
		return  0x00300104
elseif 名称 == "巨魔王_祥瑞套装1_站立" then
			return 0x30303068
elseif 名称 == "巨魔王_祥瑞套装1_奔跑" then
			return 0x30303069
elseif 名称 == "虎头怪_祥瑞套装1_站立" then
			return 0x30303066
elseif 名称 == "虎头怪_祥瑞套装1_奔跑" then
			return 0x30303067
elseif 名称 == "飞燕女_祥瑞套装1_站立" or 名称 == "骨精灵_祥瑞套装1_站立" or 名称 == "鬼潇潇_祥瑞套装1_站立" or 名称 == "狐美人_祥瑞套装1_站立" or 名称 == "桃夭夭_祥瑞套装1_站立" or 名称 == "巫蛮儿_祥瑞套装1_站立" or 名称 == "舞天姬_祥瑞套装1_站立" or 名称 == "玄彩娥_祥瑞套装1_站立" or 名称 == "英女侠_祥瑞套装1_站立"  then
			return 0x0030010B
elseif 名称 == "飞燕女_祥瑞套装1_奔跑" or 名称 == "骨精灵_祥瑞套装1_奔跑" or 名称 == "鬼潇潇_祥瑞套装1_奔跑" or 名称 == "狐美人_祥瑞套装1_奔跑" or 名称 == "桃夭夭_祥瑞套装1_奔跑" or 名称 == "巫蛮儿_祥瑞套装1_奔跑" or 名称 == "舞天姬_祥瑞套装1_奔跑" or 名称 == "玄彩娥_祥瑞套装1_奔跑" or 名称 == "英女侠_祥瑞套装1_奔跑"  then
			return 0x00300103
--------------------------------------------------
elseif 名称 == "剑侠客_祥瑞套装2_站立" or 名称 == "龙太子_祥瑞套装2_站立"  or  名称 == "杀破狼_祥瑞套装2_站立" or 名称 == "神天兵_祥瑞套装2_站立"  or  名称 == "逍遥生_祥瑞套装2_站立"  or  名称 == "偃无师_祥瑞套装2_站立"  or  名称 == "羽灵神_祥瑞套装2_站立" or 名称 == "巨魔王_祥瑞套装2_站立" or 名称 == "虎头怪_祥瑞套装2_站立"  then
		return   0x00300100
elseif 名称 == "剑侠客_祥瑞套装2_奔跑" or 名称 == "龙太子_祥瑞套装2_奔跑"  or  名称 == "杀破狼_祥瑞套装2_奔跑" or 名称 == "神天兵_祥瑞套装2_奔跑"  or  名称 == "逍遥生_祥瑞套装2_奔跑"  or  名称 == "偃无师_祥瑞套装2_奔跑"  or  名称 == "羽灵神_祥瑞套装2_奔跑" or 名称 == "巨魔王_祥瑞套装2_奔跑" or 名称 == "虎头怪_祥瑞套装2_奔跑"  then
		return  0x0030010A
elseif 名称 == "飞燕女_祥瑞套装2_站立" or 名称 == "骨精灵_祥瑞套装2_站立" or 名称 == "鬼潇潇_祥瑞套装2_站立" or 名称 == "狐美人_祥瑞套装2_站立" or 名称 == "桃夭夭_祥瑞套装2_站立" or 名称 == "巫蛮儿_祥瑞套装2_站立" or 名称 == "舞天姬_祥瑞套装2_站立" or 名称 == "玄彩娥_祥瑞套装2_站立" or 名称 == "英女侠_祥瑞套装2_站立"  then
			return 0x30303018
elseif 名称 == "飞燕女_祥瑞套装2_奔跑" or 名称 == "骨精灵_祥瑞套装2_奔跑" or 名称 == "鬼潇潇_祥瑞套装2_奔跑" or 名称 == "狐美人_祥瑞套装2_奔跑" or 名称 == "桃夭夭_祥瑞套装2_奔跑" or 名称 == "巫蛮儿_祥瑞套装2_奔跑" or 名称 == "舞天姬_祥瑞套装2_奔跑" or 名称 == "玄彩娥_祥瑞套装2_奔跑" or 名称 == "英女侠_祥瑞套装2_奔跑"  then
			return 0x30303019
--------------------------------------------------
elseif 名称 == "剑侠客_祥瑞套装3_站立" or 名称 == "龙太子_祥瑞套装3_站立"  or  名称 == "杀破狼_祥瑞套装3_站立" or 名称 == "神天兵_祥瑞套装3_站立"  or  名称 == "逍遥生_祥瑞套装3_站立"  or  名称 == "偃无师_祥瑞套装3_站立"  or  名称 == "羽灵神_祥瑞套装3_站立" or 名称 == "巨魔王_祥瑞套装3_站立" or 名称 == "虎头怪_祥瑞套装3_站立"  then
		return   0x02010223
elseif 名称 == "剑侠客_祥瑞套装3_奔跑" or 名称 == "龙太子_祥瑞套装3_奔跑"  or  名称 == "杀破狼_祥瑞套装3_奔跑" or 名称 == "神天兵_祥瑞套装3_奔跑"  or  名称 == "逍遥生_祥瑞套装3_奔跑"  or  名称 == "偃无师_祥瑞套装3_奔跑"  or  名称 == "羽灵神_祥瑞套装3_奔跑" or 名称 == "巨魔王_祥瑞套装3_奔跑" or 名称 == "虎头怪_祥瑞套装3_奔跑"  then
		return  0x02010224
elseif 名称 == "飞燕女_祥瑞套装3_站立" or 名称 == "骨精灵_祥瑞套装3_站立" or 名称 == "鬼潇潇_祥瑞套装3_站立" or 名称 == "狐美人_祥瑞套装3_站立" or 名称 == "桃夭夭_祥瑞套装3_站立" or 名称 == "巫蛮儿_祥瑞套装3_站立" or 名称 == "舞天姬_祥瑞套装3_站立" or 名称 == "玄彩娥_祥瑞套装3_站立" or 名称 == "英女侠_祥瑞套装3_站立"  then
			return 0x30303020
elseif 名称 == "飞燕女_祥瑞套装3_奔跑" or 名称 == "骨精灵_祥瑞套装3_奔跑" or 名称 == "鬼潇潇_祥瑞套装3_奔跑" or 名称 == "狐美人_祥瑞套装3_奔跑" or 名称 == "桃夭夭_祥瑞套装3_奔跑" or 名称 == "巫蛮儿_祥瑞套装3_奔跑" or 名称 == "舞天姬_祥瑞套装3_奔跑" or 名称 == "玄彩娥_祥瑞套装3_奔跑" or 名称 == "英女侠_祥瑞套装3_奔跑"  then
			return 0x30303021
--------------------------------------------------
elseif 名称 == "剑侠客_祥瑞套装4_站立" or 名称 == "龙太子_祥瑞套装4_站立"  or  名称 == "杀破狼_祥瑞套装4_站立" or 名称 == "神天兵_祥瑞套装4_站立"  or  名称 == "逍遥生_祥瑞套装4_站立"  or  名称 == "偃无师_祥瑞套装4_站立"  or  名称 == "羽灵神_祥瑞套装4_站立" or 名称 == "巨魔王_祥瑞套装4_站立" or 名称 == "虎头怪_祥瑞套装4_站立"  then
		return   0x30303002
elseif 名称 == "剑侠客_祥瑞套装4_奔跑" or 名称 == "龙太子_祥瑞套装4_奔跑"  or  名称 == "杀破狼_祥瑞套装4_奔跑" or 名称 == "神天兵_祥瑞套装4_奔跑"  or  名称 == "逍遥生_祥瑞套装4_奔跑"  or  名称 == "偃无师_祥瑞套装4_奔跑"  or  名称 == "羽灵神_祥瑞套装4_奔跑" or 名称 == "巨魔王_祥瑞套装4_奔跑" or 名称 == "虎头怪_祥瑞套装4_奔跑"  then
		return  0x30303003
elseif 名称 == "飞燕女_祥瑞套装4_站立" or 名称 == "骨精灵_祥瑞套装4_站立" or 名称 == "鬼潇潇_祥瑞套装4_站立" or 名称 == "狐美人_祥瑞套装4_站立" or 名称 == "桃夭夭_祥瑞套装4_站立" or 名称 == "巫蛮儿_祥瑞套装4_站立" or 名称 == "舞天姬_祥瑞套装4_站立" or 名称 == "玄彩娥_祥瑞套装4_站立" or 名称 == "英女侠_祥瑞套装4_站立"  then
			return 0x30303024
elseif 名称 == "飞燕女_祥瑞套装4_奔跑" or 名称 == "骨精灵_祥瑞套装4_奔跑" or 名称 == "鬼潇潇_祥瑞套装4_奔跑" or 名称 == "狐美人_祥瑞套装4_奔跑" or 名称 == "桃夭夭_祥瑞套装4_奔跑" or 名称 == "巫蛮儿_祥瑞套装4_奔跑" or 名称 == "舞天姬_祥瑞套装4_奔跑" or 名称 == "玄彩娥_祥瑞套装4_奔跑" or 名称 == "英女侠_祥瑞套装4_奔跑"  then
			return 0x30303025
--------------------------------------------------
elseif 名称 == "剑侠客_祥瑞套装5_站立" or 名称 == "龙太子_祥瑞套装5_站立"  or  名称 == "杀破狼_祥瑞套装5_站立" or 名称 == "神天兵_祥瑞套装5_站立"  or  名称 == "逍遥生_祥瑞套装5_站立"  or  名称 == "偃无师_祥瑞套装5_站立"  or  名称 == "羽灵神_祥瑞套装5_站立" or 名称 == "巨魔王_祥瑞套装5_站立" or 名称 == "虎头怪_祥瑞套装5_站立"  then
		return   0x30303064
elseif 名称 == "剑侠客_祥瑞套装5_奔跑" or 名称 == "龙太子_祥瑞套装5_奔跑"  or  名称 == "杀破狼_祥瑞套装5_奔跑" or 名称 == "神天兵_祥瑞套装5_奔跑"  or  名称 == "逍遥生_祥瑞套装5_奔跑"  or  名称 == "偃无师_祥瑞套装5_奔跑"  or  名称 == "羽灵神_祥瑞套装5_奔跑" or 名称 == "巨魔王_祥瑞套装5_奔跑" or 名称 == "虎头怪_祥瑞套装5_奔跑"  then
		return  0x30303065
elseif 名称 == "飞燕女_祥瑞套装5_站立" or 名称 == "骨精灵_祥瑞套装5_站立" or 名称 == "鬼潇潇_祥瑞套装5_站立" or 名称 == "狐美人_祥瑞套装5_站立" or 名称 == "桃夭夭_祥瑞套装5_站立" or 名称 == "巫蛮儿_祥瑞套装5_站立" or 名称 == "舞天姬_祥瑞套装5_站立" or 名称 == "玄彩娥_祥瑞套装5_站立" or 名称 == "英女侠_祥瑞套装5_站立"  then
			return 0x30303036
elseif 名称 == "飞燕女_祥瑞套装5_奔跑" or 名称 == "骨精灵_祥瑞套装5_奔跑" or 名称 == "鬼潇潇_祥瑞套装5_奔跑" or 名称 == "狐美人_祥瑞套装5_奔跑" or 名称 == "桃夭夭_祥瑞套装5_奔跑" or 名称 == "巫蛮儿_祥瑞套装5_奔跑" or 名称 == "舞天姬_祥瑞套装5_奔跑" or 名称 == "玄彩娥_祥瑞套装5_奔跑" or 名称 == "英女侠_祥瑞套装5_奔跑"  then
			return 0x30303037
--------------------------------------------------
elseif 名称 == "剑侠客_祥瑞套装6_站立" or 名称 == "龙太子_祥瑞套装6_站立"  or  名称 == "杀破狼_祥瑞套装6_站立" or 名称 == "神天兵_祥瑞套装6_站立"  or  名称 == "逍遥生_祥瑞套装6_站立"  or  名称 == "偃无师_祥瑞套装6_站立"  or  名称 == "羽灵神_祥瑞套装6_站立" or 名称 == "巨魔王_祥瑞套装6_站立" or 名称 == "虎头怪_祥瑞套装6_站立"  then
		return   0x30303052
elseif 名称 == "剑侠客_祥瑞套装6_奔跑" or 名称 == "龙太子_祥瑞套装6_奔跑"  or  名称 == "杀破狼_祥瑞套装6_奔跑" or 名称 == "神天兵_祥瑞套装6_奔跑"  or  名称 == "逍遥生_祥瑞套装6_奔跑"  or  名称 == "偃无师_祥瑞套装6_奔跑"  or  名称 == "羽灵神_祥瑞套装6_奔跑" or 名称 == "巨魔王_祥瑞套装6_奔跑" or 名称 == "虎头怪_祥瑞套装6_奔跑"  then
		return  0x30303053
elseif 名称 == "飞燕女_祥瑞套装6_站立" or 名称 == "骨精灵_祥瑞套装6_站立" or 名称 == "鬼潇潇_祥瑞套装6_站立" or 名称 == "狐美人_祥瑞套装6_站立" or 名称 == "桃夭夭_祥瑞套装6_站立" or 名称 == "巫蛮儿_祥瑞套装6_站立" or 名称 == "舞天姬_祥瑞套装6_站立" or 名称 == "玄彩娥_祥瑞套装6_站立" or 名称 == "英女侠_祥瑞套装6_站立"  then
			return 0x30303038
elseif 名称 == "飞燕女_祥瑞套装6_奔跑" or 名称 == "骨精灵_祥瑞套装6_奔跑" or 名称 == "鬼潇潇_祥瑞套装6_奔跑" or 名称 == "狐美人_祥瑞套装6_奔跑" or 名称 == "桃夭夭_祥瑞套装6_奔跑" or 名称 == "巫蛮儿_祥瑞套装6_奔跑" or 名称 == "舞天姬_祥瑞套装6_奔跑" or 名称 == "玄彩娥_祥瑞套装6_奔跑" or 名称 == "英女侠_祥瑞套装6_奔跑"  then
			return 0x30303039
--------------------------------------------------
elseif 名称 == "剑侠客_祥瑞套装7_站立" or 名称 == "龙太子_祥瑞套装7_站立"  or  名称 == "杀破狼_祥瑞套装7_站立" or 名称 == "神天兵_祥瑞套装7_站立"  or  名称 == "逍遥生_祥瑞套装7_站立"  or  名称 == "偃无师_祥瑞套装7_站立"  or  名称 == "羽灵神_祥瑞套装7_站立" or 名称 == "巨魔王_祥瑞套装7_站立" or 名称 == "虎头怪_祥瑞套装7_站立"  then
		return   0x30303028
elseif 名称 == "剑侠客_祥瑞套装7_奔跑" or 名称 == "龙太子_祥瑞套装7_奔跑"  or  名称 == "杀破狼_祥瑞套装7_奔跑" or 名称 == "神天兵_祥瑞套装7_奔跑"  or  名称 == "逍遥生_祥瑞套装7_奔跑"  or  名称 == "偃无师_祥瑞套装7_奔跑"  or  名称 == "羽灵神_祥瑞套装7_奔跑" or 名称 == "巨魔王_祥瑞套装7_奔跑" or 名称 == "虎头怪_祥瑞套装7_奔跑"  then
		return  0x30303029
elseif 名称 == "飞燕女_祥瑞套装7_站立" or 名称 == "骨精灵_祥瑞套装7_站立" or 名称 == "鬼潇潇_祥瑞套装7_站立" or 名称 == "狐美人_祥瑞套装7_站立" or 名称 == "桃夭夭_祥瑞套装7_站立" or 名称 == "巫蛮儿_祥瑞套装7_站立" or 名称 == "舞天姬_祥瑞套装7_站立" or 名称 == "玄彩娥_祥瑞套装7_站立" or 名称 == "英女侠_祥瑞套装7_站立"  then
			return 0x30303042
elseif 名称 == "飞燕女_祥瑞套装7_奔跑" or 名称 == "骨精灵_祥瑞套装7_奔跑" or 名称 == "鬼潇潇_祥瑞套装7_奔跑" or 名称 == "狐美人_祥瑞套装7_奔跑" or 名称 == "桃夭夭_祥瑞套装7_奔跑" or 名称 == "巫蛮儿_祥瑞套装7_奔跑" or 名称 == "舞天姬_祥瑞套装7_奔跑" or 名称 == "玄彩娥_祥瑞套装7_奔跑" or 名称 == "英女侠_祥瑞套装7_奔跑"  then
			return 0x30303043
--------------------------------------------------
elseif 名称 == "剑侠客_祥瑞套装8_站立" or 名称 == "龙太子_祥瑞套装8_站立"  or  名称 == "杀破狼_祥瑞套装8_站立" or 名称 == "神天兵_祥瑞套装8_站立"  or  名称 == "逍遥生_祥瑞套装8_站立"  or  名称 == "偃无师_祥瑞套装8_站立"  or  名称 == "羽灵神_祥瑞套装8_站立" or 名称 == "巨魔王_祥瑞套装8_站立" or 名称 == "虎头怪_祥瑞套装8_站立"  then
		return   0x30303054
elseif 名称 == "剑侠客_祥瑞套装8_奔跑" or 名称 == "龙太子_祥瑞套装8_奔跑"  or  名称 == "杀破狼_祥瑞套装8_奔跑" or 名称 == "神天兵_祥瑞套装8_奔跑"  or  名称 == "逍遥生_祥瑞套装8_奔跑"  or  名称 == "偃无师_祥瑞套装8_奔跑"  or  名称 == "羽灵神_祥瑞套装8_奔跑" or 名称 == "巨魔王_祥瑞套装8_奔跑" or 名称 == "虎头怪_祥瑞套装8_奔跑"  then
		return  0x30303055
elseif 名称 == "飞燕女_祥瑞套装8_站立" or 名称 == "骨精灵_祥瑞套装8_站立" or 名称 == "鬼潇潇_祥瑞套装8_站立" or 名称 == "狐美人_祥瑞套装8_站立" or 名称 == "桃夭夭_祥瑞套装8_站立" or 名称 == "巫蛮儿_祥瑞套装8_站立" or 名称 == "舞天姬_祥瑞套装8_站立" or 名称 == "玄彩娥_祥瑞套装8_站立" or 名称 == "英女侠_祥瑞套装8_站立"  then
			return 0x30303048
elseif 名称 == "飞燕女_祥瑞套装8_奔跑" or 名称 == "骨精灵_祥瑞套装8_奔跑" or 名称 == "鬼潇潇_祥瑞套装8_奔跑" or 名称 == "狐美人_祥瑞套装8_奔跑" or 名称 == "桃夭夭_祥瑞套装8_奔跑" or 名称 == "巫蛮儿_祥瑞套装8_奔跑" or 名称 == "舞天姬_祥瑞套装8_奔跑" or 名称 == "玄彩娥_祥瑞套装8_奔跑" or 名称 == "英女侠_祥瑞套装8_奔跑"  then
			return 0x30303049
--------------------------------------------------
elseif 名称 == "剑侠客_祥瑞套装9_站立" or 名称 == "龙太子_祥瑞套装9_站立"  or  名称 == "杀破狼_祥瑞套装9_站立" or 名称 == "神天兵_祥瑞套装9_站立"  or  名称 == "逍遥生_祥瑞套装9_站立"  or  名称 == "偃无师_祥瑞套装9_站立"  or  名称 == "羽灵神_祥瑞套装9_站立" or 名称 == "巨魔王_祥瑞套装9_站立" or 名称 == "虎头怪_祥瑞套装9_站立"  then
		return   0x30303014
elseif 名称 == "剑侠客_祥瑞套装9_奔跑" or 名称 == "龙太子_祥瑞套装9_奔跑"  or  名称 == "杀破狼_祥瑞套装9_奔跑" or 名称 == "神天兵_祥瑞套装9_奔跑"  or  名称 == "逍遥生_祥瑞套装9_奔跑"  or  名称 == "偃无师_祥瑞套装9_奔跑"  or  名称 == "羽灵神_祥瑞套装9_奔跑" or 名称 == "巨魔王_祥瑞套装9_奔跑" or 名称 == "虎头怪_祥瑞套装9_奔跑"  then
		return  0x30303015
elseif 名称 == "飞燕女_祥瑞套装9_站立" or 名称 == "骨精灵_祥瑞套装9_站立" or 名称 == "鬼潇潇_祥瑞套装9_站立" or 名称 == "狐美人_祥瑞套装9_站立" or 名称 == "桃夭夭_祥瑞套装9_站立" or 名称 == "巫蛮儿_祥瑞套装9_站立" or 名称 == "舞天姬_祥瑞套装9_站立" or 名称 == "玄彩娥_祥瑞套装9_站立" or 名称 == "英女侠_祥瑞套装9_站立"  then
			return 0x30303010
elseif 名称 == "飞燕女_祥瑞套装9_奔跑" or 名称 == "骨精灵_祥瑞套装9_奔跑" or 名称 == "鬼潇潇_祥瑞套装9_奔跑" or 名称 == "狐美人_祥瑞套装9_奔跑" or 名称 == "桃夭夭_祥瑞套装9_奔跑" or 名称 == "巫蛮儿_祥瑞套装9_奔跑" or 名称 == "舞天姬_祥瑞套装9_奔跑" or 名称 == "玄彩娥_祥瑞套装9_奔跑" or 名称 == "英女侠_祥瑞套装9_奔跑"  then
			return 0x30303011
-------------------------------------------------- 男女公用
elseif 名称 == "剑侠客_祥瑞套装10_站立" or 名称 == "龙太子_祥瑞套装10_站立"  or  名称 == "杀破狼_祥瑞套装10_站立" or 名称 == "神天兵_祥瑞套装10_站立"  or  名称 == "逍遥生_祥瑞套装10_站立"  or  名称 == "偃无师_祥瑞套装10_站立"  or  名称 == "羽灵神_祥瑞套装10_站立" or 名称 == "巨魔王_祥瑞套装10_站立" or 名称 == "虎头怪_祥瑞套装10_站立"  or 名称 == "飞燕女_祥瑞套装10_站立" or 名称 == "骨精灵_祥瑞套装10_站立" or 名称 == "鬼潇潇_祥瑞套装10_站立" or 名称 == "狐美人_祥瑞套装10_站立" or 名称 == "桃夭夭_祥瑞套装10_站立" or 名称 == "巫蛮儿_祥瑞套装10_站立" or 名称 == "舞天姬_祥瑞套装10_站立" or 名称 == "玄彩娥_祥瑞套装10_站立" or 名称 == "英女侠_祥瑞套装10_站立" then
		return   0x30303026
elseif 名称 == "剑侠客_祥瑞套装10_奔跑" or 名称 == "龙太子_祥瑞套装10_奔跑"  or  名称 == "杀破狼_祥瑞套装10_奔跑" or 名称 == "神天兵_祥瑞套装10_奔跑"  or  名称 == "逍遥生_祥瑞套装10_奔跑"  or  名称 == "偃无师_祥瑞套装10_奔跑"  or  名称 == "羽灵神_祥瑞套装10_奔跑" or 名称 == "巨魔王_祥瑞套装10_奔跑" or 名称 == "虎头怪_祥瑞套装10_奔跑"  or 名称 == "飞燕女_祥瑞套装10_奔跑" or 名称 == "骨精灵_祥瑞套装10_奔跑" or 名称 == "鬼潇潇_祥瑞套装10_奔跑" or 名称 == "狐美人_祥瑞套装10_奔跑" or 名称 == "桃夭夭_祥瑞套装10_奔跑" or 名称 == "巫蛮儿_祥瑞套装10_奔跑" or 名称 == "舞天姬_祥瑞套装10_奔跑" or 名称 == "玄彩娥_祥瑞套装10_奔跑" or 名称 == "英女侠_祥瑞套装10_奔跑" then
		return  0x30303027
-------------------------------------------------- 男女公用
elseif 名称 == "剑侠客_祥瑞套装11_站立" or 名称 == "龙太子_祥瑞套装11_站立"  or  名称 == "杀破狼_祥瑞套装11_站立" or 名称 == "神天兵_祥瑞套装11_站立"  or  名称 == "逍遥生_祥瑞套装11_站立"  or  名称 == "偃无师_祥瑞套装11_站立"  or  名称 == "羽灵神_祥瑞套装11_站立" or 名称 == "巨魔王_祥瑞套装11_站立" or 名称 == "虎头怪_祥瑞套装11_站立"  or  名称 == "飞燕女_祥瑞套装11_站立" or 名称 == "骨精灵_祥瑞套装11_站立" or 名称 == "鬼潇潇_祥瑞套装11_站立" or 名称 == "狐美人_祥瑞套装11_站立" or 名称 == "桃夭夭_祥瑞套装11_站立" or 名称 == "巫蛮儿_祥瑞套装11_站立" or 名称 == "舞天姬_祥瑞套装11_站立" or 名称 == "玄彩娥_祥瑞套装11_站立" or 名称 == "英女侠_祥瑞套装11_站立"  then
		return   0x30303012
elseif 名称 == "剑侠客_祥瑞套装11_奔跑" or 名称 == "龙太子_祥瑞套装11_奔跑"  or  名称 == "杀破狼_祥瑞套装11_奔跑" or 名称 == "神天兵_祥瑞套装11_奔跑"  or  名称 == "逍遥生_祥瑞套装11_奔跑"  or  名称 == "偃无师_祥瑞套装11_奔跑"  or  名称 == "羽灵神_祥瑞套装11_奔跑" or 名称 == "巨魔王_祥瑞套装11_奔跑" or 名称 == "虎头怪_祥瑞套装11_奔跑"  or 名称 == "飞燕女_祥瑞套装11_奔跑" or 名称 == "骨精灵_祥瑞套装11_奔跑" or 名称 == "鬼潇潇_祥瑞套装11_奔跑" or 名称 == "狐美人_祥瑞套装11_奔跑" or 名称 == "桃夭夭_祥瑞套装11_奔跑" or 名称 == "巫蛮儿_祥瑞套装11_奔跑" or 名称 == "舞天姬_祥瑞套装11_奔跑" or 名称 == "玄彩娥_祥瑞套装11_奔跑" or 名称 == "英女侠_祥瑞套装11_奔跑"  then
		return  0x30303013
-------------------------------------------------- 男女公用
elseif 名称 == "剑侠客_祥瑞套装12_站立" or 名称 == "龙太子_祥瑞套装12_站立"  or  名称 == "杀破狼_祥瑞套装12_站立" or 名称 == "神天兵_祥瑞套装12_站立"  or  名称 == "逍遥生_祥瑞套装12_站立"  or  名称 == "偃无师_祥瑞套装12_站立"  or  名称 == "羽灵神_祥瑞套装12_站立" or 名称 == "巨魔王_祥瑞套装12_站立" or 名称 == "虎头怪_祥瑞套装12_站立"  or  名称 == "飞燕女_祥瑞套装12_站立" or 名称 == "骨精灵_祥瑞套装12_站立" or 名称 == "鬼潇潇_祥瑞套装12_站立" or 名称 == "狐美人_祥瑞套装12_站立" or 名称 == "桃夭夭_祥瑞套装12_站立" or 名称 == "巫蛮儿_祥瑞套装12_站立" or 名称 == "舞天姬_祥瑞套装12_站立" or 名称 == "玄彩娥_祥瑞套装12_站立" or 名称 == "英女侠_祥瑞套装12_站立"  then
		return   0x02010225
elseif 名称 == "剑侠客_祥瑞套装12_奔跑" or 名称 == "龙太子_祥瑞套装12_奔跑"  or  名称 == "杀破狼_祥瑞套装12_奔跑" or 名称 == "神天兵_祥瑞套装12_奔跑"  or  名称 == "逍遥生_祥瑞套装12_奔跑"  or  名称 == "偃无师_祥瑞套装12_奔跑"  or  名称 == "羽灵神_祥瑞套装12_奔跑" or 名称 == "巨魔王_祥瑞套装12_奔跑" or 名称 == "虎头怪_祥瑞套装12_奔跑"  or 名称 == "飞燕女_祥瑞套装12_奔跑" or 名称 == "骨精灵_祥瑞套装12_奔跑" or 名称 == "鬼潇潇_祥瑞套装12_奔跑" or 名称 == "狐美人_祥瑞套装12_奔跑" or 名称 == "桃夭夭_祥瑞套装12_奔跑" or 名称 == "巫蛮儿_祥瑞套装12_奔跑" or 名称 == "舞天姬_祥瑞套装12_奔跑" or 名称 == "玄彩娥_祥瑞套装12_奔跑" or 名称 == "英女侠_祥瑞套装12_奔跑"  then
		return  0x02010226
-------------------------------------------------- 男女公用
elseif 名称 == "剑侠客_祥瑞套装13_站立" or 名称 == "龙太子_祥瑞套装13_站立"  or  名称 == "杀破狼_祥瑞套装13_站立" or 名称 == "神天兵_祥瑞套装13_站立"  or  名称 == "逍遥生_祥瑞套装13_站立"  or  名称 == "偃无师_祥瑞套装13_站立"  or  名称 == "羽灵神_祥瑞套装13_站立" or 名称 == "巨魔王_祥瑞套装13_站立" or 名称 == "虎头怪_祥瑞套装13_站立"  or  名称 == "飞燕女_祥瑞套装13_站立" or 名称 == "骨精灵_祥瑞套装13_站立" or 名称 == "鬼潇潇_祥瑞套装13_站立" or 名称 == "狐美人_祥瑞套装13_站立" or 名称 == "桃夭夭_祥瑞套装13_站立" or 名称 == "巫蛮儿_祥瑞套装13_站立" or 名称 == "舞天姬_祥瑞套装13_站立" or 名称 == "玄彩娥_祥瑞套装13_站立" or 名称 == "英女侠_祥瑞套装13_站立"  then
		return   0x02010221
elseif 名称 == "剑侠客_祥瑞套装13_奔跑" or 名称 == "龙太子_祥瑞套装13_奔跑"  or  名称 == "杀破狼_祥瑞套装13_奔跑" or 名称 == "神天兵_祥瑞套装13_奔跑"  or  名称 == "逍遥生_祥瑞套装13_奔跑"  or  名称 == "偃无师_祥瑞套装13_奔跑"  or  名称 == "羽灵神_祥瑞套装13_奔跑" or 名称 == "巨魔王_祥瑞套装13_奔跑" or 名称 == "虎头怪_祥瑞套装13_奔跑"  or 名称 == "飞燕女_祥瑞套装13_奔跑" or 名称 == "骨精灵_祥瑞套装13_奔跑" or 名称 == "鬼潇潇_祥瑞套装13_奔跑" or 名称 == "狐美人_祥瑞套装13_奔跑" or 名称 == "桃夭夭_祥瑞套装13_奔跑" or 名称 == "巫蛮儿_祥瑞套装13_奔跑" or 名称 == "舞天姬_祥瑞套装13_奔跑" or 名称 == "玄彩娥_祥瑞套装13_奔跑" or 名称 == "英女侠_祥瑞套装13_奔跑"  then
		return  0x02010222
-------------------------------------------------- 男女公用
elseif 名称 == "剑侠客_祥瑞套装14_站立" or 名称 == "龙太子_祥瑞套装14_站立"  or  名称 == "杀破狼_祥瑞套装14_站立" or 名称 == "神天兵_祥瑞套装14_站立"  or  名称 == "逍遥生_祥瑞套装14_站立"  or  名称 == "偃无师_祥瑞套装14_站立"  or  名称 == "羽灵神_祥瑞套装14_站立" or 名称 == "巨魔王_祥瑞套装14_站立" or 名称 == "虎头怪_祥瑞套装14_站立"  or  名称 == "飞燕女_祥瑞套装14_站立" or 名称 == "骨精灵_祥瑞套装14_站立" or 名称 == "鬼潇潇_祥瑞套装14_站立" or 名称 == "狐美人_祥瑞套装14_站立" or 名称 == "桃夭夭_祥瑞套装14_站立" or 名称 == "巫蛮儿_祥瑞套装14_站立" or 名称 == "舞天姬_祥瑞套装14_站立" or 名称 == "玄彩娥_祥瑞套装14_站立" or 名称 == "英女侠_祥瑞套装14_站立"  then
		return   0x00300501
elseif 名称 == "剑侠客_祥瑞套装14_奔跑" or 名称 == "龙太子_祥瑞套装14_奔跑"  or  名称 == "杀破狼_祥瑞套装14_奔跑" or 名称 == "神天兵_祥瑞套装14_奔跑"  or  名称 == "逍遥生_祥瑞套装14_奔跑"  or  名称 == "偃无师_祥瑞套装14_奔跑"  or  名称 == "羽灵神_祥瑞套装14_奔跑" or 名称 == "巨魔王_祥瑞套装14_奔跑" or 名称 == "虎头怪_祥瑞套装14_奔跑"  or 名称 == "飞燕女_祥瑞套装14_奔跑" or 名称 == "骨精灵_祥瑞套装14_奔跑" or 名称 == "鬼潇潇_祥瑞套装14_奔跑" or 名称 == "狐美人_祥瑞套装14_奔跑" or 名称 == "桃夭夭_祥瑞套装14_奔跑" or 名称 == "巫蛮儿_祥瑞套装14_奔跑" or 名称 == "舞天姬_祥瑞套装14_奔跑" or 名称 == "玄彩娥_祥瑞套装14_奔跑" or 名称 == "英女侠_祥瑞套装14_奔跑"  then
		return  0x00300502
-------------------------------------------------- 男女公用
elseif 名称 == "剑侠客_祥瑞套装15_站立" or 名称 == "龙太子_祥瑞套装15_站立"  or  名称 == "杀破狼_祥瑞套装15_站立" or 名称 == "神天兵_祥瑞套装15_站立"  or  名称 == "逍遥生_祥瑞套装15_站立"  or  名称 == "偃无师_祥瑞套装15_站立"  or  名称 == "羽灵神_祥瑞套装15_站立" or 名称 == "巨魔王_祥瑞套装15_站立" or 名称 == "虎头怪_祥瑞套装15_站立"  or  名称 == "飞燕女_祥瑞套装15_站立" or 名称 == "骨精灵_祥瑞套装15_站立" or 名称 == "鬼潇潇_祥瑞套装15_站立" or 名称 == "狐美人_祥瑞套装15_站立" or 名称 == "桃夭夭_祥瑞套装15_站立" or 名称 == "巫蛮儿_祥瑞套装15_站立" or 名称 == "舞天姬_祥瑞套装15_站立" or 名称 == "玄彩娥_祥瑞套装15_站立" or 名称 == "英女侠_祥瑞套装15_站立"  then
		return   0x00300601
elseif 名称 == "剑侠客_祥瑞套装15_奔跑" or 名称 == "龙太子_祥瑞套装15_奔跑"  or  名称 == "杀破狼_祥瑞套装15_奔跑" or 名称 == "神天兵_祥瑞套装15_奔跑"  or  名称 == "逍遥生_祥瑞套装15_奔跑"  or  名称 == "偃无师_祥瑞套装15_奔跑"  or  名称 == "羽灵神_祥瑞套装15_奔跑" or 名称 == "巨魔王_祥瑞套装15_奔跑" or 名称 == "虎头怪_祥瑞套装15_奔跑"  or 名称 == "飞燕女_祥瑞套装15_奔跑" or 名称 == "骨精灵_祥瑞套装15_奔跑" or 名称 == "鬼潇潇_祥瑞套装15_奔跑" or 名称 == "狐美人_祥瑞套装15_奔跑" or 名称 == "桃夭夭_祥瑞套装15_奔跑" or 名称 == "巫蛮儿_祥瑞套装15_奔跑" or 名称 == "舞天姬_祥瑞套装15_奔跑" or 名称 == "玄彩娥_祥瑞套装15_奔跑" or 名称 == "英女侠_祥瑞套装15_奔跑"  then
		return  0x00300602
-------------------------------------------------- 男女公用
elseif 名称 == "剑侠客_祥瑞套装16_站立" or 名称 == "龙太子_祥瑞套装16_站立"  or  名称 == "杀破狼_祥瑞套装16_站立" or 名称 == "神天兵_祥瑞套装16_站立"  or  名称 == "逍遥生_祥瑞套装16_站立"  or  名称 == "偃无师_祥瑞套装16_站立"  or  名称 == "羽灵神_祥瑞套装16_站立" or 名称 == "巨魔王_祥瑞套装16_站立" or 名称 == "虎头怪_祥瑞套装16_站立"  or  名称 == "飞燕女_祥瑞套装16_站立" or 名称 == "骨精灵_祥瑞套装16_站立" or 名称 == "鬼潇潇_祥瑞套装16_站立" or 名称 == "狐美人_祥瑞套装16_站立" or 名称 == "桃夭夭_祥瑞套装16_站立" or 名称 == "巫蛮儿_祥瑞套装16_站立" or 名称 == "舞天姬_祥瑞套装16_站立" or 名称 == "玄彩娥_祥瑞套装16_站立" or 名称 == "英女侠_祥瑞套装16_站立"  then
		return   0x00300701
elseif 名称 == "剑侠客_祥瑞套装16_奔跑" or 名称 == "龙太子_祥瑞套装16_奔跑"  or  名称 == "杀破狼_祥瑞套装16_奔跑" or 名称 == "神天兵_祥瑞套装16_奔跑"  or  名称 == "逍遥生_祥瑞套装16_奔跑"  or  名称 == "偃无师_祥瑞套装16_奔跑"  or  名称 == "羽灵神_祥瑞套装16_奔跑" or 名称 == "巨魔王_祥瑞套装16_奔跑" or 名称 == "虎头怪_祥瑞套装16_奔跑"  or 名称 == "飞燕女_祥瑞套装16_奔跑" or 名称 == "骨精灵_祥瑞套装16_奔跑" or 名称 == "鬼潇潇_祥瑞套装16_奔跑" or 名称 == "狐美人_祥瑞套装16_奔跑" or 名称 == "桃夭夭_祥瑞套装16_奔跑" or 名称 == "巫蛮儿_祥瑞套装16_奔跑" or 名称 == "舞天姬_祥瑞套装16_奔跑" or 名称 == "玄彩娥_祥瑞套装16_奔跑" or 名称 == "英女侠_祥瑞套装16_奔跑"  then
		return  0x00300702
-------------------------------------------------- 男女公用
elseif 名称 == "剑侠客_祥瑞套装17_站立" or 名称 == "龙太子_祥瑞套装17_站立"  or  名称 == "杀破狼_祥瑞套装17_站立" or 名称 == "神天兵_祥瑞套装17_站立"  or  名称 == "逍遥生_祥瑞套装17_站立"  or  名称 == "偃无师_祥瑞套装17_站立"  or  名称 == "羽灵神_祥瑞套装17_站立" or 名称 == "巨魔王_祥瑞套装17_站立" or 名称 == "虎头怪_祥瑞套装17_站立"  or  名称 == "飞燕女_祥瑞套装17_站立" or 名称 == "骨精灵_祥瑞套装17_站立" or 名称 == "鬼潇潇_祥瑞套装17_站立" or 名称 == "狐美人_祥瑞套装17_站立" or 名称 == "桃夭夭_祥瑞套装17_站立" or 名称 == "巫蛮儿_祥瑞套装17_站立" or 名称 == "舞天姬_祥瑞套装17_站立" or 名称 == "玄彩娥_祥瑞套装17_站立" or 名称 == "英女侠_祥瑞套装17_站立"  then
		return   0x30303006
elseif 名称 == "剑侠客_祥瑞套装17_奔跑" or 名称 == "龙太子_祥瑞套装17_奔跑"  or  名称 == "杀破狼_祥瑞套装17_奔跑" or 名称 == "神天兵_祥瑞套装17_奔跑"  or  名称 == "逍遥生_祥瑞套装17_奔跑"  or  名称 == "偃无师_祥瑞套装17_奔跑"  or  名称 == "羽灵神_祥瑞套装17_奔跑" or 名称 == "巨魔王_祥瑞套装17_奔跑" or 名称 == "虎头怪_祥瑞套装17_奔跑"  or 名称 == "飞燕女_祥瑞套装17_奔跑" or 名称 == "骨精灵_祥瑞套装17_奔跑" or 名称 == "鬼潇潇_祥瑞套装17_奔跑" or 名称 == "狐美人_祥瑞套装17_奔跑" or 名称 == "桃夭夭_祥瑞套装17_奔跑" or 名称 == "巫蛮儿_祥瑞套装17_奔跑" or 名称 == "舞天姬_祥瑞套装17_奔跑" or 名称 == "玄彩娥_祥瑞套装17_奔跑" or 名称 == "英女侠_祥瑞套装17_奔跑"  then
		return  0x30303007
-------------------------------------------------- 男女公用
elseif 名称 == "剑侠客_祥瑞套装18_站立" or 名称 == "龙太子_祥瑞套装18_站立"  or  名称 == "杀破狼_祥瑞套装18_站立" or 名称 == "神天兵_祥瑞套装18_站立"  or  名称 == "逍遥生_祥瑞套装18_站立"  or  名称 == "偃无师_祥瑞套装18_站立"  or  名称 == "羽灵神_祥瑞套装18_站立" or 名称 == "巨魔王_祥瑞套装18_站立" or 名称 == "虎头怪_祥瑞套装18_站立"  or  名称 == "飞燕女_祥瑞套装18_站立" or 名称 == "骨精灵_祥瑞套装18_站立" or 名称 == "鬼潇潇_祥瑞套装18_站立" or 名称 == "狐美人_祥瑞套装18_站立" or 名称 == "桃夭夭_祥瑞套装18_站立" or 名称 == "巫蛮儿_祥瑞套装18_站立" or 名称 == "舞天姬_祥瑞套装18_站立" or 名称 == "玄彩娥_祥瑞套装18_站立" or 名称 == "英女侠_祥瑞套装18_站立"  then
		return   0x30303044
elseif 名称 == "剑侠客_祥瑞套装18_奔跑" or 名称 == "龙太子_祥瑞套装18_奔跑"  or  名称 == "杀破狼_祥瑞套装18_奔跑" or 名称 == "神天兵_祥瑞套装18_奔跑"  or  名称 == "逍遥生_祥瑞套装18_奔跑"  or  名称 == "偃无师_祥瑞套装18_奔跑"  or  名称 == "羽灵神_祥瑞套装18_奔跑" or 名称 == "巨魔王_祥瑞套装18_奔跑" or 名称 == "虎头怪_祥瑞套装18_奔跑"  or 名称 == "飞燕女_祥瑞套装18_奔跑" or 名称 == "骨精灵_祥瑞套装18_奔跑" or 名称 == "鬼潇潇_祥瑞套装18_奔跑" or 名称 == "狐美人_祥瑞套装18_奔跑" or 名称 == "桃夭夭_祥瑞套装18_奔跑" or 名称 == "巫蛮儿_祥瑞套装18_奔跑" or 名称 == "舞天姬_祥瑞套装18_奔跑" or 名称 == "玄彩娥_祥瑞套装18_奔跑" or 名称 == "英女侠_祥瑞套装18_奔跑"  then
		return  0x30303045
-------------------------------------------------- 男女公用
elseif 名称 == "剑侠客_祥瑞套装19_站立" or 名称 == "龙太子_祥瑞套装19_站立"  or  名称 == "杀破狼_祥瑞套装19_站立" or 名称 == "神天兵_祥瑞套装19_站立"  or  名称 == "逍遥生_祥瑞套装19_站立"  or  名称 == "偃无师_祥瑞套装19_站立"  or  名称 == "羽灵神_祥瑞套装19_站立" or 名称 == "巨魔王_祥瑞套装19_站立" or 名称 == "虎头怪_祥瑞套装19_站立"  or  名称 == "飞燕女_祥瑞套装19_站立" or 名称 == "骨精灵_祥瑞套装19_站立" or 名称 == "鬼潇潇_祥瑞套装19_站立" or 名称 == "狐美人_祥瑞套装19_站立" or 名称 == "桃夭夭_祥瑞套装19_站立" or 名称 == "巫蛮儿_祥瑞套装19_站立" or 名称 == "舞天姬_祥瑞套装19_站立" or 名称 == "玄彩娥_祥瑞套装19_站立" or 名称 == "英女侠_祥瑞套装19_站立"  then
		return   0x30303046
elseif 名称 == "剑侠客_祥瑞套装19_奔跑" or 名称 == "龙太子_祥瑞套装19_奔跑"  or  名称 == "杀破狼_祥瑞套装19_奔跑" or 名称 == "神天兵_祥瑞套装19_奔跑"  or  名称 == "逍遥生_祥瑞套装19_奔跑"  or  名称 == "偃无师_祥瑞套装19_奔跑"  or  名称 == "羽灵神_祥瑞套装19_奔跑" or 名称 == "巨魔王_祥瑞套装19_奔跑" or 名称 == "虎头怪_祥瑞套装19_奔跑"  or 名称 == "飞燕女_祥瑞套装19_奔跑" or 名称 == "骨精灵_祥瑞套装19_奔跑" or 名称 == "鬼潇潇_祥瑞套装19_奔跑" or 名称 == "狐美人_祥瑞套装19_奔跑" or 名称 == "桃夭夭_祥瑞套装19_奔跑" or 名称 == "巫蛮儿_祥瑞套装19_奔跑" or 名称 == "舞天姬_祥瑞套装19_奔跑" or 名称 == "玄彩娥_祥瑞套装19_奔跑" or 名称 == "英女侠_祥瑞套装19_奔跑"  then
		return  0x30303047
-------------------------------------------------- 男女公用
elseif 名称 == "剑侠客_祥瑞套装20_站立" or 名称 == "龙太子_祥瑞套装20_站立"  or  名称 == "杀破狼_祥瑞套装20_站立" or 名称 == "神天兵_祥瑞套装20_站立"  or  名称 == "逍遥生_祥瑞套装20_站立"  or  名称 == "偃无师_祥瑞套装20_站立"  or  名称 == "羽灵神_祥瑞套装20_站立" or 名称 == "巨魔王_祥瑞套装20_站立" or 名称 == "虎头怪_祥瑞套装20_站立"  or  名称 == "飞燕女_祥瑞套装20_站立" or 名称 == "骨精灵_祥瑞套装20_站立" or 名称 == "鬼潇潇_祥瑞套装20_站立" or 名称 == "狐美人_祥瑞套装20_站立" or 名称 == "桃夭夭_祥瑞套装20_站立" or 名称 == "巫蛮儿_祥瑞套装20_站立" or 名称 == "舞天姬_祥瑞套装20_站立" or 名称 == "玄彩娥_祥瑞套装20_站立" or 名称 == "英女侠_祥瑞套装20_站立"  then
		return   0x30303030
elseif 名称 == "剑侠客_祥瑞套装20_奔跑" or 名称 == "龙太子_祥瑞套装20_奔跑"  or  名称 == "杀破狼_祥瑞套装20_奔跑" or 名称 == "神天兵_祥瑞套装20_奔跑"  or  名称 == "逍遥生_祥瑞套装20_奔跑"  or  名称 == "偃无师_祥瑞套装20_奔跑"  or  名称 == "羽灵神_祥瑞套装20_奔跑" or 名称 == "巨魔王_祥瑞套装20_奔跑" or 名称 == "虎头怪_祥瑞套装20_奔跑"  or 名称 == "飞燕女_祥瑞套装20_奔跑" or 名称 == "骨精灵_祥瑞套装20_奔跑" or 名称 == "鬼潇潇_祥瑞套装20_奔跑" or 名称 == "狐美人_祥瑞套装20_奔跑" or 名称 == "桃夭夭_祥瑞套装20_奔跑" or 名称 == "巫蛮儿_祥瑞套装20_奔跑" or 名称 == "舞天姬_祥瑞套装20_奔跑" or 名称 == "玄彩娥_祥瑞套装20_奔跑" or 名称 == "英女侠_祥瑞套装20_奔跑"  then
		return  0x30303031
--------------------------------------------------
elseif 名称 == "剑侠客_祥瑞套装21_站立" or 名称 == "龙太子_祥瑞套装21_站立"  or  名称 == "杀破狼_祥瑞套装21_站立" or 名称 == "神天兵_祥瑞套装21_站立"  or  名称 == "逍遥生_祥瑞套装21_站立"  or  名称 == "偃无师_祥瑞套装21_站立"  or  名称 == "羽灵神_祥瑞套装21_站立" then
		return  0x30303082
elseif 名称 == "剑侠客_祥瑞套装21_奔跑" or 名称 == "龙太子_祥瑞套装21_奔跑"  or  名称 == "杀破狼_祥瑞套装21_奔跑" or 名称 == "神天兵_祥瑞套装21_奔跑"  or  名称 == "逍遥生_祥瑞套装21_奔跑"  or  名称 == "偃无师_祥瑞套装21_奔跑"  or  名称 == "羽灵神_祥瑞套装21_奔跑" then
		return  0x30303083
elseif 名称 == "巨魔王_祥瑞套装21_站立" then
			return 0x30303078
elseif 名称 == "巨魔王_祥瑞套装21_奔跑" then
			return 0x30303079
elseif 名称 == "虎头怪_祥瑞套装21_站立" then
			return 0x30303076
elseif 名称 == "虎头怪_祥瑞套装21_奔跑" then
			return 0x30303077
elseif 名称 == "飞燕女_祥瑞套装21_站立" or 名称 == "骨精灵_祥瑞套装21_站立" or 名称 == "鬼潇潇_祥瑞套装21_站立" or 名称 == "狐美人_祥瑞套装21_站立" or 名称 == "桃夭夭_祥瑞套装21_站立" or 名称 == "巫蛮儿_祥瑞套装21_站立" or 名称 == "舞天姬_祥瑞套装21_站立" or 名称 == "玄彩娥_祥瑞套装21_站立" or 名称 == "英女侠_祥瑞套装21_站立"  then
			return 0x30303080
elseif 名称 == "飞燕女_祥瑞套装21_奔跑" or 名称 == "骨精灵_祥瑞套装21_奔跑" or 名称 == "鬼潇潇_祥瑞套装21_奔跑" or 名称 == "狐美人_祥瑞套装21_奔跑" or 名称 == "桃夭夭_祥瑞套装21_奔跑" or 名称 == "巫蛮儿_祥瑞套装21_奔跑" or 名称 == "舞天姬_祥瑞套装21_奔跑" or 名称 == "玄彩娥_祥瑞套装21_奔跑" or 名称 == "英女侠_祥瑞套装21_奔跑"  then
			return 0x30303081
--------------------------------------------------
elseif 名称 == "剑侠客_祥瑞套装22_站立" or 名称 == "龙太子_祥瑞套装22_站立"  or  名称 == "杀破狼_祥瑞套装22_站立" or 名称 == "神天兵_祥瑞套装22_站立"  or  名称 == "逍遥生_祥瑞套装22_站立"  or  名称 == "偃无师_祥瑞套装22_站立"  or  名称 == "羽灵神_祥瑞套装22_站立" then
		return  0x30303090
elseif 名称 == "剑侠客_祥瑞套装22_奔跑" or 名称 == "龙太子_祥瑞套装22_奔跑"  or  名称 == "杀破狼_祥瑞套装22_奔跑" or 名称 == "神天兵_祥瑞套装22_奔跑"  or  名称 == "逍遥生_祥瑞套装22_奔跑"  or  名称 == "偃无师_祥瑞套装22_奔跑"  or  名称 == "羽灵神_祥瑞套装22_奔跑" then
		return  0x30303091
elseif 名称 == "巨魔王_祥瑞套装22_站立" then
			return 0x30303086
elseif 名称 == "巨魔王_祥瑞套装22_奔跑" then
			return 0x30303087
elseif 名称 == "虎头怪_祥瑞套装22_站立" then
			return 0x30303084
elseif 名称 == "虎头怪_祥瑞套装22_奔跑" then
			return 0x30303085
elseif 名称 == "飞燕女_祥瑞套装22_站立" or 名称 == "骨精灵_祥瑞套装22_站立" or 名称 == "鬼潇潇_祥瑞套装22_站立" or 名称 == "狐美人_祥瑞套装22_站立" or 名称 == "桃夭夭_祥瑞套装22_站立" or 名称 == "巫蛮儿_祥瑞套装22_站立" or 名称 == "舞天姬_祥瑞套装22_站立" or 名称 == "玄彩娥_祥瑞套装22_站立" or 名称 == "英女侠_祥瑞套装22_站立"  then
			return 0x30303088
elseif 名称 == "飞燕女_祥瑞套装22_奔跑" or 名称 == "骨精灵_祥瑞套装22_奔跑" or 名称 == "鬼潇潇_祥瑞套装22_奔跑" or 名称 == "狐美人_祥瑞套装22_奔跑" or 名称 == "桃夭夭_祥瑞套装22_奔跑" or 名称 == "巫蛮儿_祥瑞套装22_奔跑" or 名称 == "舞天姬_祥瑞套装22_奔跑" or 名称 == "玄彩娥_祥瑞套装22_奔跑" or 名称 == "英女侠_祥瑞套装22_奔跑"  then
			return 0x30303089
--------------------------------------------------
elseif 名称 == "剑侠客_祥瑞套装23_站立" or 名称 == "龙太子_祥瑞套装23_站立"  or  名称 == "杀破狼_祥瑞套装23_站立" or 名称 == "神天兵_祥瑞套装23_站立"  or  名称 == "逍遥生_祥瑞套装23_站立"  or  名称 == "偃无师_祥瑞套装23_站立"  or  名称 == "羽灵神_祥瑞套装23_站立" then
		return  0x30303093
elseif 名称 == "剑侠客_祥瑞套装23_奔跑" or 名称 == "龙太子_祥瑞套装23_奔跑"  or  名称 == "杀破狼_祥瑞套装23_奔跑" or 名称 == "神天兵_祥瑞套装23_奔跑"  or  名称 == "逍遥生_祥瑞套装23_奔跑"  or  名称 == "偃无师_祥瑞套装23_奔跑"  or  名称 == "羽灵神_祥瑞套装23_奔跑" then
		return  0x30303098
elseif 名称 == "巨魔王_祥瑞套装23_站立" then
			return 0x30303092
elseif 名称 == "巨魔王_祥瑞套装23_奔跑" then
			return 0x30303099
elseif 名称 == "虎头怪_祥瑞套装23_站立" then
			return 0x30303095
elseif 名称 == "虎头怪_祥瑞套装23_奔跑" then
			return 0x30303096
elseif 名称 == "飞燕女_祥瑞套装23_站立" or 名称 == "骨精灵_祥瑞套装23_站立" or 名称 == "鬼潇潇_祥瑞套装23_站立" or 名称 == "狐美人_祥瑞套装23_站立" or 名称 == "桃夭夭_祥瑞套装23_站立" or 名称 == "巫蛮儿_祥瑞套装23_站立" or 名称 == "舞天姬_祥瑞套装23_站立" or 名称 == "玄彩娥_祥瑞套装23_站立" or 名称 == "英女侠_祥瑞套装23_站立"  then
			return 0x30303094
elseif 名称 == "飞燕女_祥瑞套装23_奔跑" or 名称 == "骨精灵_祥瑞套装23_奔跑" or 名称 == "鬼潇潇_祥瑞套装23_奔跑" or 名称 == "狐美人_祥瑞套装23_奔跑" or 名称 == "桃夭夭_祥瑞套装23_奔跑" or 名称 == "巫蛮儿_祥瑞套装23_奔跑" or 名称 == "舞天姬_祥瑞套装23_奔跑" or 名称 == "玄彩娥_祥瑞套装23_奔跑" or 名称 == "英女侠_祥瑞套装23_奔跑"  then
			return 0x30303097
--------------------------------------------------
elseif 名称 == "剑侠客_祥瑞套装24_站立" or 名称 == "龙太子_祥瑞套装24_站立"  or  名称 == "杀破狼_祥瑞套装24_站立" or 名称 == "神天兵_祥瑞套装24_站立"  or  名称 == "逍遥生_祥瑞套装24_站立"  or  名称 == "偃无师_祥瑞套装24_站立"  or  名称 == "羽灵神_祥瑞套装24_站立" then
		return  0x30303102
elseif 名称 == "剑侠客_祥瑞套装24_奔跑" or 名称 == "龙太子_祥瑞套装24_奔跑"  or  名称 == "杀破狼_祥瑞套装24_奔跑" or 名称 == "神天兵_祥瑞套装24_奔跑"  or  名称 == "逍遥生_祥瑞套装24_奔跑"  or  名称 == "偃无师_祥瑞套装24_奔跑"  or  名称 == "羽灵神_祥瑞套装24_奔跑" then
		return  0x30303105
elseif 名称 == "巨魔王_祥瑞套装24_站立" then
			return 0x30303100
elseif 名称 == "巨魔王_祥瑞套装24_奔跑" then
			return 0x30303104
elseif 名称 == "虎头怪_祥瑞套装24_站立" then
			return 0x30303103
elseif 名称 == "虎头怪_祥瑞套装24_奔跑" then
			return 0x30303107
elseif 名称 == "飞燕女_祥瑞套装24_站立" or 名称 == "骨精灵_祥瑞套装24_站立" or 名称 == "鬼潇潇_祥瑞套装24_站立" or 名称 == "狐美人_祥瑞套装24_站立" or 名称 == "桃夭夭_祥瑞套装24_站立" or 名称 == "巫蛮儿_祥瑞套装24_站立" or 名称 == "舞天姬_祥瑞套装24_站立" or 名称 == "玄彩娥_祥瑞套装24_站立" or 名称 == "英女侠_祥瑞套装24_站立"  then
			return 0x30303101
elseif 名称 == "飞燕女_祥瑞套装24_奔跑" or 名称 == "骨精灵_祥瑞套装24_奔跑" or 名称 == "鬼潇潇_祥瑞套装24_奔跑" or 名称 == "狐美人_祥瑞套装24_奔跑" or 名称 == "桃夭夭_祥瑞套装24_奔跑" or 名称 == "巫蛮儿_祥瑞套装24_奔跑" or 名称 == "舞天姬_祥瑞套装24_奔跑" or 名称 == "玄彩娥_祥瑞套装24_奔跑" or 名称 == "英女侠_祥瑞套装24_奔跑"  then
			return 0x30303106
--------------------------------------------------
elseif 名称 == "剑侠客_祥瑞套装25_站立" or 名称 == "龙太子_祥瑞套装25_站立"  or  名称 == "杀破狼_祥瑞套装25_站立" or 名称 == "神天兵_祥瑞套装25_站立"  or  名称 == "逍遥生_祥瑞套装25_站立"  or  名称 == "偃无师_祥瑞套装25_站立"  or  名称 == "羽灵神_祥瑞套装25_站立" then
		return  0x30303113
elseif 名称 == "剑侠客_祥瑞套装25_奔跑" or 名称 == "龙太子_祥瑞套装25_奔跑"  or  名称 == "杀破狼_祥瑞套装25_奔跑" or 名称 == "神天兵_祥瑞套装25_奔跑"  or  名称 == "逍遥生_祥瑞套装25_奔跑"  or  名称 == "偃无师_祥瑞套装25_奔跑"  or  名称 == "羽灵神_祥瑞套装25_奔跑" then
		return  0x30303124
elseif 名称 == "巨魔王_祥瑞套装25_站立" then
			return 0x30303110
elseif 名称 == "巨魔王_祥瑞套装25_奔跑" then
			return 0x30303123
elseif 名称 == "虎头怪_祥瑞套装25_站立" then
			return 0x30303114
elseif 名称 == "虎头怪_祥瑞套装25_奔跑" then
			return 0x30303126
elseif 名称 == "飞燕女_祥瑞套装25_站立" or 名称 == "骨精灵_祥瑞套装25_站立" or 名称 == "鬼潇潇_祥瑞套装25_站立" or 名称 == "狐美人_祥瑞套装25_站立" or 名称 == "桃夭夭_祥瑞套装25_站立" or 名称 == "巫蛮儿_祥瑞套装25_站立" or 名称 == "舞天姬_祥瑞套装25_站立" or 名称 == "玄彩娥_祥瑞套装25_站立" or 名称 == "英女侠_祥瑞套装25_站立"  then
			return 0x30303112
elseif 名称 == "飞燕女_祥瑞套装25_奔跑" or 名称 == "骨精灵_祥瑞套装25_奔跑" or 名称 == "鬼潇潇_祥瑞套装25_奔跑" or 名称 == "狐美人_祥瑞套装25_奔跑" or 名称 == "桃夭夭_祥瑞套装25_奔跑" or 名称 == "巫蛮儿_祥瑞套装25_奔跑" or 名称 == "舞天姬_祥瑞套装25_奔跑" or 名称 == "玄彩娥_祥瑞套装25_奔跑" or 名称 == "英女侠_祥瑞套装25_奔跑"  then
			return 0x30303125
--------------------------------------------------
elseif 名称 == "剑侠客_祥瑞套装26_站立" or 名称 == "龙太子_祥瑞套装26_站立"  or  名称 == "杀破狼_祥瑞套装26_站立" or 名称 == "神天兵_祥瑞套装26_站立"  or  名称 == "逍遥生_祥瑞套装26_站立"  or  名称 == "偃无师_祥瑞套装26_站立"  or  名称 == "羽灵神_祥瑞套装26_站立" then
		return  0x30303117
elseif 名称 == "剑侠客_祥瑞套装26_奔跑" or 名称 == "龙太子_祥瑞套装26_奔跑"  or  名称 == "杀破狼_祥瑞套装26_奔跑" or 名称 == "神天兵_祥瑞套装26_奔跑"  or  名称 == "逍遥生_祥瑞套装26_奔跑"  or  名称 == "偃无师_祥瑞套装26_奔跑"  or  名称 == "羽灵神_祥瑞套装26_奔跑" then
		return  0x30303130
elseif 名称 == "巨魔王_祥瑞套装26_站立" then
			return 0x30303115
elseif 名称 == "巨魔王_祥瑞套装26_奔跑" then
			return 0x30303128
elseif 名称 == "虎头怪_祥瑞套装26_站立" then
			return 0x30303116
elseif 名称 == "虎头怪_祥瑞套装26_奔跑" then
			return 0x30303127
elseif 名称 == "飞燕女_祥瑞套装26_站立" or 名称 == "骨精灵_祥瑞套装26_站立" or 名称 == "鬼潇潇_祥瑞套装26_站立" or 名称 == "狐美人_祥瑞套装26_站立" or 名称 == "桃夭夭_祥瑞套装26_站立" or 名称 == "巫蛮儿_祥瑞套装26_站立" or 名称 == "舞天姬_祥瑞套装26_站立" or 名称 == "玄彩娥_祥瑞套装26_站立" or 名称 == "英女侠_祥瑞套装26_站立"  then
			return 0x30303118
elseif 名称 == "飞燕女_祥瑞套装26_奔跑" or 名称 == "骨精灵_祥瑞套装26_奔跑" or 名称 == "鬼潇潇_祥瑞套装26_奔跑" or 名称 == "狐美人_祥瑞套装26_奔跑" or 名称 == "桃夭夭_祥瑞套装26_奔跑" or 名称 == "巫蛮儿_祥瑞套装26_奔跑" or 名称 == "舞天姬_祥瑞套装26_奔跑" or 名称 == "玄彩娥_祥瑞套装26_奔跑" or 名称 == "英女侠_祥瑞套装26_奔跑"  then
			return 0x30303129
--------------------------------------------------
elseif 名称 == "剑侠客_祥瑞套装·帝江白_站立" or 名称 == "龙太子_祥瑞套装·帝江白_站立"  or  名称 == "杀破狼_祥瑞套装·帝江白_站立" or 名称 == "神天兵_祥瑞套装·帝江白_站立"  or  名称 == "逍遥生_祥瑞套装·帝江白_站立"  or  名称 == "偃无师_祥瑞套装·帝江白_站立"  or  名称 == "羽灵神_祥瑞套装·帝江白_站立" or 名称 == "巨魔王_祥瑞套装·帝江白_站立" or 名称 == "虎头怪_祥瑞套装·帝江白_站立"  then
		return 0x00FF0001
elseif 名称 == "剑侠客_祥瑞套装·帝江白_奔跑" or 名称 == "龙太子_祥瑞套装·帝江白_奔跑"  or  名称 == "杀破狼_祥瑞套装·帝江白_奔跑" or 名称 == "神天兵_祥瑞套装·帝江白_奔跑"  or  名称 == "逍遥生_祥瑞套装·帝江白_奔跑"  or  名称 == "偃无师_祥瑞套装·帝江白_奔跑"  or  名称 == "羽灵神_祥瑞套装·帝江白_奔跑" or 名称 == "巨魔王_祥瑞套装·帝江白_奔跑" or 名称 == "虎头怪_祥瑞套装·帝江白_奔跑"  then
		return 0x00FF0002
elseif 名称 == "飞燕女_祥瑞套装·帝江白_站立" or 名称 == "骨精灵_祥瑞套装·帝江白_站立" or 名称 == "鬼潇潇_祥瑞套装·帝江白_站立" or 名称 == "狐美人_祥瑞套装·帝江白_站立" or 名称 == "桃夭夭_祥瑞套装·帝江白_站立" or 名称 == "巫蛮儿_祥瑞套装·帝江白_站立" or 名称 == "舞天姬_祥瑞套装·帝江白_站立" or 名称 == "玄彩娥_祥瑞套装·帝江白_站立" or 名称 == "英女侠_祥瑞套装·帝江白_站立"  then
		return 0x00FF0003
elseif 名称 == "飞燕女_祥瑞套装·帝江白_奔跑" or 名称 == "骨精灵_祥瑞套装·帝江白_奔跑" or 名称 == "鬼潇潇_祥瑞套装·帝江白_奔跑" or 名称 == "狐美人_祥瑞套装·帝江白_奔跑" or 名称 == "桃夭夭_祥瑞套装·帝江白_奔跑" or 名称 == "巫蛮儿_祥瑞套装·帝江白_奔跑" or 名称 == "舞天姬_祥瑞套装·帝江白_奔跑" or 名称 == "玄彩娥_祥瑞套装·帝江白_奔跑" or 名称 == "英女侠_祥瑞套装·帝江白_奔跑"  then
		return 0x00FF0004
--------------------------------------------------
elseif 名称 == "剑侠客_祥瑞套装·飞马黑_站立" or 名称 == "龙太子_祥瑞套装·飞马黑_站立"  or  名称 == "杀破狼_祥瑞套装·飞马黑_站立" or 名称 == "神天兵_祥瑞套装·飞马黑_站立"  or  名称 == "逍遥生_祥瑞套装·飞马黑_站立"  or  名称 == "偃无师_祥瑞套装·飞马黑_站立"  or  名称 == "羽灵神_祥瑞套装·飞马黑_站立" or 名称 == "巨魔王_祥瑞套装·飞马黑_站立" or 名称 == "虎头怪_祥瑞套装·飞马黑_站立"  then
		return 0x00FF0007
elseif 名称 == "剑侠客_祥瑞套装·飞马黑_奔跑" or 名称 == "龙太子_祥瑞套装·飞马黑_奔跑"  or  名称 == "杀破狼_祥瑞套装·飞马黑_奔跑" or 名称 == "神天兵_祥瑞套装·飞马黑_奔跑"  or  名称 == "逍遥生_祥瑞套装·飞马黑_奔跑"  or  名称 == "偃无师_祥瑞套装·飞马黑_奔跑"  or  名称 == "羽灵神_祥瑞套装·飞马黑_奔跑" or 名称 == "巨魔王_祥瑞套装·飞马黑_奔跑" or 名称 == "虎头怪_祥瑞套装·飞马黑_奔跑"  then
		return 0x00FF0008
elseif 名称 == "飞燕女_祥瑞套装·飞马黑_站立" or 名称 == "骨精灵_祥瑞套装·飞马黑_站立" or 名称 == "鬼潇潇_祥瑞套装·飞马黑_站立" or 名称 == "狐美人_祥瑞套装·飞马黑_站立" or 名称 == "桃夭夭_祥瑞套装·飞马黑_站立" or 名称 == "巫蛮儿_祥瑞套装·飞马黑_站立" or 名称 == "舞天姬_祥瑞套装·飞马黑_站立" or 名称 == "玄彩娥_祥瑞套装·飞马黑_站立" or 名称 == "英女侠_祥瑞套装·飞马黑_站立"  then
		return 0x00FF0005
elseif 名称 == "飞燕女_祥瑞套装·飞马黑_奔跑" or 名称 == "骨精灵_祥瑞套装·飞马黑_奔跑" or 名称 == "鬼潇潇_祥瑞套装·飞马黑_奔跑" or 名称 == "狐美人_祥瑞套装·飞马黑_奔跑" or 名称 == "桃夭夭_祥瑞套装·飞马黑_奔跑" or 名称 == "巫蛮儿_祥瑞套装·飞马黑_奔跑" or 名称 == "舞天姬_祥瑞套装·飞马黑_奔跑" or 名称 == "玄彩娥_祥瑞套装·飞马黑_奔跑" or 名称 == "英女侠_祥瑞套装·飞马黑_奔跑"  then
		return 0x00FF0006
--------------------------------------------------
elseif 名称 == "剑侠客_祥瑞套装·冰寒_站立" or 名称 == "龙太子_祥瑞套装·冰寒_站立"  or  名称 == "杀破狼_祥瑞套装·冰寒_站立" or 名称 == "神天兵_祥瑞套装·冰寒_站立"  or  名称 == "逍遥生_祥瑞套装·冰寒_站立"  or  名称 == "偃无师_祥瑞套装·冰寒_站立"  or  名称 == "羽灵神_祥瑞套装·冰寒_站立" or 名称 == "巨魔王_祥瑞套装·冰寒_站立" or 名称 == "虎头怪_祥瑞套装·冰寒_站立"  then
		return 0x00FF0027
elseif 名称 == "剑侠客_祥瑞套装·冰寒_奔跑" or 名称 == "龙太子_祥瑞套装·冰寒_奔跑"  or  名称 == "杀破狼_祥瑞套装·冰寒_奔跑" or 名称 == "神天兵_祥瑞套装·冰寒_奔跑"  or  名称 == "逍遥生_祥瑞套装·冰寒_奔跑"  or  名称 == "偃无师_祥瑞套装·冰寒_奔跑"  or  名称 == "羽灵神_祥瑞套装·冰寒_奔跑" or 名称 == "巨魔王_祥瑞套装·冰寒_奔跑" or 名称 == "虎头怪_祥瑞套装·冰寒_奔跑"  then
		return 0x00FF0028
elseif 名称 == "飞燕女_祥瑞套装·冰寒_站立" or 名称 == "骨精灵_祥瑞套装·冰寒_站立" or 名称 == "鬼潇潇_祥瑞套装·冰寒_站立" or 名称 == "狐美人_祥瑞套装·冰寒_站立" or 名称 == "桃夭夭_祥瑞套装·冰寒_站立" or 名称 == "巫蛮儿_祥瑞套装·冰寒_站立" or 名称 == "舞天姬_祥瑞套装·冰寒_站立" or 名称 == "玄彩娥_祥瑞套装·冰寒_站立" or 名称 == "英女侠_祥瑞套装·冰寒_站立"  then
		return 0x00FF0025
elseif 名称 == "飞燕女_祥瑞套装·冰寒_奔跑" or 名称 == "骨精灵_祥瑞套装·冰寒_奔跑" or 名称 == "鬼潇潇_祥瑞套装·冰寒_奔跑" or 名称 == "狐美人_祥瑞套装·冰寒_奔跑" or 名称 == "桃夭夭_祥瑞套装·冰寒_奔跑" or 名称 == "巫蛮儿_祥瑞套装·冰寒_奔跑" or 名称 == "舞天姬_祥瑞套装·冰寒_奔跑" or 名称 == "玄彩娥_祥瑞套装·冰寒_奔跑" or 名称 == "英女侠_祥瑞套装·冰寒_奔跑"  then
		return 0x00FF0026
--------------------------------------------------
	end
	return ""
end

function 引擎.取站立坐骑(名称)
	if 名称 == "山河画卷" then
		return {0x0FF3F9E2,0x2D6915E1}
	elseif 名称 == "凌霄飞剑" then--
		return {0x4931C9EC,0xEEB83B53}
	elseif 名称 == "瑞彩祥云" then--
		return {0x089A78C7,0x43FB6660}
	elseif 名称 == "风火飞轮" then--
		return {0x3815C169,0x3815C169}
	elseif 名称 == "落英纷飞" then--
		return {0x32BE003F,0x32BE003F}
	elseif 名称 == "凤舞灵蝶" then--
		return {0x6D33C1DB,0xF809B4D1}
	elseif 名称 == "七彩祥云" then--
		return {0xD4CED8F7,0x4391944D}
	elseif 名称 == "齐天小轿" then--
		return {0x6ED61C4C,0xD81F56A7}
	elseif 名称 == "流云玉佩" then--
		return {0xF92EAB94,0x40DBF469}
	end
	return nil
end
