--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2021-04-29 17:55:47
--======================================================================--
function 引擎.取物品(wd)
	local wds = {}
	-- 重做数据1.2
	-- 任务
	if wd == "避火诀" then
		wds[1] = "仙界的五行秘宝之一，拈此诀处在烈火中也安然无恙"
		wds[2] = 150
		wds[3] = 1
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0x04694A50
	    wds[13] = 0xC3A8BEA9
	elseif wd == "飞刀" then
        wds[1] = "锋利的飞刀，普通的暗器"
        wds[2] = 2000
        wds[3] = 10
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0xA4C811C5
        wds[13] = 0x935EC081
        elseif wd == "百年·魂环" then
		--wds[1] = ""
		wds[2] = 2
		wds[3] = 14
		wds[4] = 5
		wds[5] = 60
	    wds[11] = "hungu.wdf"
	    wds[12] = 0x00001239
	    wds[13] = 0x00001240
	elseif wd == "千年·魂环" then
		wds[2] = 2
		wds[3] = 14
		wds[4] = 5
		wds[5] = 60
	 	wds[11] = "hungu.wdf"
	    wds[12] = 0x00001237
	    wds[13] = 0x00001238
    elseif wd == "万年·魂环" then
		--wds[1] = ""
		wds[2] = 2
		wds[3] = 14
		wds[4] = 5
		wds[5] = 60
	    wds[11] = "hungu.wdf"
	    wds[12] = 0x00001241
	    wds[13] = 0x00001242
	elseif wd == "十万年·魂环" then
		--wds[1] = ""
		wds[2] = 2
		wds[3] = 14
		wds[4] = 5
		wds[5] = 60
	    wds[11] = "hungu.wdf"
	    wds[12] = 0x00001243
	    wds[13] = 0x00001244
	elseif wd == "百万年·魂环" then
		--wds[1] = "百万年魂环"
		wds[2] = 2
		wds[3] = 14
		wds[4] = 5
		wds[5] = 60
	    wds[11] = "hungu.wdf"
	    wds[12] = 0x00001245
	    wds[13] = 0x00001246
	elseif wd == "神级·魂环" then
		--wds[1] = "神级魂环"
		wds[2] = 2
		wds[3] = 14
		wds[4] = 5
		wds[5] = 60
	    wds[11] = "hungu.wdf"
	    wds[12] = 0x00001247
	    wds[13] = 0x00001248

    elseif wd == "洗魂符" then
		wds[1] = "用于重洗魂环"
		wds[2] = 5
		wds[3] = 3
		wds[4] = 0
	    wds[11] = "wpal/121.wpal"
	    wds[12] = 0x0000B014
	    wds[13] = 0x0000B015

  	elseif wd == "飞蝗石" then
        wds[1] = "普通暗器，但如果使用熟了，非常方便"
        wds[2] = 2000
        wds[3] = 20
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0x4C07009E
        wds[13] = 0xBF944057
        elseif wd == "1颗强化石礼包" then
		wds[1] = "装着1颗强化石，散发着宝石的光华"
		wds[2] = 1
		wds[3] = 11
		wds[4] = 0
        wds[8] = 3
	    wds[11] = "item.wdf"
	    wds[12] = 0x9724BCB0 --小
	    wds[13] = 0xFE37E4E0 --大
     elseif wd == "5颗强化石礼包" then
		wds[1] = "装着五颗强化石，散发着宝石的光华"
		wds[2] = 1
		wds[3] = 11
		wds[4] = 0
        wds[8] = 3
	    wds[11] = "item.wdf"
	    wds[12] = 0x9724BCB0 --小
	    wds[13] = 0xFE37E4E0 --大
	elseif wd == "10颗强化石礼包" then
		wds[1] = "装着10颗强化石，散发着宝石的光华"
		wds[2] = 1
		wds[3] = 11
		wds[4] = 0
        wds[8] = 3
	    wds[11] = "item.wdf"
	    wds[12] = 0x9724BCB0 --小
	    wds[13] = 0xFE37E4E0 --大
	elseif wd == "15颗强化石礼包" then
		wds[1] = "装着15颗强化石，散发着宝石的光华"
		wds[2] = 1
		wds[3] = 11
		wds[4] = 0
        wds[8] = 3
	    wds[11] = "item.wdf"
	    wds[12] = 0x9724BCB0 --小
	    wds[13] = 0xFE37E4E0 --大
  elseif wd == "强化石" then
		wds[1] = "强化装备所需要的的晶石，具有强大的力量"
		wds[2] = 33
		wds[3] = 6
	    wds[11] = "hfzr.wdf"
	    wds[12] = 0x57FBB583
	    wds[13] = 0xF56E689A
	elseif wd == "保护符" then
		wds[1] = "具有神秘而强大的力量，可在强化装备失败时保护装备不会消失"
		wds[2] = "符石卷轴"
		wds[2] = 33
		wds[3] = 8
	    wds[11] = "hfzr.wdf"
	    wds[12] = 0x5FE14302
	    wds[13] = 0x44189679
    elseif wd == "仙灵竹枝" then
		wds[1] = "采至南海普陀山的紫竹林,是神兽最喜欢的材料。集齐99个可以使神兽繁殖"
		wds[2] = 9
		wds[3] = 11
		wds[4] = 0
        wds[8] = 1
	    wds[11] = "wpal/121.wpal"
	    wds[12] = 0x00000121
	    wds[13] = 0x00000122
	elseif wd == "仙灵竹叶" then
		wds[1] = "采至南海普陀山的紫竹林,是宠物最喜欢的材料。集齐99个可以使宠物繁殖"
		wds[2] = 9
		wds[3] = 11
		wds[4] = 0
        wds[8] = 1
	    wds[11] = "wpal/121.wpal"
	    wds[12] = 0x00000119
	    wds[13] = 0x00000120
 	elseif wd == "铁蒺藜" then
        wds[1] = "形状似蒺藜的铁制暗器"
        wds[2] = 2000
        wds[3] = 30
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0x2851A8EC
        wds[13] = 0x5D501D52
     elseif wd == "武魂珠" then
        wds[1] = "可以用来提升武魂等级和进阶"
        wds[2] = 4
        wds[3] = 2
        wds[4] = 0
        wds[11] = "wpal/121.wpal"
        wds[12] = 0x00000299
        wds[13] = 0x00000300
    elseif wd == "通灵丹" then
        wds[1] = "可以为武魂重置技能,每次消耗10*技能数量"
        wds[2] = 4
        wds[3] = 2
        wds[4] = 0
        wds[11] = "wpal/121.wpal"
        wds[12] = 0x00000305
        wds[13] = 0x00000306
    elseif wd == "幻彩丹" then
        wds[1] = "可以为武魂重置一种形象,阶数越高消耗越大"
        wds[2] = 4
        wds[3] = 2
        wds[4] = 0
        wds[11] = "wpal/121.wpal"
        wds[12] = 0x00000303
        wds[13] = 0x00000304
     elseif wd == "小额银票" then
		wds[1] = "大唐年间，李记钱庄发行的一种银票，可获得7500W两银子。"
		wds[2] = "银票"
		wds[3] = 3
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xFA49DAFD
	    wds[13] = 0x7F1E2D96
	elseif wd == "大额银票" then
		wds[1] = "大唐年间，李记钱庄发行的一种银票，可获得1亿5W两银子。"
		wds[2] = "银票"
		wds[3] = 3
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0x91B892E4
	    wds[13] = 0xFA853D52
	  elseif wd == "抽奖点卡" then
		wds[1] = "抽奖点卡，可以抽奖10次"
		wds[2] = "银票"
		wds[3] = 3
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xB914F9E5
	    wds[13] = 0xFEF0147A
       elseif wd == "太阳石礼包" then
		wds[1] = "内含一套1-10级太阳石10颗，右键打开获得"
		wds[2] = "宝石礼包"
		wds[3] = 5
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0x65AE0DFF
	    wds[13] = 0x2CE03BE9
	elseif wd == "红玛瑙礼包" then
		wds[1] = "内含一套1-10级红玛瑙10颗，右键打开获得"
		wds[2] = "宝石礼包"
		wds[3] = 5
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0x65AE0DFF
	    wds[13] = 0x2CE03BE9
	elseif wd == "舍利子礼包" then
		wds[1] = "内含一套1-10级舍利子10颗，右键打开获得"
		wds[2] = "宝石礼包"
		wds[3] = 5
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0x65AE0DFF
	    wds[13] = 0x2CE03BE9
	elseif wd == "黑宝石礼包" then
		wds[1] = "内含一套1-10级黑宝石10颗，右键打开获得"
		wds[2] = "宝石礼包"
		wds[3] = 5
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0x65AE0DFF
	    wds[13] = 0x2CE03BE9
	elseif wd == "光芒石礼包" then
		wds[1] = "内含一套1-10级光芒石10颗，右键打开获得"
		wds[2] = "宝石礼包"
		wds[3] = 5
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0x65AE0DFF
	    wds[13] = 0x2CE03BE9
	elseif wd == "月亮石礼包" then
		wds[1] = "内含一套1-10级月亮石10颗，右键打开获得"
		wds[2] = "宝石礼包"
		wds[3] = 5
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0x65AE0DFF
	    wds[13] = 0x2CE03BE9
	elseif wd == "神秘石礼包" then
		wds[1] = "内含一套1-10级神秘石10颗，右键打开获得"
		wds[2] = "宝石礼包"
		wds[3] = 5
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0x65AE0DFF
	    wds[13] = 0x2CE03BE9
	elseif wd == "星辉石礼包" then
		wds[1] = "内含一套1-10级星辉石10颗，右键打开获得"
		wds[2] = "宝石礼包"
		wds[3] = 5
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0x65AE0DFF
	    wds[13] = 0x2CE03BE9
	  elseif wd == "太阳石小礼包" then
		wds[1] = "内含一套11-20级太阳石10颗，右键打开获得"
		wds[2] = "宝石礼包"
		wds[3] = 5
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xA3DB661B
	    wds[13] = 0x5AAF94C0
	elseif wd == "红玛瑙小礼包" then
		wds[1] = "内含一套11-20级红玛瑙10颗，右键打开获得"
		wds[2] = "宝石礼包"
		wds[3] = 5
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xA3DB661B
	    wds[13] = 0x5AAF94C0
	elseif wd == "舍利子小礼包" then
		wds[1] = "内含一套11-20级舍利子10颗，右键打开获得"
		wds[2] = "宝石礼包"
		wds[3] = 5
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xA3DB661B
	    wds[13] = 0x5AAF94C0
	elseif wd == "黑宝石小礼包" then
		wds[1] = "内含一套11-20级黑宝石10颗，右键打开获得"
		wds[2] = "宝石礼包"
		wds[3] = 5
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xA3DB661B
	    wds[13] = 0x5AAF94C0
	elseif wd == "光芒石小礼包" then
		wds[1] = "内含一套11-20级光芒石10颗，右键打开获得"
		wds[2] = "宝石礼包"
		wds[3] = 5
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xA3DB661B
	    wds[13] = 0x5AAF94C0
	elseif wd == "月亮石小礼包" then
		wds[1] = "内含一套11-20级月亮石10颗，右键打开获得"
		wds[2] = "宝石礼包"
		wds[3] = 5
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xA3DB661B
	    wds[13] = 0x5AAF94C0
	elseif wd == "神秘石小礼包" then
		wds[1] = "内含一套11-20级神秘石10颗，右键打开获得"
		wds[2] = "宝石礼包"
		wds[3] = 5
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xA3DB661B
	    wds[13] = 0x5AAF94C0
	elseif wd == "星辉石小礼包" then
		wds[1] = "内含一套11-20级星辉石10颗，右键打开获得"
		wds[2] = "宝石礼包"
		wds[3] = 5
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xA3DB661B
	    wds[13] = 0x5AAF94C0
	    elseif wd == "太阳石大礼包" then
		wds[1] = "内含一套21-30级太阳石10颗，右键打开获得"
		wds[2] = "宝石礼包"
		wds[3] = 5
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xD6363DD6
	    wds[13] = 0x5FBAB8DC
	elseif wd == "红玛瑙大礼包" then
		wds[1] = "内含一套21-30级红玛瑙10颗，右键打开获得"
		wds[2] = "宝石礼包"
		wds[3] = 5
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xD6363DD6
	    wds[13] = 0x5FBAB8DC
	elseif wd == "舍利子大礼包" then
		wds[1] = "内含一套21-30级舍利子10颗，右键打开获得"
		wds[2] = "宝石礼包"
		wds[3] = 5
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xD6363DD6
	    wds[13] = 0x5FBAB8DC
	elseif wd == "黑宝石大礼包" then
		wds[1] = "内含一套21-30级黑宝石10颗，右键打开获得"
		wds[2] = "宝石礼包"
		wds[3] = 5
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xD6363DD6
	    wds[13] = 0x5FBAB8DC
	elseif wd == "光芒石大礼包" then
		wds[1] = "内含一套21-30级光芒石10颗，右键打开获得"
		wds[2] = "宝石礼包"
		wds[3] = 5
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xD6363DD6
	    wds[13] = 0x5FBAB8DC
	elseif wd == "月亮石大礼包" then
		wds[1] = "内含一套21-30级月亮石10颗，右键打开获得"
		wds[2] = "宝石礼包"
		wds[3] = 5
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xD6363DD6
	    wds[13] = 0x5FBAB8DC
	elseif wd == "神秘石大礼包" then
		wds[1] = "内含一套21-30级神秘石10颗，右键打开获得"
		wds[2] = "宝石礼包"
		wds[3] = 5
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xD6363DD6
	    wds[13] = 0x5FBAB8DC
	elseif wd == "星辉石大礼包" then
		wds[1] = "内含一套21-30级星辉石10颗，右键打开获得"
		wds[2] = "宝石礼包"
		wds[3] = 5
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xD6363DD6
	    wds[13] = 0x5FBAB8DC

 	elseif wd == "无影神针" then
        wds[1] = "著名暗器，特点为伤害力较大，极不宜防范"
        wds[2] = 2000
        wds[3] = 40
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0x961527F8
        wds[13] = 0x9E5D7895
        -- 光环
	elseif wd == "碧雨新荷" then
		wds[1] = "初夏正清和，鱼戏动新荷，西湖十里好烟波。\n【加成】#S100防御"
		wds[2] = 2
		wds[3] = 16
		wds[4] = 2
		wds[5] = 60
	    wds[11] = "item.wd11"
	    wds[12] = 0x00001037
	    wds[13] = 0x00001036
	elseif wd == "彩云追月" then
		wds[1] = "彩云追月，桂子飘香。\n【加成】#S100防御"
		wds[2] = 2
		wds[3] = 16
		wds[4] = 2
		wds[5] = 60
	    wds[11] = "item.wd11"
	    wds[12] = 0x00001039
	    wds[13] = 0x00001038
	elseif wd == "地拍鼠" then
		wds[1] = "帐内爆盐垆中，烧地拍鼠。\n【加成】#S100防御"
		wds[2] = 2
		wds[3] = 16
		wds[4] = 2
		wds[5] = 60
	    wds[11] = "item.wd11"
	    wds[12] = 0x00001040
	    wds[13] = 0x00001041
	elseif wd == "飞灯溢彩" then
		wds[1] = "【类型】#S光环\n【加成】#S100防御"
		wds[2] = 2
		wds[3] = 16
		wds[4] = 2
		wds[5] = 60
	    wds[11] = "item.wd11"
	    wds[12] = 0x00001043
	    wds[13] = 0x00001042
	elseif wd == "飞云游龙-金" then
		wds[1] = "上穷九霄，下抵黄泉;呼风唤雨，飞云游龙。\n【加成】#S100防御"
		wds[2] = 2
		wds[3] = 16
		wds[4] = 2
		wds[5] = 60
	    wds[11] = "item.wd11"
	    wds[12] = 0x00001045
	    wds[13] = 0x00001044
	elseif wd == "飞云游龙-墨" then
		wds[1] = "上穷九霄，下抵黄泉;呼风唤雨，飞云游龙。\n【加成】#S100防御"
		wds[2] = 2
		wds[3] = 16
		wds[4] = 2
		wds[5] = 60
	    wds[11] = "item.wd11"
	    wds[12] = 0x00001047
	    wds[13] = 0x00001046
	elseif wd == "飞云游龙-紫" then
		wds[1] = "上穷九霄，下抵黄泉;呼风唤雨，飞云游龙。\n【加成】#S100防御"
		wds[2] = 2
		wds[3] = 16
		wds[4] = 2
		wds[5] = 60
	    wds[11] = "item.wd11"
	    wds[12] = 0x00001049
	    wds[13] = 0x00001048
	elseif wd == "河灯寄思" then
		wds[1] = "火里连花水上开，乱红深绿共徘徊。\n【加成】#S100防御"
		wds[2] = 2
		wds[3] = 16
		wds[4] = 2
		wds[5] = 60
	    wds[11] = "item.wd11"
	    wds[12] = 0x00001050
	    wds[13] = 0x00001070
	elseif wd == "火树银花" then
		wds[1] = "火树银花不夜天, 弟兄姐妹舞翩跹。\n【加成】#S100防御"
		wds[2] = 2
		wds[3] = 16
		wds[4] = 2
		wds[5] = 60
	    wds[11] = "item.wd11"
	    wds[12] = 0x00001052
	    wds[13] = 0x00001051
	elseif wd == "流光飞舞" then
		wds[1] = "拂堤杨柳醉春烟，静看流光飞舞。\n【加成】#S100防御"
		wds[2] = 2
		wds[3] = 16
		wds[4] = 2
		wds[5] = 60
	    wds[11] = "item.wd11"
	    wds[12] = 0x00001054
	    wds[13] = 0x00001053
	elseif wd == "菩提" then
		wds[1] = "菩提本无树,明镜亦非台。\n【加成】#S100防御"
		wds[2] = 2
		wds[3] = 16
		wds[4] = 2
		wds[5] = 60
	    wds[11] = "item.wd11"
	    wds[12] = 0x00001056
	    wds[13] = 0x00001055
	elseif wd == "踏雪寻梅" then
		wds[1] = "寂寥抱冬心,踏雪寻梅时。\n【加成】#S100防御"
		wds[2] = 2
		wds[3] = 16
		wds[4] = 2
		wds[5] = 60
	    wds[11] = "item.wd11"
	    wds[12] = 0x00001058
	    wds[13] = 0x00001057
	elseif wd == "天涯海角" then
		wds[1] = "天涯地角有穷时，只有相思无尽处。\n【加成】#S100防御"
		wds[2] = 2
		wds[3] = 16
		wds[4] = 2
		wds[5] = 60
	    wds[11] = "item.wd11"
	    wds[12] = 0x00001059
	    wds[13] = 0x00001071
	elseif wd == "天涯明月" then
		wds[1] = "海上生明月,天涯共此时。\n【加成】#S100防御"
		wds[2] = 2
		wds[3] = 16
		wds[4] = 2
		wds[5] = 60
	    wds[11] = "item.wd11"
	    wds[12] = 0x00001060
	    wds[13] = 0x00001072
	elseif wd == "唯你一人" then
		wds[1] = "弱水三干，只取一瓢饮。人世扰扰，唯见你一人。\n【加成】#S100防御"
		wds[2] = 2
		wds[3] = 16
		wds[4] = 2
		wds[5] = 60
	    wds[11] = "item.wd11"
	    wds[12] = 0x00001062
	    wds[13] = 0x00001061
	elseif wd == "星汉未央" then
		wds[1] = "细勘北斗沧集阔，星汉西流夜未央。\n【加成】#S100防御"
		wds[2] = 2
		wds[3] = 16
		wds[4] = 2
		wds[5] = 60
	    wds[11] = "item.wd11"
	    wds[12] = 0x00001064
	    wds[13] = 0x00001063
	elseif wd == "雪中趣" then
		wds[1] = "冬雪有佳趣。\n【加成】#S100防御"
		wds[2] = 2
		wds[3] = 16
		wds[4] = 2
		wds[5] = 60
	    wds[11] = "item.wd11"
	    wds[12] = 0x00001066
	    wds[13] = 0x00001065
	elseif wd == "与子偕老" then
		wds[1] = "执子之手与子偕老。\n【加成】#S100防御"
		wds[2] = 2
		wds[3] = 16
		wds[4] = 2
		wds[5] = 60
	    wds[11] = "item.wd11"
	    wds[12] = 0x00001068
	    wds[13] = 0x00001067
	elseif wd == "竹韵" then
		wds[1] = "竹径通幽处,禅房花木深。\n【加成】#S100防御"
		wds[2] = 2
		wds[3] = 16
		wds[4] = 2
		wds[5] = 60
	    wds[11] = "item.wd11"
	    wds[12] = 0x00001069
	    wds[13] = 0x00001073
 	elseif wd == "孔雀翎" then
        wds[1] = "传说中的暗器，据说伤人例不虚发"
        wds[2] = 2000
        wds[3] = 50
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0xB2657A38
        wds[13] = 0x454FC9EB
 	elseif wd == "含沙射影" then
        wds[1] = "传说中的暗器，扣动机关，万针齐射，非常不易防"
        wds[2] = 2000
        wds[3] = 60
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0xBE43C96E
        wds[13] = 0xE4366820
 	elseif wd == "回龙摄魂标" then
        wds[1] = "著名暗器，发出时阴风阵阵，令人防不胜防"
        wds[2] = 2000
        wds[3] = 70
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0xCD324F8E
        wds[13] = 0x3EF314E5
 	elseif wd == "寸阴若梦" then
        wds[1] = "来自阴府的暗器，甩出时带动惨惨阴风"
        wds[2] = 2000
        wds[3] = 80
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0xFB2A8F4C
        wds[13] = 0x57255C54
 	elseif wd == "魔睛子" then
        wds[1] = "魔王妖王所用的邪恶暗器，会自己追被攻击人"
        wds[2] = 2000
        wds[3] = 90
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0x82A15466
        wds[13] = 0x69404DEA
 	elseif wd == "顺逆神针" then
        wds[1] = "此暗器，一旦被伤害，神针不易取出，极为厉害"
        wds[2] = 2000
        wds[3] = 100
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0xA1716F61
        wds[13] = 0x7AFB7396
	elseif wd == "修篁斧" then
		wds[1] = "仙界的五行秘宝之一，为普陀山砍伐紫竹之物。"
		wds[2] = 150
		wds[3] = 1
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0x25F0FF04
	    wds[13] = 0x34EF726D
	elseif wd == "炼金鼎" then
		wds[1] = "仙界的五行秘宝之一，为五庄观修炼金丹之物。 "
		wds[2] = 150
		wds[3] = 1
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0x6BEC70D0
	    wds[13] = 0x45968E54
	elseif wd == "定海针" then
		wds[1] = "仙界的五行秘宝之一，为龙宫的镇海之宝。"
		wds[2] = 150
		wds[3] = 1
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0xF524FB0F
	    wds[13] = 0xD75D34DE
	-- 其他
	elseif wd == "凤头钗" then
		wds[1] = "雕刻着凤头的金钗，可以起到防御的作用"
		wds[2] = 2
		wds[3] = 1
		wds[4] = 1
	    wds[5] = 40
	    wds[6] = "女"
	    wds[11] = "item.wdf"
	    wds[12] = 1305963475
	    wds[13] = 1323749060
	elseif wd == "雁翅刀" then
		wds[1] = "刀背布满粗大的锯齿，上挂银环，铿锵入耳如雁过九天"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 12
	    wds[5] = 40
	    wds[7] = {"剑侠客","巨魔王"}
	    wds[11] = "item.wdf"
	    wds[12] = 1719719282
	    wds[13] = 3277123413
	elseif wd == "面具" then
		wds[1] = "用皮制的面具，可以起到防御的作用"
		wds[2] = 2
		wds[3] = 1
		wds[4] = 1
	    wds[5] = 20
	    wds[6] = "男"
	    wds[11] = "item.wdf"
	    wds[12] = 1622680174
	    wds[13] = 544766765
	elseif wd == "勾魂爪" then
		wds[1] = "状似银勾，夺命勾魂"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 6
	    wds[5] = 40
	    wds[7] = {"狐美人","骨精灵","鬼潇潇"}
	    wds[11] = "item.wdf"
	    wds[12] = 2945873492
	    wds[13] = 3529952713
	elseif wd == "铁腕" then
		wds[1] = "铁做的护腕，可以起到伤害力"
		wds[2] = 2
		wds[3] = 7
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 2535965770
	    wds[13] = 1102893761
	elseif wd == "皮衣" then
		wds[1] = "用兽皮制的皮衣，防御力较布衣要好的多"
		wds[2] = 2
		wds[3] = 4
		wds[4] = 1
	    wds[5] = 10
	    wds[6] = "男"
	    wds[11] = "item.wdf"
	    wds[12] = 1569129428
	    wds[13] = 4004133926
	elseif wd == "双面斧" then
		wds[1] = "两面均制成半月状锋刃，双面制敌，力猛势强"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 2
	    wds[5] = 20
	    wds[7] = {"巨魔王","虎头怪"}
	    wds[11] = "item.wdf"
	    wds[12] = 595341788
	    wds[13] = 917777182
	elseif wd == "七彩罗刹" then
		wds[1] = "用各式丝绸编织而成的丝带"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 5
	    wds[5] = 60
	    wds[7] = {"舞天姬","玄彩娥","桃夭夭"}
	    wds[11] = "item.wdf"
	    wds[12] = 4216697314
	    wds[13] = 1196299810
	elseif wd == "五色飞石" then
		wds[1] = "仙人炼制的饰品，佩带在身上有极强的法力作用"
		wds[2] = 2
		wds[3] = 2
		wds[4] = 1
	    wds[5] = 10
	    wds[11] = "item.wdf"
	    wds[12] = 3139664596
	    wds[13] = 374271655
	elseif wd == "梅花簪子" then
		wds[1] = "因簪子外端有梅花形状而得名，可以起到防御作用"
		wds[2] = 2
		wds[3] = 1
		wds[4] = 1
	    wds[5] = 20
	    wds[6] = "女"
	    wds[11] = "item.wdf"
	    wds[12] = 2353187566
	    wds[13] = 3355592593
	elseif wd == "霓裳羽衣" then
		wds[1] = "非常美丽的羽衣，可以起到一定的防御作用"
		wds[2] = 2
		wds[3] = 4
		wds[4] = 1
	    wds[5] = 60
	    wds[6] = "女"
	    wds[11] = "item.wdf"
	    wds[12] = 3005484634
	    wds[13] = 2665296729
	elseif wd == "黄金钺" then
		wds[1] = "以华丽的黄金装饰,使其更加沉重威猛,金光起处血光飞溅"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 2
	    wds[5] = 50
	    wds[7] = {"巨魔王","虎头怪"}
	    wds[11] = "item.wdf"
	    wds[12] = 804669659
	    wds[13] = 3468478581
	elseif wd == "魔兽要诀" then
		wds[1] = "记载着上古魔兽特技，可供你的召唤兽学习。"
		wds[2] = 3
		wds[3] = 1
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 1241924823
	    wds[13] = 2950829831
  	elseif wd == "高级魔兽要诀" then
		wds[1] = "记载着上古魔兽特技，可供你的召唤兽学习。"
		wds[2] = 3
		wds[3] = 1
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0x6CAD36E8
	    wds[13] = 0xD86D89B8
	elseif wd == "召唤兽内丹" then
		wds[1] = "上古魔兽遗留下来的精气经万年而成的内丹，可供你的召唤兽学习。"
		wds[2] = 3
		wds[3] = 3
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0x722F3F52
	    wds[13] = 0x46D073B2
	elseif wd == "高级召唤兽内丹" then
		wds[1] = "上古魔兽遗留下来的精气经万年而成的高级内丹，可供你的召唤兽学习。"
		wds[2] = 3
		wds[3] = 3
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0x02A776DE
	    wds[13] = 0x4E43EBFF
	elseif wd == "龙鳞羽衣" then
		wds[1] = "用龙鳞制成的羽衣，有相当的防御力"
		wds[2] = 2
		wds[3] = 4
		wds[4] = 1
	    wds[5] = 30
	    wds[6] = "女"
	    wds[11] = "item.wdf"
	    wds[12] = 4057563157
	    wds[13] = 2734928170
	elseif wd == "夜灵珠" then
		wds[1] = "白日之时看似平平无奇，置于灯火昏昏之处，方有幽光融融。其夜愈深，而光华愈明。"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 15
	    wds[5] = 50
	    wds[7] = {"巫蛮儿","杀破狼"}
	    wds[11] = "common/item.wdf"
	    wds[12] = 3855395369
	    wds[13] = 814300484
	elseif wd == "风月宝链" then
		wds[1] = "名家制成的精致饰品，佩带在身上有较强的法力作用"
		wds[2] = 2
		wds[3] = 2
		wds[4] = 1
	    wds[5] = 60
	    wds[11] = "item.wdf"
	    wds[12] = 91099687
	    wds[13] = 1990243519
	elseif wd == "云龙绸带" then
		wds[1] = "绸如云彩，龙隐其间"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 5
	    wds[5] = 50
	    wds[7] = {"舞天姬","玄彩娥","桃夭夭"}
	    wds[11] = "item.wdf"
	    wds[12] = 140457428
	    wds[13] = 4041408902
	elseif wd == "黄色导标旗" then
		wds[1] = "集导标旗之大成，江湖遁形所用，奇人异士必备之物。"
		wds[2] = 11
		wds[3] = 1
		wds[4] = 20
	    wds[11] = "item.wdf"
	    wds[12] = 1953229980
	    wds[13] = 1011605557
	    wds[14] = 13000
  elseif wd == "蓝色合成旗" then
		wds[1] = "集导标旗之大成，江湖遁形所用，奇人异士必备之物。"
		wds[2] = 11
		wds[3] = 2
		wds[4] = 20
	    wds[11] = "item.wdf"
	    wds[12] = 0x78C6828D
	    wds[13] = 0x4D27A80E
	    wds[14] = 13000
   elseif wd == "绿色合成旗" then
		wds[1] = "集导标旗之大成，江湖遁形所用，奇人异士必备之物。"
		wds[2] = 11
		wds[3] = 2
		wds[4] = 20
	    wds[11] = "item.wdf"
	    wds[12] = 0xC87EF093
	    wds[13] = 0x498354A0
	    wds[14] = 13000
   elseif wd == "黄色合成旗" then
		wds[1] = "集导标旗之大成，江湖遁形所用，奇人异士必备之物。"
		wds[2] = 11
		wds[3] = 2
		wds[4] = 20
	    wds[11] = "item.wdf"
	    wds[12] = 0x409FA7D1
	    wds[13] = 0x3D64E066
	    wds[14] = 13000
    elseif wd == "白色合成旗" then
		wds[1] = "集导标旗之大成，江湖遁形所用，奇人异士必备之物。"
		wds[2] = 11
		wds[3] = 2
		wds[4] = 20
	    wds[11] = "item.wdf"
	    wds[12] = 0x306FE9B9
	    wds[13] = 0xB06EE4C6
	    wds[14] = 13000
    elseif wd == "红色合成旗" then
		wds[1] = "集导标旗之大成，江湖遁形所用，奇人异士必备之物。"
		wds[2] = 11
		wds[3] = 2
		wds[4] = 20
	    wds[11] = "item.wdf"
	    wds[12] = 0x0DE87173
	    wds[13] = 0x4F8723DA
	    wds[14] = 13000
	elseif wd == "硬木弓" then
		wds[1] = "柳木头制成的短弓，质轻便携，很适合新手练习使用"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 14
	    wds[7] = {"羽灵神","杀破狼"}
	    wds[11] = "common/item.wdf"
	    wds[12] = 1102238567
	    wds[13] = 322855055
	elseif wd == "缎带" then
		wds[1] = "高级丝绸制成的腰带，能起到不错的防御作用"
		wds[2] = 2
		wds[3] = 5
		wds[4] = 1
	    wds[5] = 10
	    wds[11] = "item.wdf"
	    wds[12] = 3002795508
	    wds[13] = 4182781118
	elseif wd == "幽冥鬼爪" then
		wds[1] = "精钢打造，饰以冥文，透出森森鬼气"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 6
	    wds[5] = 20
	    wds[7] = {"狐美人","骨精灵","鬼潇潇"}
	    wds[11] = "item.wdf"
	    wds[12] = 473959188
	    wds[13] = 3711514054
	elseif wd == "五彩裙" then
		wds[1] = "五彩绵制成的裙子，可以起到一定的防御作用"
		wds[2] = 2
		wds[3] = 4
		wds[4] = 1
	    wds[5] = 20
	    wds[6] = "女"
	    wds[11] = "item.wdf"
	    wds[12] = 2890413629
	    wds[13] = 3454325495
	elseif wd == "河虾" then
		wds[1] = "生长在河水中的小虾"
		wds[2] = 10
		wds[3] = 1
		wds[4] = 2
	    wds[11] = "item.wdf"
	    wds[12] = 1697773646
	    wds[13] = 1542469648
	elseif wd == "墨铁拐" then
		wds[1] = "墨铁打造而成的法杖，冰冷坚硬，似乎含有奇妙的力量。"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 13
	    wds[5] = 30
	    wds[7] = {"巫蛮儿","羽灵神"}
	    wds[11] = "common/item.wdf"
	    wds[12] = 6277753
	    wds[13] = 2738948963
	elseif wd == "红色导标旗" then
		wds[1] = "集导标旗之大成，江湖遁形所用，奇人异士必备之物。"
		wds[2] = 11
		wds[3] = 1
		wds[4] = 10
	    wds[11] = "item.wdf"
	    wds[12] = 2856215948
	    wds[13] = 3379177744
	    wds[14] = 7000
	elseif wd == "玄铁矛" then
		wds[1] = "枪头玄铁制成，宽大沉重，可刺可砍，威势不可挡"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 1
	    wds[5] = 60
	    wds[7] = {"神天兵","龙太子"}
	    wds[11] = "item.wdf"
	    wds[12] = 4108563339
	    wds[13] = 1450072521
	elseif wd == "双弦钺" then
		wds[1] = "铁杆黝黑，银月如弦，舞动时眩人眼目"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 2
	    wds[5] = 30
	    wds[7] = {"巨魔王","虎头怪"}
	    wds[11] = "item.wdf"
	    wds[12] = 2083951632
	    wds[13] = 709060887
	elseif wd == "紫檀弓" then
		wds[1] = "精致的紫楠木弓箭，云纹雕花流畅雅致。"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 14
	    wds[5] = 20
	    wds[7] = {"羽灵神","杀破狼"}
	    wds[11] = "common/item.wdf"
	    wds[12] = 1817338084
	    wds[13] = 1474683356
	elseif wd == "绿色导标旗" then
		wds[1] = "集导标旗之大成，江湖遁形所用，奇人异士必备之物。"
		wds[2] = 11
		wds[3] = 1
		wds[4] = 100
	    wds[11] = "item.wdf"
	    wds[12] = 1060779522
	    wds[13] = 662138631
	    wds[14] = 120000
	elseif wd == "开山斧" then
		wds[1] = "铁铸的巨大战斧，沉重无比，力大者用以开石裂碑"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 2
	    wds[5] = 10
	    wds[7] = {"巨魔王","虎头怪"}
	    wds[11] = "item.wdf"
	    wds[12] = 2876225806
	    wds[13] = 511692637
	elseif wd == "神行靴" then
		wds[1] = "非常轻便的靴子，可以起到防御的作用"
		wds[2] = 2
		wds[3] = 6
		wds[4] = 1
	    wds[5] = 40
	    wds[11] = "item.wdf"
	    wds[12] = 3963558258
	    wds[13] = 1110999757
	elseif wd == "风火圈" then
		wds[1] = "钢制的边缘有似火焰般的刀锋"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 11
	    wds[5] = 40
	    wds[7] = {"飞燕女","舞天姬"}
	    wds[11] = "item.wdf"
	    wds[12] = 3696047428
	    wds[13] = 3443374908
	elseif wd == "幽路引魂" then
		wds[1] = "通体乌黑，引魂归冥"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 8
	    wds[5] = 50
	    wds[7] = {"玄彩娥","骨精灵"}
	    wds[11] = "item.wdf"
	    wds[12] = 3655607718
	    wds[13] = 496189030
	elseif wd == "蓝色导标旗" then
		wds[1] = "集导标旗之大成，江湖遁形所用，奇人异士必备之物。"
		wds[2] = 11
		wds[3] = 1
		wds[4] = 50
	    wds[11] = "item.wdf"
	    wds[12] = 53543608
	    wds[13] = 340145338
	    wds[14] = 60000
	elseif wd == "珍宝珠" then
		wds[1] = "东海海底方能寻得的巨大珍珠，光华缓缓流动，似是凝聚了海底之中游鱼的灵气。"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 15
	    wds[5] = 20
	    wds[7] = {"巫蛮儿","杀破狼"}
	    wds[11] = "common/item.wdf"
	    wds[12] = 2649110916
	    wds[13] = 1758505762
	elseif wd == "青铜短剑" then
		wds[1] = "青铜制成，上铸有简单的图案纹饰，初学者练习常用"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 3
	    wds[7] = {"逍遥生","剑侠客","偃无师"}
	    wds[11] = "item.wdf"
	    wds[12] = 1261240304
	    wds[13] = 4201657972
	elseif wd == "玉钗" then
		wds[1] = "用玉制成的钗，可以起到防御作用"
		wds[2] = 2
		wds[3] = 1
		wds[4] = 1
	    wds[5] = 10
	    wds[6] = "女"
	    wds[11] = "item.wdf"
	    wds[12] = 509457918
	    wds[13] = 3519518702
	elseif wd == "毛蟹" then
		wds[1] = "常见于近海深水区域，身小壳薄，肉质细嫩而有香味"
		wds[2] = 10
		wds[3] = 2
		wds[4] = 4
	    wds[11] = "item.wdf"
	    wds[12] = 602109723
	    wds[13] = 3555868873
	elseif wd == "丝绸长裙" then
		wds[1] = "用名贵丝绸制成的长裙，女子用，可以起到防御作用"
		wds[2] = 2
		wds[3] = 4
		wds[4] = 1
	    wds[5] = 10
	    wds[6] = "女"
	    wds[11] = "item.wdf"
	    wds[12] = 1759000550
	    wds[13] = 451022751
	elseif wd == "绿靴" then
		wds[1] = "绿水晶制成的鞋子，防御作用非常的强"
		wds[2] = 2
		wds[3] = 6
		wds[4] = 1
	    wds[5] = 50
	    wds[11] = "item.wdf"
	    wds[12] = 2631819456
	    wds[13] = 3993409018
	elseif wd == "布裙" then
		wds[1] = "普通的布裙，女子用，可以起到防御的作用"
		wds[2] = 2
		wds[3] = 4
		wds[4] = 1
	    wds[6] = "女"
	    wds[11] = "item.wdf"
	    wds[12] = 2415237558
	    wds[13] = 4137686182
	elseif wd == "荧光坠子" then
		wds[1] = "有荧光的宝石，佩带在身上有相当强的法力作用"
		wds[2] = 2
		wds[3] = 2
		wds[4] = 1
	    wds[5] = 50
	    wds[11] = "item.wdf"
	    wds[12] = 240077184
	    wds[13] = 4212393181
	elseif wd == "龙凤双剑" then
		wds[1] = "双剑剑身一刻龙纹一刻凤饰，可同入一鞘"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 4
	    wds[5] = 20
	    wds[7] = {"英女侠","飞燕女"}
	    wds[11] = "item.wdf"
	    wds[12] = 2574377494
	    wds[13] = 2688315512
	elseif wd == "破甲战锤" then
		wds[1] = "精钢打造的巨型战锤，上部粗大的尖齿，可破甲裂碑"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 9
	    wds[5] = 50
	    wds[7] = {"神天兵","虎头怪"}
	    wds[11] = "item.wdf"
	    wds[12] = 2961406351
	    wds[13] = 2582952463
	elseif wd == "骷髅吊坠" then
		wds[1] = "皮绳上吊着一个骷髅，佩带在身上有一定法力作用"
		wds[2] = 2
		wds[3] = 2
		wds[4] = 1
	    wds[5] = 30
	    wds[11] = "item.wdf"
	    wds[12] = 3414243240
	    wds[13] = 3509217536
	elseif wd == "神火扇" then
		wds[1] = "扇面用红绸制，此扇动则似神火四起，使敌人心不能宁"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 7
	    wds[5] = 60
	    wds[7] = {"逍遥生","龙太子"}
	    wds[11] = "item.wdf"
	    wds[12] = 1646280508
	    wds[13] = 2148260737
	elseif wd == "玉如意" then
		wds[1] = "细长的白玉棒，白玉使魔棒能力得到加强"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 8
	    wds[5] = 20
	    wds[7] = {"玄彩娥","骨精灵"}
	    wds[11] = "item.wdf"
	    wds[12] = 1722461164
	    wds[13] = 4043165218
	elseif wd == "狼牙双剑" then
		wds[1] = "剑身向前方密布粗长的狼牙锯齿，令人胆寒长"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 4
	    wds[5] = 40
	    wds[7] = {"英女侠","飞燕女"}
	    wds[11] = "item.wdf"
	    wds[12] = 1830383421
	    wds[13] = 885886005
	elseif wd == "海马" then
		wds[1] = "生活在热带及温带深海，头部弯曲，形状与马头相似"
		wds[2] = 10
		wds[3] = 3
		wds[4] = 2
	    wds[11] = "item.wdf"
	    wds[12] = 2901285604
	    wds[13] = 2563380359
	elseif wd == "铁骨扇" then
		wds[1] = "铁制的扇骨会对敌人造成较大的威胁"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 7
	    wds[5] = 10
	    wds[7] = {"逍遥生","龙太子"}
	    wds[11] = "item.wdf"
	    wds[12] = 290823954
	    wds[13] = 1443372759
	elseif wd == "金枪鱼" then
		wds[1] = "温热带海洋鱼类，身型细长，游速非常快"
		wds[2] = 10
		wds[3] = 3
		wds[4] = 5
	    wds[11] = "item.wdf"
	    wds[12] = 1109845536
	    wds[13] = 3822216681
	elseif wd == "玄铁牛角杖" then
		wds[1] = "用寒铁锻冶的牛角状法杖，尖锐坚硬，闪着寒光，隐含奇妙的法力。"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 13
	    wds[5] = 40
	    wds[7] = {"巫蛮儿","羽灵神"}
	    wds[11] = "common/item.wdf"
	    wds[12] = 3096649690
	    wds[13] = 1043225710
	elseif wd == "纶巾" then
		wds[1] = "真丝织成的白色头巾，可以起到防御的作用"
		wds[2] = 2
		wds[3] = 1
		wds[4] = 1
	    wds[5] = 30
	    wds[6] = "男"
	    wds[11] = "item.wdf"
	    wds[12] = 1730098396
	    wds[13] = 2497291232
	elseif wd == "玉女发冠" then
		wds[1] = "仙女常带的头环，有相当强的防御力"
		wds[2] = 2
		wds[3] = 1
		wds[4] = 1
	    wds[5] = 60
	    wds[6] = "女"
	    wds[11] = "item.wdf"
	    wds[12] = 3770740399
	    wds[13] = 438307144
	elseif wd == "媚狐头饰" then
		wds[1] = "狐眼嵌着宝石的狐头帽，魔女们喜爱的头饰"
		wds[2] = 2
		wds[3] = 1
		wds[4] = 1
	    wds[5] = 50
	    wds[6] = "女"
	    wds[11] = "item.wdf"
	    wds[12] = 413224440
	    wds[13] = 798712466
	elseif wd == "鲤鱼" then
		wds[1] = "淡水鱼类，肉质坚实，味道鲜美"
		wds[2] = 10
		wds[3] = 3
		wds[4] = 5
	    wds[11] = "item.wdf"
	    wds[12] = 3865632193
	    wds[13] = 2442761904
	elseif wd == "折扇" then
		wds[1] = "普通的纸扇改装而成，可以此练习最基本的使扇方法"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 7
	    wds[7] = {"逍遥生","龙太子"}
	    wds[11] = "item.wdf"
	    wds[12] = 3563784870
	    wds[13] = 817774560
	elseif wd == "甲鱼" then
		wds[1] = "两栖爬行动物，有坚硬厚实的甲壳，行动缓慢但寿命比较长"
		wds[2] = 10
		wds[3] = 3
		wds[4] = 4
	    wds[11] = "item.wdf"
	    wds[12] = 174833964
	    wds[13] = 3829834695
	elseif wd == "破天宝刀" then
		wds[1] = "刀光八面，劈风破天"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 12
	    wds[5] = 50
	    wds[7] = {"剑侠客","巨魔王"}
	    wds[11] = "item.wdf"
	    wds[12] = 1201880064
	    wds[13] = 3191505206
	elseif wd == "河豚" then
		wds[1] = "肉食鱼类，主要捕食小鱼小虾和贝类，部分内脏有毒，但肉味非常鲜美，是难得的佳肴"
		wds[2] = 10
		wds[3] = 3
		wds[4] = 4
	    wds[11] = "item.wdf"
	    wds[12] = 2328042941
	    wds[13] = 2165741719
	elseif wd == "夜魔弯刀" then
		wds[1] = "精钢制成的细弯刀，刀背密布细齿，如夜魔之牙。"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 12
	    wds[5] = 20
	    wds[7] = {"剑侠客","巨魔王"}
	    wds[11] = "item.wdf"
	    wds[12] = 2386679785
	    wds[13] = 2763619781
	elseif wd == "娃娃鱼" then
		wds[1] = "生活在山区的溪流湖泊中，形象可爱"
		wds[2] = 10
		wds[3] = 3
		wds[4] = 6
	    wds[11] = "item.wdf"
	    wds[12] = 2884328689
	    wds[13] = 1455411021
	elseif wd == "水晶珠" then
		wds[1] = "晶莹水晶打磨而成的水晶球，发出微微的光晕。"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 15
	    wds[5] = 10
	    wds[7] = {"巫蛮儿","杀破狼"}
	    wds[11] = "common/item.wdf"
	    wds[12] = 424958581
	    wds[13] = 517101356
	elseif wd == "丁香水" then
		wds[1] = "从仙岛上的丁香花中精心提炼而成"
		wds[2] = 1
		wds[3] = 1
		wds[4] = 2
	    wds[8] = 2
	    wds[10] = 75
	    wds[11] = "item.wdf"
	    wds[12] = 870043705
	    wds[13] = 598856410
	    wds[14] = 1000
	elseif wd == "河蟹" then
		wds[1] = "体型较大的淡水蟹，常见于深水湖泊之中"
		wds[2] = 10
		wds[3] = 2
		wds[4] = 3
	    wds[11] = "item.wdf"
	    wds[12] = 1298631470
	    wds[13] = 3041830860
	elseif wd == "草鱼" then
		wds[1] = "淡水鱼类，因喜食水草而得名"
		wds[2] = 10
		wds[3] = 2
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 3951553868
	    wds[13] = 1888688338
	elseif wd == "沙丁鱼" then
		wds[1] = "常见海洋鱼类，身型小巧，行动敏捷，喜好群居于暖水海区"
		wds[2] = 10
		wds[3] = 1
		wds[4] = 4
	    wds[11] = "item.wdf"
	    wds[12] = 1219611956
	    wds[13] = 3258862526
	elseif wd == "白色导标旗" then
		wds[1] = "集导标旗之大成，江湖遁形所用，奇人异士必备之物。"
		wds[2] = 11
		wds[3] = 1
		wds[4] = 5
	    wds[11] = "item.wdf"
	    wds[12] = 2217728758
	    wds[13] = 1751361785
	    wds[14] = 1500
	elseif wd == "乌金鬼头镰" then
		wds[1] = "乌金打造的巨镰，透出森森鬼气，令人不寒而栗"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 2
	    wds[5] = 60
	    wds[7] = {"巨魔王","虎头怪"}
	    wds[11] = "item.wdf"
	    wds[12] = 1269150805
	    wds[13] = 2315090325
	elseif wd == "对虾" then
		wds[1] = "常栖于沿岸浅海，肉质鲜嫩，营养丰富"
		wds[2] = 10
		wds[3] = 1
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 1712326570
	    wds[13] = 2200846910
	elseif wd == "玉树腰带" then
		wds[1] = "玉树之丝绦制成的腰带，能起到较强的防御作用"
		wds[2] = 2
		wds[3] = 5
		wds[4] = 1
	    wds[5] = 30
	    wds[11] = "item.wdf"
	    wds[12] = 1806472204
	    wds[13] = 3616026443
	elseif wd == "神兽精元" then
		wds[1] = "传说中的神兽遗留下来的精元"
		wds[2] = 9
		wds[3] = 2
		wds[4] = 1
	    wds[9] = 0
	    wds[10] = 0
	    wds[11] = "common/item.wdf"
	    wds[12] = 2858010774
	    wds[13] = 1581676023
	    wds[14] = 0
	elseif wd == "镔铁双剑" then
		wds[1] = "铁制双短剑，轻巧实用"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 4
	    wds[5] = 10
	    wds[7] = {"英女侠","飞燕女"}
	    wds[11] = "item.wdf"
	    wds[12] = 1169767913
	    wds[13] = 2278749441
	elseif wd == "飞行符" then
		wds[1] = "一种神奇的符咒，使用后可以穿梭于各大陆之间"
		wds[2] = 9
		wds[3] = 1
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 3496860737
	    wds[13] = 2592521580
	    wds[14] = 500
	elseif wd == "灵箓" then
		wds[1] = "一种神奇的符咒，使用后可以将灵饰特性清除"
		wds[2] = 9
		wds[3] = 1
		wds[4] = 1
	    wds[11] = "common/item.wdf"
	    wds[12] = 0x14577FB6
	    wds[13] = 0x6B665BCC
	    wds[14] = 500

	elseif wd == "黄帝内经" then
		wds[1] = "一种神奇的符咒，使用后可以将灵饰特性清除"
		wds[2] = 9
		wds[3] = 1
		wds[4] = 1
	    wds[11] = "common/item.wdf"
	    wds[12] = 0x79DCE38D
	    wds[13] = 0xA83EBDBE
	    wds[14] = 500
	elseif wd == "蚩尤武诀" then
		wds[1] = "一种神奇的符咒，使用后可以将灵饰特性清除"
		wds[2] = 9
		wds[3] = 1
		wds[4] = 1
	    wds[11] = "common/item.wdf"
	    wds[12] = 0xF5CC975D
	    wds[13] = 0xFFA98C67
	    wds[14] = 500


 	elseif wd == "钟灵石" then
		wds[1] = "如星光一样璀璨的宝石，散发出耀眼的光芒。用于幻化灵饰额外效果。"
		wds[2] = 5
		wds[3] = 6
		wds[4] = 8
	    wds[11] = "item.wd1"
	    wds[12] = 0x01000001
	    wds[13] = 0x01000002
	elseif wd == "魔兽残卷" then
		wds[1] = "上古魔兽遗留下来的意志,听说唐王正在收集他们。(集齐300个可以找唐王兑换特殊兽决)"
		wds[2] = 9
		wds[3] = 1
		wds[4] = 1
	    wds[11] = "item.wdf"
        wds[12] = 0xC3AF882B
        wds[13] = 0xCFB770DD
	    wds[14] = 500
    elseif wd == "神兜兜" then
		wds[1] = "三界之内神兽们最喜欢的玩具，积攒99个，就可以获得一个随机神兽。"
		wds[2] = 9
		wds[3] = 11
		wds[4] = 0
        wds[8] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0x50808141
	    wds[13] = 0x65756770
    elseif wd == "超级神兜兜" then
		wds[1] = "积攒99个，就可以获得一个随机获得超级神狗、超级神鼠、超级神猪、超级猪小戒、超级小白龙、谛听、进阶谛听其中之一。"
		wds[2] = 9
		wds[3] = 11
		wds[4] = 0
        wds[8] = 1
	    wds[11] = "wzife.wd5"
	    wds[12] = 0x68D38BAA
	    wds[13] = 0x68D38BBB
    elseif wd == "锦衣碎片" then
		wds[1] = "积攒99个，随机兑换锦衣一件。"
		wds[2] = 9
		wds[3] = 11
		wds[4] = 0
        wds[8] = 1
	    wds[11] = "item.wd2"
	    wds[12] = 0xEEBBCA03
	    wds[13] = 0xEEBBCA04
    elseif wd == "光环碎片" then
		wds[1] = "积攒99个，随机兑换光环一件。"
		wds[2] = 9
		wds[3] = 11
		wds[4] = 0
        wds[8] = 1
	    wds[11] = "item.wd2"
	    wds[12] = 0x81313138
	    wds[13] = 0xA64E8031
    elseif wd == "足迹碎片" then
		wds[1] = "积攒99个，随机兑换足迹一件。"
		wds[2] = 9
		wds[3] = 11
		wds[4] = 0
        wds[8] = 1
	    wds[11] = "item.wd2"
	    wds[12] = 0xA6DF5BC7
	    wds[13] = 0x709745FE
	elseif wd == "抽奖令牌" then
		wds[1] = "大唐官府下发的令牌,右键使用可用触发1次转盘抽奖。"
		wds[2] = 9
		wds[3] = 1
		wds[4] = 1
	    wds[11] = "item.wd1"
	    wds[12] = 0XEC0F8B50
	    wds[13] = 0X890D6BB4
	    wds[14] = 500
	elseif wd == "召唤兽祈愿卡" then
		wds[1] = "凭此卡可通过GM定制12技能神兽（定制技能数量、资质,额外赠送一本神兽特殊技能）。"
		wds[2] = 9
		wds[3] = 1
		wds[4] = 1
	    wds[11] = "item.wd1"
	    wds[12] = 0X9D6D6E31
	    wds[13] = 0XEC97B229
	    wds[14] = 500
	elseif wd == "高级召唤兽祈愿卡" then
		wds[1] = "凭此卡可通过GM定制24技能神兽（仅定制技能数量、神兽资质，额外赠送四本神兽特殊技能、一本观照万象）。"
		wds[2] = 9
		wds[3] = 1
		wds[4] = 1
	    wds[11] = "item.wd1"
	    wds[12] = 0X8FEB441
	    wds[13] = 0X8709631F
	    wds[14] = 500
	elseif wd == "灵饰兑换卡" then
		wds[1] = "凭此卡可通过GM定制相应等级灵饰（单件）。"
		wds[2] = 9
		wds[3] = 1
		wds[4] = 1
	    wds[11] = "item.wd1"
	    wds[12] = 0XCC93AE96
	    wds[13] = 0XC0C982DE
	    wds[14] = 500

	elseif wd == "召唤兽装备兑换卡" then
		wds[1] = "凭此卡可通过GM定制相应位置召唤兽装备。"
		wds[2] = 9
		wds[3] = 1
		wds[4] = 1
	    wds[11] = "item.wd1"
	    wds[12] = 0X441D1265
	    wds[13] = 0XFCAA9BF0
	    wds[14] = 500
	elseif wd == "锦衣兑换卡" then
		wds[1] = "1张兑换锦衣，4张兑换限量称号，8张兑换限量坐骑。"
		wds[2] = 9
		wds[3] = 1
		wds[4] = 1
	    wds[11] = "item.wd1"
	    wds[12] = 0xA8412008
	    wds[13] = 0xEB59C078
	    wds[14] = 500
	elseif wd == "翡翠琵琶" then
		wds[1] = "使用翡翠制造而成的琵琶,蕴含巨大的灵气，使用可用获得5000点炼丹灵气。"
		wds[2] = 9
		wds[3] = 1
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0X24F1DB12
	    wds[13] = 0XEE96A30C
	    wds[14] = 500
	elseif wd == "金砂丹" then
		wds[1] = "使用可以获得100W银子。"
		wds[2] = 9
		wds[3] = 1
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0X5ECBF9DD
	    wds[13] = 0X389EAEC4
	    wds[14] = 500
	elseif wd == "银砂丹" then
		wds[1] = "使用可以获得10W银子"
		wds[2] = 9
		wds[3] = 1
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0X75E517A5
	    wds[13] = 0XBBBF65A1
	    wds[14] = 500
	elseif wd == "铜砂丹" then
		wds[1] = "使用可以获得1W银子"
		wds[2] = 9
		wds[3] = 1
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0XC36CA6B6
	    wds[13] = 0xE5F605BF
	    wds[14] = 500
	elseif wd == "初级神魂丹" then
		wds[1] = "一种神奇的丹药,集齐99个可以合成为中级神魂丹,使用中级神魂丹可以将初级助战提升为中级助战,能力大幅度提升！"
		wds[2] = 9
		wds[3] = 1
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0x25492E36
	    wds[13] = 0x663fc75A
	    wds[14] = 500
	elseif wd == "中级神魂丹" then
		wds[1] = "一种神奇的丹药,集齐99个可以合成为高级神魂丹,使用高级神魂丹可以将中级助战提升为高级助战,能力大幅度提升！"
		wds[2] = 9
		wds[3] = 1
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0x25492E36
	    wds[13] = 0x663fc75A
	    wds[14] = 500
	elseif wd == "高级神魂丹" then
		wds[1] = "一种神器的丹药,集齐99个可以合成为顶级神魂丹,使用顶级神魂丹可以将高级助战提升为顶级助战,能力大幅度提升！"
		wds[2] = 9
		wds[3] = 1
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0x25492E36
	    wds[13] = 0x663fc75A
	    wds[14] = 500
	elseif wd == "顶级神魂丹" then
		wds[1] = "一种神器的丹药,使用可以将高级助战提升为顶级助战,能力大幅度提升！"
		wds[2] = 9
		wds[3] = 1
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0x25492E36
	    wds[13] = 0x663fc75A
	    wds[14] = 500
	elseif wd == "坐骑内丹" then
		wds[1] = "使用可用使坐骑重新领悟技能！"
		wds[2] = 9
		wds[3] = 1
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0x25492E36
	    wds[13] = 0x663fc75A
	    wds[14] = 500
	elseif wd == "红木杖" then
		wds[1] = "用上好红木刻成的法杖，十分坚硬，内含一点奇妙的法力。"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 13
	    wds[5] = 10
	    wds[7] = {"巫蛮儿","羽灵神"}
	    wds[11] = "common/item.wdf"
	    wds[12] = 2519088005
	    wds[13] = 2809977168
	elseif wd == "蛇骨鞭" then
		wds[1] = "结似蛇骨，环环相联，抖动时骨节相撞，噼啪作响"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 10
	    wds[5] = 40
	    wds[7] = {"英女侠","狐美人"}
	    wds[11] = "item.wdf"
	    wds[12] = 2780394861
	    wds[13] = 2403200026
	elseif wd == "乌金三叉戟" then
		wds[1] = "玄铁长枪，头部以乌金打造，气势如虹"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 1
	    wds[5] = 30
	    wds[7] = {"神天兵","龙太子"}
	    wds[11] = "item.wdf"
	    wds[12] = 2487968590
	    wds[13] = 3770180780
	elseif wd == "藏宝图" then
		wds[1] = "一张记着藏宝地点的地图"
		wds[2] = 7
		wds[3] = 1
		wds[4] = 1
	    wds[9] = 0
	    wds[10] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 211127435
	    wds[13] = 1954996989
	elseif wd == "高级藏宝图" then
		wds[1] = "一张记着藏宝地点的地图"
		wds[2] = 7
		wds[3] = 1
		wds[4] = 1
	    wds[9] = 0
	    wds[10] = 0
	    wds[11] = "common/item.wdf"
	    wds[12] = 0xA3DF3AA3
	    wds[13] = 0x894D37C5
	elseif wd == "金缕羽衣" then
		wds[1] = "用金丝缝制的羽衣，可以起到一定的防御作用"
		wds[2] = 2
		wds[3] = 4
		wds[4] = 1
	    wds[5] = 50
	    wds[6] = "女"
	    wds[11] = "item.wdf"
	    wds[12] = 995989694
	    wds[13] = 4188048378
	elseif wd == "心魔宝珠" then
		wds[1] = "汲取野妖族精华而成，蕴含着无穷魔力的宝珠"
		wds[2] = 6
		wds[3] = 2
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 1153796395
	    wds[13] = 1350319491
	elseif wd == "铁爪" then
		wds[1] = "镔铁制成的铁爪"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 6
	    wds[7] = {"狐美人","骨精灵","鬼潇潇"}
	    wds[11] = "item.wdf"
	    wds[12] = 252413888
	    wds[13] = 3216807428
	elseif wd == "离情环" then
		wds[1] = "乌金铁环，通体乌黑，似悠悠离情"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 11
	    wds[5] = 20
	    wds[7] = {"飞燕女","舞天姬"}
	    wds[11] = "item.wdf"
	    wds[12] = 2588804470
	    wds[13] = 2925351135
	elseif wd == "分解符" then
		wds[1] = "用于分解装备"
		wds[2] = 5
		wds[3] = 3
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 3953209807
	    wds[13] = 3190197121
	elseif wd == "百炼精铁" then
		wds[1] = "精铁百炼而成，这种材料为神兵而存在。是用来合成装备的神奇矿石"
		wds[2] = 5
		wds[3] = 2
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 3971456754
	    wds[13] = 2585045399
	elseif wd == "随机百炼精铁" then
		wds[1] = "精铁百炼而成，这种材料为神兵而存在。是用来合成装备的神奇矿石"
		wds[2] = 5
		wds[3] = 8
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 3971456754
	    wds[13] = 2585045399
	  elseif wd == "巨剑·元身" then
        wds[1] = "等待被唤醒的洪荒巨剑，与战魄一起锻造为[长息]。"
        wds[2] = 66
        wds[3] = 1
        wds[4] = 0
        wds[11] = "xzsc.wdf"
        wds[12] = 0XD5E5ADD3
        wds[13] = 0X43CC0E3B
    elseif wd == "伞·元身" then
        wds[1] = "等待被唤醒的风云之伞，与战魄一起锻造成为[晴雪]。"
        wds[2] = 66
        wds[3] = 1
        wds[4] = 0
        wds[11] = "xzsc.wdf"
        wds[12] = 0XCB5C6EFD
        wds[13] = 0x47EA4C41
    elseif wd == "灯笼·元身" then
        wds[1] = "等待被唤醒的河汉之灯，与战魄一起锻造为[荒尘]。"
        wds[2] = 66
        wds[3] = 1
        wds[4] = 0
        wds[11] = "xzsc.wdf"
        wds[12] = 0x7AE2641F
        wds[13] = 0x4DCB3823
    elseif wd == "长杖·元身" then
        wds[1] = "等待被唤醒的天地之杖，与战魄一起锻造为[弦月]。"
        wds[2] = 66
        wds[3] = 1
        wds[4] = 0
        wds[11] = "xzsc.wdf"
        wds[12] = 0x3221FB78
        wds[13] = 0x7023E521
    elseif wd == "宝珠·元身" then
        wds[1] = "等待被唤醒的盘古之珠，与战魄一起锻造为[赤明]。"
        wds[2] = 66
        wds[3] = 1
        wds[4] = 0
        wds[11] = "xzsc.wdf"
        wds[12] = 0xAED3678B
        wds[13] = 0x9381644E
    elseif wd == "弓·元身" then
        wds[1] = "等待被唤醒的射日之弓，与战魄一起锻造为[若木]。"
        wds[2] = 66
        wds[3] = 1
        wds[4] = 0
        wds[11] = "xzsc.wdf"
        wds[12] = 0xCE170DFA
        wds[13] = 0x157E1425
    elseif wd == "扇·元身" then
        wds[1] = "等待被唤醒的玄冥之扇，与战魄一起锻造为[星瀚]。"
        wds[2] = 66
        wds[3] = 1
        wds[4] = 0
        wds[11] = "xzsc.wdf"
        wds[12] = 0x6DF2FD31
        wds[13] = 0x4370EED8
    elseif wd == "刀·元身" then
        wds[1] = "等待被唤醒的复仇之刀，与战魄一起锻造为[鸣鸿]。"
        wds[2] = 66
        wds[3] = 1
        wds[4] = 0
        wds[11] = "xzsc.wdf"
        wds[12] = 0x42313640
        wds[13] = 0xE8E78B92
    elseif wd == "剑·元身" then
        wds[1] = "等待被唤醒的宿敌之剑，与战魄一起锻造为[擒龙]。"
        wds[2] = 66
        wds[3] = 1
        wds[4] = 0
        wds[11] = "xzsc.wdf"
        wds[12] = 0xAD7B3E5B
        wds[13] = 0xE0BB9E80
    elseif wd == "斧·元身" then
        wds[1] = "等待被唤醒的魔君之斧，与战魄一起锻造为[裂天]。"
        wds[2] = 66
        wds[3] = 1
        wds[4] = 0
        wds[11] = "xzsc.wdf"
        wds[12] = 0xFBEC3D5B
        wds[13] = 0xE5709BCF
    elseif wd == "锤·元身" then
        wds[1] = "等待被唤醒的盘古龙齿，与战魄一起锻造为[碎寂]。"
        wds[2] = 66
        wds[3] = 1
        wds[4] = 0
        wds[11] = "xzsc.wdf"
        wds[12] = 0x397D0A2C
        wds[13] = 0x4A0E1D74
    elseif wd == "枪·元身" then
        wds[1] = "等待被唤醒的王者之枪，与战魄一起锻造为[弑皇]。"
        wds[2] = 66
        wds[3] = 1
        wds[4] = 0
        wds[11] = "xzsc.wdf"
        wds[12] = 0xAA64F92D
        wds[13] = 0x2F2973EB
    elseif wd == "飘带·元身" then
        wds[1] = "等待被唤醒的九霄澄云，与战魄一起锻造为[九霄]。"
        wds[2] = 66
        wds[3] = 1
        wds[4] = 0
        wds[11] = "xzsc.wdf"
        wds[12] = 0x4F4AD0CD
        wds[13] = 0xDF316EF7
    elseif wd == "魔棒·元身" then
        wds[1] = "等待被唤醒的混沌异果，与战魄一起锻造为[醍醐]。"
        wds[2] = 66
        wds[3] = 1
        wds[4] = 0
        wds[11] = "xzsc.wdf"
        wds[12] = 0x8D1F0679
        wds[13] = 0xAB525F51
    elseif wd == "双环·元身" then
        wds[1] = "等待被唤醒的朝夕霞雾，与战魄一起锻造为[朝夕]。"
        wds[2] = 66
        wds[3] = 1
        wds[4] = 0
        wds[11] = "xzsc.wdf"
        wds[12] = 0x111D93EB
        wds[13] = 0x7D9D4D19
    elseif wd == "双剑·元身" then
        wds[1] = "等待被唤醒的双飞利刃，与战魄一起锻造为[浮犀]。"
        wds[2] = 66
        wds[3] = 1
        wds[4] = 0
        wds[11] = "xzsc.wdf"
        wds[12] = 0xEB9EDC89
        wds[13] = 0x5EDAC2DE
    elseif wd == "长鞭·元身" then
        wds[1] = "等待被唤醒的九曲月华，与战魄一起锻造为[霜陨]。"
        wds[2] = 66
        wds[3] = 1
        wds[4] = 0
        wds[11] = "xzsc.wdf"
        wds[12] = 0x94B20072
        wds[13] = 0x1C30212D
    elseif wd == "爪刺·元身" then
        wds[1] = "等待被唤醒的天地离愁，与战魄一起锻造为[离钩]。"
        wds[2] = 66
        wds[3] = 1
        wds[4] = 0
        wds[11] = "xzsc.wdf"
        wds[12] = 0x0F776C4A
        wds[13] = 0x9CE1A36C
    elseif wd == "头盔·元身" then
        wds[1] = "等待被唤醒的浑天玄火，与战魄一起锻造为[浑天玄火盔]。"
        wds[2] = 66
        wds[3] = 1
        wds[4] = 0
        wds[11] = "xzsc.wdf"
        wds[12] = 0x764A4001
        wds[13] = 0x80644D9A
    elseif wd == "冠冕·元身" then
        wds[1] = "等待被唤醒的乾元鸣凤，与战魄一起锻造为[乾元鸣凤冕]。"
        wds[2] = 66
        wds[3] = 1
        wds[4] = 0
        wds[11] = "xzsc.wdf"
        wds[12] = 0xCD93E6F7
        wds[13] = 0xD97AD016
    elseif wd == "坚甲·元身" then
        wds[1] = "等待被唤醒的混元一气，与战魄一起锻造为[混元一气甲]。"
        wds[2] = 66
        wds[3] = 1
        wds[4] = 0
        wds[11] = "xzsc.wdf"
        wds[12] = 0xD08B5887
        wds[13] = 0x5FC5E447
    elseif wd == "纱衣·元身" then
        wds[1] = "等待被唤醒的鎏金浣月，与战魄一起锻造为[鎏金浣月衣]。"
        wds[2] = 66
        wds[3] = 1
        wds[4] = 0
        wds[11] = "xzsc.wdf"
        wds[12] = 0x99EDA596
        wds[13] = 0x4A94E5EC
    elseif wd == "挂坠·元身" then
        wds[1] = "等得被唤醒的落霞陨星，与战魄一起锻造为[落霞陨星坠]。"
        wds[2] = 66
        wds[3] = 1
        wds[4] = 0
        wds[11] = "xzsc.wdf"
        wds[12] = 0x2365F2C0
        wds[13] = 0xC31B0927
    elseif wd == "束带·元身" then
        wds[1] = "等待被唤醒的紫霄云芒，与战魄一起锻造为[紫霄云芒带]。"
        wds[2] = 66
        wds[3] = 1
        wds[4] = 0
        wds[11] = "xzsc.wdf"
        wds[12] = 0x83D8E526
        wds[13] = 0xDA79287A
    elseif wd == "鞋履·元身" then
        wds[1] = "等待被唤醒的紫霄云芒，与战魄一起锻造为[紫霄云芒带]。"
        wds[2] = 66
        wds[3] = 1
        wds[4] = 0
        wds[11] = "xzsc.wdf"
        wds[12] = 0x2D4D76E4
        wds[13] = 0x2E7EEDEF
    elseif wd == "战魄" then
        wds[1] = "十二神兵精魄所凝的玄彩战魄，不屈的杀意仍在其间咆哮呐喊，他们誓要铸躯重生，再续与魔气这万年未竟之战，与元身一同锻造则可制作160级装备。"
        wds[2] = 67
        wds[3] = 2
        wds[4] = 0
        wds[11] = "xzsc.wdf"
        wds[12] = 0xF87C4047
        wds[13] = 0x54382E1C
    elseif wd == "陨铁" then
        wds[1] = "由婉君雷霆劈裂出来的陨铁，由于千万年来被神兵与魔气交战所淬炼，其上的痕迹无一不铭刻着各式神兵的印记，亦含有强大神秘力量。可对150级装备进行幻化。"
        wds[2] = 65
        wds[3] = 3
        wds[4] = 0
        wds[11] = "xzsc.wdf"
        wds[12] = 0xe1e3f845
        wds[13] = 0x26dc005
     elseif wd == "十年魂环" then
		wds[1] = "从神秘未知世界，破界而入的异兽身上获取的魂环，据说可以洗练出强大的属性"
		wds[2] = 2
		wds[3] = 10
		wds[4] = 5
		wds[5] = 60
	    wds[11] = "wpal/121.wpal"
	    wds[12] = 0xb45
	    wds[13] = 0xb44

		elseif wd == "百年魂环" then
		wds[1] = "从神秘未知世界，破界而入的异兽身上获取的魂环，据说可以洗练出强大的属性"
		wds[2] = 2
		wds[3] = 10
		wds[4] = 5
		wds[5] = 80
	    wds[11] = "wpal/121.wpal"
	    wds[12] = 0xb39
	    wds[13] = 0xb38
		elseif wd == "千年魂环" then
		wds[1] = "从神秘未知世界，破界而入的异兽身上获取的魂环，据说可以洗练出强大的属性"
		wds[2] = 2
		wds[3] = 10
		wds[4] = 5
		wds[5] = 100
	    wds[11] = "wpal/121.wpal"
	    wds[12] = 0xb47
	    wds[13] = 0xb46
		elseif wd == "万年魂环" then
		wds[1] = "从神秘未知世界，破界而入的异兽身上获取的魂环，据说可以洗练出强大的属性"
		wds[2] = 2
		wds[3] = 10
		wds[4] = 5
		wds[5] = 120
	    wds[11] = "wpal/121.wpal"
	    wds[12] = 0xb53
	    wds[13] = 0xb52
		elseif wd == "十万年魂环" then
		wds[1] = "从神秘未知世界，破界而入的异兽身上获取的魂环，据说可以洗练出强大的属性"
		wds[2] = 2
		wds[3] = 10
		wds[4] = 5
		wds[5] = 140
	    wds[11] = "wpal/121.wpal"
	    wds[12] = 0xb51
	    wds[13] = 0xb50
		elseif wd == "百万年魂环" then
		wds[1] = "从神秘未知世界，破界而入的异兽身上获取的魂环，据说可以洗练出强大的属性"
		wds[2] = 2
		wds[3] = 10
		wds[4] = 5
		wds[5] = 600
	    wds[11] = "wpal/121.wpal"
	    wds[12] = 0xb49
	    wds[13] = 0xb48
		elseif wd == "千万年魂环" then
		wds[1] = "从神秘未知世界，破界而入的异兽身上获取的魂环，据说可以洗练出强大的属性"
		wds[2] = 2
		wds[3] = 10
		wds[4] = 5
		wds[5] = 700
	    wds[11] = "wpal/121.wpal"
	    wds[12] = 0xb43
	    wds[13] = 0xb42
		elseif wd == "神级魂环" then
		wds[1] = "从神秘未知世界，破界而入的异兽身上获取的魂环，据说可以洗练出强大的属性"
		wds[2] = 2
		wds[3] = 10
		wds[4] = 5
		wds[5] = 800
	    wds[11] = "wpal/121.wpal"
	    wds[12] = 0xb41
	    wds[13] = 0xb40
		elseif wd == "神赐魂环" then
		wds[1] = "从神秘未知世界，破界而入的异兽身上获取的魂环，据说可以洗练出强大的属性"
		wds[2] = 2
		wds[3] = 10
		wds[4] = 5
		wds[5] = 1200
	    wds[11] = "wpal/121.wpal"
	    wds[12] = 0xb37
	    wds[13] = 0xb36
	     elseif wd == "缚妖索" then
		wds[1] = "天师的法宝。无需佩戴,在战斗中祭起后可将目标牢牢捆缚住,使其的逃跑成功率降低。"
		wds[2] = 1000
		wds[3] = 1
		wds[4] = 2
		wds[5] = 1
		wds[6] = 60
		wds[7] = 5
		wds[8] = 3
	    wds[11] = "幕神2.rpk"
	    wds[12] = 0x2320b82f
	    wds[13] = 0x335299ff
	elseif wd == "捆仙绳" then
		wds[1] = "天庭法宝,专为缉享神仙所制,材料不知为何物,柔韧结实。旦被捆则降低目标的逃跑成功率。"
		wds[2] = 1000
		wds[3] = 2
		wds[4] = 2
		wds[5] = 1
		wds[6] = 80
		wds[7] = 5
		wds[8] = 3
	    wds[11] = "幕神2.rpk"
	    wds[12] = 0x2320b82f
	    wds[13] = 0x335299ff
	elseif wd == "缚龙索" then
		wds[1] = "此索就箅八部天龙被缚也难以逃脱,一般人被捆缚住后,逃跑成功率大幅度降低,只有乖乖被擒"
		wds[2] = 1000
		wds[3] = 3
		wds[4] = 2
		wds[5] = 1
		wds[6] = 100
		wds[7] = 5
		wds[8] = 3
	    wds[11] = "幕神2.rpk"
	    wds[12] = 0x2320b82f
	    wds[13] = 0x335299ff
	    elseif wd == "照妖镜" then
		wds[1] = "此镜一出,妖魔鬼怪无处通形。无需佩戴,在战斗中主动对对方使用,有很大几率识破对方的幻化效果。"
		wds[2] = 1000
		wds[3] = 3
		wds[4] = 4
		wds[5] = 1
		wds[6] = 100
		wds[7] = 1
		wds[8] = 0
	    wds[11] = "幕神2.rpk"
	    wds[12] = 0xA4E6ECB0
	    wds[13] = 0x9F83D4D7
	   elseif wd == "曼陀罗" then
		wds[1] = "精巧的银制匣子,内藏百花之毒,是女儿村的镇山法宝,佩带此宝的女儿村弟子通过师门技能或者暗器使目标中毒后受到的伤害增加。"
		wds[2] = 1000
		wds[3] = 3
		wds[4] = 5
		wds[5] = 0
		wds[6] = 100
		wds[7] = 1
		wds[8] = 0
	    wds[11] = "幕神2.rpk"
	    wds[12] = 0x60523FF1
	    wds[13] = 0x546D7271
	    elseif wd == "落宝金钱" then
		wds[1] = "金钱过处,法宝落地。它可以将法宝击落,取消目标主动法宝所增加的临时效果,是战场上强有力的威胁,无需佩戴,需要在战斗中主动使用。"
		wds[2] = 1000
		wds[3] = 3
		wds[4] = 2
		wds[5] = 1
		wds[6] = 100
		wds[7] = 5
		wds[8] = 0
	    wds[11] = "幕神2.rpk"
	    wds[12] = 0x1E296612
	    wds[13] = 0x32003A2B
	   elseif wd == "七宝玲珑灯" then
		wds[1] = "佛门至宝,佛祖当年以大雷音寺内玉池内白莲所制,携带此宝者气定神闲,不受七情六欲之苦。此灯一旦佩带,战斗中每回合自动对拥有法宝异常状态的成员进行解除,有一定几率解除状态失"
		wds[2] = 1000
		wds[3] = 3
		wds[4] = 2
		wds[5] = 0
		wds[6] = 100
		wds[7] = 1
		wds[8] = 0
	    wds[11] = "幕神2.rpk"
	    wds[12] = 0x6099C4D3
	    wds[13] = 0x10B360A3
	elseif wd == "通灵宝玉" then
		wds[1] = "拥有通灵能力的宝玉,汲取天地间的灵气,佩带此宝可在获得经验时额外增加一些经验。每提升5级修炼境界即可获得更多的额外经验。(该法宝不受五行属性影响)"
		wds[2] = 1000
		wds[3] = 3
		wds[4] = 2
		wds[5] = 0
		wds[6] = 100
		wds[7] = 1
		wds[8] = 0
	    wds[11] = "幕神2.rpk"
	    wds[12] = 0x4FC565AA
	    wds[13] = 0xA83BA91E

	   elseif wd == "落雨金钱" then
		wds[1] = "财神爷的不传之秘,用银锭砸人,如果碰上不为金钱所动的人就没有办法了。无需佩戴,在战斗中使用法宝可攻击对方,每次使用消耗当前金钱4000"
		wds[2] = 1000
		wds[3] = 3
		wds[4] = 4
		wds[5] = 1
		wds[6] = 100
		wds[7] = 1
		wds[8] = 0
	    wds[11] = "幕神2.rpk"
	    wds[12] = 0xFC98FD6A
	    wds[13] = 0xFA7125D2
	    elseif wd == "金钱镖" then
		wds[1] = "财神爷的看家宝贝，散出千枚铜钱伤人，如果碰上不为金钱所动的人就没有办法了。每次使用消耗当前金钱2000。"
		wds[2] = 1000
		wds[3] = 1
		wds[4] = 4
		wds[5] = 1
		wds[6] = 60
		wds[7] = 1
		wds[8] = 4
	    wds[11] = "幕神2.rpk"
	    wds[12] = 0x3D9C84A5
	    wds[13] = 0xC876D78A
	elseif wd == "鬼脸面具" then
		wds[1] = "用天蚕丝所制的面具,辅以上古符咒,是非常好的变身辅助。戴上它可以在战斗中使用变身卡进行变身"
		wds[2] = 1000
		wds[3] = 1
		wds[4] = 2
		wds[5] = 0
		wds[6] = 60
		wds[7] = 1
		wds[8] = 0
	    wds[11] = "幕神2.rpk"
	    wds[12] = 0xF6001248
	    wds[13] = 0x119F576D
	 elseif wd == "雷兽" then
		wds[1] = "李天王为门下弟子专门炼制的宝贝,为五雷之精餽,祭起时夹风雷之势,天旋地转飞沙走石。佩带此物的天宫弟子使用乾坤塔时更为得心应手,同时拥有对封系法术的抗性。"
		wds[2] = 1000
		wds[3] = 1
		wds[4] = 2
		wds[5] = 0
		wds[6] = 60
		wds[7] = 1
		wds[8] = 0
	    wds[11] = "幕神2.rpk"
	    wds[12] = 0x33768EB0
	    wds[13] = 0xA204F1F0
	elseif wd == "迷魂灯" then
		wds[1] = "冰冰姑娘的独门法宝,据说这灯是用百只狐妖的眼神为芯,佩带在身上散发着摄人心魂的灯光。佩带此灯的盘丝洞弟子将提高迷惑敌人的效果,同时拥有对封系法术的抗性。"
		wds[2] = 1000
		wds[3] = 1
		wds[4] = 2
		wds[5] = 0
		wds[6] = 60
		wds[7] = 1
		wds[8] = 0
	    wds[11] = "幕神2.rpk"
	    wds[12] = 0xAAC25649
	    wds[13] = 0x6EB0B809
	elseif wd == "定风珠" then
		wds[1] = "镇元大仙修炼多年的宝贝,拥有摄人的威力,佩带此珠的五庄观弟子对乾坤袖的使用更加纯熟,同时拥有对封系法术的抗性。"
		wds[2] = 1000
		wds[3] = 1
		wds[4] = 2
		wds[5] = 0
		wds[6] = 60
		wds[7] = 1
		wds[8] = 0
	    wds[11] = "幕神2.rpk"
	    wds[12] = 0x49D1AE82
	    wds[13] = 0x62DBF406
	elseif wd == "幽灵珠" then
		wds[1] = "增加1级阴风绝章技能，随着境界提升增加技能等级与对封系法术的抗性"
		wds[2] = 1000 -- 总类
		wds[3] = 1 -- 法宝等级
		wds[4] = 2
		wds[5] = 0 --0 佩戴战斗生效 1无需佩戴战斗使用 2 无需佩戴非战斗
		wds[6] = 60 -- 等级
		wds[7] = 1 --回合限制
		wds[8] = 0 	--持续回合
	    wds[11] = "幕神2.rpk"
	    wds[12] = 0x60523FF1
	    wds[13] = 0x60523FF1
	-- 二级法宝
	elseif wd == "玄冰面具" then
		wds[1] = "戴上这个面具,面容就像千年寒冰下的湖水,谁也不知道是什么样子,拥有者可以在战斗中使用变身卡变幻身份。"
		wds[2] = 1000
		wds[3] = 2
		wds[4] = 2
		wds[5] = 0
		wds[6] = 60
		wds[7] = 1
		wds[8] = 0
	    wds[11] = "幕神2.rpk"
	    wds[12] = 0x2A0DD83C
	    wds[13] = 0xC1D43099
	elseif wd == "降魔斗篷" then
		wds[1] = "战斗中遭受法术攻击的时候有一定几率出现神兵现身保护，随着境界提升增加被保护的几率。"
		wds[2] = 1000
		wds[3] = 2
		wds[4] = 3
		wds[5] = 0
		wds[6] = 60
		wds[7] = 1
		wds[8] = 0
	    wds[11] = "幕神2.rpk"
	    wds[12] = 0x8F0E6273
	    wds[13] = 0xC1B54E00
	    elseif wd == "聚妖铃" then
		wds[1] = "这铃铛声是号召妖怪们战斗的号角，据说是蚩尤当年为涿鹿之战而制。战斗中摇晃此铃，附近的妖物会聚集过来协助战斗。"
		wds[2] = 1000
		wds[3] = 2
		wds[4] = 2
		wds[5] = 1
		wds[6] = 80
		wds[7] = 5
		wds[8] = 0
	    wds[11] = "幕神2.rpk"
	    wds[12] = 0xCB2C7DF6
	    wds[13] = 0xCF3377CC
	elseif wd == "万鬼幡" then
		wds[1] = "地府钟馗的法宝,此幡一祭,天地变色,鬼影憧憧,黄泉十万阴兵应幡而出。无需佩戴,在战斗中使用可以召唤鬼魂助战。"
		wds[2] = 1000
		wds[3] = 2
		wds[4] = 2
		wds[5] = 1
		wds[6] = 60
		wds[7] = 5
		wds[8] = 0
	    wds[11] = "幕神2.rpk"
	    wds[12] = 0xF1D0DFC7
	    wds[13] = 0x0E4DC36F
	    elseif wd == "番天印" then
		wds[1] = "广成子修炼的独门宝贝,硒中后能使人神志不清,三魂出窍,失去对法宝的控制。无需佩戴,战斗中祭起后有一定几率使目标身上佩带的被动法宝4回合内失去作用。"
		wds[2] = 1000
		wds[3] = 2
		wds[4] = 5
		wds[5] = 1
		wds[6] = 80
		wds[7] = 6
		wds[8] = 4
	    wds[11] = "幕神2.rpk"
	    wds[12] = 0xb33784e0
	    wds[13] = 0x8b590810
	    elseif wd == "罗汉珠" then
		wds[1] = "以肉身所化舍利制成的手链,为佛祖赠予目犍连之宝,拥有此宝者可达到杀贼、应供、无生之境界。战斗中祭起后的下三回合内拥有者所使用的门派法术魔法消耗减少,无需佩戴。"
		wds[2] = 1000
		wds[3] = 2
		wds[4] = 2
		wds[5] = 1
		wds[6] = 80
		wds[7] = 5
		wds[8] = 3
	    wds[11] = "幕神2.rpk"
	    wds[12] = 0x14846B1B
	    wds[13] = 0x695614DB
	elseif wd == "分水" then
		wds[1] = "以水为盾,可以护体。此宝为西海龙女佩带之物,祭起后遭受攻击时一定几率将伤害转化为气血是龙宫秘宝,无需佩戴。"
		wds[2] = 1000
		wds[3] = 2
		wds[4] = 1
		wds[5] = 1
		wds[6] = 80
		wds[7] = 5
		wds[8] = 3
	    wds[11] = "幕神2.rpk"
	    wds[12] = 0xD330F6C9
	    wds[13] = 0xF1CF0FC1
	elseif wd == "赤焰" then
		wds[1] = "此物乃牛魔王与铁扇公主定情之时赠送给娘子的宝贝,使用此宝能在三回合内回复魔法。"
		wds[2] = 1000
		wds[3] = 2
		wds[4] = 1
		wds[5] = 1
		wds[6] = 80
		wds[7] = 5
		wds[8] = 3
	    wds[11] = "幕神2.rpk"
	    wds[12] = 0x743685D8
	    wds[13] = 0x62AEC7E3
	   elseif wd == "忘情" then
		wds[1] = "永远有多远,拿一世来衡量。我许你三生三世,你给我一点惆怅。此扇为冰冰姑娘之物,佩带者能感受到她已经忘却的情伤,佩带后可以在使用盘丝洞封系法术可以使目标身中情毒,受到的治疗效果下降。"
		wds[2] = 1000
		wds[3] = 3
		wds[4] = 5
		wds[5] = 0
		wds[6] = 100
		wds[7] = 1
		wds[8] = 0
	    wds[11] = "幕神2.rpk"
	    wds[12] = 0xB7113AA0
	    wds[13] = 0xB664DE8F
	     elseif wd == "摄魂" then
		wds[1] = "阎王要你三更死，谁敢留人过五更。此物为黄泉中至阴之物，专门摄取生魂，通常勾魂使者才能携带。祭起后使目标失魂落魄，失去生气，三回合内承受的伤害增加。"
		wds[2] = 1000
		wds[3] = 2
		wds[4] = 5
		wds[5] = 1
		wds[6] = 80
		wds[7] = 3
		wds[8] = 4
	    wds[11] = "幕神2.rpk"
	    wds[12] = 0xBDD4BF97
	    wds[13] = 0xAFF8536F
	  elseif wd == "神木宝鼎" then
		wds[1] = "神木林祭师祭天地所用之物。在战斗中祭起此鼎临时提升增加三回合内大量法术伤害。"
		wds[2] = 1000 -- 总类
		wds[3] = 2 -- 法宝等级
		wds[4] = 2
		wds[5] = 1 --0 佩戴战斗生效 1无需佩戴战斗使用 2 无需佩戴非战斗
		wds[6] = 80 -- 等级
		wds[7] = 5 --回合限制
		wds[8] = 3 	--持续回合
	    wds[11] = "幕神2.rpk"
	    wds[12] = 0x93A0FC49
	    wds[13] = 0xF07197ED
	elseif wd == "斩魔" then
		wds[1] = "物理攻击时额外增加物理伤害结果。随法宝等级提升而提升。"
		wds[2] = 1000 -- 总类
		wds[3] = 3 -- 法宝等级
		wds[4] = 4
		wds[5] = 0 --0 佩戴战斗生效 1无需佩戴战斗使用 2 无需佩戴非战斗
		wds[6] = 100 -- 等级
		wds[7] = 1 --回合限制
		wds[8] = 0 	--持续回合
	    wds[11] = "幕神2.rpk"
	    wds[12] = 0xB941589C
	    wds[13] = 0x5760394B
	elseif wd == "天煞" then
		wds[1] = "每回合恢复魔法值，持续3回合，满层的情况下在法宝回合结束时恢复1点战意值。"
		wds[2] = 1000 -- 总类
		wds[3] = 2 -- 法宝等级
		wds[4] = 2
		wds[5] = 1 --0 佩戴战斗生效 1无需佩戴战斗使用 2 无需佩戴非战斗
		wds[6] = 80 -- 等级
		wds[7] = 5 --回合限制
		wds[8] = 3 	--持续回合
	    wds[11] = "幕神2.rpk"
	    wds[12] = 0x690B67CD
	    wds[13] = 0xE498691F
	elseif wd == "金蟾" then
		wds[1] = "祭起妖风傀儡承受与启用者同样的伤害；妖风傀儡最多存在2回合；当妖风傀儡被击飞时，本方队伍所有成员获得妖风傀儡最大气血值一定比例的气血。回复效果随法宝等级提升而提升"
		wds[2] = 1000 -- 总类
		wds[3] = 3 -- 法宝等级
		wds[4] = 1
		wds[5] = 1 --0 佩戴战斗生效 1无需佩戴战斗使用 2 无需佩戴非战斗
		wds[6] = 100 -- 等级
		wds[7] = 5 --回合限制
		wds[8] = 2 	--持续回合
	    wds[11] = "幕神2.rpk"
	    wds[12] = 0xA4727B32
	    wds[13] = 0xA0BCD809
	elseif wd == "宝烛" then  -- 没有素材
		wds[1] = "当佩戴者当前气血小于气血最大值的70%时，每回合回复一定的当前气血。效果随法宝等级提升而提升。"
		wds[2] = 1000 -- 总类
		wds[3] = 2 -- 法宝等级
		wds[4] = 1
		wds[5] = 0 --0 佩戴战斗生效 1无需佩戴战斗使用 2 无需佩戴非战斗
		wds[6] = 80 -- 等级
		wds[7] = 1 --回合限制
		wds[8] = 0 	--持续回合
	    wds[11] = "幕神2.rpk"
	    wds[12] = 0x044A3417
	    wds[13] = 0x14A6F162
	-- 四级法宝
	elseif wd == "重明战鼓" then
		wds[1] = "重明鸟灵所化之战鼓，击之可激扬士气，倍增勇武。佩戴此法宝，可大大提升召唤兽物理伤害和法术伤害。"
		wds[2] = 1000 -- 总类
		wds[3] = 4 -- 法宝等级
		wds[4] = 2
		wds[5] = 0 --0 佩戴战斗生效 1无需佩戴战斗使用 2 无需佩戴非战斗
		wds[6] = 120 -- 等级
		wds[7] = 2 --回合限制
		wds[8] = 0 	--持续回合
	    wds[11] = "幕神2.rpk"
	    wds[12] = 0x6FA9F9B4
	    wds[13] = 0x6FA9F9B4
	elseif wd == "梦云幻甲" then
		wds[1] = "以九天云雾炼制而成的宝甲，轻若无物，如梦似幻，令人目眩神迷。佩戴此法宝，可大大提升召唤兽的物理防御和法术防御。"
		wds[2] = 1000 -- 总类
		wds[3] = 4 -- 法宝等级
		wds[4] = 2
		wds[5] = 0 --0 佩戴战斗生效 1无需佩戴战斗使用 2 无需佩戴非战斗
		wds[6] = 120 -- 等级
		wds[7] = 1 --回合限制
		wds[8] = 0 	--持续回合
	    wds[11] = "幕神2.rpk"
	    wds[12] = 0xA44B6E61
	    wds[13] = 0x09699BC2
	elseif wd == "河图洛书" then
		wds[1] = "蕴含易理天地灵宝，透出一股玄奥之感。佩戴此法宝，可大大提升封印命中率和抵抗封印命中率。"
		wds[2] = 1000 -- 总类
		wds[3] = 4 -- 法宝等级
		wds[4] = 2
		wds[5] = 0 --0 佩戴战斗生效 1无需佩戴战斗使用 2 无需佩戴非战斗
		wds[6] = 120 -- 等级
		wds[7] = 1 --回合限制
		wds[8] = 0 	--持续回合
	    wds[11] = "幕神2.rpk"
	    wds[12] = 0xFED28065
	    wds[13] = 0xAFCC206F
	elseif wd == "炽焰丹珠" then
		wds[1] = "集人间怒火而成一朵怒焰，再将其炼为丹珠而成的法宝。佩戴此法宝，人物倒地时可保留一定的愤怒值，每场战斗起效3次。"
		wds[2] = 1000 -- 总类
		wds[3] = 4 -- 法宝等级
		wds[4] = 1
		wds[5] = 0 --0 佩戴战斗生效 1无需佩戴战斗使用 2 无需佩戴非战斗
		wds[6] = 120 -- 等级
		wds[7] = 1 --回合限制
		wds[8] = 0 	--持续回合
	    wds[11] = "幕神2.rpk"
	    wds[12] = 0x994F899E
	    wds[13] = 0x11E0DBD5
	elseif wd == "翡翠芝兰" then
		wds[1] = "人物倒地时，回复全体队友一定量的魔法。每场战斗最多起效3次"
		wds[2] = 1000 -- 总类
		wds[3] = 4 -- 法宝等级
		wds[4] = 1
		wds[5] = 0 --0 佩戴战斗生效 1无需佩戴战斗使用 2 无需佩戴非战斗
		wds[6] = 120 -- 等级
		wds[7] = 1 --回合限制
		wds[8] = 0 	--持续回合
	    wds[11] = "幕神2.rpk"
	    wds[12] = 0x3D429B7E
	    wds[13] = 0xD7784202
	elseif wd == "太虚玉液" then
		wds[1] = "人物倒地时，回复全体队友一定量的气血。每场战斗最多起效3次"
		wds[2] = 1000 -- 总类
		wds[3] = 4 -- 法宝等级
		wds[4] = 1
		wds[5] = 0 --0 佩戴战斗生效 1无需佩戴战斗使用 2 无需佩戴非战斗
		wds[6] = 120 -- 等级
		wds[7] = 1 --回合限制
		wds[8] = 0 	--持续回合
	    wds[11] = "幕神2.rpk"
	    wds[12] = 0xDECEE2CB
	    wds[13] = 0x20A09432

	elseif wd == "九梵清莲" then
		wds[1] = "如来座前生长千年的白莲，因长年浸润圣佛之气而成为了一件法宝。受到召唤兽物理攻击时，一定几率减免部分伤害。"
		wds[2] = 1000 -- 总类
		wds[3] = 4 -- 法宝等级
		wds[4] = 3
		wds[5] = 1 --0 佩戴战斗生效 1无需佩戴战斗使用 2 无需佩戴非战斗
		wds[6] = 120 -- 等级
		wds[7] = 8 --回合限制
		wds[8] = 0 	--持续回合
	    wds[11] = "幕神2.rpk"
	    wds[12] = 0x61A6A410
	    wds[13] = 0xF12459F6
	elseif wd == "苍灵雪羽" then
		wds[1] = "苍鸾灵气所化成的一片雪羽，有日月光华聚于其上。主动使用此法宝，在当前回合提升全体友方单位的法术伤害结果，并降低全体友方单位的法术防御效果。"
		wds[2] = 1000 -- 总类
		wds[3] = 4 -- 法宝等级
		wds[4] = 4
		wds[5] = 1 --0 佩戴战斗生效 1无需佩戴战斗使用 2 无需佩戴非战斗
		wds[6] = 120 -- 等级
		wds[7] = 8 --回合限制
		wds[8] = 1 	--持续回合
	    wds[11] = "幕神2.rpk"
	    wds[12] = 0xED26751B
	    wds[13] = 0x8639741F
	elseif wd == "烽火狼烟" then
		wds[1] = "凝人间杀气、煞气而成的凶物，因战而生，为战而死。主动使用此法宝，在当前回合提升全体友方单位的物理伤害效果，并降低全体友方单位的物理防御效果。"
		wds[2] = 1000 -- 总类
		wds[3] = 4 -- 法宝等级
		wds[4] = 4
		wds[5] = 1 --0 佩戴战斗生效 1无需佩戴战斗使用 2 无需佩戴非战斗
		wds[6] = 120 -- 等级
		wds[7] = 8 --回合限制
		wds[8] = 1 	--持续回合
	    wds[11] = "幕神2.rpk"
	    wds[12] = 0xA996541F
	    wds[13] = 0xB7485B10
	elseif wd == "舞雪冰蝶" then
		wds[1] = "降低目标物理攻击时的命中率，持续3回合，冷却回合5回合"
		wds[2] = 1000 -- 总类
		wds[3] = 4 -- 法宝等级
		wds[4] = 5
		wds[5] = 1 --0 佩戴战斗生效 1无需佩戴战斗使用 2 无需佩戴非战斗
		wds[6] = 120 -- 等级
		wds[7] = 5 --回合限制
		wds[8] = 3 	--持续回合
	    wds[11] = "幕神2.rpk"
	    wds[12] = 0xFBCFDC2F
	    wds[13] = 0x1ECCABDB
	elseif wd == "紫火如意" then
		wds[1] = "对目标召唤兽使用后，造成一定伤害，如果此次攻击成功击飞目标，则回复自身一定气血"
		wds[2] = 1000 -- 总类
		wds[3] = 4 -- 法宝等级
		wds[4] = 4
		wds[5] = 1 --0 佩戴战斗生效 1无需佩戴战斗使用 2 无需佩戴非战斗
		wds[6] = 120 -- 等级
		wds[7] = 0 --回合限制
		wds[8] = 0 	--持续回合
	    wds[11] = "幕神2.rpk"
	    wds[12] = 0xC75A72E3
	    wds[13] = 0x88221E08
	elseif wd == "凌波仙符" then
		wds[1] = "聚清风为气，锁流云为形，能使人进入战斗状态，神行千里，凌波飞渡。佩戴此法宝，在强烈的战斗欲望驱使下，使得人物速度大大提升。"
		wds[2] = 1000 -- 总类
		wds[3] = 4 -- 法宝等级
		wds[4] = 4
		wds[5] = 0 --0 佩戴战斗生效 1无需佩戴战斗使用 2 无需佩戴非战斗
		wds[6] = 120 -- 等级
		wds[7] = 1 --回合限制
		wds[8] = 0 	--持续回合
	    wds[11] = "幕神2.rpk"
	    wds[12] = 0x14577FB6
	    wds[13] = 0x6B665BCC


	elseif wd == "软烟罗锦" then
		wds[1] = "织女以天边晚霞织就，如烟如雾，佩戴后云雾缭绕，消弭术法。佩戴此法宝可以增加法术闪避。"
		wds[2] = 1000 -- 总类
		wds[3] = 4 -- 法宝等级
		wds[4] = 2
		wds[5] = 0 --0 佩戴战斗生效 1无需佩戴战斗使用 2 无需佩戴非战斗
		wds[6] = 120 -- 等级
		wds[7] = 1 --回合限制
		wds[8] = 0 	--持续回合
	    wds[11] = "幕神2.rpk"
	    wds[12] = 0x5B37D7B0
	    wds[13] = 0x7A64822D
	elseif wd == "谷玄星盘" then
		wds[1] = "提升吸收4系法术的几率"
		wds[2] = 1000 -- 总类
		wds[3] = 4 -- 法宝等级
		wds[4] = 2
		wds[5] = 0 --0 佩戴战斗生效 1无需佩戴战斗使用 2 无需佩戴非战斗
		wds[6] = 120 -- 等级
		wds[7] = 1 --回合限制
		wds[8] = 0 	--持续回合
	    wds[11] = "幕神2.rpk"
	    wds[12] = 0x2C726C89
	    wds[13] = 0xCC1C23CC

	elseif wd == "北冥巨鳞" then
		wds[1] = "传说中北冥鲲之巨鳞，佩戴则可获抟扶摇之力，逍遥九天，傲视群雄。佩戴后可增加我方所有人物伤害力，开启阵法且自身伤害高于其他队友时，额外增加自身大量伤害。"
		wds[2] = 1000 -- 总类
		wds[3] = 4 -- 法宝等级
		wds[4] = 2
		wds[5] = 0 --0 佩戴战斗生效 1无需佩戴战斗使用 2 无需佩戴非战斗
		wds[6] = 120 -- 等级
		wds[7] = 1 --回合限制
		wds[8] = 0 	--持续回合
	    wds[11] = "幕神2.rpk"
	    wds[12] = 0x5FFC15F1
	    wds[13] = 0x2F57F1E8
	elseif wd == "血魄元幡" then
		wds[1] = "于地府浴千万血魄浸润而成，凶煞无比。祭出则可借鬼神之力，通天彻地。可增加我方所有人物法术伤害力，开启阵法且自身法术伤害高于其他队友时，额外增加自身大量法术伤害。"
		wds[2] = 1000 -- 总类
		wds[3] = 4 -- 法宝等级
		wds[4] = 2
		wds[5] = 0 --0 佩戴战斗生效 1无需佩戴战斗使用 2 无需佩戴非战斗
		wds[6] = 120 -- 等级
		wds[7] = 1 --回合限制
		wds[8] = 0 	--持续回合
	    wds[11] = "幕神2.rpk"
	    wds[12] = 0x8867ABB2
	    wds[13] = 0xA7BE0228
	elseif wd == "冷龙石磐" then
		wds[1] = "增加本方所有人物防御力；队伍人数=5且自身防御大于其他所有队友的防御*130%时，效果大幅提高。"
		wds[2] = 1000 -- 总类
		wds[3] = 4 -- 法宝等级
		wds[4] = 3
		wds[5] = 0 --0 佩戴战斗生效 1无需佩戴战斗使用 2 无需佩戴非战斗
		wds[6] = 120 -- 等级
		wds[7] = 1 --回合限制
		wds[8] = 0 	--持续回合
	    wds[11] = "幕神2.rpk"
	    wds[12] = 0x5627FA3F
	    wds[13] = 0x160F6A44
	elseif wd == "琉璃云罩" then
		wds[1] = "增加本方所有人物法术防御力；队伍人数=5且自身防御大于其他所有队友的防御*130%时，效果大幅提高。"
		wds[2] = 1000 -- 总类
		wds[3] = 4 -- 法宝等级
		wds[4] = 3
		wds[5] = 0 --0 佩戴战斗生效 1无需佩戴战斗使用 2 无需佩戴非战斗
		wds[6] = 120 -- 等级
		wds[7] = 1 --回合限制
		wds[8] = 0 	--持续回合
	    wds[11] = "幕神2.rpk"
	    wds[12] = 0xA18E0EC3
	    wds[13] = 0xFB9618A5
	elseif wd == "璞玉灵钵" then
		wds[1] = "空灵空性，无欲无求。以菩提心应万物，以慈悲心护周身。有我不伤人、人不伤我之能。无需佩戴，在战斗中使用此物，可降低我方受到的伤害。"
		wds[2] = 1000 -- 总类
		wds[3] = 4 -- 法宝等级
		wds[4] = 3
		wds[5] = 1 --0 佩戴战斗生效 1无需佩戴战斗使用 2 无需佩戴非战斗
		wds[6] = 120 -- 等级
		wds[7] = 150 --回合限制
		wds[8] = 1 	--持续回合
	    wds[11] = "幕神2.rpk"
	    wds[12] = 1577325226
	    wds[13] = 1674443512
	   elseif wd == "洗炼丹" then
		wds[1] = "从异界破门而入的异兽身上的宝珠，可以用来洗炼魂环,魂骨"
	    wds[2] = 4
		wds[3] = 1
		wds[4] = 0
       wds[11] = "item.wdf"
	   wds[12] = 0xE23B789E
	   wds[13] = 0x02563911
	elseif wd == "高级洗炼丹" then
		wds[1] = "从异界破门而入的异兽身上的宝珠，100%洗出相同属性的魂环，魂骨"
	    wds[2] = 4
		wds[3] = 1
		wds[4] = 0
      wds[11] = "item.wdf"
	  wds[12] = 0xE23B789E
	  wds[13] = 0x02563911
	elseif wd == "腾云杖" then
		wds[1] = "仙人踏云而至，有着祥云之形的云母石法杖，有着奇妙法力。"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 13
	    wds[5] = 60
	    wds[7] = {"巫蛮儿","羽灵神"}
	    wds[11] = "common/item.wdf"
	    wds[12] = 4198430474
	    wds[13] = 1425813651
	elseif wd == "制造指南书" then
		wds[1] = "记载着各种装备武器制造方法的书卷。"
		wds[2] = 5
		wds[3] = 1
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 1102456535
	    wds[13] = 3855535092
	elseif wd == "随机制造指南书" then
		wds[1] = "记载着各种装备武器制造方法的书卷。"
		wds[2] = 5
		wds[3] = 8
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 1102456535
	    wds[13] = 3855535092
	 elseif wd == "60级随机指南书" then
		wds[1] = "记载着各种装备武器制造方法的书卷。"
		wds[2] = 5
		wds[3] = 7
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 1102456535
	    wds[13] = 3855535092
	    elseif wd == "70级随机指南书" then
		wds[1] = "记载着各种装备武器制造方法的书卷。"
		wds[2] = 5
		wds[3] = 7
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 1102456535
	    wds[13] = 3855535092
	    elseif wd == "80级随机指南书" then
		wds[1] = "记载着各种装备武器制造方法的书卷。"
		wds[2] = 5
		wds[3] = 7
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 1102456535
	    wds[13] = 3855535092
	    elseif wd == "90级随机指南书" then
		wds[1] = "记载着各种装备武器制造方法的书卷。"
		wds[2] = 5
		wds[3] = 7
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 1102456535
	    wds[13] = 3855535092
	elseif wd == "100级随机指南书" then
		wds[1] = "记载着各种装备武器制造方法的书卷。"
		wds[2] = 5
		wds[3] = 7
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 1102456535
	    wds[13] = 3855535092
	elseif wd == "110级随机指南书" then
		wds[1] = "记载着各种装备武器制造方法的书卷。"
		wds[2] = 5
		wds[3] = 7
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 1102456535
	    wds[13] = 3855535092
	elseif wd == "120级随机指南书" then
		wds[1] = "记载着各种装备武器制造方法的书卷。"
		wds[2] = 5
		wds[3] = 7
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 1102456535
	    wds[13] = 3855535092
	elseif wd == "130级随机指南书" then
		wds[1] = "记载着各种装备武器制造方法的书卷。"
		wds[2] = 5
		wds[3] = 7
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 1102456535
	    wds[13] = 3855535092
	elseif wd == "140级随机指南书" then
		wds[1] = "记载着各种装备武器制造方法的书卷。"
		wds[2] = 5
		wds[3] = 7
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 1102456535
	    wds[13] = 3855535092
	elseif wd == "150级随机指南书" then
		wds[1] = "记载着各种装备武器制造方法的书卷。"
		wds[2] = 5
		wds[3] = 7
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 1102456535
	    wds[13] = 3855535092
	    elseif wd == "160级随机指南书" then
		wds[1] = "记载着各种装备武器制造方法的书卷。"
		wds[2] = 5
		wds[3] = 7
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 1102456535
	    wds[13] = 3855535092
   	elseif wd == "灵饰指南书" then
		wds[1] = "记载各种灵饰制造方法的古老书卷"
		wds[2] = 5
		wds[3] = 20
		wds[4] = 0
	    wds[11] = "item.wd1"
	    wds[12] = 0xAEB5E00E
	    wds[13] = 0xD7E29586
	elseif wd == "60级随机灵饰指南书" then
		wds[1] = "记载各种灵饰制造方法的古老书卷，随机开出60级各部位灵饰指南书"
		wds[2] = "灵饰礼包"
		wds[3] = 1
		wds[4] = 0
	    wds[11] = "item.wd1"
	    wds[12] = 0xAEB5E00E
	    wds[13] = 0xD7E29586
	elseif wd == "80级随机灵饰指南书" then
		wds[1] = "记载各种灵饰制造方法的古老书卷，随机开出80级各部位灵饰指南书"
		wds[2] = "灵饰礼包"
		wds[3] = 2
		wds[4] = 0
	    wds[11] = "item.wd1"
	    wds[12] = 0xAEB5E00E
	    wds[13] = 0xD7E29586
	elseif wd == "100级随机灵饰指南书" then
		wds[1] = "记载各种灵饰制造方法的古老书卷，随机开出100级各部位灵饰指南书"
		wds[2] = "灵饰礼包"
		wds[3] = 3
		wds[4] = 0
	    wds[11] = "item.wd1"
	    wds[12] = 0xAEB5E00E
	    wds[13] = 0xD7E29586
	elseif wd == "120级随机灵饰指南书" then
		wds[1] = "记载各种灵饰制造方法的古老书卷，随机开出120级各部位灵饰指南书"
		wds[2] = "灵饰礼包"
		wds[3] = 4
		wds[4] = 0
	    wds[11] = "item.wd1"
	    wds[12] = 0xAEB5E00E
	    wds[13] = 0xD7E29586
	elseif wd == "140级随机灵饰指南书" then
		wds[1] = "记载各种灵饰制造方法的古老书卷，随机开出140级各部位灵饰指南书"
		wds[2] = "灵饰礼包"
		wds[3] = 5
		wds[4] = 0
	    wds[11] = "item.wd1"
	    wds[12] = 0xAEB5E00E
	    wds[13] = 0xD7E29586
   	elseif wd == "元灵晶石" then
		wds[1] = "灵山晶石经千锤百炼而成，为灵饰淬灵所必须的材料。"
		wds[2] = 5
		wds[3] = 21
		wds[4] = 0
	    wds[11] = "item.wd1"
	    wds[12] = 0x321116AF
	    wds[13] = 0x13A717B5
	elseif wd == "60级元灵晶石" then
		wds[1] = "灵山晶石经千锤百炼而成，为灵饰淬灵所必须的材料，购买后获得对应等级的元灵晶石。"
		wds[2] = "晶石礼包"
		wds[3] = 1
		wds[4] = 0
	    wds[11] = "item.wd1"
	    wds[12] = 0x321116AF
	    wds[13] = 0x13A717B5
	elseif wd == "80级元灵晶石" then
		wds[1] = "灵山晶石经千锤百炼而成，为灵饰淬灵所必须的材料，购买后获得对应等级的元灵晶石。"
		wds[2] = "晶石礼包"
		wds[3] = 2
		wds[4] = 0
	    wds[11] = "item.wd1"
	    wds[12] = 0x321116AF
	    wds[13] = 0x13A717B5
	elseif wd == "100级元灵晶石" then
		wds[1] = "灵山晶石经千锤百炼而成，为灵饰淬灵所必须的材料，购买后获得对应等级的元灵晶石。"
		wds[2] = "晶石礼包"
		wds[3] = 3
		wds[4] = 0
	    wds[11] = "item.wd1"
	    wds[12] = 0x321116AF
	    wds[13] = 0x13A717B5
	elseif wd == "120级元灵晶石" then
		wds[1] = "灵山晶石经千锤百炼而成，为灵饰淬灵所必须的材料，购买后获得对应等级的元灵晶石。"
		wds[2] = "晶石礼包"
		wds[3] = 4
		wds[4] = 0
	    wds[11] = "item.wd1"
	    wds[12] = 0x321116AF
	    wds[13] = 0x13A717B5
	elseif wd == "140级元灵晶石" then
		wds[1] = "灵山晶石经千锤百炼而成，为灵饰淬灵所必须的材料，购买后获得对应等级的元灵晶石。"
		wds[2] = "晶石礼包"
		wds[3] = 5
		wds[4] = 0
	    wds[11] = "item.wd1"
	    wds[12] = 0x321116AF
	    wds[13] = 0x13A717B5
	elseif wd == "云龙棒" then
		wds[1] = "棒身九曲，似云龙腾跃"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 8
	    wds[5] = 40
	    wds[7] = {"玄彩娥","骨精灵"}
	    wds[11] = "item.wdf"
	    wds[12] = 1889288915
	    wds[13] = 741134712
	elseif wd == "摄妖香" then
		wds[1] = "人间流行的一种驱逐妖魔的异香，时效为三个时辰"
		wds[2] = 4
		wds[3] = 2
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 3553509277
	    wds[13] = 4033100487
	    wds[14] = 80
	elseif wd == "双倍经验丹" then
		wds[1] = "经验额外增加2倍,与双倍、精修同时存在时效果无法叠加,每次使用获得1小时有效时间。无法冻结、无法叠加使用。"
		wds[2] = 4
		wds[3] = 2
		wds[4] = 0
	    wds[11] = "item.wd1"
	    wds[12] = 0X2A59F2A1
	    wds[13] = 0X77F1A658
	    wds[14] = 80
	elseif wd == "三倍经验丹" then
		wds[1] = "经验额外增加3倍,与双倍、精修同时存在时效果无法叠加,每次使用获得1小时有效时间。无法冻结、无法叠加使用。"
		wds[2] = 4
		wds[3] = 2
		wds[4] = 0
	    wds[11] = "item.wd1"
	    wds[12] = 0X2A59F2A1
	    wds[13] = 0X77F1A658
	    wds[14] = 80
	elseif wd == "神兵图鉴" then
		wds[1] = "征战沙场的大唐弟子所撰写的书册，记载着天下武器和铠甲的鉴定心法。"
		wds[2] = 4
		wds[3] = 2
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xA523F956
	    wds[13] = 0x4FB63423
	elseif wd == "灵宝图鉴" then
		wds[1] = "来自地府的灵宝，记载些一些装备的鉴定心法。"
		wds[2] = 4
		wds[3] = 2
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xA80AC05A
	    wds[13] = 0xF316C979
	elseif wd == "乾坤袋" then
		wds[1] = "一个能装天地万物的乾坤如意袋，在特定战斗中祭起可将对手收入袋中。"
		wds[2] = 1
		wds[3] = 11
		wds[4] = 0
        wds[8] = 3
	    wds[11] = "item.wdf"
	    wds[12] = 0xE83A6DBF
	    wds[13] = 0x9A0EA431
	    wds[14] = 80
  elseif wd == "特赦令牌" then
		wds[1] = "阎罗地狱里用来宽恕极恶不赦的鬼魂，非常罕见(交给地府迷宫三层无名野鬼可换取高级藏宝图)。"
		wds[2] = 1
		wds[3] = 11
		wds[4] = 0
        wds[8] = 3
	    wds[11] = "item.wdf"
	    wds[12] = 0x8FF330C0
	    wds[13] = 0xFE72166A
	    wds[14] = 80
 	elseif wd == "空白强化符" then
		wds[1] = "传说世间中流传着一些神奇的法术，可以点化装备为其附加某种临时属性。而懂得这些法术的人也能将一张空白的强化符进行点化，使其成为有着神奇功效的灵符。"
		wds[2] = 102
		wds[3] = 3
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0x82CAB6E5
	    wds[13] = 0xCD6B3CDA
	    wds[14] = 80
  	elseif wd == "强化符" then
		wds[1] = "神奇的灵符，有着为装备附加临时属性的效果"
		wds[2] = 101
		wds[3] = 3
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0x8FA84829
	    wds[13] = 0x2DFD9D18
	    wds[14] = 80
	elseif wd == "墨杆金钩" then
		wds[1] = "乌金铁杆，枪尖粗大且制有金色的粗大倒钩，威猛无比"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 1
	    wds[5] = 50
	    wds[7] = {"神天兵","龙太子"}
	    wds[11] = "item.wdf"
	    wds[12] = 1104964498
	    wds[13] = 3076442266
	elseif wd == "秘制醉生忘死" then
		wds[1] = "异域传来的美味珍馐，服用后有神奇功效。"
		wds[2] = 1
		wds[3] = 4
		wds[4] = 3
	    wds[8] = 1
	    wds[9] = 5000
	    wds[11] = "item.wdf"
	    wds[12] = 3981927301
	    wds[13] = 724140283
	    wds[14] = 15000
	elseif wd == "黄铜圈" then
		wds[1] = "黄铜制的环圈，握手处缚上丝线，是常用的兵器"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 11
	    wds[7] = {"飞燕女","舞天姬"}
	    wds[11] = "item.wdf"
	    wds[12] = 8632408
	    wds[13] = 526420633
	elseif wd == "洞冥草" then
		wds[1] = "山洞中生长的一种阴暗的小草，可以解除摄妖香效果"
		wds[2] = 4
		wds[3] = 1
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 3286276407
	    wds[13] = 3672031387
	    wds[14] = 80
	elseif wd == "秘制红罗羹" then
		wds[1] = "异域传来的美味珍馐，服用后有神奇功效。"
		wds[2] = 1
		wds[3] = 4
		wds[4] = 3
	    wds[8] = 1
	    wds[9] = 10000
	    wds[11] = "common/item.wdf"
	    wds[12] = 1928344100
	    wds[13] = 2602015807
	    wds[14] = 20000
    elseif wd == "秘制绿罗羹" then
		wds[1] = "异域传来的美味珍馐，服用后有神奇功效。"
		wds[2] = 1
		wds[3] = 4
		wds[4] = 3
	    wds[8] = 1
	    wds[10] = 10000
	    wds[11] = "common/item.wdf"
	    wds[12] = 0xCDDC07C1
	    wds[13] = 0x0B070C18
	    wds[14] = 20000
	elseif wd == "高速之星" then
		wds[1] = "神秘的项圈，来历至今无人知晓"
		wds[2] = 2
		wds[3] = 2
		wds[4] = 1
	    wds[5] = 50
	    wds[11] = "item.wdf"
	    wds[12] = 4175067704
	    wds[13] = 1572566259
	elseif wd == "钝铁重剑" then
		wds[1] = "废铁弃疗打造出来的重剑，价格低廉，适宜新手。"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 16
	    wds[7] = {"偃无师"}
	    wds[11] = "common/item.wdf"
	    wds[12] = 4219998266
	    wds[13] = 3460607829
	elseif wd == "秘制翡翠豆腐" then
		wds[1] = "异域传来的美味珍馐，服用后有神奇功效。"
		wds[2] = 1
		wds[3] = 4
		wds[4] = 3
	    wds[8] = 1
	    wds[10] = 5000
	    wds[11] = "item.wdf"
	    wds[12] = 299271567
	    wds[13] = 829957946
	    wds[14] = 15000
	elseif wd == "江湖夜雨" then
		wds[1] = "流传于中土的奇异饰物，佩带在身上有较强的法力作用"
		wds[2] = 2
		wds[3] = 2
		wds[4] = 1
	    wds[5] = 40
	    wds[11] = "item.wdf"
	    wds[12] = 3985913426
	    wds[13] = 293361877
	elseif wd == "白面狼牙" then
		wds[1] = "白色的神镜片，可束在腰间，能起到较强的防御作用"
		wds[2] = 2
		wds[3] = 5
		wds[4] = 1
	    wds[5] = 40
	    wds[11] = "item.wdf"
	    wds[12] = 3575831350
	    wds[13] = 3209666649
	elseif wd == "泥鳅" then
		wds[1] = "常见淡水鱼类，肉质细嫩，味道鲜美"
		wds[2] = 10
		wds[3] = 1
		wds[4] = 3
	    wds[11] = "item.wdf"
	    wds[12] = 1404739243
	    wds[13] = 2931630332
	elseif wd == "白椴杖" then
		wds[1] = "用极佳的椴木精心雕凿而成的法杖，杖身光滑，蕴含着奇妙的法力。"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 13
	    wds[5] = 20
	    wds[7] = {"巫蛮儿","羽灵神"}
	    wds[11] = "common/item.wdf"
	    wds[12] = 1994971958
	    wds[13] = 1336522328
	elseif wd == "麝香" then
		wds[1] = "仙山灵麝的麝香，是名贵的中草药材，可以补充些许法力"
		wds[2] = 1
		wds[3] = 1
		wds[4] = 2
	    wds[8] = 2
	    wds[10] = 100
	    wds[11] = "item.wdf"
	    wds[12] = 117711803
	    wds[13] = 1653741198
	    wds[14] = 1250
	elseif wd == "天狼爪" then
		wds[1] = "天山雪狼之爪，锐利无比"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 6
	    wds[5] = 10
	    wds[7] = {"狐美人","骨精灵","鬼潇潇"}
	    wds[11] = "item.wdf"
	    wds[12] = 3766972932
	    wds[13] = 2543379065
	--=========召唤兽项圈===========
	elseif wd == "竹编脖环" then
		wds[1] = "竹子围成的项圈，可以起到防御作用"
		wds[2] = 2
		wds[3] = 8
		wds[4] = 1
	    wds[5] = 5
	    wds[11] = "item.wdf"
	    wds[12] = 0x12656D50
	    wds[13] = 0xC15447DE
	elseif wd == "钢圈" then
		wds[1] = "皮布围成的项圈，可以起到防御作用"
		wds[2] = 2
		wds[3] = 8
		wds[4] = 1
	    wds[5] = 15
	    wds[11] = "item.wdf"
	    wds[12] = 0x51FE104E
	    wds[13] = 0xF0E9FA42
	elseif wd == "荆棘环" then
		wds[1] = "荆棘围成的项圈，可以起到防御作用"
		wds[2] = 2
		wds[3] = 8
		wds[4] = 1
	    wds[5] = 25
	    wds[11] = "item.wdf"
	    wds[12] = 0x150942F1
	    wds[13] = 0x82D15D47
	elseif wd == "骨环" then
		wds[1] = "骨头围成的项圈，可以起到防御作用"
		wds[2] = 2
		wds[3] = 8
		wds[4] = 1
	    wds[5] = 35
	    wds[11] = "item.wdf"
	    wds[12] = 0x66F4FC81
	    wds[13] = 0x1A425603
	elseif wd == "青铜颈环" then
	    wds[1] = "铜做的项圈"
	    wds[2] = 2
	    wds[3] = 8
	    wds[4] = 1
	    wds[5] = 45
	    wds[11] = "item.wdf"
	    wds[12] = 0x56ABA89B
	    wds[13] = 0x2EDB4111
	elseif wd == "玛瑙石环" then
	    wds[1] = "玛缁做的项圈"
	    wds[2] = 2
	    wds[3] = 8
	    wds[4] = 1
	    wds[5] = 55
	    wds[11] = "item.wdf"
	    wds[12] = 0x1752FDDE
	    wds[13] = 0x57655BFD
	elseif wd == "琉璃环" then
	    wds[1] = "琉璃的项圈"
	    wds[2] = 2
	    wds[3] = 8
	    wds[4] = 1
	    wds[5] = 65
	    wds[11] = "item.wdf"
	    wds[12] = 0x7120F39D
	    wds[13] = 0x8BA2F5BA
	elseif wd == "九曲环" then
	    wds[1] = "银做的项圈"
	    wds[2] = 2
	    wds[3] = 8
	    wds[4] = 1
	    wds[5] = 75
	    wds[11] = "item.wdf"
	    wds[12] = 0xD75A17B9
	    wds[13] = 0xD1149C66
	elseif wd == "笼玉环" then
	    wds[1] = "玉做的项圈"
	    wds[2] = 2
	    wds[3] = 8
	    wds[4] = 1
	    wds[5] = 85
	    wds[11] = "item.wdf"
	    wds[12] = 0x6E4AFA78
	    wds[13] = 0xE18E7C61
	elseif wd == "嵌宝金环" then
	    wds[1] = "金做的项圈"
	    wds[2] = 2
	    wds[3] = 8
	    wds[4] = 1
	    wds[5] = 95
	    wds[11] = "item.wdf"
	    wds[12] = 0xC3B2AC98
	    wds[13] = 0xC33B353A
	elseif wd == "玳瑁环" then
	    wds[1] = "玳瑁做的项圈"
	    wds[2] = 2
	    wds[3] = 8
	    wds[4] = 1
	    wds[5] = 105
	    wds[11] = "item.wdf"
	    wds[12] = 0xC11EADEC
	    wds[13] = 0x0D69C740
	elseif wd == "七星宝环" then
	    wds[1] = "寒冰沂蒙精心给大家制作的手环，戴上他可以秒天秒地秒空气"
	    wds[2] = 2
	    wds[3] = 8
	    wds[4] = 1
	    wds[5] = 115
	    wds[11] = "item.wdf"
	    wds[12] = 0x286FA969
	    wds[13] = 0x20E98108
	elseif wd == "缚龙圈" then
	    wds[1] = "龙筋做的项圈"
	    wds[2] = 2
	    wds[3] = 8
	    wds[4] = 1
	    wds[5] = 125
	    wds[11] = "item.wdf"
	    wds[12] = 0x9BB95D35
	    wds[13] = 0xD002593F
	elseif wd == "鸾尾环" then
	    wds[1] = "凤凰的羽毛做的项圈"
	    wds[2] = 2
	    wds[3] = 8
	    wds[4] = 1
	    wds[5] = 135
	    wds[11] = "item.wdf"
	    wds[12] = 0x8BC3A051
	    wds[13] = 0x60B55501
	elseif wd == "织锦颈圈" then
	    wds[1] = "锦做的项圈"
	    wds[2] = 2
	    wds[3] = 8
	    wds[4] = 1
	    wds[5] =145
	    wds[11] = "item.wdf"
	    wds[12] = 0xF398CA2B
	    wds[13] = 0x34F1297C
	elseif wd == "冰蚕丝圈" then
	    wds[1] = "冰蚕丝做的项圈"
	    wds[2] = 2
	    wds[3] = 8
	    wds[4] = 1
	    wds[5] = 155
	    wds[11] = "item.wdf"
	    wds[12] = 0xCAF49FBE
	    wds[13] = 0x62C51769
	--======召唤兽铠甲==========
	elseif wd == "竹藤甲" then
	    wds[1] = "竹藤制成的衣服，可以起到防御作用。"
	    wds[2] = 2
	    wds[3] = 9
	    wds[4] = 1
	    wds[5] = 5
	    wds[11] = "item.wdf"
	    wds[12] = 0x440C4E35
	    wds[13] = 0xE497BC0E
	elseif wd == "皮甲" then
		wds[1] = "皮布制成的衣服，可以起到防御作用"
		wds[2] = 2
		wds[3] = 9
		wds[4] = 1
	    wds[5] = 15
	    wds[11] = "item.wdf"
	    wds[12] = 0x6670FC2C
	    wds[13] = 0x157D0DC8
	elseif wd == "刺甲" then
		wds[1] = "精铁制成的衣服，可以起到防御作用"
		wds[2] = 2
		wds[3] = 9
		wds[4] = 1
	    wds[5] = 25
	    wds[11] = "item.wdf"
	    wds[12] = 0xC8E4088B
	    wds[13] = 0x8D252B7B
	elseif wd == "骨排甲" then
		wds[1] = "骨头制成的衣服，可以起到防御作用"
		wds[2] = 2
		wds[3] = 9
		wds[4] = 1
	    wds[5] = 35
	    wds[11] = "item.wdf"
	    wds[12] = 0x49C82067
	    wds[13] = 0x749824D3
	elseif wd == "青铜披甲" then
	    wds[1] = "铜做的铠甲"
	    wds[2] = 2
	    wds[3] = 9
	    wds[4] = 1
	    wds[5] = 45
	    wds[11] = "item.wdf"
	    wds[12] = 0xB9E7C15C
	    wds[13] = 0x6D01B1A3
	elseif wd == "玛瑙软甲" then
	    wds[1] = "玛缁做的铠甲"
	    wds[2] = 2
	    wds[3] = 9
	    wds[4] = 1
	    wds[5] = 55
	    wds[11] = "item.wdf"
	    wds[12] = 0xAE0769A0
	    wds[13] = 0xC7E186AA
	elseif wd == "琉璃罩甲" then
	    wds[1] = "琉璃的铠甲"
	    wds[2] = 2
	    wds[3] = 9
	    wds[4] = 1
	    wds[5] = 65
	    wds[11] = "item.wdf"
	    wds[12] = 0x29804071
	    wds[13] = 0x9023B123
	 elseif wd == "连环铠甲" then
	    wds[1] = "银做的铠甲"
	    wds[2] = 2
	    wds[3] = 9
	    wds[4] = 1
	    wds[5] = 75
	    wds[11] = "item.wdf"
	    wds[12] = 0x2FCBE79A
	    wds[13] = 0x090B5B8A
	elseif wd == "笼玉甲" then
	    wds[1] = "玉做的铠甲"
	    wds[2] = 2
	    wds[3] = 9
	    wds[4] = 1
	    wds[5] = 85
	    wds[11] = "item.wdf"
	    wds[12] = 0xF8F0B550
	    wds[13] = 0x1255FE4D
	elseif wd == "嵌宝金甲" then
	    wds[1] = "金做的铠甲"
	    wds[2] = 2
	    wds[3] = 9
	    wds[4] = 1
	    wds[5] = 95
	    wds[11] = "item.wdf"
	    wds[12] = 0x234C440C
	    wds[13] = 0xF7BC24CE
	elseif wd == "玳瑁衣" then
	    wds[1] = "玳瑁做的铠甲"
	    wds[2] = 2
	    wds[3] = 9
	    wds[4] = 1
	    wds[5] = 105
	    wds[11] = "item.wdf"
	    wds[12] = 0x563F5BD1
	    wds[13] = 0x16275C8E
	elseif wd == "七星宝甲" then
	    wds[1] = "寒冰沂蒙精心为大家做的铠甲，戴上后可以秒天秒地秒空气"
	    wds[2] = 2
	    wds[3] = 9
	    wds[4] = 1
	    wds[5] = 115
	    wds[11] = "item.wdf"
	    wds[12] = 0x5E6FC760
	    wds[13] = 0x5037E497
	elseif wd == "缚龙甲" then
	    wds[1] = "龙筋做的铠甲"
	    wds[2] = 2
	    wds[3] = 9
	    wds[4] = 1
	    wds[5] = 125
	    wds[11] = "item.wdf"
	    wds[12] = 0x04037AC1
	    wds[13] = 0xD0125017
	elseif wd == "凤凰彩衣" then
	    wds[1] = "凤凰的羽毛做的铠甲"
	    wds[2] = 2
	    wds[3] = 9
	    wds[4] = 1
	    wds[5] = 135
	    wds[11] = "item.wdf"
	    wds[12] = 0xED7A9BFE
	    wds[13] = 0xC47A3765
	elseif wd == "织锦软褡" then
	    wds[1] = "锦做的铠甲"
	    wds[2] = 2
	    wds[3] = 9
	    wds[4] = 1
	    wds[5] = 145
	    wds[11] = "item.wdf"
	    wds[12] = 0xC77EE0B7
	    wds[13] = 0x4E5F4830
	elseif wd == "冰蚕织甲" then
	    wds[1] = "冰蚕丝做的铠甲"
	    wds[2] = 2
	    wds[3] = 9
	    wds[4] = 1
	    wds[5] = 155
	    wds[11] = "item.wdf"
	    wds[12] = 0x1F3F4E97
	    wds[13] = 0x9C023588
	--=======召唤兽护腕========
	elseif wd == "竹编护腕" then
		wds[1] = "竹子做的护腕，可以起到伤害力"
		wds[2] = 2
		wds[3] = 7
		wds[4] = 1
	    wds[5] = 5
	    wds[11] = "item.wdf"
	    wds[12] = 0x53F8EBA5
	    wds[13] = 0x809C04C8
	elseif wd == "皮腕" then
		wds[1] = "皮布做的护腕，可以起到伤害力"
		wds[2] = 2
		wds[3] = 7
		wds[4] = 1
	    wds[5] = 15
	    wds[11] = "item.wdf"
	    wds[12] = 0x336A2EC6
	    wds[13] = 0xA8F7F6C0
	elseif wd == "针腕" then
		wds[1] = "针做的护腕，可以起到伤害力"
		wds[2] = 2
		wds[3] = 7
		wds[4] = 1
	    wds[5] = 25
	    wds[11] = "item.wdf"
	    wds[12] = 0xC1A4E276
	    wds[13] = 0x1C28FB6F
	elseif wd == "骨镯" then
		wds[1] = "骨头做的护腕，可以起到伤害力"
		wds[2] = 2
		wds[3] = 7
		wds[4] = 1
	    wds[5] = 35
	    wds[11] = "item.wdf"
	    wds[12] = 0x47680171
	    wds[13] = 0xDB529E26
	elseif wd == "青铜护腕" then
	    wds[1] = "铜做的护腕"
	    wds[2] = 2
	    wds[3] = 7
	    wds[4] = 1
	    wds[5] = 45
	    wds[11] = "item.wdf"
	    wds[12] = 0x152B263E
	    wds[13] = 0x9D0CFE72
	elseif wd == "玛瑙护腕" then
	    wds[1] = "玛缁做的护腕"
	    wds[2] = 2
	    wds[3] = 7
	    wds[4] = 1
	    wds[5] = 55
	    wds[11] = "item.wdf"
	    wds[12] = 0xB3405C3F
	    wds[13] = 0xDD8EA49F
	elseif wd == "琉璃护腕" then
	    wds[1] = "琉璃的护腕"
	    wds[2] = 2
	    wds[3] = 7
	    wds[4] = 1
	    wds[5] = 65
	    wds[11] = "item.wdf"
	    wds[12] = 0x3FB923E4
	    wds[13] = 0xC7A0F7FB
	elseif wd == "镂空银镯" then
	    wds[1] = "银做的护腕"
	    wds[2] = 2
	    wds[3] = 7
	    wds[4] = 1
	    wds[5] = 75
	    wds[11] = "item.wdf"
	    wds[12] = 0xB7B54543
	    wds[13] = 0xE168F7C1
	elseif wd == "笼玉镯" then
	    wds[1] = "玉做的护腕"
	    wds[2] = 2
	    wds[3] = 7
	    wds[4] = 1
	    wds[5] = 85
	    wds[11] = "item.wdf"
	    wds[12] = 0x307ACF93
	    wds[13] = 0xFEE14584
	elseif wd == "嵌宝金腕" then
	    wds[1] = "金做的护腕"
	    wds[2] = 2
	    wds[3] = 7
	    wds[4] = 1
	    wds[5] = 95
	    wds[11] = "item.wdf"
	    wds[12] = 0xBD98D975
	    wds[13] = 0xA87273E4
	elseif wd == "玳瑁护腕" then
	    wds[1] = "玳瑁做的护腕"
	    wds[2] = 2
	    wds[3] = 7
	    wds[4] = 1
	    wds[5] = 105
	    wds[11] = "item.wdf"
	    wds[12] = 0x91CD16B5
	    wds[13] = 0x0B4042DF
	elseif wd == "七星宝腕" then
	    wds[1] = "寒冰沂蒙精心给大家的护腕，戴上这个可以秒天秒地秒空气"
	    wds[2] = 2
	    wds[3] = 7
	    wds[4] = 1
	    wds[5] = 115
	    wds[11] = "item.wdf"
	    wds[12] = 0x2DEC7C4E
	    wds[13] = 0x158E1623
	elseif wd == "缚龙筋" then
	    wds[1] = "龙筋做的护腕"
	    wds[2] = 2
	    wds[3] = 7
	    wds[4] = 1
	    wds[5] = 125
	    wds[11] = "item.wdf"
	    wds[12] = 0x639CF6A5
	    wds[13] = 0xEA7D3F1C
	elseif wd == "凤翎护腕" then
	    wds[1] = "凤凰的羽毛做的护腕"
	    wds[2] = 2
	    wds[3] = 7
	    wds[4] = 1
	    wds[5] = 135
	    wds[11] = "item.wdf"
	    wds[12] = 0x5AA77450
	    wds[13] = 0xD0B093D0
	elseif wd == "织锦彩带" then
	    wds[1] = "锦做的护腕"
	    wds[2] = 2
	    wds[3] = 7
	    wds[4] = 1
	    wds[5] = 145
	    wds[11] = "item.wdf"
	    wds[12] = 0x196F1418
	    wds[13] = 0xF15B5332
	elseif wd == "冰蚕丝带" then
	    wds[1] = "冰蚕丝做的护腕"
	    wds[2] = 2
	    wds[3] = 7
	    wds[4] = 1
	    wds[5] = 155
	    wds[11] = "item.wdf"
	    wds[12] = 0x27ECB10D
	    wds[13] = 0xD015AE2E
	--=========================
	elseif wd == "玄冰刺" then
		wds[1] = "吸玄冰阴寒之气，可以直透骨骸"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 6
	    wds[5] = 50
	    wds[7] = {"狐美人","骨精灵","鬼潇潇"}
	    wds[11] = "item.wdf"
	    wds[12] = 3220766446
	    wds[13] = 1038526054
	elseif wd == "鲫鱼" then
		wds[1] = "体态雍容,有鱼中君子之称"
		wds[2] = 10
		wds[3] = 2
		wds[4] = 6
	    wds[11] = "item.wdf"
	    wds[12] = 392448174
	    wds[13] = 3721203032
	elseif wd == "震天锤" then
		wds[1] = "寒钢制成的锤头巨大沉重，一击之下威势震天"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 9
	    wds[5] = 60
	    wds[7] = {"神天兵","虎头怪"}
	    wds[11] = "item.wdf"
	    wds[12] = 1233600514
	    wds[13] = 3915438961
	elseif wd == "百折扇" then
		wds[1] = "采用非常多的扇骨，扇面百折，非常坚固"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 7
	    wds[5] = 40
	    wds[7] = {"逍遥生","龙太子"}
	    wds[11] = "item.wdf"
	    wds[12] = 742792031
	    wds[13] = 972230490
	elseif wd == "缨络丝带" then
		wds[1] = "红色的缨络结成的丝带，可以起到防御的作用"
		wds[2] = 2
		wds[3] = 1
		wds[4] = 1
	    wds[5] = 40
	    wds[6] = "男"
	    wds[11] = "item.wdf"
	    wds[12] = 1901332626
	    wds[13] = 1222266422
	elseif wd == "腰带" then
		wds[1] = "一条普通的腰带，可以起到防御的作用"
		wds[2] = 2
		wds[3] = 5
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 581742663
	    wds[13] = 1978200666
	elseif wd == "钢甲" then
		wds[1] = "用精钢制成的铠甲，防御能力较强"
		wds[2] = 2
		wds[3] = 4
		wds[4] = 1
	    wds[5] = 50
	    wds[6] = "男"
	    wds[11] = "item.wdf"
	    wds[12] = 1672609844
	    wds[13] = 1862358389
	elseif wd == "宝雕长弓" then
		wds[1] = "乌木长弓，弓身镌刻之宝雕，栩栩如生，振翅欲飞。"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 14
	    wds[5] = 30
	    wds[7] = {"羽灵神","杀破狼"}
	    wds[11] = "common/item.wdf"
	    wds[12] = 2253432731
	    wds[13] = 1106872316
	elseif wd == "金丝魔棒" then
		wds[1] = "棒身缠以金丝，显得华丽"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 8
	    wds[5] = 10
	    wds[7] = {"玄彩娥","骨精灵"}
	    wds[11] = "item.wdf"
	    wds[12] = 2190248338
	    wds[13] = 850861563
	elseif wd == "炼妖石" then
		wds[1] = "从仙界散落到人间的“灵”石，拥有强烈的吸附能量的能力。"
		wds[2] = 3
		wds[3] = 3
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 94724302
	    wds[13] = 164529735
    elseif wd == "上古锻造图策" then
		wds[1] = "古代的典籍，详细记录了各种护具的锻造方法。"
		wds[2] = 3
		wds[3] = 10
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0x9F6993FA
	    wds[13] = 0xF2379F81
     elseif wd == "天眼珠" then
		wds[1] = "吸收了一定的生物潜能，再通过特别的方式将此潜能转化到召唤兽装备上。"
		wds[2] = 3
		wds[3] = 11
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0xD29E5ECE
	    wds[13] = 0x859C0204
	elseif wd == "大闸蟹" then
		wds[1] = "体型较大的淡水蟹，常见于深水湖泊之中"
		wds[2] = 10
		wds[3] = 3
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 2720292819
	    wds[13] = 2971511263
	elseif wd == "马靴" then
		wds[1] = "皮制的马靴，可以起到防御的作用"
		wds[2] = 2
		wds[3] = 6
		wds[4] = 1
	    wds[5] = 20
	    wds[11] = "item.wdf"
	    wds[12] = 3241248586
	    wds[13] = 3542020689
	elseif wd == "藤圈" then
		wds[1] = "藤条围成的项圈，可以起到防御作用"
		wds[2] = 2
		wds[3] = 8
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 4170754053
	    wds[13] = 2301647242
	elseif wd == "侠客履" then
		wds[1] = "非常强的鞋，速度和防御作用都属上品"
		wds[2] = 2
		wds[3] = 6
		wds[4] = 1
	    wds[5] = 30
	    wds[11] = "item.wdf"
	    wds[12] = 32184820
	    wds[13] = 558037323
	elseif wd == "八卦坠" then
		wds[1] = "以八卦制成的饰物，佩带在身上有较强的法力作用"
		wds[2] = 2
		wds[3] = 2
		wds[4] = 1
	    wds[5] = 60
	    wds[11] = "item.wdf"
	    wds[12] = 1357232476
	    wds[13] = 3364357037
	elseif wd == "细木棒" then
		wds[1] = "看似细小却有不小的威力，可以当作兵器防身"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 8
	    wds[7] = {"玄彩娥","骨精灵"}
	    wds[11] = "item.wdf"
	    wds[12] = 3647840943
	    wds[13] = 445770073
	elseif wd == "大黄鱼" then
		wds[1] = "常见于近海深水区域，身型修长"
		wds[2] = 10
		wds[3] = 2
		wds[4] = 2
	    wds[11] = "item.wdf"
	    wds[12] = 2350785153
	    wds[13] = 2912558181
	elseif wd == "牛筋鞭" then
		wds[1] = "以上等牛筋制成，弹性极佳，抽之有破空之声"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 10
	    wds[5] = 10
	    wds[7] = {"英女侠","狐美人"}
	    wds[11] = "item.wdf"
	    wds[12] = 156247531
	    wds[13] = 2779337532
	elseif wd == "夜魔披风" then
		wds[1] = "来自阴间的披风，隐隐透出神秘的幽冥气息"
		wds[2] = 2
		wds[3] = 4
		wds[4] = 1
	    wds[5] = 60
	    wds[6] = "男"
	    wds[11] = "item.wdf"
	    wds[12] = 2191193414
	    wds[13] = 1388622524
	elseif wd == "苍魂珠" then
		wds[1] = "据说珠里附有魂魄，佩带在身上有较强的法力作用"
		wds[2] = 2
		wds[3] = 2
		wds[4] = 1
	    wds[5] = 30
	    wds[11] = "item.wdf"
	    wds[12] = 4237594230
	    wds[13] = 1893159766
	elseif wd == "护身符" then
		wds[1] = "一块护身符，佩带在身上有一定法力作用"
		wds[2] = 2
		wds[3] = 2
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 2460748358
	    wds[13] = 359787750
	elseif wd == "烈焰锤" then
		wds[1] = "锤面上制造了不少火焰波浪一般的锋刃，可怕的武器"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 9
	    wds[5] = 40
	    wds[7] = {"神天兵","虎头怪"}
	    wds[11] = "item.wdf"
	    wds[12] = 1937110983
	    wds[13] = 2558099166
	elseif wd == "锁子甲" then
		wds[1] = "胸部是铁环，如铁锁加身，防御力相当不错"
		wds[2] = 2
		wds[3] = 4
		wds[4] = 1
	    wds[5] = 30
	    wds[6] = "男"
	    wds[11] = "item.wdf"
	    wds[12] = 2078226169
	    wds[13] = 2963205363
	elseif wd == "苗刀" then
		wds[1] = "苗疆常用的兵器，极细极尖锐"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 12
	    wds[5] = 10
	    wds[7] = {"剑侠客","巨魔王"}
	    wds[11] = "item.wdf"
	    wds[12] = 183813784
	    wds[13] = 3883026774
	elseif wd == "青铜斧" then
		wds[1] = "以硬木和青铜制造的大斧，是常用的兵器"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 2
	    wds[7] = {"巨魔王","虎头怪"}
	    wds[11] = "item.wdf"
	    wds[12] = 1194618546
	    wds[13] = 1823715223
	elseif wd == "麻衣" then
		wds[1] = "麻布制成的衣服，可以起到防御作用"
		wds[2] = 2
		wds[3] = 9
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 3547852010
	    wds[13] = 276685974
	elseif wd == "精钢日月圈" then
		wds[1] = "精钢打造的圆环，外缘锋利"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 11
	    wds[5] = 10
	    wds[7] = {"飞燕女","舞天姬"}
	    wds[11] = "item.wdf"
	    wds[12] = 2611939848
	    wds[13] = 523588802
	elseif wd == "小黄鱼" then
		wds[1] = "也称黄花鱼，喜欢在近海底层结群活动，是常见的海产鱼类"
		wds[2] = 10
		wds[3] = 2
		wds[4] = 5
	    wds[11] = "item.wdf"
	    wds[12] = 3155849929
	    wds[13] = 1939631478
	elseif wd == "方巾" then
		wds[1] = "普通人常带的帽子"
		wds[2] = 2
		wds[3] = 1
		wds[4] = 1
	    wds[6] = "男"
	    wds[11] = "item.wdf"
	    wds[12] = 4205295661
	    wds[13] = 266830706
	elseif wd == "青刚刺" then
		wds[1] = "寒刚玉所制，坚硬无比，可断金"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 6
	    wds[5] = 60
	    wds[7] = {"狐美人","骨精灵","鬼潇潇"}
	    wds[11] = "item.wdf"
	    wds[12] = 1950914816
	    wds[13] = 414938796
	elseif wd == "蛇形月" then
		wds[1] = "划动时锋刃似盘卷的黑蛇，令人防不胜防"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 11
	    wds[5] = 60
	    wds[7] = {"飞燕女","舞天姬"}
	    wds[11] = "item.wdf"
	    wds[12] = 3576968772
	    wds[13] = 2783575959
	elseif wd == "银腰带" then
		wds[1] = "银制的腰带，可以起到防御的作用"
		wds[2] = 2
		wds[3] = 5
		wds[4] = 1
	    wds[5] = 20
	    wds[11] = "item.wdf"
	    wds[12] = 3920753159
	    wds[13] = 1636787949
	elseif wd == "镔铁锤" then
		wds[1] = "镔铁打造的锤是价廉而常被采用的兵器"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 9
	    wds[5] = 10
	    wds[7] = {"神天兵","虎头怪"}
	    wds[11] = "item.wdf"
	    wds[12] = 2560759534
	    wds[13] = 2680776140
	elseif wd == "如意宝珠" then
		wds[1] = "琅嬛福地生香橼，百年方熟，熟而坠地，化为如意宝珠，鲜明莹洁，祥瑞兆也。"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 15
	    wds[5] = 60
	    wds[7] = {"巫蛮儿","杀破狼"}
	    wds[11] = "common/item.wdf"
	    wds[12] = 1237441752
	    wds[13] = 296013680
	elseif wd == "青龙牙" then
		wds[1] = "龙牙状的尖刺，可以透入坚固的衣甲"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 6
	    wds[5] = 30
	    wds[7] = {"狐美人","骨精灵","鬼潇潇"}
	    wds[11] = "item.wdf"
	    wds[12] = 3410109601
	    wds[13] = 2844091192
	elseif wd == "曲柳杖" then
		wds[1] = "柳木雕凿的法杖，蕴含一点法力，适合新手使用"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 13
	    wds[7] = {"巫蛮儿","羽灵神"}
	    wds[11] = "common/item.wdf"
	    wds[12] = 214558735
	    wds[13] = 1713378827
	elseif wd == "狼牙锤" then
		wds[1] = "锤面密布狼牙细齿，杀伤力不可小视"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 9
	    wds[5] = 30
	    wds[7] = {"神天兵","虎头怪"}
	    wds[11] = "item.wdf"
	    wds[12] = 575451669
	    wds[13] = 3613953095
	elseif wd == "莲华珠" then
		wds[1] = "来自天竺佛国的灵巧宝珠，晶莹圆润，光华四溢，置于水中，可化作轻盈莲花，净水生香。"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 15
	    wds[5] = 40
	    wds[7] = {"巫蛮儿","杀破狼"}
	    wds[11] = "common/item.wdf"
	    wds[12] = 121754786
	    wds[13] = 3809551301
	elseif wd == "翡翠珠" then
		wds[1] = "南蛮之地进献之翡翠，经能工巧匠九琢九磨，方成玲珑宝珠，通体翠绿凝碧，触手冰凉，仿似有仙气缭绕。"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 15
	    wds[5] = 30
	    wds[7] = {"巫蛮儿","杀破狼"}
	    wds[11] = "common/item.wdf"
	    wds[12] = 3824352456
	    wds[13] = 3517783128
	elseif wd == "玉腰弯弓" then
		wds[1] = "柘木宝弓嵌以碧绿美玉，质坚且韧，精准凌厉。"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 14
	    wds[5] = 50
	    wds[7] = {"羽灵神","杀破狼"}
	    wds[11] = "common/item.wdf"
	    wds[12] = 3397522151
	    wds[13] = 106500071
	elseif wd == "包子" then
		wds[1] = "精面粉制作的肉包子味道非常好"
		wds[2] = 1
		wds[3] = 4
		wds[4] = 1
	    wds[8] = 1
	    wds[9] = 100
	    wds[11] = "item.wdf"
	    wds[12] = 1457520669
	    wds[13] = 1302655530
	    wds[14] = 100
	elseif wd == "随机特殊兽决" then
		wds[1] = "使用获得随机一本特殊兽决。"
		wds[2] = 1
		wds[3] = 4
		wds[4] = 1
	    wds[8] = 1
	    wds[9] = 100
	    wds[11] = "item.wdf"
	    wds[12] = 0x6CAD36E8
	    wds[13] = 0xD86D89B8
	elseif wd == "生肖密令" then
		wds[1] = "进入生肖家园的令牌，并且获得一次挑战生肖的机会。地点长寿，凤凰姑娘"
		wds[2] = 1
		wds[3] = 4
		wds[4] = 1
		wds[8] = "右键获得进入一次生肖家园的机会。"
	    wds[11] = "item.wdf"
	    wds[12] = 0x79E9E6B0
	    wds[13] = 0xE84B01F2
  	elseif wd == "女儿红" then
		wds[1] = "名酒，酒香浓烈"
		wds[2] = 1
		wds[3] = 4
		wds[4] = 1
	    wds[8] = 1
	    wds[9] = 100
	    wds[11] = "item.wdf"
	    wds[12] = 0x2ECB8558
	    wds[13] = 0x5F376254
	    wds[14] = 100
   elseif wd == "臭豆腐" then
		wds[1] = "虽然闻起来有些臭，吃起来很香的。"
		wds[2] = 1
		wds[3] = 4
		wds[4] = 1
	    wds[8] = 1
	    wds[9] = 100
	    wds[11] = "item.wdf"
	    wds[12] = 0x7E096A40
	    wds[13] = 0xCC401415
	    wds[14] = 100
     elseif wd == "烤鸭" then
		wds[1] = "北方特产，油滑可口"
		wds[2] = 1
		wds[3] = 4
		wds[4] = 1
	    wds[8] = 1
	    wds[9] = 100
	    wds[11] = "item.wdf"
	    wds[12] = 0x900198D8
	    wds[13] = 0xAA17FF00
	    wds[14] = 100
   elseif wd == "烤肉" then
		wds[1] = "烤出的肉，非常好吃"
		wds[2] = 1
		wds[3] = 4
		wds[4] = 1
	    wds[8] = 1
	    wds[9] = 100
	    wds[11] = "item.wdf"
	    wds[12] = 0x775117AB
	    wds[13] = 0x09D51835
	    wds[14] = 100
     elseif wd == "佛跳墙" then
		wds[1] = "东吴名厨创制的一道菜，味道鲜美。"
		wds[2] = 1
		wds[3] = 4
		wds[4] = 1
	    wds[8] = 1
	    wds[9] = 100
	    wds[11] = "item.wdf"
	    wds[12] = 0x76A70298
	    wds[13] = 0x01F1ED48
	    wds[14] = 100
   elseif wd == "翡翠豆腐" then
		wds[1] = "名厨名菜，炒得色香味美全。"
		wds[2] = 1
		wds[3] = 4
		wds[4] = 1
	    wds[8] = 1
	    wds[9] = 100
	    wds[11] = "item.wdf"
	    wds[12] = 0x11D6858F
	    wds[13] = 0x3178273A
	    wds[14] = 100
   elseif wd == "桂花丸" then
		wds[1] = "糯米和桂花制成的食品。"
		wds[2] = 1
		wds[3] = 4
		wds[4] = 1
	    wds[8] = 1
	    wds[9] = 100
	    wds[11] = "item.wdf"
	    wds[12] = 0xCCC8D804
	    wds[13] = 0xDF9A8FAB
	    wds[14] = 100
      elseif wd == "豆斋果" then
		wds[1] = "素食品，豆面制成的各种水果。"
		wds[2] = 1
		wds[3] = 4
		wds[4] = 1
	    wds[8] = 1
	    wds[9] = 100
	    wds[11] = "item.wdf"
	    wds[12] = 0xEA4ED968
	    wds[13] = 0x58130DB3
	    wds[14] = 100
   elseif wd == "长寿面" then
		wds[1] = "一碗热气腾腾的长寿面条。"
		wds[2] = 1
		wds[3] = 4
		wds[4] = 1
	    wds[8] = 1
	    wds[9] = 100
	    wds[11] = "item.wdf"
	    wds[12] = 0x9914F83B
	    wds[13] = 0xC5652305
	    wds[14] = 100
    elseif wd == "珍露酒" then
		wds[1] = "用露水酿制的美酒。"
		wds[2] = 1
		wds[3] = 4
		wds[4] = 1
	    wds[8] = 1
	    wds[9] = 100
	    wds[11] = "item.wdf"
	    wds[12] = 0x71F4446B
	    wds[13] = 0xEFFC63BB
	    wds[14] = 100
      elseif wd == "梅花酒" then
		wds[1] = "梅花泡成的酒，有梅花的清香。"
		wds[2] = 1
		wds[3] = 4
		wds[4] = 1
	    wds[8] = 1
	    wds[9] = 100
	    wds[11] = "item.wdf"
	    wds[12] = 0x717E19FF
	    wds[13] = 0xF8D6B828
	    wds[14] = 100
   elseif wd == "蛇胆酒" then
		wds[1] = "用蛇胆泡的美酒，具有药性。"
		wds[2] = 1
		wds[3] = 4
		wds[4] = 1
	    wds[8] = 1
	    wds[9] = 100
	    wds[11] = "item.wdf"
	    wds[12] = 0x6607309D
	    wds[13] = 0x67A3D814
	    wds[14] = 100
   	elseif wd == "虎骨酒" then
		wds[1] = "虎骨泡成的酒，具有药性"
		wds[2] = 1
		wds[3] = 4
		wds[4] = 1
	    wds[8] = 1
	    wds[9] = 100
	    wds[11] = "item.wdf"
	    wds[12] = 0xCD6FDF37
	    wds[13] = 0x46A54492
	    wds[14] = 100
  	elseif wd == "百味酒" then
		wds[1] = "泡了上百味药品的药酒"
		wds[2] = 1
		wds[3] = 4
		wds[4] = 1
	    wds[8] = 1
	    wds[9] = 100
	    wds[11] = "item.wdf"
	    wds[12] = 0x1FA7B36A
	    wds[13] = 0xFFB20F40
	    wds[14] = 100
  	elseif wd == "醉生梦死" then
		wds[1] = "仙酒，瑶池会的必备佳酿"
		wds[2] = 1
		wds[3] = 4
		wds[4] = 1
	    wds[8] = 1
	    wds[9] = 100
	    wds[11] = "item.wdf"
	    wds[12] = 0xED576385
	    wds[13] = 0x2B2980FB
	    wds[14] = 100
	elseif wd == "天香披肩" then
		wds[1] = "瑶台玉女穿的披肩，有相当的防御力"
		wds[2] = 2
		wds[3] = 4
		wds[4] = 1
	    wds[5] = 40
	    wds[6] = "女"
	    wds[11] = "item.wdf"
	    wds[12] = 3709034410
	    wds[13] = 3803079314
	elseif wd == "琉璃珠" then
		wds[1] = "三色琉璃熔成的宝珠，轻盈剔透，适合新手携带"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 15
	    wds[7] = {"巫蛮儿","杀破狼"}
	    wds[11] = "common/item.wdf"
	    wds[12] = 2607779407
	    wds[13] = 3954061095
	elseif wd == "连珠神弓" then
		wds[1] = "玲珑连珠，发机如电，一发连五，绝无虚矢。"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 14
	    wds[5] = 60
	    wds[7] = {"羽灵神","杀破狼"}
	    wds[11] = "common/item.wdf"
	    wds[12] = 4094037333
	    wds[13] = 2641579130
	elseif wd == "点金棒" then
		wds[1] = "华丽的蛇形棒，相传作法之人常用其点石成金"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 8
	    wds[5] = 30
	    wds[7] = {"玄彩娥","骨精灵"}
	    wds[11] = "item.wdf"
	    wds[12] = 3187022651
	    wds[13] = 2074779560
	elseif wd == "錾金宝弓" then
		wds[1] = "黑檀宝弓，经巧匠之手精雕细錾，华贵不可方物。"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 14
	    wds[5] = 40
	    wds[7] = {"羽灵神","杀破狼"}
	    wds[11] = "common/item.wdf"
	    wds[12] = 234218100
	    wds[13] = 706673394
	elseif wd == "铁胆弓" then
		wds[1] = "硬木制成的弓箭，背嵌铁条，射程很远。"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 14
	    wds[5] = 10
	    wds[7] = {"羽灵神","杀破狼"}
	    wds[11] = "common/item.wdf"
	    wds[12] = 1814282557
	    wds[13] = 2181027484
	elseif wd == "鹰眼法杖" then
		wds[1] = "孤鹰展翅，划破长空，依照孤鹰之形打造的法杖，蕴含神奇法力。"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 13
	    wds[5] = 50
	    wds[7] = {"巫蛮儿","羽灵神"}
	    wds[11] = "common/item.wdf"
	    wds[12] = 3849435987
	    wds[13] = 2058809879
	elseif wd == "金背大砍刀" then
		wds[1] = "刀身挺直，以黄金镶背，刀道沉猛"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 12
	    wds[5] = 30
	    wds[7] = {"剑侠客","巨魔王"}
	    wds[11] = "item.wdf"
	    wds[12] = 1741978907
	    wds[13] = 3104242640
	elseif wd == "佛光舍利子" then
		wds[1] = "佛的舍利子具有补充气血、疗伤和起死回生的功效。"
		wds[2] = 1
		wds[3] = 2
		wds[4] = 3
	    wds[8] = 3
	    wds[11] = "item.wdf"
	    wds[12] = 529664613
	    wds[13] = 362856580
	    wds[14] = 15000
	elseif wd == "无极丝" then
		wds[1] = "天地无极尽收于其间"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 5
	    wds[5] = 30
	    wds[7] = {"舞天姬","玄彩娥","桃夭夭"}
	    wds[11] = "item.wdf"
	    wds[12] = 85830180
	    wds[13] = 4066138115
	elseif wd == "海星" then
		wds[1] = "生活在深海，因身型呈五角星状而得名"
		wds[2] = 10
		wds[3] = 3
		wds[4] = 3
	    wds[11] = "item.wdf"
	    wds[12] = 320725587
	    wds[13] = 1259406158
	elseif wd == "牛皮靴" then
		wds[1] = "牛皮缝制的靴子，速度和防御作用都比较强"
		wds[2] = 2
		wds[3] = 6
		wds[4] = 1
	    wds[5] = 10
	    wds[11] = "item.wdf"
	    wds[12] = 4095390557
	    wds[13] = 2232108129
	elseif wd == "鱼骨双剑" then
		wds[1] = "剑身似鱼骨，长满倒钩刺"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 4
	    wds[5] = 50
	    wds[7] = {"英女侠","飞燕女"}
	    wds[11] = "item.wdf"
	    wds[12] = 741866499
	    wds[13] = 1761353936
	elseif wd == "赤炎环" then
		wds[1] = "环边有锯齿，如太阳之火焰"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 11
	    wds[5] = 50
	    wds[7] = {"飞燕女","舞天姬"}
	    wds[11] = "item.wdf"
	    wds[12] = 692700444
	    wds[13] = 609650976
	elseif wd == "珍珠链" then
		wds[1] = "一串珍珠，佩带在身上有一定法力作用"
		wds[2] = 2
		wds[3] = 2
		wds[4] = 1
	    wds[5] = 20
	    wds[11] = "item.wdf"
	    wds[12] = 2451318875
	    wds[13] = 4232202616
	elseif wd == "牛皮鞭" then
		wds[1] = "用牛皮制的皮鞭，很容易得到的练习用品"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 10
	    wds[7] = {"英女侠","狐美人"}
	    wds[11] = "item.wdf"
	    wds[12] = 1637717692
	    wds[13] = 799104265
	elseif wd == "布帽" then
		wds[1] = "布制，普通人家使用的头冠"
		wds[2] = 2
		wds[3] = 1
		wds[4] = 1
	    wds[5] = 10
	    wds[6] = "男"
	    wds[11] = "item.wdf"
	    wds[12] = 2131362658
	    wds[13] = 1813515840
	elseif wd == "彩果" then
		wds[1] = "神奇的果子，可以改变角色的造型"
		wds[2] = 8
		wds[3] = 1
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 567106113
	    wds[13] = 4251752243
	elseif wd == "青藤柳叶鞭" then
		wds[1] = "采深山古藤制成，上缚柳叶刀片，刀光闪动，杀气逼人"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 10
	    wds[5] = 60
	    wds[7] = {"英女侠","狐美人"}
	    wds[11] = "item.wdf"
	    wds[12] = 962191784
	    wds[13] = 996954971
	elseif wd == "铁面扇" then
		wds[1] = "连扇面也用铁片构成，更易格挡，晃动可出声，乱敌耳目"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 7
	    wds[5] = 30
	    wds[7] = {"逍遥生","龙太子"}
	    wds[11] = "item.wdf"
	    wds[12] = 3848744867
	    wds[13] = 2633687797
	elseif wd == "八棱金瓜" then
		wds[1] = "锤似金瓜，八棱突起，是实用的战锤"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 9
	    wds[5] = 20
	    wds[7] = {"神天兵","虎头怪"}
	    wds[11] = "item.wdf"
	    wds[12] = 2288044564
	    wds[13] = 959970229
	elseif wd == "幻彩银纱" then
		wds[1] = "上等蚕丝与银丝混织成的纱带"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 5
	    wds[5] = 10
	    wds[7] = {"舞天姬","玄彩娥","桃夭夭"}
	    wds[11] = "item.wdf"
	    wds[12] = 3727411355
	    wds[13] = 1872145487
	elseif wd == "精钢扇" then
		wds[1] = "精钢制的扇骨，可以格挡锋利的兵器攻击"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 7
	    wds[5] = 20
	    wds[7] = {"逍遥生","龙太子"}
	    wds[11] = "item.wdf"
	    wds[12] = 742558490
	    wds[13] = 208678969
	elseif wd == "鱼竿" then
		wds[1] = "用于垂钓的工具"
		wds[2] = 10
		wds[3] = 4
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 2523388870
	    wds[13] = 1932648737
	elseif wd == "黄宝石" then
		wds[1] = "闪耀着金色光彩的宝石，代表友情、友爱与希望；传说有着护主的奇效。\n增加4*宝石等级%的雷系法术吸收率\n【镶嵌对象】饰品、鞋子"
		wds[2] = 12
		wds[3] = 4
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 2523388870
	    wds[13] = 1932648737
	elseif wd == "珍珠头带" then
		wds[1] = "珍珠结成的头带，非常好看女性饰品，可以起到防御作用"
		wds[2] = 2
		wds[3] = 1
		wds[4] = 1
	    wds[5] = 30
	    wds[6] = "女"
	    wds[11] = "item.wdf"
	    wds[12] = 3660503604
	    wds[13] = 1074719537
	elseif wd == "紧身衣" then
		wds[1] = "紧身的皮衣，非常轻便，有不错的防御力"
		wds[2] = 2
		wds[3] = 4
		wds[4] = 1
	    wds[5] = 40
	    wds[6] = "男"
	    wds[11] = "item.wdf"
	    wds[12] = 2338366605
	    wds[13] = 4031115015
	elseif wd == "曲尖枪" then
		wds[1] = "采用上等合木，枪尖九曲，是常用的兵器"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 1
	    wds[5] = 10
	    wds[7] = {"神天兵","龙太子"}
	    wds[11] = "item.wdf"
	    wds[12] = 3971589602
	    wds[13] = 632407849
	elseif wd == "劈水扇" then
		wds[1] = "挥舞之下可使狂风止，水断流"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 7
	    wds[5] = 50
	    wds[7] = {"逍遥生","龙太子"}
	    wds[11] = "item.wdf"
	    wds[12] = 1676697803
	    wds[13] = 108510315
	elseif wd == "狼牙刀" then
		wds[1] = "精钢打造，刀背密布狼牙锯齿"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 12
	    wds[5] = 60
	    wds[7] = {"剑侠客","巨魔王"}
	    wds[11] = "item.wdf"
	    wds[12] = 2655796221
	    wds[13] = 295875160
	elseif wd == "追星踏月" then
		wds[1] = "非由于鞋上有云月图案而得名，有不错的防御力"
		wds[2] = 2
		wds[3] = 6
		wds[4] = 1
	    wds[5] = 60
	    wds[11] = "item.wdf"
	    wds[12] = 1891477910
	    wds[13] = 4017464926
	elseif wd == "黄金剑" then
		wds[1] = "真金铸脊，精钢淬锋，其光灿烂夺人眼，魔障远避不及；沉于渭水，可镇河魔。"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 3
	    wds[5] = 50
	    wds[7] = {"逍遥生","剑侠客","偃无师"}
	    wds[11] = "item.wdf"
	    wds[12] = 2052074173
	    wds[13] = 1174324866
	elseif wd == "松木锤" then
		wds[1] = "松木质轻，制成的锤主要作练习用"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 9
	    wds[7] = {"神天兵","虎头怪"}
	    wds[11] = "item.wdf"
	    wds[12] = 753815448
	    wds[13] = 3891646017
	elseif wd == "天蚕丝带" then
		wds[1] = "以名贵天蚕丝制成，可通生命之灵气"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 5
	    wds[5] = 40
	    wds[7] = {"舞天姬","玄彩娥","桃夭夭"}
	    wds[11] = "item.wdf"
	    wds[12] = 794010110
	    wds[13] = 140768110
	elseif wd == "金丝彩带" then
		wds[1] = "金丝与彩缎编成的丝带"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 5
	    wds[5] = 20
	    wds[7] = {"舞天姬","玄彩娥","桃夭夭"}
	    wds[11] = "item.wdf"
	    wds[12] = 3086295697
	    wds[13] = 81211738
	elseif wd == "红缨枪" then
		wds[1] = "白腊木制成的枪杆，柔韧有弹性"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 1
	    wds[7] = {"神天兵","龙太子"}
	    wds[11] = "item.wdf"
	    wds[12] = 3032516444
	    wds[13] = 661869979
	elseif wd == "琥珀腰链" then
		wds[1] = "用琥珀制的腰链，能起到较强的防御作用"
		wds[2] = 2
		wds[3] = 5
		wds[4] = 1
	    wds[5] = 50
	    wds[11] = "item.wdf"
	    wds[12] = 1085821316
	    wds[13] = 4041311819
	elseif wd == "簪子" then
		wds[1] = "女孩子们喜欢的簪子，可以起到防御作用"
		wds[2] = 2
		wds[3] = 1
		wds[4] = 1
	    wds[6] = "女"
	    wds[11] = "item.wdf"
	    wds[12] = 1004476789
	    wds[13] = 2338230752
	elseif wd == "金柳露" then
		wds[1] = "一种非常难得的仙露，据说有着令万物回归到原始状态的奇效。可以把普通怪物变成0级，并有概率使普通怪物产生变异。"
		wds[2] = 3
		wds[3] = 2
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 2911364506
	    wds[13] = 1443777343
	elseif wd == "羊角盔" then
		wds[1] = "以羊角为装饰的盔，有非常强的防御力"
		wds[2] = 2
		wds[3] = 1
		wds[4] = 1
	    wds[5] = 50
	    wds[6] = "男"
	    wds[11] = "item.wdf"
	    wds[12] = 48596533
	    wds[13] = 1115249525
	elseif wd == "火焰枪" then
		wds[1] = "以火焰状的精铁代替枪缨，焰缘锋利无比"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 1
	    wds[5] = 40
	    wds[7] = {"神天兵","龙太子"}
	    wds[11] = "item.wdf"
	    wds[12] = 382126947
	    wds[13] = 2230233436
	elseif wd == "九宫坠" then
		wds[1] = "以九宫制成的坠子，佩带在身上有较强的法力作用"
		wds[2] = 2
		wds[3] = 2
		wds[4] = 1
	    wds[5] = 40
	    wds[11] = "item.wdf"
	    wds[12] = 1591157328
	    wds[13] = 2581108802
	elseif wd == "柳叶刀" then
		wds[1] = "形如柳叶的细弯刀"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 12
	    wds[7] = {"剑侠客","巨魔王"}
	    wds[11] = "item.wdf"
	    wds[12] = 1159059801
	    wds[13] = 388221160
	elseif wd == "竹节双剑" then
		wds[1] = "精钢制成，剑身似竹节般伸长"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 4
	    wds[5] = 30
	    wds[7] = {"英女侠","飞燕女"}
	    wds[11] = "item.wdf"
	    wds[12] = 1329171010
	    wds[13] = 2218313214
	elseif wd == "龙泉剑" then
		wds[1] = "精铁铸造，又以龙泉之水淬制，上刻青龙，其利无比。"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 3
	    wds[5] = 40
	    wds[7] = {"逍遥生","剑侠客","偃无师"}
	    wds[11] = "item.wdf"
	    wds[12] = 3230696706
	    wds[13] = 3094355456
	elseif wd == "双短剑" then
		wds[1] = "青铜制的双短剑，制造简单，是练习常用的兵器"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 4
	    wds[7] = {"英女侠","飞燕女"}
	    wds[11] = "item.wdf"
	    wds[12] = 3212246691
	    wds[13] = 1334943898
	elseif wd == "布鞋" then
		wds[1] = "布缝制的鞋子，可以起到防御的作用"
		wds[2] = 2
		wds[3] = 6
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 2418869371
	    wds[13] = 2669010133
	elseif wd == "赤焰双剑" then
		wds[1] = "剑身赤红，齿如焰苗窜动，有一股刚烈之势"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 4
	    wds[5] = 60
	    wds[7] = {"英女侠","飞燕女"}
	    wds[11] = "item.wdf"
	    wds[12] = 1459131170
	    wds[13] = 1669329241
	elseif wd == "青锋剑" then
		wds[1] = "剑长三尺，用起来方便灵活，是常用的兵器"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 3
	    wds[5] = 30
	    wds[7] = {"逍遥生","剑侠客","偃无师"}
	    wds[11] = "item.wdf"
	    wds[12] = 3995192813
	    wds[13] = 1523776943
	elseif wd == "五色缎带" then
		wds[1] = "五色蚕丝织成的彩缎"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 5
	    wds[7] = {"舞天姬","玄彩娥","桃夭夭"}
	    wds[11] = "item.wdf"
	    wds[12] = 964324271
	    wds[13] = 359839285
	elseif wd == "精钢禅钺" then
		wds[1] = "精钢打造，环随舞动，铿锵入耳，震人心魄"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 2
	    wds[5] = 40
	    wds[7] = {"巨魔王","虎头怪"}
	    wds[11] = "item.wdf"
	    wds[12] = 4268709342
	    wds[13] = 1201979768
	elseif wd == "玉竹金铃" then
		wds[1] = "由玉制的竹节联结而成,节间缚着金铃,铃随鞭动,声声悦耳"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 10
	    wds[5] = 50
	    wds[7] = {"英女侠","狐美人"}
	    wds[11] = "item.wdf"
	    wds[12] = 462481146
	    wds[13] = 478344459
	elseif wd == "金刺轮" then
		wds[1] = "由多片精铁打造的极薄的锋刃组成，刃口白光闪闪"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 11
	    wds[5] = 30
	    wds[7] = {"飞燕女","舞天姬"}
	    wds[11] = "item.wdf"
	    wds[12] = 1780092674
	    wds[13] = 2925351135
	elseif wd == "游龙剑" then
		wds[1] = "剑体九曲如龙形，覆鳞片，手弹其锋刃，鸣如龙吟。"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 3
	    wds[5] = 60
	    wds[7] = {"逍遥生","剑侠客","偃无师"}
	    wds[11] = "item.wdf"
	    wds[12] = 3272689235
	    wds[13] = 2801949288
	elseif wd == "钢结鞭" then
		wds[1] = "以细钢环联结起一个个钢条，柔中带刚"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 10
	    wds[5] = 30
	    wds[7] = {"英女侠","狐美人"}
	    wds[11] = "item.wdf"
	    wds[12] = 3232417863
	    wds[13] = 2274385367
	elseif wd == "满天星" then
		wds[1] = "棒头细密的镶嵌了无数宝石，闪闪发光，似满天星辰"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 8
	    wds[5] = 60
	    wds[7] = {"玄彩娥","骨精灵"}
	    wds[11] = "item.wdf"
	    wds[12] = 3427188370
	    wds[13] = 1777161115
	elseif wd == "吴越剑" then
		wds[1] = "吴越之地产名剑，极其锐利"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 3
	    wds[5] = 20
	    wds[7] = {"逍遥生","剑侠客","偃无师"}
	    wds[11] = "item.wdf"
	    wds[12] = 2309179882
	    wds[13] = 118455348
	elseif wd == "锯齿矛" then
		wds[1] = "枪尖三陷三突，枪杆红绸缠绕，彩缨闪动令人眼花瞭乱"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 1
	    wds[5] = 20
	    wds[7] = {"神天兵","龙太子"}
	    wds[11] = "item.wdf"
	    wds[12] = 2315151120
	    wds[13] = 1069998337
	elseif wd == "布衣" then
		wds[1] = "普通的布衣，可以起到防御的作用"
		wds[2] = 2
		wds[3] = 4
		wds[4] = 1
	    wds[6] = "男"
	    wds[11] = "item.wdf"
	    wds[12] = 2686301321
	    wds[13] = 2162639125
	elseif wd == "水晶腰带" then
		wds[1] = "佩带在腰间的水晶腰带，能起到不错的防御作用"
		wds[2] = 2
		wds[3] = 5
		wds[4] = 1
	    wds[5] = 30
	    wds[11] = "item.wdf"
	    wds[12] = 588758831
	    wds[13] = 684918234
	elseif wd == "乌龙鞭" then
		wds[1] = "以鲨鱼皮制成，表皮毛糙，极其坚韧"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 10
	    wds[5] = 20
	    wds[7] = {"英女侠","狐美人"}
	    wds[11] = "item.wdf"
	    wds[12] = 3122588387
	    wds[13] = 3141830232
	elseif wd == "鳞甲" then
		wds[1] = "用铁鳞制成的铠甲，有相当的防御力"
		wds[2] = 2
		wds[3] = 4
		wds[4] = 1
	    wds[5] = 20
	    wds[6] = "男"
	    wds[11] = "item.wdf"
	    wds[12] = 391851478
	    wds[13] = 2281395560
	elseif wd == "铁齿剑" then
		wds[1] = "铁制的短剑，边缘带齿"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 3
	    wds[5] = 10
	    wds[7] = {"逍遥生","剑侠客","偃无师"}
	    wds[11] = "item.wdf"
	    wds[12] = 3620311050
	    wds[13] = 2592140397
	elseif wd == "熊胆" then
		wds[1] = "千年熊罴的胆"
		wds[2] = 1
		wds[3] = 1
		wds[4] = 2
	    wds[8] = 2
	    wds[9] = 200
	    wds[11] = "item.wdf"
	    wds[12] = 1374442124
	    wds[13] = 278044265
	    wds[14] = 1250
	elseif wd == "水晶帽" then
		wds[1] = "水晶制成的帽子，因为坚硬，有相当强的防御力"
		wds[2] = 2
		wds[3] = 1
		wds[4] = 1
	    wds[5] = 60
	    wds[6] = "男"
	    wds[11] = "item.wdf"
	    wds[12] = 606790429
	    wds[13] = 2525896057
	-- v1.3新增
	elseif wd == "金蛇信" then
	   wds[1] = "神木制杆，弯曲似蛇形，金枪透甲，腥红双叉似金蛇出信"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 1
	   wds[5] = 70
	   wds[7]  = {"龙太子","神天兵"}
	   wds[11] = "item.wdf"
	   wds[12] = 3443351294
	   wds[13] = 2134413363
	elseif wd == "丈八点钢矛" then
	   wds[1] = "通体百精纯钢，如天雷击落、蛟龙出海"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 1
	   wds[5] = 80
	   wds[7] = {"龙太子","神天兵"}
	   wds[11] = "item.wdf"
	   wds[12] = 853333771
	   wds[13] = 2376999944
	elseif wd == "暗夜" then
	   wds[1] = "通体乌黑,极细的枪尖无形中直抵咽喉,如暗夜中引魂之手"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 1
	   wds[5] = 90
	   wds[7] = {"龙太子","神天兵"}
	   wds[11] = "item.wdf"
	   wds[12] = 2297122969
	   wds[13] = 4085619601
	elseif wd == "梨花" then
	   wds[1] = "锋刃五裂似梨花绽放,粉红的枪缨银白的枪,尽显潇洒风流"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 1
	   wds[5] = 100
	   wds[7] = {"龙太子","神天兵"}
	   wds[11] = "item.wdf"
	   wds[12] = 1491619643
	   wds[13] = 3901170806
	elseif wd == "霹雳" then
	   wds[1] = "以万古溶岩之火锤炼，枪杆似古树盘结，枪尖似雷霆霹雳"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 1
	   wds[5] = 100
	   wds[7] = {"龙太子","神天兵"}
	   wds[11] = "item.wdf"
	   wds[12] = 1553552793
	   wds[13] = 1828152464
	elseif wd == "刑天之逆" then
	   wds[1] = "刑天应劫而出，劫分天兵火水土，此即为其应兵劫之武器。形长两丈，刃如月牙，锋似寒星，身雕百龙蟠纹，挥舞直欲搅碎银汉，号为枪中霸君。"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 1
	   wds[5] = 120
	   wds[7] = {"龙太子","神天兵"}
	   wds[11] = "item.wdf"
	   wds[12] = 3591831101
	   wds[13] = 3656521229
	elseif wd == "五虎断魂" then
	   wds[1] = "出如虎奔，刺如虎爪，扫如虎尾，锁如虎噬，声如虎啸；使敌魂断胆破，不战自溃，谓之“五虎断魂”，有枪中王者之气。"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 1
	   wds[5] = 130
	   wds[7] = {"龙太子","神天兵"}
	   wds[11] = "item.wdf"
	   wds[12] = 1491403685
	   wds[13] = 1403609878
	elseif wd == "飞龙在天" then
	   wds[1] = "曾为文殊菩萨降妖密宝，如今幻化为一杆金龙宝枪。此枪掷出可化为飞龙，从万丈高空俯冲而下，撕碎敌人。"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 1
	   wds[5] = 140
	   wds[7] = {"龙太子","神天兵"}
	   wds[11] = "item.wdf"
	   wds[12] = 4100462769
	   wds[13] = 3889305017
	elseif wd == "天龙破城" then
	   wds[1] = "天外陨石炼九日九夜，雷生地底、天坠神龙，乃成此戟。霸王项羽持之横行当世，睥睨天下，故名“天龙破城”。霸王既殁，佚于乌江，龙衔乃出。"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 1
	   wds[5] = 150
	   wds[7] = {"龙太子","神天兵"}
	   wds[11] = "item.wdf"
	   wds[12] = 1375567358
	   wds[13] = 1041126896
	elseif wd == "弑皇" then
	   wds[1] = "炎黄之战，杀怨之气俱归此兵。黄帝得胜，以此兵祭祀天地，誓曰:若治下三界失靖、四海不宁，则天下之人皆可持此兵取吾之首级！"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 1
	   wds[5] = 160
	   wds[7] = {"龙太子","神天兵"}
	   wds[11] = "item.wd1"
	   wds[12] = 439395128
	   wds[13] = 127581936
	elseif wd == "狂魔镰" then
	   wds[1] = "沉于万魔之地，染魔性，映魔心，挥之即魔瘴四起"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 2
	   wds[5] = 70
	   wds[7] = {"巨魔王","虎头怪"}
	   wds[11] = "item.wdf"
	   wds[12] = 2105378421
	   wds[13] = 1325914922
	elseif wd == "恶龙之齿" then
	   wds[1] = "寒钢为柄，龙齿为刃，风过龙鸣，摄破敌胆"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 2
	   wds[5] = 80
	   wds[7] = {"巨魔王","虎头怪"}
	   wds[11] = "item.wdf"
	   wds[12] = 2656260066
	   wds[13] = 2796123546
	elseif wd == "破魄" then
	   wds[1] = "集艳日与阴月之精华，挥舞如日月同晖，中者形神俱灭"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 2
	   wds[5] = 90
	   wds[7] = {"巨魔王","虎头怪"}
	   wds[11] = "item.wdf"
	   wds[12] = 3159282811
	   wds[13] = 4245622670
	elseif wd == "肃魂" then
	   wds[1] = "吸取无尽黑暗之气，肃清无规、无序、无章之魂"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 2
	   wds[5] = 100
	   wds[7] = {"巨魔王","虎头怪"}
	   wds[11] = "item.wdf"
	   wds[12] = 0x2D6D80DE
	   wds[13] = 0x1CE23AB4
	elseif wd == "无敌" then
	   wds[1] = "斧杆以千年古木之根打造，盘桓虬曲；寒铁锻造的双面巨斧发出魔气逼人的暗光"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 2
	   wds[5] = 110
	   wds[7] = {"巨魔王","虎头怪"}
	   wds[11] = "item.wdf"
	   wds[12] = 872395348
	   wds[13] = 3255150154
	elseif wd == "五丁开山" then
	   wds[1] = "古蜀有五力士奉命凿通群山，见一大蛇尾在洞外，乃曳之出，其身长数十里。惊讶间，山崩，五丁与蛇俱死，化为神斧，执之者有开山之力。"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 2
	   wds[5] = 120
	   wds[7] = {"巨魔王","虎头怪"}
	   wds[11] = "item.wdf"
	   wds[12] = 1781160921
	   wds[13] = 354227088
	elseif wd == "元神禁锢" then
	   wds[1] = "阴司轮转王司过之宝。若有鬼仙犯大恶，即以此物拟其头，吸尽元神，再无转生可能。细看刃缘，可见无数痛苦鬼脸。"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 2
	   wds[5] = 130
	   wds[7] = {"巨魔王","虎头怪"}
	   wds[11] = "item.wdf"
	   wds[12] = 1793469736
	   wds[13] = 3058265679
	elseif wd == "护法灭魔" then
	   wds[1] = "佛门护法之武器，柄为鲁班所雕吴刚伐桂之枝，斧为老君所炼炉中千年玄铁，上有佛门梵文，妖怪见之退避三舍。"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 2
	   wds[5] = 140
	   wds[7] = {"巨魔王","虎头怪"}
	   wds[11] = "item.wdf"
	   wds[12] = 3099472859
	   wds[13] = 2571183494
	elseif wd == "碧血干戚" then
	   wds[1] = "刑天与帝争神，身首异处，碧血零落，干缺戚残；后人冶于一炉乃得神兵。长戚舞处，风云雷动，碧波流转，巨盾透体而出，其鸣呜咽，如英雄泣。"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 2
	   wds[5] = 150
	   wds[7] = {"巨魔王","虎头怪"}
	   wds[11] = "item.wdf"
	   wds[12] = 3681089967
	   wds[13] = 1076008261
	elseif wd == "裂天" then
	   wds[1] = "蚩尤随身魔武之一，取大荒四极异兽骨所制，形如巨镰，镰刃淬海皇兽魂，隐然有嘶鸣之声，裂天笞地，割风断雨。"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 2
	   wds[5] = 160
	   wds[7] = {"巨魔王","虎头怪"}
	   wds[11] = "item.wd1"
	   wds[12] = 3711850827
	   wds[13] = 1944978391
	elseif wd == "北斗七星剑" then
	   wds[1] = "精炼白金之铁铸造，有北斗七星之纹饰"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 3
	   wds[5] = 70
	   wds[7] = {"逍遥生","剑侠客"}
	   wds[11] = "item.wdf"
	   wds[12] = 1102206433
	   wds[13] = 2931293335
	elseif wd == "碧玉剑" then
	   wds[1] = "以寒冰碧玉制成,剑身如竹节,刚硬无比,难得的奇珍之物"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 3
	   wds[5] = 80
	   wds[7] = {"逍遥生","剑侠客"}
	   wds[11] = "item.wdf"
	   wds[12] = 3706066988
	   wds[13] = 2167893769
	elseif wd == "鱼肠" then
	   wds[1] = "上古名剑，细短柔软，可入鱼腹"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 3
	   wds[5] = 90
	   wds[7] = {"逍遥生","剑侠客"}
	   wds[11] = "item.wdf"
	   wds[12] = 703624793
	   wds[13] = 3087768505
	elseif wd == "倚天" then
	   wds[1] = "上古名剑，雾中山神铁所制，剑光如电，切金如泥"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 3
	   wds[5] = 100
	   wds[7] = {"逍遥生","剑侠客"}
	   wds[11] = "item.wdf"
	   wds[12] = 1234219918
	   wds[13] = 1100401070
	elseif wd == "湛卢" then
	   wds[1] = "上古名剑，剑身宽大，湛然如墨，骨锻其脊，血淬其锋，成绝世名剑"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 3
	   wds[5] = 100
	   wds[7] = {"逍遥生","剑侠客"}
	   wds[11] = "item.wdf"
	   wds[12] = 1556155532
	   wds[13] = 559555740
	elseif wd == "魏武青虹" then
	   wds[1] = "通体青亮如玉，长八尺余，可于千里外取人首级，吸血如虹。曾为魏王曹操配剑，后在战乱中失传，如今又重现江湖。"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 3
	   wds[5] = 120
	   wds[7] = {"逍遥生","剑侠客"}
	   wds[11] = "item.wdf"
	   wds[12] = 1705858659
	   wds[13] = 2821638391
	elseif wd == "灵犀神剑" then
	   wds[1] = "剑长七寸，有鼻有眼，与主人心有灵犀。常藏于宝葫芦内，主人有令，则出三丈白光扣敌泥丸宫，尽斩仙魔鬼神。"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 3
	   wds[5] = 130
	   wds[7] = {"逍遥生","剑侠客"}
	   wds[11] = "item.wdf"
	   wds[12] = 2712960569
	   wds[13] = 866429909
	elseif wd == "四法青云" then
	   wds[1] = "上有符印，分别为地，火，风，水四字。挥舞时天昏地暗，火蛇狂舞，飞沙走石，龙腾海啸。"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 3
	   wds[5] = 140
	   wds[7] = {"逍遥生","剑侠客"}
	   wds[11] = "item.wdf"
	   wds[12] = 1749029011
	   wds[13] = 1989171435
	elseif wd == "霜冷九州" then
	   wds[1] = "冰晶雪魄，浑然天成；出则霜华满地，朔风回舞。其气凛冽，砭人肌骨；其意萧条，山川寂寥。乃天下至寒至洁之物，惟赤子心可驭之。"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 3
	   wds[5] = 150
	   wds[7] = {"逍遥生","剑侠客"}
	   wds[11] = "item.wdf"
	   wds[12] = 2892720118
	   wds[13] = 1286710645
	elseif wd == "擒龙" then
	   wds[1] = "上古魔神所铸神兵，可抗八部天龙。型如鱼骨，伸缩随心；刃化千万剑丝，柔如春蚕吐丝，韧如天地经纬。"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 3
	   wds[5] = 160
	   wds[7] = {"逍遥生","剑侠客"}
	   wds[11] = "item.wd1"
	   wds[12] = 1088458361
	   wds[13] = 3004473909
	elseif wd == "墨玉双剑" then
	   wds[1] = "体采寒冰墨玉所制，暗光流动"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 4
	   wds[5] = 70
	   wds[7] = {"英女侠","飞燕女"}
	   wds[11] = "item.wdf"
	   wds[12] = 3841664619
	   wds[13] = 3428424501
	elseif wd == "梅花双剑" then
	   wds[1] = "千年古木所制，剑似梅枝"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 4
	   wds[5] = 80
	   wds[7] = {"英女侠","飞燕女"}
	   wds[11] = "item.wdf"
	   wds[12] = 956549407
	   wds[13] = 353661251
	elseif wd == "阴阳" then
	   wds[1] = "赤阳之铁成阳，玄冰之玉成阴，两仪相生，气韵非凡"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 4
	   wds[5] = 90
	   wds[7] = {"英女侠","飞燕女"}
	   wds[11] = "item.wdf"
	   wds[12] = 2351851050
	   wds[13] = 2463244045
	elseif wd == "月光双环" then
	   wds[1] = "清明无暇，似映月之光"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 11
	   wds[5] = 100
	   wds[7] = {"飞燕女","舞天姬"}
	   wds[11] = "item.wdf"
	   wds[12] = 3562014914
	   wds[13] = 2953019352
	elseif wd == "灵蛇" then
	   wds[1] = "采千年寒冰碧玉制成，通体碧绿，剑出似灵蛇出洞"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 4
	   wds[5] = 100
	   wds[7] = {"英女侠","飞燕女"}
	   wds[11] = "item.wdf"
	   wds[12] = 3192742770
	   wds[13] = 1950373522
	elseif wd == "金龙双剪" then
	   wds[1] = "传说乃是一对金龙所化，头并头如剑，尾交尾如股。从半空中呼啸而下，一绞之力无人能挡。"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 4
	   wds[5] = 120
	   wds[7] = {"英女侠","飞燕女"}
	   wds[11] = "item.wdf"
	   wds[12] = 2674540671
	   wds[13] = 2242603958
	elseif wd == "连理双树" then
	   wds[1] = "一对痴情男女坟前精魂所化双树，攀枝连理，象征在世虽不能合枕，来世愿永无分离。以此木为剑，因至情贯其中，也可成绕指柔，也可以断金玉。"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 4
	   wds[5] = 130
	   wds[7] = {"英女侠","飞燕女"}
	   wds[11] = "item.wdf"
	   wds[12] = 835871520
	   wds[13] = 1841177480
	elseif wd == "祖龙对剑" then
	   wds[1] = "三国时蜀帝刘备所用双剑。据说一为白龙所化，一为赤龙所化。白龙乃是秦皇，赤龙乃是汉祖。执之者当有九五之尊。"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 4
	   wds[5] = 140
	   wds[7] = {"英女侠","飞燕女"}
	   wds[11] = "item.wdf"
	   wds[12] = 4254611708
	   wds[13] = 3430248664
	elseif wd == "紫电青霜" then
	   wds[1] = "鸿蒙灵气所钟，诸天精魄所禳。异器天生，一派自然。紫电稚弱，性如婴孩；青霜老沉，俨如兄长。翛忽隐现，捷如流星，啾啾呢喃，紫燕青虬。"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 4
	   wds[5] = 150
	   wds[7] = {"英女侠","飞燕女"}
	   wds[11] = "item.wdf"
	   wds[12] = 1921395100
	   wds[13] = 3349222718
	elseif wd == "浮犀" then
	   wds[1] = "九天玄女以夔牛之角所制双剑，锋锐无双，轻如无物，曾助黄帝擒杀蚩尤。其上书天书密咒，丹血为文，翠莹如碧。"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 4
	   wds[5] = 160
	   wds[7] = {"英女侠","飞燕女"}
	   wds[11] = "item.wd1"
	   wds[12] = 3650328746
	   wds[13] = 2262501629
	elseif wd == "缚神绫" then
	   wds[1] = "丝带可紧可松，传言可缚神灵"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 5
	   wds[5] = 70
	   wds[7] = {"舞天姬","玄彩娥"}
	   wds[11] = "item.wdf"
	   wds[12] = 2774766030
	   wds[13] = 316900368
	elseif wd == "九天仙绫" then
	   wds[1] = "存于九天，吸日月玄灵"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 5
	   wds[5] = 80
	   wds[7] = {"舞天姬","玄彩娥"}
	   wds[11] = "item.wdf"
	   wds[12] = 812342002
	   wds[13] = 262652275
	elseif wd == "彩虹" then
	   wds[1] = "以七彩天蚕丝制成，似天边彩虹"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 5
	   wds[5] = 90
	   wds[7] = {"舞天姬","玄彩娥"}
	   wds[11] = "item.wdf"
	   wds[12] = 1130709640
	   wds[13] = 3920434794
	elseif wd == "流云" then
	   wds[1] = "流光溢彩，似天边云彩幻生幻灭"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 5
	   wds[5] = 100
	   wds[7] = {"舞天姬","玄彩娥"}
	   wds[11] = "item.wdf"
	   wds[12] = 1567038678
	   wds[13] = 2712300537
	elseif wd == "碧波" then
	   wds[1] = "聚海之灵气，碧波起，天地清"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 5
	   wds[5] = 100
	   wds[7] = {"舞天姬","玄彩娥"}
	   wds[11] = "item.wdf"
	   wds[12] = 3222386953
	   wds[13] = 2391803383
	elseif wd == "秋水落霞" then
	   wds[1] = "“落霞与孤鹜齐飞，秋水共长天一色。”此带乃天女掬长空之色，染落霞之艳织成。展开绚烂无比，使人俗念顿消，心无点尘。"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 5
	   wds[5] = 120
	   wds[7] = {"舞天姬","玄彩娥"}
	   wds[11] = "item.wdf"
	   wds[12] = 604608093
	   wds[13] = 1182432751
	elseif wd == "晃金仙绳" then
	   wds[1] = "“此物可随主人意捆住神仙魔怪，令其不能再施展变化之术。且此绳坚韧异常，火烧刀砍不断。"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 5
	   wds[5] = 130
	   wds[7] = {"舞天姬","玄彩娥"}
	   wds[11] = "item.wdf"
	   wds[12] = 730252838
	   wds[13] = 2065742633
	elseif wd == "此最相思" then
	   wds[1] = "“道是无情却有情，从来最苦是相思。”此物乃太虚幻境警幻仙子敕令还情债之物，一旦缠住，至死方休；虽有金石心，也顿为绕指柔，神仙难逃。"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 5
	   wds[5] = 140
	   wds[7] = {"舞天姬","玄彩娥"}
	   wds[11] = "item.wdf"
	   wds[12] = 1161776179
	   wds[13] = 1438567800
	elseif wd == "揽月摘星" then
	   wds[1] = "翩若惊鸿，婉若游龙，仿佛兮若轻云之蔽月，飘飖兮若流风之回雪。三垣为画布，此带为软毫，可清夜起舞，拟为漫天星宿平添花鸟虫鱼。"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 5
	   wds[5] = 150
	   wds[7] = {"舞天姬","玄彩娥"}
	   wds[11] = "item.wdf"
	   wds[12] = 3130490807
	   wds[13] = 1909699944
	elseif wd == "九霄" then
	   wds[1] = "九霄澄云所凝，诸天护佑，乾坤氤氲。形随意动，其高则冠盖乎九霄，其旷则笼罩乎八隅，祥瑞纷现，异香扑鼻。"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 5
	   wds[5] = 160
	   wds[7] = {"舞天姬","玄彩娥"}
	   wds[11] = "item.wd1"
	   wds[12] = 3468947580
	   wds[13] = 3104627686
	elseif wd == "华光刺" then
	   wds[1] = "百炼纯钢打造，华光刺目"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 6
	   wds[5] = 70
	   wds[7] = {"狐美人","骨精灵"}
	   wds[11] = "item.wdf"
	   wds[12] = 1028689229
	   wds[13] = 127658579
	elseif wd == "龙鳞刺" then
	   wds[1] = "金色似龙鳞的针刺"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 6
	   wds[5] = 80
	   wds[7] = {"狐美人","骨精灵"}
	   wds[11] = "item.wdf"
	   wds[12] = 111030939
	   wds[13] = 1177500748
	elseif wd == "撕天" then
	   wds[1] = "天如幕，白光起，破九重天"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 6
	   wds[5] = 90
	   wds[7] = {"狐美人","骨精灵"}
	   wds[11] = "item.wdf"
	   wds[12] = 3339488013
	   wds[13] = 1471615949
	elseif wd == "毒牙" then
	   wds[1] = "恐惧，只有经历无尽虚空中袭来的毒牙才知其真意"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 6
	   wds[5] = 100
	   wds[7] = {"狐美人","骨精灵"}
	   wds[11] = "item.wdf"
	   wds[12] = 3832046145
	   wds[13] = 3854364995
	elseif wd == "胭脂" then
	   wds[1] = "血红的颜色，胭脂的香气，将缤纷的灵魂凝结为黑白"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 6
	   wds[5] = 100
	   wds[7] = {"狐美人","骨精灵"}
	   wds[11] = "item.wdf"
	   wds[12] = 3460551634
	   wds[13] = 3441823945
	elseif wd == "九阴勾魂" then
	   wds[1] = "爪有九刺，阴寒冷酷，破颅勾魂，使正道名门闻之色变。为地藏王所得，将要销毁，不知何人盗出，又重现江湖。"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 6
	   wds[5] = 120
	   wds[7] = {"狐美人","骨精灵"}
	   wds[11] = "item.wdf"
	   wds[12] = 393789023
	   wds[13] = 3180402786
	elseif wd == "雪蚕之刺" then
	   wds[1] = "昆仑山雪蚕之毒毛所化，坚硬非常，穿犀牛皮如针穿薄纱，瞬间透入；刺中后使人身中热毒，如在灼热地狱之中。"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 6
	   wds[5] = 130
	   wds[7] = {"狐美人","骨精灵"}
	   wds[11] = "item.wdf"
	   wds[12] = 2033558106
	   wds[13] = 712813114
	elseif wd == "贵霜之牙" then
	   wds[1] = "昆仑山雪蚕之毒毛所化，坚硬非常，穿犀牛皮如针穿薄纱，瞬间透入；刺中后使人身中热毒，如在灼热地狱之中。"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 6
	   wds[5] = 140
	   wds[7] = {"狐美人","骨精灵"}
	   wds[11] = "item.wdf"
	   wds[12] = 3540442244
	   wds[13] = 989722994
	elseif wd == "忘川三途" then
	   wds[1] = "忘川为生死界河，水分三途，缓急不同。此爪凝三途之水，可证罪业，望之似缓，暗流甚疾。伤者不可骤脱，如坠地狱、饿鬼、畜生道。"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 6
	   wds[5] = 150
	   wds[7] = {"狐美人","骨精灵"}
	   wds[11] = "item.wdf"
	   wds[12] = 4114737939
	   wds[13] = 1943604910
	elseif wd == "离钩" then
	   wds[1] = "鸿蒙初辟，混沌之气混焉；后清浊渐离，有神识之气胶而不舍，亦聚亦离，愁丝千丈，钩绊难舍，岁月风化遂成离钩。"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 6
	   wds[5] = 160
	   wds[7] = {"狐美人","骨精灵"}
	   wds[11] = "item.wd1"
	   wds[12] = 3368946268
	   wds[13] = 3833664365
	elseif wd == "阴风扇" then
	   wds[1] = "扇骨采玄冰制，阴风习习，让人不寒而粟"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 7
	   wds[5] = 70
	   wds[7] = {"逍遥生","龙太子"}
	   wds[11] = "item.wdf"
	   wds[12] = 1174967558
	   wds[13] = 466225414
	elseif wd == "风云雷电" then
	   wds[1] = "气势勇猛的大型折扇，扇开似风云突变，扇出似雷鸣电闪"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 7
	   wds[5] = 80
	   wds[7] = {"逍遥生","龙太子"}
	   wds[11] = "item.wdf"
	   wds[12] = 3812625478
	   wds[13] = 876675307
	elseif wd == "太极" then
	   wds[1] = "包容太极于其内，博采天地之灵气"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 7
	   wds[5] = 90
	   wds[7] = {"逍遥生","龙太子"}
	   wds[11] = "item.wdf"
	   wds[12] = 795792061
	   wds[13] = 2262423432
	elseif wd == "玉龙" then
	   wds[1] = "白玉制的扇骨，优雅灵巧，似白龙出海"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 7
	   wds[5] = 100
	   wds[7] = {"逍遥生","龙太子"}
	   wds[11] = "item.wdf"
	   wds[12] = 3052815805
	   wds[13] = 896644877
	elseif wd == "秋风" then
	   wds[1] = "一纸折扇，荡平天下事，一缕秋风，吹尽凡尘心"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 7
	   wds[5] = 100
	   wds[7] = {"逍遥生","龙太子"}
	   wds[11] = "item.wdf"
	   wds[12] = 516817499
	   wds[13] = 1806626143
	elseif wd == "画龙点睛" then
	   wds[1] = "本是一把普通的折扇，只因张僧繇画神龙于上，并点其睛，挥动时则隐有风雷之声、云雨之气，展开更有神龙奔出。"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 7
	   wds[5] = 120
	   wds[7] = {"逍遥生","龙太子"}
	   wds[11] = "item.wdf"
	   wds[12] = 848845144
	   wds[13] = 1782681953
	elseif wd == "秋水人家" then
	   wds[1] = "扇面上所画《秋水人家图》出神入化，栩栩如生；展扇更可进入其中，游山玩水，身临其境。其中定有道家仙法无疑。"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 7
	   wds[5] = 130
	   wds[7] = {"逍遥生","龙太子"}
	   wds[11] = "item.wdf"
	   wds[12] = 2332586416
	   wds[13] = 1923582221
	elseif wd == "逍遥江湖" then
	   wds[1] = "持此扇行走江湖，可预先知晓福祸吉凶。据说是钦天监台正先生袁天罡书奇门妙法于其上，方使此扇有逍遥美名。"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 7
	   wds[5] = 140
	   wds[7] = {"逍遥生","龙太子"}
	   wds[11] = "item.wdf"
	   wds[12] = 1361205238
	   wds[13] = 1457973706
	elseif wd == "浩气长舒" then
	   wds[1] = "持之若登高望远，五湖四海俱在眼前。不以物喜，不以己悲，心旷神怡，宠辱偕忘。感浩然之气至大至刚，以直养而无害，充盈天地。不亦快哉！"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 7
	   wds[5] = 150
	   wds[7] = {"逍遥生","龙太子"}
	   wds[11] = "item.wdf"
	   wds[12] = 3595165574
	   wds[13] = 2725529530
	elseif wd == "星瀚" then
	   wds[1] = "三垣中坠，不知其故。展则漫天星辰失色，收则幽渺万籁无声。万顷星瀚，无始无终，无他无我，怎不使人目眩神驰？"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 7
	   wds[5] = 160
	   wds[7] = {"逍遥生","龙太子"}
	   wds[11] = "item.wd1"
	   wds[12] = 2182063168
	   wds[13] = 1649810470
	elseif wd == "水晶棒" then
	   wds[1] = "通体以水晶制成，棒头镶嵌了纯净的水晶球，灵光闪闪"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 8
	   wds[5] = 70
	   wds[7] = {"玄彩娥","骨精灵"}
	   wds[11] = "item.wdf"
	   wds[12] = 3433794516
	   wds[13] = 1032230318
	elseif wd == "日月光华" then
	   wds[1] = "棒端有日月神珠，半黑半白，收太极其内，五行其间"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 8
	   wds[5] = 80
	   wds[7] = {"玄彩娥","骨精灵"}
	   wds[11] = "item.wdf"
	   wds[12] = 1445409930
	   wds[13] = 345311421
	elseif wd == "沧海" then
	   wds[1] = "静如海之渊深博从，动似海之激荡翻腾"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 8
	   wds[5] = 90
	   wds[7] = {"玄彩娥","骨精灵"}
	   wds[11] = "item.wdf"
	   wds[12] = 3417923595
	   wds[13] = 32733626
	elseif wd == "红莲" then
	   wds[1] = "碧杆红莲，阅众生相，度众生孽"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 8
	   wds[5] = 100
	   wds[7] = {"玄彩娥","骨精灵"}
	   wds[11] = "item.wdf"
	   wds[12] = 2931792494
	   wds[13] = 2090478337
	elseif wd == "盘龙" then
	   wds[1] = "身若九曲盘龙，口吞八卦金珠"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 8
	   wds[5] = 100
	   wds[7] = {"玄彩娥","骨精灵"}
	   wds[11] = "item.wdf"
	   wds[12] = 2599922092
	   wds[13] = 1006965180
	elseif wd == "降魔玉杵" then
	   wds[1] = "乃一块绝世好玉雕刻而成，杵头刻有仙家符咒。拿在手中，轻如鸿毛，打在人身，重如泰山。"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 8
	   wds[5] = 120
	   wds[7] = {"玄彩娥","骨精灵"}
	   wds[11] = "item.wdf"
	   wds[12] = 969185484
	   wds[13] = 1480701803
	elseif wd == "青藤玉树" then
	   wds[1] = "翡翠藤蔓缠绕于碧玉树干之上，红宝石所雕的鲜花正怒放枝头；它是完美的艺术品，更是仙家妙宝、除魔利器。"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 8
	   wds[5] = 130
	   wds[7] = {"玄彩娥","骨精灵"}
	   wds[11] = "item.wdf"
	   wds[12] = 3608519305
	   wds[13] = 1933825756
	elseif wd == "墨玉骷髅" then
	   wds[1] = "魔棒上镶嵌着一个刻画精美的墨水晶骷髅，流露出神秘的死亡气息，似乎与地府有很深的渊源。"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 8
	   wds[5] = 140
	   wds[7] = {"玄彩娥","骨精灵"}
	   wds[11] = "item.wdf"
	   wds[12] = 758533892
	   wds[13] = 1365535468
	elseif wd == "丝萝乔木" then
	   wds[1] = "上古仙侣所化，丝萝出尘，花分五色；中为桐木，曾栖彩凤。千秋万载，其情不泯。仙气缠绕，百邪不侵：“醉向丝萝惊自醒，与君清耳听松湍。”"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 8
	   wds[5] = 150
	   wds[7] = {"玄彩娥","骨精灵"}
	   wds[11] = "item.wdf"
	   wds[12] = 832692260
	   wds[13] = 18189260
	elseif wd == "醍醐" then
	   wds[1] = "天地未分时，混沌有异树，亿万年长成，亿万年花开，亿万年结果，果落化为醍醐。持此杖者洞悉天地，与万物同息。"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 8
	   wds[5] = 160
	   wds[7] = {"玄彩娥","骨精灵"}
	   wds[11] = "item.wd1"
	   wds[12] = 493750456
	   wds[13] = 3429406352
	elseif wd == "巨灵神锤" then
	   wds[1] = "巨灵神所用神锤，锤似流星，非凡力可举，可挡十万天兵"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 9
	   wds[5] = 70
	   wds[7] = {"神天兵","虎头怪"}
	   wds[11] = "item.wdf"
	   wds[12] = 4112468633
	   wds[13] = 977830532
	elseif wd == "天崩地裂" then
	   wds[1] = "静似天柱巍巍，动则天崩地裂"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 9
	   wds[5] = 80
	   wds[7] = {"神天兵","虎头怪"}
	   wds[11] = "item.wdf"
	   wds[12] = 708738253
	   wds[13] = 1573610528
	elseif wd == "八卦" then
	   wds[1] = "八卦其间，太极天成，天地造化，混沌无常"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 9
	   wds[5] = 90
	   wds[7] = {"神天兵","虎头怪"}
	   wds[11] = "item.wdf"
	   wds[12] = 4244312578
	   wds[13] = 928644092
	elseif wd == "鬼牙" then
	   wds[1] = "以万炼钢，合猛鬼牙，噬三界"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 9
	   wds[5] = 100
	   wds[7] = {"神天兵","虎头怪"}
	   wds[11] = "item.wdf"
	   wds[12] = 737823355
	   wds[13] = 25218036
	elseif wd == "雷神" then
	   wds[1] = "一击天地轰鸣，再击电光四起，三击万物俱灰"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 9
	   wds[5] = 100
	   wds[7] = {"神天兵","虎头怪"}
	   wds[11] = "item.wdf"
	   wds[12] = 3048546465
	   wds[13] = 4287755866
	elseif wd == "混元金锤" then
	   wds[1] = "锤按六道之纹，柄接阴阳之气，持之者自有五行造化，诸天看护。"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 9
	   wds[5] = 120
	   wds[7] = {"神天兵","虎头怪"}
	   wds[11] = "item.wdf"
	   wds[12] = 1164647107
	   wds[13] = 2379160869
	elseif wd == "九瓣莲花" then
	   wds[1] = "此锤乃仙池中的一朵婷婷玉莲，花开九瓣，蕊露金蓬。不知被谁采来，炼为兵器。虽已过五百年，依然盛开如新发。"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 9
	   wds[5] = 130
	   wds[7] = {"神天兵","虎头怪"}
	   wds[11] = "item.wdf"
	   wds[12] = 2151061457
	   wds[13] = 432377528
	elseif wd == "鬼王蚀日" then
	   wds[1] = "斩魔王之头为锤，隐隐发出邪气，使日月无光。执此物则将与魔神契约，可拥魔王之力。"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 9
	   wds[5] = 140
	   wds[7] = {"神天兵","虎头怪"}
	   wds[11] = "item.wdf"
	   wds[12] = 1075077021
	   wds[13] = 3952974465
	elseif wd == "狂澜碎岳" then
	   wds[1] = "水神共工至宝，内收九曲黄河，出则天地齐喑，奔涛如雷。共工怒触不周山，天柱折地维绝，水潦尘埃俱归东南，双锤亦泯然其中，为黄帝所得。"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 9
	   wds[5] = 150
	   wds[7] = {"神天兵","虎头怪"}
	   wds[11] = "item.wdf"
	   wds[12] = 3300988828
	   wds[13] = 3989323201
	elseif wd == "碎寂" then
	   wds[1] = "盘古龙齿所化，固若金汤。嘘为风雨，吹为雷电，舞之铿锵如鸣金铁，乃天下至阳至刚之物，邪魔宵小望之丧魂。"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 9
	   wds[5] = 160
	   wds[7] = {"神天兵","虎头怪"}
	   wds[11] = "item.wd1"
	   wds[12] = 0xEA5B0F34
	   wds[13] = 0xE977DF0B
	elseif wd == "雷鸣嗜血鞭" then
	   wds[1] = "管节空洞，银钩闪闪，挥动时隐隐有风雷之音"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 10
	   wds[5] = 70
	   wds[7] = {"英女侠","狐美人"}
	   wds[11] = "item.wdf"
	   wds[12] = 1854489623
	   wds[13] = 3234780066
	elseif wd == "混元金钩" then
	   wds[1] = "混元钢索之上缚有金钩，追命勾魂"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 10
	   wds[5] = 80
	   wds[7] = {"英女侠","狐美人"}
	   wds[11] = "item.wdf"
	   wds[12] = 0x6182C9F2
	   wds[13] = 0x8AB6DF4B
	elseif wd == "龙筋" then
	   wds[1] = "以恶龙之筋制成，挥舞若龙腾"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 10
	   wds[5] = 90
	   wds[7] = {"英女侠","狐美人"}
	   wds[11] = "item.wdf"
	   wds[12] = 1054575251
	   wds[13] = 2303382990
	elseif wd == "百花" then
	   wds[1] = "龙藤塑其筋，百花其上，集仙灵之气，香飘四海"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 10
	   wds[5] = 100
	   wds[7] = {"英女侠","狐美人"}
	   wds[11] = "item.wdf"
	   wds[12] = 3472315232
	   wds[13] = 1331779470
	elseif wd == "吹雪" then
	   wds[1] = "鞭上石晶经千年生长，成雪花密布，映日月之光"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 10
	   wds[5] = 100
	   wds[7] = {"英女侠","狐美人"}
	   wds[11] = "item.wdf"
	   wds[12] = 3293208513
	   wds[13] = 1657462890
	elseif wd == "游龙惊鸿" then
	   wds[1] = "此鞭舞之矫如游龙，翩若惊鸿，宛如活物。据传是因仙家点化，方有此功效。"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 10
	   wds[5] = 120
	   wds[7] = {"英女侠","狐美人"}
	   wds[11] = "item.wdf"
	   wds[12] = 722618703
	   wds[13] = 3699553560
	elseif wd == "仙人指路" then
	   wds[1] = "此鞭之奇，在于打斗时会自寻敌之弱点，或攻或守，或点或缠，如仙人指路，变化万端；又如灵蛇狂舞，眼花缭乱。"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 10
	   wds[5] = 130
	   wds[7] = {"英女侠","狐美人"}
	   wds[11] = "item.wdf"
	   wds[12] = 2337416369
	   wds[13] = 3100047545
	elseif wd == "血之刺藤" then
	   wds[1] = "此鞭遍体生有倒刺，散发黑色邪气。据传打斗之时会如巨蟒缠住敌人，倒刺嵌入敌人体内，吸食其血肉。"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 10
	   wds[5] = 140
	   wds[7] = {"英女侠","狐美人"}
	   wds[11] = "item.wdf"
	   wds[12] = 3451408733
	   wds[13] = 3574831487
	elseif wd == "牧云清歌" then
	   wds[1] = "此鞭具大神通，持之则神虑清明，可驭使万物。苍穹为牧野，云霞为羔犊，驱鞭行九天，驭风乘云，竞雷逐电。"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 10
	   wds[5] = 150
	   wds[7] = {"英女侠","狐美人"}
	   wds[11] = "item.wdf"
	   wds[12] = 422685665
	   wds[13] = 4192744388
	elseif wd == "霜陨" then
	   wds[1] = "昆仑之巅有涧曰冰溪，灿然如银，凝霜聚雪。溪流九曲，矫然若蛟，后凝为软玉长鞭，姑射仙子倚为护身仙器。"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 10
	   wds[5] = 160
	   wds[7] = {"英女侠","狐美人"}
	   wds[11] = "item.wd1"
	   wds[12] = 3829142397
	   wds[13] = 522032539
	elseif wd == "子母双月" then
	   wds[1] = "锋刃似弯月一般交错，可四面制敌"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 11
	   wds[5] = 70
	   wds[7] = {"飞燕女","舞天姬"}
	   wds[11] = "item.wdf"
	   wds[12] = 3736409706
	   wds[13] = 1612643041
	elseif wd == "斜月狼牙" then
	   wds[1] = "青玉制成，锋似狼牙"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 11
	   wds[5] = 80
	   wds[7] = {"飞燕女","舞天姬"}
	   wds[11] = "item.wdf"
	   wds[12] = 4116561830
	   wds[13] = 2276604919
	elseif wd == "如意" then
	   wds[1] = "白玉制成，光滑清丽，如意随心"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 11
	   wds[5] = 90
	   wds[7] = {"飞燕女","舞天姬"}
	   wds[11] = "item.wdf"
	   wds[12] = 2711948052
	   wds[13] = 952271091
	elseif wd == "乾坤" then
	   wds[1] = "集天地乾坤之灵，可制万物"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 11
	   wds[5] = 100
	   wds[7] = {"飞燕女","舞天姬"}
	   wds[11] = "item.wdf"
	   wds[12] = 2571022629
	   wds[13] = 338904132
	elseif wd == "月光" then
	   wds[1] = "清明无暇，似映月之光"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 11
	   wds[5] = 100
	   wds[7] = {"飞燕女","舞天姬"}
	   wds[11] = "item.wdf"
	   wds[12] = 3562014914
	   wds[13] = 2953019352
	elseif wd == "别情离恨" then
	   wds[1] = "乐莫乐兮新相知，悲莫悲兮生别离；此情黯然销魂，永恨伤心。有人制同心永结环象征永不分离，但别离之后把玩，却更加伤感。"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 11
	   wds[5] = 120
	   wds[7] = {"飞燕女","舞天姬"}
	   wds[11] = "item.wdf"
	   wds[12] = 2437493189
	   wds[13] = 3959090370
	elseif wd == "金玉双环" then
	   wds[1] = "乐莫乐兮新相知，悲莫悲兮生别离；此情黯然销魂，永恨伤心。有人制同心永结环象征永不分离，但别离之后把玩，却更加伤感。"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 11
	   wds[5] = 130
	   wds[7] = {"飞燕女","舞天姬"}
	   wds[11] = "item.wdf"
	   wds[12] = 2908362125
	   wds[13] = 1659862730
	elseif wd == "九天金线" then
	   wds[1] = "此物套在手上，金光闪闪。圈飘金线，声音清越，守中有攻，刚柔并济，使敌人不知所措。"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 11
	   wds[5] = 140
	   wds[7] = {"飞燕女","舞天姬"}
	   wds[11] = "item.wdf"
	   wds[12] = 1468552095
	   wds[13] = 2047583638
	elseif wd == "无关风月" then
	   wds[1] = "精玉双环一名“离风”，一名“遮月”，舞之月影憧憧，别愁离绪，俱上心头。诗云：人生自是有情痴，此恨不关风与月。"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 11
	   wds[5] = 150
	   wds[7] = {"飞燕女","舞天姬"}
	   wds[11] = "item.wdf"
	   wds[12] = 3036111619
	   wds[13] = 3104854202
	elseif wd == "朝夕" then
	   wds[1] = "此双环伴日月而生，沐浴光华，吞吐烟云，三清将其置于天穹之上，日夜吸纳诸天亿兆流光，朝夕霞雾源出于此。"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 11
	   wds[5] = 150
	   wds[7] = {"飞燕女","舞天姬"}
	   wds[11] = "item.wd1"
	   wds[12] = 1379061378
	   wds[13] = 1662428245
	elseif wd == "龙鳞宝刀" then
	   wds[1] = "百练寒钢打造，以龙鳞装饰，身份的象征"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 12
	   wds[5] = 70
	   wds[7] = {"剑侠客","巨魔王"}
	   wds[11] = "item.wdf"
	   wds[12] = 668589754
	   wds[13] = 2944368377
	elseif wd == "黑炎魔刀" then
	   wds[1] = "刀身透出森森鬼气，有着摄人心魄的魔力"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 12
	   wds[5] = 80
	   wds[7] = {"剑侠客","巨魔王"}
	   wds[11] = "item.wdf"
	   wds[12] = 162972978
	   wds[13] = 279098730
	elseif wd == "冷月" then
	   wds[1] = "夜清冷，月露眉尖，笑引幽冥路"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 12
	   wds[5] = 90
	   wds[7] = {"剑侠客","巨魔王"}
	   wds[11] = "item.wdf"
	   wds[12] = 603925505
	   wds[13] = 407135953
	elseif wd == "屠龙" then
	   wds[1] = "上古神兵，宝刀屠龙"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 12
	   wds[5] = 100
	   wds[7] = {"剑侠客","巨魔王"}
	   wds[11] = "item.wdf"
	   wds[12] = 1961749850
	   wds[13] = 155455945
	elseif wd == "血刃" then
	   wds[1] = "血红的刃，血红的光，以血洗天地"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 12
	   wds[5] = 100
	   wds[7] = {"剑侠客","巨魔王"}
	   wds[11] = "item.wdf"
	   wds[12] = 1138002761
	   wds[13] = 3952677662
	elseif wd == "偃月青龙" then
	   wds[1] = "关公之配刀，青龙化刀柄，刀身如半月，百万军中取上将首级如探囊取物。关公死，刀柄不知去向，唯余此刀身。"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 12
	   wds[5] = 120
	   wds[7] = {"剑侠客","巨魔王"}
	   wds[11] = "item.wdf"
	   wds[12] = 241494943
	   wds[13] = 2525360226
	elseif wd == "晓风残月" then
	   wds[1] = "迅如晓风，刃如残月。此非中土大唐之物，乃海外大食国宝刀，其上蛩伏可实现愿望之神明。但如何召唤已不可知。"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 12
	   wds[5] = 130
	   wds[7] = {"剑侠客","巨魔王"}
	   wds[11] = "item.wdf"
	   wds[12] = 293054687
	   wds[13] = 3069402462
	elseif wd == "斩妖泣血" then
	   wds[1] = "大唐名匠半生心血所成的宝刀，因其妻子被妖魔所害，故将满腔愤恨倾注于刀中。谁能为他复仇，便以此刀相赠。"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 12
	   wds[5] = 140
	   wds[7] = {"剑侠客","巨魔王"}
	   wds[11] = "item.wdf"
	   wds[12] = 2680057538
	   wds[13] = 1425981787
	elseif wd == "业火三灾" then
	   wds[1] = "周身暗红如浴血池，刃裂三线引为三灾，中有赤瞳勾人心火。敌心神既失，十方俱灭，惟余红莲：“汝一念起，业火炽然，非人燔汝，乃汝自燔。”"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 12
	   wds[5] = 150
	   wds[7] = {"剑侠客","巨魔王"}
	   wds[11] = "item.wdf"
	   wds[12] = 2013357951
	   wds[13] = 2366906872
	elseif wd == "鸣鸿" then
	   wds[1] = "刀长三尺，与轩辕剑同炉而成。黄帝见其刀意过盛，恐反噬刀主，欲以轩辕剑毁之；此刀乃化玄红云鹊，穿霞而逝。"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 12
	   wds[5] = 160
	   wds[7] = {"剑侠客","巨魔王"}
	   wds[11] = "item.wd1"
	   wds[12] = 3497244314
	   wds[13] = 3024786057
	elseif wd == "引魂杖" then
	   wds[1] = "点点萤光，引路幽魂，指引迷途幽魂的法杖，有着强大的法力"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 13
	   wds[5] = 70
	   wds[7] = {"巫蛮儿","羽灵神"}
	   wds[11] = "common/item.wdf"
	   wds[12] = 2962804578
	   wds[13] = 1687273756
	elseif wd == "碧玺杖" then
	   wds[1] = "碧霞莹莹，玉暖生烟，浑然天成的碧玉法杖，神妙异常"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 13
	   wds[5] = 80
	   wds[7] = {"巫蛮儿","羽灵神"}
	   wds[11] = "common/item.wdf"
	   wds[12] = 264053858
	   wds[13] = 203186473
	elseif wd == "业焰" then
	   wds[1] = "取地狱燧石锻冶，燃万年业火之杖。“以业火乾枯，酬其宿债”，业焰之舞，焚尽世间罪孽。"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 13
	   wds[5] = 90
	   wds[7] = {"巫蛮儿","羽灵神"}
	   wds[11] = "common/item.wdf"
	   wds[12] = 1824574630
	   wds[13] = 2003240450
	elseif wd == "玉辉" then
	   wds[1] = "琉璃玉辉，星降人间，熠熠生辉的琉璃法杖，挥舞时如繁星落尽，蕴含无限灵力。"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 13
	   wds[5] = 100
	   wds[7] = {"巫蛮儿","羽灵神"}
	   wds[11] = "common/item.wdf"
	   wds[12] = 3341482479
	   wds[13] = 3389535995
	elseif wd == "鹿鸣" then
	   wds[1] = "牡鹿凄鸣，风云雷动，天下至寒之墨玉炼成鹿角之形，夹风雷之势，让敌人闻之色变。"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 13
	   wds[5] = 100
	   wds[7] = {"巫蛮儿","羽灵神"}
	   wds[11] = "common/item.wdf"
	   wds[12] = 4184601743
	   wds[13] = 1009912375
	elseif wd == "庄周梦蝶" then
	   wds[1] = "“昔者庄周梦为蝴蝶，栩栩然蝴蝶也”梦中蝶舞花落，焉知人世几何？杖取冥府幽灯为首，引路之蝶翩飞，最善蛊惑人心。"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 13
	   wds[5] = 120
	   wds[7] = {"巫蛮儿","羽灵神"}
	   wds[11] = "common/item.wdf"
	   wds[12] = 4210455798
	   wds[13] = 3003334713
	elseif wd == "凤翼流珠" then
	   wds[1] = "有凤来仪，祥瑞兆也。炎帝融千金，取明珠，塑凤凰振翅衔珠之形，炼得一杖，光华灿烂，百鸟朝凤，深蕴妙法。"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 13
	   wds[5] = 130
	   wds[7] = {"巫蛮儿","羽灵神"}
	   wds[11] = "common/item.wdf"
	   wds[12] = 3777157831
	   wds[13] = 1526765929
	elseif wd == "雪蟒霜寒" then
	   wds[1] = "刘邦斩白蛇，取其精魄封于至阴至寒之地，吸寒冰精华千年，蛇魄化杖，成“雪蟒霜寒”，阴鸷寒毒，唯奇人异士方可驾驭自如。"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 13
	   wds[5] = 140
	   wds[7] = {"巫蛮儿","羽灵神"}
	   wds[11] = "common/item.wdf"
	   wds[12] = 1585143397
	   wds[13] = 3652569447
	elseif wd == "碧海潮生" then
	   wds[1] = "应龙伏旱魃，寻深海冰晶，取潮涌奔腾之势，融白浪连山之气，吐龙息为灵珠，成龙神逐珠之形，终获一杖，名曰“碧海潮生”。"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 13
	   wds[5] = 150
	   wds[7] = {"巫蛮儿","羽灵神"}
	   wds[11] = "common/item.wdf"
	   wds[12] = 859134972
	   wds[13] = 2904010505
	elseif wd == "弦月" then
	   wds[1] = "盘古开天辟地之时，一外化陨铁落于不周山之巅，沐月华，吸星魄，尽得天地清明之气，化一杖，清辉万丈，疏影琉璃，曰之“弦月”。"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 13
	   wds[5] = 160
	   wds[7] = {"巫蛮儿","羽灵神"}
	   wds[11] = "common/item.wdf"
	   wds[12] = 1620809403
	   wds[13] = 481332718
	elseif wd == "沧海明珠" then
	   wds[1] = "东海之浪，西海之湍，南海之潮，北海之涌，凝为玲珑明珠，置于耳畔，可闻四海浪涛奔涌。"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 15
	   wds[5] = 70
	   wds[7] = {"巫蛮儿","杀破狼"}
	   wds[11] = "common/item.wdf"
	   wds[12] = 3775040856
	   wds[13] = 1581614754
	elseif wd == "无量玉璧" then
	   wds[1] = "奇珍璞玉，历神工鬼斧琢磨百年，方成无瑕白璧，明澈如镜，可见本心。心无旁骛，不惹尘埃。"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 15
	   wds[5] = 80
	   wds[7] = {"巫蛮儿","杀破狼"}
	   wds[11] = "common/item.wdf"
	   wds[12] = 219820456
	   wds[13] = 1327897055
	elseif wd == "离火" then
	   wds[1] = "北地铁骨，质坚且寒，南疆离火，熔之成珠。铁骨灼灼，烈火熊熊，炽焰炎炎，刚猛之至。"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 15
	   wds[5] = 90
	   wds[7] = {"巫蛮儿","杀破狼"}
	   wds[11] = "common/item.wdf"
	   wds[12] = 3130687183
	   wds[13] = 295884750
	elseif wd == "飞星" then
	   wds[1] = "河汉渺渺，星华灿灿。流星坠地，而光华不灭，繁光云影，剔透灵动。"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 15
	   wds[5] = 100
	   wds[7] = {"巫蛮儿","杀破狼"}
	   wds[11] = "common/item.wdf"
	   wds[12] = 2857125772
	   wds[13] = 3385292234
	elseif wd == "月华" then
	   wds[1] = "芙蓉出水，风荷凌波。采月宫新荷之叶，凝流金月色之光，成琳琅花灯一盏，暖光融融，晴光皎皎。"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 15
	   wds[5] = 100
	   wds[7] = {"巫蛮儿","杀破狼"}
	   wds[11] = "common/item.wdf"
	   wds[12] = 3767404245
	   wds[13] = 776402569
	elseif wd == "回风舞雪" then
	   wds[1] = "洛水汤汤，钟灵毓秀。河洛之女质比霜雪，态似惊鸿；一日童心乍起，采河滨之蝶、沉水之冰，吟清歌而成宝珠，蝶舞之时回风舞雪，琴音泠泠。"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 15
	   wds[5] = 120
	   wds[7] = {"巫蛮儿","杀破狼"}
	   wds[11] = "common/item.wdf"
	   wds[12] = 3065427050
	   wds[13] = 269710225
	elseif wd == "紫金葫芦" then
	   wds[1] = "混沌初分，天开地辟，昆仑山脚下生仙藤一缕，上结葫芦七枚，名曰紫金葫芦，千年方得瓜熟蒂落，有吞吐万象之力。"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 15
	   wds[5] = 130
	   wds[7] = {"巫蛮儿","杀破狼"}
	   wds[11] = "common/item.wdf"
	   wds[12] = 1536710915
	   wds[13] = 2788268887
	elseif wd == "裂云啸日" then
	   wds[1] = "烛龙之鳞，采璇玑之华，待千年。浴羲和之光，再千年。经九煅九灼，方熔为赤金之珠，其光煌煌，可照千里，其势熊熊，耀日贯虹。"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 15
	   wds[5] = 140
	   wds[7] = {"巫蛮儿","杀破狼"}
	   wds[11] = "common/item.wdf"
	   wds[12] = 3954481057
	   wds[13] = 3032716270
	elseif wd == "云雷万里" then
	   wds[1] = "北溟之鲲，化而为鹏，凌风而起，翼若垂天之云，啸如雷霆之怒，水击三千，风驰如电。沉眠时化作神异之珠，聚风雷云电之力，有呼山啸海之能。"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 15
	   wds[5] = 150
	   wds[7] = {"巫蛮儿","杀破狼"}
	   wds[11] = "common/item.wdf"
	   wds[12] = 3251343750
	   wds[13] = 3115679889
	elseif wd == "赤明" then
	   wds[1] = "盘古开天辟地后，齿骨为金石，精髓为珠玉，灵窍一点聚天地浩气，化为宝珠“赤明”，虹霓为衣，金螭为息，吞云吐明，异光万里。"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 15
	   wds[5] = 160
	   wds[7] = {"巫蛮儿","杀破狼"}
	   wds[11] = "common/item.wdf"
	   wds[12] = 1303853669
	   wds[13] = 4145962850
	elseif wd == "游鱼戏珠" then
	   wds[1] = "弓箭之形仿若双鱼，共戏剔透宝珠。出箭之势，亦如游鱼嬉水，婉转灵动，让对手无从躲避。"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 14
	   wds[5] = 70
	   wds[7] = {"羽灵神","杀破狼"}
	   wds[11] = "common/item.wdf"
	   wds[12] = 1424340640
	   wds[13] = 4113025121
	elseif wd == "灵犀望月" then
	   wds[1] = "天降奇石，锻为兵器，自生光华。美玉做灵犀之形，嵌于弓腰，祥瑞兆也。"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 14
	   wds[5] = 80
	   wds[7] = {"羽灵神","杀破狼"}
	   wds[11] = "common/item.wdf"
	   wds[12] = 2652946197
	   wds[13] = 3194521736
	elseif wd == "非攻" then
	   wds[1] = "墨家机关之术神秘莫测，相传有采玉人偶得其残片，上记“非攻”弓弩，机括精妙，威力非常。遂寻美玉，勤琢磨，终得天下难见之绝品。"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 14
	   wds[5] = 90
	   wds[7] = {"羽灵神","杀破狼"}
	   wds[11] = "common/item.wdf"
	   wds[12] = 3157963095
	   wds[13] = 1966338355
	elseif wd == "幽篁" then
	   wds[1] = "潮音洞外梵音悠悠，云岚缭绕，幽篁万杆，满目翠色。林中紫竹既坚且韧，扣之琅然有金石声，金童子置之于老君炉中，锻成神弓，名曰“幽篁”。"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 14
	   wds[5] = 100
	   wds[7] = {"羽灵神","杀破狼"}
	   wds[11] = "common/item.wdf"
	   wds[12] = 3823221168
	   wds[13] = 3873525610
	elseif wd == "百鬼" then
	   wds[1] = "春秋时古墓中，青铜之樽，凝百鬼之魂，锻九千日，乃成。"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 14
	   wds[5] = 100
	   wds[7] = {"羽灵神","杀破狼"}
	   wds[11] = "common/item.wdf"
	   wds[12] = 1920235031
	   wds[13] = 878233843
	elseif wd == "冥火薄天" then
	   wds[1] = "幽冥之地，麒麟衔火而生，踏火而行，所经处金石皆熔，游九州聚天地精华，得遇有缘之士，乃化作良弓一柄，凌风驭火，箭矢如焰，有燎日之能。"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 14
	   wds[5] = 120
	   wds[7] = {"羽灵神","杀破狼"}
	   wds[11] = "common/item.wdf"
	   wds[12] = 3592078104
	   wds[13] = 944851297
	elseif wd == "龙鸣寒水" then
	   wds[1] = "云龙居寒水，可呼云雨，开江海，鸣动天地，腾云起风。此弩熔云龙之鳞，凝万年寒水之底，聚玄冰苦寒之气，千年方成，出矢如冰，霜寒雪冷。"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 14
	   wds[5] = 130
	   wds[7] = {"羽灵神","杀破狼"}
	   wds[11] = "common/item.wdf"
	   wds[12] = 4125263988
	   wds[13] = 566006425
	elseif wd == "太极流光" then
	   wds[1] = "天地之道，以阴阳二气造化万物，日月、风雨，刚柔、动静莫不合此道也。此番水火相逢，相生相克，有大神通。"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 14
	   wds[5] = 140
	   wds[7] = {"羽灵神","杀破狼"}
	   wds[11] = "common/item.wdf"
	   wds[12] = 1065909571
	   wds[13] = 453912996
	elseif wd == "九霄风雷" then
	   wds[1] = "灵凰栖九天，高飞穿云，清音裂石。妙手仙匠采灵凰之魄，河汉之星，云雷之怒，以九霄长风锻造千载而成此弓，箭簇既出，风雷声动，江海怒号。"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 14
	   wds[5] = 150
	   wds[7] = {"羽灵神","杀破狼"}
	   wds[11] = "common/item.wdf"
	   wds[12] = 1632354244
	   wds[13] = 4026131118
	elseif wd == "若木" then
	   wds[1] = "金乌栖若木，振翅日升，归巢日落，十鸟齐飞，则十日齐出，民不聊生。后羿采若木为弓，连射九日，凝金乌之魂于弓上，羲和光华，日夜不息。"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 14
	   wds[5] = 160
	   wds[7] = {"羽灵神","杀破狼"}
	   wds[11] = "common/item.wdf"
	   wds[12] = 2281686232
	   wds[13] = 1581270869
	elseif wd == "月光双剑" then
	   wds[1] = "皎洁如白玉，清明如月光  "
	   wds[2] = 2
       wds[3] = 3
	   wds[4] = 4
	   wds[5] = 100
	   wds[7] = {"英女侠","飞燕女"}
	   wds[11] = "item.wdf"
	   wds[12] = 38511533
	   wds[13] = 2184315991
	-- 新人物
	elseif wd == "桃印铁刃" then
		wds[1] = "常见铁剑，以桃木为剑柄。"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 16
	    wds[5] = 10
	    wds[7] = {"偃无师"}
	    wds[11] = "common/item.wdf"
	    wds[12] = 3651866845
	    wds[13] = 151833112
	elseif wd == "赭石巨剑" then
		wds[1] = "以赭石去杂质锻淬而成，色泽沉郁。"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 16
	    wds[5] = 20
	    wds[7] = {"偃无师"}
	    wds[11] = "common/item.wdf"
	    wds[12] = 1525417198
	    wds[13] = 2861515391
	elseif wd == "壁玉长铗" then
		wds[1] = "精铁重剑，剑身嵌美玉。碧波流光，颇有君子之风。"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 16
	    wds[5] = 30
	    wds[7] = {"偃无师"}
	    wds[11] = "common/item.wdf"
	    wds[12] = 0x51105074
	    wds[13] = 0x976BFD27
	elseif wd == "青铜古剑" then
		wds[1] = "青铜宝剑，古朴大气，然剑锋凌厉，不可小觑。"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 16
	    wds[5] = 40
	    wds[7] = {"偃无师"}
	    wds[11] = "common/item.wdf"
	    wds[12] = 0x809D1FDD
	    wds[13] = 0xCC013376
	elseif wd == "金错巨刃" then
		wds[1] = "铁匠采丹阳铜矿冶炼锻造，剑身以镶金包裹，工艺精湛，灼灼夺目。"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 16
	    wds[5] = 50
	    wds[7] = {"偃无师"}
	    wds[11] = "common/item.wdf"
	    wds[12] = 0xBD5C010E
	    wds[13] = 0xE8F34110
	elseif wd == "惊涛雪" then
		wds[1] = "铸剑师偶得深海晶石一块，冶炼成剑，挥斩之时，流光溢彩。"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 16
	    wds[5] = 60
	    wds[7] = {"偃无师"}
	    wds[11] = "common/item.wdf"
	    wds[12] = 0x1F648228
	    wds[13] = 0x0B0AB6FB
	elseif wd == "醉浮生" then
		wds[1] = "浮生若梦，一醉解忧，以布裹之，掩锋芒，平杀气，大巧不工，颇具豪侠之意。"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 16
	    wds[5] = 70
	    wds[7] = {"偃无师"}
	    wds[11] = "common/item.wdf"
	    wds[12] = 0x379213E4
	    wds[13] = 0xE98BD873
	elseif wd == "沉戟天戊" then
		wds[1] = "原为沙场断戟，后经人收敛重铸，以缅忠魂。握之，勇武无惧。"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 16
	    wds[5] = 80
	    wds[7] = {"偃无师"}
	    wds[11] = "common/item.wdf"
	    wds[12] = 0x2E58E991
	    wds[13] = 0xE7692943
	elseif wd == "鸦九" then
		wds[1] = "剑痴鸦九得欧冶子所遗铸剑秘法，铸长剑无名。因不舍爱剑磨损，剑成当日。即以冰匣封之。十余年后得人点拔开悟，欲拔剑出匣，然而冰匣早已与剑芯融为一体，不可分离，寻得熔岩炼化三年，方重铸此剑，剑身自此红雾缭绕。后人得之，为此剑冠以剑痴鸦九之名。"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 16
	    wds[5] = 90
	    wds[7] = {"偃无师"}
	    wds[11] = "common/item.wdf"
	    wds[12] = 0xEE633A71
	    wds[13] = 0x3ADE1603
	elseif wd == "昆吾" then
		wds[1] = "前朝君主雄才大略，文治武功皆成鼎盛，有邦国朝献天降陨铁。以为祥瑞，遂寻当世铸剑高手，炼化成剑，彪炳功勋。"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 16
	    wds[5] = 100
	    wds[7] = {"偃无师"}
	    wds[11] = "common/item.wdf"
	    wds[12] = 0x458E5B98
	    wds[13] = 0xF9D8AF7B
	elseif wd == "弦歌" then
		wds[1] = "乐师师旷以剑为胆，棹伏羲木，铺天蚕丝，制成琴身重剑，以酬知己，友人闻弦歌而知雅意，奏高山流水，成一段佳话。"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 16
	    wds[5] = 110
	    wds[7] = {"偃无师"}
	    wds[11] = "common/item.wdf"
	    wds[12] = 0x7B631424
	    wds[13] = 0x2952AF91
	elseif wd == "墨骨枯麟" then
		wds[1] = "东海龙冢有龙骨万千，尤以黑龙龙骨为尊，取其残骨，熔以业火，成墨骨重剑。弹触剑身，争鸣作响，似有龙吟。"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 16
	    wds[5] = 120
	    wds[7] = {"偃无师"}
	    wds[11] = "common/item.wdf"
	    wds[12] = 0x84131194
	    wds[13] = 0xEDAE8F1A
	elseif wd == "腾蛇郁刃" then
		wds[1] = "中山之州有赤目飞蛇，乘雾游云，于柴桑之山嬉戏，疲乏后盘松石小憩，留蛇蜕一副，化为巨剑，此乃王道之师。"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 16
	    wds[5] = 130
	    wds[7] = {"偃无师"}
	    wds[11] = "common/item.wdf"
	    wds[12] = 0x6F6CAC00
	    wds[13] = 0x9B3ACC82
	elseif wd == "秋水澄流" then
		wds[1] = "泑水之畔盛产婴垣之玉，得蓐收赤足踏过而成金秋之色，胜碧玉琼瑶。有人界巧匠偶得之，不知何物，投剑炉一试，不想即刻炉毁剑成，更一日入秋，遂得此名。"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 16
	    wds[5] = 140
	    wds[7] = {"偃无师"}
	    wds[11] = "common/item.wdf"
	    wds[12] = 0x5F69A15B
	    wds[13] = 0x60665CA2
	elseif wd == "百辟镇魂" then
		wds[1] = "千年以前，世间妖魔横行，有神将除妖邪，斩厉鬼，力竭而亡，然其精魂不灭，附于生前所用神兵重剑，继续护佑四方。此剑祭出，则正气浩然冲天，可诛邪平患，可定历熄灾。"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 16
	    wds[5] = 150
	    wds[7] = {"偃无师"}
	    wds[11] = "common/item.wdf"
	    wds[12] = 0xF88C7462
	    wds[13] = 0x18605DF5
	elseif wd == "长息" then
		wds[1] = "洪水滔天，鲧窃帝之息壤以堙洪水，息壤生生不息，却于疏洪无益。帝令祝融取息壤，复命禹布土疏洪，以定九州。此时山川逼仄，水塞不出。禹借祝融火龙之力，熔炼息壤成重剑之体，以之开山疏浚，方江河倾泻，洪水东去。"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 16
	    wds[5] = 160
	    wds[7] = {"偃无师"}
	    wds[11] = "common/item.wdf"
	    wds[12] = 0x14412394
	    wds[13] = 0x50C65EB2
	elseif wd == "素纸灯" then
		wds[1] = "轻巧的纸灯笼，最适合新手练习使用。"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 18
	    wds[5] = 0
	    wds[7] = {"桃夭夭"}
	    wds[11] = "common/item.wdf"
	    wds[12] = 0xC2554C5A
	    wds[13] = 0x053A2EC4
	elseif wd == "竹骨灯" then
		wds[1] = "以竹骨扎成的灯笼，看起来精致又风雅。"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 18
	    wds[5] = 10
	    wds[7] = {"桃夭夭"}
	    wds[11] = "common/item.wdf"
	    wds[12] = 0x3EC471A0
	    wds[13] = 0xEA6DAE59
	elseif wd == "红灯笼" then
		wds[1] = "节日时方可悬挂起来的红灯笼，看到它就能感到喜庆的氛围。"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 18
	    wds[5] = 20
	    wds[7] = {"桃夭夭"}
	    wds[11] = "common/item.wdf"
	    wds[12] = 0xC7DFDFEE
	    wds[13] = 0x38E5EA0B
	elseif wd == "鲤鱼灯" then
		wds[1] = "仿照锦鲤的样子精致而成的花灯，说不定会和锦鲤一样带给人好运呢！"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 18
	    wds[5] = 30
	    wds[7] = {"桃夭夭"}
	    wds[11] = "common/item.wdf"
	    wds[12] = 0x97F6C50B
	    wds[13] = 0x97DB902B
	elseif wd == "芙蓉花灯" then
		wds[1] = "晶莹剔透的白瓷灯笼，更有名家所绘之工笔芙蓉，美轮美奂。"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 18
	    wds[5] = 40
	    wds[7] = {"桃夭夭"}
	    wds[11] = "common/item.wdf"
	    wds[12] = 0xCD622A06
	    wds[13] = 0x7E3F070B
	elseif wd == "如意宫灯" then
		wds[1] = "宫廷巧匠耗费月余精制而成的宫灯，象征着平安吉祥，如意你心。"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 18
	    wds[5] = 50
	    wds[7] = {"桃夭夭"}
	    wds[11] = "common/item.wdf"
	    wds[12] = 0xB4FBA38A
	    wds[13] = 0xCE867B66
	elseif wd == "玲珑盏" then
		wds[1] = "西域工匠以 费盘斯 工艺烧制的灯笼，其色流云清彩，其质晶莹剔透，玲珑奇巧，引人注目。"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 18
	    wds[5] = 60
	    wds[7] = {"桃夭夭"}
	    wds[11] = "common/item.wdf"
	    wds[12] = 0x97987F5C
	    wds[13] = 0xA3B8F8E5
	elseif wd == "玉兔盏" then
		wds[1] = "白璧无瑕琢成团绒玉兔，碧玉青翠雕琢剔透环珮，光润莹然，美不胜收。"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 18
	    wds[5] = 70
	    wds[7] = {"桃夭夭"}
	    wds[11] = "common/item.wdf"
	    wds[12] = 0xD1839465
	    wds[13] = 0x9C3DDB33
	elseif wd == "冰心盏" then
		wds[1] = "北俱寒冰，澄澈剔透，经年不化。炽焰为刃，琢成玲珑灯盏，寒光为焰，凛风逼人。"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 18
	    wds[5] = 80
	    wds[7] = {"桃夭夭"}
	    wds[11] = "common/item.wdf"
	    wds[12] = 0x06427E44
	    wds[13] = 0xF2575943
	elseif wd == "蟠龙" then
		wds[1] = "风从龙出，云有龙息，夜放光华，金碧辉煌。"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 18
	    wds[5] = 90
	    wds[7] = {"桃夭夭"}
	    wds[11] = "common/item.wdf"
	    wds[12] = 0xA2DC05D6
	    wds[13] = 0x73DE6960
	elseif wd == "云鹤" then
		wds[1] = "饥餐瑶草，渴饮琼泉。朝飞阆苑，暮宿云烟。白鹤雪羽为灯盏，光耀如雪，不惹尘埃。"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 18
	    wds[5] = 100
	    wds[7] = {"桃夭夭"}
	    wds[11] = "common/item.wdf"
	    wds[12] = 0x5470130D
	    wds[13] = 0x7B377B2F
	elseif wd == "风荷" then
		wds[1] = "清莲出水，玉立亭亭。其灵性卓然者，化为灵仙，凡胎肉身，则凝为灯盏。含苞欲放，清芬十里。"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 18
	    wds[5] = 110
	    wds[7] = {"桃夭夭"}
	    wds[11] = "common/item.wdf"
	    wds[12] = 0xE61D828A
	    wds[13] = 0x03F289DB
	elseif wd == "金风玉露" then
		wds[1] = "今日云軿渡鹊桥，应非脉脉与迢迢。灵鹊仙羽，织就金凤，七夕月华，酿作玉露。皎皎华光，可照良人。"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 18
	    wds[5] = 120
	    wds[7] = {"桃夭夭"}
	    wds[11] = "common/item.wdf"
	    wds[12] = 0xD9D63E3A
	    wds[13] = 0x56ECB65C
	elseif wd == "凰火燎原" then
		wds[1] = "凰与凤，生相伴，死同归。一方离世，则生者必引颈而鸣，唤涅槃之火，双双浴火重生。此火五百年不灭，奔腾炽烈，可焚八方。"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 18
	    wds[5] = 130
	    wds[7] = {"桃夭夭"}
	    wds[11] = "common/item.wdf"
	    wds[12] = 0x9129C027
	    wds[13] = 0x9DD18309
	elseif wd == "月露清愁" then
		wds[1] = "三界之西，有湖曰灵，湖水乃天女眼泪所化，夜色深浓时，有溶溶光华。水滴如泪，泪干为夜明灵珠，风流藴籍，清光冷冷。"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 18
	    wds[5] = 140
	    wds[7] = {"桃夭夭"}
	    wds[11] = "common/item.wdf"
	    wds[12] = 0x7DB16375
	    wds[13] = 0x17020397
	elseif wd == "夭桃秾李" then
		wds[1] = "桃之夭夭，灼灼其华。烂漫春光，转瞬即逝。九重天上仙娥取之以为灯盏，光华所至处，枯木吐芽，桃李争芳。"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 18
	    wds[5] = 150
	    wds[7] = {"桃夭夭"}
	    wds[11] = "common/item.wdf"
	    wds[12] = 0x71FEDD98
	    wds[13] = 0xEAEFA73D
	elseif wd == "荒尘" then
		wds[1] = "星河浩瀚，繁星若尘，亿万星尘聚沙为塔，是以沧海桑田，人世幻变，其光华永恒也。"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 18
	    wds[5] = 160
	    wds[7] = {"桃夭夭"}
	    wds[11] = "common/item.wdf"
	    wds[12] = 0x889E6AB7
	    wds[13] = 0xFEEAD4B6
	elseif wd == "油纸伞" then
		wds[1] = "普通的油纸伞，美观轻巧，最适合新手使用。"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 17
	    wds[5] = 0
	    wds[7] = {"鬼潇潇"}
	    wds[11] = "common/item.wdf"
	    wds[12] = 0x75285B05
	    wds[13] = 0x63C38A86
	elseif wd == "红罗伞" then
		wds[1] = "当下最时兴的雨伞样式，正红色的罗缎伞面看起来甚是喜庆。"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 17
	    wds[5] = 10
	    wds[7] = {"鬼潇潇"}
	    wds[11] = "common/item.wdf"
	    wds[12] = 0xABC1FF05
	    wds[13] = 0x1485AABF
	elseif wd == "紫竹伞" then
		wds[1] = "伞骨及伞柄皆是紫竹制成，非常坚韧。"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 17
	    wds[5] = 20
	    wds[7] = {"鬼潇潇"}
	    wds[11] = "common/item.wdf"
	    wds[12] = 0x7EB4CE4A
	    wds[13] = 0x28EEC31C
	elseif wd == "锦绣椎" then
		wds[1] = "巧手绣娘，择上品丝绸，飞针走线，历时年逾，方成此伞，设色精妙，光彩夺目。"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 17
	    wds[5] = 30
	    wds[7] = {"鬼潇潇"}
	    wds[11] = "common/item.wdf"
	    wds[12] = 0x38E84E48
	    wds[13] = 0xA0A62144
	elseif wd == "幽兰帐" then
		wds[1] = "本为一尺无暇素锦，不慎沾染墨痕，幸得雅士泼墨挥毫，绘幽兰一枝，其清俊姿态，栩栩如生，其清雅香气，扑鼻欲来。"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 17
	    wds[5] = 40
	    wds[7] = {"鬼潇潇"}
	    wds[11] = "common/item.wdf"
	    wds[12] = 0x898B70A3
	    wds[13] = 0xF2391CAB
	elseif wd == "琳琅盖" then
		wds[1] = "《般若经》有七宝：乃金、银、琉璃、珊瑚、琥珀、砗磲、玛瑙。能工巧匠以金银为骨，饰以琉璃、砗磲之属，方成此伞。"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 17
	    wds[5] = 50
	    wds[7] = {"鬼潇潇"}
	    wds[11] = "common/item.wdf"
	    wds[12] = 0xD105662F
	    wds[13] = 0x38B4CA6B
	elseif wd == "孔雀羽" then
		wds[1] = "西域巧匠，取珍兽孔雀之尾羽，以玄妙秘法织造而成，碧彩闪烁，金翠辉煌。"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 17
	    wds[5] = 60
	    wds[7] = {"鬼潇潇"}
	    wds[11] = "common/item.wdf"
	    wds[12] = 0xFEBE2460
	    wds[13] = 0x24BD153A
	elseif wd == "金刚伞" then
		wds[1] = "金刚怒目，降妖四魔。金刚伞以精钢百炼而成，铁骨刚叶，坚不可摧。"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 17
	    wds[5] = 70
	    wds[7] = {"鬼潇潇"}
	    wds[11] = "common/item.wdf"
	    wds[12] = 0xCC7106BF
	    wds[13] = 0x4FD7BCC4
	elseif wd == "落梅伞" then
		wds[1] = "北俱苦寒之地，生千年老梅。一甲子方开花一次，色若胭脂，香欺兰蕙。梅枝落雪上，苦心雕琢，方成此伞。"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 17
	    wds[5] = 80
	    wds[7] = {"鬼潇潇"}
	    wds[11] = "common/item.wdf"
	    wds[12] = 0xC0151FE6
	    wds[13] = 0x25E301EE
	elseif wd == "鬼骨" then
		wds[1] = "昆山有玉，性阴厉，蓄百年煞气，幻为枯骨，谓之鬼玉。此玉为伞骨，伞下阴魂环绕，寒气森然。"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 17
	    wds[5] = 90
	    wds[7] = {"鬼潇潇"}
	    wds[11] = "common/item.wdf"
	    wds[12] = 0xC1D8FB19
	    wds[13] = 0x5CBC9754
	elseif wd == "云梦" then
		wds[1] = "高唐有梦，水阔花飞，梦有神女取巫山之风云为伞，谓之云梦。"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 17
	    wds[5] = 100
	    wds[7] = {"鬼潇潇"}
	    wds[11] = "common/item.wdf"
	    wds[12] = 0x9DF0BB9B
	    wds[13] = 0x32DC87DD
	elseif wd == "枕霞" then
		wds[1] = "瑶池有仙蝶，枕霞沐云而生，其态纤巧翩然，其色艳若丹霞，取其羽翼为伞，霞光云影，如在目前。"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 17
	    wds[5] = 110
	    wds[7] = {"鬼潇潇"}
	    wds[11] = "common/item.wdf"
	    wds[12] = 0x28771B6D
	    wds[13] = 0x4FBB679F
	elseif wd == "碧火琉璃" then
		wds[1] = "金蛇之鳞，可萃命魂之焰。以百枚金蛇之鳞，取百鬼命魂之火，成此伞。碧火幽幽，杀气腾腾，此伞过处，百鬼夜哭，绕梁不绝。"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 17
	    wds[5] = 120
	    wds[7] = {"鬼潇潇"}
	    wds[11] = "common/item.wdf"
	    wds[12] = 0xEB48DDFB
	    wds[13] = 0x284DD72B
	elseif wd == "雪羽穿云" then
		wds[1] = "昆仑山中，有仙禽雪鸢，振翅可穿云，歌有裂石音，灵气所钟，位列仙班，其羽裳化伞，持此者，身轻如燕，振翅可至九天。"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 17
	    wds[5] = 130
	    wds[7] = {"鬼潇潇"}
	    wds[11] = "common/item.wdf"
	    wds[12] = 0xD189B9E5
	    wds[13] = 0x14945888
	elseif wd == "月影星痕" then
		wds[1] = "汲天河之水，取星河之光。凝月华之露，锻千日，成此伞。其光灿然，其色清灵，伞起时，月华照人，清辉泻地。"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 17
	    wds[5] = 140
	    wds[7] = {"鬼潇潇"}
	    wds[11] = "common/item.wdf"
	    wds[12] = 0x8E5D6A40
	    wds[13] = 0x45CB2F4A
	elseif wd == "浮生归梦" then
		wds[1] = "三生河畔，彼岸花开，殷红似火，灼灼其华。曼珠沙华一株，藏浮生忆念一世。幽梦为瓣，情丝若蕊，墨蝶翩翩，归梦何时？"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 17
	    wds[5] = 150
	    wds[7] = {"鬼潇潇"}
	    wds[11] = "common/item.wdf"
	    wds[12] = 0xE1EC0610
	    wds[13] = 0x2DF481E2
	elseif wd == "晴雪" then
		wds[1] = "燕山雪，大如席，有华胥之女幽娴娇丽，踏凌云风波，乘逐月之辇，辇有华盖，正是燕山晴雪，清光冷冷，不可逼视。"
		wds[2] = 2
		wds[3] = 3
		wds[4] = 17
	    wds[5] = 160
	    wds[7] = {"鬼潇潇"}
	    wds[11] = "common/item.wdf"
	    wds[12] = 0x8020E83B
	    wds[13] = 0x4C2F3E26
	-- 药品新增
	elseif wd == "四叶花" then
	   wds[1] = "具有药性的中草药，长着四片叶子的药草，可以补充少量气血。"
	   wds[2] = 1
	   wds[3] = 1
	   wds[4] = 2
	   wds[8] = 1
	   wds[10] = 20
	   wds[11] = "item.wdf"
	   wds[12] = 2403345371
	   wds[13] = 2730519933
	   wds[14] = 100
	elseif wd == "七叶莲" then
	   wds[1] = "“出污泥而不染”七片叶子的莲花更是稀有品种，难能可贵的是，这种莲花具有药性。可以补充少量气血。"
	   wds[2] = 1
	   wds[3] = 1
	   wds[4] = 2
	   wds[8] = 1
	   wds[11] = "item.wdf"
	   wds[12] = 1559451305
	   wds[13] = 3792310897
	   wds[14] = 150
	elseif wd == "天青地白" then
	   wds[1] = "产于北方的药草，天青色的花，青白色的叶，具有药性。可以补充少量气血。"
	   wds[2] = 1
	   wds[3] = 1
	   wds[4] = 2
	   wds[8] = 1
	   wds[11] = "item.wdf"
	   wds[12] = 2832513988
	   wds[13] = 296513300
	   wds[14] = 200
    elseif wd == "鬼切草" then
	   wds[1] = "产自阴间的药草，由于常年在阴湿之地，故而有很强的药力,可以补充少量法力。"
	   wds[2] = 1
	   wds[3] = 1
	   wds[4] = 2
	   wds[8] = 1
	   wds[11] = "item.wdf"
	   wds[12] = 0x4CE95CD4
	   wds[13] = 0x405AE01C
	   wds[14] = 80
      elseif wd == "紫丹罗" then
	   wds[1] = "产自东胜神洲的药草,紫色的叶子上散发出阵阵清香，可以补充少许法力。"
	   wds[2] = 1
	   wds[3] = 1
	   wds[4] = 2
	   wds[8] = 1
	   wds[11] = "item.wdf"
	   wds[12] = 3370160386
	   wds[13] = 1385083912
	   wds[14] = 80
	elseif wd == "佛手" then
	   wds[1] = "非常常见的药物，因其外貌酷似佛的手指而得名，可以补充少量法力。"
	   wds[2] = 1
	   wds[3] = 1
	   wds[4] = 2
	   wds[8] = 1
	   wds[11] = "item.wdf"
	   wds[12] = 2548894140
	   wds[13] = 383352299
	   wds[14] = 80
	elseif wd == "旋复花" then
	   wds[1] = "产于东海海滨的药草,花开三色，暗和三才之术数，可以补充少量法力。"
	   wds[2] = 1
	   wds[3] = 1
	   wds[4] = 2
	   wds[8] = 1
	   wds[11] = "item.wdf"
	   wds[12] = 3005200763
	   wds[13] = 1826111581
	   wds[14] = 80
	elseif wd == "百色花" then
	   wds[1] = "海外仙草，原产于方壶岛，兼百花之灵气，可以补充少量法力。"
	   wds[2] = 1
	   wds[3] = 1
	   wds[4] = 2
	   wds[8] = 1
	   wds[11] = "item.wdf"
	   wds[12] = 542670697
	   wds[13] = 2739363770
	   wds[14] = 140
	elseif wd == "香叶" then
	   wds[1] = "散发香气的药草叶子可以补充少量的法力。"
	   wds[2] = 1
	   wds[3] = 1
	   wds[4] = 2
	   wds[8] = 1
	   wds[11] = "item.wdf"
	   wds[12] = 1613933236
	   wds[13] = 4251066160
	   wds[14] = 140
	elseif wd == "龙须草" then
	   wds[1] = "《古今注》曰：“世称皇帝炼丹凿砚山，乃得仙，乘龙上天。群臣援龙须，须堕而生草，曰龙须”，可以补充少量法力。"
	   wds[2] = 1
	   wds[3] = 1
	   wds[4] = 2
	   wds[8] = 1
	   wds[11] = "item.wdf"
	   wds[12] = 1050552246
	   wds[13] = 2301092035
	   wds[14] = 140
	elseif wd == "灵脂" then
	   wds[1] = "采天地灵气而生的药物，又称三秀，可以补充少量法力。"
	   wds[2] = 1
	   wds[3] = 1
	   wds[4] = 2
	   wds[8] = 1
	   wds[11] = "item.wdf"
	   wds[12] = 2234254574
	   wds[13] = 4179146971
	   wds[14] = 200
	elseif wd == "白玉骨头" then
	   wds[1] = "东方白民国药兽的骨头，具有很强的药性，可以补充少量法力。"
	   wds[2] = 1
	   wds[3] = 1
	   wds[4] = 2
	   wds[8] = 1
	   wds[11] = "item.wdf"
	   wds[12] = 3784788337
	   wds[13] = 3455660261
	   wds[14] = 200
	elseif wd == "曼陀罗花" then
	   wds[1] = "常用的药草之一，华佗当年配制麻沸散的主要原料。可以补充少量法力。"
	   wds[2] = 1
	   wds[3] = 1
	   wds[4] = 2
	   wds[8] = 1
	   wds[11] = "item.wdf"
	   wds[12] = 1670376717
	   wds[13] = 351908663
	   wds[14] = 275
	-- 二级
	elseif wd == "天不老" then
	   wds[1] = "南瞻部洲常见的药草，花期非常之长，故而得名，可以补充些许气血。"
	   wds[2] = 1
	   wds[3] = 1
	   wds[4] = 2
	   wds[8] = 1
	   wds[11] = "item.wdf"
	   wds[12] = 0xA1292738
	   wds[13] = 0x812F04D7
	   wds[14] = 1000
	elseif wd == "紫石英" then
	   wds[1] = "紫色的千年英石，具有药性，可以补充些许气血。"
	   wds[2] = 1
	   wds[3] = 1
	   wds[4] = 2
	   wds[8] = 1
	   wds[11] = "item.wdf"
	   wds[12] = 0x388CCEE9
	   wds[13] = 0x8AC7636D
	   wds[14] = 1000
	elseif wd == "鹿茸" then
	   wds[1] = "南极仙翁仙鹿之茸,可以补充些许气血。"
	   wds[2] = 1
	   wds[3] = 1
	   wds[4] = 2
	   wds[8] = 1
	   wds[11] = "item.wdf"
	   wds[12] = 0x92DCE8F4
	   wds[13] = 0x4B5BF1AF
	   wds[14] = 2000
	elseif wd == "血色茶花" then
	   wds[1] = "出自南方的野生茶花,可以补充些许气血。"
	   wds[2] = 1
	   wds[3] = 1
	   wds[4] = 2
	   wds[8] = 1
	   wds[11] = "item.wdf"
	   wds[12] = 0x50B560E1
	   wds[13] = 0x4DE946B5
	   wds[14] = 2000
	elseif wd == "六道轮回" then
	   wds[1] = "天宫的异花，六种颜色可以清楚的反映出六道的轮回，故而得名，可以补充大量气血。"
	   wds[2] = 1
	   wds[3] = 1
	   wds[4] = 2
	   wds[8] = 1
	   wds[11] = "item.wdf"
	   wds[12] = 0x7A231B4A
	   wds[13] = 0x6F66E996
	   wds[14] = 2000
	elseif wd == "熊胆" then
	   wds[1] = "千年熊罴的胆，是十分难得可遇不可求的宝物，可以补充大量气血。"
	   wds[2] = 1
	   wds[3] = 1
	   wds[4] = 2
	   wds[8] = 1
	   wds[11] = "item.wdf"
	   wds[12] = 0x51EC528C
	   wds[13] = 0x10929E69
	   wds[14] = 2000
	elseif wd == "凤凰尾" then
	   wds[1] = [[“彩凤双飞翼，心犀一点通。”这是一根灵鸟鸾凤尾部的羽毛，可以补充大量气血。]]
	   wds[2] = 1
	   wds[3] = 1
	   wds[4] = 2
	   wds[8] = 1
	   wds[11] = "item.wdf"
	   wds[12] = 0x5BC584A7
	   wds[13] = 0x9E720FD5
	   wds[14] = 3000
	elseif wd == "硫磺草" then
	   wds[1] = "在硫磺地长大的圣草，可以补充大量气血"
	   wds[2] = 1
	   wds[3] = 1
	   wds[4] = 2
	   wds[8] = 1
	   wds[11] = "item.wdf"
	   wds[12] = 0x338422D9
	   wds[13] = 0xA49FDDC1
	   wds[14] = 3000
	elseif wd == "龙之心屑" then
	   wds[1] = "用龙心提炼出的灵药,只在魔界存在，可以补充极大量的气血。"
	   wds[2] = 1
	   wds[3] = 1
	   wds[4] = 2
	   wds[8] = 1
	   wds[11] = "item.wdf"
	   wds[12] = 0xBF847936
	   wds[13] = 0xC26FA33C
	   wds[14] = 4000
	elseif wd == "火凤之睛" then
	   wds[1] = "无色界天的火凤凰的眼睛，可以补充极大量的气血。"
	   wds[2] = 1
	   wds[3] = 1
	   wds[4] = 2
	   wds[8] = 1
	   wds[11] = "item.wdf"
	   wds[12] = 0xD0B9CCDF
	   wds[13] = 0x7756A846
	   wds[14] = 4000
	elseif wd == "丁香水" then
	   wds[1] = "从仙岛上的丁香花中精心提炼而成，可以补充些许法力。"
	   wds[2] = 1
	   wds[3] = 1
	   wds[4] = 2
	   wds[8] = 1
	   wds[11] = "item.wdf"
	   wds[12] = 0x33DBD039
	   wds[13] = 0x23B1D2DA
	   wds[14] = 4000
	elseif wd == "月星子" then
	   wds[1] = "五台山的名产，用水研化后使用，可以补充些许法力。"
	   wds[2] = 1
	   wds[3] = 1
	   wds[4] = 2
	   wds[8] = 1
	   wds[11] = "item.wdf"
	   wds[12] = 0x18450CD6
	   wds[13] = 0xE3307E95
	   wds[14] = 4000
	elseif wd == "仙狐涎" then
	   wds[1] = "东方青丘国九尾仙狐的涎水制成的药草，可以补充些许法力。"
	   wds[2] = 1
	   wds[3] = 1
	   wds[4] = 2
	   wds[8] = 1
	   wds[11] = "item.wdf"
	   wds[12] = 0xB5F99FA9
	   wds[13] = 0x1E547A7E
	   wds[14] = 5000
	elseif wd == "地狱灵芝" then
	   wds[1] = "产自地狱深处的灵芝草，由于吸取了阴魂怨气，药力很强，可以补充些许法力。"
	   wds[2] = 1
	   wds[3] = 1
	   wds[4] = 2
	   wds[8] = 1
	   wds[11] = "item.wdf"
	   wds[12] = 0x2F7C81CE
	   wds[13] = 0x696C18EE
	   wds[14] = 5000
	elseif wd == "麝香" then
	   wds[1] = "仙山灵麝的麝香，是名贵的中草药材，可以补充些许法力"
	   wds[2] = 1
	   wds[3] = 1
	   wds[4] = 2
	   wds[8] = 1
	   wds[11] = "item.wdf"
	   wds[12] = 0x070423BB
	   wds[13] = 0x6292168E
	   wds[14] = 5000
	elseif wd == "血珊瑚" then
	   wds[1] = "东海海底的千年珊瑚，具有强大的灵力,可以补充些许法力。"
	   wds[2] = 1
	   wds[3] = 1
	   wds[4] = 2
	   wds[8] = 1
	   wds[11] = "item.wdf"
	   wds[12] = 0x0789B660
	   wds[13] = 0x92583E49
	   wds[14] = 5000
	elseif wd == "餐风饮露" then
	   wds[1] = "南海普陀山的仙竹枝，可以补充些许法力。"
	   wds[2] = 1
	   wds[3] = 1
	   wds[4] = 2
	   wds[8] = 1
	   wds[11] = "item.wdf"
	   wds[12] = 0xEB07E77A
	   wds[13] = 0x28AF1886
	   wds[14] = 5000
	elseif wd == "白露为霜" then
	   wds[1] = "五庄观前的仙松之枝,服用后可以补充些许法力。"
	   wds[2] = 1
	   wds[3] = 1
	   wds[4] = 2
	   wds[8] = 1
	   wds[11] = "item.wdf"
	   wds[12] = 0xC94308D2
	   wds[13] = 0x95A825DD
	   wds[14] = 5000
	elseif wd == "天龙水" then
	   wds[1] = "九天真龙的血液炼成的药物，可以补充些许法力。"
	   wds[2] = 1
	   wds[3] = 1
	   wds[4] = 2
	   wds[8] = 1
	   wds[11] = "item.wdf"
	   wds[12] = 0x3256793E
	   wds[13] = 0xDA628B3B
	   wds[14] = 6000
	elseif wd == "孔雀红" then
	   wds[1] = "用仙家孔雀的精华制成的药品，有很强的魔性，可以补充大量法力。"
	   wds[2] = 1
	   wds[3] = 1
	   wds[4] = 2
	   wds[8] = 1
	   wds[11] = "item.wdf"
	   wds[12] = 0xF4A285EE
	   wds[13] = 0x82670C5A
	   wds[14] = 6000
	elseif wd == "金创药" then
	   wds[1] = "用云南白药制成的疗伤药，可以止血、消毒，是常见的药品。具有补充气血的作用。"
	   wds[2] = 1
	   wds[3] = 1
	   wds[4] = 2
	   wds[8] = 3
	   wds[11] = "item.wdf"
	   wds[12] = 3360268674
	   wds[13] = 3769489910
	   wds[14] = 10000
	elseif wd == "金香玉" then
	   wds[1] = "仙子仙女常用的药物，除了可以养颜之外，服用后具有恢复气血的作用。"
	   wds[2] = 1
	   wds[3] = 1
	   wds[4] = 1
	   wds[8] = 3
	   wds[11] = "item.wdf"
	   wds[12] = 875333087
	   wds[13] = 2395394781
	   wds[14] = 12500
	elseif wd == "小还丹" then
	   wds[1] = "载于中国古老药书《千金方》，散发着香气的紫色药丸，具有补充气血的功效。"
	   wds[2] = 1
	   wds[3] = 1
	   wds[4] = 1
	   wds[8] = 3
	   wds[11] = "item.wdf"
	   wds[12] = 1261161767
	   wds[13] = 4110383651
	   wds[14] = 10000
	elseif wd == "千年保心丹" then
	   wds[1] = "用大量名贵药品，经名师的精心加工制成的药丹，具有补充气血的功效。"
	   wds[2] = 1
	   wds[3] = 1
	   wds[4] = 2
	   wds[8] = 3
	   wds[11] = "item.wdf"
	   wds[12] = 3968259402
	   wds[13] = 212192249
	   wds[14] = 15000
	elseif wd == "风水混元丹" then
	   wds[1] = "有混元之神效，用各类名贵药品精炼的丹药，具有补充法力和恢复战斗中某些情况下损失的灵力的功效。"
	   wds[2] = 1
	   wds[3] = 1
	   wds[4] = 1
	   wds[8] = 3
	   wds[11] = "item.wdf"
	   wds[12] = 1613137255
	   wds[13] = 3441623302
	   wds[14] = 10000
	elseif wd == "定神香" then
	   wds[1] = "有定神凝气的功效，名贵药物，精心练成的丹药，具有补充法力的功效。"
	   wds[2] = 1
	   wds[3] = 1
	   wds[4] = 1
	   wds[8] = 3
	   wds[11] = "item.wdf"
	   wds[12] = 2570329553
	   wds[13] = 4232010254
	   wds[14] = 11000
	elseif wd == "蛇蝎美人" then
	   wds[1] = "魔王妖王常用的药物，具有补充法力的功效。"
	   wds[2] = 1
	   wds[3] = 1
	   wds[4] = 2
	   wds[8] = 3
	   wds[11] = "item.wdf"
	   wds[12] = 2982020731
	   wds[13] = 2737638149
	   wds[14] = 15000
  	elseif wd == "十香返生丸" then
	   wds[1] = "用十种仙山上奇香的药草制成，奇异的药丸，具有补充法力和解除酒类异常状态的作用。"
	   wds[2] = 1
	   wds[3] = 1
	   wds[4] = 2
	   wds[8] = 3
	   wds[11] = "item.wdf"
	   wds[12] = 0xC4D733DA
	   wds[13] = 0x3D4A4DFD
	   wds[14] = 15000
	elseif wd == "九转回魂丹" then
	   wds[1] = "炼过九转的仙丹，用极为珍贵而特殊的药物制成，具有补充气血、疗伤和起死回生的功效。"
	   wds[2] = 1
	   wds[3] = 2
	   wds[4] = 2
	   wds[8] = 3
	   wds[11] = "item.wdf"
	   wds[12] = 68961914
	   wds[13] = 1116089577
	   wds[14] = 40000
	elseif wd == "佛光舍利子" then
	   wds[1] = "佛的舍利子具有补充气血、疗伤和起死回生的功效。"
	   wds[2] = 1
	   wds[3] = 2
	   wds[4] = 2
	   wds[8] = 3
	   wds[11] = "item.wdf"
	   wds[12] = 68961914
	   wds[13] = 1116089577
	   wds[14] = 20000
	elseif wd == "五龙丹" then
	   wds[1] = "来自东海龙宫的珍贵药品，是用五颗龙珠凝练的，具有补充气血和解除封类异常状态的功效（解封几率与品质相关）。若未在封类异常状态服用五龙丹，会进入睡眠状态。"
	   wds[2] = 1
	   wds[3] = 2
	   wds[4] = 2
	   wds[8] = 3
	   wds[11] = "item.wdf"
	   wds[12] = 260113467
	   wds[13] = 3795878131
	   wds[14] = 17500
	-- 变身
	elseif wd == "一级变身卡" then
	   wds[1] = "可以变化成对应的召唤兽，并附加特殊效果"
	   wds[2] = 12
	   wds[3] = 1
	   wds[4] = 1
	   wds[8] = 1
	   wds[11] = "item.wdf"
	   wds[12] = 1241680878
	   wds[13] = 4046019597
	   wds[14] = 10000
	elseif wd == "二级变身卡" then
	   wds[1] = "可以变化成对应的召唤兽，并附加特殊效果"
	   wds[2] = 12
	   wds[3] = 1
	   wds[4] = 1
	   wds[8] = 1
	   wds[11] = "item.wdf"
	   wds[12] = 0xBB35E1EE
	   wds[13] = 0xBB35E1EE
	   wds[14] = 10000
   elseif wd == "三级变身卡" then
	   wds[1] = "可以变化成对应的召唤兽，并附加特殊效果"
	   wds[2] = 12
	   wds[3] = 1
	   wds[4] = 1
	   wds[8] = 1
	   wds[11] = "item.wdf"
	   wds[12] = 0xE7FC64D2
	   wds[13] = 0xE7FC64D2
	   wds[14] = 10000
	elseif wd == "四级变身卡" then
	   wds[1] = "可以变化成对应的召唤兽，并附加特殊效果"
	   wds[2] = 12
	   wds[3] = 1
	   wds[4] = 1
	   wds[8] = 1
	   wds[11] = "item.wdf"
	   wds[12] = 0xA00740F6
	   wds[13] = 0xA00740F6
	   wds[14] = 10000
	elseif wd == "五级变身卡" then
	   wds[1] = "可以变化成对应的召唤兽，并附加特殊效果"
	   wds[2] = 12
	   wds[3] = 1
	   wds[4] = 1
	   wds[8] = 1
	   wds[11] = "item.wdf"
	   wds[12] = 0x21838782
	   wds[13] = 0x21838782
	   wds[14] = 10000
	 elseif wd == "六级变身卡" then
	   wds[1] = "可以变化成对应的召唤兽，并附加特殊效果"
	   wds[2] = 12
	   wds[3] = 1
	   wds[4] = 1
	   wds[8] = 1
	   wds[11] = "item.wdf"
	   wds[12] = 0xF1C84EB5
	   wds[13] = 0xF1C84EB5
	   wds[14] = 10000
	 elseif wd == "七级变身卡" then
	   wds[1] = "可以变化成对应的召唤兽，并附加特殊效果"
	   wds[2] = 12
	   wds[3] = 1
	   wds[4] = 1
	   wds[8] = 1
	   wds[11] = "item.wdf"
	   wds[12] = 0xEFA4BA2C
	   wds[13] = 0xEFA4BA2C
	   wds[14] = 10000
	 elseif wd == "八级变身卡" then
	   wds[1] = "可以变化成对应的召唤兽，并附加特殊效果"
	   wds[2] = 12
	   wds[3] = 1
	   wds[4] = 1
	   wds[8] = 1
	   wds[11] = "item.wdf"
	   wds[12] = 0x2E030271
	   wds[13] = 0x2E030271
	   wds[14] = 10000
	-- 新增装备
	elseif wd == "乾坤帽" then
	    wds[1] = "天下名冠，暗藏乾坤玄机，有相当强的防御力"
	    wds[2] = 2
	    wds[3] = 1
	    wds[4] = 1
	    wds[5] = 70
	    wds[6] = "男"
	    wds[11] = "item.wdf"
	    wds[12] = 1272695123
	    wds[13] = 1771271296
	elseif wd == "黑魔冠" then
	    wds[1] = "魔王妖王常戴的冠帽，有相当强的防御力"
	    wds[2] = 2
	    wds[3] = 1
	    wds[4] = 1
	    wds[5] = 80
	    wds[6] = "男"
	    wds[11] = "item.wdf"
	    wds[12] = 685770468
	    wds[13] = 1237041059
	elseif wd == "白玉龙冠" then
	    wds[1] = "高贵雅致的冠帽，镶有上等白玉精雕之飞龙图案"
	    wds[2] = 2
	    wds[3] = 1
	    wds[4] = 1
	    wds[5] = 90
	    wds[6] = "男"
	    wds[11] = "item.wdf"
	    wds[12] = 4284490218
	    wds[13] = 1412110631
	elseif wd == "水晶夔帽" then
	    wds[1] = "其状如牛,苍色无角,一足能走,出入水即风雨,目光如日月,其声如雷,名曰夔。黄帝杀之,取皮以冒鼓,声闻五百里。”相传远古奇兽夔牛皮最终为一能工巧匠所得，辅以水晶玉石经上经千锤百炼雕琢编制而成一件冠帽。据传此帽拥有奇兽的庇佑，千年不坏"
	    wds[2] = 2
	    wds[3] = 1
	    wds[4] = 1
	    wds[5] = 100
	    wds[6] = "男"
	    wds[11] = "item.wdf"
	    wds[12] = 77382880
	    wds[13] = 2164041151
	elseif wd == "翡翠曜冠" then
	    wds[1] = "相传为三清之一灵宝天尊佩戴过的帽冠。七颗翡翠分别代表“日、月、火、水、金、木、土”环绕在玉石宝珠上。"
	    wds[2] = 2
	    wds[3] = 1
	    wds[4] = 1
	    wds[5] = 110
	    wds[6] = "男"
	    wds[11] = "item.wdf"
	    wds[12] = 482138369
	    wds[13] = 830308889
	elseif wd == "金丝黑玉冠" then
	    wds[1] = "远古盘古开天辟地，混沌初开时凝结而成的玉石雕琢而成的冠帽，充满着神奇的灵气。"
	    wds[2] = 2
	    wds[3] = 1
	    wds[4] = 1
	    wds[5] = 120
	    wds[6] = "男"
	    wds[11] = "item.wdf"
	    wds[12] = 1140741771
	    wds[13] = 948281107
	elseif wd == "白玉琉璃冠" then
	    wds[1] = "太上老君曾佩戴过的冠帽，用仙界白玉与琉璃珠辅以天丝编织而成。"
	    wds[2] = 2
	    wds[3] = 1
	    wds[4] = 1
	    wds[5] = 130
	    wds[6] = "男"
	    wds[11] = "item.wdf"
	    wds[12] = 778966943
	    wds[13] = 243238969
	elseif wd == "兽鬼珐琅面" then
	    wds[1] = "上古神魔所戴，虽经几千年，面具独角四周仍散发着神奇的魔力。"
	    wds[2] = 2
	    wds[3] = 1
	    wds[4] = 1
	    wds[5] = 140
	    wds[6] = "男"
	    wds[11] = "item.wdf"
	    wds[12] = 2310107289
	    wds[13] = 125393860
	elseif wd == "紫金磐龙冠" then
	    wds[1] = "火神遗留之物。冠上用金雕琢为吉龙盘云，四周散发着神奇的力量。需要有一定修为之人方能佩戴。"
	    wds[2] = 2
	    wds[3] = 1
	    wds[4] = 1
	    wds[5] = 150
	    wds[6] = "男"
	    wds[11] = "item.wdf"
	    wds[12] = 447473455
	    wds[13] = 3859378496
	elseif wd == "浑天玄火盔" then
	    wds[1] = "黄帝征伐四方之时所配战盔，刀枪不入，水火不侵，瘟邪难近，更添无尽战意。"
	    wds[2] = 2
	    wds[3] = 1
	    wds[4] = 1
	    wds[5] = 160
	    wds[6] = "男"
	    wds[11] = "item.wd1"
	    wds[12] = 3566352403
	    wds[13] = 1502470676
	-- 女帽
	elseif wd == "魔女发冠" then
	    wds[1] = "魔女们常带的头环，可以起到非常强的防御作用"
	    wds[2] = 2
	    wds[3] = 1
	    wds[4] = 1
	    wds[5] = 70
	    wds[6] = "女"
	    wds[11] = "item.wdf"
	    wds[12] = 2508308579
	    wds[13] = 845102994
	elseif wd == "七彩花环" then
	    wds[1] = "用七彩神花编成的花环，可以起到极强防御的作用"
	    wds[2] = 2
	    wds[3] = 1
	    wds[4] = 1
	    wds[5] = 80
	    wds[6] = "女"
	    wds[11] = "item.wdf"
	    wds[12] = 3183056480
	    wds[13] = 2570521405
	elseif wd == "凤翅金翎" then
	    wds[1] = "以凤翅和凤翎编织而成的金丝头环，有极强防御的作用"
	    wds[2] = 2
	    wds[3] = 1
	    wds[4] = 1
	    wds[5] = 90
	    wds[6] = "女"
	    wds[11] = "item.wdf"
	    wds[12] = 2373769150
	    wds[13] = 3600964026
	elseif wd == "寒雉霜蚕" then
	    wds[1] = "由寒玉以及蚕丝编制而成，相传为七仙女常戴之物"
	    wds[2] = 2
	    wds[3] = 1
	    wds[4] = 1
	    wds[5] = 100
	    wds[6] = "女"
	    wds[11] = "item.wdf"
	    wds[12] = 86765519
	    wds[13] = 42155348
	elseif wd == "曜月嵌星" then
	    wds[1] = "瑶池圣母所戴之物。冠上镶有七星宝珠环绕在月光石周围形成七星曜月的图案。"
	    wds[2] = 2
	    wds[3] = 1
	    wds[4] = 1
	    wds[5] = 110
	    wds[6] = "女"
	    wds[11] = "item.wdf"
	    wds[12] = 3373770544
	    wds[13] = 2683232345
	elseif wd == "郁金流苏簪" then
	    wds[1] = "白晶晶佩戴的发髻。白色玉石与金丝编织而成。"
	    wds[2] = 2
	    wds[3] = 1
	    wds[4] = 1
	    wds[5] = 120
	    wds[6] = "女"
	    wds[11] = "item.wdf"
	    wds[12] = 3156867369
	    wds[13] = 2529030399
	elseif wd == "玉翼附蝉翎" then
	    wds[1] = "嫦娥仙女佩戴过的帽冠。将月宫中玉石经千年雕琢而成，羽翼薄如蝉翼"
	    wds[2] = 2
	    wds[3] = 1
	    wds[4] = 1
	    wds[5] = 130
	    wds[6] = "女"
	    wds[11] = "item.wdf"
	    wds[12] = 678644164
	    wds[13] = 3321477618
	elseif wd == "鸾羽九凤冠" then
	    wds[1] = "九只五彩凤凰的羽翼与金丝编织而成的冠帽。"
	    wds[2] = 2
	    wds[3] = 1
	    wds[4] = 1
	    wds[5] = 140
	    wds[6] = "女"
	    wds[11] = "item.wdf"
	    wds[12] = 1580187502
	    wds[13] = 2242355262
	elseif wd == "金珰紫焰冠" then
	    wds[1] = "水神遗留之物。上古神兽凤凰羽翼制成的帽冠，四周散发着神奇的力量。需要有一定修为之人方能佩戴。"
	    wds[2] = 2
	    wds[3] = 1
	    wds[4] = 1
	    wds[5] = 150
	    wds[6] = "女"
	    wds[11] = "item.wdf"
	    wds[12] = 3789475693
	    wds[13] = 3128529272
	elseif wd == "乾元鸣凤冕" then
	    wds[1] = "有感于女娲造人之德，三界名匠合力铸造献上的帝王冠冕。五德齐聚，凤仪天下。"
	    wds[2] = 2
	    wds[3] = 1
	    wds[4] = 1
	    wds[5] = 160
	    wds[6] = "女"
	    wds[11] = "item.wd1"
	    wds[12] = 2064393561
	    wds[13] = 364230466
	-- 男衣
	elseif wd == "龙骨甲" then
	    wds[1] = "以龙骨制成的宝甲，有惊人的防御力"
	    wds[2] = 2
	    wds[3] = 4
	    wds[4] = 1
	    wds[5] = 70
	    wds[6] = "男"
	    wds[11] = "item.wdf"
	    wds[12] = 541785355
	    wds[13] = 1741806040
	elseif wd == "死亡斗篷" then
	    wds[1] = "魔王妖王梦寐以求的防具，非常有价值"
	    wds[2] = 2
	    wds[3] = 4
	    wds[4] = 1
	    wds[5] = 80
	    wds[6] = "男"
	    wds[11] = "item.wdf"
	    wds[12] = 1766901621
	    wds[13] = 1885524269
	elseif wd == "神谕披风" then
	    wds[1] = "受到神谕祝福的银色披风，带有灵动之气"
	    wds[2] = 2
	    wds[3] = 4
	    wds[4] = 1
	    wds[5] = 90
	    wds[6] = "男"
	    wds[11] = "item.wdf"
	    wds[12] = 1771196770
	    wds[13] = 1105958467
	elseif wd == "珊瑚玉衣" then
	    wds[1] = "相传为龙王所用铠甲，穿上后能获得仙界的庇护。"
	    wds[2] = 2
	    wds[3] = 4
	    wds[4] = 1
	    wds[5] = 100
	    wds[6] = "男"
	    wds[11] = "item.wdf"
	    wds[12] = 2065701734
	    wds[13] = 2474213076
	elseif wd == "金蚕披风" then
	    wds[1] = "由千年玉桑上的金蚕吐丝为材料缝制而成的衣甲，有极强的韧性。"
	    wds[2] = 2
	    wds[3] = 4
	    wds[4] = 1
	    wds[5] = 110
	    wds[6] = "男"
	    wds[11] = "item.wdf"
	    wds[12] = 2152164595
	    wds[13] = 1839718700
	elseif wd == "乾坤护心甲" then
	    wds[1] = "为道教流传的宝物，内有八卦乾坤玄机，能抵御极强的伤害。"
	    wds[2] = 2
	    wds[3] = 4
	    wds[4] = 1
	    wds[5] = 120
	    wds[6] = "男"
	    wds[11] = "item.wdf"
	    wds[12] = 3449582254
	    wds[13] = 3993401193
	elseif wd == "蝉翼金丝甲" then
	    wds[1] = "月宫桂树上的灵蝉身上的蝉翼辅以金丝编织而成的铠甲。绝非寻常仙家之物"
	    wds[2] = 2
	    wds[3] = 4
	    wds[4] = 1
	    wds[5] = 130
	    wds[6] = "男"
	    wds[11] = "item.wdf"
	    wds[12] = 3962403816
	    wds[13] = 60903505
	elseif wd == "金丝鱼鳞甲" then
	    wds[1] = "水神遗留之物。时隔千年，依然充满着灵气。"
	    wds[2] = 2
	    wds[3] = 4
	    wds[4] = 1
	    wds[5] = 140
	    wds[6] = "男"
	    wds[11] = "item.wdf"
	    wds[12] = 1521396689
	    wds[13] = 340629621
	elseif wd == "紫金磐龙甲" then
	    wds[1] = "相传为黄帝的遗物。紫金磐龙，四周散发着神奇的力量"
	    wds[2] = 2
	    wds[3] = 4
	    wds[4] = 1
	    wds[5] = 150
	    wds[6] = "男"
	    wds[11] = "item.wdf"
	    wds[12] = 400462349
	    wds[13] = 54627476
	elseif wd == "混元一气甲" then
	    wds[1] = "混元一气所凝成的宝甲，至坚不摧之物，可与天地同寿"
	    wds[2] = 2
	    wds[3] = 4
	    wds[4] = 1
	    wds[5] = 160
	    wds[6] = "男"
	    wds[11] = "item.wd1"
	    wds[12] = 1802888376
	    wds[13] = 3052290356
	-- 女衣
	elseif wd == "流云素裙" then
	    wds[1] = "相传是织女用流云织成的裙子，有很非常的防御力"
	    wds[2] = 2
	    wds[3] = 4
	    wds[4] = 1
	    wds[5] = 70
	    wds[6] = "女"
	    wds[11] = "item.wdf"
	    wds[12] = 3322971644
	    wds[13] = 1771157433
	elseif wd == "七宝天衣" then
	    wds[1] = "所谓天衣无缝，上有七宝华文，是可遇不可求的极品"
	    wds[2] = 2
	    wds[3] = 4
	    wds[4] = 1
	    wds[5] = 80
	    wds[6] = "女"
	    wds[11] = "item.wdf"
	    wds[12] = 4180182573
	    wds[13] = 4034456555
	elseif wd == "飞天羽衣" then
	    wds[1] = "相传以玉女飞天时所着衣装，受到天地精华的凝炼"
	    wds[2] = 2
	    wds[3] = 4
	    wds[4] = 1
	    wds[5] = 90
	    wds[6] = "女"
	    wds[11] = "item.wdf"
	    wds[12] = 2637194038
	    wds[13] = 1353325810
	elseif wd == "穰花翠裙" then
	    wds[1] = "翠玉宝珠装饰而成的镶花裙，为王母娘娘赏赐之物。"
	    wds[2] = 2
	    wds[3] = 4
	    wds[4] = 1
	    wds[5] = 100
	    wds[6] = "女"
	    wds[11] = "item.wdf"
	    wds[12] = 869673869
	    wds[13] = 1836280211
	elseif wd == "金蚕丝裙" then
	    wds[1] = "由千年玉桑上的金蚕吐丝为材料缝制而成的衣甲，有极强的韧性。"
	    wds[2] = 2
	    wds[3] = 4
	    wds[4] = 1
	    wds[5] = 110
	    wds[6] = "女"
	    wds[11] = "item.wdf"
	    wds[12] = 2107840682
	    wds[13] = 1711858998
	elseif wd == "紫香金乌裙" then
	    wds[1] = "汲取三界花魂而制成的裙子，穿上此裙香飘千里。"
	    wds[2] = 2
	    wds[3] = 4
	    wds[4] = 1
	    wds[5] = 120
	    wds[6] = "女"
	    wds[11] = "item.wdf"
	    wds[12] = 2898176567
	    wds[13] = 273903801
	elseif wd == "碧霞彩云衣" then
	    wds[1] = "收集了天界的碧霞五彩祥云编织而成的彩云衣，相传七仙女下凡时就是穿的这件。"
	    wds[2] = 2
	    wds[3] = 4
	    wds[4] = 1
	    wds[5] = 130
	    wds[6] = "女"
	    wds[11] = "item.wdf"
	    wds[12] = 1972600201
	    wds[13] = 2452196507
	elseif wd == "金丝蝉翼衫" then
	    wds[1] = "月宫桂树上的灵蝉身上的蝉翼，并取自瑶池的金丝，经仙界仙女七七四十九天编织而成的软甲"
	    wds[2] = 2
	    wds[3] = 4
	    wds[4] = 1
	    wds[5] = 140
	    wds[6] = "女"
	    wds[11] = "item.wdf"
	    wds[12] = 910126967
	    wds[13] = 2753459745
	elseif wd == "五彩凤翅衣" then
	    wds[1] = "相传女娲娘娘所穿。穿上此衣能得到上古神灵的庇佑"
	    wds[2] = 2
	    wds[3] = 4
	    wds[4] = 1
	    wds[5] = 150
	    wds[6] = "女"
	    wds[11] = "item.wdf"
	    wds[12] = 2784730653
	    wds[13] = 4139222799
	elseif wd == "鎏金浣月衣" then
	    wds[1] = "以日月光芒所织造的霞衣，对敌之时往往令其目眩神驰"
	    wds[2] = 2
	    wds[3] = 4
	    wds[4] = 1
	    wds[5] = 160
	    wds[6] = "女"
	    wds[11] = "item.wd1"
	    wds[12] = 1359780053
	    wds[13] = 2596354317
	-- 鞋子
	elseif wd == "九州履" then
	    wds[1] = "天下名履，有非常不错的防御力和速度"
	    wds[2] = 2
	    wds[3] = 6
	    wds[4] = 1
	    wds[5] = 70
	    wds[11] = "item.wdf"
	    wds[12] = 1192033620
	    wds[13] = 1060649976
	elseif wd == "万里追云履" then
	    wds[1] = "可在任何地形疾走的神履，有不错的防御力可在任何地形疾走的神履，有不错的防御力"
	    wds[2] = 2
	    wds[3] = 6
	    wds[4] = 1
	    wds[5] = 80
	    wds[11] = "item.wdf"
	    wds[12] = 2928326681
	    wds[13] = 1121748353
	elseif wd == "踏雪无痕" then
	    wds[1] = "包蓄地之灵气，穿之幻影如风，踏雪无痕"
	    wds[2] = 2
	    wds[3] = 6
	    wds[4] = 1
	    wds[5] = 90
	    wds[11] = "item.wdf"
	    wds[12] = 1140435077
	    wds[13] = 888533789
	elseif wd == "平步青云" then
	    wds[1] = "寻常仙界之物，穿上此靴可平步青云，借风云飞腾。"
	    wds[2] = 2
	    wds[3] = 6
	    wds[4] = 1
	    wds[5] = 100
	    wds[11] = "item.wdf"
	    wds[12] = 1930941353
	    wds[13] = 771313116
	elseif wd == "七星逐月靴" then
	    wds[1] = "天罡星所穿之靴。穿之及疾如风，三界之地任我遨游。"
	    wds[2] = 2
	    wds[3] = 6
	    wds[4] = 1
	    wds[5] = 130
	    wds[11] = "item.wdf"
	    wds[12] = 1623857733
	    wds[13] = 2763463360
	elseif wd == "碧霞流云履" then
	    wds[1] = "相传天界神匠以五彩天霞为材料，缝制而成的靴子。"
	    wds[2] = 2
	    wds[3] = 6
	    wds[4] = 1
	    wds[5] = 140
	    wds[11] = "item.wdf"
	    wds[12] = 3450927651
	    wds[13] = 1312286829
	elseif wd == "九州履" then
	    wds[1] = "相传是织女用流云织成的裙子，有很非常的防御力"
	    wds[2] = 2
	    wds[3] = 6
	    wds[4] = 1
	    wds[5] = 100
	    wds[11] = "item.wdf"
	    wds[12] = 1192033620
	    wds[13] = 1060649976
	elseif wd == "追云逐电" then
	    wds[1] = "相传为雷公电母经过千万年炼化而成，穿上后可以追逐云电，日行万里。"
	    wds[2] = 2
	    wds[3] = 6
	    wds[4] = 1
	    wds[5] = 110
	    wds[11] = "item.wdf"
	    wds[12] = 1149904553
	    wds[13] = 3062275612
	elseif wd == "乾坤天罡履" then
	    wds[1] = "相传为太上老君所穿。乃天地之气编织而成"
	    wds[2] = 2
	    wds[3] = 6
	    wds[4] = 1
	    wds[5] = 120
	    wds[11] = "item.wdf"
	    wds[12] = 1238537463
	    wds[13] = 2413633901
	elseif wd == "金丝逐日履" then
	    wds[1] = "相传神匠为纪念夸父特造此靴。穿上可追逐太阳，风云皆抛于脑后"
	    wds[2] = 2
	    wds[3] = 6
	    wds[4] = 1
	    wds[5] = 150
	    wds[11] = "item.wdf"
	    wds[12] = 967718944
	    wds[13] = 2734810061
	elseif wd == "辟尘分光履" then
	    wds[1] = "上古秘宝，着此履者可于星尘间穿梭，与霞光相竞逐"
	    wds[2] = 2
	    wds[3] = 6
	    wds[4] = 1
	    wds[5] = 160
	    wds[11] = "item.wd1"
	    wds[12] = 2907023969
	    wds[13] = 3418242860
	-- 腰带
	elseif wd == "乱牙咬" then
	    wds[1] = "神铁制的腰箍，能起到较强的防御作用"
	    wds[2] = 2
	    wds[3] = 5
	    wds[4] = 1
	    wds[5] = 50
	    wds[11] = "item.wdf"
	    wds[12] = 4081289026
	    wds[13] = 1830358071
	elseif wd == "魔童大牙" then
	    wds[1] = "巨大的魔牙，系在腰间能起到极强的防御作用"
	    wds[2] = 2
	    wds[3] = 5
	    wds[4] = 1
	    wds[5] = 50
	    wds[11] = "item.wdf"
	    wds[12] = 3917101017
	    wds[13] = 246498213
	elseif wd == "攫魂铃" then
	    wds[1] = "来自阴间的魔铃，佩在腰间，能起到极强的防御作用"
	    wds[2] = 2
	    wds[3] = 5
	    wds[4] = 1
	    wds[5] = 60
	    wds[11] = "item.wdf"
	    wds[12] = 3503405586
	    wds[13] = 4282767598
	elseif wd == "双魂引" then
	    wds[1] = "来自阴间的宝物，可以佩在腰间，能起到极强的防御作用"
	    wds[2] = 2
	    wds[3] = 5
	    wds[4] = 1
	    wds[5] = 60
	    wds[11] = "item.wdf"
	    wds[12] = 3493684718
	    wds[13] = 2691281237
	elseif wd == "兽王腰带" then
	    wds[1] = "兽王曾使用过的腰饰，能起到较强的防御作用"
	    wds[2] = 2
	    wds[3] = 5
	    wds[4] = 1
	    wds[5] = 70
	    wds[11] = "item.wdf"
	    wds[12] = 2946790593
	    wds[13] = 281570977
	elseif wd == "百窜云" then
	    wds[1] = "神秘的缎带，系在腰间能起到较强的防御作用"
	    wds[2] = 2
	    wds[3] = 5
	    wds[4] = 1
	    wds[5] = 70
	    wds[11] = "item.wdf"
	    wds[12] = 1956418448
	    wds[13] = 457288512
	elseif wd == "八卦锻带" then
	    wds[1] = "暗藏八卦玄机的腰带，能起到极强的防御作用"
	    wds[2] = 2
	    wds[3] = 5
	    wds[4] = 1
	    wds[5] = 80
	    wds[11] = "item.wdf"
	    wds[12] = 4238438306
	    wds[13] = 3676875648
	elseif wd == "圣王坠" then
	    wds[1] = "相传为Saber的缠腰带,不如被谁偷走了,流入市场."
	    wds[2] = 2
	    wds[3] = 5
	    wds[4] = 1
	    wds[5] = 80
	    wds[11] = "item.wdf"
	    wds[12] = 4161518362
	    wds[13] = 2601988852
	elseif wd == "幻彩玉带" then
	    wds[1] = "以集天界灵气之幻彩宝玉制成，有强大的护佑作用"
	    wds[2] = 2
	    wds[3] = 5
	    wds[4] = 1
	    wds[5] = 90
	    wds[11] = "item.wdf"
	    wds[12] = 2383008893
	    wds[13] = 871942394
	elseif wd == "珠翠玉环" then
	    wds[1] = "集合千年地气生出的翡翠宝珠雕琢而成的腰带，有强大的庇佑作用"
	    wds[2] = 2
	    wds[3] = 5
	    wds[4] = 1
	    wds[5] = 100
	    wds[11] = "item.wdf"
	    wds[12] = 4092702542
	    wds[13] = 4023277032
	elseif wd == "金蟾含珠" then
	    wds[1] = "相传“蟾”能口吐金钱为旺财之物。由金身蟾口含夜光珠再辅以金丝编织而成的腰带，世间少有，绝非人界之物"
	    wds[2] = 2
	    wds[3] = 5
	    wds[4] = 1
	    wds[5] = 110
	    wds[11] = "item.wdf"
	    wds[12] = 1436553780
	    wds[13] = 415633459
	elseif wd == "乾坤紫玉带" then
	    wds[1] = "千年紫玉雕琢而成的腰带，相传为道家失传的宝物，有极强的庇佑作用"
	    wds[2] = 2
	    wds[3] = 5
	    wds[4] = 1
	    wds[5] = 120
	    wds[11] = "item.wdf"
	    wds[12] = 1070699611
	    wds[13] = 885196883
	elseif wd == "琉璃寒玉带" then
	    wds[1] = "天界银河之水经亿万年凝结而成的玉石制成的腰带，不为寻常仙物"
	    wds[2] = 2
	    wds[3] = 5
	    wds[4] = 1
	    wds[5] = 130
	    wds[11] = "item.wdf"
	    wds[12] = 761737729
	    wds[13] = 290193038
	elseif wd == "蝉翼鱼佩带" then
	    wds[1] = "月宫桂树上的灵蝉身上的蝉翼以及金丝编织而成的腰带，所散发出来的灵气能抵御极强的伤害。"
	    wds[2] = 2
	    wds[3] = 5
	    wds[4] = 1
	    wds[5] = 140
	    wds[11] = "item.wdf"
	    wds[12] = 1344450765
	    wds[13] = 2406174850
	elseif wd == "磐龙凤翔带" then
	    wds[1] = "远古天神遗物，龙飞凤舞呈吉祥之态，佩戴起来能受到上古神兽的庇护。"
	    wds[2] = 2
	    wds[3] = 5
	    wds[4] = 1
	    wds[5] = 150
	    wds[11] = "item.wdf"
	    wds[12] = 2563450676
	    wds[13] = 4015638612
	elseif wd == "紫霄云芒带" then
	    wds[1] = "以云霞束起雷电所制成的腰带，会散发出闪电自行防御来袭的攻击。"
	    wds[2] = 2
	    wds[3] = 5
	    wds[4] = 1
	    wds[5] = 160
	    wds[11] = "item.wd1"
	    wds[12] = 2824149864
	    wds[13] = 2230161080
	-- 饰品
	elseif wd == "碧水青龙" then
	    wds[1] = "龙形环状可戴在项部，有相当的法力作用"
	    wds[2] = 2
	    wds[3] = 2
	    wds[4] = 1
	    wds[5] = 70
	    wds[11] = "item.wdf"
	    wds[12] = 2761659977
	    wds[13] = 4002371974
	elseif wd == "鬼牙攫魂" then
	    wds[1] = "来自阴间的饰物，佩带在身上有较强的法力作用"
	    wds[2] = 2
	    wds[3] = 2
	    wds[4] = 1
	    wds[5] = 70
	    wds[11] = "item.wdf"
	    wds[12] = 3973878954
	    wds[13] = 2356109296
	elseif wd == "万里卷云" then
	    wds[1] = "据说是大禹留下的宝物，佩带在身上有极强的法力作用"
	    wds[2] = 2
	    wds[3] = 2
	    wds[4] = 1
	    wds[5] = 80
	    wds[11] = "item.wdf"
	    wds[12] = 2814775714
	    wds[13] = 3789092586
	elseif wd == "疾风之铃" then
	    wds[1] = "来历不详的神秘饰物，佩带在身上有极强的法力作用"
	    wds[2] = 2
	    wds[3] = 2
	    wds[4] = 1
	    wds[5] = 80
	    wds[11] = "item.wdf"
	    wds[12] = 1790391367
	    wds[13] = 3931720117
	elseif wd == "七彩玲珑" then
	    wds[1] = "串有七彩玲珑的珍珠，集海之灵气，给予佩戴者祥瑞祝福"
	    wds[2] = 2
	    wds[3] = 2
	    wds[4] = 1
	    wds[5] = 90
	    wds[11] = "item.wdf"
	    wds[12] = 61182840
	    wds[13] = 1790107582
	elseif wd == "黄玉琉佩" then
	    wds[1] = "女娲补天遗留下的神石雕琢而成，拥有神奇的灵力。"
	    wds[2] = 2
	    wds[3] = 2
	    wds[4] = 1
	    wds[5] = 100
	    wds[11] = "item.wdf"
	    wds[12] = 4273718431
	    wds[13] = 3596201129
	elseif wd == "鸾飞凤舞" then
	    wds[1] = "仙界仙女们常佩之物。呈祥瑞和平之气，定能给佩戴者带来好运。"
	    wds[2] = 2
	    wds[3] = 2
	    wds[4] = 1
	    wds[5] = 110
	    wds[11] = "item.wdf"
	    wds[12] = 234019286
	    wds[13] = 805892737
	elseif wd == "衔珠金凤佩" then
	    wds[1] = "相传曾为嫦娥仙子佩戴之物。此物寓示着美好的追求与向往。"
	    wds[2] = 2
	    wds[3] = 2
	    wds[4] = 1
	    wds[5] = 120
	    wds[11] = "item.wdf"
	    wds[12] = 1808237370
	    wds[13] = 1175473770
	elseif wd == "七璜珠玉佩" then
	    wds[1] = "以七个天珠以及天丝编制而成的坠子。集天地之灵气，能给予佩戴者吉祥如意。"
	    wds[2] = 2
	    wds[3] = 2
	    wds[4] = 1
	    wds[5] = 130
	    wds[11] = "item.wdf"
	    wds[12] = 150576745
	    wds[13] = 3350488882
	elseif wd == "鎏金点翠佩" then
	    wds[1] = "玉皇大帝平常佩戴之物，集合了仙界之力，给予佩戴者神奇的魔力。"
	    wds[2] = 2
	    wds[3] = 2
	    wds[4] = 1
	    wds[5] = 140
	    wds[11] = "item.wdf"
	    wds[12] = 91896384
	    wds[13] = 2019827339
	elseif wd == "紫金碧玺佩" then
	    wds[1] = "上古神兽遗留之物。四颗碧玉珠似乎依附着神奇的魔力。"
	    wds[2] = 2
	    wds[3] = 2
	    wds[4] = 1
	    wds[5] = 150
	    wds[11] = "item.wdf"
	    wds[12] = 782330888
	    wds[13] = 2103726062
	elseif wd == "落霞陨星坠" then
	    wds[1] = "以陨落的星辰制成的宝玉，带有莫名的灵气与能量。"
	    wds[2] = 2
	    wds[3] = 2
	    wds[4] = 1
	    wds[5] = 160
	    wds[11] = "item.wd1"
	    wds[12] = 4104259920
	    wds[13] = 1986550511
	-- 新增灵饰
	elseif wd == "翠叶环" then
		wds[1] = "以翠色欲滴的嫩叶为耳饰，似乎可见盎然春意。"
		wds[2] = 2
		wds[3] = 10
		wds[4] = 1
		wds[5] = 60
	    wds[11] = "item.wd1"
	    wds[12] = 0x447CB949
	    wds[13] = 0x841B1A0B
	elseif wd == "明月珰" then
		wds[1] = "珍珠如明月，盈盈有辉光；故名为明月珰。"
		wds[2] = 2
		wds[3] = 10
		wds[4] = 1
		wds[5] = 80
	    wds[11] = "item.wd1"
	    wds[12] = 0xD99DA265
	    wds[13] = 0xED4BFC24
	elseif wd == "玉蝶翩" then
		wds[1] = "彩蝶成双，翩然而舞；有双蝶偶然停驻于灵泉之畔，感其气息，化而为此玉饰。"
		wds[2] = 2
		wds[3] = 10
		wds[4] = 1
		wds[5] = 100
	    wds[11] = "item.wd1"
	    wds[12] = 0xDC6E80FB
	    wds[13] = 0x0890D479
	elseif wd == "点星芒" then
		wds[1] = "福禄寿三星以自身星芒点化而成的异石，紫芒莹然，贵不可言。"
		wds[2] = 2
		wds[3] = 10
		wds[4] = 1
		wds[5] = 120
	    wds[11] = "item.wd1"
	    wds[12] = 0x97353053
	    wds[13] = 0x718C161F
	elseif wd == "凤羽流苏" then
		wds[1] = "灵凤舞九霄，振翼遗金羽；仙人偶得，以火元培之、以仙气养之，又缀以流苏，成一耳饰。静心而听，有凤鸣隐隐，奏大道之声。"
		wds[2] = 2
		wds[3] = 10
		wds[4] = 1
		wds[5] = 140
	    wds[11] = "item.wd1"
	    wds[12] = 0x32534D07
	    wds[13] = 0xC855E37F
	elseif wd == "焰云霞珠" then
		wds[1] = "后羿射日，十去其九；三足金乌之血化为丹霞，灼烈而烧，火光冲天。许久之后，其血方凝为此珠，赤光熠然。"
		wds[2] = 2
		wds[3] = 10
		wds[4] = 1
		wds[5] = 160
	    wds[11] = "item.wd1"
	    wds[12] = 0xED104336
	    wds[13] = 0xF36D99FC
	--
	elseif wd == "芝兰佩" then
		wds[1] = "玉树芝兰生于其中，良才美质现于其外。"
		wds[2] = 2
		wds[3] = 11
		wds[4] = 2
		wds[5] = 60
	    wds[11] = "item.wd1"
	    wds[12] = 0xE07ABFDD
	    wds[13] = 0x0B70B0FC
	elseif wd == "逸云佩" then
		wds[1] = "飘逸如云，洒脱如风；君子之行也。"
		wds[2] = 2
		wds[3] = 11
		wds[4] = 2
		wds[5] = 80
	    wds[11] = "item.wd1"
	    wds[12] = 0x44B729A2
	    wds[13] = 0x8B0683BC
	elseif wd == "莲音玦" then
		wds[1] = "仙池清莲所化的玉玦，隐隐可闻其中仙音缭绕，长佩于身，有助修行。"
		wds[2] = 2
		wds[3] = 11
		wds[4] = 2
		wds[5] = 100
	    wds[11] = "item.wd1"
	    wds[12] = 0x09A1563F
	    wds[13] = 0x9AD70885
	elseif wd == "相思染" then
		wds[1] = "一寸相思一寸灰，牛郎织女分离之时滴落相思血泪，遇相思灰而化为鸳鸯之形，故名为“相思染”。"
		wds[2] = 2
		wds[3] = 11
		wds[4] = 2
		wds[5] = 120
	    wds[11] = "item.wd1"
	    wds[12] = 0x59D5C544
	    wds[13] = 0x3AB4C90B
	elseif wd == "玄龙苍珀" then
		wds[1] = "潜龙出世，纵情一啸，声震凌霄宝殿；玉帝罪之，命天将封其龙气入苍珀之中，以为惩罚；又将玄龙苍珀送入红尘，以待有缘人。"
		wds[2] = 2
		wds[3] = 11
		wds[4] = 2
		wds[5] = 140
	    wds[11] = "item.wd1"
	    wds[12] = 0x20FA6A66
	    wds[13] = 0x5E226429
	elseif wd == "碧海青天" then
		wds[1] = "鲲鹏破海而出，水浪滔天，排空怒卷；其化形之蜕则凝为一明玉，聚海中灵气而成奇宝，名曰“碧海青天”。"
		wds[2] = 2
		wds[3] = 11
		wds[4] = 2
		wds[5] = 160
	    wds[11] = "item.wd1"
	    wds[12] = 0x91E363E8
	    wds[13] = 0xBB4BFFCB
	--
	elseif wd == "枫华戒" then
		wds[1] = "以红枫饰于梧桐木上，炼以为戒。"
		wds[2] = 2
		wds[3] = 12
		wds[4] = 3
		wds[5] = 60
	    wds[11] = "item.wd1"
	    wds[12] = 0x8245870F
	    wds[13] = 0xBB24BAC3
	elseif wd == "芙蓉戒" then
		wds[1] = "涉江采芙蓉，饰于白玉之上，是为芙蓉戒。"
		wds[2] = 2
		wds[3] = 12
		wds[4] = 3
		wds[5] = 80
	    wds[11] = "item.wd1"
	    wds[12] = 0x9D1BB8EC
	    wds[13] = 0x4694CB26
	elseif wd == "金麟绕" then
		wds[1] = "金麒麟之影投于其上，使得此戒有护主之能，故名之“金麟绕”。"
		wds[2] = 2
		wds[3] = 12
		wds[4] = 3
		wds[5] = 100
	    wds[11] = "item.wd1"
	    wds[12] = 0x629A6E47
	    wds[13] = 0x33446FE4
	elseif wd == "悦碧水" then
		wds[1] = "智者乐水，观音于水边有所悟，故以佛力凝碧水以为戒。迎光观之，清波荡漾。"
		wds[2] = 2
		wds[3] = 12
		wds[4] = 3
		wds[5] = 120
	    wds[11] = "item.wd1"
	    wds[12] = 0x81A29179
	    wds[13] = 0x92E3D4EB
	elseif wd == "九曜光华" then
		wds[1] = "九曜星君为谢王母娘娘蟠桃会之请，特凝聚九曜光华，成此宝戒；戒中聚星辰之力，华彩耀目，仙气袅然。"
		wds[2] = 2
		wds[3] = 12
		wds[4] = 3
		wds[5] = 140
	    wds[11] = "item.wd1"
	    wds[12] = 0x3EC26F1F
	    wds[13] = 0x215BBE3E
	elseif wd == "太虚渺云" then
		wds[1] = "九霄云气飘渺无踪，自在逍遥；太上老君采撷七七四十九缕云气，以道法凝练九九八十一回，终成此戒，名为“太虚渺云”。"
		wds[2] = 2
		wds[3] = 12
		wds[4] = 3
		wds[5] = 160
	    wds[11] = "item.wd1"
	    wds[12] = 0x86693F55
	    wds[13] = 0xC416CB3D
	--
	elseif wd == "香木镯" then
		wds[1] = "楠木所制，可辟邪护身。"
		wds[2] = 2
		wds[3] = 13
		wds[4] = 4
		wds[5] = 60
	    wds[11] = "item.wd1"
	    wds[12] = 0x5B5A5A7B
	    wds[13] = 0xBA5B693B
	elseif wd == "翡玉镯" then
		wds[1] = "山灵水秀，方出璞石；翡玉镯以翡翠打造而成，自有光华。"
		wds[2] = 2
		wds[3] = 13
		wds[4] = 4
		wds[5] = 80
	    wds[11] = "item.wd1"
	    wds[12] = 0x59E948D9
	    wds[13] = 0x243475F0
	elseif wd == "墨影扣" then
		wds[1] = "仙人绘山水，留影玉石中；巧匠采墨影仙石制为手镯，形制奇巧，内蕴仙力。"
		wds[2] = 2
		wds[3] = 13
		wds[4] = 4
		wds[5] = 100
	    wds[11] = "item.wd1"
	    wds[12] = 0xFF46F65C
	    wds[13] = 0xCF27B111
	elseif wd == "花映月" then
		wds[1] = "嫦娥于广寒宫内观月照花、花映月，思念人间冷暖，故凝月华而成此手镯。"
		wds[2] = 2
		wds[3] = 13
		wds[4] = 4
		wds[5] = 120
	    wds[11] = "item.wd1"
	    wds[12] = 0x39BFA707
	    wds[13] = 0x9630B1CE
	elseif wd == "金水菩提" then
		wds[1] = "佛于西天观芸芸众生，有感于凡间诸般喜怒哀乐，故以纯净佛力凝为金水菩提，愿渡红尘之苦。佩戴此镯者，可得佛力为护，趋吉避凶。"
		wds[2] = 2
		wds[3] = 13
		wds[4] = 4
		wds[5] = 140
	    wds[11] = "item.wd1"
	    wds[12] = 0xD7A907DD
	    wds[13] = 0xCF3E45BF
	elseif wd == "浮雪幻音" then
		wds[1] = "混沌初开，天地生成；其时也，有初生霜雪自天而降。此雪遇混沌清气后凝而不化，成一奇物，静听则有天地玄音。"
		wds[2] = 2
		wds[3] = 13
		wds[4] = 4
		wds[5] = 160
	    wds[11] = "item.wd1"
	    wds[12] = 0xB2326701
	    wds[13] = 0xFB5EEB41
	-- 增加锦衣
	elseif wd == "华风汉雅" then
		wds[1] = "越罗衫袂迎春风，玉刻麒麟腰带红。绣罗衣裳华风曲，汉雅无双真国色（有战斗锦衣）。#Y/（增加1000气血）"
		wds[2] = 2
		wds[3] = 15
		wds[4] = 1
		wds[5] = 60
	    wds[11] = "item.wdf"
	    wds[12] = 0xFFED8415
	    wds[13] = 0xFFED8416
	elseif wd == "萌萌小厨" then
		wds[1] = "如鬼魅般隐藏在夜色之中，出其不意给予敌方致命一击（有战斗锦衣）。#Y/（增加1000气血）"
		wds[2] = 2
		wds[3] = 15
		wds[4] = 1
		wds[5] = 60
	    wds[11] = "item.wdf"
	    wds[12] = 0xFFED8418
	    wds[13] = 0xFFED8417
	elseif wd == "夜影" then
		wds[1] = "如鬼魅般隐藏在夜色之中，出其不意给予敌方致命一击（有战斗锦衣）。#Y/（增加1000气血）"
		wds[2] = 2
		wds[3] = 15
		wds[4] = 1
		wds[5] = 60
	    wds[11] = "item.wdf"
	    wds[12] = 0xFFED8420
	    wds[13] = 0xFFED8419
	elseif wd == "夏日清凉" then
		wds[1] = "夏日专属的清凉套装，穿着上，一起享受美好的夏日时光（有战斗锦衣）。#Y/（增加1000气血）"
		wds[2] = 2
		wds[3] = 15
		wds[4] = 1
		wds[5] = 60
	    wds[11] = "item.wdf"
	    wds[12] = 0xFFED8421
	    wds[13] = 0xFFED8422
	elseif wd == "碧华锦凝雪" then
		wds[1] = "瑰梦溢彩碧华锦，寒霜凌雪晓星沉。西牛贺洲贡天庭碧水缎一匹，其色宛若碧水，金线铺就绮罗。织女采数九寒天凌雪霜，缀碧水缎之上，星落寒月，耀世夺目。#Y/（增加1000气血）"
		wds[2] = 2
		wds[3] = 15
		wds[4] = 1
		wds[5] = 60
	    wds[11] = "item.wdf"
	    wds[12] = 0xFFED8424
	    wds[13] = 0xFFED8423
	elseif wd == "冰灵蝶翼·月笼沙" then
        wds[1] = "夏日绮梦，雪浪淘纱。情深似海翻澜起，心悦君兮浪淘纱。织女素手织就浪淘纱，大浪淘纱，海枯石烂，此情不泯。#Y/（增加1000气血）"
        wds[2] = 2
        wds[3] =15
        wds[4] = 1
        wds[11] = "xzsc.wdf"
        wds[5] = 60
        wds[12] = 0xEEBBCA09
        wds[13] = 0xEEBBCA10
    elseif wd == "浪淘纱·月白" then
        wds[1] = "夏日绮梦，雪浪淘纱。情深似海翻澜起，心悦君兮浪淘纱。织女素手织就浪淘纱，大浪淘纱，海枯石烂，此情不泯。#Y/（增加1000气血）"
        wds[2] = 2
        wds[3] =15
        wds[4] = 1
        wds[11] = "xzsc.wdf"
        wds[5] = 60
        wds[12] = 0xEEBBCA03
        wds[13] = 0xEEBBCA04
    elseif wd == "齐天大圣" then
        wds[1] = "金甲玄绫慑九霄，降妖除魔显神通。穿上齐天大圣锦衣，心有热血，我便齐天！#Y/（增加1000气血）"
        wds[2] = 2
        wds[3] =15
        wds[4] = 1
        wds[11] = "xzsc.wdf"
        wds[5] = 60
        wds[12] = 0xEEBBCA19
        wds[13] = 0xEEBBCA20
    elseif wd == "冰雪玉兔" then
        wds[1] = "冬日雪花飘飘，穿上冰雪玉兔，化身为冰雪伶俐活泼可爱的小兔子和小伙伴们一起嬉戏玩耍吧！#Y/（增加1000气血）"
        wds[2] = 2
        wds[3] =15
        wds[4] = 1
        wds[11] = "xzsc.wdf"
        wds[5] = 60
        wds[12] = 0xEEBBCA23
        wds[13] = 0xEEBBCA24
    elseif wd == "驭龙猎手" then
        wds[1] = "驭龙行天下，驰光耀千里。#Y/（增加1000气血）"
        wds[2] = 2
        wds[3] =15
        wds[4] = 1
        wds[11] = "xzsc.wdf"
        wds[5] = 60
        wds[12] = 0xEEBBCA17
        wds[13] = 0xEEBBCA18
    elseif wd == "锦绣幻梦" then
        wds[1] = "春宵夜沉，一尚服局女官于梦中魂游，至不知何处仙境。仙境中男女未着锦衣华服、未戴玉镯金钗，打扮却别具一格，夺人耳目。女官魂归后遂作图纸，令人仿制之。#Y/（增加1000气血）"
        wds[2] = 2
        wds[3] =15
        wds[4] = 1
        wds[11] = "xzsc.wdf"
        wds[5] = 60
        wds[12] = 0xEEBBCA25
        wds[13] = 0xEEBBCA26
    elseif wd == "纤云纱·墨黑" then
        wds[1] = "纤云浮光纱织就，金风玉露情缘深。织女素手织就，着其在身，便如金风玉露一相逢，胜却那人间无数。#Y/（增加1000气血）"
        wds[2] = 2
        wds[3] =15
        wds[4] = 1
        wds[11] = "xzsc.wdf"
        wds[5] = 60
        wds[12] = 0xEEBBCA15
        wds[13] = 0xEEBBCA16
    elseif wd == "蜜蜂嗡嗡" then
        wds[1] = "穿花度柳飞如箭，粘絮寻香似落星。小小微躯能负重，器器薄翅会乘风。穿上可爱的蜜蜂嗡嗡，一起化身小蜜蜂嬉闹玩耍吧！#Y/（增加1000气血）"
        wds[2] = 2
        wds[3] =15
        wds[4] = 1
        wds[11] = "xzsc.wdf"
        wds[5] = 60
        wds[12] = 0xEEBBCA11
        wds[13] = 0xEEBBCA12
    elseif wd == "铃儿叮当" then
        wds[1] = "穿过大风雪，我们坐在雪橇上。飞奔过田野，我们欢笑又歌唱。小鹿儿铃声响，令人心欢畅，滑雪快乐多，铃儿响叮当。#Y/（增加1000气血）"
        wds[2] = 2
        wds[3] =15
        wds[4] = 1
        wds[11] = "xzsc.wdf"
        wds[5] = 60
        wds[12] = 0xEEBBCA31
        wds[13] = 0xEEBBCA32
    elseif wd == "尖叫男爵" then
        wds[1] = "大唐盛世年间，海外有异域来贺。恰逢异域朝邦圣夜来临，异域人士纷纷穿着庆典礼服庆贺万圣节临。长安织造观之颇为有趣，趁此异域番邦节日之时，织就一批异域礼服。#Y/（增加1000气血）"
        wds[2] = 2
        wds[3] =15
        wds[4] = 1
        wds[11] = "xzsc.wdf"
        wds[5] = 60
        wds[12] = 0xEEBBCA29
        wds[13] = 0xEEBBCA30
    elseif wd == "顽皮小恶魔" then
        wds[1] = "顽皮可爱好逗趣，童心未泯小恶魔。穿上这身顽皮小恶魔，在海外传来的奇特节日里和伙伴们一起玩耍吧！#Y/（增加1000气血）"
        wds[2] = 2
        wds[3] =15
        wds[4] = 1
        wds[11] = "xzsc.wdf"
        wds[5] = 60
        wds[12] = 0xEEBBCA21
        wds[13] = 0xEEBBCA22
    elseif wd == "夜之孤煞" then
        wds[1] = "穿花蛱蝶深深见，点水蜻蜓款款飞。蝶翼做衣，比翼双飞。#Y/（增加1000气血）"
        wds[2] = 2
        wds[3] =15
        wds[4] = 1
        wds[11] = "xzsc.wdf"
        wds[5] = 60
        wds[12] = 0xEEBBCA37
        wds[13] = 0xEEBBCA38
   elseif wd == "萌狮闹春" then
        wds[1] = "春暖花开，万物复苏。穿上萌狮闹春，化身为一只可爱的小狮子，一起在草地卖萌打滚，共度春日好时光。#Y/（增加1000气血）"
        wds[2] = 2
        wds[3] =15
        wds[4] = 1
        wds[11] = "xzsc.wdf"
        wds[5] = 60
        wds[12] = 0xEEBBCA35
        wds[13] = 0xEEBBCA36

    elseif wd == "竹林熊猫" then
        wds[1] = "翠翠绿竹随风摇，憨憨熊猫笑声扬。身着憨态可掬的熊猫锦衣，在三界尽情的畅快逍遥吧！#Y/（增加1000气血）"
        wds[2] = 2
        wds[3] =15
        wds[4] = 1
        wds[11] = "xzsc.wdf"
        wds[5] = 60
        wds[12] = 0xEEBBCA27
        wds[13] = 0xEEBBCA28

    elseif wd == "雁翎银钩·月笼沙" then
        wds[1] = "金凤翎，寒银钩，云山锦，飒爽风姿动风雷，少年意气薄云天！#Y/（增加1000气血）"
        wds[2] = 2
        wds[3] =15
        wds[4] = 1
        wds[11] = "xzsc.wdf"
        wds[5] = 60
        wds[12] = 0xEEBBCA07
        wds[13] = 0xEEBBCA08
    elseif wd == "萤雪轻裘" then
        wds[1] = "萤雪微霜寒，早春轻裘暖。细雨纷飞，正是春寒料峭时节，着萤雪轻裘在身，如暖阳在抱沁人心脾。#Y/（增加1000气血）"
        wds[2] = 2
        wds[3] =15
        wds[4] = 1
        wds[11] = "xzsc.wdf"
        wds[5] = 60
        wds[12] = 0xEEBBCA13
        wds[13] = 0xEEBBCA14
    elseif wd == "重溟软甲" then
        wds[1] = "碧墨深染英裘，缀以软甲银胄。传闻秘术大师于北溟的一个潮汐之夜，凝聚重溟之力制此软甲。#Y/（增加1000气血）"
        wds[2] = 2
        wds[3] =15
        wds[4] = 1
        wds[11] = "xzsc.wdf"
        wds[5] = 60
        wds[12] = 0xEEBBCA01
        wds[13] = 0xEEBBCA02




	-- 足印
	elseif wd == "浩瀚星河" then
		wds[1] = "天河夜转漂回星,银浦流云学水声。#Y/加100防御"
		wds[2] = 2
		wds[3] = 16
		wds[4] = 2
		wds[5] = 60
	    wds[11] = "WP1.dll"
	    wds[12] = 0x4DEE1719
	    wds[13] = 0x7DF7F4C3
	elseif wd == "烈焰澜翻" then
		wds[1] = "烈焰澜翻为说时，百千诸佛尽攒眉。#Y/加100防御"
		wds[2] = 2
		wds[3] = 16
		wds[4] = 2
		wds[5] = 60
	    wds[11] = "WP1.dll"
	    wds[12] = 0xB585CF35
	    wds[13] = 0xFBBA047B
	elseif wd == "双鲤寄情" then
		wds[1] = "鸿雁在云鱼在水，惆怅此情难寄。#Y/加100防御"
		wds[2] = 2
		wds[3] = 16
		wds[4] = 2
		wds[5] = 60
	    wds[11] = "WP1.dll"
	    wds[12] = 0x81E3D00A
	    wds[13] = 0x48A7F40C
	elseif wd == "凌波微步" then
		wds[1] = "体迅飞凫，飘忽若神。凌波微步，罗袜生尘。#Y/加100防御"
		wds[2] = 2
		wds[3] = 16
		wds[4] = 2
		wds[5] = 60
	    wds[11] = "WP1.dll"
	    wds[12] = 0xF2D53378
	    wds[13] = 0x6E786275
	elseif wd == "水墨游龙" then
		wds[1] = "翩若惊鸿，婉若游龙。#Y/加100防御"
		wds[2] = 2
		wds[3] = 16
		wds[4] = 2
		wds[5] = 60
	    wds[11] = "WP1.dll"
	    wds[12] = 0x3AA1A218
	    wds[13] = 0x61053102
	elseif wd == "星光熠熠" then
		wds[1] = "天接云涛连晓雾，星河欲转千帆舞。#Y/加100防御"
		wds[2] = 2
		wds[3] = 16
		wds[4] = 2
		wds[5] = 60
	    wds[11] = "WP1.dll"
	    wds[12] = 0xC72D37F6
	    wds[13] = 0xED812000
	elseif wd == "荷塘涟漪" then
		wds[1] = "池面风来波潋潋,波间露下叶田田。#Y/加100防御"
		wds[2] = 2
		wds[3] = 16
		wds[4] = 2
		wds[5] = 60
	    wds[11] = "WP1.dll"
	    wds[12] = 0x9597FC1F
	    wds[13] = 0x4906ED3E
	elseif wd == "雪花飘落" then
		wds[1] = "白雪却嫌春色晚,故穿庭树作飞花。#Y/加100防御"
		wds[2] = 2
		wds[3] = 16
		wds[4] = 2
		wds[5] = 60
	    wds[11] = "WP1.dll"
	    wds[12] = 0x00000011
	    wds[13] = 0x00000012
	-- elseif wd == "桃花飞舞" then
	-- 	wds[1] = "桃花流水暮然去,别有天地非人间。"
	-- 	wds[2] = 2
	-- 	wds[3] = 16
	-- 	wds[4] = 2
	-- 	wds[5] = 60
	--     wds[11] = "WP1.dll"
	--     wds[12] = 0x00000007
	--     wds[13] = 0x00000008
	elseif wd == "月影婆娑" then
		wds[1] = "今人不见古时月,今月曾经照古人。#Y/加100防御"
		wds[2] = 2
		wds[3] = 16
		wds[4] = 2
		wds[5] = 60
	    wds[11] = "WP1.dll"
	    wds[12] = 0x00000013
	    wds[13] = 0x00000014
	elseif wd == "金沙海滩" then
		wds[1] = "今人不见古时月,今月曾经照古人。#Y/加100防御"
		wds[2] = 2
		wds[3] = 16
		wds[4] = 2
		wds[5] = 60
	    wds[11] = "xzsc.wdf"
	    wds[12] = 0xFA746FBB
	    wds[13] = 0x17158FCB
	elseif wd == "祥云瑞气" then
		wds[1] = "日日祥云瑞气连,农家应作大神仙。#Y/加100防御"
		wds[2] = 2
		wds[3] = 16
		wds[4] = 2
		wds[5] = 60
	    wds[11] = "WP1.dll"
	    wds[12] = 0x00000009
	    wds[13] = 0x00000010
	elseif wd == "花的海洋" then
		wds[1] = "无意苦争春,一任群芳妒。#Y/加100防御"
		wds[2] = 2
		wds[3] = 16
		wds[4] = 2
		wds[5] = 60
	    wds[11] = "WP1.dll"
	    wds[12] = 0x00000005
	    wds[13] = 0x00000006
	elseif wd == "爱的光影" then
		wds[1] = "爱心闪动,光影年华。#Y/加100防御"
		wds[2] = 2
		wds[3] = 16
		wds[4] = 2
		wds[5] = 60
	    wds[11] = "WP1.dll"
	    wds[12] = 0x00000001
	    wds[13] = 0x00000002
	elseif wd == "珠落玉盘" then
		wds[1] = "嘈嘈切切错杂弹，大珠小珠落玉盘。#Y/加100防御"
		wds[2] = 2
		wds[3] = 16
		wds[4] = 2
		wds[5] = 60
	    wds[11] = "WP1.dll"
	    wds[12] = 0x00000015
	    wds[13] = 0x00000016
	elseif wd == "红叶随风" then
		wds[1] = "晚风岸抚柳,看红叶秋色然。#Y/加100防御"
		wds[2] = 2
		wds[3] = 16
		wds[4] = 2
		wds[5] = 60
	    wds[11] = "WP1.dll"
	    wds[12] = 0x00000003
	    wds[13] = 0x00000004
	elseif wd == "白色精灵" then
		wds[1] = "白色精灵，翩翩起舞。#Y/加100防御"
		wds[2] = 2
		wds[3] = 16
		wds[4] = 2
		wds[5] = 60
	    wds[11] = "wzife.wd5"
	    wds[12] = 0x01000091
	    wds[13] = 0x01000090
	elseif wd == "黑色精灵" then
		wds[1] = "黑色精灵，翩翩起舞。#Y/加100防御"
		wds[2] = 2
		wds[3] = 16
		wds[4] = 2
		wds[5] = 60
	    wds[11] = "wzife.wd5"
	    wds[12] = 0x01000094
	    wds[13] = 0x01000093
	elseif wd == "蓝色精灵" then
		wds[1] = "蓝色精灵，翩翩起舞。#Y/加100防御"
		wds[2] = 2
		wds[3] = 16
		wds[4] = 2
		wds[5] = 60
	    wds[11] = "wzife.wd5"
	    wds[12] = 0x01000096
	    wds[13] = 0x01000095
	elseif wd == "海豚精灵" then
		wds[1] = "海豚精灵，翩翩起舞。#Y/加100防御"
		wds[2] = 2
		wds[3] = 16
		wds[4] = 2
		wds[5] = 60
	    wds[11] = "wzife.wd5"
	    wds[12] = 0x01000100
	    wds[13] = 0x01000099
	-- 足迹
	elseif wd == "龙卷风足迹" then
        wds[1] = "龙卷风来啦！大家都快闪开，被刮跑了可不是玩的。#Y/100速度"
        wds[2] = 2
        wds[3] = 17
        wds[4] = 3
        wds[11] = "jy.wdf"
        wds[12] = 0x00000020
        wds[13] = 0x00000021

    elseif wd == "星光" then
        wds[1] = "流星飞舞，炫彩照人，熠熠生辉。#Y/100速度"
        wds[2] = 2
        wds[3] =17
        wds[11] = "xzsc.wdf"
        wds[4] = 3
        wds[12] = 0x970E5222
        wds[13] = 0x081B19F9
    elseif wd == "小心机" then
        wds[1] = "小心机，小幸福，小感动~。#Y/100速度"
        wds[2] = 2
        wds[3] =17
        wds[11] = "xzsc.wdf"
        wds[4] = 3
        wds[12] = 0xC5828632
        wds[13] = 0x9F6FA0CA
    elseif wd == "浮游水母" then
        wds[1] = "这位深海的小精灵，带来了海洋的味道。#Y/100速度"
        wds[2] = 2
        wds[3] =17
        wds[11] = "xzsc.wdf"
        wds[4] = 3
        wds[12] = 0x9675928E
        wds[13] = 0x4F336856
    elseif wd == "闪光足迹" then
        wds[1] = "我贪恋凡世的喧嚣和明亮，享尽世俗的快乐和幸福。#Y/100速度"
        wds[2] = 2
        wds[3] =17
        wds[11] = "xzsc.wdf"
        wds[4] = 3
        wds[12] = 0x60028A69
        wds[13] = 0xB700C276
    elseif wd == "跃动喷泉" then
        wds[1] = "清泉喷涌，水花四溅，给这个夏日带来冰冰凉的舒爽。#Y/100速度"
        wds[2] = 2
        wds[3] =17
        wds[11] = "xzsc.wdf"
        wds[4] = 3
        wds[12] = 0x89E33B51
        wds[13] = 0x75B21ED7
    elseif wd == "彩蝶飞" then
        wds[1] = "踏访三界时，有翩翩飞舞的彩蝶作伴岂不乐哉！。#Y/100速度"
        wds[2] = 2
        wds[3] =17
        wds[11] = "xzsc.wdf"
        wds[4] = 3
        wds[12] = 0x23273029
        wds[13] = 0xBB5E367F
    elseif wd == "锦鲤游" then
        wds[1] = "有锦鲤相伴守护，想必一定会有好事发生的。#Y/100速度"
        wds[2] = 2
        wds[3] =17
        wds[11] = "xzsc.wdf"
        wds[4] = 3
        wds[12] = 0xFE5A817B
        wds[13] = 0xA377F990
    elseif wd == "踩浪花" then
        wds[1] = "踩呀踩，踩出浪花一朵朵~。#Y/100速度"
        wds[2] = 2
        wds[3] =17
        wds[11] = "xzsc.wdf"
        wds[4] = 3
        wds[12] = 0x2DD8208B
        wds[13] = 0xD1F59181
    elseif wd == "藤蔓蔓延" then
        wds[1] = "藤蔓蔓延，一路行走，花草丛生。#Y/100速度"
        wds[2] = 2
        wds[3] =17
        wds[11] = "xzsc.wdf"
        wds[4] = 3
        wds[12] = 0x3CE48D1B
        wds[13] = 0xEDFAE4DB
    elseif wd == "随风舞" then
        wds[1] = "风乍起，一株小小蒲公英的种子随之飘舞纷飞。#Y/100速度"
        wds[2] = 2
        wds[3] =17
        wds[11] = "xzsc.wdf"
        wds[4] = 3
        wds[12] = 0xA6121A6C
        wds[13] = 0xE8EBA4B2
    elseif wd == "鬼脸南瓜" then
        wds[1] = "快开门~快开门~不给糖果就捣乱~。#Y/100速度"
        wds[2] = 2
        wds[3] =17
        wds[11] = "xzsc.wdf"
        wds[4] = 3
        wds[12] = 0xA6DF5BC7
        wds[13] = 0x709745FE
    elseif wd == "爱的风暴" then
        wds[1] = "所到之处，刮起爱的龙卷风。#Y/100速度"
        wds[2] = 2
        wds[3] =17
        wds[11] = "xzsc.wdf"
        wds[4] = 3
        wds[12] = 0x384E4B51
        wds[13] = 0x80285EE6
    elseif wd == "落羽" then
        wds[1] = "轻柔的羽毛飘落，洒落一地。#Y/100速度"
        wds[2] = 2
        wds[3] =17
        wds[11] = "xzsc.wdf"
        wds[4] = 3
        wds[12] = 0x6BAF53E2
        wds[13] = 0x3592F6F6
    elseif wd == "星如雨" then
        wds[1] = "掩轩辕，星落如雨~可别忘记许愿哦~。#Y/100速度"
        wds[2] = 2
        wds[3] =17
        wds[11] = "xzsc.wdf"
        wds[4] = 3
        wds[12] = 0xCB847768
        wds[13] = 0x94E86880
    elseif wd == "璀璨足迹" then
        wds[1] = "自由自在飞向天空，闪烁着璀璨光芒的美丽心灵。#Y/100速度"
        wds[2] = 2
        wds[3] =17
        wds[11] = "xzsc.wdf"
        wds[4] = 3
        wds[12] = 0x204E056F
        wds[13] = 0xB6014FED
    elseif wd == "飞雪足迹" then
        wds[1] = "雪花飘，雪花飞。飘扬起的雪花，落在身上，晶莹而美丽。#Y/100速度"
        wds[2] = 2
        wds[3] =17
        wds[11] = "xzsc.wdf"
        wds[4] = 3
        wds[12] = 0x6682251F
        wds[13] = 0x4F7B9FCB
    elseif wd == "蝴蝶足迹" then
        wds[1] = "泡了个花瓣澡身体好香，蝴蝶都飞来围着我转。#Y/100速度"
        wds[2] = 2
        wds[3] =17
        wds[11] = "xzsc.wdf"
        wds[4] = 3
        wds[12] = 0xD1081A5B
        wds[13] = 0x10C6A5DC
    elseif wd == "星光泡泡" then
        wds[1] = "漫天飞舞着的泡泡晶莹剔透，闪烁着淡淡星光。#Y/100速度"
        wds[2] = 2
        wds[3] =17
        wds[11] = "xzsc.wdf"
        wds[4] = 3
        wds[12] = 0x54CF74DC
        wds[13] = 0xB6CBE5DF
    elseif wd == "鱼群足迹" then
        wds[1] = "曳尾于洋中，出游从容，鱼之乐也。#Y/100速度"
        wds[2] = 2
        wds[3] =17
        wds[11] = "xzsc.wdf"
        wds[4] = 3
        wds[12] = 0xD0B4E713
        wds[13] = 0xD9B8EE38
    elseif wd == "心享气球" then
        wds[1] = "盈盈气球，浓浓心意，飘飘风中，怡然自乐。#Y/100速度"
        wds[2] = 2
        wds[3] =17
        wds[11] = "xzsc.wdf"
        wds[4] = 3
        wds[12] = 0x3AE30D30
        wds[13] = 0x50634330
    elseif wd == "皮球足迹" then
        wds[1] = "真皮球是一种材质的球，适合在木地板上打。#Y/100速度"
        wds[2] = 2
        wds[3] = 17
        wds[4] = 3
        wds[11] = "jy.wdf"
        wds[12] = 0x00000023
        wds[13] = 0x00000022
    elseif wd == "雀屏足迹" then
        wds[1] = "孔雀开屏，骄傲的尾巴闪耀着灼灼光华。#Y/100速度"
        wds[2] = 2
        wds[3] = 17
        wds[4] = 3
        wds[11] = "jy.wdf"
        wds[12] = 0x00000025
        wds[13] = 0x00000024
    elseif wd == "旋律足迹" then
        wds[1] = "生动的语言节奏和丰富的生活节奏是旋律节奏的自然基础。#Y/100速度"
        wds[2] = 2
        wds[3] = 17
        wds[4] = 3
        wds[11] = "jy.wdf"
        wds[12] = 0x00000027
        wds[13] = 0x00000026
    elseif wd == "枫叶足迹" then
        wds[1] = "秋风扫落叶，行走时犹如带着秋风扫起一片片枫叶。#Y/100速度"
        wds[2] = 2
        wds[3] = 17
        wds[4] = 3
        wds[11] = "jy.wdf"
        wds[12] = 0x00000029
        wds[13] = 0x00000028
    elseif wd == "飞天足迹" then
        wds[1] = "多种颜色至于身后，犹如飞天般的感觉。#Y/100速度"
        wds[2] = 2
        wds[3] = 17
        wds[4] = 3
        wds[11] = "jy.wdf"
        wds[12] = 0x00000031
        wds[13] = 0x00000030
    elseif wd == "两心相悦足迹" then
        wds[1] = "从我的第一眼看到你，我就爱上你了。#Y/100速度"
        wds[2] = 2
        wds[3] = 17
        wds[4] = 3
        wds[11] = "jy.wdf"
        wds[12] = 0x00000033
        wds[13] = 0x00000032
    elseif wd == "心花怒放" then
        wds[1] = "故～，髓海难枯，而杰构鸿篇，大率超群出类。#Y/100速度"
        wds[2] = 2
        wds[3] = 17
        wds[4] = 3
        wds[11] = "jy.wdf"
        wds[12] = 0x00000035
        wds[13] = 0x00000034
    elseif wd == "雷电足迹" then
        wds[1] = "电闪雷鸣，莫装逼，装逼被雷劈。#Y/100速度"
        wds[2] = 2
        wds[3] = 17
        wds[4] = 3
        wds[11] = "jy.wdf"
        wds[12] = 0x00000037
        wds[13] = 0x00000036
    elseif wd == "寒冰足迹" then
        wds[1] = "行走间，犹如冬天来到。#Y/100速度"
        wds[2] = 2
        wds[3] = 17
        wds[4] = 3
        wds[11] = "jy.wdf"
        wds[12] = 0x00000039
        wds[13] = 0x00000038
    elseif wd == "星星祈愿" then
        wds[1] = "花一些时间向星星许愿吧。#Y/100速度"
        wds[2] = 2
        wds[3] = 17
        wds[4] = 3
        wds[5] = 60
        wds[11] = "jy.wdf"
        wds[12] = 0x00000041
        wds[13] = 0x00000040
    elseif wd == "地狱焰火" then
        wds[1] = "那闪动的火光肆无忌惮燃烧着，跳跃着。#Y/100速度"
        wds[2] = 2
        wds[3] = 17
        wds[4] = 3
        wds[11] = "jy.wdf"
        wds[12] = 0x00000043
        wds[13] = 0x00000042
    elseif wd == "元宝足迹" then
        wds[1] = "我是一个财迷，有钱我就会出现。#Y/100速度"
        wds[2] = 2
        wds[3] = 17
        wds[4] = 3
        wds[11] = "jy.wdf"
        wds[12] = 0x00000045
        wds[13] = 0x00000044
    elseif wd == "光剑足迹" then
        wds[1] = "背后出现了神秘的光晕，有锐利的光芒投射过来。#Y/100速度"
        wds[2] = 2
        wds[3] = 17
        wds[4] = 3
        wds[11] = "jy.wdf"
        wds[12] = 0x00000047
        wds[13] = 0x00000046
    elseif wd == "雪花足迹" then
        wds[1] = "雪花纷飞，犹如大雪即将来临。#Y/100速度"
        wds[2] = 2
        wds[3] = 17
        wds[4] = 3
        wds[11] = "jy.wdf"
        wds[12] = 0x00000049
        wds[13] = 0x00000048
	-- 祥瑞
	elseif wd == "魔骨战熊" then
		wds[1] = "天河夜转漂回星,银浦流云学水声。"
		wds[2] = "祥瑞"
		wds[3] = 16
		wds[4] = 2
		wds[5] = 60
	    wds[11] = "item.wd1"
	    wds[12] = 0x998CE0E2
	    wds[13] = 0x15578EF9
	elseif wd == "青霄天麟" then
		wds[1] = "天河夜转漂回星,银浦流云学水声。"
		wds[2] = "祥瑞"
		wds[3] = 16
		wds[4] = 2
		wds[5] = 60
	    wds[11] = "item.wd1"
	    wds[12] = 0xCA59BF13
	    wds[13] = 0x4EC9919D
	elseif wd == "莽林猛犸" then
		wds[1] = "天河夜转漂回星,银浦流云学水声。"
		wds[2] = "祥瑞"
		wds[3] = 16
		wds[4] = 2
		wds[5] = 60
	    wds[11] = "item.wd1"
	    wds[12] = 0x340F1B21
	    wds[13] = 0x1938E4B4
	elseif wd == "琉璃宝象" then
		wds[1] = "天河夜转漂回星,银浦流云学水声。"
		wds[2] = "祥瑞"
		wds[3] = 16
		wds[4] = 2
		wds[5] = 60
	    wds[11] = "item.wd1"
	    wds[12] = 0xBCED0D7F
	    wds[13] = 0xD5FCE6A8
	elseif wd == "踏雪灵熊" then
		wds[1] = "天河夜转漂回星,银浦流云学水声。"
		wds[2] = "祥瑞"
		wds[3] = 16
		wds[4] = 2
		wds[5] = 60
	    wds[11] = "item.wd1"
	    wds[12] = 0x8FCB26CE
	    wds[13] = 0xF2D1000B
	elseif wd == "玄火神驹" then
		wds[1] = "天河夜转漂回星,银浦流云学水声。"
		wds[2] = "祥瑞"
		wds[3] = 16
		wds[4] = 2
		wds[5] = 60
	    wds[11] = "item.wd1"
	    wds[12] = 0x97D57CAD
	    wds[13] = 0xEF88C068
	elseif wd == "沉星寒犀" then
		wds[1] = "天河夜转漂回星,银浦流云学水声。"
		wds[2] = "祥瑞"
		wds[3] = 16
		wds[4] = 2
		wds[5] = 60
	    wds[11] = "item.wdf"
	    wds[12] = 0xF2AB6478
	    wds[13] = 0xDB617B2B
	elseif wd == "鹤雪锦犀" then
		wds[1] = "天河夜转漂回星,银浦流云学水声。"
		wds[2] = "祥瑞"
		wds[3] = 16
		wds[4] = 2
		wds[5] = 60
	    wds[11] = "item.wdf"
	    wds[12] = 0x3BB4F71A
	    wds[13] = 0x187905E1
	elseif wd == "天使猪猪" then
		wds[1] = "天河夜转漂回星,银浦流云学水声。"
		wds[2] = "祥瑞"
		wds[3] = 16
		wds[4] = 2
		wds[5] = 60
	    wds[11] = "item.wdf"
	    wds[12] = 0xA8412008
	    wds[13] = 0xEB59C078
	    elseif wd == "祥瑞套装1" or wd == "祥瑞套装2" or wd == "祥瑞套装3" or wd == "祥瑞套装4"  or wd == "祥瑞套装5" or wd == "祥瑞套装6" or wd == "祥瑞套装7" or wd == "祥瑞套装8" or wd == "祥瑞套装9" or wd == "祥瑞套装10" or wd == "祥瑞套装11" or wd == "祥瑞套装12" or wd == "祥瑞套装13" or wd == "祥瑞套装14" or wd == "祥瑞套装15" or wd == "祥瑞套装16" or wd == "祥瑞套装17" or wd == "祥瑞套装18" or wd == "祥瑞套装19" or wd == "祥瑞套装20" or wd == "祥瑞套装21" or wd == "祥瑞套装22" or wd == "祥瑞套装23" or wd == "祥瑞套装24" or wd == "祥瑞套装25" or wd == "祥瑞套装26" then
        wds[1] = " 这是一套祥瑞锦衣,穿上它你就是最帅的靓仔.\n【类型】#Y祥瑞套装"
        wds[2] = "祥瑞"
        wds[3] = 16
        wds[4] = 2
        wds[11] = "wpal/121.wpal"
        wds[5] = 60
        wds[12] = 0x60FB6A8C
        wds[13] = 0X331ba7b1
        elseif wd == "羽仙歌白" or wd == "羽仙歌·月白" or wd == "复古锦衣"  then
            wds[1] = "羽袂飘飘，仙音缭绕，佳期相会佳人。知音世间难求，许君一梦长歌。"
            wds[2] = 2
            wds[3] = 15
            wds[11] = "XJY.wdf"
            wds[4] = 1
            wds[12] = 0x20203360
            wds[13] = 0x20203361
            elseif wd == "羽仙歌黑" or  wd == "羽仙歌·墨黑" then
            wds[1] = "羽袂飘飘，仙音缭绕，佳期相会佳人。知音世间难求，许君一梦长歌。"
            wds[2] = 2
            wds[3] = 15
            wds[11] = "XJY.wdf"
            wds[4] = 1
            wds[12] = 0x20203370
            wds[13] = 0x20203371

	-- 新增物品
	elseif wd == "灵丹" then
		wds[1] = "召唤兽进阶的道具，能够唤醒召唤兽体内的潜力，突破界限，完成进阶；进阶后的召唤兽可以增加一定的资质和成长，并额外获得30潜力点"
		wds[2] = 3
		wds[3] = 3
		wds[4] = 0
	    wds[11] = "common/item.wdf"
	    wds[12] = 0xE41F5356
	    wds[13] = 0x5B75710B
	elseif wd == "鬼谷子" then
		wds[1] = "战国智者鬼谷子所著的兵法兼玄学书籍。"
		wds[2] = 13
		wds[3] = 3
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 4271545734
	    wds[13] = 1264860140
	elseif wd == "超级金柳露" then
		wds[1] = "一种非常难得的仙露，据说有着令万物回归到原始状态的奇效。可以洗练变异的怪物。"
		wds[2] = 3
		wds[3] = 2
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 1572601177
	    wds[13] = 2703428501
	elseif wd == "青龙石" then
		wds[1] = "带有灵气的石头，是强化装备所需的原料之一"
		wds[2] = 5
		wds[3] = 4
		wds[4] = 1
		wds[5] = "装备镶嵌时附加10%气血上限和10%魔法上限"
	    wds[11] = "item.wdf"
	    wds[12] = 2289281503
	    wds[13] = 603616920
	elseif wd == "白虎石" then
		wds[1] = "带有灵气的石头，是强化装备所需的原料之一"
		wds[2] = 5
		wds[3] = 4
		wds[4] = 2
		wds[5] = "装备镶嵌时附加5%伤害"
	    wds[11] = "item.wdf"
	    wds[12] = 2867857574
	    wds[13] = 1492919136
	elseif wd == "朱雀石" then
		wds[1] = "带有灵气的石头，是强化装备所需的原料之一"
		wds[2] = 5
		wds[3] = 4
		wds[4] = 3
		wds[5] = "装备镶嵌时附加5%灵力"
	    wds[11] = "item.wdf"
	    wds[12] = 650195920
	    wds[13] = 3642232128
	elseif wd == "玄武石" then
		wds[1] = "带有灵气的石头，是强化装备所需的原料之一"
		wds[2] = 5
		wds[3] = 4
		wds[4] = 4
		wds[5] = "装备镶嵌时附加5%防御"
	    wds[11] = "item.wdf"
	    wds[12] = 727733710
	    wds[13] = 3146274026
	elseif wd == "打狗棒" then
		wds[1] = "在四季活动-天狗食月中在战斗中对噬月天狗使用，可以对其造成2000点伤害"
		wds[2] = 100
		wds[3] = 1
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0xA545ABC8
	    wds[13] = 0xD05BA36C
	 elseif wd == "月饼" then
		wds[1] = "中秋节活动的奖品。食用后可以增加人物1点潜能（不可以对召唤兽使用），但每个人物最多食用50个月饼"
		wds[2] = 1
		wds[3] = 10
		wds[4] = 1
		wds[8] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0x846AD205
	    wds[13] = 0x49B4F6DC
	elseif wd == "元宵" then
		wds[1] = "元宵圆元宵圆元宵不圆不要钱！"
		wds[2] = 1
		wds[3] = 10
		wds[4] = 2
		wds[8] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0x522C3747
	    wds[13] = 0xF04964D3
    elseif wd == "月华露" then
		wds[1] = "昆仑山顶采集的皓月光华，是增加修为的仙露。由于月有阴晴圆缺，所以不同时间采集的光华效果也不尽相同。"
		wds[2] = 1
		wds[3] = 11
		wds[4] = 0
        wds[8] = 3
	    wds[11] = "item.wdf"
	    wds[12] = 0x016F4E03
	    wds[13] = 0x026E613B
    elseif wd == "九转金丹" then
		wds[1] = "太上老君八卦炉中炼制的灵丹，服用之后可以增加人物的修炼经验。不同火候炼制的丹药，效果自然也不相同。"
		wds[2] = 1
		wds[3] = 11
		wds[4] = 0
        wds[8] = 3
	    wds[11] = "item.wdf"
	    wds[12] = 0x5A0E9307
	    wds[13] = 0x6EB440C8
    elseif wd == "修炼果" then
		wds[1] = "具有灵气的果子，为修炼之士所常用。"
		wds[2] = 1
		wds[3] = 11
		wds[4] = 0
        wds[8] = 3
	    wds[11] = "item.wdf"
	    wds[12] = 0x19CEE771 --小 0x5A0E9307
	    wds[13] = 0x0F2E3E3F --大 0x62EB440C8
	elseif wd == "炼兽真经" then
		wds[1] = "武林秘籍，给予召唤兽学习后可提升成长。"
		wds[2] = 1
		wds[3] = 11
		wds[4] = 0
        wds[8] = 3
	    wds[11] = "item.wdf"
	    wds[12] = 0x1B4E9E52 --小 0x5A0E9307
	    wds[13] = 0x59A1B6CA --大 0x62EB440C8
	elseif wd == "蟠桃" then
		wds[1] = "具有灵气的果子，为修炼之士所常用。"
		wds[2] = 1
		wds[3] = 11
		wds[4] = 0
        wds[8] = 3
	    wds[11] = "item.wdf"
	    wds[12] = 0x1B4E9E52 --小 0x5A0E9307
	    wds[13] = 0x59A1B6CA --大 0x62EB440C8
    elseif wd == "三界悬赏令" then
		wds[1] = "记载着被三界通缉的犯人信息，右键点击后可获得三界悬赏任务。"
		wds[2] = 1
		wds[3] = 11
		wds[4] = 0
        wds[8] = 3
	    wds[11] = "item.wdf"
	    wds[12] = 0x45BDA0CD --小 0x5A0E9307
	    wds[13] = 0x7231709D --大 0x62EB440C8
	elseif wd == "贼王的线索" then
		wds[1] = "记载着贼王的线索信息，右键点击后可获得贼王的线索任务。"
		wds[2] = 1
		wds[3] = 11
		wds[4] = 0
        wds[8] = 3
	    wds[11] = "item.wdf"
	    wds[12] = 0xDDB28CB8 --小 0x5A0E9307
	    wds[13] = 0x63F3C3F2 --大 0x62EB440C8
	     elseif wd == "太阳石礼包" then
		wds[1] = "内含一套1-10级太阳石10颗，右键打开获得"
		wds[2] = "宝石礼包"
		wds[3] = 5
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0x65AE0DFF
	    wds[13] = 0x2CE03BE9
	elseif wd == "红玛瑙礼包" then
		wds[1] = "内含一套1-10级红玛瑙10颗，右键打开获得"
		wds[2] = "宝石礼包"
		wds[3] = 5
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0x65AE0DFF
	    wds[13] = 0x2CE03BE9
	elseif wd == "舍利子礼包" then
		wds[1] = "内含一套1-10级舍利子10颗，右键打开获得"
		wds[2] = "宝石礼包"
		wds[3] = 5
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0x65AE0DFF
	    wds[13] = 0x2CE03BE9
	elseif wd == "黑宝石礼包" then
		wds[1] = "内含一套1-10级黑宝石10颗，右键打开获得"
		wds[2] = "宝石礼包"
		wds[3] = 5
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0x65AE0DFF
	    wds[13] = 0x2CE03BE9
	elseif wd == "光芒石礼包" then
		wds[1] = "内含一套1-10级光芒石10颗，右键打开获得"
		wds[2] = "宝石礼包"
		wds[3] = 5
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0x65AE0DFF
	    wds[13] = 0x2CE03BE9
	elseif wd == "月亮石礼包" then
		wds[1] = "内含一套1-10级月亮石10颗，右键打开获得"
		wds[2] = "宝石礼包"
		wds[3] = 5
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0x65AE0DFF
	    wds[13] = 0x2CE03BE9
	elseif wd == "神秘石礼包" then
		wds[1] = "内含一套1-10级神秘石10颗，右键打开获得"
		wds[2] = "宝石礼包"
		wds[3] = 5
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0x65AE0DFF
	    wds[13] = 0x2CE03BE9
	elseif wd == "星辉石礼包" then
		wds[1] = "内含一套1-10级星辉石10颗，右键打开获得"
		wds[2] = "宝石礼包"
		wds[3] = 5
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0x65AE0DFF
	    wds[13] = 0x2CE03BE9
	  elseif wd == "太阳石小礼包" then
		wds[1] = "内含一套11-20级太阳石10颗，右键打开获得"
		wds[2] = "宝石礼包"
		wds[3] = 5
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xA3DB661B
	    wds[13] = 0x5AAF94C0
	elseif wd == "红玛瑙小礼包" then
		wds[1] = "内含一套11-20级红玛瑙10颗，右键打开获得"
		wds[2] = "宝石礼包"
		wds[3] = 5
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xA3DB661B
	    wds[13] = 0x5AAF94C0
	elseif wd == "舍利子小礼包" then
		wds[1] = "内含一套11-20级舍利子10颗，右键打开获得"
		wds[2] = "宝石礼包"
		wds[3] = 5
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xA3DB661B
	    wds[13] = 0x5AAF94C0
	elseif wd == "黑宝石小礼包" then
		wds[1] = "内含一套11-20级黑宝石10颗，右键打开获得"
		wds[2] = "宝石礼包"
		wds[3] = 5
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xA3DB661B
	    wds[13] = 0x5AAF94C0
	elseif wd == "光芒石小礼包" then
		wds[1] = "内含一套11-20级光芒石10颗，右键打开获得"
		wds[2] = "宝石礼包"
		wds[3] = 5
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xA3DB661B
	    wds[13] = 0x5AAF94C0
	elseif wd == "月亮石小礼包" then
		wds[1] = "内含一套11-20级月亮石10颗，右键打开获得"
		wds[2] = "宝石礼包"
		wds[3] = 5
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xA3DB661B
	    wds[13] = 0x5AAF94C0
	elseif wd == "神秘石小礼包" then
		wds[1] = "内含一套11-20级神秘石10颗，右键打开获得"
		wds[2] = "宝石礼包"
		wds[3] = 5
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xA3DB661B
	    wds[13] = 0x5AAF94C0
	elseif wd == "星辉石小礼包" then
		wds[1] = "内含一套11-20级星辉石10颗，右键打开获得"
		wds[2] = "宝石礼包"
		wds[3] = 5
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xA3DB661B
	    wds[13] = 0x5AAF94C0
	    elseif wd == "太阳石大礼包" then
		wds[1] = "内含一套21-30级太阳石10颗，右键打开获得"
		wds[2] = "宝石礼包"
		wds[3] = 5
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xD6363DD6
	    wds[13] = 0x5FBAB8DC
	elseif wd == "红玛瑙大礼包" then
		wds[1] = "内含一套21-30级红玛瑙10颗，右键打开获得"
		wds[2] = "宝石礼包"
		wds[3] = 5
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xD6363DD6
	    wds[13] = 0x5FBAB8DC
	elseif wd == "舍利子大礼包" then
		wds[1] = "内含一套21-30级舍利子10颗，右键打开获得"
		wds[2] = "宝石礼包"
		wds[3] = 5
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xD6363DD6
	    wds[13] = 0x5FBAB8DC
	elseif wd == "黑宝石大礼包" then
		wds[1] = "内含一套21-30级黑宝石10颗，右键打开获得"
		wds[2] = "宝石礼包"
		wds[3] = 5
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xD6363DD6
	    wds[13] = 0x5FBAB8DC
	elseif wd == "光芒石大礼包" then
		wds[1] = "内含一套21-30级光芒石10颗，右键打开获得"
		wds[2] = "宝石礼包"
		wds[3] = 5
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xD6363DD6
	    wds[13] = 0x5FBAB8DC
	elseif wd == "月亮石大礼包" then
		wds[1] = "内含一套21-30级月亮石10颗，右键打开获得"
		wds[2] = "宝石礼包"
		wds[3] = 5
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xD6363DD6
	    wds[13] = 0x5FBAB8DC
	elseif wd == "神秘石大礼包" then
		wds[1] = "内含一套21-30级神秘石10颗，右键打开获得"
		wds[2] = "宝石礼包"
		wds[3] = 5
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xD6363DD6
	    wds[13] = 0x5FBAB8DC
	elseif wd == "星辉石大礼包" then
		wds[1] = "内含一套21-30级星辉石10颗，右键打开获得"
		wds[2] = "宝石礼包"
		wds[3] = 5
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xD6363DD6
	    wds[13] = 0x5FBAB8DC
	elseif wd == "5级宝石礼包" then
		wds[1] = "装着一代珠宝，散发着宝石的光华"
		wds[2] = 1
		wds[3] = 11
		wds[4] = 0
        wds[8] = 3
	    wds[11] = "item.wdf"
	    wds[12] = 0x9724BCB0 --小
	    wds[13] = 0xFE37E4E0 --大
	elseif wd == "7级宝石礼包" then
		wds[1] = "装着一代珠宝，散发着宝石的光华"
		wds[2] = 1
		wds[3] = 11
		wds[4] = 0
        wds[8] = 3
	    wds[11] = "item.wdf"
	    wds[12] = 0x9724BCB0 --小
	    wds[13] = 0xFE37E4E0 --大
	elseif wd == "10级宝石礼包" then
		wds[1] = "装着一代珠宝，散发着宝石的光华"
		wds[2] = 1
		wds[3] = 11
		wds[4] = 0
        wds[8] = 3
	    wds[11] = "item.wdf"
	    wds[12] = 0x9724BCB0 --小
	    wds[13] = 0xFE37E4E0 --大
   	elseif wd == "情报" then
		wds[1] = "敌军的情报，速速交给李将军吧！"
		wds[2] = 1
		wds[3] = 11
		wds[4] = 0
        wds[8] = 3
	    wds[11] = "item.wdf"
	    wds[12] = 0xDDB28CB8 --小 0x5A0E9307
	    wds[13] = 0x63F3C3F2 --大 0x62EB440C8
    elseif wd == "天眼通符" then
		wds[1] = "可以查看抓鬼、新年环、鬼王、任务的准确坐标。"
	    wds[2] = 4
		wds[3] = 500
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xDF37C485
	    wds[13] = 0x7FA4203F
	elseif wd == "附魔宝珠" then
		wds[1] = "蕴含天地精华的宝珠，可为一件人物装备随机附加一种特殊效果。（右键使用）"
	    wds[2] = 4
		wds[3] = 1
		wds[4] = 0
	    wds[11] = "item.wd1"
	    wds[12] = 0x002A5EAF
	    wds[13] = 0x575EE64D
	 elseif wd == "附魔宝珠-动物套" then
		wds[1] = "可为一件人物装备附加一种动物套装效果，3件同造型变身普通造型，并且动物属性提升为2倍。6件同造型变身进阶造型，并且动物属性提升为3倍.（右键使用）"
	    wds[2] = 4
		wds[3] = 1
		wds[4] = 0
	    wds[11] = "幕神2.rpk"
	    wds[12] = 0x00000074
	    wds[13] = 0x00000075
	elseif wd == "特性宝珠" then
		wds[1] = "蕴含天地精华的宝珠，可为一件人物装备随机附加一种特殊效果。（右键使用）"
	    wds[2] = 4
		wds[3] = 1
		wds[4] = 0
	    wds[11] = "common/item.wdf"
	    wds[12] = 0xE41F5356
	    wds[13] = 0x5B75710B
	elseif wd == "碎星锤" then
		wds[1] = "蕴含神秘的法力,可以将装备上的等级最高的宝石锻造效果清除,但是宝石同样会被神秘的力量击碎。"
	    wds[2] = 4
		wds[3] = 1
		wds[4] = 0
	    wds[11] = "item.wd1"
	    wds[12] = 0xBCC5105C
	    wds[13] = 0x64FECF98
	    elseif wd == "VIP月卡" then
		wds[1] = "VIP月卡,每日可领一次奖励"
		wds[2] = 1
		wds[3] = 11
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xF01229F6
	    wds[13] = 0x635B5C60
	elseif wd == "超级VIP月卡" then
		wds[1] = "超级月卡,每日可领一次奖励"
		wds[2] = 1
		wds[3] = 11
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xF01229F6
	    wds[13] = 0x635B5C60
	elseif wd == "超级碎星锤" then
		wds[1] = "拥有比碎星锤更加强大的法力,可以一次将装备上的宝石锻造效果全部清除,并获得一颗与锻造等级相同的宝石。"
	    wds[2] = 4
		wds[3] = 1
		wds[4] = 0
	    wds[11] = "common/item.wdf"
	    wds[12] = 0x93DE1D4F
	    wds[13] = 0x1F211DFE
	 elseif wd == "小雪球" then
    wds[1] = "浮华雪山堆雪球活动材料用于合成后上交雪山女子。     【用途】雪人的鼻子 小雪球材料合成大雪块"
    wds[2] = 686
    wds[3] = 1
    wds[4] = 1
      wds[11] = "item.wdf"
      wds[12] = 0x9BEE2ED1
      wds[13] = 0xBCE0AE05
	elseif wd == "大雪块" then
		wds[1] = "在堆雪人活动上交给雪人女子可以增加堆雪人进度       【用途】上交于雪山女子NPC雪人活动"
		wds[2] = 20
		wds[3] = 1
		wds[4] = 2
	    wds[11] = "item.wdf"
	    wds[12] = 0x43F99886
	    wds[13] = 0x1E5C9739
    elseif wd == "雪人的鼻子" then
        wds[1] = "浮华雪山堆雪球活动材料用于合成后上交雪山女子。     【用途】雪人的鼻子 小雪球材料合成大雪块"
        wds[2] = 686
        wds[3] = 1
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0x925F02E3
        wds[13] = 0x587AE336
	elseif wd == "雪人的帽子" then
		wds[1] = "在堆雪人中雪人成长最后所需要的物品"
		wds[2] = 20
		wds[3] = 1
		wds[4] = 4
	    wds[11] = "item.wdf"
	    wds[12] = 0xA0502DA4
	    wds[13] = 0xD487C373
	elseif wd == "雪人的眼睛" then
		wds[1] = "在堆雪人中雪人成长最后所需要的物品"
		wds[2] = 20
		wds[3] = 1
		wds[4] = 5
	    wds[11] = "item.wdf"
	    wds[12] = 0x5BD31714
	    wds[13] = 0xCAFDB990
    elseif wd == "吸附石" then
        wds[1] = "精铁铸造的装备中分解而出的特殊材料，与召唤兽进行炼妖会有一定几率获取召唤兽身上的特殊能力。"
        wds[2] = 3
        wds[3] = 6
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0x4C07009E
        wds[13] = 0xBF944057
	elseif wd == "点化石" then
		wds[1] = "记载着神奇能力的石头，可以为宝宝的装备附加上套装效果"
		wds[2] = 5
		wds[3] = 5
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0xFBFCFCF2
	    wds[13] = 0x1FB5F6AD
	elseif wd == "鬼王的密信" then
		wds[1] = "从捣乱的鬼怪身上截获的一封密信"
		wds[2] = 21
		wds[3] = 1
		wds[4] = 1
		wds[8] = "右键即可领取鬼王任务"
	    wds[11] = "item.wdf"
	    wds[12] = 0xD75A7F1C
	    wds[13] = 0xEA0E76DF
	elseif wd == "梦魇幻境" then
		wds[1] = "似乎藏着很多人的美梦呢"
		wds[2] = 21
		wds[3] = 1
		wds[4] = 2
		wds[8] = "右键即可领取无尽梦魇任务"
	    wds[11] = "item.wdf"
	    wds[12] = 0x25492E36
	    wds[13] = 0x663FC75A
	elseif wd == "突厥密令" then
		wds[1] = "从突厥军中身上截获的令牌，似乎可以混入其中。"
		wds[2] = 21
		wds[3] = 1
		wds[4] = 3
		wds[8] = "右键即可领取突厥入侵任务"
	    wds[11] = "item.wdf"
	    wds[12] = 0x79E9E6B0
	    wds[13] = 0xE84B01F2
	-- 任务物品
	elseif wd == "枯萎的金莲" then
		wds[1] = "尘世间人性的金莲，已因心魔之灭而焦枯。"
		wds[2] = 1001
		wds[3] = 1
		wds[4] = 1
		wds[8] = nil
	    wds[11] = "item.wdf"
	    wds[12] = 0x88DCF8C0
	    wds[13] = 0x3B5F875C
	elseif wd == "赤叶甘草" then
		wds[1] = "王大嫂的儿子病了，听说这种稀有的赤叶甘草可以救他一命。"
		wds[2] = 1001
		wds[3] = 2
		wds[4] = 1
		wds[8] = nil
	    wds[11] = "item.wdf"
	    wds[12] = 0x7695864F
	    wds[13] = 0x398835C0
	elseif wd == "红烧鱼" then
		wds[1] = "王大嫂独家制作，美味极了。"
		wds[2] = 1001
		wds[3] = 2
		wds[4] = 2
		wds[8] = nil
	    wds[11] = "item.wdf"
	    wds[12] = 0x92E700A4
	    wds[13] = 0x4D688A82
	elseif wd == "松风灵芝" then
		wds[1] = "生长在松林之中的珍贵灵芝，十分稀有"
		wds[2] = 1001
		wds[3] = 2
		wds[4] = 3
		wds[8] = nil
	    wds[11] = "item.wdf"
	    wds[12] = 0x2F7C81CE
	    wds[13] = 0x696C18EE
	-- 副本物品
	elseif wd == "玲珑" then
		wds[1] = "交给观音大士，是锻造照妖镜所需要的材料。"
		wds[2] = 21
		wds[3] = 2
		wds[4] = 1
		wds[8] = nil
	    wds[11] = "item.wdf"
	    wds[12] = 0xDDA1D3AA
	    wds[13] = 0xD3DC3123
	elseif wd == "普通木材" then
		wds[1] = "一种常见的建筑木料，在搭建房屋时必须要用到它。"
		wds[2] = 21
		wds[3] = 2
		wds[4] = 2
		wds[8] = "在“车迟斗法副本”中可以增加道观建设度4点"
	    wds[11] = "item.wdf"
	    wds[12] = 1192555457
	    wds[13] = 4056791876
	elseif wd == "高级木材" then
		wds[1] = "比较稀有的建筑木料，在搭建房屋时必须要用到它。"
		wds[2] = 21
		wds[3] = 2
		wds[4] = 2
		wds[8] = "在“车迟斗法副本”中可以增加道观建设度20点"
	    wds[11] = "item.wdf"
	    wds[12] = 757799681
	    wds[13] = 2818741734
    elseif wd == "摇钱树苗" then
		wds[1] = "摇钱树的树苗，在特定地方种下，可能有意想不到的收获。"
		wds[2] = 21
		wds[3] = 3
		wds[4] = 2
	    wds[11] = "item.wdf"
	    wds[12] = 0x2D1399E3
	    wds[13] = 0x82254575
	elseif wd == "金刚石" then
		wds[1] = "最坚硬美丽的宝石，是传说中的五宝之一。"
		wds[2] = 21
		wds[3] = 3
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0x517A3AFF
	    wds[13] = 0x797267D4
	elseif wd == "定魂珠" then
		wds[1] = "可以用来寻找失散在人间鬼魂的奇妙宝珠，是传说中的五宝之一"
		wds[2] = 21
		wds[3] = 3
		wds[4] = 2
	    wds[11] = "item.wdf"
	    wds[12] = 0x3B83CE08
	    wds[13] = 0x605D073F
	elseif wd == "避水珠" then
		wds[1] = "用这件宝物，不熟水性的人也可以去到深海底，是传说中的五宝之一"
		wds[2] = 21
		wds[3] = 3
		wds[4] = 3
	    wds[11] = "item.wdf"
	    wds[12] = 0xAF394F2F
	    wds[13] = 0xAF8B6CC5
	elseif wd == "珍珠" then
		wds[1] = "光彩夺目的珍珠,可镶嵌在武器装备上,恢复装备一定的耐久度,每件装备镶嵌珍珠的数量没有限制,但装备等级高于珍珠等级时无法镶嵌。"
		wds[2] = 5
		wds[3] = 6
		wds[4] = 7
		wds[8] = "装备"
		wds[9] = "提高装备耐久"
	    wds[11] = "item.wdf"
	    wds[12] = 0x611926C4
	    wds[13] = 0x58C5D6AC
    elseif wd == "夜光珠" then
		wds[1] = "能在夜里发光的明珠，是传说中的五宝之一。"
		wds[2] = 21
		wds[3] = 3
		wds[4] = 4
	    wds[11] = "item.wdf"
	    wds[12] = 0x4497E508
	    wds[13] = 0x91BB3A47
	elseif wd == "龙鳞" then
		wds[1] = "龙族下颚的鳞，愤怒和威力的象征，是传说中的五宝之一。"
		wds[2] = 21
		wds[3] = 3
		wds[4] = 5
	    wds[11] = "item.wdf"
	    wds[12] = 0x1C64382E
	    wds[13] = 0x853BB4DA
	--黑宝石
	elseif wd == "光芒石" then
		wds[1] = "聚天地之精华而成的宝石，通体散发着夺目的光彩，令人不敢直视。是用来合成装备的神奇矿石。"
		wds[2] = 5
		wds[3] = 6
		wds[4] = 1
		wds[8] = "铠甲、腰带"
		wds[9] = "提高40点气血上限"
	    wds[11] = "item.wdf"
	    wds[12] = 182374181
	    wds[13] = 1097166752
	elseif wd == "月亮石" then
		wds[1] = "由月宫中流落到人间的宝石，吸取了月光之精华，能起到鼓舞和提神的作用。是用来合成装备的神奇矿石。"
		wds[2] = 5
		wds[3] = 6
		wds[4] = 2
		wds[8] = "铠甲、头盔"
		wds[9] = "提高12点防御力"
	    wds[11] = "item.wdf"
	    wds[12] = 3488952287
	    wds[13] = 3067278649
	elseif wd == "太阳石" then
		wds[1] = "从上古时期流传至今的“太阳之石”，附有神力。是用来合成装备的神奇矿石。"
		wds[2] = 5
		wds[3] = 6
		wds[4] = 3
		wds[8] = "武器、头盔"
		wds[9] = "提高8点伤害力"
	    wds[11] = "item.wdf"
	    wds[12] = 1387446262
	    wds[13] = 2414382713
	elseif wd == "舍利子" then
		wds[1] = "佛的舍利子是合成装备的神秘材料。"
		wds[2] = 5
		wds[3] = 6
		wds[4] = 4
		wds[8] = "铠甲、饰品"
		wds[9] = "提高6点灵力"
	    wds[11] = "item.wdf"
	    wds[12] = 2228232000
	    wds[13] = 3414114421
	elseif wd == "红玛瑙" then
		wds[1] = "红色的玛瑙石，是合成装备的神秘材料。"
		wds[2] = 5
		wds[3] = 6
		wds[4] = 5
		wds[8] = "武器、头盔"
		wds[9] = "提高25点命中"
	    wds[11] = "item.wdf"
	    wds[12] = 2783082158
	    wds[13] = 3655137177
	elseif wd == "黑宝石" then
		wds[1] = "坚硬无比的宝石；表面看起来毫不起眼，实际上却蕴涵着巨大的力量。"
		wds[2] = 5
		wds[3] = 6
		wds[4] = 6
		wds[8] = "腰带、鞋子"
		wds[9] = "提高8点速度"
	    wds[11] = "item.wdf"
	    wds[12] = 4208912380
	    wds[13] = 1963658266
	elseif wd == "神秘石" then
		wds[1] = "在民间流传已久的的宝石，来历不详；似乎对外界施与的打击有着一股神秘的抗力。"
		wds[2] = 5
		wds[3] = 6
		wds[4] = 7
		wds[8] = "武器、腰带、鞋子"
		wds[9] = "提高20点躲避力"
	    wds[11] = "item.wdf"
	    wds[12] = 749980813
	    wds[13] = 3278224394
 	elseif wd == "星辉石" then
		wds[1] = "如星光一样璀璨的宝石，散发出耀眼的光芒。用于强化灵饰效果。"
		wds[2] = 5
		wds[3] = 6
		wds[4] = 8
		wds[8] = "武器、腰带、鞋子"
		wds[9] = "提高20点躲避力"
	    wds[11] = "item.wd1"
	    wds[12] = 0xD2DFDC4D
	    wds[13] = 0x1F2B86DF
	elseif wd == "融合石" then
		wds[1] = "具有神秘而强大的力量，可在熔合装备失败时保护装备不会消失。"
		wds[2] = 5
		wds[3] = 6
		wds[4] = 9
	    wds[11] = "item.wd1"
	    wds[12] = 0xD2B5D50A
	    wds[13] = 0x62454D13
	elseif wd == "红木短剑" then
		wds[1] = "古代儿童玩具，可以提高儿童武学悟性"
		wds[2] = 25
		wds[3] = 1
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0xB88A499A
	    wds[13] = 0x5E4CC079
	elseif wd == "搜神记" then
		wds[1] = "古代儿童玩具，可以提高儿童法术悟性"
		wds[2] = 25
		wds[3] = 2
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0xCBE7FC23
	    wds[13] = 0xD8BCD815
	elseif wd == "论语" then
		wds[1] = "古代儿童玩具，可以提高儿童心态"
		wds[2] = 25
		wds[3] = 3
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0x6B17D536
	    wds[13] = 0x8BC893E3
	elseif wd == "瑶池蟠桃" then
		wds[1] = "古代儿童玩具，可以提高儿童体质"
		wds[2] = 25
		wds[3] = 4
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0x58849704
	    wds[13] = 0x140D0428
	elseif wd == "怪物卡片" then
		wds[1] = "一张记载着某种怪物造型的神奇卡片，使用后可以变化身形"
		wds[2] = 30
		wds[3] = 1
		wds[4] = 1
	-- 法宝
	elseif wd == "碧玉葫芦" then
		wds[1] = "华佗悬壶济世时所带的翡翠葫芦，此宝长期跟随华佗行医，也深谙医术。佩戴此宝会增加师门法术回复的气血。"
		wds[2] = 1000
		wds[3] = 1
		wds[4] = 1
		wds[5] = 1
		wds[6] = 60
	    wds[11] = "item.wdf"
	    wds[12] = 0x60523FF1
	    wds[13] = 0x7669E147
	elseif wd == "金钱镖" then
		wds[1] = "财神爷的看家宝贝，散出千枚铜钱伤人，如果碰上不为金钱所动的人就没有办法了。每次使用消耗当前金钱2000。"
		wds[2] = 1000
		wds[3] = 1
		wds[4] = 1
		wds[5] = 1
		wds[6] = 60
		wds[7] = 1
		wds[8] = 4
	    wds[11] = "item.wdf"
	    wds[12] = 0x3D9C84A5
	    wds[13] = 0xC876D78A
 	elseif wd == "五色旗盒" then
		wds[1] = "昔日唐王拜将，天将五色旗勤兵。臣民以为祥瑞。丞相乃进五色旗盒，以盛锦旗。江湖素有能人巧士，依样画葫芦得到此宝，为行囊便利之用。"
		wds[2] = 1000
		wds[3] = 1
		wds[4] = 1
		wds[5] = 2
		wds[6] = 60
		wds[7] = 1
		wds[8] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0x2FC44068
	    wds[13] = 0x5D2FF1BC
 	elseif wd == "飞剑" then
		wds[1] = "此飞剑可以从千里之外出击，取敌人首级如探囊取物，精准的袭击令人瞪目，佩戴飞剑可以增加人物命中。"
		wds[2] = 1000
		wds[3] = 1
		wds[4] = 1
		wds[5] = 0
		wds[6] = 60
		wds[7] = 1
		wds[8] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0x1C7633D1
	    wds[13] = 0xBC2FAF63
 	elseif wd == "拭剑石" then
		wds[1] = "以石拭剑，可以厉其锋，此乃蜀山上千百仙剑拭剑之石，佩戴此石可增加人物伤害。"
		wds[2] = 1000
		wds[3] = 1
		wds[4] = 1
		wds[5] = 0
		wds[6] = 60
		wds[7] = 1
		wds[8] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xF95F660F
	    wds[13] = 0xF37BA20D
  	elseif wd == "金甲仙衣" then
		wds[1] = "拥有神奇效果的道家仙衣，穿上它在战斗中承受物理攻击时候可能出现天兵保护。"
		wds[2] = 1000
		wds[3] = 1
		wds[4] = 1
		wds[5] = 0
		wds[6] = 60
		wds[7] = 1
		wds[8] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0x081E1FF5
	    wds[13] = 0x0BDFD09C
  	elseif wd == "惊魂铃" then
		wds[1] = "铃声长鸣，闻者胆战心惊。战斗中摇晃可以恐吓敌方召唤兽，使其丧失斗志试图逃离战场。"
		wds[2] = 1000
		wds[3] = 1
		wds[4] = 1
		wds[5] = 1
		wds[6] = 60
		wds[7] = 2
		wds[8] = 4
	    wds[11] = "item.wdf"
	    wds[12] = 0xEAA6AD2E
	    wds[13] = 0x450BE7E8
   	elseif wd == "嗜血幡" then
		wds[1] = "暗红色的布幡，散发着血腥嗜杀的气息，拥有此旗在物理攻击时有一定几率额外多攻击一个目标。"
		wds[2] = 1000
		wds[3] = 1
		wds[4] = 1
		wds[5] = 0
		wds[6] = 60
		wds[7] = 1
		wds[8] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xD92DF835
	    wds[13] = 0x50997E59
    elseif wd == "风袋" then
		wds[1] = "风婆系在腰间装风的布袋，放出风来可吹人至数里外，佩上此袋可增加人物速度。"
		wds[2] = 1000
		wds[3] = 1
		wds[4] = 1
		wds[5] = 0
		wds[6] = 60
		wds[7] = 1
		wds[8] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0x9968555F
	    wds[13] = 0x59E58E52
    elseif wd == "清心咒" then
		wds[1] = "佛门经文，在心中默念三遍可不受外界干扰，清心自如，使用后可解除因法宝而带来的异常效果。"
		wds[2] = 1000
		wds[3] = 1
		wds[4] = 1
		wds[5] = 1
		wds[6] = 60
		wds[7] = 1
		wds[8] = 5
	    wds[11] = "item.wdf"
	    wds[12] = 0xCC7D6870
	    wds[13] = 0xA284A058
    elseif wd == "九黎战鼓" then
		wds[1] = "九黎氏族用蛮兽之皮所制的战鼓，佩戴此法宝可以在战斗中增加召唤兽的攻击力。"
		wds[2] = 1000
		wds[3] = 1
		wds[4] = 1
		wds[5] = 0
		wds[6] = 60
		wds[7] = 1
		wds[8] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xAA69D61E
	    wds[13] = 0xB4FA2E7D
 	elseif wd == "盘龙壁" then
		wds[1] = "以恶龙之骨制成的饰品，佩带此宝可以在战斗中增加召唤兽的防御。"
		wds[2] = 1000
		wds[3] = 1
		wds[4] = 1
		wds[5] = 0
		wds[6] = 60
		wds[7] = 1
		wds[8] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0x54C9A8DC
	    wds[13] = 0xC7F67DF4
  	elseif wd == "神行飞剑" then
		wds[1] = "玄铁打造的雌雄飞剑，佩戴此法宝可以在战斗中增加召唤兽的速度。"
		wds[2] = 1000
		wds[3] = 1
		wds[4] = 1
		wds[5] = 0
		wds[6] = 60
		wds[7] = 1
		wds[8] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0x5F80A13D
	    wds[13] = 0x9F57F723
  	elseif wd == "汇灵盏" then
		wds[1] = "凌霄宝殿内的宫灯，佩戴此法宝可以在战斗中增加召唤兽的灵力。"
		wds[2] = 1000
		wds[3] = 1
		wds[4] = 1
		wds[5] = 0
		wds[6] = 60
		wds[7] = 1
		wds[8] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0x82982E6B
	    wds[13] = 0x513D3054
 	elseif wd == "天师符" then
		wds[1] = "神奇的符纸，上面记载着张天师的秘传制符心法，是方寸山的不传之秘，佩戴此符的方寸山弟子将拥有更强大的符咒操控能力。"
		wds[2] = 1000
		wds[3] = 1
		wds[4] = 1
		wds[5] = 0
		wds[6] = 60
		wds[7] = 1
		wds[8] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0x44CA233C
	    wds[13] = 0xA5310A75
 	elseif wd == "织女扇" then
		wds[1] = "女儿村特有的羽扇，以织女而得名。佩戴后可以提升女儿村的封印能力。"
		wds[2] = 1000
		wds[3] = 1
		wds[4] = 1
		wds[5] = 0
		wds[6] = 60
		wds[7] = 1
		wds[8] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0x6EA31DE4
	    wds[13] = 0xD3F4F8DB
  	elseif wd == "发瘟匣" then
		wds[1] = "五瘟正神的密保，匣内盛满着发瘟蛊，一旦开启能使目标晕头转向，无法使用法术并且攻击失误。"
		wds[2] = 1000
		wds[3] = 2
		wds[4] = 1
		wds[5] = 1
		wds[6] = 80
		wds[7] = 5
		wds[8] = 4
	    wds[11] = "item.wdf"
	    wds[12] = 0x5F0D2E50
	    wds[13] = 0x780299ED
  	elseif wd == "断线木偶" then
		wds[1] = "桃木作的人形玩偶，上面雕刻着古怪的符文，会吸引召唤兽对它进行攻击。"
		wds[2] = 1000
		wds[3] = 2
		wds[4] = 1
		wds[5] = 1
		wds[6] = 80
		wds[7] = 3
		wds[8] = 4
	    wds[11] = "item.wdf"
	    wds[12] = 0xA9A08E99
	    wds[13] = 0x812181A6
   	elseif wd == "五彩娃娃" then
		wds[1] = "衣着五彩，色泽鲜美的布娃娃，战斗中会替主人承受一定的伤害。"
		wds[2] = 1000
		wds[3] = 2
		wds[4] = 2
		wds[5] = 0
		wds[6] = 80
		wds[7] = 6
		wds[8] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0x5C86CDBC
	    wds[13] = 0xEFDC64D0
    elseif wd == "七杀" then
		wds[1] = "勘破人间仁与义，七杀下凡啸腥风。此宝为五斗星君的饰物，战斗祭起后战意漫天，令对手丧失斗志，毫无招架之力。战斗中使用后三回合内降低目标防御，效果无法叠加。"
		wds[2] = 1000
		wds[3] = 2
		wds[4] = 2
		wds[5] = 1
		wds[6] = 80
		wds[7] = 4
		wds[8] = 5
	    wds[11] = "item.wdf"
	    wds[12] = 0x1715E7DE
	    wds[13] = 0x3AE1FD6A
    elseif wd == "金刚杵" then
		wds[1] = "佛门利器，可断除烦恼、除恶魔，代表佛智、空性、真如与智慧。佩戴后可以提升对五行之术的掌握，使五行法术的伤害增加。"
		wds[2] = 1000
		wds[3] = 2
		wds[4] = 2
		wds[5] = 0
		wds[6] = 80
		wds[7] = 6
		wds[8] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0x6F9B0510
	    wds[13] = 0x3E968F47
	elseif wd == "附灵玉" then
		wds[1] = "增加一定的人物灵力，随着境界提升增加灵力值"
		wds[2] = 1000
		wds[3] = 2
		wds[4] = 2
		wds[5] = 0
		wds[6] = 80
		wds[7] = 6
		wds[8] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0x5C571B45
	    wds[13] = 0x7F16538C
    elseif wd == "兽王令" then
		wds[1] = "玉麒麟甲制成的令牌，经青毛狮以妖力修炼，拥有号令百兽的威力。佩戴此物战斗中所有召唤兽能力都得到提升。"
		wds[2] = 1000
		wds[3] = 2
		wds[4] = 2
		wds[5] = 0
		wds[6] = 80
		wds[7] = 6
		wds[8] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0x6D4DD526
	    wds[13] = 0xF3F163D2
    elseif wd == "摄魂" then
		wds[1] = "阎王要你三更死，谁敢留人过五更。此物为黄泉中至阴之物，专门摄取生魂，通常勾魂使者才能携带。祭起后使目标失魂落魄，失去生气，三回合内承受的伤害增加。"
		wds[2] = 1000
		wds[3] = 2
		wds[4] = 2
		wds[5] = 1
		wds[6] = 80
		wds[7] = 3
		wds[8] =4
	    wds[11] = "item.wdf"
	    wds[12] = 0xBDD4BF97
	    wds[13] = 0xAFF8536F
   elseif wd == "鬼泣" then
		wds[1] = "在十八层地狱深处锻造之铃，吸收地府冤怨之气，摇之如闻听百鬼魂群号，可震慑敌方召唤兽，使其丧失斗志试图逃离战场。"
		wds[2] = 1000
		wds[3] = 3
		wds[4] = 2
		wds[5] = 1
		wds[6] = 100
		wds[7] = 3
		wds[8] = 4
	    wds[11] = "item.wdf"
	    wds[12] = 0xF600EEBC
	    wds[13] = 0xEAF4BEB0
    elseif wd == "月光宝盒" then
		wds[1] = "神奇的宝盒，可以前去500年，后回500年。对着月光念出咒语，你就可以到达想去的地方。可以在任意地点定下标记，在非战斗中使用直接到达。半小时限使用一次。"
		wds[2] = 1000
		wds[3] = 3
		wds[4] = 2
		wds[5] = 2
		wds[6] = 100
		wds[7] = 3
		wds[8] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0x95DC9FE9
	    wds[13] = 0x10ADFCD8
     elseif wd == "缩地尺" then
		wds[1] = "某个神仙制造的逃跑工具，战斗中使用后可以迅速离开战斗逃至其他地方，有可能逃跑失败哟。"
		wds[2] = 1000
		wds[3] = 3
		wds[4] = 2
		wds[5] = 1
		wds[6] = 100
		wds[7] = 3
		wds[8] = 5
	    wds[11] = "item.wdf"
	    wds[12] = 0x58C421DC
	    wds[13] = 0x8C891F83
   elseif wd == "混元伞" then
		wds[1] = "多闻天王的巨伞，撑起后可遮天蔽日。它能随机将自己承受的部分伤害反弹给对方单个成员。"
		wds[2] = 1000
		wds[3] = 3
		wds[4] = 2
		wds[5] = 1
		wds[6] = 100
		wds[7] = 10
		wds[8] = 5
	    wds[11] = "item.wdf"
	    wds[12] = 0x7729A9E5
	    wds[13] = 0x4110011C
    elseif wd == "无魂傀儡" then
		wds[1] = "眼神涣散、毫无生机的傀儡，他们的魂魄已经消失，只有机械的吸引目标对其发起攻击。"
		wds[2] = 1000
		wds[3] = 3
		wds[4] = 2
		wds[5] = 1
		wds[6] = 100
		wds[7] = 0
		wds[8] = 4
	    wds[11] = "item.wdf"
	    wds[12] = 0x05896BCC
	    wds[13] = 0x32F92F8A
     elseif wd == "苍白纸人" then
		wds[1] = "符纸制成的纸人，看起来单薄羸弱，在主人受到伤害时会自动现身护主。"
		wds[2] = 1000
		wds[3] = 3
		wds[4] = 2
		wds[5] = 1
		wds[6] = 100
		wds[7] = 6
		wds[8] = 5
	    wds[11] = "item.wdf"
	    wds[12] = 0xB91E0707
	    wds[13] = 0x46EC6216
      elseif wd == "聚宝盆" then
		wds[1] = "宝盆能聚宝，财源滚滚来。佩带此盆在获得金钱时额外增加一些金钱。每提升3级修炼境界即可获得更多的额外金钱。"
		wds[2] = 1000
		wds[3] = 3
		wds[4] = 2
		wds[5] = 1
		wds[6] = 100
		wds[7] = 6
		wds[8] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xAE883DD2
	    wds[13] = 0xCE09A059
      elseif wd == "乾坤玄火塔" then
		wds[1] = "托塔天王的另一件宝贝，祭起后可增加斗志与杀气，使勇者更勇。使用后可以在一定回合内增加愤怒值。"
		wds[2] = 1000
		wds[3] = 3
		wds[4] = 2
		wds[5] = 1
		wds[6] = 100
		wds[7] = 10
		wds[8] = 5
	    wds[11] = "item.wdf"
	    wds[12] = 0xF5601CC2
	    wds[13] = 0x1824AF14
     elseif wd == "无尘扇" then
		wds[1] = "不沾染尘世间恩怨的扇子，可以使人心情大悦。在战斗中祭起后可以在一定回合内减少对目标的愤怒。"
		wds[2] = 1000
		wds[3] = 3
		wds[4] = 2
		wds[5] = 1
		wds[6] = 100
		wds[7] = 10
		wds[8] = 4
	    wds[11] = "item.wdf"
	    wds[12] = 0xA1224711
	    wds[13] = 0x9F92A376
    elseif wd == "无字经" then
		wds[1] = "无字无画的经书，据说只有开启天眼之人才可以看到竹简上的文字。战斗中祭起经书有很高几率使目标丧失心神，无法使用主动法宝。"
		wds[2] = 1000
		wds[3] = 3
		wds[4] = 2
		wds[5] = 1
		wds[6] = 100
		wds[7] = 5
		wds[8] = 4
	    wds[11] = "item.wdf"
	    wds[12] = 0x7E0AC2BC
	    wds[13] = 0x83A634D9
   elseif wd == "干将莫邪" then
		wds[1] = "采五山之精铁，六合之金英，七七四十九日以身赴铜水，血凝剑气而成，削金如泥，吹毛得过，佩带在身上就已剑气横溢，令人心生怯意。战斗中祭起后杀气冲天，三回合内法宝携带者增加极高的伤害。"
		wds[2] = 1000
		wds[3] = 3
		wds[4] = 2
		wds[5] = 1
		wds[6] = 100
		wds[7] = 5
		wds[8] = 5
	    wds[11] = "item.wdf"
	    wds[12] = 0x6B5B81EF
	    wds[13] = 0x5723DCC0
    elseif wd == "慈悲" then
		wds[1] = "佛门之人慈悲为怀，有普度救世之心，因而得名以广佛门善心。佩带后可以提升恢复效果。"
		wds[2] = 1000
		wds[3] = 3
		wds[4] = 2
		wds[5] = 0
		wds[6] = 100
		wds[7] = 10
		wds[8] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xA68AB260
	    wds[13] = 0x880E0979
      elseif wd == "救命毫毛" then
		wds[1] = "当年观音大士赠予孙悟空取经路上救急之用的宝贝，孙悟空修成正果后把此宝转增方寸山弟子，佩带毫毛在战斗中死亡后每回合有一定几率复活，每场战斗最多允许复活三次。"
		wds[2] = 1000
		wds[3] = 3
		wds[4] = 2
		wds[5] = 0
		wds[6] = 100
		wds[7] = 10
		wds[8] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xCD4EA3D4
	    wds[13] = 0xE95997AD
      elseif wd == "伏魔天书" then
		wds[1] = "上面记载着降魔伏妖的秘法，可以大幅度提升天宫弟子的法术威力。"
		wds[2] = 1000
		wds[3] = 3
		wds[4] = 2
		wds[5] = 0
		wds[6] = 100
		wds[7] = 10
		wds[8] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0x36E1F4B7
	    wds[13] = 0x00A48670
      elseif wd == "镇海珠" then
		wds[1] = "以大禹治水时的石尺炼化而成，祭起此珠再大的风浪都要平息。佩戴此法宝的龙宫弟子可以领会本门神通的精髓，使自己的法术在战斗中发挥更大的威力。"
		wds[2] = 1000
		wds[3] = 3
		wds[4] = 2
		wds[5] = 0
		wds[6] = 100
		wds[7] = 10
		wds[8] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0x9FB5513B
	    wds[13] = 0xE73D5164
    elseif wd == "奇门五行令" then
		wds[1] = "镇元大仙的信物，可号令九州土地，其本身还有特殊的功效，战斗中祭起一定几率使目标两回合内神志不清，法术攻击失去准头。"
		wds[2] = 1000
		wds[3] = 3
		wds[4] = 2
		wds[5] = 1
		wds[6] = 100
		wds[7] = 5
		wds[8] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0x3463ADAD
	    wds[13] = 0x85774C73
   elseif wd == "失心钹" then
		wds[1] = "以玄铁为材料，在畜生道中历练千年的霸道妖器。祭起后鬼哭狼嚎，可减少自身所收到的召唤兽伤害。"
		wds[2] = 1000
		wds[3] = 3
		wds[4] = 2
		wds[5] = 0
		wds[6] = 100
		wds[7] = 10
		wds[8] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xA2FE6F68
	    wds[13] = 0xFAB633D8
    elseif wd == "五火神焰印" then
		wds[1] = "一祭风沙起，再祭烈火燃，三祭浓烟蔽日。红孩儿以内丹在离火内修炼数百年的印章，以龙子狻猊为印饰。佩戴此宝能增加法术暴击的几率。"
		wds[2] = 1000
		wds[3] = 3
		wds[4] = 2
		wds[5] = 0
		wds[6] = 100
		wds[7] = 10
		wds[8] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0x2890FFA9
	    wds[13] = 0xC36E1F99
     elseif wd == "九幽" then
		wds[1] = "孟婆的茶盏，沉淀着每个鬼魂投胎转世前的怨恨与无奈，其怨之深，其恨之毒，天下无双。此物佩戴者在战斗中可通过尸腐毒造成的伤害为本方玩家成员治疗当前气血，包括持续伤害。每人每回合气血回复血量最多不超过等级*3。"
		wds[2] = 1000
		wds[3] = 3
		wds[4] = 2
		wds[5] = 0
		wds[6] = 100
		wds[7] = 10
		wds[8] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0x7E21AF3F
	    wds[13] = 0xB47273A0
    elseif wd == "普渡" then
		wds[1] = "观音大士流传下的至宝，佩戴此法宝后在战斗中使用普渡众生法术时有一定几率额外增加一个目标。"
		wds[2] = 1000
		wds[3] = 3
		wds[4] = 2
		wds[5] = 0
		wds[6] = 100
		wds[7] = 10
		wds[8] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xF4E2C1E9
	    wds[13] = 0x1F73D09F
	elseif wd == "月影" then
		wds[1] = "增加法术连击几率"
		wds[2] = 1000
		wds[3] = 3
		wds[4] = 2
		wds[5] = 0
		wds[6] = 100
		wds[7] = 10
		wds[8] = 0
	    wds[11] = "common/item.wdf"
	    wds[12] = 0xDBDE982D
	    wds[13] = 0x365A8D06
	elseif wd == "蟠龙玉璧" then
		wds[1] = "受到物理攻击或者法术攻击时，一定概率减少一定的伤害。"
		wds[2] = 1000
		wds[3] = 4
		wds[4] = 2
		wds[5] = 0
		wds[6] = 120
		wds[7] = 10
		wds[8] = 0
	    wds[11] = "common/item.wdf"
	    wds[12] = 0x8BB5755
	    wds[13] = 0x3078DDD7
	elseif wd == "落星飞鸿" then
		wds[1] = "进入战斗时，提升自身物理伤害。"
		wds[2] = 1000
		wds[3] = 4
		wds[4] = 2
		wds[5] = 0
		wds[6] = 120
		wds[7] = 10
		wds[8] = 0
	    wds[11] = "common/item.wdf"
	    wds[12] = 0x1945AAEE
	    wds[13] = 0xA097B923
	elseif wd == "流影云笛" then
		wds[1] = "进入战斗时，提升自身法术伤害。"
		wds[2] = 1000
		wds[3] = 4
		wds[4] = 2
		wds[5] = 0
		wds[6] = 120
		wds[7] = 10
		wds[8] = 0
	    wds[11] = "common/item.wdf"
	    wds[12] = 0x198A6291
	    wds[13] = 0x3340D267
	elseif wd == "千斗金樽" then
		wds[1] = "随战斗回合数增加物理暴击率"
		wds[2] = 1000
		wds[3] = 4
		wds[4] = 2
		wds[5] = 0
		wds[6] = 120
		wds[7] = 10
		wds[8] = 0
	    wds[11] = "common/item.wdf"
	    wds[12] = 0x8B4E9AC5
	    wds[13] = 0xAA6F6118
	elseif wd == "宿幕星河" then
		wds[1] = "随战斗回合数增加法术暴击率"
		wds[2] = 1000
		wds[3] = 4
		wds[4] = 2
		wds[5] = 0
		wds[6] = 120
		wds[7] = 10
		wds[8] = 0
	    wds[11] = "common/item.wdf"
	    wds[12] = 0xBCB52ACC
	    wds[13] = 0x85A009F9
	elseif wd == "归元圣印" then
		wds[1] = "提升治疗量"
		wds[2] = 1000
		wds[3] = 4
		wds[4] = 2
		wds[5] = 0
		wds[6] = 120
		wds[7] = 10
		wds[8] = 0
	    wds[11] = "common/item.wdf"
	    wds[12] = 0xEC524D4A
	    wds[13] = 0x127A05ED
	elseif wd == "天眼通符" then
		wds[1] = "天界的灵符,具有洞察世界万物象的神奇作用。\n【效果】可以查看到部分任务要求的NPC准确坐标。"
		wds[2] = 9
		wds[3] = 3
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0xDF37C485
	    wds[13] = 0x7FA4203F
	    wds[14] = 10000
	-- 任务物品
	elseif wd == "枯萎的金莲" then
		wds[1] = "尘世间人性的金莲，已因心魔之灭而焦枯。"
		wds[2] = 1001
		wds[3] = 1
		wds[4] = 1
		wds[8] = nil
	    wds[11] = "item.wdf"
	    wds[12] = 0x88DCF8C0
	    wds[13] = 0x3B5F875C
	elseif wd == "赤叶甘草" then
		wds[1] = "王大嫂的儿子病了，听说这种稀有的赤叶甘草可以救他一命。"
		wds[2] = 1001
		wds[3] = 2
		wds[4] = 1
		wds[8] = nil
	    wds[11] = "item.wdf"
	    wds[12] = 0x7695864F
	    wds[13] = 0x398835C0
	elseif wd == "红烧鱼" then
		wds[1] = "王大嫂独家制作，美味极了。"
		wds[2] = 1001
		wds[3] = 2
		wds[4] = 2
		wds[8] = nil
	    wds[11] = "item.wdf"
	    wds[12] = 0x92E700A4
	    wds[13] = 0x4D688A82
	elseif wd == "松风灵芝" then
		wds[1] = "生长在松林之中的珍贵灵芝，十分稀有"
		wds[2] = 1001
		wds[3] = 2
		wds[4] = 3
		wds[8] = nil
	    wds[11] = "item.wdf"
	    wds[12] = 0x2F7C81CE
	    wds[13] = 0x696C18EE
	-- 副本物品
	elseif wd == "玲珑" then
		wds[1] = "交给观音大士，是锻造照妖镜所需要的材料。"
		wds[2] = 21
		wds[3] = 2
		wds[4] = 1
		wds[8] = nil
	    wds[11] = "item.wdf"
	    wds[12] = 0xDDA1D3AA
	    wds[13] = 0xD3DC3123
	elseif wd == "鬼切草" then
		wds[1] = "来自异或的草药听说这种稀有的鬼切草。"
		wds[2] = 1001
		wds[3] = 2
		wds[4] = 1
		wds[8] = nil
	    wds[11] = "item.wdf"
	    wds[12] = 0x7695864F
	    wds[13] = 0x398835C0
	elseif wd == "灵丹" then
		wds[1] = "召唤兽进阶的道具，能够唤醒召唤兽体内的潜力，突破界限，完成进阶；进阶后的召唤兽可以增加一定的资质和成长。"
		wds[2] = 3
		wds[3] = 3
		wds[4] = 0
	    wds[11] = "common/item.wdf"
	    wds[12] = 0xE41F5356
	    wds[13] = 0x5B75710B
	elseif wd == "易经丹" then
		wds[1] = "《异兽录》之中记载的奇妙药丸，使用得当可助召唤兽打通筋骨达到形易经之境。"
		wds[2] = "召唤兽道具"
		wds[3] = 3
		wds[4] = 0
	    wds[11] = "item.wd1"
	    wds[12] = 0xD9BBCB07
	    wds[13] = 0x8C34FD39
	elseif wd == "初级清灵仙露" then
		wds[1] = "由清灵净瓶所汇聚的神奇仙露，可以用于提升召唤兽的灵性。（只对50≤灵性≤100的召唤兽使用）"
		wds[2] = "召唤兽道具"
		wds[3] = 3
		wds[4] = 0
	    wds[11] = "item.wd1"
	    wds[12] = 0x6F4A548E
	    wds[13] = 0x1287E12D
	elseif wd == "中级清灵仙露" then
		wds[1] = "由清灵净瓶所汇聚的神奇仙露，可以用于提升召唤兽的灵性。（只对50≤灵性≤100的召唤兽使用）"
		wds[2] = "召唤兽道具"
		wds[3] = 3
		wds[4] = 0
	    wds[11] = "item.wd1"
	    wds[12] = 0xFD5F44C0
	    wds[13] = 0xC8F9A4D3
	elseif wd == "高级清灵仙露" then
		wds[1] = "由清灵净瓶所汇聚的神奇仙露，可以用于提升召唤兽的灵性。（只对50≤灵性≤100的召唤兽使用）"
		wds[2] = "召唤兽道具"
		wds[3] = 3
		wds[4] = 0
	    wds[11] = "item.wd1"
	    wds[12] = 0xE0D95C88
	    wds[13] = 0x253B7A83
	elseif wd == "玉葫灵髓" then
		wds[1] = "《博物录》之中记载的玄妙丹药，可以将召唤兽已使用的清灵仙露的状态回归原始。"
		wds[2] = "召唤兽道具"
		wds[3] = 3
		wds[4] = 0
	    wds[11] = "item.wd1"
	    wds[12] = 0x3FE08883
	    wds[13] = 0x05104141
	elseif wd == "清灵净瓶" then
		wds[1] = "自上古流传至今的神奇净瓶，注以灵力之后可以汇聚净瓶仙露。"
		wds[2] = "召唤兽道具"
		wds[3] = 3
		wds[4] = 0
	    wds[11] = "item.wd1"
	    wds[12] = 0xBB62F78D
	    wds[13] = 0x455BD7CF
	elseif wd == "神兽内丹" then
		wds[1] = "召唤兽进阶的道具，能够唤醒召唤兽体内的潜力，突破界限，完成进阶；进阶后的召唤兽可以增加一定的资质和成长。"
		wds[2] = 9
		wds[3] = 8
		wds[4] = 0
	    wds[11] = "common/item.wdf"
	    wds[12] = 0x6B910BEF
	    wds[13] = 0x2D3FDF9
	elseif wd == "洗点丹" then
		wds[1] = "可以改变身体的资质"
		wds[2] = 9
		wds[3] = 9
		wds[4] = 0
	    wds[11] = "common/item.wdf"
	    wds[12] = 0x48BB2900
	    wds[13] = 0x194BA126
	elseif wd == "坐骑星辰碎片" then
		wds[1] = "古人根据星辰飞落的方式研究出的捕捉怪物,里面记载着捕捉怪物的方法，使用〖100〗个【坐骑星辰碎片】后可以获取随机坐骑!"
		wds[2] = 9
		wds[3] = 4
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0xC93BEEA5
	    wds[13] = 0x39DF5C8A
	    wds[14] = 500
	elseif wd == "星辰碎片" then
		wds[1] = "星辰碎片，使用后可以穿梭于各大陆之间"
		wds[2] = 9
		wds[3] = 5
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0xC93BEEA5
	    wds[13] = 0x39DF5C8A
	    wds[14] = 500
	elseif wd == "琉璃盏的碎片" then
		wds[1] = "琉璃盏的碎片，使用后可以穿梭于各大陆之间"
		wds[2] = 9
		wds[3] = 6
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0xDB545CED
	    wds[13] = 0x4E8477A9
	    wds[14] = 500
	elseif wd == "破碎的绿烟如梦" then
		wds[1] = "八戒悟空剧情"
		wds[2] = 9
		wds[3] = 10
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0xB841243C
	    wds[13] = 0x5767358F
	    wds[14] = 500
	elseif wd == "召唤兽饰品碎片" then
		wds[1] = "里面记载着远古时期,古人对召唤兽研究的模样,不过后来被人不小心打碎了散落四方,筹齐之后,方可使用,可使参战的召唤兽得到一个【饰品①】效果!"
		wds[2] = 9
		wds[3] = 11
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0xB841243C
	    wds[13] = 0x5767358F
	    wds[14] = 500
	-- elseif wd == "特赦令牌" then
	-- 	wds[1] = "特赦令牌，只要有了他就可以超度一个地狱冤魂 地狱迷宫三(40，45)"
	-- 	wds[2] = 9
	-- 	wds[3] = 7
	-- 	wds[4] = 1
	--     wds[11] = "item.wdf"
	--     wds[12] = 0x8FF330C0
	--     wds[13] = 0xFE72166A
	--     wds[14] = 500
	elseif wd == "宠物口粮" or wd == "口粮" then
		wds[1] = "宠物非常喜欢的食物,可以恢复一定的宠物耐力."
		wds[2] = 4
		wds[3] = 2
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0X73080A8C
	    wds[13] = 0X33BBE002
	    wds[14] = 80
	elseif wd == "高级宠物口粮" then
		wds[1] = "宠物非常喜欢的食物,可以大量恢复宠物耐力."
		wds[2] = 4
		wds[3] = 2
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0X73080A8C
	    wds[13] = 0XDBB55CC4
	    wds[14] = 80
	--符石分割
----一级符石----
	elseif wd == "冰符石" then
		wds[1] = "铭刻着神秘符文的上古神石,散落三界,具备神秘力量"
		wds[2] = 55
		wds[3] = 1
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0x934E9733
	    wds[13] = 0x6A962ED6
	    wds[15] = "可以镶嵌在有开运孔数的装备上"
	    wds[16] = 1--符石等级
	    wds[17] = 150--耐久
	    wds[18] = "体质"--效果
	    wds[19] = 1--效果加成属性
	    wds[20] = "红色"--颜色
	elseif wd == "土符石" then
		wds[1] = "铭刻着神秘符文的上古神石,散落三界,具备神秘力量"
		wds[2] = 55
		wds[3] = 1
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0x3E964C29
	    wds[13] = 0x7E78A604
	    wds[15] = "可以镶嵌在有开运孔数的装备上"
	    wds[16] = 1--符石等级
	    wds[17] = 150--耐久
	    wds[18] = "耐力"--效果
	    wds[19] = 1--效果加成属性
	    wds[20] = "红色"--颜色
	elseif wd == "雷符石" then
		wds[1] = "铭刻着神秘符文的上古神石,散落三界,具备神秘力量"
		wds[2] = 55
		wds[3] = 1
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0x67B1F794
	    wds[13] = 0x953A5574
	    wds[15] = "可以镶嵌在有开运孔数的装备上"
	    wds[16] = 1--符石等级
	    wds[17] = 150--耐久
	    wds[18] = "敏捷"--效果
	    wds[19] = 1--效果加成属性
	    wds[20] = "红色"--颜色
	elseif wd == "电符石" then
		wds[1] = "铭刻着神秘符文的上古神石,散落三界,具备神秘力量"
		wds[2] = 55
		wds[3] = 1
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0xFCCD6BDA
	    wds[13] = 0x45E07435
	    wds[15] = "可以镶嵌在有开运孔数的装备上"
	    wds[16] = 1--符石等级
	    wds[17] = 150--耐久
	    wds[18] = "法术防御"--效果
	    wds[19] = 1--效果加成属性
	    wds[20] = "红色"--颜色
	elseif wd == "风符石" then
		wds[1] = "铭刻着神秘符文的上古神石,散落三界,具备神秘力量"
		wds[2] = 55
		wds[3] = 2
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0x9D282EE9
	    wds[13] = 0x4180FB8D
	    wds[15] = "可以镶嵌在有开运孔数的装备上"
	    wds[16] = 1--符石等级
	    wds[17] = 150--耐久
	    wds[18] = "魔力"--效果
	    wds[19] = 1--效果加成属性
	    wds[20] = "黄色"--颜色
	elseif wd == "炎符石" then
		wds[1] = "铭刻着神秘符文的上古神石,散落三界,具备神秘力量"
		wds[2] = 55
		wds[3] = 2
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0x21B13715
	    wds[13] = 0xEEAF3D8E
	    wds[15] = "可以镶嵌在有开运孔数的装备上"
	    wds[16] = 1--符石等级
	    wds[17] = 150--耐久
	    wds[18] = "力量"--效果
	    wds[19] = 1--效果加成属性
	    wds[20] = "黄色"--颜色
	elseif wd == "火符石" then
		wds[1] = "铭刻着神秘符文的上古神石,散落三界,具备神秘力量"
		wds[2] = 55
		wds[3] = 2
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0xDC81D311
	    wds[13] = 0x71E54CDB
	    wds[15] = "可以镶嵌在有开运孔数的装备上"
	    wds[16] = 1--符石等级
	    wds[17] = 150--耐久
	    wds[18] = "法术伤害"--效果
	    wds[19] = 1--效果加成属性
	    wds[20] = "黄色"--颜色
----二级二级符石----
	elseif wd == "红云符石" then
		wds[1] = "铭刻着神秘符文的上古神石,散落三界,具备神秘力量"
		wds[2] = 55
		wds[3] = 1
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0x76BEE0E4
	    wds[13] = 0x74261456
	    wds[15] = "可以镶嵌在有开运孔数的装备上"
	    wds[16] = 2--符石等级
	    wds[17] = 150--耐久
	    wds[18] = "气血"--效果
	    wds[19] = 10--效果加成属性
	    wds[20] = "红色"--颜色
	elseif wd == "碧玉符石" then
		wds[1] = "铭刻着神秘符文的上古神石,散落三界,具备神秘力量"
		wds[2] = 55
		wds[3] = 1
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0x43676CDF
	    wds[13] = 0x74261456
	    wds[15] = "可以镶嵌在有开运孔数的装备上"
	    wds[16] = 2--符石等级
	    wds[17] = 150--耐久
	    wds[18] = "防御"--效果
	    wds[19] = 3--效果加成属性
	    wds[20] = "红色"--颜色
	elseif wd == "金光符石" then
		wds[1] = "铭刻着神秘符文的上古神石,散落三界,具备神秘力量"
		wds[2] = 55
		wds[3] = 3
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0x5737526C
	    wds[13] = 0x727F812B
	    wds[15] = "可以镶嵌在有开运孔数的装备上"
	    wds[16] = 2--符石等级
	    wds[17] = 150--耐久
	    wds[18] = "命中"--效果
	    wds[19] = 4--效果加成属性
	    wds[20] = "蓝色"--颜色
	elseif wd == "天神符石" then
		wds[1] = "铭刻着神秘符文的上古神石,散落三界,具备神秘力量"
		wds[2] = 55
		wds[3] = 3
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0x81D8C883
	    wds[13] = 0x24549F76
	    wds[15] = "可以镶嵌在有开运孔数的装备上"
	    wds[16] = 2--符石等级
	    wds[17] = 150--耐久
	    wds[18] = "伤害"--效果
	    wds[19] = 1.5--效果加成属性
	    wds[20] = "蓝色"--颜色
	elseif wd == "飘渺符石" then
		wds[1] = "铭刻着神秘符文的上古神石,散落三界,具备神秘力量"
		wds[2] = 55
		wds[3] = 4
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0x6B9B8016
	    wds[13] = 0x463956C5
	    wds[15] = "可以镶嵌在有开运孔数的装备上"
	    wds[16] = 2--符石等级
	    wds[17] = 150--耐久
	    wds[18] = "灵力"--效果
	    wds[19] = 1.5--效果加成属性
	    wds[20] = "绿色"--颜色
	elseif wd == "天仙符石" then
		wds[1] = "铭刻着神秘符文的上古神石,散落三界,具备神秘力量"
		wds[2] = 55
		wds[3] = 4
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0xE059F69F
	    wds[13] = 0xCC940789
	    wds[15] = "可以镶嵌在有开运孔数的装备上"
	    wds[16] = 2--符石等级
	    wds[17] = 150--耐久
	    wds[18] = "魔法"--效果
	    wds[19] = 6--效果加成属性
	    wds[20] = "绿色"--颜色
	elseif wd == "霞光符石" then
		wds[1] = "铭刻着神秘符文的上古神石,散落三界,具备神秘力量"
		wds[2] = 55
		wds[3] = 4
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0xC32FCFBF
	    wds[13] = 0xC94732AA
	    wds[15] = "可以镶嵌在有开运孔数的装备上"
	    wds[16] = 2--符石等级
	    wds[17] = 150--耐久
	    wds[18] = "速度"--效果
	    wds[19] = 1.5--效果加成属性
	    wds[20] = "绿色"--颜色
	elseif wd == "逍遥符石" then
		wds[1] = "铭刻着神秘符文的上古神石,散落三界,具备神秘力量"
		wds[2] = 55
		wds[3] = 4
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0x96B0982
	    wds[13] = 0x8CCCA725
	    wds[15] = "可以镶嵌在有开运孔数的装备上"
	    wds[16] = 2--符石等级
	    wds[17] = 150--耐久
	    wds[18] = "躲避"--效果
	    wds[19] = 3--效果加成属性
	    wds[20] = "绿色"--颜色
----三级符石----
	elseif wd == "虹珀符石" then
		wds[1] = "铭刻着神秘符文的上古神石,散落三界,具备神秘力量"
		wds[2] = 55
		wds[3] = 3
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0x5CF34122
	    wds[13] = 0xDF8358B
	    wds[15] = "可以镶嵌在有开运孔数的装备上"
	    wds[16] = 3--符石等级
	    wds[17] = 150--耐久
	    wds[18] = "体质"--效果
	    wds[19] = 1--效果加成属性
	    wds[20] = "蓝色"--颜色
	    wds[21] = "魔法"--效果11111
	    wds[22] = 6--效果加成属性11111111111
	elseif wd == "陌影符石" then
		wds[1] = "铭刻着神秘符文的上古神石,散落三界,具备神秘力量"
		wds[2] = 55
		wds[3] = 3
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0x6CCF8F49
	    wds[13] = 0x2207D0E7
	    wds[15] = "可以镶嵌在有开运孔数的装备上"
	    wds[16] = 3--符石等级
	    wds[17] = 150--耐久
	    wds[18] = "体质"--效果
	    wds[19] = 1--效果加成属性
	    wds[20] = "蓝色"--颜色
	    wds[21] = "命中"--效果11111
	    wds[22] = 4--效果加成属性11111111111
	elseif wd == "北冥符石" then
		wds[1] = "铭刻着神秘符文的上古神石,散落三界,具备神秘力量"
		wds[2] = 55
		wds[3] = 3
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0x90B92A2C
	    wds[13] = 0x8197B629
	    wds[15] = "可以镶嵌在有开运孔数的装备上"
	    wds[16] = 3--符石等级
	    wds[17] = 150--耐久
	    wds[18] = "体质"--效果
	    wds[19] = 1--效果加成属性
	    wds[20] = "蓝色"--颜色
	    wds[21] = "伤害"--效果11111
	    wds[22] = 1.5--效果加成属性11111111111
	elseif wd == "灵月符石" then
		wds[1] = "铭刻着神秘符文的上古神石,散落三界,具备神秘力量"
		wds[2] = 55
		wds[3] = 3
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0xFEA25D6F
	    wds[13] = 0xD83B95B5
	    wds[15] = "可以镶嵌在有开运孔数的装备上"
	    wds[16] = 3--符石等级
	    wds[17] = 150--耐久
	    wds[18] = "体质"--效果
	    wds[19] = 1--效果加成属性
	    wds[20] = "蓝色"--颜色
	    wds[21] = "防御"--效果11111
	    wds[22] = 3--效果加成属性11111111111
	elseif wd == "锦瑟符石" then
		wds[1] = "铭刻着神秘符文的上古神石,散落三界,具备神秘力量"
		wds[2] = 55
		wds[3] = 3
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0x22CBF322
	    wds[13] = 0xA9D94F23
	    wds[15] = "可以镶嵌在有开运孔数的装备上"
	    wds[16] = 3--符石等级
	    wds[17] = 150--耐久
	    wds[18] = "体质"--效果
	    wds[19] = 1--效果加成属性
	    wds[20] = "蓝色"--颜色
	    wds[21] = "速度"--效果11111
	    wds[22] = 1.5--效果加成属性11111111111
	elseif wd == "银光符石" then
		wds[1] = "铭刻着神秘符文的上古神石,散落三界,具备神秘力量"
		wds[2] = 55
		wds[3] = 3
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0xFC3CDE97
	    wds[13] = 0x23F7A22E
	    wds[15] = "可以镶嵌在有开运孔数的装备上"
	    wds[16] = 3--符石等级
	    wds[17] = 150--耐久
	    wds[18] = "体质"--效果
	    wds[19] = 1--效果加成属性
	    wds[20] = "蓝色"--颜色
	    wds[21] = "躲避"--效果11111
	    wds[22] = 3--效果加成属性11111111111
	elseif wd == "清心符石" then
		wds[1] = "铭刻着神秘符文的上古神石,散落三界,具备神秘力量"
		wds[2] = 55
		wds[3] = 3
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0x5610AE50
	    wds[13] = 0x2E6B730A
	    wds[15] = "可以镶嵌在有开运孔数的装备上"
	    wds[16] = 3--符石等级
	    wds[17] = 150--耐久
	    wds[18] = "体质"--效果
	    wds[19] = 1--效果加成属性
	    wds[20] = "蓝色"--颜色
	    wds[21] = "灵力"--效果11111
	    wds[22] = 1.5--效果加成属性11111111111
	elseif wd == "星辰符石" then
		wds[1] = "铭刻着神秘符文的上古神石,散落三界,具备神秘力量"
		wds[2] = 55
		wds[3] = 3
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0x2E893EE4
	    wds[13] = 0x41C0E80A
	    wds[15] = "可以镶嵌在有开运孔数的装备上"
	    wds[16] = 3--符石等级
	    wds[17] = 150--耐久
	    wds[18] = "体质"--效果
	    wds[19] = 1--效果加成属性
	    wds[20] = "蓝色"--颜色
	    wds[21] = "法术伤害"--效果11111
	    wds[22] = 2--效果加成属性11111111111
	elseif wd == "雪月符石" then
		wds[1] = "铭刻着神秘符文的上古神石,散落三界,具备神秘力量"
		wds[2] = 55
		wds[3] = 3
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0xEF64D308
	    wds[13] = 0x1088694D
	    wds[15] = "可以镶嵌在有开运孔数的装备上"
	    wds[16] = 3--符石等级
	    wds[17] = 150--耐久
	    wds[18] = "体质"--效果
	    wds[19] = 1--效果加成属性
	    wds[20] = "蓝色"--颜色
	    wds[21] = "法术防御"--效果11111
	    wds[22] = 2--效果加成属性11111111111
	elseif wd == "玄魂符石" then
		wds[1] = "铭刻着神秘符文的上古神石,散落三界,具备神秘力量"
		wds[2] = 55
		wds[3] = 3
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0x35232317
	    wds[13] = 0xBCA29B7A
	    wds[15] = "可以镶嵌在有开运孔数的装备上"
	    wds[16] = 3--符石等级
	    wds[17] = 150--耐久
	    wds[18] = "体质"--效果
	    wds[19] = 1--效果加成属性
	    wds[20] = "蓝色"--颜色
	    wds[21] = "固定伤害"--效果11111
	    wds[22] = 2--效果加成属性11111111111
	elseif wd == "乾坤符石" then
		wds[1] = "铭刻着神秘符文的上古神石,散落三界,具备神秘力量"
		wds[2] = 55
		wds[3] = 3
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0x7F4F2A9
	    wds[13] = 0x44861CDA
	    wds[15] = "可以镶嵌在有开运孔数的装备上"
	    wds[16] = 3--符石等级
	    wds[17] = 150--耐久
	    wds[18] = "耐力"--效果
	    wds[19] = 1--效果加成属性
	    wds[20] = "蓝色"--颜色
	    wds[21] = "气血"--效果11111
	    wds[22] = 10--效果加成属性11111111111
	elseif wd == "珍珀符石" then
		wds[1] = "铭刻着神秘符文的上古神石,散落三界,具备神秘力量"
		wds[2] = 55
		wds[3] = 3
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0x5CF34122
	    wds[13] = 0xDF8358B
	    wds[15] = "可以镶嵌在有开运孔数的装备上"
	    wds[16] = 3--符石等级
	    wds[17] = 150--耐久
	    wds[18] = "耐力"--效果
	    wds[19] = 1--效果加成属性
	    wds[20] = "蓝色"--颜色
	    wds[21] = "魔法"--效果11111
	    wds[22] = 6--效果加成属性11111111111
	elseif wd == "银竹符石" then
		wds[1] = "铭刻着神秘符文的上古神石,散落三界,具备神秘力量"
		wds[2] = 55
		wds[3] = 3
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0x3C1B72B
	    wds[13] = 0xCCE17B90
	    wds[15] = "可以镶嵌在有开运孔数的装备上"
	    wds[16] = 3--符石等级
	    wds[17] = 150--耐久
	    wds[18] = "耐力"--效果
	    wds[19] = 1--效果加成属性
	    wds[20] = "蓝色"--颜色
	    wds[21] = "命中"--效果11111
	    wds[22] = 4--效果加成属性11111111111
	elseif wd == "神川符石" then
		wds[1] = "铭刻着神秘符文的上古神石,散落三界,具备神秘力量"
		wds[2] = 55
		wds[3] = 3
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0xF95B369D
	    wds[13] = 0x240C05AE
	    wds[15] = "可以镶嵌在有开运孔数的装备上"
	    wds[16] = 3--符石等级
	    wds[17] = 150--耐久
	    wds[18] = "耐力"--效果
	    wds[19] = 1--效果加成属性
	    wds[20] = "蓝色"--颜色
	    wds[21] = "伤害"--效果11111
	    wds[22] = 1.5--效果加成属性11111111111
	elseif wd == "玲珑符石" then
		wds[1] = "铭刻着神秘符文的上古神石,散落三界,具备神秘力量"
		wds[2] = 55
		wds[3] = 3
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0x6AACFD5
	    wds[13] = 0x22F35AB7
	    wds[15] = "可以镶嵌在有开运孔数的装备上"
	    wds[16] = 3--符石等级
	    wds[17] = 150--耐久
	    wds[18] = "耐力"--效果
	    wds[19] = 1--效果加成属性
	    wds[20] = "蓝色"--颜色
	    wds[21] = "速度"--效果11111
	    wds[22] = 1.5--效果加成属性11111111111
	elseif wd == "暮影符石" then
		wds[1] = "铭刻着神秘符文的上古神石,散落三界,具备神秘力量"
		wds[2] = 55
		wds[3] = 3
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0x66A5CAF
	    wds[13] = 0xA1EFCBCD
	    wds[15] = "可以镶嵌在有开运孔数的装备上"
	    wds[16] = 3--符石等级
	    wds[17] = 150--耐久
	    wds[18] = "耐力"--效果
	    wds[19] = 1--效果加成属性
	    wds[20] = "蓝色"--颜色
	    wds[21] = "躲避"--效果11111
	    wds[22] = 3--效果加成属性11111111111
	elseif wd == "天珍符石" then
		wds[1] = "铭刻着神秘符文的上古神石,散落三界,具备神秘力量"
		wds[2] = 55
		wds[3] = 3
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0xDD550E98
	    wds[13] = 0x5A1058B4
	    wds[15] = "可以镶嵌在有开运孔数的装备上"
	    wds[16] = 3--符石等级
	    wds[17] = 150--耐久
	    wds[18] = "耐力"--效果
	    wds[19] = 1--效果加成属性
	    wds[20] = "蓝色"--颜色
	    wds[21] = "灵力"--效果11111
	    wds[22] = 1.5--效果加成属性11111111111
	elseif wd == "九影符石" then
		wds[1] = "铭刻着神秘符文的上古神石,散落三界,具备神秘力量"
		wds[2] = 55
		wds[3] = 3
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0xC14E158C
	    wds[13] = 0x74570AD9
	    wds[15] = "可以镶嵌在有开运孔数的装备上"
	    wds[16] = 3--符石等级
	    wds[17] = 150--耐久
	    wds[18] = "耐力"--效果
	    wds[19] = 1--效果加成属性
	    wds[20] = "蓝色"--颜色
	    wds[21] = "法术伤害"--效果11111
	    wds[22] = 2--效果加成属性11111111111
	elseif wd == "百冥符石" then
		wds[1] = "铭刻着神秘符文的上古神石,散落三界,具备神秘力量"
		wds[2] = 55
		wds[3] = 3
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0xE7C31FAB
	    wds[13] = 0x204A7770
	    wds[15] = "可以镶嵌在有开运孔数的装备上"
	    wds[16] = 3--符石等级
	    wds[17] = 150--耐久
	    wds[18] = "耐力"--效果
	    wds[19] = 1--效果加成属性
	    wds[20] = "蓝色"--颜色
	    wds[21] = "法术防御"--效果11111
	    wds[22] = 2--效果加成属性11111111111
	elseif wd == "莫念符石" then
		wds[1] = "铭刻着神秘符文的上古神石,散落三界,具备神秘力量"
		wds[2] = 55
		wds[3] = 3
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0x35232317
	    wds[13] = 0x7E8A4D54
	    wds[15] = "可以镶嵌在有开运孔数的装备上"
	    wds[16] = 3--符石等级
	    wds[17] = 150--耐久
	    wds[18] = "耐力"--效果
	    wds[19] = 1--效果加成属性
	    wds[20] = "蓝色"--颜色
	    wds[21] = "固定伤害"--效果11111
	    wds[22] = 2--效果加成属性11111111111
	elseif wd == "醉魂符石" then
		wds[1] = "铭刻着神秘符文的上古神石,散落三界,具备神秘力量"
		wds[2] = 55
		wds[3] = 5
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0xDF29F445
	    wds[13] = 0x684A5B33
	    wds[15] = "可以镶嵌在有开运孔数的装备上"
	    wds[16] = 3--符石等级
	    wds[17] = 150--耐久
	    wds[18] = "魔力"--效果
	    wds[19] = 1--效果加成属性
	    wds[20] = "白色"--颜色
	    wds[21] = "气血"--效果11111
	    wds[22] = 10--效果加成属性11111111111
	elseif wd == "玄羽符石" then
		wds[1] = "铭刻着神秘符文的上古神石,散落三界,具备神秘力量"
		wds[2] = 55
		wds[3] = 5
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0x2BFB0E6E
	    wds[13] = 0xFD8EB3CF
	    wds[15] = "可以镶嵌在有开运孔数的装备上"
	    wds[16] = 3--符石等级
	    wds[17] = 150--耐久
	    wds[18] = "魔力"--效果
	    wds[19] = 1--效果加成属性
	    wds[20] = "白色"--颜色
	    wds[21] = "命中"--效果11111
	    wds[22] = 4--效果加成属性11111111111
	elseif wd == "霸风符石" then
		wds[1] = "铭刻着神秘符文的上古神石,散落三界,具备神秘力量"
		wds[2] = 55
		wds[3] = 5
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0x579C9F2A
	    wds[13] = 0x5AA0CA98
	    wds[15] = "可以镶嵌在有开运孔数的装备上"
	    wds[16] = 3--符石等级
	    wds[17] = 150--耐久
	    wds[18] = "魔力"--效果
	    wds[19] = 1--效果加成属性
	    wds[20] = "白色"--颜色
	    wds[21] = "伤害"--效果11111
	    wds[22] = 1.5--效果加成属性11111111111
	elseif wd == "无相符石" then
		wds[1] = "铭刻着神秘符文的上古神石,散落三界,具备神秘力量"
		wds[2] = 55
		wds[3] = 5
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0x4ADA8502
	    wds[13] = 0x5FBDBE85
	    wds[15] = "可以镶嵌在有开运孔数的装备上"
	    wds[16] = 3--符石等级
	    wds[17] = 150--耐久
	    wds[18] = "魔力"--效果
	    wds[19] = 1--效果加成属性
	    wds[20] = "白色"--颜色
	    wds[21] = "防御"--效果11111
	    wds[22] = 3--效果加成属性11111111111
	elseif wd == "无极符石" then
		wds[1] = "铭刻着神秘符文的上古神石,散落三界,具备神秘力量"
		wds[2] = 55
		wds[3] = 5
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0x1ED49DA6
	    wds[13] = 0x8A6D58ED
	    wds[15] = "可以镶嵌在有开运孔数的装备上"
	    wds[16] = 3--符石等级
	    wds[17] = 150--耐久
	    wds[18] = "魔力"--效果
	    wds[19] = 1--效果加成属性
	    wds[20] = "白色"--颜色
	    wds[21] = "速度"--效果11111
	    wds[22] = 1.5--效果加成属性11111111111
	elseif wd == "紫晶符石" then
		wds[1] = "铭刻着神秘符文的上古神石,散落三界,具备神秘力量"
		wds[2] = 55
		wds[3] = 5
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0x53616D8A
	    wds[13] = 0xA7782996
	    wds[15] = "可以镶嵌在有开运孔数的装备上"
	    wds[16] = 3--符石等级
	    wds[17] = 150--耐久
	    wds[18] = "魔力"--效果
	    wds[19] = 1--效果加成属性
	    wds[20] = "白色"--颜色
	    wds[21] = "躲避"--效果11111
	    wds[22] = 3--效果加成属性11111111111
	elseif wd == "圣火符石" then
		wds[1] = "铭刻着神秘符文的上古神石,散落三界,具备神秘力量"
		wds[2] = 55
		wds[3] = 5
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0xCA106E2F
	    wds[13] = 0x74D36FFF
	    wds[15] = "可以镶嵌在有开运孔数的装备上"
	    wds[16] = 3--符石等级
	    wds[17] = 150--耐久
	    wds[18] = "魔力"--效果
	    wds[19] = 1--效果加成属性
	    wds[20] = "白色"--颜色
	    wds[21] = "固定伤害"--效果11111
	    wds[22] = 2--效果加成属性11111111111
	elseif wd == "昔光符石" then
		wds[1] = "铭刻着神秘符文的上古神石,散落三界,具备神秘力量"
		wds[2] = 55
		wds[3] = 5
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0x6FC365B8
	    wds[13] = 0xCBD03425
	    wds[15] = "可以镶嵌在有开运孔数的装备上"
	    wds[16] = 3--符石等级
	    wds[17] = 150--耐久
	    wds[18] = "魔力"--效果
	    wds[19] = 1--效果加成属性
	    wds[20] = "白色"--颜色
	    wds[21] = "魔法"--效果11111
	    wds[22] = 6--效果加成属性11111111111
	elseif wd == "子蚀符石" then
		wds[1] = "铭刻着神秘符文的上古神石,散落三界,具备神秘力量"
		wds[2] = 55
		wds[3] = 5
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0xF688BFDE
	    wds[13] = 0x93C04775
	    wds[15] = "可以镶嵌在有开运孔数的装备上"
	    wds[16] = 3--符石等级
	    wds[17] = 150--耐久
	    wds[18] = "魔力"--效果
	    wds[19] = 1--效果加成属性
	    wds[20] = "白色"--颜色
	    wds[21] = "法术防御"--效果11111
	    wds[22] = 2--效果加成属性11111111111
	elseif wd == "流风符石" then
		wds[1] = "铭刻着神秘符文的上古神石,散落三界,具备神秘力量"
		wds[2] = 55
		wds[3] = 5
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0x9D0D30EF
	    wds[13] = 0x9B44A508
	    wds[15] = "可以镶嵌在有开运孔数的装备上"
	    wds[16] = 3--符石等级
	    wds[17] = 150--耐久
	    wds[18] = "魔力"--效果
	    wds[19] = 1--效果加成属性
	    wds[20] = "白色"--颜色
	    wds[21] = "法术伤害"--效果11111
	    wds[22] = 2--效果加成属性11111111111
	elseif wd == "地炎符石" then
		wds[1] = "铭刻着神秘符文的上古神石,散落三界,具备神秘力量"
		wds[2] = 55
		wds[3] = 6
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0x9577140F
	    wds[13] = 0x2B2257FF
	    wds[15] = "可以镶嵌在有开运孔数的装备上"
	    wds[16] = 3--符石等级
	    wds[17] = 150--耐久
	    wds[18] = "力量"--效果
	    wds[19] = 1--效果加成属性
	    wds[20] = "黑色"--颜色
	    wds[21] = "气血"--效果11111
	    wds[22] = 10--效果加成属性11111111111
	elseif wd == "素影符石" then
		wds[1] = "铭刻着神秘符文的上古神石,散落三界,具备神秘力量"
		wds[2] = 55
		wds[3] = 6
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0xED15475A
	    wds[13] = 0x17DE2A61
	    wds[15] = "可以镶嵌在有开运孔数的装备上"
	    wds[16] = 3--符石等级
	    wds[17] = 150--耐久
	    wds[18] = "力量"--效果
	    wds[19] = 1--效果加成属性
	    wds[20] = "黑色"--颜色
	    wds[21] = "魔法"--效果11111
	    wds[22] = 6--效果加成属性11111111111
	elseif wd == "燕灵符石" then
		wds[1] = "铭刻着神秘符文的上古神石,散落三界,具备神秘力量"
		wds[2] = 55
		wds[3] = 6
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0xEE41CD63
	    wds[13] = 0xD5F14ADC
	    wds[15] = "可以镶嵌在有开运孔数的装备上"
	    wds[16] = 3--符石等级
	    wds[17] = 150--耐久
	    wds[18] = "力量"--效果
	    wds[19] = 1--效果加成属性
	    wds[20] = "黑色"--颜色
	    wds[21] = "防御"--效果11111
	    wds[22] = 3--效果加成属性11111111111
	elseif wd == "降龙符石" then
		wds[1] = "铭刻着神秘符文的上古神石,散落三界,具备神秘力量"
		wds[2] = 55
		wds[3] = 6
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0xEA2DFDAF
	    wds[13] = 0x7F18A6FB
	    wds[15] = "可以镶嵌在有开运孔数的装备上"
	    wds[16] = 3--符石等级
	    wds[17] = 150--耐久
	    wds[18] = "力量"--效果
	    wds[19] = 1--效果加成属性
	    wds[20] = "黑色"--颜色
	    wds[21] = "速度"--效果11111
	    wds[22] = 1.5--效果加成属性11111111111
	elseif wd == "苍玉符石" then
		wds[1] = "铭刻着神秘符文的上古神石,散落三界,具备神秘力量"
		wds[2] = 55
		wds[3] = 6
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0x867985EB
	    wds[13] = 0x5336983C
	    wds[15] = "可以镶嵌在有开运孔数的装备上"
	    wds[16] = 3--符石等级
	    wds[17] = 150--耐久
	    wds[18] = "力量"--效果
	    wds[19] = 1--效果加成属性
	    wds[20] = "黑色"--颜色
	    wds[21] = "躲避"--效果11111
	    wds[22] = 3--效果加成属性11111111111
	elseif wd == "流魂符石" then
		wds[1] = "铭刻着神秘符文的上古神石,散落三界,具备神秘力量"
		wds[2] = 55
		wds[3] = 6
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0xF0888E17
	    wds[13] = 0xF21E1F30
	    wds[15] = "可以镶嵌在有开运孔数的装备上"
	    wds[16] = 3--符石等级
	    wds[17] = 150--耐久
	    wds[18] = "力量"--效果
	    wds[19] = 1--效果加成属性
	    wds[20] = "黑色"--颜色
	    wds[21] = "灵力"--效果11111
	    wds[22] = 1.5--效果加成属性11111111111
	elseif wd == "九凤符石" then
		wds[1] = "铭刻着神秘符文的上古神石,散落三界,具备神秘力量"
		wds[2] = 55
		wds[3] = 6
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0x7CCD1DFA
	    wds[13] = 0xEC558958
	    wds[15] = "可以镶嵌在有开运孔数的装备上"
	    wds[16] = 3--符石等级
	    wds[17] = 150--耐久
	    wds[18] = "力量"--效果
	    wds[19] = 1--效果加成属性
	    wds[20] = "黑色"--颜色
	    wds[21] = "法术防御"--效果11111
	    wds[22] = 2--效果加成属性11111111111
	elseif wd == "墨陀符石" then
		wds[1] = "铭刻着神秘符文的上古神石,散落三界,具备神秘力量"
		wds[2] = 55
		wds[3] = 6
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0x3F791B1
	    wds[13] = 0x44ED9122
	    wds[15] = "可以镶嵌在有开运孔数的装备上"
	    wds[16] = 3--符石等级
	    wds[17] = 150--耐久
	    wds[18] = "力量"--效果
	    wds[19] = 1--效果加成属性
	    wds[20] = "黑色"--颜色
	    wds[21] = "法术伤害"--效果11111
	    wds[22] = 2--效果加成属性11111111111
	elseif wd == "南夕符石" then
		wds[1] = "铭刻着神秘符文的上古神石,散落三界,具备神秘力量"
		wds[2] = 55
		wds[3] = 6
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0x5DBC1A4E
	    wds[13] = 0xBAB64C34
	    wds[15] = "可以镶嵌在有开运孔数的装备上"
	    wds[16] = 3--符石等级
	    wds[17] = 150--耐久
	    wds[18] = "力量"--效果
	    wds[19] = 1--效果加成属性
	    wds[20] = "黑色"--颜色
	    wds[21] = "固定伤害"--效果11111
	    wds[22] = 2--效果加成属性11111111111
	elseif wd == "引幽符石" then
		wds[1] = "铭刻着神秘符文的上古神石,散落三界,具备神秘力量"
		wds[2] = 55
		wds[3] = 7
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0xA3130920
	    wds[13] = 0xAC5683E0
	    wds[15] = "可以镶嵌在有开运孔数的装备上"
	    wds[16] = 3--符石等级
	    wds[17] = 150--耐久
	    wds[18] = "敏捷"--效果
	    wds[19] = 1--效果加成属性
	    wds[20] = "紫色"--颜色
	    wds[21] = "气血"--效果11111
	    wds[22] = 10--效果加成属性11111111111
	elseif wd == "波涛符石" then
		wds[1] = "铭刻着神秘符文的上古神石,散落三界,具备神秘力量"
		wds[2] = 55
		wds[3] = 7
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0x5DA7088A
	    wds[13] = 0xDFD1841C
	    wds[15] = "可以镶嵌在有开运孔数的装备上"
	    wds[16] = 3--符石等级
	    wds[17] = 150--耐久
	    wds[18] = "敏捷"--效果
	    wds[19] = 1--效果加成属性
	    wds[20] = "紫色"--颜色
	    wds[21] = "魔法"--效果11111
	    wds[22] = 6--效果加成属性11111111111
	elseif wd == "铃星符石" then
		wds[1] = "铭刻着神秘符文的上古神石,散落三界,具备神秘力量"
		wds[2] = 55
		wds[3] = 7
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0xAC6C9B58
	    wds[13] = 0x7D44AFFC
	    wds[15] = "可以镶嵌在有开运孔数的装备上"
	    wds[16] = 3--符石等级
	    wds[17] = 150--耐久
	    wds[18] = "敏捷"--效果
	    wds[19] = 1--效果加成属性
	    wds[20] = "紫色"--颜色
	    wds[21] = "命中"--效果11111
	    wds[22] = 4--效果加成属性11111111111
	elseif wd == "狂念符石" then
		wds[1] = "铭刻着神秘符文的上古神石,散落三界,具备神秘力量"
		wds[2] = 55
		wds[3] = 7
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0x64DD0A08
	    wds[13] = 0x5D8AFACD
	    wds[15] = "可以镶嵌在有开运孔数的装备上"
	    wds[16] = 3--符石等级
	    wds[17] = 150--耐久
	    wds[18] = "敏捷"--效果
	    wds[19] = 1--效果加成属性
	    wds[20] = "紫色"--颜色
	    wds[21] = "伤害"--效果11111
	    wds[22] = 1.5--效果加成属性11111111111
	elseif wd == "乱花符石" then
		wds[1] = "铭刻着神秘符文的上古神石,散落三界,具备神秘力量"
		wds[2] = 55
		wds[3] = 7
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0x9722DD59
	    wds[13] = 0xFAE16C2E
	    wds[15] = "可以镶嵌在有开运孔数的装备上"
	    wds[16] = 3--符石等级
	    wds[17] = 150--耐久
	    wds[18] = "敏捷"--效果
	    wds[19] = 1--效果加成属性
	    wds[20] = "紫色"--颜色
	    wds[21] = "灵力"--效果11111
	    wds[22] = 1.5--效果加成属性11111111111
	elseif wd == "幽月符石" then
		wds[1] = "铭刻着神秘符文的上古神石,散落三界,具备神秘力量"
		wds[2] = 55
		wds[3] = 7
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0x8EDB338
	    wds[13] = 0x5C16DDD5
	    wds[15] = "可以镶嵌在有开运孔数的装备上"
	    wds[16] = 3--符石等级
	    wds[17] = 150--耐久
	    wds[18] = "敏捷"--效果
	    wds[19] = 1--效果加成属性
	    wds[20] = "紫色"--颜色
	    wds[21] = "法术伤害"--效果11111
	    wds[22] = 2--效果加成属性11111111111
	elseif wd == "两仪符石" then
		wds[1] = "铭刻着神秘符文的上古神石,散落三界,具备神秘力量"
		wds[2] = 55
		wds[3] = 7
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0x6149F028
	    wds[13] = 0xB0A5618D
	    wds[15] = "可以镶嵌在有开运孔数的装备上"
	    wds[16] = 3--符石等级
	    wds[17] = 150--耐久
	    wds[18] = "敏捷"--效果
	    wds[19] = 1--效果加成属性
	    wds[20] = "紫色"--颜色
	    wds[21] = "法术防御"--效果11111
	    wds[22] = 2--效果加成属性11111111111
	elseif wd == "七情符石" then
		wds[1] = "铭刻着神秘符文的上古神石,散落三界,具备神秘力量"
		wds[2] = 55
		wds[3] = 7
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0x4FBA3175
	    wds[13] = 0x35DC8D80
	    wds[15] = "可以镶嵌在有开运孔数的装备上"
	    wds[16] = 3--符石等级
	    wds[17] = 150--耐久
	    wds[18] = "敏捷"--效果
	    wds[19] = 1--效果加成属性
	    wds[20] = "紫色"--颜色
	    wds[21] = "固定伤害"--效果11111
	    wds[22] = 2--效果加成属性11111111111
	elseif wd == "召影符石" then
		wds[1] = "铭刻着神秘符文的上古神石,散落三界,具备神秘力量"
		wds[2] = 55
		wds[3] = 7
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0x7AF9E2F7
	    wds[13] = 0xF28A91D
	    wds[15] = "可以镶嵌在有开运孔数的装备上"
	    wds[16] = 3--符石等级
	    wds[17] = 150--耐久
	    wds[18] = "敏捷"--效果
	    wds[19] = 1--效果加成属性
	    wds[20] = "紫色"--颜色
	    wds[21] = "防御"--效果11111
	    wds[22] = 3--效果加成属性11111111111
	elseif wd == "二级未激活符石" then
		wds[1] = "依照天神所授意的神奇符石，利用一定的人物经验、体力和金钱#R激活#W后可以镶嵌到开运过的装备上，按照一定顺序，将正确的符石放入装备的位置中，可被天神附身获得神奇效果。"
		wds[2] = 56
		wds[3] = 9
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0x58DEAA8F
	    wds[13] = 0xCC937790
	    wds[15] = "鼠标右键点击使用激活"
	elseif wd == "一级未激活符石" then
		wds[1] = "依照天神所授意的神奇符石，利用一定的人物经验、体力和金钱#R激活#W后可以镶嵌到开运过的装备上，按照一定顺序，将正确的符石放入装备的位置中，可被天神附身获得神奇效果。"
		wds[2] = 56
		wds[3] = 9
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0x580E0DE1
	    wds[13] = 0xC45E19C4
	    wds[15] = "鼠标右键点击使用激活"
	elseif wd == "三级未激活符石" then
		wds[1] = "依照天神所授意的神奇符石，利用一定的人物经验、体力和金钱#R激活#W后可以镶嵌到开运过的装备上，按照一定顺序，将正确的符石放入装备的位置中，可被天神附身获得神奇效果。"
		wds[2] = 56
		wds[3] = 9
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0xB39A2CAB
	    wds[13] = 0x2675DF2C
	    wds[15] = "鼠标右键点击使用激活"
	elseif wd == "帮派银票" then
		wds[1] = "这是属于某个帮派的银票，上面的钱可不能随便挪用哦。"
		wds[2] = "帮派银票"
		wds[3] = 3
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0x97C77FD8
	    wds[13] = 0x92F6F4CA
	elseif wd == "商品盐" then
		wds[1] = "东海的特产之一，精细的海盐。商品的一种。"
		wds[2] = "跑商商品"
		wds[3] = 1
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0x1D1B8623
	    wds[13] = 0x5DA26DF2
	elseif wd == "商品武器" then
		wds[1] = "使用上好材料精心制作，是学武之日必备的武器。商品的一种。"
		wds[2] = "跑商商品"
		wds[3] = 2
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0x3B723D09
	    wds[13] = 0x5BBC4BD5
	elseif wd == "商品帽子" then
		wds[1] = "普通人家使用的布制头冠，在冬天可以起到一定御寒的作用。商品的一种。"
		wds[2] = "跑商商品"
		wds[3] = 3
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0x455447CE
	    wds[13] = 0xB3E1E4F1
	elseif wd == "商品符" then
		wds[1] = "道士所需的灵符，驱邪镇魔之用。商品的一种。"
		wds[2] = "跑商商品"
		wds[3] = 4
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0x4F8A961F
	    wds[13] = 0x583B0F67
	elseif wd == "商品鹿茸" then
		wds[1] = "鹿角上长的茸，可强身健体，是上好的药材。商品的一种。"
		wds[2] = "跑商商品"
		wds[3] = 5
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0x1881E054
	    wds[13] = 0x518D0F0E
	elseif wd == "商品纸钱" then
		wds[1] = "民间用来烧给阴间亲人使用的冥钞。商品的一种。"
		wds[2] = "跑商商品"
		wds[3] = 6
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0x1214601C
	    wds[13] = 0xC5D83684
	elseif wd == "商品佛珠" then
		wds[1] = "檀香木制的佛珠，佩带在身上可以驱邪镇魔。商品的一种。"
		wds[2] = "跑商商品"
		wds[3] = 7
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0x09A396DF
	    wds[13] = 0x0C23AB02
	elseif wd == "商品酒" then
		wds[1] = "精心酿制，窖藏多年，是不可多得的好酒。商品的一种。"
		wds[2] = "跑商商品"
		wds[3] = 8
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xF82AAC0F
	    wds[13] = 0x2B2980FB
	elseif wd == "商品棉布" then
		wds[1] = "使用上品棉花编织而成的布匹。商品的一种。"
		wds[2] = "跑商商品"
		wds[3] = 9
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0x2C2D056A
	    wds[13] = 0x3E45E470
	elseif wd == "商品面粉" then
		wds[1] = "用小麦等材料精磨而成，可以制作各种可口的食物。商品的一种。"
		wds[2] = "跑商商品"
		wds[3] = 10
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0x7E5D886B
	    wds[13] = 0x3CE911B4
	elseif wd == "商品珍珠" then
		wds[1] = "东海珍珠，色泽明润洁白，无论是装饰和入药多可以。商品的一种。"
		wds[2] = "跑商商品"
		wds[3] = 11
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0x475C0227
	    wds[13] = 0x4EB56D11
	elseif wd == "商品人参" then
		wds[1] = "北方特产，是极好的补品，也可入药。商品的一种。"
		wds[2] = "跑商商品"
		wds[3] = 12
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xD0FEED23
	    wds[13] = 0x75EAFA24
	elseif wd == "商品木材" then
		wds[1] = "百年原木，用于修建房屋的，名贵木材。商品的一种。"
		wds[2] = "跑商商品"
		wds[3] = 13
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0x2D2B1B01
	    wds[13] = 0xA80295E6
	elseif wd == "商品蜡烛" then
		wds[1] = "每家每户必备的照明工具，销路很好。商品的一种。"
		wds[2] = "跑商商品"
		wds[3] = 14
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xCCA5E33A
	    wds[13] = 0x1111FBA1
	elseif wd == "商品扇子" then
		wds[1] = "只是普通的折扇，为文人雅士所喜好。商品的一种。"
		wds[2] = "跑商商品"
		wds[3] = 15
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0x10095AF2
	    wds[13] = 0xADE7E512
	elseif wd == "商品铃铛" then
		wds[1] = "声音悦耳，为女子所喜，常买回去佩带在身上。商品的一种。"
		wds[2] = "跑商商品"
		wds[3] = 16
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0x254F32EB
	    wds[13] = 0xDF6AC41C
	elseif wd == "商品夜明珠" then
		wds[1] = "能再夜中放光的明珠，是价值连城的宝物。商品的一种。"
		wds[2] = "跑商商品"
		wds[3] = 17
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0x17CDA1A8
	    wds[13] = 0xD6E56581
	elseif wd == "商品麻线" then
		wds[1] = "坚韧的麻线，商品的一种"
		wds[2] = "跑商商品"
		wds[3] = 18
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0x12E64787
	    wds[13] = 0xEE14FF0E
	elseif wd == "商品剪刀" then
		wds[1] = "裁剪衣服所用的剪刀，女儿家常用物品。商品的一种。"
		wds[2] = "跑商商品"
		wds[3] = 19
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0x1583132D
	    wds[13] = 0xD55F18BB
	elseif wd == "商品香油" then
		wds[1] = "供奉神明的长明灯中所用的香油。商品的一种。"
		wds[2] = "跑商商品"
		wds[3] = 20
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0x4B45F754
	    wds[13] = 0x4446AACC
	elseif wd == "商品首饰" then
		wds[1] = "佩带在身上增添美观的一些精巧小玩意，价值视做工与材料而定。商品的一种。"
		wds[2] = "跑商商品"
		wds[3] = 21
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0x6FFE61EF
	    wds[13] = 0xDBCC855E
	elseif wd == "储备银票" then
		wds[1] = "大唐年间，李记钱庄发行的一种银票，可获得八亿两储备。"
		wds[2] = "银票"
		wds[3] = 3
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0x91B892E4
	    wds[13] = 0xFA853D52
	elseif wd == "银两银票" then
		wds[1] = "大唐年间，李记钱庄发行的一种银票，可获得五亿两银子。"
		wds[2] = "银票"
		wds[3] = 3
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xFA49DAFD
	    wds[13] = 0x7F1E2D96
	elseif wd == "90级装备礼包" then
		wds[1] = "内含一套6件90级装备，根据玩家角色开出自身对应的装备，随机属性，衣服和武器必出双加。"
		wds[2] = "装备礼包"
		wds[3] = 1
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xA3DB661B
	    wds[13] = 0x5AAF94C0
	elseif wd == "种族坐骑礼包" then
		wds[1] = "内含一只随机种族坐骑。"
		wds[2] = "坐骑礼包"
		wds[3] = 1
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xA3DB661B
	    wds[13] = 0x5AAF94C0
	elseif wd == "100级装备礼包" then
		wds[1] = "内含一套6件100级装备，根据玩家角色开出自身对应的装备，随机属性，衣服和武器必出双加。"
		wds[2] = "装备礼包"
		wds[3] = 2
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0x4A764237
	    wds[13] = 0x63C9C2D2
	elseif wd == "110级装备礼包" then
		wds[1] = "内含一套6件110级装备，根据玩家角色开出自身对应的装备，随机属性，衣服和武器必出双加。"
		wds[2] = "装备礼包"
		wds[3] = 2
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0x4A764237
	    wds[13] = 0x63C9C2D2
	elseif wd == "120级装备礼包" then
		wds[1] = "内含一套6件120级装备，根据玩家角色开出自身对应的装备，随机属性，衣服和武器必出双加。"
		wds[2] = "装备礼包"
		wds[3] = 3
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0x65AE0DFF
	    wds[13] = 0x2CE03BE9
	elseif wd == "130级装备礼包" then
		wds[1] = "内含一套6件130级装备，根据玩家角色开出自身对应的装备，随机属性，衣服和武器必出双加。"
		wds[2] = "装备礼包"
		wds[3] = 4
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0x65AE0DFF
	    wds[13] = 0x2CE03BE9
	elseif wd == "140级装备礼包" then
		wds[1] = "内含一套6件140级装备，根据玩家角色开出自身对应的装备，随机属性，衣服和武器必出双加。"
		wds[2] = "装备礼包"
		wds[3] = 5
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0x65AE0DFF
	    wds[13] = 0x2CE03BE9
	elseif wd == "150级装备礼包" then
		wds[1] = "内含一套6件150级装备，根据玩家角色开出自身对应的装备，随机属性，衣服和武器必出双加。"
		wds[2] = "装备礼包"
		wds[3] = 6
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xD6363DD6
	    wds[13] = 0x5FBAB8DC
	elseif wd == "160级装备礼包" then
		wds[1] = "内含一套6件160级装备，根据玩家角色开出自身对应的装备，随机属性，衣服和武器必出双加。"
		wds[2] = "装备礼包"
		wds[3] = 7
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xD6363DD6
	    wds[13] = 0x5FBAB8DC
	    elseif wd == "160级魔敏装备礼包" then
		wds[1] = "内含一套6件160级装备，\n【加成】#Y80魔力\n【加成】#P80敏捷\n【加成】#R700伤害\n【加成】#G900命中"
		wds[2] = "装备礼包"
		wds[3] = 8
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xD6363DD6
	    wds[13] = 0x5FBAB8DC
	  elseif wd == "160级魔体装备礼包" then
		wds[1] = "内含一套6件160级装备，\n【加成】#Y80魔力\n【加成】#P80体质\n【加成】#R700伤害\n【加成】#G900命中"
		wds[2] = "装备礼包"
		wds[3] = 8
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xD6363DD6
	    wds[13] = 0x5FBAB8DC
	 elseif wd == "160级力敏装备礼包" then
		wds[1] = "内含一套6件160级装备，\n【加成】#Y80力量\n【加成】#P80敏捷\n【加成】#R700伤害\n【加成】#G900命中"
		wds[2] = "装备礼包"
		wds[3] = 8
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xD6363DD6
	    wds[13] = 0x5FBAB8DC
	    elseif wd == "160级力体装备礼包" then
		wds[1] = "内含一套6件160级装备，\n【加成】#Y80力量\n【加成】#P80体质\n【加成】#R700伤害\n【加成】#G900命中"
		wds[2] = "装备礼包"
		wds[3] = 8
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xD6363DD6
	    wds[13] = 0x5FBAB8DC
	  elseif wd == "160级魔力敏捷装备礼包" then
		wds[1] = "内含一套6件160级装备，\n【加成】#Y400魔力\n【加成】#P400敏捷\n【加成】#R2000伤害\n【加成】#G2000命中"
		wds[2] = "装备礼包"
		wds[3] = 8
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xD6363DD6
	    wds[13] = 0x5FBAB8DC
	 elseif wd == "160级力量敏捷装备礼包" then
		wds[1] = "内含一套6件160级装备，\n【加成】#Y400力量\n【加成】#P400敏捷\n【加成】#R2000伤害\n【加成】#G2000命中"
		wds[2] = "装备礼包"
		wds[3] = 8
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xD6363DD6
	    wds[13] = 0x5FBAB8DC
	    elseif wd == "160级体敏装备礼包" then
		wds[1] = "内含一套6件160级装备，\n【加成】#Y80体力\n【加成】#P80敏捷\n【加成】#R700伤害\n【加成】#G900命中"
		wds[2] = "装备礼包"
		wds[3] = 8
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xD6363DD6
	    wds[13] = 0x5FBAB8DC
	    elseif wd == "160级体耐装备礼包" then
		wds[1] = "内含一套6件160级装备，\n【加成】#Y80体力\n【加成】#P80耐力\n【加成】#R700伤害\n【加成】#G900命中"
		wds[2] = "装备礼包"
		wds[3] = 8
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xD6363DD6
	    wds[13] = 0x5FBAB8DC

	  elseif wd == "160级四加低级装备礼包" then
		wds[1] = "内含一套6件160级装备，\n【加成】#Y400魔力\n【加成】#P400敏捷\n【加成】#R2000伤害\n【加成】#G2000命中"
		wds[2] = "装备礼包"
		wds[3] = 8
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xD6363DD6
	    wds[13] = 0x5FBAB8DC
	 elseif wd == "160级四加高级装备礼包" then
		wds[1] = "内含一套6件160级装备，\n【加成】#Y400力量\n【加成】#P400敏捷\n【加成】#R2000伤害\n【加成】#G2000命中"
		wds[2] = "装备礼包"
		wds[3] = 8
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xD6363DD6
	    wds[13] = 0x5FBAB8DC

	    elseif wd == "法术伤害戒指-耳饰" then
		wds[1] = "内含一套2件160级首饰\n【主属性】#Y80法术伤害\n【副属性】#P4条同属性50法术伤害"
		wds[2] = "装备礼包"
		wds[3] = 8
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xB2326701
	    wds[13] = 0xFB5EEB41
	    elseif wd == "全套武器造型礼包" then
		wds[1] = "内含90-160级全套武器，用于武器转换造型"
		wds[2] = "装备礼包"
		wds[3] = 7
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xD6363DD6
	    wds[13] = 0x5FBAB8DC
	    elseif wd == "物理伤害戒指-耳饰" then
		wds[1] = "内含一套2件160级首饰\n【主属性】#Y80伤害\n【副属性】#P4条同属性50伤害"
		wds[2] = "装备礼包"
		wds[3] = 8
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xB2326701
	    wds[13] = 0xFB5EEB41
	    elseif wd == "固定伤害耳饰-戒指" then
		wds[1] = "内含一套2件160级首饰\n【主属性】#Y50固定伤害\n【副属性】#P4条同属性30固定伤害"
		wds[2] = "装备礼包"
		wds[3] = 8
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xB2326701
	    wds[13] = 0xFB5EEB41
	    elseif wd == "法术暴击耳饰-戒指" then
		wds[1] = "内含一套2件160级首饰\n【主属性】#Y50法术暴击\n【副属性】#P4条同属性30法术暴击"
		wds[2] = "装备礼包"
		wds[3] = 8
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xB2326701
	    wds[13] = 0xFB5EEB41
	    elseif wd == "物理暴击耳饰-戒指" then
		wds[1] = "内含一套2件160级首饰\n【主属性】#Y50物理暴击\n【副属性】#P4条同属性30物理暴击"
		wds[2] = "装备礼包"
		wds[3] = 8
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xB2326701
	    wds[13] = 0xFB5EEB41
	    elseif wd == "速度耳饰-戒指" then
		wds[1] = "内含一套2件160级首饰\n【主属性】#Y50速度\n【副属性】#P4条同属性30速度"
		wds[2] = "装备礼包"
		wds[3] = 8
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xB2326701
	    wds[13] = 0xFB5EEB41
	    elseif wd == "治疗能力-戒指" then
		wds[1] = "内含一套2件160级首饰\n【主属性】#Y50治疗能力\n【副属性】#P4条同属性30治疗能力"
		wds[2] = "装备礼包"
		wds[3] = 8
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xB2326701
	    wds[13] = 0xFB5EEB41
	    elseif wd == "封印命中-戒指" then
		wds[1] = "内含一套2件160级首饰\n【主属性】#Y50封印命中\n【副属性】#P4条同属性30封印命中"
		wds[2] = "装备礼包"
		wds[3] = 8
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xB2326701
	    wds[13] = 0xFB5EEB41
	    elseif wd == "气血手镯-佩饰" then
		wds[1] = "内含一套2件160级首饰\n【主属性】#Y80气血\n【副属性】#P4条同属性50气血"
		wds[2] = "装备礼包"
		wds[3] = 8
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0x91E363E8
	    wds[13] = 0xBB4BFFCB
	    elseif wd == "防御手镯-佩饰" then
		wds[1] = "内含一套2件160级首饰\n【主属性】#Y50防御\n【副属性】#P4条同属性30防御"
		wds[2] = "装备礼包"
		wds[3] = 8
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0x91E363E8
	    wds[13] = 0xBB4BFFCB
	     elseif wd == "速度手镯-佩饰" then
		wds[1] = "内含一套2件160级首饰\n【主属性】#Y50速度\n【副属性】#P4条同属性30速度"
		wds[2] = "装备礼包"
		wds[3] = 8
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0x91E363E8
	    wds[13] = 0xBB4BFFCB
	     elseif wd == "法术防御手镯-佩饰" then
		wds[1] = "内含一套2件160级首饰\n【主属性】#Y50法术防御\n【副属性】#P4条同属性30法术防御"
		wds[2] = "装备礼包"
		wds[3] = 8
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0x91E363E8
	    wds[13] = 0xBB4BFFCB


	    elseif  wd == "道骨仙风" or wd == "瑰梦潋·渔" or wd == "青花瓷黑" or wd == "青花瓷白" then
		wds[1] = "【类型】#S普通锦衣\n【加成】#Y1000气血"
		wds[2] = 2
        wds[3] =15
        wds[4] = 1
        wds[11] = "xzsc.wdf"
        wds[5] = 60
        wds[12] = 0xEEBBCA03
        wds[13] = 0xEEBBCA04
        elseif wd == "独角马" then
		wds[1] = "天河夜转漂回星,银浦流云学水声。"
		wds[2] = "祥瑞"
		wds[3] = 16
		wds[4] = 2
		wds[5] = 60
        wds[11] = "wpal/121.wpal"
        wds[12] = 0x10000055
        wds[13] = 0x10000056
	elseif wd == "深海狂鲨" then
		wds[1] = "天河夜转漂回星,银浦流云学水声。"
		wds[2] = "祥瑞"
		wds[3] = 16
		wds[4] = 2
		wds[5] = 60
        wds[11] = "wpal/121.wpal"
        wds[12] = 0x10000063
        wds[13] = 0x10000064
	elseif wd == "青梅竹马" then
		wds[1] = "天河夜转漂回星,银浦流云学水声。"
		wds[2] = "祥瑞"
		wds[3] = 16
		wds[4] = 2
		wds[5] = 60
        wds[11] = "wpal/121.wpal"
        wds[12] = 0x10000061
        wds[13] = 0x10000062
	elseif wd == "冰晶魅灵" then
		wds[1] = "天河夜转漂回星,银浦流云学水声。"
		wds[2] = "祥瑞"
		wds[3] = 16
		wds[4] = 2
		wds[5] = 60
        wds[11] = "wpal/121.wpal"
        wds[12] = 0x10000057
        wds[13] = 0x10000058
	elseif wd == "冰晶雪魄" then
		wds[1] = "天河夜转漂回星,银浦流云学水声。"
		wds[2] = "祥瑞"
		wds[3] = 16
		wds[4] = 2
		wds[5] = 60
        wds[11] = "wpal/121.wpal"
        wds[12] = 0x10000046
        wds[13] = 0x10000047
	elseif wd == "霜雪龙宝" then
		wds[1] = "天河夜转漂回星,银浦流云学水声。"
		wds[2] = "祥瑞"
		wds[3] = 16
		wds[4] = 2
		wds[5] = 60
        wds[11] = "wpal/121.wpal"
        wds[12] = 0x10000051
        wds[13] = 0x10000052
	elseif wd == "飞天龙马" then
		wds[1] = "天河夜转漂回星,银浦流云学水声。"
		wds[2] = "祥瑞"
		wds[3] = 16
		wds[4] = 2
		wds[5] = 60
        wds[11] = "wpal/121.wpal"
        wds[12] = 0x10000053
        wds[13] = 0x10000054
	elseif wd == "山河画卷" then
		wds[1] = "天河夜转漂回星,银浦流云学水声。"
		wds[2] = "祥瑞"
		wds[3] = 16
		wds[4] = 2
		wds[5] = 60
        wds[11] = "wpal/121.wpal"
        wds[12] = 0x10000027
        wds[13] = 0x10000028
	elseif wd == "凌霄飞剑" then
		wds[1] = "天河夜转漂回星,银浦流云学水声。"
		wds[2] = "祥瑞"
		wds[3] = 16
		wds[4] = 2
		wds[5] = 60
        wds[11] = "wpal/121.wpal"
        wds[12] = 0x10000033
        wds[13] = 0x10000034
	elseif wd == "瑞彩祥云" then
		wds[1] = "天河夜转漂回星,银浦流云学水声。"
		wds[2] = "祥瑞"
		wds[3] = 16
		wds[4] = 2
		wds[5] = 60
        wds[11] = "wpal/121.wpal"
        wds[12] = 0x10000029
        wds[13] = 0x10000030
	elseif wd == "风火飞轮" then
		wds[1] = "天河夜转漂回星,银浦流云学水声。"
		wds[2] = "祥瑞"
		wds[3] = 16
		wds[4] = 2
		wds[5] = 60
        wds[11] = "wpal/121.wpal"
        wds[12] = 0x10000037
        wds[13] = 0x10000038
	elseif wd == "落英纷飞" then
		wds[1] = "天河夜转漂回星,银浦流云学水声。"
		wds[2] = "祥瑞"
		wds[3] = 16
		wds[4] = 2
		wds[5] = 60
        wds[11] = "wpal/121.wpal"
        wds[12] = 0x10000035
        wds[13] = 0x10000036
	elseif wd == "凤舞灵蝶" then
		wds[1] = "天河夜转漂回星,银浦流云学水声。"
		wds[2] = "祥瑞"
		wds[3] = 16
		wds[4] = 2
		wds[5] = 60
        wds[11] = "wpal/121.wpal"
        wds[12] = 0x10000041
        wds[13] = 0x10000042
	elseif wd == "七彩祥云" then
		wds[1] = "天河夜转漂回星,银浦流云学水声。"
		wds[2] = "祥瑞"
		wds[3] = 16
		wds[4] = 2
		wds[5] = 60
        wds[11] = "wpal/121.wpal"
        wds[12] = 0x10000031
        wds[13] = 0x10000032
	elseif wd == "流云玉佩" then
		wds[1] = "天河夜转漂回星,银浦流云学水声。"
		wds[2] = "祥瑞"
		wds[3] = 16
		wds[4] = 2
		wds[5] = 60
        wds[11] = "wpal/121.wpal"
        wds[12] = 0x10000039
        wds[13] = 0x10000040
	elseif wd == "齐天小轿" then
		wds[1] = "天河夜转漂回星,银浦流云学水声。"
		wds[2] = "祥瑞"
		wds[3] = 16
		wds[4] = 2
		wds[5] = 60
        wds[11] = "wpal/121.wpal"
        wds[12] = 0x10000043
        wds[13] = 0x10000044
 elseif wd == "馋嘴刺猬" then
        wds[1] = "夏日绮梦，雪浪淘纱。情深似海翻澜起，心悦君兮浪淘纱。织女素手织就浪淘纱，大浪淘纱，海枯石烂，此情不泯。"
        wds[2] = "祥瑞"
        wds[3] = 16
        wds[4] = 2
        wds[5] = 60
        wds[11] = "wpal/121.wpal"
        wds[12] = 0x10000144
        wds[13] = 0x10000045
 elseif wd == "玲珑雪狐" then
        wds[1] = "夏日绮梦，雪浪淘纱。情深似海翻澜起，心悦君兮浪淘纱。织女素手织就浪淘纱，大浪淘纱，海枯石烂，此情不泯。"
        wds[2] = "祥瑞"
        wds[3] = 16
        wds[4] = 2
        wds[5] = 60
        wds[11] = "wpal/121.wpal"
        wds[12] = 0x10000059
        wds[13] = 0x10000060
 elseif wd == "北冥巨鲸" then
        wds[1] = "夏日绮梦，雪浪淘纱。情深似海翻澜起，心悦君兮浪淘纱。织女素手织就浪淘纱，大浪淘纱，海枯石烂，此情不泯。"
        wds[2] = "祥瑞"
        wds[3] = 16
        wds[4] = 2
        wds[5] = 60
        wds[11] = "wpal/121.wpal"
        wds[12] = 0x10000048
        wds[13] = 0x10000049
 elseif wd == "赤焰战狼" then
        wds[1] = "夏日绮梦，雪浪淘纱。情深似海翻澜起，心悦君兮浪淘纱。织女素手织就浪淘纱，大浪淘纱，海枯石烂，此情不泯。"
        wds[2] = "祥瑞"
        wds[3] = 16
        wds[4] = 2
        wds[5] = 60
        wds[11] = "wpal/121.wpal"
        wds[12] = 0x10000026
        wds[13] = 0x10000025
 elseif wd == "呆萌鸭鸭" then
        wds[1] = "夏日绮梦，雪浪淘纱。情深似海翻澜起，心悦君兮浪淘纱。织女素手织就浪淘纱，大浪淘纱，海枯石烂，此情不泯。"
        wds[2] = "祥瑞"
        wds[3] = 16
        wds[4] = 2
        wds[5] = 60
        wds[11] = "wpal/121.wpal"
        wds[12] = 0x10000069
        wds[13] = 0x10000070
 elseif wd == "寒梅纨扇" then
        wds[1] = "夏日绮梦，雪浪淘纱。情深似海翻澜起，心悦君兮浪淘纱。织女素手织就浪淘纱，大浪淘纱，海枯石烂，此情不泯。"
        wds[2] = "祥瑞"
        wds[3] = 16
        wds[4] = 2
        wds[5] = 60
        wds[11] = "wpal/121.wpal"
        wds[12] = 0x10000065
        wds[13] = 0x10000066
 elseif wd == "年兽" then
        wds[1] = "夏日绮梦，雪浪淘纱。情深似海翻澜起，心悦君兮浪淘纱。织女素手织就浪淘纱，大浪淘纱，海枯石烂，此情不泯。"
        wds[2] = "祥瑞"
        wds[3] = 16
        wds[4] = 2
        wds[5] = 60
        wds[11] = "wpal/121.wpal"
        wds[12] = 0x10000067
        wds[13] = 0x10000068
            elseif wd == "幻·帝江" then
            wds[1] = "混沌斗转，帝江幻现，携手共闯三界！（2020年七夕情缘晶币中获得的特殊祥瑞！）"
            wds[2] = "祥瑞"
            wds[3] = 16
            wds[11] = "xzsc.wdf"
            wds[4] = 2
		    wds[5] = 60
            wds[12] = 0x20204444
            wds[13] = 0x20204445
           elseif wd == "幻·帝江·月白" then
            wds[1] = "混沌斗转，帝江幻现，携手共闯三界！（2020年七夕情缘晶币中获得的特殊祥瑞！）"
            wds[2] = "祥瑞"
            wds[3] = 16
            wds[11] = "XJY.wdf"
            wds[4] = 2
		    wds[5] = 60
            wds[12] = 0x20204454
            wds[13] = 0x20204455


---------------------------------------------------------------
	elseif wd == "随机宝石1-3级1套礼包" then
		wds[1] = "打开将会随机获得1套1-3级的宝石"
		wds[2] = "装备礼包"
		wds[3] = 12
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xD6363DD6
	    wds[13] = 0x5FBAB8DC

	elseif wd == "随机宝石1-5级1套礼包" then
		wds[1] = "打开将会随机获得1套1-5级的宝石"
		wds[2] = "装备礼包"
		wds[3] = 12
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xD6363DD6
	    wds[13] = 0x5FBAB8DC

	elseif wd == "随机宝石1-8级1套礼包" then
		wds[1] = "打开将会随机获得1套1-8级的宝石"
		wds[2] = "装备礼包"
		wds[3] = 12
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xD6363DD6
	    wds[13] = 0x5FBAB8DC

	elseif wd == "随机宝石1-15级1套礼包" then
		wds[1] = "打开将会随机获得1套1-15级的宝石"
		wds[2] = "装备礼包"
		wds[3] = 12
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xD6363DD6
	    wds[13] = 0x5FBAB8DC

	elseif wd == "10级宝石1套礼包" then
		wds[1] = "打开可以获得1套10级宝石"
		wds[2] = "装备礼包"
		wds[3] = 12
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xD6363DD6
	    wds[13] = 0x5FBAB8DC

	elseif wd == "藏宝图*5礼包" then
		wds[1] = "装有5张藏宝图的礼包"
		wds[2] = "装备礼包"
		wds[3] = 12
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xD6363DD6
	    wds[13] = 0x5FBAB8DC


	elseif wd == "特赦令牌礼包" then
		wds[1] = "装有特赦令牌的礼包"
		wds[2] = "装备礼包"
		wds[3] = 12
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xD6363DD6
	    wds[13] = 0x5FBAB8DC

	elseif wd == "高级魔兽要诀礼包" then
		wds[1] = "装有高级魔兽要诀的礼包"
		wds[2] = "装备礼包"
		wds[3] = 12
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xD6363DD6
	    wds[13] = 0x5FBAB8DC

	elseif wd == "特性宝珠礼包" then
		wds[1] = "装有特性宝珠的礼包"
		wds[2] = "装备礼包"
		wds[3] = 12
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xD6363DD6
	    wds[13] = 0x5FBAB8DC

	elseif wd == "融合石礼包" then
		wds[1] = "装有融合石的礼包"
		wds[2] = "装备礼包"
		wds[3] = 12
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xD6363DD6
	    wds[13] = 0x5FBAB8DC

	elseif wd == "三界悬赏令礼包" then
		wds[1] = "装有三界悬赏令的礼包"
		wds[2] = "装备礼包"
		wds[3] = 12
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xD6363DD6
	    wds[13] = 0x5FBAB8DC

--------------------------------------------------------------------
	elseif wd == "特赦令牌*3礼包" then
		wds[1] = "装有3个特赦令牌的礼包"
		wds[2] = "装备礼包"
		wds[3] = 12
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xD6363DD6
	    wds[13] = 0x5FBAB8DC
	elseif wd == "特赦令牌*5礼包" then
		wds[1] = "装有5个特赦令牌的礼包"
		wds[2] = "装备礼包"
		wds[3] = 12
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xD6363DD6
	    wds[13] = 0x5FBAB8DC
	elseif wd == "特赦令牌*10礼包" then
		wds[1] = "装有10个特赦令牌的礼包"
		wds[2] = "装备礼包"
		wds[3] = 12
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xD6363DD6
	    wds[13] = 0x5FBAB8DC
	elseif wd == "高级魔兽要诀*3礼包" then
		wds[1] = "装有3本高级魔兽要诀的礼包"
		wds[2] = "装备礼包"
		wds[3] = 12
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xD6363DD6
	    wds[13] = 0x5FBAB8DC
	elseif wd == "高级魔兽要诀*5礼包" then
		wds[1] = "装有5本高级魔兽要诀的礼包"
		wds[2] = "装备礼包"
		wds[3] = 12
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xD6363DD6
	    wds[13] = 0x5FBAB8DC
	elseif wd == "特性宝珠*5礼包" then
		wds[1] = "装有10个特性宝珠的礼包"
		wds[2] = "装备礼包"
		wds[3] = 12
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xD6363DD6
	    wds[13] = 0x5FBAB8DC
	elseif wd == "随机宝石1-8级*1套礼包" then
		wds[1] = "装有10个特性宝珠的礼包"
		wds[2] = "装备礼包"
		wds[3] = 12
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xD6363DD6
	    wds[13] = 0x5FBAB8DC
	elseif wd == "随机宝石9-15级*1套礼包" then
		wds[1] = "装有10个特性宝珠的礼包"
		wds[2] = "装备礼包"
		wds[3] = 12
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xD6363DD6
	    wds[13] = 0x5FBAB8DC



	-- elseif wd == "特赦令牌礼包" then
	-- 	wds[1] = "装有10个特赦令牌的礼包"
	-- 	wds[2] = "装备礼包"
	-- 	wds[3] = 12
	-- 	wds[4] = 0
	--     wds[11] = "item.wdf"
	--     wds[12] = 0xD6363DD6
	--     wds[13] = 0x5FBAB8DC

	elseif wd == "1号助战装备礼包" then
		wds[1] = "欢迎光临,这是属于您的礼物"
		wds[2] = "装备礼包"
		wds[3] = 7
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xD6363DD6
	    wds[13] = 0x5FBAB8DC
	elseif wd == "2号助战装备礼包" then
		wds[1] = "欢迎光临,这是属于您的礼物"
		wds[2] = "装备礼包"
		wds[3] = 7
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xD6363DD6
	    wds[13] = 0x5FBAB8DC
	elseif wd == "3号助战装备礼包" then
		wds[1] = "欢迎光临,这是属于您的礼物"
		wds[2] = "装备礼包"
		wds[3] = 7
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xD6363DD6
	    wds[13] = 0x5FBAB8DC
	elseif wd == "4号助战装备礼包" then
		wds[1] = "欢迎光临,这是属于您的礼物"
		wds[2] = "装备礼包"
		wds[3] = 7
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xD6363DD6
	    wds[13] = 0x5FBAB8DC
     elseif wd == "如意符" then
        wds[1] = "用于删除家具，右击使用，点击要删除的家具就可以了"
        wds[2] = 201
        wds[3] = 3
        wds[4] = 0
        wds[11] = "item.wdf"
        wds[12] = 0x56D82E47
        wds[13] = 0xA2148CBF
    elseif wd == "蝴蝶兰" then
        wds[1] = ""
        wds[2] = 200
        wds[3] = 1
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0xF1AA1CDC
        wds[13] = 0x3DCA686
        wds[15] = "鼠标右键点击使用"
    elseif wd == "桦木圆桌" then
        wds[1] = ""
        wds[2] = 200
        wds[3] = 1
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0xEA3F791
        wds[13] = 0x48FAED8
        wds[15] = "鼠标右键点击使用"
    elseif wd == "五谷轮回桶" then
        wds[1] = ""
        wds[2] = 200
        wds[3] = 4
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0xE14D7033
        wds[13] = 0x85E408B
        wds[15] = "鼠标右键点击使用"
    elseif wd == "凤凰傲意图" then
        wds[1] = ""
        wds[2] = 200
        wds[3] = 3
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0x9AE42B3
        wds[13] = 0x4488275C
        wds[15] = "鼠标右键点击使用"
    elseif wd == "狮子图屏风" then
        wds[1] = ""
        wds[2] = 200
        wds[3] = 2
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0xC15DCDE
        wds[13] = 0xB77C05F8
        wds[15] = "鼠标右键点击使用"
    elseif wd == "神仙帐" then
        wds[1] = ""
        wds[2] = 200
        wds[3] = 2
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0x7336C5AB
        wds[13] = 0xE745545
        wds[15] = "鼠标右键点击使用"
    elseif wd == "麻布地毯" then
        wds[1] = ""
        wds[2] = 200
        wds[3] = 2
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0xFFC56CAC
        wds[13] = 0xFFC56CAC
        wds[15] = "鼠标右键点击使用"
    elseif wd == "虎威太师椅" then
        wds[1] = ""
        wds[2] = 200
        wds[3] = 3
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0xDD6A29AE
        wds[13] = 0x9662814C
        wds[15] = "鼠标右键点击使用"
    elseif wd == "红木地板" then
        wds[1] = ""
        wds[2] = 200
        wds[3] = 3
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0xDD1346DC
        wds[13] = 0x35997A39
        wds[15] = "鼠标右键点击使用"
    elseif wd == "桦木立柜" then
        wds[1] = ""
        wds[2] = 200
        wds[3] = 1
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0x40DBF469
        wds[13] = 0x950DB91E
        wds[15] = "鼠标右键点击使用"
    elseif wd == "月牙凳" then
        wds[1] = ""
        wds[2] = 200
        wds[3] = 2
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0x36FEC0EE
        wds[13] = 0x958ACF12
        wds[15] = "鼠标右键点击使用"
    elseif wd == "银烛台" then
        wds[1] = ""
        wds[2] = 200
        wds[3] = 1
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0x1802F06C
        wds[13] = 0x966FD5CD
        wds[15] = "鼠标右键点击使用"
    elseif wd == "蓝绸绣花帘" then
        wds[1] = ""
        wds[2] = 200
        wds[3] = 3
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0x43D43BC3
        wds[13] = 0x59166107
        wds[15] = "鼠标右键点击使用"
    elseif wd == "波丝地毯" then
        wds[1] = ""
        wds[2] = 200
        wds[3] = 3
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0x5FF1A254
        wds[13] = 0x5FF1A254
        wds[15] = "鼠标右键点击使用"
    elseif wd == "千佛图" then
        wds[1] = ""
        wds[2] = 200
        wds[3] = 1
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0xFD182818
        wds[13] = 0xA9B71F42
        wds[15] = "鼠标右键点击使用"
    elseif wd == "双鱼吉庆柜" then
        wds[1] = ""
        wds[2] = 200
        wds[3] = 2
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0x7CF14A8C
        wds[13] = 0xFC060E32
        wds[15] = "鼠标右键点击使用"
    elseif wd == "仙人掌" then
        wds[1] = ""
        wds[2] = 200
        wds[3] = 2
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0x3970879B
        wds[13] = 0xFB18050C
        wds[15] = "鼠标右键点击使用"
    elseif wd == "雕花马桶" then
        wds[1] = ""
        wds[2] = 200
        wds[3] = 2
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0x264A5EC9
        wds[13] = 0xF0698B61
        wds[15] = "鼠标右键点击使用"
    elseif wd == "水仙" then
        wds[1] = ""
        wds[2] = 200
        wds[3] = 1
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0x10ACEF55
        wds[13] = 0x2BA074EC
        wds[15] = "鼠标右键点击使用"
    elseif wd == "漆花地板" then
        wds[1] = ""
        wds[2] = 200
        wds[3] = 1
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0xBC647367
        wds[13] = 0x1133B493
        wds[15] = "鼠标右键点击使用"
    elseif wd == "花鸟图屏风" then
        wds[1] = ""
        wds[2] = 200
        wds[3] = 2
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0x16B2E033
        wds[13] = 0xA466DED1
        wds[15] = "鼠标右键点击使用"
    elseif wd == "龟鹤延年灯" then
        wds[1] = ""
        wds[2] = 200
        wds[3] = 1
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0x17520E38
        wds[13] = 0x338882F8
        wds[15] = "鼠标右键点击使用"
    elseif wd == "壮丽山河" then
        wds[1] = ""
        wds[2] = 200
        wds[3] = 1
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0x1C93E78C
        wds[13] = 0xEABCDF89
        wds[15] = "鼠标右键点击使用"
    elseif wd == "踏春图" then
        wds[1] = ""
        wds[2] = 200
        wds[3] = 1
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0x1D00C78D
        wds[13] = 0xE14EA35A
        wds[15] = "鼠标右键点击使用"
    elseif wd == "红木八仙桌" then
        wds[1] = ""
        wds[2] = 200
        wds[3] = 1
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0x1E3B47E4
        wds[13] = 0xCE322B80
        wds[15] = "鼠标右键点击使用"
    elseif wd == "黑麻垂蔓帘" then
        wds[1] = ""
        wds[2] = 200
        wds[3] = 1
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0xBB7384E5
        wds[13] = 0x1F74CEFC
        wds[15] = "鼠标右键点击使用"
    elseif wd == "雕花马桶" then
        wds[1] = ""
        wds[2] = 200
        wds[3] = 1
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0x264A5EC9
        wds[13] = 0xF0698B61
        wds[15] = "鼠标右键点击使用"
    elseif wd == "漆花竹凳" then
        wds[1] = ""
        wds[2] = 200
        wds[3] = 1
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0x2A858ABF
        wds[13] = 0xDD195E16
        wds[15] = "鼠标右键点击使用"
    elseif wd == "白虎皮地毯" then
        wds[1] = ""
        wds[2] = 200
        wds[3] = 1
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0xE873EBDA
        wds[13] = 0x2B479E5D
        wds[15] = "鼠标右键点击使用"
    elseif wd == "天山云雪" then
        wds[1] = ""
        wds[2] = 200
        wds[3] = 1
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0x2F988214
        wds[13] = 0xC59023F1
        wds[15] = "鼠标右键点击使用"
    elseif wd == "桦木靠背椅" then
        wds[1] = ""
        wds[2] = 200
        wds[3] = 1
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0x31FC79B2
        wds[13] = 0x6FC9A4F8
        wds[15] = "鼠标右键点击使用"
    elseif wd == "百兽镇邪桌" then
        wds[1] = ""
        wds[2] = 200
        wds[3] = 2
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0x33181B3E
        wds[13] = 0x38B5ADC6
        wds[15] = "鼠标右键点击使用"
    elseif wd == "八宝呈祥桌" then
        wds[1] = ""
        wds[2] = 200
        wds[3] = 1
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0x34F3E6FA
        wds[13] = 0xD941BC31
        wds[15] = "鼠标右键点击使用"
    elseif wd == "黄锻锦边帘" then
        wds[1] = ""
        wds[2] = 200
        wds[3] = 1
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0x373D5C17
        wds[13] = 0xE71A42E5
        wds[15] = "鼠标右键点击使用"
    elseif wd == "彩绘立柜" then
        wds[1] = ""
        wds[2] = 200
        wds[3] = 1
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0xA52D57A2
        wds[13] = 0x40DC127D
        wds[15] = "鼠标右键点击使用"
    elseif wd == "夕阳山水图" then
        wds[1] = ""
        wds[2] = 200
        wds[3] = 1
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0x64D8CADE
        wds[13] = 0xCC5DD99C
        wds[15] = "鼠标右键点击使用"
    elseif wd == "兽皮地毯" then
        wds[1] = ""
        wds[2] = 200
        wds[3] = 1
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0x69CC2D84
        wds[13] = 0xE3EFB84D
        wds[15] = "鼠标右键点击使用"
    elseif wd == "麻木地毯" then
        wds[1] = ""
        wds[2] = 200
        wds[3] = 1
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0x69CC2D84
        wds[13] = 0x6A2EADCD
        wds[15] = "鼠标右键点击使用"
    elseif wd == "红杏闹春帘" then
        wds[1] = ""
        wds[2] = 200
        wds[3] = 4
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0x6C7143EF
        wds[13] = 0x80D12303
        wds[15] = "鼠标右键点击使用"
    elseif wd == "紫檀雕花椅" then
        wds[1] = ""
        wds[2] = 200
        wds[3] = 3
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0xA2F9250A
        wds[13] = 0x6E1F9949
        wds[15] = "鼠标右键点击使用"
    elseif wd == "印花屏风" then
        wds[1] = ""
        wds[2] = 200
        wds[3] = 1
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0x8D1C9B16
        wds[13] = 0x6E75C55E
        wds[15] = "鼠标右键点击使用"
    elseif wd == "玉瓷画瓶" then
        wds[1] = ""
        wds[2] = 200
        wds[3] = 1
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0x72B05C62
        wds[13] = 0xBD83A424
        wds[15] = "鼠标右键点击使用"
    elseif wd == "嵌玉虎纹桌" then
        wds[1] = ""
        wds[2] = 200
        wds[3] = 2
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0x749A8DE7
        wds[13] = 0x822EDE52
        wds[15] = "鼠标右键点击使用"
    elseif wd == "招财聚宝柜" then
        wds[1] = ""
        wds[2] = 200
        wds[3] = 4
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0x7EF80073
        wds[13] = 0xB3589DB5
        wds[15] = "鼠标右键点击使用"
    elseif wd == "八卦镇邪塌" then
        wds[1] = ""
        wds[2] = 200
        wds[3] = 4
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0x9C7E2DE5
        wds[13] = 0x8479C234
        wds[15] = "鼠标右键点击使用"
    elseif wd == "龙凤呈祥" then
        wds[1] = ""
        wds[2] = 200
        wds[3] = 3
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0xCA7094E6
        wds[13] = 0xF001907F
        wds[15] = "鼠标右键点击使用"
    elseif wd == "文竹" then
        wds[1] = ""
        wds[2] = 200
        wds[3] = 1
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0xA3E461E0
        wds[13] = 0xE6265000
        wds[15] = "鼠标右键点击使用"
    elseif wd == "金座雕龙屏风" then
        wds[1] = ""
        wds[2] = 200
        wds[3] = 3
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0xBED2AAC0
        wds[13] = 0xE43EE153
        wds[15] = "鼠标右键点击使用"
    elseif wd == "木地板" then
        wds[1] = ""
        wds[2] = 200
        wds[3] = 42
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0xE2A1D30F
        wds[13] = 0xE2A1D30F
        wds[15] = "鼠标右键点击使用"
    elseif wd == "长信女宫灯" then
        wds[1] = ""
        wds[2] = 200
        wds[3] = 2
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0x9FAC7C21
        wds[13] = 0xDEC76AF6
        wds[15] = "鼠标右键点击使用"
    elseif wd == "紫檀雕花柜" then
        wds[1] = ""
        wds[2] = 200
        wds[3] = 3
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0xDF3EB09B
        wds[13] = 0xD78204FC
        wds[15] = "鼠标右键点击使用"
    elseif wd == "宁安夜梦" then
        wds[1] = ""
        wds[2] = 200
        wds[3] = 4
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0xDB9D4A0F
        wds[13] = 0xA02C51DB
        wds[15] = "鼠标右键点击使用"
    elseif wd == "彩绘花瓶" then
        wds[1] = ""
        wds[2] = 200
        wds[3] = 2
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0xD9438601
        wds[13] = 0xA3274661
        wds[15] = "鼠标右键点击使用"
    elseif wd == "白鹤展翅帘" then
        wds[1] = ""
        wds[2] = 200
        wds[3] = 2
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0xD0522308
        wds[13] = 0xBA96E2CF
        wds[15] = "鼠标右键点击使用"
    elseif wd == "桦木地板" then
        wds[1] = ""
        wds[2] = 200
        wds[3] = 2
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0xDD1346DC
        wds[13] = 0x8E5DC844
        wds[15] = "鼠标右键点击使用"
    elseif wd == "君子兰" then
        wds[1] = ""
        wds[2] = 200
        wds[3] = 1
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0xAE1FE52C
        wds[13] = 0x8A122388
        wds[15] = "鼠标右键点击使用"

        wds[15] = "鼠标右键点击使用"
    elseif wd == "白栅绿竹门" then
        wds[1] = ""
        wds[2] = 202
        wds[3] = 1
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0x2DAB0826
        wds[13] = 0xFAD67DD7
        wds[15] = "鼠标右键点击使用"
    elseif wd == "篱笆花圃" then
        wds[1] = ""
        wds[2] = 202
        wds[3] = 1
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0x6C72DD99
        wds[13] = 0x8864A0CD
        wds[15] = "鼠标右键点击使用"
    elseif wd == "篱笆院墙" then
        wds[1] = ""
        wds[2] = 202
        wds[3] = 1
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0x8C633A1C
        wds[13] = 0xA5231FE6
        wds[15] = "鼠标右键点击使用"
    elseif wd == "石凳" then
        wds[1] = ""
        wds[2] = 202
        wds[3] = 1
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0x6E128DF0
        wds[13] = 0x2C1A8B0E
        wds[15] = "鼠标右键点击使用"
    elseif wd == "石制宫灯" then
        wds[1] = ""
        wds[2] = 202
        wds[3] = 1
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0xA7335624
        wds[13] = 0x730D86FC
        wds[15] = "鼠标右键点击使用"
    elseif wd == "石制影壁" then
        wds[1] = ""
        wds[2] = 202
        wds[3] = 1
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0x855CEC56
        wds[13] = 0x1319D9F2
        wds[15] = "鼠标右键点击使用"
    elseif wd == "石桌" then
        wds[1] = ""
        wds[2] = 202
        wds[3] = 1
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0xA4526D87
        wds[13] = 0x25B4AC07
        wds[15] = "鼠标右键点击使用"
    elseif wd == "大理石凳" then
        wds[1] = ""
        wds[2] = 202
        wds[3] = 2
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0xB4BAF8A6
        wds[13] = 0x9604FFF6
        wds[15] = "鼠标右键点击使用"
    elseif wd == "大理石花圃" then
        wds[1] = ""
        wds[2] = 202
        wds[3] = 2
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0x76F59455
        wds[13] = 0x3FD069AF
        wds[15] = "鼠标右键点击使用"
    elseif wd == "大理石桌" then
        wds[1] = ""
        wds[2] = 202
        wds[3] = 1
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0x5C5CA419
        wds[13] = 0x4D8638F2
        wds[15] = "鼠标右键点击使用"
    elseif wd == "红漆雕花门" then
        wds[1] = ""
        wds[2] = 202
        wds[3] = 1
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0x04DD49CD
        wds[13] = 0x5242BF7B
        wds[15] = "鼠标右键点击使用"
    elseif wd == "青瓷花盆" then
        wds[1] = ""
        wds[2] = 202
        wds[3] = 2
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0x91444F58
        wds[13] = 0x993DEAF9
        wds[15] = "鼠标右键点击使用"
    elseif wd == "青石路砖" then
        wds[1] = ""
        wds[2] = 202
        wds[3] = 2
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0xD1194D50
        wds[13] = 0x8D95A24
        wds[15] = "鼠标右键点击使用"
    elseif wd == "青铜鼎" then
        wds[1] = ""
        wds[2] = 202
        wds[3] = 1
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0x9EC60BCF
        wds[13] = 0xB84D82E
        wds[15] = "鼠标右键点击使用"
    elseif wd == "石制院墙" then
        wds[1] = ""
        wds[2] = 202
        wds[3] = 1
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0x9166DA38
        wds[13] = 0x1C09259A
        wds[15] = "鼠标右键点击使用"
    elseif wd == "白玉花圃" then
        wds[1] = ""
        wds[2] = 202
        wds[3] = 1
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0xFBCA03F8
        wds[13] = 0xA981ED59
        wds[15] = "鼠标右键点击使用"
    elseif wd == "白玉狮子" then
        wds[1] = ""
        wds[2] = 202
        wds[3] = 1
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0x2DAB0826
        wds[13] = 0x54465561
        wds[15] = "鼠标右键点击使用"
    elseif wd == "白玉石凳" then
        wds[1] = ""
        wds[2] = 202
        wds[3] = 1
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0x289B58A7
        wds[13] = 0xD74AAC36
        wds[15] = "鼠标右键点击使用"
    elseif wd == "白玉石桌" then
        wds[1] = ""
        wds[2] = 202
        wds[3] = 1
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0xB9751A7A
        wds[13] = 0xA2D03958
        wds[15] = "鼠标右键点击使用"
    elseif wd == "白玉影壁" then
        wds[1] = ""
        wds[2] = 202
        wds[3] = 1
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0x835DDD76
        wds[13] = 0x85F6F181
        wds[15] = "鼠标右键点击使用"
    elseif wd == "花岗石路砖" then
        wds[1] = ""
        wds[2] = 202
        wds[3] = 1
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0x36D589DC
        wds[13] = 0x2F630A54
        wds[15] = "鼠标右键点击使用"
    elseif wd == "混土砖石院墙" then
        wds[1] = ""
        wds[2] = 202
        wds[3] = 1
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0x8BAC864B
        wds[13] = 0x4680BDAE
        wds[15] = "鼠标右键点击使用"
    elseif wd == "金丝楠木门" then
        wds[1] = ""
        wds[2] = 202
        wds[3] = 1
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0xD7492DA6
        wds[13] = 0x29115EDF
        wds[15] = "鼠标右键点击使用"
    elseif wd == "山水盆景" then
        wds[1] = ""
        wds[2] = 202
        wds[3] = 1
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0xB63474A0
        wds[13] = 0x79C83349
        wds[15] = "鼠标右键点击使用"
    elseif wd == "四圣兽之白虎" then
        wds[1] = ""
        wds[2] = 202
        wds[3] = 1
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0x6B08F32E
        wds[13] = 0xD9D5BAB8
        wds[15] = "鼠标右键点击使用"
    elseif wd == "四圣兽之青龙" then
        wds[1] = ""
        wds[2] = 202
        wds[3] = 1
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0xFEEF9473
        wds[13] = 0xD2DF07DC
        wds[15] = "鼠标右键点击使用"
    elseif wd == "四圣兽之玄武" then
        wds[1] = ""
        wds[2] = 202
        wds[3] = 1
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0x3E50047F
        wds[13] = 0xD79EE5DF
        wds[15] = "鼠标右键点击使用"
    elseif wd == "四圣兽之朱雀" then
        wds[1] = ""
        wds[2] = 202
        wds[3] = 1
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0x3CA923F0
        wds[13] = 0x2A25E1F7
        wds[15] = "鼠标右键点击使用"
    elseif wd == "物品柜" then
        wds[1] = ""
        wds[2] = 202
        wds[3] = 1
        wds[4] = 1
        wds[11] = "item.wdf"
        wds[12] = 0x135D021A
        wds[13] = 0x44D8C646
        wds[15] = "鼠标右键点击使用"
	elseif wd == "跨服专属礼包" then
		wds[1] = "内含一件160级加2W5气血的腰带，5W气血的5级宝宝装备。"
		wds[2] = "装备礼包"
		wds[3] = 8
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xD6363DD6
	    wds[13] = 0x5FBAB8DC
	elseif wd == "金砖" then
		wds[1] = "闪闪发光，可获得大量的银子。"
		wds[2] = 1
		wds[3] = 11
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0x5453A471 --小 0x5A0E9307
	    wds[13] = 0xDDCB73B2 --大 0x62EB440C8
	elseif wd == "金砖1" then
		wds[1] = "闪闪发光，可获得大量的银子。"
		wds[2] = 1
		wds[3] = 11
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0x5453A471 --小 0x5A0E9307
	    wds[13] = 0xDDCB73B2 --大 0x62EB440C8
	elseif wd == "金砖2" then
		wds[1] = "闪闪发光，可获得大量的银子。"
		wds[2] = 1
		wds[3] = 11
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0x5453A471 --小 0x5A0E9307
	    wds[13] = 0xDDCB73B2 --大 0x62EB440C8
	elseif wd == "金砖3" then
		wds[1] = "闪闪发光，可获得大量的银子。"
		wds[2] = 1
		wds[3] = 11
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0x5453A471 --小 0x5A0E9307
	    wds[13] = 0xDDCB73B2 --大 0x62EB440C8
    elseif wd == "钨金" then
        wds[1] = "一种十分稀有的矿产，其坚硬的性能受广大铸造师的喜爱，是熔炼装备的主要配料。"
	    wds[11] = "item.wdf"
        wds[12] = 0x18EAE6A5
        wds[13] = 0x248E4364-----------------
	elseif wd == "储备" then
		wds[1] = "记载着被三界通缉的犯人信息，右键点击后可获得三界悬赏任务。"
		wds[2] = 1
		wds[3] = 11
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0x5453A471 --小 0x5A0E9307
	    wds[13] = 0xDDCB73B2 --大 0x62EB440C8
	elseif wd == "仙丹" then
		wds[1] = "记载着被三界通缉的犯人信息，右键点击后可获得三界悬赏任务。"
		wds[2] = 1
		wds[3] = 11
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xF5883F17 --小 0x5A0E9307
	    wds[13] = 0x60F6CDD8 --大 0x62EB440C8
	elseif wd == "育兽仙丹" then
		wds[1] = "记载着被三界通缉的犯人信息，右键点击后可获得三界悬赏任务。"
		wds[2] = 1
		wds[3] = 11
		wds[4] = 0
        wds[8] = 3
	    wds[11] = "item.wdf"
	    wds[12] = 0xF5883F17 --小 0x5A0E9307
	    wds[13] = 0x60F6CDD8 --大 0x62EB440C8
	elseif wd == "破裂的蛋" then
		wds[1] = "一种神奇的蛋，蛋壳已经破裂，据说集齐99个破裂的蛋后就可以召唤出异兽纳为坐骑。右键点击使用。"
		wds[2] = 1
		wds[3] = 11
		wds[4] = 0
        wds[8] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0xD7478119 --小 0x5A0E9307
	    wds[13] = 0xE06A6568 --大 0x62EB440C8
	elseif wd == "随机5级宝石" then
		wds[1] = "随机5级宝石"
		wds[2] = 1
		wds[3] = 11
		wds[4] = 0
		wds[8] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 182374181
	    wds[13] = 1097166752
	elseif wd == "符石卷轴" then
		wds[1] = "一张记载高级符石合成方式的卷轴"
		wds[2] = "符石卷轴"
		wds[3] = 7
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xF9DD83C6
	    wds[13] = 0xDF3E0DDE
	elseif wd == "10点卡" then
		wds[1] = "经典点卡，可兑换一定的点数。"
		wds[2] = 1
		wds[3] = 11
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xB914F9E5
	    wds[13] = 0xFEF0147A
	elseif wd == "20点卡" then
		wds[1] = "经典点卡，可兑换一定的点数。"
		wds[2] = 1
		wds[3] = 11
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xB914F9E5
	    wds[13] = 0xFEF0147A
	elseif wd == "30点卡" then
		wds[1] = "经典点卡，可兑换一定的点数。"
		wds[2] = 1
		wds[3] = 11
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xB914F9E5
	    wds[13] = 0xFEF0147A
	elseif wd == "50点卡" then
		wds[1] = "经典点卡，可兑换一定的点数。"
		wds[2] = 1
		wds[3] = 11
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xB914F9E5
	    wds[13] = 0xFEF0147A
	elseif wd == "80点卡" then
		wds[1] = "经典点卡，可兑换一定的点数。"
		wds[2] = 1
		wds[3] = 11
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xB914F9E5
	    wds[13] = 0xFEF0147A
	elseif wd == "100点卡" then
		wds[1] = "经典点卡，可兑换一定的点数。"
		wds[2] = 1
		wds[3] = 11
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xB914F9E5
	    wds[13] = 0xFEF0147A
	elseif wd == "120点卡" then
		wds[1] = "经典点卡，可兑换一定的点数。"
		wds[2] = 1
		wds[3] = 11
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xB914F9E5
	    wds[13] = 0xFEF0147A
	elseif wd == "200点卡" then
		wds[1] = "经典点卡，可兑换一定的点数。"
		wds[2] = 1
		wds[3] = 11
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xB914F9E5
	    wds[13] = 0xFEF0147A
	elseif wd == "300点卡" then
		wds[1] = "经典点卡，可兑换一定的点数。"
		wds[2] = 1
		wds[3] = 11
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xB914F9E5
	    wds[13] = 0xFEF0147A
	elseif wd == "400点卡" then
		wds[1] = "经典点卡，可兑换一定的点数。"
		wds[2] = 1
		wds[3] = 11
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xB914F9E5
	    wds[13] = 0xFEF0147A
	elseif wd == "500点卡" then
		wds[1] = "经典点卡，可兑换一定的点数。"
		wds[2] = 1
		wds[3] = 11
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xB914F9E5
	    wds[13] = 0xFEF0147A
	elseif wd == "600点卡" then
		wds[1] = "经典点卡，可兑换一定的点数。"
		wds[2] = 1
		wds[3] = 11
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xB914F9E5
	    wds[13] = 0xFEF0147A
	elseif wd == "1000点卡" then
		wds[1] = "经典点卡，可兑换一定的点数。"
		wds[2] = 1
		wds[3] = 11
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xB914F9E5
	    wds[13] = 0xFEF0147A
	elseif wd == "2000点卡" then
		wds[1] = "经典点卡，可兑换一定的点数。"
		wds[2] = 1
		wds[3] = 11
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xB914F9E5
	    wds[13] = 0xFEF0147A
	elseif wd == "2500点卡" then
		wds[1] = "经典点卡，可兑换一定的点数。"
		wds[2] = 1
		wds[3] = 11
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0xB914F9E5
	    wds[13] = 0xFEF0147A
	elseif wd == "武器" then
	   wds[1] = "三垣中坠，不知其故。展则漫天星辰失色，收则幽渺万籁无声。万顷星瀚，无始无终，无他无我，怎不使人目眩神驰？"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 7
	   wds[5] = 160
	   wds[7] = {"逍遥生","龙太子"}
	   wds[11] = "item.wd1"
	   wds[12] = 2182063168
	   wds[13] = 1649810470
	elseif wd == "装备" then
	    wds[1] = "以日月光芒所织造的霞衣，对敌之时往往令其目眩神驰"
	    wds[2] = 2
	    wds[3] = 4
	    wds[4] = 1
	    wds[5] = 160
	    wds[6] = "女"
	    wds[11] = "item.wd1"
	    wds[12] = 1359780053
	    wds[13] = 2596354317
	elseif wd == "高级武器" then
	   wds[1] = "上古魔神所铸神兵，可抗八部天龙。型如鱼骨，伸缩随心；刃化千万剑丝，柔如春蚕吐丝，韧如天地经纬。"
	   wds[2] = 2
	   wds[3] = 3
	   wds[4] = 3
	   wds[5] = 160
	   wds[7] = {"逍遥生","剑侠客"}
	   wds[11] = "item.wd1"
	   wds[12] = 1088458361
	   wds[13] = 3004473909
	elseif wd == "高级装备" then
	    wds[1] = "混元一气所凝成的宝甲，至坚不摧之物，可与天地同寿"
	    wds[2] = 2
	    wds[3] = 4
	    wds[4] = 1
	    wds[5] = 160
	    wds[6] = "男"
	    wds[11] = "item.wd1"
	    wds[12] = 1802888376
	    wds[13] = 3052290356
	elseif wd == "高级兽决" then
		wds[1] = "记载着上古魔兽特技，可供你的召唤兽学习。"
		wds[2] = 3
		wds[3] = 1
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0x6CAD36E8
	    wds[13] = 0xD86D89B8
	elseif wd == "特殊兽诀" then
		wds[1] = "记载着上古魔兽特技，可供你的召唤兽学习。"
		wds[2] = 3
		wds[3] = 1
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0x6CAD36E8
	    wds[13] = 0xD86D89B8
	elseif wd == "观照万象" then
		wds[1] = "记载着上古魔兽特技，可供你的召唤兽学习。"
		wds[2] = 3
		wds[3] = 1
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0x6CAD36E8
	    wds[13] = 0xD86D89B8
	elseif wd == "随机法宝" then
		wds[1] = "华佗悬壶济世时所带的翡翠葫芦，此宝长期跟随华佗行医，也深谙医术。佩戴此宝会增加师门法术回复的气血。"
		wds[2] = 1000
		wds[3] = 1
		wds[4] = 1
		wds[5] = 1
		wds[6] = 60
	    wds[11] = "item.wdf"
	    wds[12] = 0x60523FF1
	    wds[13] = 0x7669E147
	--========坐骑饰品=======
	elseif wd == "展翅高飞" then
		wds[1] = "展翅高飞仰望天空，装配此物，在人群中闪耀着不同，坐骑装配后能增加所统驭召唤兽的某项临时战斗属性。"
		wds[2] = "坐骑饰品"
		wds[3] = 1
		wds[4] = "宝贝葫芦"
	    wds[11] = "item.wdf"
	    wds[12] = 0xD7E977F7
	    wds[13] = 0x6F09B32F
	elseif wd == "旗开得胜" then
		wds[1] = "凯旋之音，百战百胜，装配此物，在人群中闪耀着不同，坐骑装配后能增加所统驭召唤兽的某项临时战斗属性。"
		wds[2] = "坐骑饰品"
		wds[3] = 1
		wds[4] = "宝贝葫芦"
	    wds[11] = "item.wdf"
	    wds[12] = 0xD555E56C
	    wds[13] = 0x942AB7C0
	elseif wd == "霸王雄风" then
		wds[1] = "霸气雄风，拥有王者之气魄，装配此物，在人群中闪耀着不同，坐骑装配后能增加所统驭召唤兽的某项临时战斗属性。"
		wds[2] = "坐骑饰品"
		wds[3] = 1
		wds[4] = "宝贝葫芦"
	    wds[11] = "item.wdf"
	    wds[12] = 0xDBB13B82
	    wds[13] = 0x01B8900E
	elseif wd == "独眼观天" then
		wds[1] = "非常有特色的装饰，装配后个性独特，与众不同，装配此物，在人群中闪耀着不同，坐骑装配后能增加所统驭召唤兽的某项临时战斗属性。"
		wds[2] = "坐骑饰品"
		wds[3] = 1
		wds[4] = "神气小龟"
	    wds[11] = "item.wdf"
	    wds[12] = 0xAD1A3DAA
	    wds[13] = 0xA8C159D5
	elseif wd == "威武不屈" then
		wds[1] = "充满着坚贞顽强的气魄，照射出大丈夫的豪气，装配此物，在人群中闪耀着不同，坐骑装配后能增加所统驭召唤兽的某项临时战斗属性。"
		wds[2] = "坐骑饰品"
		wds[3] = 1
		wds[4] = "神气小龟"
	    wds[11] = "item.wdf"
	    wds[12] = 0xB4448E15
	    wds[13] = 0xE11D168A
	elseif wd == "深藏不露" then
		wds[1] = "具备神秘的力量，折射着独特的探险家的气味，装配此物，在人群中闪耀着不同，坐骑装配后能增加所统驭召唤兽的某项临时战斗属性。"
		wds[2] = "坐骑饰品"
		wds[3] = 1
		wds[4] = "神气小龟"
	    wds[11] = "item.wdf"
	    wds[12] = 0xC210C8A6
	    wds[13] = 0x38BB89C1
	elseif wd == "异域浓情" then
		wds[1] = "异国色彩浓浓，装扮个性独特，与众不同，装配此物，在人群中闪耀着不同，坐骑装配后能增加所统驭召唤兽的某项临时战斗属性。"
		wds[2] = "坐骑饰品"
		wds[3] = 1
		wds[4] = "汗血宝马"
	    wds[11] = "item.wdf"
	    wds[12] = 0x21E6E4AD
	    wds[13] = 0x2B3BD5AF
	elseif wd == "流星天马" then
		wds[1] = "如流星划过夜空，如天马飞跃彩虹，装配此物，在人群中闪耀着不同，坐骑装配后能增加所统驭召唤兽的某项临时战斗属性。"
		wds[2] = "坐骑饰品"
		wds[3] = 1
		wds[4] = "汗血宝马"
	    wds[11] = "item.wdf"
	    wds[12] = 0x4E622591
	    wds[13] = 0xE99C9229
	elseif wd == "威猛将军" then
		wds[1] = "战场上的最强者，威猛而无畏，装配此物，在人群中闪耀着不同，坐骑装配后能增加所统驭召唤兽的某项临时战斗属性。"
		wds[2] = "坐骑饰品"
		wds[3] = 1
		wds[4] = "汗血宝马"
	    wds[11] = "item.wdf"
	    wds[12] = 0x6734E476
	    wds[13] = 0xCA080495
	elseif wd == "知情达理" then
		wds[1] = "相互感知，生死与共，装配此物，在人群中闪耀着不同，坐骑装配后能增加所统驭召唤兽的某项临时战斗属性。"
		wds[2] = "坐骑饰品"
		wds[3] = 1
		wds[4] = "欢喜羊羊"
	    wds[11] = "item.wdf"
	    wds[12] = 0x42C8E012
	    wds[13] = 0xD84AEFD9
	elseif wd == "气宇轩昂" then
		wds[1] = "潇潇洒洒，气宇轩昂，装配此物，在人群中闪耀着不同，坐骑装配后能增加所统驭召唤兽的某项临时战斗属性。"
		wds[2] = "坐骑饰品"
		wds[3] = 1
		wds[4] = "欢喜羊羊"
	    wds[11] = "item.wdf"
	    wds[12] = 0xC29077C1
	    wds[13] = 0x153B18EB
	elseif wd == "如花似玉" then
		wds[1] = "如花似如梦，装配此物，在人群中闪耀着不同，坐骑装配后能增加所统驭召唤兽的某项临时战斗属性。"
		wds[2] = "坐骑饰品"
		wds[3] = 1
		wds[4] = "欢喜羊羊"
	    wds[11] = "item.wdf"
	    wds[12] = 0x56A40A70
	    wds[13] = 0x95F2DAEA
	elseif wd == "傲视天下" then
		wds[1] = "群雄傲世英雄盖世，装配此物，在人群中闪耀着不同，坐骑装配后能增加所统驭召唤兽的某项临时战斗属性。"
		wds[2] = "坐骑饰品"
		wds[3] = 1
		wds[4] = "魔力斗兽"
	    wds[11] = "item.wdf"
	    wds[12] = 0x399B3F51
	    wds[13] = 0xC124D1F4
	elseif wd == "铁血豪情" then
		wds[1] = "铁汉柔情，刚柔并济乃侠之大者，装配此物，在人群中闪耀着不同，坐骑装配后能增加所统驭召唤兽的某项临时战斗属性。"
		wds[2] = "坐骑饰品"
		wds[3] = 1
		wds[4] = "魔力斗兽"
	    wds[11] = "item.wdf"
	    wds[12] = 0xF0ECED8B
	    wds[13] = 0x369C76E3
	elseif wd == "唯我独尊" then
		wds[1] = "天大地大唯我独大，装配此物，在人群中闪耀着不同，坐骑装配后能增加所统驭召唤兽的某项临时战斗属性。"
		wds[2] = "坐骑饰品"
		wds[3] = 1
		wds[4] = "魔力斗兽"
	    wds[11] = "item.wdf"
	    wds[12] = 0xD8246960
	    wds[13] = 0x1F226C87
	elseif wd == "叱咤风云" then
		wds[1] = "一声怒喝而使风云翻滚，装配此物，在人群中闪耀着不同，坐骑装配后能增加所统驭召唤兽的某项临时战斗属性。"
		wds[2] = "坐骑饰品"
		wds[3] = 1
		wds[4] = "披甲战狼"
	    wds[11] = "item.wdf"
	    wds[12] = 0x82DBAAF6
	    wds[13] = 0x58DC5C54
	elseif wd == "异域风情" then
		wds[1] = "异国色彩浓浓，装扮个性独特，与众不同，装配此物，在人群中闪耀着不同，坐骑装配后能增加所统驭召唤兽的某项临时战斗属性。"
		wds[2] = "坐骑饰品"
		wds[3] = 1
		wds[4] = "披甲战狼"
	    wds[11] = "item.wdf"
	    wds[12] = 0x22245346
	    wds[13] = 0x7F5AF2ED
	elseif wd == "假面勇者" then
		wds[1] = "藏在面具后面的脸，装配此物，在人群中闪耀着不同，坐骑装配后能增加所统驭召唤兽的某项临时战斗属性。"
		wds[2] = "坐骑饰品"
		wds[3] = 1
		wds[4] = "披甲战狼"
	    wds[11] = "item.wdf"
	    wds[12] = 0x84389440
	    wds[13] = 0x6D92CEB9
	elseif wd == "霓裳魅影" then
		wds[1] = "似是天上仙女霓裳飘飘，装配此物，在人群中闪耀着不同，坐骑装配后能增加所统驭召唤兽的某项临时战斗属性。"
		wds[2] = "坐骑饰品"
		wds[3] = 1
		wds[4] = "闲云野鹤"
	    wds[11] = "item.wdf"
	    wds[12] = 0x347CE5F8
	    wds[13] = 0xC3127ABF
	elseif wd == "披星戴月" then
		wds[1] = "犹如夜空中最亮的星，装配此物，在人群中闪耀着不同，坐骑装配后能增加所统驭召唤兽的某项临时战斗属性。"
		wds[2] = "坐骑饰品"
		wds[3] = 1
		wds[4] = "闲云野鹤"
	    wds[11] = "item.wdf"
	    wds[12] = 0x7A72E56A
	    wds[13] = 0xFFB05D4D
	elseif wd == "烈焰燃情" then
		wds[1] = "热情澎湃，此物必配蒙情英雄，装配此物，在人群中闪耀着不同，坐骑装配后能增加所统驭召唤兽的某项临时战斗属性。"
		wds[2] = "坐骑饰品"
		wds[3] = 1
		wds[4] = "闲云野鹤"
	    wds[11] = "item.wdf"
	    wds[12] = 0x1FFD79EC
	    wds[13] = 0x8B15F395
	elseif wd == "天雨流芳" then
		wds[1] = "似是天上流星天雨，装配此物，在人群中闪耀着不同，坐骑装配后能增加所统驭召唤兽的某项临时战斗属性。"
		wds[2] = "坐骑饰品"
		wds[3] = 1
		wds[4] = "云魅仙鹿"
	    wds[11] = "item.wdf"
	    wds[12] = 0x5B7FC4A3
	    wds[13] = 0x65099256
	elseif wd == "灵光再现" then
		wds[1] = "灵光闪动跳跃着智慧和力量，必是侠者不可缺少之物，装配此物，在人群中闪耀着不同，坐骑装配后能增加所统驭召唤兽的某项临时战斗属性。"
		wds[2] = "坐骑饰品"
		wds[3] = 1
		wds[4] = "云魅仙鹿"
	    wds[11] = "item.wdf"
	    wds[12] = 0x5E631741
	    wds[13] = 0x0587D5F5
	elseif wd == "倾国倾城" then
		wds[1] = "美艳动人，美丽与智慧并存，装配此物，在人群中闪耀着不同，坐骑装配后能增加所统驭召唤兽的某项临时战斗属性。"
		wds[2] = "坐骑饰品"
		wds[3] = 1
		wds[4] = "云魅仙鹿"
	    wds[11] = "item.wdf"
	    wds[12] = 0x208D42ED
	    wds[13] = 0x8138AFE1
	--==========法宝材料=====
	elseif wd == "天蚕丝" then
		wds[1] = "为合成法宝的材料之一"
		wds[2] = 1001
		wds[3] = 1
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0x14E761F5
	    wds[13] = 0x4460B6DC
	elseif wd == "玄龟板" then
		wds[1] = "为合成法宝的材料之一"
		wds[2] = 1001
		wds[3] = 1
		wds[4] = 2
	    wds[11] = "item.wdf"
	    wds[12] = 0x5623AC23
	    wds[13] = 0x375D214F
	elseif wd == "阴沉木" then
		wds[1] = "为合成法宝的材料之一"
		wds[2] = 1001
		wds[3] = 1
		wds[4] = 3
	    wds[11] = "item.wdf"
	    wds[12] = 0xD2817A66
	    wds[13] = 0x9331724B
	elseif wd == "麒麟血" then
		wds[1] = "为合成法宝的材料之一"
		wds[2] = 1001
		wds[3] = 1
		wds[4] = 4
	    wds[11] = "item.wdf"
	    wds[12] = 0xD639DEE5
	    wds[13] = 0xF491B41E
	elseif wd == "内丹" then
		wds[1] = "修炼者经过百年甚至千年的修炼在体内以灵气结成的丹丸，是锻造法宝必备的材料。"
		wds[2] = 1001
		wds[3] = 1
		wds[4] = 5
	    wds[11] = "item.wdf"
	    wds[12] = 0x32AAB711
	    wds[13] = 0x629E3769
	elseif wd == "金凤羽" then
		wds[1] = "蜂巢百凤之王金凤凰的羽毛，羽毛上带着不熄的火焰，一片凤羽即可燎原，是锻造法宝的上好材料。"
		wds[2] = 1001
		wds[3] = 1
		wds[4] = 6
	    wds[11] = "item.wdf"
	    wds[12] = 0xDD59C419
	    wds[13] = 0x6060D273
	elseif wd == "补天石" then
		wds[1] = "为合成法宝的材料之一"
		wds[2] = 1001
		wds[3] = 1
		wds[4] = 7
	    wds[11] = "item.wdf"
	    wds[12] = 0x3E7764B4
	    wds[13] = 0xC078A142
	elseif wd == "龙之筋" then
		wds[1] = "为合成法宝的材料之一"
		wds[2] = 1001
		wds[3] = 1
		wds[4] = 8
	    wds[11] = "item.wdf"
	    wds[12] = 0x0309AD83
	    wds[13] = 0x335299FF
	--================================
	elseif wd == "金银锦盒" then
		wds[1] = "满载富贵与祝福的锦盒，上交帮派白虎堂总管，使帮派增加50000的资金并获得10点帮贡。"
		wds[2] = 1002
		wds[3] = 1
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0xA8BB247D
	    wds[13] = 0xF1AB952C
	elseif wd == "神秘钥匙" then
		wds[1] = "神秘的钥匙，使用后有意想不到的效果。"
		wds[2] = 1002
		wds[3] = 1
		wds[4] = 2
	    wds[11] = "item.wdf"
	    wds[12] = 0xA4E274FD
	    wds[13] = 0x65649830
	elseif wd == "仙玉锦囊" then
		wds[1] = "传闻是仙神身上携带的锦囊，开启后可随机获得1-500点仙玉。"
		wds[2] = 1002
		wds[3] = 1
		wds[4] = 3
	    wds[11] = "item.wdf"
	    wds[12] = 0x1563E41D
	    wds[13] = 0xB7A2F46E
	elseif wd == "贪狼令牌" then
		wds[1] = "积攒999个，可找老G换贪狼神兽一只。"
		wds[2] = 1003
		wds[3] = 11
		wds[4] = 0
        wds[8] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0x3DD12EF3
	    wds[13] = 0x8F8DC4AF
	elseif wd == "观照万象碎片" then
		wds[1] = "积攒999个，可找老G换特殊技能观照万象。"
		wds[2] = 1003
		wds[3] = 11
		wds[4] = 0
        wds[8] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0x249D07A5
	    wds[13] = 0x25D608E8

	elseif wd == "消费凭证" then
		wds[1] = "氪金的象征,感谢爸爸妈妈的赞助。"
		wds[2] = 1
		wds[3] = 4
		wds[4] = 1
	    wds[8] = 1
	    wds[9] = 100
	    wds[11] = "item.wd1"
	    wds[12] = 0xdf80eab7
	    wds[13] = 0x3f3f5dd1


    elseif wd == "圣兽丹" then
        wds[1] = "与特定召唤兽炼妖合成，讲丹内上古圣兽之态与召唤兽融合，合成出该召唤兽的饰品，饰品能增加新的形态装饰效果。【说明】炼妖过程中使用的召唤兽会被消耗。"
        wds[11] = "1"
         wds[12]= 0x8029B90A
         wds[13] = 0x80237D0F

    elseif wd == "玄天残卷·上卷" then
        wds[1] = "上古神力编撰而成的玄天卷法了凑齐上中下三卷可以右键兑换一颗圣兽丹。"
        wds[11] = "1"
         wds[12]= 0xC3AF882B
         wds[13] = 0xCFB770DD
    elseif wd == "玄天残卷·中卷" then
        wds[1] = "上古神力编撰而成的玄天卷法了凑齐上中下三卷可以右键兑换一颗圣兽丹。"
        wds[11] = "1"
         wds[12]= 0x559D05B9
         wds[13] = 0x95C4E6EC
    elseif wd == "玄天残卷·下卷" then
        wds[1] = "上古神力编撰而成的玄天卷法了凑齐上中下三卷可以右键兑换一颗圣兽丹。"
        wds[11] = "1"
         wds[12]= 0xF91379E1
         wds[13] = 0xEC1B5658
elseif wd == "新年天眼" then
		wds[1] = "天界的灵符,具有洞察世界万物象的神奇作用。\n【效果】可以查看到部分任务要求的NPC准确坐标。"
		wds[2] = 9
		wds[3] = 3
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0xDF37C485
	    wds[13] = 0x7FA4203F
	    wds[14] = 10000
	    elseif wd == "鬼王天眼通" then
		wds[1] = "天界的灵符,具有洞察世界万物象的神奇作用。\n【效果】可以查看到部分任务要求的NPC准确坐标。"
		wds[2] = 9
		wds[3] = 3
		wds[4] = 1
	    wds[11] = "item.wdf"
	    wds[12] = 0xDF37C485
	    wds[13] = 0x7FA4203F
	    wds[14] = 10000















---------------------------------------------------------------------------------召唤兽饰品--------------------------------------------------------------------------

        elseif wd == "海星饰品" then
            wds[1] = "适合海星使用的饰品，给予其使用后可以增加新的形态装饰效果。"
            wds[11] = "1"
            wds[12] = 0x7D676C74
            wds[13] = 0xEA62CA32
        elseif wd == "章鱼饰品" then
            wds[1] = "适合章鱼使用的饰品，给予其使用后可以增加新的形态装饰效果。"
            wds[11] = "1"
            wds[12] = 0x1B15731D
            wds[13] = 0x6CD2B633
        elseif wd == "泡泡饰品" then
            wds[1] = "适合泡泡使用的饰品，给予其使用后可以增加新的形态装饰效果。"
            wds[11] = "1"
            wds[12] = 0xE28D168D
            wds[13] = 0xC0639106
        elseif wd == "山贼饰品" then
            wds[1] = "适合山贼使用的饰品，给予其使用后可以增加新的形态装饰效果。"
            wds[11] = "1"
            wds[12] = 0x4B1A9A48
            wds[13] = 0x0E709527
        elseif wd == "蚌精饰品" then
            wds[1] = "适合蚌精使用的饰品，给予其使用后可以增加新的形态装饰效果。"
            wds[11] = "1"
            wds[12] = 0x9C8799D6
            wds[13] = 0xCE212384
        elseif wd == "进阶蝴蝶仙子饰品" then
            wds[1] = "适合进阶蝴蝶仙子使用的饰品，给予其使用后可以增加新的形态装饰效果。"
            wds[11] = "1"
            wds[12] = 0xCF439FF6
            wds[13] = 0xF6C2E868
        elseif wd == "进阶黑山老妖饰品" then
            wds[1] = "适合进阶黑山老妖使用的饰品，给予其使用后可以增加新的形态装饰效果。"
            wds[11] = "1"
            wds[12] = 0x7F0984BC
            wds[13] = 0xF62D1967
        elseif wd == "古代瑞兽饰品" then
            wds[1] = "适合古代瑞兽使用的饰品，给予其使用后可以增加新的形态装饰效果。"
            wds[11] = "1"
            wds[12] = 0x671967E1
            wds[13] = 0x36648B93
        elseif wd == "进阶雷鸟人饰品" then
            wds[1] = "适合进阶雷鸟人使用的饰品，给予其使用后可以增加新的形态装饰效果。"
            wds[11] = "1"
            wds[12] = 0x91781353
            wds[13] = 0xC8DB8181
        elseif wd == "白熊饰品" then
            wds[1] = "适合白熊使用的饰品，给予其使用后可以增加新的形态装饰效果。"
            wds[11] = "1"
            wds[12] = 0x0BFC6BDD
            wds[13] = 0x61077013
        elseif wd == "风伯饰品" then
            wds[1] = "适合风伯使用的饰品，给予其使用后可以增加新的形态装饰效果。"
            wds[11] = "1"
            wds[12] = 0x518471FD
            wds[13] = 0x011DF58C
        elseif wd == "进阶地狱战神饰品" then
            wds[1] = "适合进阶地狱战神使用的饰品，给予其使用后可以增加新的形态装饰效果。"
            wds[11] = "1"
            wds[12] = 0xDDEDA244
            wds[13] = 0x0550F690
                   elseif wd == "夜罗刹饰品" then
            wds[1] = "适合夜罗刹使用的饰品，给予其使用后可以增加新的形态装饰效果。"
            wds[11] = "1"
            wds[12] = 0xDDEDA244
            wds[13] = 0x0550F690
              elseif wd == "进阶鬼将饰品" then
            wds[1] = "适合进阶鬼将使用的饰品，给予其使用后可以增加新的形态装饰效果。"
            wds[11] = "1"
            wds[12] = 0xDDEDA244
            wds[13] = 0x0550F690
        elseif wd == "进阶天兵饰品" then
            wds[1] = "适合进阶天兵使用的饰品，给予其使用后可以增加新的形态装饰效果。"
            wds[11] = "1"
            wds[12] = 0xB90799EA
            wds[13] = 0x794C33D0
        elseif wd == "机关兽饰品" then
            wds[1] = "适合机关兽使用的饰品，给予其使用后可以增加新的形态装饰效果。"
            wds[11] = "1"
            wds[12] = 0x082DF2E8
            wds[13] = 0xAA6521F9
        elseif wd == "百足将军饰品" then
            wds[1] = "适合百足将军使用的饰品，给予其使用后可以增加新的形态装饰效果。"
            wds[11] = "1"
            wds[12] = 0x5C295A3C
            wds[13] = 0xC3B83C79
        elseif wd == "金身罗汉饰品" then
            wds[1] = "适合金身罗汉使用的饰品，给予其使用后可以增加新的形态装饰效果。"
            wds[11] = "1"
            wds[12] = 0xA545ABC8
            wds[13] = 0xD05BA36C
        elseif wd == "进阶巨力神猿饰品" then
            wds[1] = "适合进阶巨力神猿使用的饰品，给予其使用后可以增加新的形态装饰效果。"
            wds[11] = "1"
            wds[12] = 0x07C4984D
            wds[13] = 0x4A26363A
        elseif wd == "幽灵饰品" then
            wds[1] = "适合幽灵使用的饰品，给予其使用后可以增加新的形态装饰效果。"
            wds[11] = "1"
            wds[12] = 0x0A7B4FE9
            wds[13] = 0x34FB2CD2
        elseif wd == "雾中仙饰品" then
            wds[1] = "适合雾中仙使用的饰品，给予其使用后可以增加新的形态装饰效果。"
            wds[11] = "1"
            wds[12] = 0x0DB6DE65
            wds[13] = 0x5705837D
        elseif wd == "进阶灵符女娲饰品" then
            wds[1] = "适合进阶灵符女娲使用的饰品，给予其使用后可以增加新的形态装饰效果。"
            wds[11] = "1"
            wds[12] = 0x0EBAA59F
            wds[13] = 0xEE608A2F
        elseif wd == "进阶芙蓉仙子饰品" then
            wds[1] = "适合进阶芙蓉仙子使用的饰品，给予其使用后可以增加新的形态装饰效果。"
            wds[11] = "1"
            wds[12] = 0x105046E1
            wds[13] = 0xD977475C
        elseif wd == "长眉灵猴饰品" then
            wds[1] = "适合长眉灵猴使用的饰品，给予其使用后可以增加新的形态装饰效果。"
            wds[11] = "1"
            wds[12] = 0x11CF5CD9
            wds[13] = 0xAF1E223E
        elseif wd == "猪八戒饰品" then
            wds[1] = "适合猪八戒使用的饰品，给予其使用后可以增加新的形态装饰效果。"
            wds[11] = "1"
            wds[12] = 0x1218BD6F
            wds[13] = 0x138924C9
        elseif wd == "机关鸟饰品" then
            wds[1] = "适合机关鸟使用的饰品，给予其使用后可以增加新的形态装饰效果。"
            wds[11] = "1"
            wds[12] = 0x12425B20
            wds[13] = 0x1DE65975
        elseif wd == "画魂饰品" then
            wds[1] = "适合画魂使用的饰品，给予其使用后可以增加新的形态装饰效果。"
            wds[11] = "1"
            wds[12] = 0xADE9E51F
            wds[13] = 0x13FF213A
        elseif wd == "进阶百足将军饰品" then
            wds[1] = "适合进阶百足将军使用的饰品，给予其使用后可以增加新的形态装饰效果。"
            wds[11] = "1"
            wds[12] = 0xDFCDF195
            wds[13] = 0x15F647DD
        elseif wd == "进阶炎魔神饰品" then
            wds[1] = "适合进阶炎魔神使用的饰品，给予其使用后可以增加新的形态装饰效果。"
            wds[11] = "1"
            wds[12] = 0x17A6BC23
            wds[13] = 0x9BD59357
        elseif wd == "碧海夜叉饰品" then
            wds[1] = "适合碧海夜叉使用的饰品，给予其使用后可以增加新的形态装饰效果。"
            wds[11] = "1"
            wds[12] = 0x1A80ECB4
            wds[13] = 0x13725FAD
        elseif wd == "蝎子精饰品" then
            wds[1] = "适合蝎子精使用的饰品，给予其使用后可以增加新的形态装饰效果。"
            wds[11] = "1"
            wds[12] = 0xC184C139
            wds[13] = 0xBE6B2487
        elseif wd == "进阶毗舍童子饰品" then
            wds[1] = "适合进阶毗舍童子使用的饰品，给予其使用后可以增加新的形态装饰效果。"
            wds[11] = "1"
            wds[12] = 0x719F0348
            wds[13] = 0x1E3090FA
        elseif wd == "进阶噬天虎饰品" then
            wds[1] = "适合进阶噬天虎使用的饰品，给予其使用后可以增加新的形态装饰效果。"
            wds[11] = "1"
            wds[12] = 0xB0E4CE03
            wds[13] = 0x205765E7
        elseif wd == "进阶雨师饰品" then
            wds[1] = "适合进阶雨师使用的饰品，给予其使用后可以增加新的形态装饰效果。"
            wds[11] = "1"
            wds[12] = 0x2F135077
            wds[13] = 0xE4D1B1A7
        elseif wd == "巡游天神饰品" then
            wds[1] = "适合巡游天神使用的饰品，给予其使用后可以增加新的形态装饰效果。"
            wds[11] = "1"
            wds[12] = 0x5F195813
            wds[13] = 0x3773E8DE
        elseif wd == "进阶巡游天神饰品" then
            wds[1] = "适合进阶巡游天神使用的饰品，给予其使用后可以增加新的形态装饰效果。"
            wds[11] = "1"
            wds[12] = 0x3EF393FF
            wds[13] = 0x82A3FA26
        elseif wd == "如意仙子饰品" then
            wds[1] = "适合如意仙子使用的饰品，给予其使用后可以增加新的形态装饰效果。"
            wds[11] = "1"
            wds[12] = 0x4062E575
            wds[13] = 0x7C061EBB
        elseif wd == "进阶如意仙子饰品" then
            wds[1] = "适合进阶如意仙子使用的饰品，给予其使用后可以增加新的形态装饰效果。"
            wds[11] = "1"
            wds[12] = 0x43F8CB57
            wds[13] = 0xD52C3F3E
        elseif wd == "机关人战车饰品" then
            wds[1] = "适合机关人战车使用的饰品，给予其使用后可以增加新的形态装饰效果。"
            wds[11] = "1"
            wds[12] = 0xE9AE67C2
            wds[13] = 0x45169512
        elseif wd == "进阶蝎子精饰品" then
            wds[1] = "适合进阶蝎子精使用的饰品，给予其使用后可以增加新的形态装饰效果。"
            wds[11] = "1"
            wds[12] = 0xB680C138
            wds[13] = 0x46B334CE
        elseif wd == "进阶犀牛将军兽饰品" then
            wds[1] = "适合进阶犀牛将军兽使用的饰品，给予其使用后可以增加新的形态装饰效果。"
            wds[11] = "1"
            wds[12] = 0x46BC3F59
            wds[13] = 0x9F407319
        elseif wd == "进阶凤凰饰品" then
            wds[1] = "适合进阶凤凰使用的饰品，给予其使用后可以增加新的形态装饰效果。"
            wds[11] = "1"
            wds[12] = 0xED3634F0
            wds[13] = 0x484141E4
        elseif wd == "进阶机关人饰品" then
            wds[1] = "适合进阶机关人使用的饰品，给予其使用后可以增加新的形态装饰效果。"
            wds[11] = "1"
            wds[12] = 0x490C0345
            wds[13] = 0x76714710
        elseif wd == "鼠先锋饰品" then
            wds[1] = "适合鼠先锋使用的饰品，给予其使用后可以增加新的形态装饰效果。"
            wds[11] = "1"
            wds[12] = 0xC0AB355B
            wds[13] = 0x4E0CED3B
        elseif wd == "进阶修罗傀儡妖饰品" then
            wds[1] = "适合进阶修罗傀儡妖使用的饰品，给予其使用后可以增加新的形态装饰效果。"
            wds[11] = "1"
            wds[12] = 0x7C45DC26
            wds[13] = 0x4E3E60DF
        elseif wd == "持国巡守饰品" then
            wds[1] = "适合持国巡守饰品使用的饰品，给予其使用后可以增加新的形态装饰效果。"
            wds[11] = "1"
            wds[12] = 0x53C8C818
            wds[13] = 0x2C22EBCF
        elseif wd == "进阶鼠先锋饰品" then
            wds[1] = "适合进阶鼠先锋使用的饰品，给予其使用后可以增加新的形态装饰效果。"
            wds[11] = "1"
            wds[12] = 0xA8E24F81
            wds[13] = 0x5925AB70
        elseif wd == "百足将军饰品" then
            wds[1] = "适合百足将军使用的饰品，给予其使用后可以增加新的形态装饰效果。"
            wds[11] = "1"
            wds[12] = 0x5C295A3C
            wds[13] = 0x5EA142D4
        elseif wd == "真陀护法饰品" then
            wds[1] = "适合真陀护法使用的饰品，给予其使用后可以增加新的形态装饰效果。"
            wds[11] = "1"
            wds[12] = 0x18918659
            wds[13] = 0x5CD1BDD7
        elseif wd == "星灵仙子饰品" then
            wds[1] = "适合星灵仙子使用的饰品，给予其使用后可以增加新的形态装饰效果。"
            wds[11] = "1"
            wds[12] = 0x6E7B1B52
            wds[13] = 0x96710CDD
        elseif wd == "吸血鬼饰品" then
            wds[1] = "适合星灵仙子使用的饰品，给予其使用后可以增加新的形态装饰效果。"
            wds[11] = "1"
            wds[12] = 0x1D124E01
            wds[13] = 0x0C01D076
        elseif wd == "灵符女娲饰品" then
            wds[1] = "适合灵符女娲使用的饰品，给予其使用后可以增加新的形态装饰效果。"
            wds[11] = "1"
            wds[12] = 0x43564039
            wds[13] = 0xDF93EA17
        elseif wd == "进阶阴阳伞饰品" then
            wds[1] = "适合进阶阴阳伞使用的饰品，给予其使用后可以增加新的形态装饰效果。"
            wds[11] = "1"
            wds[12] = 0xD2B5D50A
            wds[13] = 0x62454D13
        elseif wd == "进阶律法女娲饰品" then
            wds[1] = "适合进阶律法女娲使用的饰品，给予其使用后可以增加新的形态装饰效果。"
            wds[11] = "1"
            wds[12] = 0x7E42E492
            wds[13] = 0xE3675B07
        elseif wd == "进阶鲛人饰品" then
            wds[1] = "适合进阶鲛人使用的饰品，给予其使用后可以增加新的形态装饰效果。"
            wds[11] = "1"
            wds[12] = 0xCEC72909
            wds[13] = 0xC331017E
        elseif wd == "进阶蛟龙饰品" then
            wds[1] = "适合进阶蛟龙使用的饰品，给予其使用后可以增加新的形态装饰效果。"
            wds[11] = "1"
            wds[12] = 0xA74A167C
            wds[13] = 0xBB1EA168
        elseif wd == "进阶雨师饰品" then
            wds[1] = "适合进阶雨师使用的饰品，给予其使用后可以增加新的形态装饰效果。"
            wds[11] = "1"
            wds[12] = 0x2F135077
            wds[13] = 0xE4D1B1A7
        elseif wd == "进阶碧水夜叉饰品" then
            wds[1] = "适合进阶碧水夜叉使用的饰品，给予其使用后可以增加新的形态装饰效果。"
            wds[11] = "1"
            wds[12] = 0x9B4BF70D
            wds[13] = 0xFFCDFCE7
        elseif wd == "碧水夜叉饰品" then
            wds[1] = "适合碧水夜叉使用的饰品，给予其使用后可以增加新的形态装饰效果。"
            wds[11] = "1"
            wds[12] = 0x1A80ECB4
            wds[13] = 0x13725FAD
        elseif wd == "阴阳伞饰品" then
            wds[1] = "适合阴阳伞使用的饰品，给予其使用后可以增加新的形态装饰效果。"
            wds[11] = "1"
            wds[12] = 0xA166C299
            wds[13] = 0xDB57031E
        elseif wd == "天兵饰品" then
            wds[1] = "适合天兵使用的饰品，给予其使用后可以增加新的形态装饰效果。"
            wds[11] = "1"
            wds[12] = 0x58E19A2A
            wds[13] = 0x794C33D0
        elseif wd == "进阶天兵饰品" then
            wds[1] = "适合进阶天兵使用的饰品，给予其使用后可以增加新的形态装饰效果。"
            wds[11] = "1"
            wds[12] = 0xB90799EA
            wds[13] = 0x97C67437
        elseif wd == "蚌精饰品" then
            wds[1] = "适合蚌精使用的饰品，给予其使用后可以增加新的形态装饰效果。"
            wds[11] = "1"
            wds[12] = 0x9C8799D6
            wds[13] = 0xCE212384
        elseif wd == "狂豹人形饰品" then
            wds[1] = "适合狂豹人使用的饰品，给予其使用后可以增加新的形态装饰效果。"
            wds[11] = "1"
            wds[12] = 0xE7F09028
            wds[13] = 0x4FF4D46D
        elseif wd == "进阶连弩车饰品" then
            wds[1] = "适合进阶连弩车使用的饰品，给予其使用后可以增加新的形态装饰效果。"
            wds[11] = "1"
            wds[12] = 0x9EF97739
            wds[13] = 0xB2CBE8EE
        elseif wd == "巴蛇饰品" then
            wds[1] = "适合巴蛇使用的饰品，给予其使用后可以增加新的形态装饰效果。"
            wds[11] = "1"
            wds[12] = 0x97B5C8B3
            wds[13] = 0xBBDDD02C
        elseif wd == "狂豹兽形饰品" then
            wds[1] = "适合狂豹兽使用的饰品，给予其使用后可以增加新的形态装饰效果。"
            wds[11] = "1"
            wds[12] = 0x05C9E305
            wds[13] = 0x953F4F60
        elseif wd == "进阶龙龟饰品" then
            wds[1] = "适合进阶龙龟使用的饰品，给予其使用后可以增加新的形态装饰效果。"
            wds[11] = "1"
            wds[12] = 0x70253BD1
            wds[13] = 0x8B86B3A4
        elseif wd == "红萼仙子饰品" then
            wds[1] = "适合红萼仙子使用的饰品，给予其使用后可以增加新的形态装饰效果。"
            wds[11] = "1"
            wds[12] = 0x4F4DABF2
            wds[13] = 0x01235F2E
        elseif wd == "炎魔神饰品" then
            wds[1] = "适合炎魔神使用的饰品，给予其使用后可以增加新的形态装饰效果。"
            wds[11] = "1"
            wds[12] = 0xCD208493
            wds[13] = 0x6AC5801C
        elseif wd == "幽萤娃娃饰品" then
            wds[1] = "适合幽萤娃娃使用的饰品，给予其使用后可以增加新的形态装饰效果。"
            wds[11] = "1"
            wds[12] = 0x5DFF4E29
            wds[13] = 0xAAEEB373
        elseif wd == "进阶画魂饰品" then
            wds[1] = "适合进阶画魂使用的饰品，给予其使用后可以增加新的形态装饰效果。"
            wds[11] = "1"
            wds[12] = 0xAC637ECB
            wds[13] = 0x66E9D6B6
        elseif wd == "画魂饰品" then
            wds[1] = "适合画魂使用的饰品，给予其使用后可以增加新的形态装饰效果。"
            wds[11] = "1"
            wds[12] = 0xADE9E51F
            wds[13] = 0x13FF213A
        elseif wd == "鬼将饰品" then
            wds[1] = "适合鬼将使用的饰品，给予其使用后可以增加新的形态装饰效果。"
            wds[11] = "1"
            wds[12] = 0x107841EB
            wds[13] = 0x836F2B2D
        elseif wd == "进阶古代瑞兽饰品" then
            wds[1] = "适合进阶古代瑞兽使用的饰品，给予其使用后可以增加新的形态装饰效果。"
            wds[11] = "1"
            wds[12] = 0x99E44027
            wds[13] = 0x8FE46833
        elseif wd == "进阶大力金刚饰品" then
            wds[1] = "适合进阶大力金刚使用的饰品，给予其使用后可以增加新的形态装饰效果。"
            wds[11] = "1"
            wds[12] = 0xB499FF30
            wds[13] = 0x693E2418


	elseif wd == "流水工资" then
		wds[1] = "工资结算非今日流水,是总流水积分的百分之一,购买后立即结算清空总流水积分,但不影响历史总流水积分的排名,永久有效"
	    wds[11] = "item.wdf"
	    wds[12] = 0x91B892E4
	    wds[13] = 0xFA853D52









	--=======================
	end
	if wds==nil or (wds[1]==nil or wds[1]=="") and (wds[12]==nil ) then
		if wd==nil then
		    wd=""
		end
		wds[1] = wd.."是个未知物品,请通知管理员更新,谢谢!"
		wds[2] = 4
		wds[3] = 2
		wds[4] = 0
	    wds[11] = "item.wdf"
	    wds[12] = 0X73080A8C
	    wds[13] = 0XDBB55CC4
	    wds[14] = 80
	end
	-- 1为种类 2为分类 3为子类 制造
	return wds
end