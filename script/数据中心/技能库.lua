--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19

-- @Last Modified time: 2021-04-29 17:55:46

--======================================================================--
function 引擎.取技能(jn)
	local jns = {}
	if jn == "灵性" then
		jns[1] = "按技能等级提高灵力"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 3949490866
		jns[8] = 3143201775
		elseif jn == "金钟罩" then
		jns[1] = "为最多3个目标添加状态，可以吸收伤害，最多持续4回合，达到伤害吸收上限后消失\n冷却10回合"
		jns[3] = 3
		jns[4] = "100点魔法"
		jns[6] = "wpal/121.wpal"
		jns[7] = 0x000bb124
		jns[8] = 0x000bb124
	elseif jn == "搏命" then
		jns[1] = "对目标造成自身最大生命值的固定伤害，有几率触发步步回春状态，每回合持续恢复5%最大生命值上限的气血，持续5回合。（生命值低于60%不可使用）"
		jns[3] = 4
		jns[4] = "保留一点气血"
		jns[6] = "wpal/121.wpal"
		jns[7] = 0x000bb125
		jns[8] = 0x000bb125
	elseif jn == "黄泉笑" then
		jns[1] = "对单个目标造成3次物理伤害，每击杀一个目标则提高伤害属性，持续至战斗结束"
		jns[3] = 4
		jns[4] = "10%当前气血"
		jns[6] = "wpal/121.wpal"
		jns[7] = 0x000bb126
		jns[8] = 0x000bb126
		elseif jn == "食指大动" then
		jns[1] = "用不同的水果疯狂轰炸对人，并且百分之二十几率触发食指大动，触发后秒八"
		jns[3] = 4
		jns[4] = "*等级得魔法消耗"
		jns[6] = "wpal/121.wpal"
		jns[7] = 0x1004
		jns[8] = 0x1004
	elseif jn == "蛟龙出海" then
		jns[1] = "对3个目标造成法术伤害，每分配300点魔力属性增加1个伤害目标，以及5%的额外法术暴击率。（可与法术暴击技能效果叠加）"
		jns[3] = 4
		jns[4] = "120点魔法"
		jns[6] = "wpal/121.wpal"
		jns[7] = 0x000bb127
		jns[8] = 0x000bb127
	elseif jn == "扶摇万里" then
		jns[1] = "法术攻击多个目标，按等级附加一定的法术伤害攻击数量：自身等级/15+1，作用人数最多10人"
		jns[3] = 4
		jns[4] = "120点魔法"
		jns[6] = "wpal/121.wpal"
		jns[7] = 0xEE1716AC
		jns[8] = 0xEE1716AC
    elseif jn == "水击三千" then
		jns[1] = "临时提升物理伤害结果和暴击倍率进行一次物理攻击"
		jns[3] = 4
		jns[4] = "120点魔法"
		jns[6] = "wpal/121.wpal"
		jns[7] = 0xEE1718AC
		jns[8] = 0xEE1718AC
		elseif jn == "北冥之渊" then
		jns[1] = "水属性攻击"
		jns[3] = 4
		jns[4] = "120点魔法"
		jns[6] = "wpal/121.wpal"
		jns[7] = 0xEE1714AC
		jns[8] = 0xEE1714AC
	elseif jn == "逍遥游" then
		jns[1] = "主动增益技能，提升所以队友速度，防御,法防"
		jns[3] = 4
		jns[4] = "120点魔法"
		jns[6] = "wpal/121.wpal"
		jns[7] = 0xEE1720AC
		jns[8] = 0xEE1720AC
	elseif jn == "强化法术防御" then
		jns[1] = "提高法术防御能力 等级*5"
		jns[3] = 8
		jns[6] = "xzsc.wdf"
		jns[7] = 0xF0F2E8F1
		jns[8] = 0xF0F2E8F1
	elseif jn == "强化气血上限" then
		jns[1] = "提高气血上限 等级*20"
		jns[3] = 8
		jns[6] = "xzsc.wdf"
		jns[7] = 0x077F08D1
		jns[8] = 0x077F08D1
	elseif jn == "强化物理防御" then
		jns[1] = "提高物理防御能力 等级*5"
		jns[3] = 8
		jns[6] = "xzsc.wdf"
		jns[7] = 0x624C7E94
		jns[8] = 0x624C7E94

	elseif jn == "强化魔法上限" then
		jns[1] = "提高魔法上限 等级*20"
		jns[3] = 8
		jns[6] = "xzsc.wdf"
		jns[7] = 0xF6254282
		jns[8] = 0xF6254282
	elseif jn == "抵抗封印等级" then
		jns[1] = "提高抵抗封印能力 等级*5"
		jns[3] = 8
		jns[6] = "xzsc.wdf"
		jns[7] = 0x6A4612D6
		jns[8] = 0x6A4612D6
	elseif jn == "强化伤害" then
		jns[1] = "提高物理伤害能力 等级*5"
		jns[3] = 8
		jns[6] = "xzsc.wdf"
		jns[7] = 0x2D685412
		jns[8] = 0x2D685412
	elseif jn == "强化固定伤害" then
		jns[1] = "提高固定伤害能力 等级*25"
		jns[3] = 8
		jns[6] = "xzsc.wdf"
		jns[7] = 0xD3236E57
		jns[8] = 0xD3236E57
	elseif jn == "强化封印命中等级" then
		jns[1] = "提高封印命中等级 等级*5"
		jns[3] = 8
		jns[6] = "xzsc.wdf"
		jns[7] = 0x83A054A5
		jns[8] = 0x83A054A5
	elseif jn == "强化治疗能力" then
		jns[1] = "提高治疗能力 等级*5"
		jns[3] = 8
		jns[6] = "xzsc.wdf"
		jns[7] = 0x3FC666BA
		jns[8] = 0x3FC666BA
	elseif jn == "强化法术伤害" then
		jns[1] = "提高法术伤害能力 等级*5"
		jns[3] = 8
		jns[6] = "xzsc.wdf"
		jns[7] = 0xD1EBF7E3
		jns[8] = 0xD1EBF7E3
	elseif jn == "得天独厚" then
		jns[1] = "不会受到暴击效果，并且受到的最大伤害不会高于自身气血上限的35%，需要体质加点大于500生效"
		jns[3] = 7
		jns[6] = "wpal/121.wpal"
		jns[7] = 0x000bb128
		jns[8] = 0x000bb128
	elseif jn == "天见尤怜" then
		jns[1] = "当前气血低于一定值时，受到的所有伤害减免"
		jns[3] = 7
		jns[6] = "wpal/121.wpal"
		jns[7] = 0x000bb129
		jns[8] = 0x000bb129
	elseif jn == "多多益善" then
		jns[1] = "使所有法术系技能有几率增加1个目标"
		jns[3] = 7
		jns[6] = "wpal/121.wpal"
		jns[7] = 0x000bb130
		jns[8] = 0x000bb130
	elseif jn == "奋蹄扬威" then
		jns[1] = "造成物理伤害时会忽视目标一定防御"
		jns[3] = 7
		jns[6] = "wpal/121.wpal"
		jns[7] = 0x000bb131
		jns[8] = 0x000bb131
	elseif jn == "混元气劲" then
		jns[1] = "使用法术时，真气消耗增加50%，造成的伤害会按照当前真气追击额外伤害"
		jns[3] = 7
		jns[6] = "wpal/121.wpal"
		jns[7] = 0x000bb132
		jns[8] = 0x000bb132
	elseif jn == "伐骨抽髓" then
		jns[1] = "造成物理伤害时，有几率附加目标当前气血百分比的伤害"
		jns[3] = 7
		jns[6] = "wpal/121.wpal"
		jns[7] = 0x000bb133
		jns[8] = 0x000bb133
	elseif jn == "金箍" then
		jns[1] = "对单个目标施加金箍封印,使其无法使用技能,并每回合受到一定伤害\n冷却5回合"
		jns[3] = 4
		jns[4] = "80点魔法"
		jns[6] = "wpal/121.wpal"
		jns[7] = 0x000bb108
		jns[8] = 0x000bb108
	elseif jn == "言出法随" then
		jns[1] = "对单个目标造成一次最大生命值相关的固定伤害,并附加言出法随效果,若持续回合超过3则会使目标进入禁言状态,无法释放任何法术\n冷却5回合"
		jns[3] = 4
		jns[4] = "80点魔法"
		jns[6] = "wpal/121.wpal"
		jns[7] = 0x000bb109
		jns[8] = 0x000bb109
	elseif jn == "狂风大作" then
		jns[1] = "对6个目标造成一次法术伤害,并为自己添加御风状态,此状态下在进行风灵波动时,即便速度低于目标也视作高于\n冷却5回合"
		jns[3] = 4
		jns[4] = "110点魔法"
		jns[6] = "wpal/121.wpal"
		jns[7] = 0x000bb110
		jns[8] = 0x000bb110
	elseif jn == "摇晃" then
		jns[1] = "在'出火''生烟''飞沙走石'三种效果中,随机释放一种\n出火:单体攻击目标,造成大量法术伤害\n生烟:单体攻击目标,造成少量法术伤害,但会大幅度降低目标的命中属性\n飞砂走石:群体攻击4个目标,造成法术伤害\n冷却5回合"
		jns[3] = 4
		jns[4] = "110点魔法"
		jns[6] = "wpal/121.wpal"
		jns[7] = 0x000bb111
		jns[8] = 0x000bb111
	elseif jn == "阴阳二气" then
		jns[1] = "对单个目标添加阴阳二气状态,此状态下释放防御之外的任何指令必定立即受到伤害\n冷却5回合"
		jns[3] = 4
		jns[4] = "100点魔法"
		jns[6] = "wpal/121.wpal"
		jns[7] = 0x000bb112
		jns[8] = 0x000bb112
	elseif jn == "金刚伏魔" then
		jns[1] = "按技能等级提高伤害力"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 2566898861
		jns[8] = 3862994147
	elseif jn == "失忆符" then
		jns[1] = "令对手一定回合无法使用特技"
		jns[3] = 4
		jns[4] = "55点魔法"
		jns[5] = "符之术技能达到20级"
		jns[6] = "wzife.wdf"
		jns[7] = 1562829683
		jns[8] = 2704552245
	elseif jn == "龙腾" then
		jns[1] = "施展法术攻击对方单人"
		jns[3] = 4
		jns[4] = "30点魔法"
		jns[5] = "龙腾术技能达到50级"
		jns[6] = "wzife.wdf"
		jns[7] = 2093346600
		jns[8] = 3650312562
	elseif jn == "高级慧根" then
		jns[1] = "使用法术时所消耗的魔法降低为正常的50%"
		jns[3] = 7
		jns[6] = "wzife.wdf"
		jns[7] = 242180125
		jns[8] = 4174265955
	elseif jn == "混天术" then
		jns[1] = "无效果"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 3643496130
		jns[8] = 481805567
	elseif jn == "龙腾术" then
		jns[1] = "无效果"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 3471484278
		jns[8] = 2151837087
	elseif jn == "驱尸" then
		jns[1] = "解除各类中毒状态"
		jns[3] = 3
		jns[4] = "40点魔法"
		jns[5] = "周易学技能达到20级"
		jns[6] = "wzife.wdf"
		jns[7] = 1226417381
		jns[8] = 546827248
	elseif jn == "神出鬼没" then
		jns[1] = "进入战斗后获得修罗隐身状态2-3回合；隐身状态下伤害效果提高10%，躲避率增加10%。"
		jns[3] = 7
		jns[6] = "wpal/121.wpal"
		jns[7] = 0x00001010
		jns[8] = 0x00001010
	elseif jn == "昼伏夜出" then
		jns[1] = "效果：夜间物理伤害效果不会减少并提高10%，躲避率增加10%"
		jns[3] = 7
		jns[6] = "wpal/121.wpal"
		jns[7] = 0x00001014
		jns[8] = 0x00001014
		elseif jn == "溜之大吉" then
		jns[1] = "效果：自身速度提高20%，躲避率增加10%。"
		jns[3] = 7
		jns[6] = "wpal/121.wpal"
		jns[7] = 0x00001006
		jns[8] = 0x00001006
		elseif jn == "高级进击必杀" then
		jns[1] = "技能效果：进入战斗时，有5%的几率。可以打出翻数倍伤害"
		jns[3] = 7
		jns[6] = "wpal/121.wpal"
		jns[7] = 0x00001018
		jns[8] = 0x00001018
		elseif jn == "高级进击法爆" then
		jns[1] = "技能效果：进入战斗时，有20%的几率。触发法术暴击，可以打出翻倍的伤害。 "
		jns[3] = 7
		jns[6] = "wpal/121.wpal"
		jns[7] = 0x00001022
		jns[8] = 0x00001022
		elseif jn == "势如破竹" then
		jns[1] = "技能效果：增加灵力。 "
		jns[3] = 7
		jns[6] = "wpal/121.wpal"
		jns[7] = 0x00001012
		jns[8] = 0x00001012
		elseif jn == "乘胜追击" then
		jns[1] = "技能效果：增加伤害。 "
		jns[3] = 7
		jns[6] = "wpal/121.wpal"
		jns[7] = 0x00001001
		jns[8] = 0x00001001
		elseif jn == "流沙轻音" then
		jns[1] = "水系法术攻击3个目标，并提高法术连击的概率。"
		jns[3] = 4
		jns[4] = "100点魔法"
		jns[6] = "wpal/121.wpal"
		jns[7] = 0x00001008
		jns[8] = 0x00001008
		elseif jn == "凝光炼彩" then
		jns[1] = "为最多5个目标添加状态，可以吸收伤害，最多持续4回合，达到伤害吸收上限后消失\n冷却5回合"
		jns[3] = 3
		jns[4] = "100点魔法"
		jns[6] = "wpal/121.wpal"
		jns[7] = 0x00001009
	elseif jn == "水攻" then
		jns[1] = "水属性的攻击法术，按召唤兽等级附加一定的法术伤害"
		jns[3] = 4
		jns[4] = "30点魔法"
		jns[6] = "wzife.wdf"
		jns[7] = 85059369
		jns[8] = 2415441344
	elseif jn == "尸腐毒" then
		jns[1] = "令对手中“尸毒”。"
		jns[3] = 4
		jns[4] = "40点魔法"
		jns[5] = "尸腐恶技能达到20级"
		jns[6] = "wzife.wdf"
		jns[7] = 49094427
		jns[8] = 2328293467
	elseif jn == "闭月羞花" then
		jns[1] = "无效果"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 3321056507
		jns[8] = 4213596062
	elseif jn == "无敌牛虱" then
		jns[1] = "召唤牛妖前来协助战斗"
		jns[3] = 4
		jns[4] = "40点魔法"
		jns[5] = "牛虱阵技能达到25级"
		jns[6] = "wzife.wdf"
		jns[7] = 3889342201
		jns[8] = 901977927
	elseif jn == "百毒不侵" then
		jns[1] = "解毒并在一定回合内避免中毒"
		jns[3] = 5
		jns[4] = "30点魔法"
		jns[5] = "玉质冰肌技能达到10级"
		jns[6] = "wzife.wdf"
		jns[7] = 45388430
		jns[8] = 938983833
	elseif jn == "养生之道" then
		jns[1] = "修身养性，固本清元之术，学习可以增加活力上限"
		jns[3] = 80
		jns[6] = "wzife.wdf"
		jns[7] = 968832765
		jns[8] = 1635371623
	elseif jn == "乘风破浪" then
		jns[1] = "战斗中增加自己或队友的躲避力"
		jns[3] = 3
		jns[4] = "40点魔法"
		jns[5] = "游龙术技能达到20级"
		jns[6] = "wzife.wdf"
		jns[7] = 90073709
		jns[8] = 3228417140
	elseif jn == "烟雨剑法" then
		jns[1] = "使用后可以连续攻击对手两次"
		jns[3] = 4
		jns[4] = "50点魔法"
		jns[5] = "潇湘仙雨技能达到25级，当前气血高于上限的60%"
		jns[6] = "wzife.wdf"
		jns[7] = 3124546025
		jns[8] = 3643055813
	elseif jn == "定心术" then
		jns[1] = "战斗中临时提高自己的灵力"
		jns[3] = 66
		jns[4] = "40点魔法"
		jns[5] = "阴阳二气诀技能达到40级"
		jns[6] = "wzife.wdf"
		jns[7] = 3988224797
		jns[8] = 99592343
	elseif jn == "百万神兵" then
		jns[1] = "令对方无法使用物理攻击"
		jns[3] = 4
		jns[4] = "60点魔法"
		jns[5] = "混天术技能达到40级"
		jns[6] = "wzife.wdf"
		jns[7] = 3140668291
		jns[8] = 4284468319
	elseif jn == "神兵护法" then
		jns[1] = "打造后为帽子提高一定的属性"
		jns[3] = 12
		jns[4] = "和技能等级数相同的活力"
		jns[5] = "神道无念技能达到35级"
		jns[6] = "wzife.wdf"
		jns[7] = 1217133207
		jns[8] = 3100160960
	elseif jn == "巨岩破" then
		jns[1] = "施展法术攻击多人，并附加固定伤害"
		jns[3] = 4
		jns[4] = "50点魔法"
		jns[5] = "五行学技能达到12级"
		jns[6] = "wzife.wdf"
		jns[7] = 3218559640
		jns[8] = 3817801025
	elseif jn == "乾坤塔" then
		jns[1] = "按技能等级提高防御力"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 646614501
		jns[8] = 3014813769
	elseif jn == "轻如鸿毛" then
		jns[1] = "打造后为武器提高一定的属性"
		jns[3] = 12
		jns[4] = "和技能等级数相同的活力"
		jns[5] = "香飘兰麝技能达到35级，人物等级达到30级"
		jns[6] = "wzife.wdf"
		jns[7] = 33492847
		jns[8] = 367093981
	elseif jn == "灵通术" then
		jns[1] = "无效果"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 695584869
		jns[8] = 577240546
	elseif jn == "魔王回首" then
		jns[1] = "使用后可以在受到物理攻击的时候自动反击"
		jns[3] = 66
		jns[4] = "30点魔法"
		jns[5] = "回身击技能达到30级"
		jns[6] = "wzife.wdf"
		jns[7] = 995890213
		jns[8] = 3043919056
	elseif jn == "飘渺式" then
		jns[1] = "作用为当目标为怪物时，通过法术启动物理攻击对方多个目标"
		jns[3] = 4
		jns[4] = "30点魔法+作用人数*30点魔法"
		jns[5] = "潇湘仙雨技能达到20级"
		jns[6] = "wzife.wd1"
		jns[7] = 3268745174
		jns[8] = 3398385178
	elseif jn == "达摩护体" then
		jns[1] = "战斗中临时提高自己或队友的气血上限"
		jns[3] = 3
		jns[4] = "30点魔法"
		jns[5] = "佛光普照技能达到30级"
		jns[6] = "wzife.wdf"
		jns[7] = 1415107827
		jns[8] = 3131800459
	elseif jn == "高级法术抵抗" then
		jns[1] = "减少10%所受的法术伤害，但同时物理伤害能力减少10%。"
		jns[3] = 7
		jns[6] = "wzife.wd2"
		jns[7] = 3908900845
		jns[8] = 3908900845
	elseif jn == "高级反震" then
		jns[1] = "受到物理攻击时有30%几率给予对方反震，反震伤害为所受伤害的50%"
		jns[3] = 7
		jns[6] = "wzife.wdf"
		jns[7] = 1907422702
		jns[8] = 511662384
	elseif jn == "灵动九天" then
		jns[1] = "为队友临时增加灵力"
		jns[3] = 3
		jns[4] = "30点魔法"
		jns[5] = "人物飞升且“金刚经”技能达到120级"
		jns[6] = "wzife.wdf"
		jns[7] = 2299324564
		jns[8] = 1921901005
	elseif jn == "迷情大法" then
		jns[1] = "无效果"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 2410267095
		jns[8] = 3102396352
	elseif jn == "紧箍咒" then
		jns[1] = "一定回合内减少对方的气血和气血上限"
		jns[3] = 4
		jns[4] = "50点魔法"
		jns[5] = "观音咒技能达到30级"
		jns[6] = "wzife.wdf"
		jns[7] = 1573115441
		jns[8] = 956876360
	elseif jn == "苍茫树" then
		jns[1] = "施展法术攻击多人，并附加固定伤害"
		jns[3] = 4
		jns[4] = "50点魔法"
		jns[5] = "五行学技能达到13级"
		jns[6] = "wzife.wdf"
		jns[7] = 1228860567
		jns[8] = 2355974251
	elseif jn == "周易学" then
		jns[1] = "按技能等级提高魔法上限"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 951717916
		jns[8] = 3182787390
	elseif jn == "五行学说" then
		jns[1] = "无效果"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 3646722626
		jns[8] = 733606302
	elseif jn == "诵经" then
		jns[1] = "无效果"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 1921499236
		jns[8] = 3515981629
	elseif jn == "离魂符" then
		jns[1] = "令对手一定回合内无法使用法术，并降低躲避力"
		jns[3] = 4
		jns[4] = "50点魔法"
		jns[5] = "符之术技能达到25级"
		jns[6] = "wzife.wdf"
		jns[7] = 30806
		jns[8] = 3355342391
	elseif jn == "五雷轰顶" then
		jns[1] = "减少敌人25%当前气血及魔法，但最高不会超过自己等级×50，失败只减少5%的当前气血"
		jns[3] = 4
		jns[4] = "50点魔法"
		jns[5] = "天罡气技能达到35级"
		jns[6] = "wzife.wdf"
		jns[7] = 4236045895
		jns[8] = 1825724039
	elseif jn == "六道轮回" then
		jns[1] = "按技能等级提高伤害力"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 2191025103
		jns[8] = 1761343362
	elseif jn == "九幽阴魂" then
		jns[1] = "按技能等级提高灵力"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 2427286393
		jns[8] = 2803361004
	elseif jn == "佛门普渡" then
		jns[1] = "平时状态下使用，可以瞬间回到自己的门派"
		jns[3] = 0
		jns[4] = "10点气血和10点魔法"
		jns[5] = "渡世步技能达到1级"
		jns[6] = "wzife.wdf"
		jns[7] = 2996697873
		jns[8] = 3423122163
	elseif jn == "傲世诀" then
		jns[1] = "无效果"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 3001127144
		jns[8] = 1049195070
	elseif jn == "天神护体" then
		jns[1] = "战斗中提升自己的灵力"
		jns[3] = 5
		jns[4] = "50点魔法"
		jns[5] = "天罡气技能达到30级"
		jns[6] = "wzife.wdf"
		jns[7] = 2173852985
		jns[8] = 4200916921
	elseif jn == "镇妖" then
		jns[1] = "使用它后可以降低怪物的伤害力"
		jns[3] = 4
		jns[4] = "45点魔法"
		jns[5] = "乾坤塔技能达到30级"
		jns[6] = "wzife.wdf"
		jns[7] = 2821624851
		jns[8] = 251203682
	elseif jn == "生死搏" then
		jns[1] = "按技能等级提高伤害力"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 3136073986
		jns[8] = 1362791032
	elseif jn == "天罗地网" then
		jns[1] = "每次攻击时有一定几率令对手在一定回合内无法使用物理攻击,"
		jns[3] = 4
		jns[4] = "30点魔法，攻击多人时消耗增加"
		jns[5] = "移形换影技能达到15级"
		jns[6] = "wzife.wdf"
		jns[7] = 1653509465
		jns[8] = 1457394081
	elseif jn == "天神护法" then
		jns[1] = "战斗中提升自己的防御"
		jns[3] = 5
		jns[4] = "30点魔法"
		jns[5] = "天罡气技能等级达到40级以上"
		jns[6] = "wzife.wdf"
		jns[7] = 4053425914
		jns[8] = 3750198819
	elseif jn == "乾天罡气" then
		jns[1] = "消耗气血来补充自己的魔法值"
		jns[3] = 5
		jns[4] = "20点气血"
		jns[5] = "神道无念技能达到30级"
		jns[6] = "wzife.wdf"
		jns[7] = 3309202999
		jns[8] = 2018341630
	elseif jn == "高级防御" then
		jns[1] = "增加(自身等级×0.8)的防御，但法术伤害能力会降低10%"
		jns[3] = 7
		jns[6] = "wzife.wdf"
		jns[7] = 1616189465
		jns[8] = 3783015310
	elseif jn == "否定信仰" then
		jns[1] = "不受异常、辅助效果影响，受到鬼魂类怪物攻击时伤害增加20%，不能同时拥有某些信仰类技能"
		jns[3] = 7
		jns[6] = "wzife.wdf"
		jns[7] = 3345212313
		jns[8] = 3002471686
	elseif jn == "盘丝阵" then
		jns[1] = "提升自身的防御力"
		jns[3] = 5
		jns[4] = "40点魔法"
		jns[5] = "盘丝大法技能达到20级"
		jns[6] = "wzife.wdf"
		jns[7] = 2395356970
		jns[8] = 1769215086
	elseif jn == "无敌牛妖" then
		jns[1] = "召唤使用法术的牛妖前来协助战斗"
		jns[3] = 5
		jns[4] = "40点魔法"
		jns[5] = "牛虱阵技能达到25级"
		jns[6] = "wzife.wd1"
		jns[7] = 526953932
		jns[8] = 2771934779
	elseif jn == "法术暴击" then
		jns[1] = "使用法术攻击目标时会有一定几率使法术伤害值加倍"
		jns[3] = 7
		jns[6] = "wzife.wdf"
		jns[7] = 1389982585
		jns[8] = 1108386617
	elseif jn == "尸气漫天" then
		jns[1] = "打造后为帽子提高一定的属性"
		jns[3] = 12
		jns[4] = "和技能等级数相同的活力"
		jns[5] = "拘魂诀技能达到35级 "
		jns[6] = "wzife.wdf"
		jns[7] = 3830562709
		jns[8] = 3540479557
	elseif jn == "雷霆万钧" then
		jns[1] = "攻击性法术，使用后攻击对方多个目标"
		jns[3] = 4
		jns[4] = "35点魔法×作用人数"
		jns[5] = "人物飞升且“天罡气”技能达到120级"
		jns[6] = "wzife.wdf"
		jns[7] = 1167105764
		jns[8] = 2063612274
	elseif jn == "佛法无边" then
		jns[1] = "使目标施展某些攻击性法术时一定几率出现连续两次攻击（不包括需停回合的法术及群体攻击性法术，如横扫千军、鹰击、后发制人、连环击）"
		jns[3] = 3
		jns[4] = "150点魔法"
		jns[5] = "人物飞升且“金刚伏魔”技能达到120级 "
		jns[6] = "wzife.wdf"
		jns[7] = 2286663605
		jns[8] = 3100187427
	elseif jn == "移形换影" then
		jns[1] = "平时状态下使用，可以瞬间回到自己的门派"
		jns[3] = 0
		jns[4] = "10点气血和10点魔法"
		jns[5] = "清歌妙舞技能达到1级"
		jns[6] = "wzife.wdf"
		jns[7] = 2099222596
		jns[8] = 1436233235
	elseif jn == "情天恨海" then
		jns[1] = "克制五庄观弟子的必杀技"
		jns[3] = 4
		jns[4] = "150点愤怒值"
		jns[5] = "沉鱼落雁技能达到25级，人物等级达到20级"
		jns[6] = "wzife.wdf"
		jns[7] = 1898550998
		jns[8] = 2472450541
	elseif jn == "自在心法" then
		jns[1] = "清除己方队员身上普渡众生效果，同时将该回合剩余回合可增加的当前气血与气血上限结算进行回复。"
		jns[3] = 3
		jns[4] = "30点魔法"
		jns[5] = "灵性技能达到60级"
		jns[6] = "wzife.wd1"
		jns[7] = 1199130784
		jns[8] = 3420028880
	elseif jn == "高级偷袭" then
		jns[1] = "身手灵敏，不会受到反击和反震，物理攻击效果提高10%"
		jns[3] = 7
		jns[6] = "wzife.wdf"
		jns[7] = 4012815828
		jns[8] = 1555617599
	elseif jn == "阴阳二气诀" then
		jns[1] = "无效果"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 683331190
		jns[8] = 4236173132
	elseif jn == "佛光普照" then
		jns[1] = "无效果"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 3599571341
		jns[8] = 921854792
	elseif jn == "飞砂走石" then
		jns[1] = "使用后可以攻击对方多个对象"
		jns[3] = 4
		jns[4] = "30点魔法，攻击多人时消耗增加"
		jns[5] = "火云术技能达到30级"
		jns[6] = "wzife.wdf"
		jns[7] = 706133968
		jns[8] = 746568918
	elseif jn == "呼风唤雨" then
		jns[1] = "无效果"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 438165716
		jns[8] = 1919875705
	elseif jn == "修罗隐身" then
		jns[1] = "战斗中隐藏自己或队友的身形，令对手无法攻击，隐身状态下不能施展法术。"
		jns[3] = 5
		jns[4] = "150点魔法，对自己使用每回合消耗施法者15点魔法，对队友使用每回合消耗施法者10点魔法。"
		jns[5] = "尸腐恶技能达到20级"
		jns[6] = "wzife.wdf"
		jns[7] = 557290721
		jns[8] = 3076118166
	elseif jn == "天地同寿" then
		jns[1] = "为目标临时加上一个防御护罩，吸收全部法术伤害，降低目标50%防御效果，且所受物理伤害会加倍"
		jns[3] = 9
		jns[4] = "50点魔法"
		jns[5] = "人物飞升且“乾坤袖”技能达到120级"
		jns[6] = "wzife.wdf"
		jns[7] = 4224047219
		jns[8] = 3294906395
	elseif jn == "倾国倾城" then
		jns[1] = "无效果"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 594113044
		jns[8] = 3862994147
	elseif jn == "莲华妙法" then
		jns[1] = "打造后为项链提高一定的属性"
		jns[3] = 12
		jns[4] = "和技能等级数相同的活力"
		jns[5] = "金刚经技能达到35级"
		jns[6] = "wzife.wdf"
		jns[7] = 4050867699
		jns[8] = 2277699794
	elseif jn == "游龙术" then
		jns[1] = "按技能等级提高躲避力"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 1730135660
		jns[8] = 316450658
	elseif jn == "潇湘仙雨" then
		jns[1] = "按技能等级提高伤害力"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 3541032788
		jns[8] = 2723035390
	elseif jn == "日月乾坤" then
		jns[1] = "令对手一定回合内无法行动，与怪物战斗中若对方均中此法术则战斗胜利，与玩家对战时类似普通封类法术。"
		jns[3] = 4
		jns[4] = "35点魔法 使用失败消耗：10点魔法"
		jns[5] = "乾坤袖技能达到20级，不能用在某些特殊任务的战斗中使用成功"
		jns[6] = "wzife.wdf"
		jns[7] = 3902929414
		jns[8] = 3489253938
	elseif jn == "高级冥思" then
		jns[1] = "战斗中每回合自动恢复(自身等级二分之一)的魔法"
		jns[3] = 7
		jns[6] = "wzife.wdf"
		jns[7] = 1718714912
		jns[8] = 2174943999
	elseif jn == "追魂符" then
		jns[1] = "令对手一定回合无法使用物理攻击，并降低物理防御力"
		jns[3] = 4
		jns[4] = "50点魔法"
		jns[5] = "符之术技能达到25级"
		jns[6] = "wzife.wdf"
		jns[7] = 1021060099
		jns[8] = 2404071232
	elseif jn == "唧唧歪歪" then
		jns[1] = "攻击性法术，达到一定等级后可以对多人使用"
		jns[3] = 4
		jns[4] = "5点气血，20点魔法，作用于多人时消耗魔法增加"
		jns[5] = "诵经技能达到1级"
		jns[6] = "wzife.wdf"
		jns[7] = 1856916618
		jns[8] = 2374732908
	elseif jn == "歧黄之术" then
		jns[1] = "无效果"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 2055755507
		jns[8] = 93243227
	elseif jn == "金刚护体" then
		jns[1] = "战斗中临时提高自己或队友的防御力，技能达到一定等级后可用于多人"
		jns[3] = 3
		jns[4] = "30点魔法"
		jns[5] = "佛光普照技能等级达到35级以上"
		jns[6] = "wzife.wdf"
		jns[7] = 1377178114
		jns[8] = 3453377621
	elseif jn == "训兽诀" then
		jns[1] = "按技能等级提高灵力"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 1184160039
		jns[8] = 3128610907
	elseif jn == "龙吟" then
		jns[1] = "使用后可以减少对方全体队员一定的气血和魔法值"
		jns[3] = 4
		jns[4] = "30点魔法"
		jns[5] = "龙附技能达到30级"
		jns[6] = "wzife.wdf"
		jns[7] = 1318499395
		jns[8] = 2137943042
	elseif jn == "裂石步" then
		jns[1] = "按技能等级提高躲避"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 4286232830
		jns[8] = 3339537828
	elseif jn == "杨柳甘露" then
		jns[1] = "使用后可以复活已经死亡的队友，可以复活处在“锢魂术”或者“死亡召唤”状态下剩余回合小于等于2的队友。"
		jns[3] = 3
		jns[4] = "150点魔法"
		jns[5] = "观音咒技能达到20级"
		jns[6] = "wzife.wdf"
		jns[7] = 3757213330
		jns[8] = 794491517
	elseif jn == "香飘兰麝" then
		jns[1] = "按技能等级提高灵力"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 3531606030
		jns[8] = 1383632532
	elseif jn == "判官令" then
		jns[1] = "攻击对方单人，减少对手的气血和魔法，效果由技能等级决定，不受双方灵力影响。对鬼魂类怪物使用时，伤害提高150%"
		jns[3] = 4
		jns[4] = "20点魔法"
		jns[5] = "拘魂诀技能达到20级"
		jns[6] = "wzife.wdf"
		jns[7] = 1671969153
		jns[8] = 3702239149
	elseif jn == "救死扶伤" then
		jns[1] = "使用后可以恢复多人的气血和气血上限"
		jns[3] = 5
		jns[4] = "150点魔法，非战斗时减半"
		jns[5] = "歧黄之术技能达到50级"
		jns[6] = "wzife.wdf"
		jns[7] = 2043895215
		jns[8] = 4157454265
	elseif jn == "舍身取义" then
		jns[1] = "将目标当前气血恢复到满"
		jns[3] = 5
		jns[4] = "150点魔法，每次使用降低自身5%物理防御，3%灵力"
		jns[5] = "人物飞升且“歧黄之术”技能达到120级"
		jns[6] = "wzife.wdf"
		jns[7] = 2043895215
		jns[8] = 4157454265
	elseif jn == "龙附术" then
		jns[1] = "无效果"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 3715378746
		jns[8] = 3758617445
	elseif jn == "神龙摆尾" then
		jns[1] = "持续一定回合的防御性法术，拥有该效果时施法者减少20%所承受的物理伤害。"
		jns[3] = 5
		jns[4] = "100点魔法"
		jns[5] = "人物飞升且“破浪诀”技能达到120级"
		jns[6] = "wzife.wdf"
		jns[7] = 1562612473
		jns[8] = 2539345287
	elseif jn == "健身术" then
		jns[1] = "由华佗所创的五禽戏发展而来，学习可以增加体力上限"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 3589295296
		jns[8] = 3157390677
	elseif jn == "变身" then
		jns[1] = "临时提高伤害力，是使用象形、鹰击、狮搏和连环击的前提"
		jns[3] = 66
		jns[4] = "20点魔法"
		jns[5] = "魔兽神功技能达到20级"
		jns[6] = "wzife.wdf"
		jns[7] = 4282403049
		jns[8] = 3667711762
	elseif jn == "莲花宝座" then
		jns[1] = "按技能等级提高躲避力"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 37911440
		jns[8] = 2202511971
	elseif jn == "天雷斩" then
		jns[1] = "使用后可以给予敌人重击，并降低灵力。但自己也会减少物理防御力。"
		jns[3] = 4
		jns[4] = "30点魔法"
		jns[5] = "傲世诀技能达到25级"
		jns[6] = "wzife.wdf"
		jns[7] = 315619009
		jns[8] = 958381035
	elseif jn == "驱魔" then
		jns[1] = "解除并避免方寸山封类法术的影响"
		jns[3] = 6
		jns[4] = "45点魔法"
		jns[5] = "周易学技能达到25级"
		jns[6] = "wzife.wdf"
		jns[7] = 1284415330
		jns[8] = 656352481
	elseif jn == "掌心雷" then
		jns[1] = "使用它后可以使对手不能使用主动法宝。效果可与其他封系效果叠加。成功几率等同封印成功率，受法术攻击修炼影响"
		jns[3] = 4
		jns[4] = "50点魔法"
		jns[5] = "乾坤塔技能达到50级"
		jns[6] = "wzife.wdf"
		jns[7] = 763772202
		jns[8] = 1576485465
	elseif jn == "五行错位" then
		jns[1] = "克制女儿村弟子的必杀技"
		jns[3] = 4
		jns[4] = "150点愤怒值"
		jns[5] = "五行扭转技能达到25级，人物等级达到20级"
		jns[6] = "wzife.wdf"
		jns[7] = 322760356
		jns[8] = 3739244200
	elseif jn == "失心符" then
		jns[1] = "令对手一定回合内无法使用法术，并降低灵力"
		jns[3] = 4
		jns[4] = "60点魔法"
		jns[5] = "符之术技能达到40级"
		jns[6] = "wzife.wdf"
		jns[7] = 1506622772
		jns[8] = 3407760722
	elseif jn == "斩龙诀" then
		jns[1] = "克制龙宫弟子的必杀技"
		jns[3] = 4
		jns[4] = "150点愤怒值"
		jns[5] = "紫薇之术技能达到25级，人物等级达到20级"
		jns[6] = "wzife.wdf"
		jns[7] = 40028053
		jns[8] = 1152390271
	elseif jn == "强力" then
		jns[1] = "增加(自身等级×0.4)的攻击，如果对方有防御或高级防御技能，伤害结果会减少20%"
		jns[3] = 7
		jns[6] = "wzife.wdf"
		jns[7] = 1458903425
		jns[8] = 707555275
	elseif jn == "如花解语" then
		jns[1] = "令对手一定回合无法使用物理攻击"
		jns[3] = 4
		jns[4] = "35点魔法"
		jns[5] = "闭月羞花技能达到20级"
		jns[6] = "wzife.wdf"
		jns[7] = 1912374008
		jns[8] = 1283470548
	elseif jn == "拈花妙指" then
		jns[1] = "打造后为鞋子提高一定的属性"
		jns[3] = 12
		jns[4] = "和技能等级数相同的活力"
		jns[5] = "佛光普照技能达到35级 "
		jns[6] = "wzife.wdf"
		jns[7] = 177955034
		jns[8] = 2841407500
	elseif jn == "复苏" then
		jns[1] = "解除并避免天宫封类法术的影响"
		jns[3] = 5
		jns[4] = "60点魔法"
		jns[5] = "盘丝大法技能达到20级"
		jns[6] = "wzife.wdf"
		jns[7] = 141266175
		jns[8] = 2870523056
	elseif jn == "凝神术" then
		jns[1] = "固定10回合内增加10%自身的封系命中与上限。不受修炼效果影响。"
		jns[3] = 2
		jns[4] = "50点魔法"
		jns[5] = "归元心法技能达到100级"
		jns[6] = "wzife.wd1"
		jns[7] = 3869803971
		jns[8] = 3077203266
	elseif jn == "含情脉脉" then
		jns[1] = "令对手一定回合内概率无法使用物理攻击和法术"
		jns[3] = 4
		jns[4] = "50点魔法"
		jns[5] = "魔兽神功技能达到20级"
		jns[6] = "wzife.wdf"
		jns[7] = 4111305818
		jns[8] = 2589491420
	elseif jn == "龙卷雨击" then
		jns[1] = "施展法术攻击对方，技能达到一定等级后可攻击多人"
		jns[3] = 4
		jns[4] = "20点魔法，攻击多人时消耗增加"
		jns[5] = "呼风唤雨技能达到15级"
		jns[6] = "wzife.wdf"
		jns[7] = 201672841
		jns[8] = 842454497
	elseif jn == "冥思" then
		jns[1] = "战斗中每回合自动恢复(自身等级四分之一)的魔法"
		jns[3] = 7
		jns[6] = "wzife.wdf"
		jns[7] = 622128415
		jns[8] = 3554832714
	elseif jn == "催眠符" then
		jns[1] = "令对手在受到伤害前无法行动"
		jns[3] = 4
		jns[4] = "45点魔法"
		jns[5] = "符之术技能达到10级"
		jns[6] = "wzife.wdf"
		jns[7] = 3523869082
		jns[8] = 104771547
	elseif jn == "高级雷属性吸收" then
		jns[1] = "30%的几率免受雷属性法术伤害，并按应受伤害的大小恢复气血，吸收失败也可减少法术伤害的30%"
		jns[3] = 7
		jns[6] = "wzife.wdf"
		jns[7] = 1654409054
		jns[8] = 119787649
	elseif jn == "雷属性吸收" then
		jns[1] = "30%的几率免受雷属性法术伤害，并按应受伤害的大小恢复气血，吸收失败也可减少法术伤害的30%"
		jns[3] = 7
		jns[6] = "wzife.wdf"
		jns[7] = 0xA71D860C
		jns[8] = 0xA71D860C
	elseif jn == "分身术" then
		jns[1] = "一定回合里躲避每回合的首次攻击"
		jns[3] = 5
		jns[4] = "80点魔法"
		jns[5] = "人物飞升且“神道无念”技能达到120级 "
		jns[6] = "wzife.wdf"
		jns[7] = 2099222596
		jns[8] = 1436233235
	elseif jn == "姊妹相随" then
		jns[1] = "无效果"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 3177731283
		jns[8] = 597142503
	elseif jn == "云霄步" then
		jns[1] = "按技能等级提高躲避力"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 276418186
		jns[8] = 3893284871
	elseif jn == "奔雷咒" then
		jns[1] = "雷属性的攻击法术，按召唤兽等级附加一定的法术伤害，攻击人数为(自身等级除以15+1)，最多为3人"
		jns[3] = 4
		jns[4] = "作用目标*30点魔法"
		jns[6] = "wzife.wdf"
		jns[7] = 2858620755
		jns[8] = 3666293224
	elseif jn == "玉质冰肌" then
		jns[1] = "按技能等级提高防御力"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 3438751351
		jns[8] = 2264853140
	elseif jn == "高级法术波动" then
		jns[1] = "使用法术攻击目标时伤害在原有伤害值基础上会有较大幅度的上下波动"
		jns[3] = 7
		jns[6] = "wzife.wdf"
		jns[7] = 2322584044
		jns[8] = 3668919080
	elseif jn == "地裂火" then
		jns[1] = "施展法术攻击多人，并附加固定伤害"
		jns[3] = 4
		jns[4] = "50点魔法"
		jns[5] = "五行学技能达到14级"
		jns[6] = "wzife.wdf"
		jns[7] = 4132171079
		jns[8] = 75104423
	elseif jn == "狂兽诀" then
		jns[1] = "无效果"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 1661790658
		jns[8] = 2338433754
	elseif jn == "我佛慈悲" then
		jns[1] = "战斗中使用，可以复活死亡的队友"
		jns[3] = 3
		jns[4] = "150点魔法"
		jns[5] = "大慈大悲技能达到40级"
		jns[6] = "wzife.wdf"
		jns[7] = 1545297145
		jns[8] = 266298194
	elseif jn == "破釜沉舟" then
		jns[1] = "同时攻击对方三个目标"
		jns[3] = 4
		jns[4] = "消耗上限气血的10%"
		jns[5] = "人物飞升且“十方无敌”技能达到120级"
		jns[6] = "wzife.wdf"
		jns[7] = 1580308746
		jns[8] = 619017033
	elseif jn == "金刚护法" then
		jns[1] = "战斗中临时提高自己或队友的伤害力，技能等级较高后可作用于多人"
		jns[3] = 3
		jns[4] = "40点魔法"
		jns[5] = "佛光普照技能达到30级"
		jns[6] = "wzife.wdf"
		jns[7] = 479962043
		jns[8] = 3700736796
	elseif jn == "莲步轻舞" then
		jns[1] = "令对手一定回合无法使用法术"
		jns[3] = 4
		jns[4] = "40点魔法"
		jns[5] = "闭月羞花技能达到30级"
		jns[6] = "wzife.wdf"
		jns[7] = 3508375370
		jns[8] = 4243867972
	elseif jn == "三星灭魔" then
		jns[1] = "克制魔王寨弟子的必杀技"
		jns[3] = 4
		jns[4] = "150点愤怒值"
		jns[5] = "黄庭经技能达到25级，人物等级达到20级"
		jns[6] = "wzife.wdf"
		jns[7] = 1209970630
		jns[8] = 84450076
	elseif jn == "十方无敌" then
		jns[1] = "按技能等级提高伤害力"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 1137925403
		jns[8] = 4107877611
	elseif jn == "解毒" then
		jns[1] = "使用后可以解除中毒的状态"
		jns[3] = 3
		jns[4] = "40点魔法"
		jns[5] = "歧黄之术技能达到15级"
		jns[6] = "wzife.wdf"
		jns[7] = 1966642136
		jns[8] = 546423120
	elseif jn == "摄魄" then
		jns[1] = "恢复自身魔法，减少对方一定的魔法"
		jns[3] = 4
		jns[4] = "35点魔法"
		jns[5] = "秋波暗送技能达到20级"
		jns[6] = "wzife.wdf"
		jns[7] = 3333121941
		jns[8] = 103370656
	elseif jn == "修仙术" then
		jns[1] = "无效果"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 3726980014
		jns[8] = 1673560698
	elseif jn == "幽冥鬼眼" then
		jns[1] = "使用后可以看到隐身的目标并增加10%的抗封效果。"
		jns[3] = 5
		jns[4] = "20点魔法"
		jns[5] = "九幽阴魂技能达到30级"
		jns[6] = "wzife.wdf"
		jns[7] = 1975607386
		jns[8] = 2807639015
	elseif jn == "高级再生" then
		jns[1] = "战斗中每回合自动恢复气血，恢复数值与自身等级相同"
		jns[3] = 7
		jns[6] = "wzife.wdf"
		jns[7] = 468221024
		jns[8] = 3809634425
	elseif jn == "振翅千里" then
		jns[1] = "平时状态下使用，可以瞬间回到自己的门派"
		jns[3] = 0
		jns[4] = "10点气血和10点魔法"
		jns[5] = "大鹏展翅技能达到1级 "
		jns[6] = "wzife.wdf"
		jns[7] = 3512079122
		jns[8] = 4160807473
	elseif jn == "逆鳞" then
		jns[1] = "战斗中增加自己的伤害力"
		jns[3] = 5
		jns[4] = "40点魔法"
		jns[5] = "逆鳞技能达到30级"
		jns[6] = "wzife.wdf"
		jns[7] = 1493556934
		jns[8] = 3804853170
	elseif jn == "浩然正气" then
		jns[1] = "打造后为衣服提高一定的属性"
		jns[3] = 12
		jns[4] = "和技能等级数相同的活力"
		jns[5] = "天罡气技能达到35级"
		jns[6] = "wzife.wdf"
		jns[7] = 3449922467
		jns[8] = 567769462
	elseif jn == "天诛地灭" then
		jns[1] = "克制地府弟子的必杀技"
		jns[3] = 4
		jns[4] = "150点愤怒值"
		jns[5] = "天罡气技能达到25级，人物等级达到20级"
		jns[6] = "wzife.wdf"
		jns[7] = 4053425914
		jns[8] = 3701201548
	elseif jn == "火云术" then
		jns[1] = "无效果"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 4166858964
		jns[8] = 909252202
	elseif jn == "永恒" then
		jns[1] = "受到的辅助类法术效果持续回合加倍，如恢复气血、提升速度等"
		jns[3] = 7
		jns[6] = "wzife.wdf"
		jns[7] = 1988160424
		jns[8] = 1508625069
	elseif jn == "雨落寒沙" then
		jns[1] = "消耗一定魔法对目标造成暗器伤害，技能每增加一级伤害效果增加1点，最多增加100点伤害"
		jns[3] = 4
		jns[4] = "作用人数*20点魔法"
		jns[5] = "沉鱼落雁技能达到20级"
		jns[6] = "wzife.wd1"
		jns[7] = 2465624576
		jns[8] = 562574867
	elseif jn == "高级吸血" then
		jns[1] = "物理攻击时，吸取对方所掉气血的30%，攻击鬼魂类怪物时无效"
		jns[3] = 7
		jns[6] = "wzife.wdf"
		jns[7] = 1364867245
		jns[8] = 2545117654
	elseif jn == "碎甲符" then
		jns[1] = "降低对方多人物理防御力及灵力"
		jns[3] = 4
		jns[4] = "50点魔法*目标数"
		jns[5] = "人物飞升且“符之术”技能达到120级"
		jns[6] = "wzife.wdf"
		jns[7] = 417555669
		jns[8] = 3175526110
	elseif jn == "安神诀" then
		jns[1] = "一定回合内临时提升自身灵力"
		jns[3] = 5
		jns[4] = "30点魔法"
		jns[5] = "人物飞升且“文韬武略”技能达到120级 "
		jns[6] = "wzife.wdf"
		jns[7] = 3150617611
		jns[8] = 2204689180
	elseif jn == "无双一击" then
		jns[1] = "按技能等级提高命中"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 2203124248
		jns[8] = 2998720398
	elseif jn == "巧匠之术" then
		jns[1] = "关于家具制作的技能，懂得一定的巧匠之术后，可以去找住在长寿村的工匠鲁成，制作各种家具的“设计图”"
		jns[3] = 4
		jns[6] = "wzife.wdf"
		jns[7] = 1296624794
		jns[8] = 1296624794
	elseif jn == "兵器谱" then
		jns[1] = "能够鉴定武器和铠甲，学习后也可在长安书店制作相应等级的“神兵图鉴”"
		jns[3] = 12
		jns[4] = "一定的活力，视装备等级而定"
		jns[5] = "神兵鉴赏技能等级达到5级"
		jns[6] = "wzife.wdf"
		jns[7] = 1814276494
		jns[8] = 4262913816
	elseif jn == "清明自在" then
		jns[1] = "按技能等级提高气血上限"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 3231066014
		jns[8] = 3842629365
	elseif jn == "水漫金山" then
		jns[1] = "水属性的攻击法术，按召唤兽等级附加一定的法术伤害，攻击人数为(自身等级除以15+1)，最多为3人"
		jns[3] = 4
		jns[4] = "作用目标*30点魔法"
		jns[6] = "wzife.wdf"
		jns[7] = 2637597442
		jns[8] = 3867686033
	elseif jn == "追捕技巧" then
		jns[1] = "可以降低对手逃跑的成功率，但最低不小于10%"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 123566127
		jns[8] = 902425300
	elseif jn == "逃离技巧" then
		jns[1] = "学习后可以提高战斗逃跑的成功率，但最高不超过90%"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 1198324882
		jns[8] = 1820394508
	elseif jn == "烹饪技巧" then
		jns[1] = "传自商代名厨伊尹的技能，可以提高制作食物的能力"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 2019196942
		jns[8] = 3782401606
	elseif jn == "中药医理" then
		jns[1] = "精通歧黄之术往往可以提高炼制丹药的能力"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 3878607199
		jns[8] = 642378453
	elseif jn == "沉鱼落雁" then
		jns[1] = "无效果"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 370722733
		jns[8] = 1052773261
	elseif jn == "紫薇之术" then
		jns[1] = "按技能等级提高灵力"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 3941011754
		jns[8] = 1942519774
	elseif jn == "炼金术" then
		jns[1] = "秘术士私传的炼金之术，可以提高制作饰品、靴子和腰带的能力"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 1324974820
		jns[8] = 333902768

	elseif jn == "攻击修炼" then
		jns[1] = "可以提升角色攻击效果。修炼等级越高效果明显！\n研究成功后需要消耗1E两银子方可提升等级上限"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 1324974820
		jns[8] = 333902768
	elseif jn == "防御修炼" then
		jns[1] = "可以提升角色防御效果。修炼等级越高效果明显！\n研究成功后需要消耗1E两银子方可提升等级上限"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 1324974820
		jns[8] = 333902768
	elseif jn == "法术修炼" then
		jns[1] = "可以提升角色法术攻击效果。修炼等级越高效果明显！\n研究成功后需要消耗1E两银子方可提升等级上限"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 1324974820
		jns[8] = 333902768
	elseif jn == "法抗修炼" then
		jns[1] = "可以提升角色法术防御效果。修炼等级越高效果明显！\n研究成功后需要消耗1E两银子方可提升等级上限"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 1324974820
		jns[8] = 333902768



	elseif jn == "满天花雨" then
		jns[1] = "使用后增加自己的攻击力，并可能使对手中毒，效果最高累加三回合，持续到战斗结束"
		jns[3] = 4
		jns[4] = "40点魔法"
		jns[5] = "沉鱼落雁技能达到25级"
		jns[6] = "wzife.wdf"
		jns[7] = 2270504354
		jns[8] = 1714354841
	elseif jn == "符之术" then
		jns[1] = "无效果"
		jns[3] = 1
		jns[6] = "wzife.wdf"
		jns[7] = 3599571341
		jns[8] = 921854792
	elseif jn == "舍身取义" then
		jns[1] = "将目标当前气血恢复到满"
		jns[3] = 3
		jns[4] = "150点魔法，且每次使用时会降低自身5%物理防御及3%灵力"
		jns[5] = "人物飞升且“歧黄之术”技能达到120级 "
		jns[6] = "wzife.wdf"
		jns[7] = 1135928864
		jns[8] = 1707332905
	elseif jn == "剑荡四方" then
		jns[1] = "使用时可攻击多人。指定的目标受到一定伤害，并造成其他任意两个目标少量伤害。"
		jns[3] = 4
		jns[4] = "当前气血的百分之十"
		jns[6] = "wzife.wd1"
		jns[7] = 1668746823
		jns[8] = 1668746823
	elseif jn == "金刚镯" then
		jns[1] = "一定回合内降对方的武器伤害"
		jns[3] = 4
		jns[4] = "50点魔法"
		jns[5] = "人物飞升且“混天术”技能达到120级"
		jns[6] = "wzife.wdf"
		jns[7] = 4185507078
		jns[8] = 1737815847
	elseif jn == "裁缝技巧" then
		jns[1] = "从天衣无缝针法演化而来，可提高缝制头盔和铠甲的能力"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 1071853506
		jns[8] = 1758794729
	elseif jn == "落岩" then
		jns[1] = "土属性的攻击法术，按召唤兽等级附加一定的法术伤害"
		jns[3] = 4
		jns[4] = "30点魔法"
		jns[6] = "wzife.wdf"
		jns[7] = 4226735508
		jns[8] = 300977089
	elseif jn == "生命之泉" then
		jns[1] = "一定回合内补充自己和队友的气血"
		jns[3] = 3
		jns[4] = "作用人数*30点魔法"
		jns[5] = "修仙术技能达到30级"
		jns[6] = "wzife.wdf"
		jns[7] = 1093047199
		jns[8] = 2757069702
	elseif jn == "韦陀护法" then
		jns[1] = "战斗中临时提高自己或队友的攻击力，技能达到一定等级后可用于多人"
		jns[3] = 3
		jns[4] = "35点魔法"
		jns[5] = "佛光普照技能等级达到20级以上"
		jns[6] = "wzife.wdf"
		jns[7] = 2121060262
		jns[8] = 2888289425
	elseif jn == "暗器技巧" then
		jns[1] = "暗器名家的家传秘笈，学习后可以增加使用暗器的伤害力"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 2101102727
		jns[8] = 1473796032
	elseif jn == "冥想" then
		jns[1] = "通过冥想凝聚强大的精神力量，学习可以提高魔法上限"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 97139368
		jns[8] = 903007607
	elseif jn == "弱点土" then
		jns[1] = "弱点为土，受到土属性法术攻击时伤害增加50%"
		jns[3] = 7
		jns[6] = "wzife.wdf"
		jns[7] = 2234852568
		jns[8] = 910396241
	elseif jn == "冤魂不散" then
		jns[1] = "克制大唐官府弟子的必杀技。"
		jns[3] = 4
		jns[4] = "150点愤怒值"
		jns[5] = "九幽阴魂技能达到25级"
		jns[6] = "wzife.wdf"
		jns[7] = 3587078621
		jns[8] = 376661686

	elseif jn == "命中强化" then
		jns[1] = "每等级提升5点命中。"
		jns[3] = 8
		jns[6] = "xzsc.wdf"
		jns[7] = 0x3FC666BA
		jns[8] = 0x3FC666BA
	elseif jn == "伤害强化" then
		jns[1] = "每等级提升3点伤害。"
		jns[3] = 8
		jns[6] = "xzsc.wdf"
		jns[7] = 0x2D685412
		jns[8] = 0x2D685412

	elseif jn == "灵力强化" then
		jns[1] = "每等级提升2点灵力。"
		jns[3] = 8
		jns[6] = "xzsc.wdf"
		jns[7] = 0x83A054A5
		jns[8] = 0x83A054A5
	elseif jn == "速度强化" then
		jns[1] = "每等级提升1.5点速度。"
		jns[3] = 8
		jns[6] = "xzsc.wdf"
		jns[7] = 0xD1EBF7E3
		jns[8] = 0xD1EBF7E3
	elseif jn == "防御强化" then
		jns[1] = "每等级提升2点防御。"
		jns[3] = 8
		jns[6] = "xzsc.wdf"
		jns[7] = 0x624C7E94
		jns[8] = 0x624C7E94
   elseif jn == "固伤强化" then
		jns[1] =  "每等级提升5点固定伤害。"
		jns[3] = 8
		jns[6] = "xzsc.wdf"
		jns[7] = 0xD3236E57
		jns[8] = 0xD3236E57
	elseif jn == "驯兽生命" then
		jns[1] = "每等级召唤兽15点生命。"
		jns[3] = 8
		jns[6] = "xzsc.wdf"
		jns[7] = 0x077F08D1
		jns[8] = 0x077F08D1
	elseif jn == "驯兽防御" then
		jns[1] = "每等级召唤兽4点防御。"
		jns[3] = 8
		jns[6] = "xzsc.wdf"
		jns[7] = 0xF0F2E8F1
		jns[8] = 0xF0F2E8F1
	elseif jn == "驯兽灵力" then
		jns[1] = "每等级召唤兽4点灵力。"
		jns[3] = 8
		jns[6] = "xzsc.wdf"
		jns[7] = 0x6A4612D6
		jns[8] = 0x6A4612D6
	elseif jn == "驯兽伤害" then
		jns[1] = "每等级召唤兽6点伤害。"
		jns[3] = 8
		jns[6] = "xzsc.wdf"
		jns[7] = 0xF6254282
		jns[8] = 0xF6254282
	elseif jn == "驯兽速度" then
		jns[1] = "每等级召唤兽3点速。"
		jns[3] = 8
		jns[6] = "xzsc.wdf"
		jns[7] = 0xA68507C9
		jns[8] = 0xA68507C9



	elseif jn == "强身术" then
		jns[1] = "强身健体是习武之人的根本，学习后可以提高气血上限"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 3597995533
		jns[8] = 732966867
	elseif jn == "强壮" then
		jns[1] = "强身健体是习武之人的根本，学习后可以提高4点人物基础气血上限"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 2458245611
		jns[8] = 1870892091
	elseif jn == "敏捷" then
		jns[1] = "提高自身速度的10%"
		jns[3] = 7
		jns[6] = "wzife.wdf"
		jns[7] = 3132756451
		jns[8] = 4289478506
	elseif jn == "盘丝舞" then
		jns[1] = "打造后为武器提高一定的属性"
		jns[3] = 12
		jns[4] = "和技能等级数相同的活力"
		jns[5] = "蛛丝阵法技能达到35级，人物等级达到30级"
		jns[6] = "wzife.wdf"
		jns[7] = 2082714040
		jns[8] = 382164728
	elseif jn == "火属性吸收" then
		jns[1] = "30%的几率免受火属性法术伤害，并按应受伤害的大小恢复气血，但受到火属性法术攻击时伤害会增加30%"
		jns[3] = 7
		jns[6] = "wzife.wdf"
		jns[7] = 4098020456
		jns[8] = 4092454521
	elseif jn == "落魄符" then
		jns[1] = "令对手一定回合内无法使用法术，并出现攻击偏差"
		jns[3] = 4
		jns[4] = "40点魔法"
		jns[5] = "符之术技能达到15级"
		jns[6] = "wzife.wdf"
		jns[7] = 1553239295
		jns[8] = 2036240644
	elseif jn == "驱鬼" or jn == "驱怪"  then
		jns[1] = "法术攻击时该被动技能无效，对怪物(不包含NPC和鬼魂类怪物)造成伤害增加10%"
		jns[3] = 7
		jns[6] = "wzife.wdf"
		jns[7] = 3713855072
		jns[8] = 3945460783
	elseif jn == "高级驱鬼" then
		jns[1] = "对鬼魂类怪物的物理、法术伤害效果加倍，如果将鬼魂类怪物打死，对方将飞出场外而不能复活"
		jns[3] = 7
		jns[6] = "wzife.wdf"
		jns[7] = 72429538
		jns[8] = 72429538
	elseif jn == "泰山压顶" then
		jns[1] = "土属性的攻击法术，按召唤兽等级附加一定的法术伤害，攻击人数为(自身等级除以15+1)，最多为3人"
		jns[3] = 4
		jns[4] = "作用目标*30点魔法"
		jns[6] = "wzife.wdf"
		jns[7] = 463605150
		jns[8] = 463605150
	elseif jn == "观音咒" then
		jns[1] = "无效果"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 1410587972
		jns[8] = 1911562650
	elseif jn == "牛虱阵" then
		jns[1] = "无效果"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 1129585606
		jns[8] = 2492840335
	elseif jn == "杀气诀" then
		jns[1] = "战斗中临时提高自己或队友的命中"
		jns[3] = 3
		jns[4] = "40点魔法"
		jns[5] = "为官之道技能达到15级"
		jns[6] = "wzife.wdf"
		jns[7] = 1673396685
		jns[8] = 1326507976
	elseif jn == "高级毒" then
		jns[1] = "自身对毒免疫，物理攻击时有20%的几率使敌人中毒，中毒后每回合减少10%的气血和5%的魔法"
		jns[3] = 7
		jns[6] = "wzife.wdf"
		jns[7] = 589320553
		jns[8] = 1086230366
	elseif jn == "高级反击" then
		jns[1] = "受到物理攻击时有30%几率自动反击，反击的伤害与正常攻击相同"
		jns[3] = 7
		jns[6] = "wzife.wdf"
		jns[7] = 3922527672
		jns[8] = 3922527672
	elseif jn == "解封" then
		jns[1] = "单次解除女儿村封类法术的影响"
		jns[3] = 3
		jns[4] = "60点魔法"
		jns[5] = "九龙诀技能达到30级"
		jns[6] = "wzife.wdf"
		jns[7] = 2555181368
		jns[8] = 1807191850
	elseif jn == "高级神迹" then
		jns[1] = "不受除日月乾坤外的所有异常状态影响"
		jns[3] = 7
		jns[6] = "wzife.wdf"
		jns[7] = 705701591
		jns[8] = 4235295997
	elseif jn == "火甲术" then
		jns[1] = "此状态维持期间遭受普通物理攻击、法术时将自动使用三味真火进行反击。"
		jns[3] = 8
		jns[4] = "60点魔法"
		jns[5] = "人物飞升且“火云术”技能达到120级 "
		jns[6] = "wzife.wdf"
		jns[7] = 2418820008
		jns[8] = 3223806685
	elseif jn == "地狱烈火" then
		jns[1] = "火属性的攻击法术，按召唤兽等级附加一定的法术伤害，攻击人数为(自身等级除以15+1)，最多为3人"
		jns[3] = 4
		jns[4] = "作用目标*30点魔法"
		jns[6] = "wzife.wdf"
		jns[7] = 4223394612
		jns[8] = 3042874244
	elseif jn == "高级飞行" then
		jns[1] = "	躲避能力增加30%、躲避率增加10%，物理攻击命中几率增加20%"
		jns[3] = 7
		jns[6] = "wzife.wdf"
		jns[7] = 4277341965
		jns[8] = 3853120636
	elseif jn == "龙啸九天" then
		jns[1] = "克制盘丝洞弟子的必杀技"
		jns[3] = 4
		jns[4] = "150点愤怒值"
		jns[5] = "龙附技能达到25级，人物等级达到20级"
		jns[6] = "wzife.wdf"
		jns[7] = 3644673853
		jns[8] = 2124753589
	elseif jn == "高级强力" then
		jns[1] = "增加(自身等级×0.715)的攻击，如果对方有防御或高级防御技能，伤害结果会减少20%"
		jns[3] = 7
		jns[6] = "wzife.wdf"
		jns[7] = 3563500497
		jns[8] = 2177485118
	elseif jn == "乙木仙遁" then
		jns[1] = "平时状态下使用，可以瞬间回到自己的门派"
		jns[3] = 0
		jns[4] = "10点气血和10点魔法"
		jns[5] = "斜月步技能达到1级"
		jns[6] = "wzife.wdf"
		jns[7] = 71432172
		jns[8] = 436091648
	elseif jn == "魔兽啸天" then
		jns[1] = "克制天宫弟子的必杀技"
		jns[3] = 4
		jns[4] = "150点愤怒值"
		jns[5] = "魔兽神功技能达到25级，人物等级达到20级"
		jns[6] = "wzife.wdf"
		jns[7] = 950759216
		jns[8] = 1124928283
	elseif jn == "夺命蛛丝" then
		jns[1] = "克制方寸山弟子的必杀技"
		jns[3] = 4
		jns[4] = "150点愤怒值"
		jns[5] = "蛛丝阵法技能达到25级，人物等级达到20级"
		jns[6] = "wzife.wdf"
		jns[7] = 227632678
		jns[8] = 3268216546
	elseif jn == "腾云驾雾" then
		jns[1] = "平时状态下使用，可以瞬间回到自己的门派"
		jns[3] = 0
		jns[4] = "10点气血和10点魔法"
		jns[5] = "云霄步技能达到1级"
		jns[6] = "wzife.wdf"
		jns[7] = 1924869232
		jns[8] = 906709372
	elseif jn == "弱点水" then
		jns[1] = "弱点为水，受到水属性法术攻击时伤害增加50%"
		jns[3] = 7
		jns[6] = "wzife.wdf"
		jns[7] = 803997825
		jns[8] = 1114088245
	elseif jn == "慧根" then
		jns[1] = "使用法术时所消耗的魔法降低为正常的75%"
		jns[3] = 7
		jns[6] = "wzife.wdf"
		jns[7] = 1457451798
		jns[8] = 3365576412
	elseif jn == "摇头摆尾" then
		jns[1] = "攻击目标时随机触发三昧真火或者飞砂走石，随后施放一个持续燃烧的火焰，一定回合内造成伤害"
		jns[3] = 4
		jns[4] = "50点魔法"
		jns[5] = "人物飞升且“牛虱阵”技能达到120级 "
		jns[6] = "wzife.wdf"
		jns[7] = 3051115375
		jns[8] = 1777991632
	elseif jn == "高级鬼魂术" then
		jns[1] = "死亡5回合后自动复活，不受异常状态影响"
		jns[3] = 7
		jns[6] = "wzife.wdf"
		jns[7] = 2436724533
		jns[8] = 3547941491
	elseif jn == "高级驱鬼" then
		jns[1] = "对鬼魂类怪物的物理、法术伤害效果加倍，如果将鬼魂类怪物打死，对方将飞出场外而不能复活"
		jns[3] = 7
		jns[6] = "wzife.wdf"
		jns[7] = 72429538
		jns[8] = 72429538
	elseif jn == "幻镜术" then
		jns[1] = "有一定的概率反弹法术攻击"
		jns[3] = 6
		jns[4] = "50点魔法"
		jns[5] = "人物飞升且“移形换影”技能达到120级"
		jns[6] = "wzife.wdf"
		jns[7] = 1134668132
		jns[8] = 605963427
	elseif jn == "高级幸运" then
		jns[1] = "不会受到必杀攻击，并有5%几率躲避敌人的法术攻击"
		jns[3] = 7
		jns[6] = "wzife.wdf"
		jns[7] = 1781077356
		jns[8] = 481753720
	elseif jn == "高级法术暴击" then
		jns[1] = "使用法术攻击目标时会有较大几率使法术伤害值加倍"
		jns[3] = 7
		jns[6] = "wzife.wdf"
		jns[7] = 2071863113
		jns[8] = 1628140681
	elseif jn == "瘴气" then
		jns[1] = "临时降低对手接受治疗的效果"
		jns[3] = 4
		jns[4] = "30点魔法×作用人数"
		jns[5] = "人物飞升且“迷情大法”技能达到120级"
		jns[6] = "wzife.wdf"
		jns[7] = 3039047760
		jns[8] = 3862934535
	elseif jn == "高级魔之心" then
		jns[1] = "对敌人的法术伤害效果提高20%"
		jns[3] = 7
		jns[6] = "wzife.wdf"
		jns[7] = 2586072698
		jns[8] = 2875710379
	elseif jn == "迟钝" then
		jns[1] = "天生行动缓慢，速度效果会降低20%"
		jns[3] = 7
		jns[6] = "wzife.wdf"
		jns[7] = 2619272788
		jns[8] = 274661895
    elseif jn == "高级迟钝" then
		jns[1] = "天生行动缓慢，速度效果会降低20%"
		jns[3] = 7
		jns[6] = "wzife.wdf"
		jns[7] = 2619272788
		jns[8] = 274661895
	elseif jn == "高级夜战" then
		jns[1] = "具备夜战能力，不受夜间攻防能力下降的影响，夜间躲避能力提高20%。"
		jns[3] = 7
		jns[6] = "wzife.wdf"
		jns[7] = 1048702203
		jns[8] = 1048702203
	elseif jn == "七星遁" then
		jns[1] = "按技能等级提高躲避力"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 923985229
		jns[8] = 2400021580
	elseif jn == "高级敏捷" then
		jns[1] = "提升自身速度的20%"
		jns[3] = 7
		jns[6] = "wzife.wdf"
		jns[7] = 1248152147
		jns[8] = 2061355872
	elseif jn == "楚楚可怜" then
		jns[1] = "停止行动并保护自己免受伤害"
		jns[3] = 5
		jns[4] = "30点魔法"
		jns[5] = "倾国倾城技能达到10级"
		jns[6] = "wzife.wdf"
		jns[7] = 3842255938
		jns[8] = 952615752
	elseif jn == "精神集中" then
		jns[1] = "精神集中，可以抵御封类异常状态，但自己的物理攻击效果也会降低20%"
		jns[3] = 7
		jns[6] = "wzife.wdf"
		jns[7] = 4141937856
		jns[8] = 2799682055
	elseif jn == "清心" then
		jns[1] = "使用后可以解除中毒的状态"
		jns[3] = 3
		jns[4] = "30点魔法"
		jns[5] = "九龙诀技能达到15级"
		jns[6] = "wzife.wdf"
		jns[7] = 22613468
		jns[8] = 3563353856
	elseif jn == "防御" then
		jns[1] = "增加(自身等级×0.6)的防御，但法术伤害能力会降低10%"
		jns[3] = 7
		jns[6] = "wzife.wdf"
		jns[7] = 91393867
		jns[8] = 4101692183
	elseif jn == "感知" then
		jns[1] = "可以破解地府的修罗隐身、女儿村的楚楚可怜法术效果"
		jns[3] = 7
		jns[6] = "wzife.wdf"
		jns[7] = 3677043818
		jns[8] = 4012137980
	elseif jn == "龙魂" then
		jns[1] = "每成功使用三次法术都可以临时增加自身法术伤害,持续2回合。"
		jns[3] = 7
		jns[6] = "wzife.wdf"
		jns[7] = 0x00FFEF02
		jns[8] = 0x00FFEF01
	elseif jn == "魔兽反噬" then
		jns[1] = "按技能等级提高防御"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 512391647
		jns[8] = 1359532967
	elseif jn == "招架" then
		jns[1] = "15%的几率完全躲过敌人的物理攻击"
		jns[3] = 7
		jns[6] = "wzife.wdf"
		jns[7] = 2387844026
		jns[8] = 3512730332
	elseif jn == "弱点雷" then
		jns[1] = "弱点为雷，受到雷属性法术攻击时伤害增加50%"
		jns[3] = 7
		jns[6] = "wzife.wdf"
		jns[7] = 2886112942
		jns[8] = 2605672758
	elseif jn == "弱点火" then
		jns[1] = "弱点为火，受到火属性法术攻击时伤害增加50%"
		jns[3] = 7
		jns[6] = "wzife.wdf"
		jns[7] = 1546100078
		jns[8] = 4005696838
	elseif jn == "逆鳞术" then
		jns[1] = "按技能等级提高防御力"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 3104091414
		jns[8] = 3406230011
	elseif jn == "靛沧海" then
		jns[1] = "施展法术攻击多人，并附加固定伤害"
		jns[3] = 4
		jns[4] = "50点魔法"
		jns[5] = "五行学技能达到11级"
		jns[6] = "wzife.wdf"
		jns[7] = 2679663466
		jns[8] = 1783445565
	elseif jn == "苍鸾怒击" then
		jns[1] = "普通物理攻击发生必杀或连击时，临时提升10%伤害力随机攻击另一个目标，每回合最多触发一次。"
		jns[3] = 7
		jns[6] = "wzife.wd4"
		jns[7] = 3329378845
		jns[8] = 3329378845
  	elseif jn == "夜战" then
		jns[1] = "具备夜战能力，不受夜间攻防能力下降的影响。"
		jns[3] = 7
		jns[6] = "wzife.wdf"
		jns[7] = 0xDD5CEE60
		jns[8] = 0xDD5CEE60
   	elseif jn == "高级夜战" then
		jns[1] = "具备夜战能力，不受夜间攻防能力下降的影响，夜间躲避能力提高20%。"
		jns[3] = 7
		jns[6] = "wzife.wdf"
		jns[7] = 0xDD5CEE60
		jns[8] = 0xDD5CEE60

	elseif jn == "天蚕丝" then
		jns[1] = "平时状态下使用，可以瞬间回到自己的门派"
		jns[3] = 0
		jns[4] = "10点气血和10点魔法"
		jns[5] = "移形换影技能达到1级 "
		jns[6] = "wzife.wdf"
		jns[7] = 1283246148
		jns[8] = 1806917376
	elseif jn == "乾坤袖" then
		jns[1] = "无效果"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 2256743052
		jns[8] = 3443276818
	elseif jn == "烈火" then
		jns[1] = "火属性的攻击法术，按召唤兽等级附加一定的法术伤害"
		jns[3] = 4
		jns[4] = "30点魔法"
		jns[6] = "wzife.wdf"
		jns[7] = 2966154175
		jns[8] = 1668132272
	elseif jn == "踏山裂石" then
		jns[1] = "克制化生寺弟子的必杀技"
		jns[3] = 4
		jns[4] = "50点魔法"
		jns[5] = "火牛阵技能达到120级，且人物飞升"
		jns[6] = "wzife.wdf"
		jns[7] = 4060498152
		jns[8] = 2813097952
	elseif jn == "破浪诀" then
		jns[1] = "按技能等级提高伤害力"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 4132491653
		jns[8] = 3313121721
	elseif jn == "高级土属性吸收" then
		jns[1] = "30%的几率免受土属性法术伤害，并按应受伤害的大小恢复气血，吸收失败也可减少法术伤害的30%"
		jns[3] = 7
		jns[6] = "wzife.wdf"
		jns[7] = 2639364118
		jns[8] = 751839372
	elseif jn == "二龙戏珠" then
		jns[1] = "施展法术攻击对方两个目标"
		jns[3] = 4
		jns[4] = "70点魔法"
		jns[5] = "人物飞升且“九龙诀”技能达到120级"
		jns[6] = "wzife.wdf"
		jns[7] = 1266218218
		jns[8] = 630766288
	elseif jn == "太极生化" then
		jns[1] = "克制狮驼岭弟子的必杀技"
		jns[3] = 4
		jns[4] = "150点愤怒值"
		jns[5] = "修仙术技能达到25级，人物等级达到20级"
		jns[6] = "wzife.wdf"
		jns[7] = 1665649019
		jns[8] = 1661704448
	elseif jn == "五雷咒" then
		jns[1] = "施展法术攻击对方单人"
		jns[3] = 4
		jns[4] = "30点魔法"
		jns[5] = "霹雳咒技能达到1级"
		jns[6] = "wzife.wdf"
		jns[7] = 3103307429
		jns[8] = 1116134864
	elseif jn == "高级感知" then
		jns[1] = "破解地府的修罗隐身、女儿村的楚楚可怜法术效果，躲避能力提高10%"
		jns[3] = 7
		jns[6] = "wzife.wdf"
		jns[7] = 675296013
		jns[8] = 1822711583
	elseif jn == "高级水属性吸收" then
		jns[1] = "30%的几率免受水属性法术伤害，并按应受伤害的大小恢复气血，吸收失败也可减少法术伤害的30%"
		jns[3] = 7
		jns[6] = "wzife.wdf"
		jns[7] = 2532360260
		jns[8] = 1312179231
	elseif jn == "须弥真言" then
		jns[1] = "增加魔力值*0.4的法术伤害力"
		jns[3] = 7
		jns[6] = "wzife.wd5"
		jns[7] = 16
		jns[8] = 16
	elseif jn == "土属性吸收" then
		jns[1] = "30%的几率免受土属性法术伤害，并按应受伤害的大小恢复气血，但受到雷属性法术攻击时伤害会增加30%"
		jns[3] = 7
		jns[6] = "wzife.wdf"
		jns[7] = 134325226
		jns[8] = 3503123353
	elseif jn == "拘魂诀" then
		jns[1] = "无效果"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 1622524729
		jns[8] = 3403104810
	elseif jn == "高级必杀" then
		jns[1] = "物理攻击时的必杀几率增加20%，出现必杀时伤害结果会加倍"
		jns[3] = 7
		jns[6] = "wzife.wdf"
		jns[7] = 1672890477
		jns[8] = 1282412196
	elseif jn == "从天而降" then
		jns[1] = "超级神鸡专属技能，大大提高攻击时造成的伤害，但攻击时有一定几率腾空失败。"
		jns[3] = 7
		jns[6] = "wzife.wd5"
		jns[7] = 0x01000042
		jns[8] = 0x01000042
	elseif jn == "大快朵颐" then
		jns[1] = "超级神猴专属技能，出手前有一定几率触发，大大提升几率性技能（连击、必杀）的触发几率。"
		jns[3] = 7
		jns[6] = "wzife.wd5"
		jns[7] = 0x01000043
		jns[8] = 0x01000043
	elseif jn == "千钧一怒" then
		jns[1] = "超级神羊专属技能，普通物理攻击造成的伤害≧目标气血伤害*10%时，使自己的主人获得10点愤怒。"
		jns[3] = 7
		jns[6] = "wzife.wd5"
		jns[7] = 0x01000044
		jns[8] = 0x01000044
	elseif jn == "浮云神马" then
		jns[1] = "超级神马专属技能，在场时，提高自己及主人10%的速度，最多持续5回合。"
		jns[3] = 7
		jns[6] = "wzife.wd5"
		jns[7] = 0x01000045
		jns[8] = 0x01000045
	elseif jn == "再生" then
		jns[1] = "战斗中每回合自动恢复(自身等级一半)的气血"
		jns[3] = 7
		jns[6] = "wzife.wdf"
		jns[7] = 3287776911
		jns[8] = 2264480315
	elseif jn == "连击" then
		jns[1] = "45%的几率连续两次物理攻击，如果对方有反震技能，只能攻击一次"
		jns[3] = 7
		jns[6] = "wzife.wdf"
		jns[7] = 1161065019
		jns[8] = 834880568
	elseif jn == "毒" then
		jns[1] = "物理攻击时有15%的几率使敌人中毒，中毒后每回合减少10%的气血和5%的魔法"
		jns[3] = 7
		jns[6] = "wzife.wdf"
		jns[7] = 142259178
		jns[8] = 3804526840
	elseif jn == "杳无音讯" then
		jns[1] = "平时状态下使用，可以瞬间回到自己的门派。"
		jns[3] = 0
		jns[4] = "10点气血和10点魔法"
		jns[5] = "无常步技能达到1级"
		jns[6] = "wzife.wdf"
		jns[7] = 2049632078
		jns[8] = 739072521
	elseif jn == "鬼魂术" then
		jns[1] = "死亡5回合后自动复活，不受异常状态影响，但也不能使用药品和食物恢复气血（可以食用包子）"
		jns[3] = 7
		jns[6] = "wzife.wdf"
		jns[7] = 813494718
		jns[8] = 4276424619
	elseif jn == "法术波动" then
		jns[1] = "使用法术攻击目标时伤害在原有伤害值基础上会有大幅度的波动"
		jns[3] = 7
		jns[6] = "wzife.wdf"
		jns[7] = 762242741
		jns[8] = 267613400
	elseif jn == "坐莲" then
		jns[1] = "平时状态下使用，可以瞬间回到自己的门派"
		jns[3] = 0
		jns[4] = "10点气血和10魔法"
		jns[5] = "莲花宝座技能达到1级"
		jns[6] = "wzife.wdf"
		jns[7] = 2462764859
		jns[8] = 3850121742
	elseif jn == "后发制人" then
		jns[1] = "休息一回合后临时提高伤害力、命中和速度，自动攻击目标"
		jns[3] = 4
		jns[4] = "最大气血的5%"
		jns[5] = "无双一击技能达到25级"
		jns[6] = "wzife.wdf"
		jns[7] = 3809037555
		jns[8] = 1112380505
	elseif jn == "阎罗令" then
		jns[1] = "可攻击多人，减少对手的气血和气血上限，对鬼魂类怪物使用时，伤害效果额外提高100%"
		jns[3] = 4
		jns[4] = "20点魔法，作用于多人时消耗增加"
		jns[5] = "幽冥术技能达到25级"
		jns[6] = "wzife.wdf"
		jns[7] = 2806354228
		jns[8] = 3446923388
	elseif jn == "魔之心" then
		jns[1] = "对敌人的法术伤害效果提高10%"
		jns[3] = 7
		jns[6] = "wzife.wdf"
		jns[7] = 718604442
		jns[8] = 2278038627
	elseif jn == "神佑复生" then
		jns[1] = "战斗死亡时有15%的几率复活为正常状态，如果同时拥有鬼魂术（普通或高级），神佑复生的效果将取消。"
		jns[3] = 7
		jns[6] = "wzife.wdf"
		jns[7] = 1409514751
		jns[8] = 2943632069
	elseif jn == "偷袭" then
		jns[1] = "身手灵敏，不会受到反击和反震。攻击效果增加5%"
		jns[3] = 7
		jns[6] = "wzife.wdf"
		jns[7] = 3049408565
		jns[8] = 205675459
	elseif jn == "必杀" then
		jns[1] = "物理攻击时的必杀几率增加10%，出现必杀时伤害结果会加倍"
		jns[3] = 7
		jns[6] = "wzife.wdf"
		jns[7] = 3789166294
		jns[8] = 1107454372
	elseif jn == "驱鬼" then
		jns[1] = "对鬼魂类怪物的物理、法术伤害效果增加50%，如果将鬼魂类怪物打死，对方将飞出场外而不能复活"
		jns[3] = 7
		jns[6] = "wzife.wdf"
		jns[7] = 416049958
		jns[8] = 2077703648
	elseif jn == "三昧真火" then
		jns[1] = "使用后可以攻击对方单个对象"
		jns[3] = 4
		jns[4] = "30点魔法"
		jns[5] = "火云术技能达到20级"
		jns[6] = "wzife.wdf"
		jns[7] = 626159438
		jns[8] = 290397996
	elseif jn == "高级火属性吸收" then
		jns[1] = "30%的几率免受火属性法术伤害，并按应受伤害的大小恢复气血，吸收失败也可减少法术伤害的30%"
		jns[3] = 7
		jns[6] = "wzife.wdf"
		jns[7] = 2898051336
		jns[8] = 1343324785
	elseif jn == "高级永恒" then
		jns[1] = "受到的辅助类法术效果持续到战斗结束"
		jns[3] = 7
		jns[6] = "wzife.wdf"
		jns[7] = 4168001168
		jns[8] = 3963828674
	elseif jn == "横扫千军" then
		jns[1] = "能连续攻击对方3次。但使用后需休息一回合，休息时不能使用战斗指令，也不会受封类法术影响。"
		jns[3] = 4
		jns[4] = "消耗10%最大气血"
		jns[5] = "十方无敌技能达到30级以上"
		jns[6] = "wzife.wdf"
		jns[7] = 151046561
		jns[8] = 2967724427
	elseif jn == "紫气东来" then
		jns[1] = "克制普陀山弟子的必杀技"
		jns[3] = 4
		jns[4] = "150点愤怒值"
		jns[5] = "小乘佛法技能达到25级，人物等级达到20级"
		jns[6] = "wzife.wdf"
		jns[7] = 3576748561
		jns[8] = 3918273363
	elseif jn == "炼气化神" then
		jns[1] = "一定回合内补充自己和队友的魔法"
		jns[3] = 3
		jns[4] = "作用人数*30点气血"
		jns[5] = "修仙术技能达到30级"
		jns[6] = "wzife.wdf"
		jns[7] = 2394667501
		jns[8] = 1686425132
	elseif jn == "毒经" then
		jns[1] = "按技能等级提高伤害力"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 3161058590
		jns[8] = 1458078261
	elseif jn == "嗜血" then
		jns[1] = "打造后为项链提高一定的属性"
		jns[3] = 12
		jns[4] = "和技能等级数相同的活力"
		jns[5] = "文韬武略技能达到35级 "
		jns[6] = "wzife.wdf"
		jns[7] = 2341356120
		jns[8] = 831906636
	elseif jn == "推拿" then
		jns[1] = "使用后可以恢复自身的气血和气血上限"
		jns[3] = 5
		jns[4] = "50点魔法，非战斗时减半"
		jns[5] = "歧黄之术技能达到10级"
		jns[6] = "wzife.wdf"
		jns[7] = 404486915
		jns[8] = 4289032145
	elseif jn == "火牛阵" then
		jns[1] = "按技能等级提高灵力"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 1917391753
		jns[8] = 1358009688
	elseif jn == "反震" then
		jns[1] = "受到物理攻击时有30%几率给予对方反震，反震伤害为所受伤害的25%"
		jns[3] = 7
		jns[6] = "wzife.wdf"
		jns[7] = 3941065708
		jns[8] = 3754360316
	elseif jn == "牛刀小试" then
		jns[1] = "初入江湖必备技能"
		jns[3] = 4
		jns[4] = "20魔法"
		jns[6] = "wzife.wdf"
		jns[7] = 3416022732
		jns[8] = 3416022732
	elseif jn == "一笑倾城" then
		jns[1] = "令多个目标一定回合无法使用法术"
		jns[3] = 4
		jns[4] = "60点魔法"
		jns[5] = "人物飞升且“倾国倾城”技能达到120级 "
		jns[6] = "wzife.wdf"
		jns[7] = 3266381545
		jns[8] = 522280593
	elseif jn == "穿云破空" then
		jns[1] = "为腰带附加提升物理攻击伤害结果的临时效果。"
		jns[3] = 9
		jns[4] = "和技能等级相同的活力"
		jns[5] = "“啸傲”技能达到35级，人物等级达到30级。 "
		jns[6] = "wzife.wdf"
		jns[7] = 3085440238
		jns[8] = 3294906395
	elseif jn == "鹰击" then
		jns[1] = "攻击对方多人，使用后需要休息1回合"
		jns[3] = 4
		jns[4] = "30点魔法，攻击多人时消耗增加"
		jns[5] = "生死搏技能达到30级，不允许连续两回合使用"
		jns[6] = "wzife.wdf"
		jns[7] = 3219722580
		jns[8] = 1443303401
	elseif jn == "娉婷嬝娜" then
		jns[1] = "使对手一定回合无法使用装备特技，且被动法宝将不会触发效果。"
		jns[3] = 4
		jns[4] = "40点魔法"
		jns[5] = "闭月羞花技能达到25级"
		jns[6] = "wzife.wdf"
		jns[7] = 768000231
		jns[8] = 1404049159
	elseif jn == "高级招架" then
		jns[1] = "20%的几率完全躲过敌人的物理攻击"
		jns[3] = 7
		jns[6] = "wzife.wdf"
		jns[7] = 450878763
		jns[8] = 1018872745
	elseif jn == "幸运" then
		jns[1] = "不会受到必杀攻击"
		jns[3] = 7
		jns[6] = "wzife.wdf"
		jns[7] = 3640080474
		jns[8] = 1085801234
	elseif jn == "金刚经" then
		jns[1] = "无效果"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 2444843522
		jns[8] = 4122844852
	elseif jn == "霹雳咒" then
		jns[1] = "无效果"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 53930907
		jns[8] = 300592749
	elseif jn == "魂飞魄散" then
		jns[1] = "使用后驱散目标因门派法术获得的所有良性状态（变身除外）。 "
		jns[3] = 4
		jns[4] = "40点魔法"
		jns[5] = "“六道轮回”技能达到50级 "
		jns[6] = "wzife.wdf"
		jns[7] = 1594584941
		jns[8] = 2719875429
	elseif jn == "妙手回春" then
		jns[1] = "使用后可以恢复多人的气血上限"
		jns[3] = 6
		jns[4] = "25%的最大魔法"
		jns[5] = "歧黄之术技能达到40级"
		jns[6] = "wzife.wdf"
		jns[7] = 416089174
		jns[8] = 2939581056
	elseif jn == "堪察令" then
		jns[1] = "鉴定头盔、饰品、腰带、靴子等类装备，学习后也可在长安书店制作相应等级的“灵宝图鉴”。"
		jns[3] = 12
		jns[4] = "一定的活力，视装备等级而定"
		jns[5] = "灵通术技能达到5级"
		jns[6] = "wzife.wdf"
		jns[7] = 4073909039
		jns[8] = 2150653771
	elseif jn == "渡世步" then
		jns[1] = "按技能等级提高躲避力"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 2399184502
		jns[8] = 2261339260
	elseif jn == "姐妹同心" then
		jns[1] = "战斗中使用，可以减少对手的魔法值"
		jns[3] = 4
		jns[4] = "50点魔法"
		jns[5] = "姊妹相随技能达到20级 "
		jns[6] = "wzife.wdf"
		jns[7] = 42398851
		jns[8] = 502149406
	elseif jn == "飞行" then
		jns[1] = "躲避能力增加20%，躲避率增加5%，物理攻击命中增加20%，但受暗器攻击时伤害会增加30%"
		jns[3] = 7
		jns[6] = "wzife.wdf"
		jns[7] = 813574344
		jns[8] = 1190813269
	elseif jn == "尸腐恶" then
		jns[1] = "按技能等级提高防御力"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 3997271777
		jns[8] = 22951667
	elseif jn == "天外魔音" then
		jns[1] = "按技能等级提高灵力"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 3819811307
		jns[8] = 2331712128
	elseif jn == "吸血" then
		jns[1] = "物理攻击时，吸取对方所掉气血的25%, 如果对方有异常状态，吸血后会中毒，攻击鬼魂类怪物时无效"
		jns[3] = 7
		jns[6] = "wzife.wdf"
		jns[7] = 668285297
		jns[8] = 156592686
	elseif jn == "一气化三清" then
		jns[1] = "打造后为衣服提高一定的属性"
		jns[3] = 12
		jns[4] = "和技能等级数相同的活力"
		jns[5] = "修仙术技能达到35级"
		jns[6] = "wzife.wdf"
		jns[7] = 4257500096
		jns[8] = 2501870432
	elseif jn == "乾坤妙法" then
		jns[1] = "牺牲自己的物理防御来保护队友，使其不受任何负面影响，但也无法进行任何行动"
		jns[3] = 9
		jns[4] = "50点魔法"
		jns[5] = "人物飞升且“乾坤袖”技能达到120级"
		jns[6] = "wzife.wdf"
		jns[7] = 1736041428
		jns[8] = 3294906395
	elseif jn == "失魂符" then
		jns[1] = "令对手一定回合无法使用法术攻击，并降低物理防御力"
		jns[3] = 4
		jns[4] = "60点魔法"
		jns[5] = "符之术技能达到25级"
		jns[6] = "wzife.wdf"
		jns[7] = 2029120895
		jns[8] = 2414938178
	elseif jn == "护法金刚" then
		jns[1] = "按技能等级提高伤害力"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 223144262
		jns[8] = 84328029
	elseif jn == "定身符" then
		jns[1] = "概率令对手一定回合停止行动，并降低法术防御力"
		jns[3] = 4
		jns[4] = "60点魔法"
		jns[5] = "符之术技能达到30级"
		jns[6] = "wzife.wdf"
		jns[7] = 170590832
		jns[8] = 2539497909
	elseif jn == "颠倒五行" then
		jns[1] = "为队友临时增加四系法术吸收率、法术闪避率及概率触发法术连击率(不对治疗效果生效)"
		jns[3] = 3
		jns[4] = "80点魔法"
		jns[5] = "“五行扭转”技能达到30级"
		jns[6] = "wzife.wdf"
		jns[7] = 1849998950
		jns[8] = 3616521026
	elseif jn == "回身击" then
		jns[1] = "按技能等级提高防御力"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 1224508814
		jns[8] = 2667913913
	elseif jn == "嗜血追击" then
		jns[1] = "使用物理攻击击倒目标时，会继续攻击另一个目标一次。此效果每回合只会触发一次"
		jns[3] = 7
		jns[6] = "wzife.wd1"
		jns[7] = 3287596045
		jns[8] = 3287596045
	elseif jn == "反间之计" then
		jns[1] = "令怪物处于混乱状态，不能用于玩家对战"
		jns[3] = 4
		jns[4] = "30点魔法"
		jns[5] = "文韬武略技能达到20级"
		jns[6] = "wzife.wdf"
		jns[7] = 146786390
		jns[8] = 841319996
	elseif jn == "小乘佛法" then
		jns[1] = "按技能等级提高灵力"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 2925047058
		jns[8] = 1573500785
	elseif jn == "一苇渡江" then
		jns[1] = "战斗中临时提高自己或队友的敏捷，技能达到一定等级后可用于多人"
		jns[3] = 3
		jns[4] = "30点魔法"
		jns[5] = "佛光普照技能等级达到30级以上"
		jns[6] = "wzife.wdf"
		jns[7] = 2822966564
		jns[8] = 1136663058
	elseif jn == "九龙诀" then
		jns[1] = "按技能等级提高灵力"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 140291603
		jns[8] = 923894374
	elseif jn == "活血" then
		jns[1] = "使用后可以恢复队友的气血和气血上限"
		jns[3] = 3
		jns[4] = "70点魔法，非战斗时减半"
		jns[5] = "歧黄之术技能达到25级"
		jns[6] = "wzife.wdf"
		jns[7] = 2432822176
		jns[8] = 2865439591
	elseif jn == "疾风步" then
		jns[1] = "按技能等级提高躲避力"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 2104231936
		jns[8] = 552299472
	elseif jn == "错乱" then
		jns[1] = "令对手无法使用法术，并在物理攻击时出现目标偏差"
		jns[3] = 4
		jns[4] = "60点魔法"
		jns[5] = "乾坤塔技能达到50级"
		jns[6] = "wzife.wdf"
		jns[7] = 3622268205
		jns[8] = 4290077259
	elseif jn == "兵解符" then
		jns[1] = "在战斗中逃离战场回到自己门派"
		jns[3] = 5
		jns[4] = "当前所有魔法、90%当前气血，使用失败无消耗"
		jns[5] = "符之术技能等级达到10级以上、MP≥10"
		jns[6] = "wzife.wdf"
		jns[7] = 1268134129
		jns[8] = 2026082073
	elseif jn == "神兵鉴赏" then
		jns[1] = "无效果"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 743065692
		jns[8] = 4243999668
	elseif jn == "神力无穷" then
		jns[1] = "打造后为腰带提高一定的属性"
		jns[3] = 12
		jns[4] = "和技能等级数相同的活力"
		jns[5] = "狂兽诀技能达到35级 "
		jns[6] = "wzife.wdf"
		jns[7] = 3809438015
		jns[8] = 3884615585
	elseif jn == "宁气诀" then
		jns[1] = "按技能等级提高灵力"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 1979452270
		jns[8] = 3573433154
	elseif jn == "还阳术" then
		jns[1] = "复活倒地的队友，提高攻击力，降低防御力"
		jns[3] = 10
		jns[4] = "150点魔法"
		jns[5] = "人物飞升且“拘魂诀”技能达到120级"
		jns[6] = "wzife.wdf"
		jns[7] = 2874709055
		jns[8] = 485361049
	elseif jn == "文韬武略" then
		jns[1] = "按技能等级提高防御力"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 1708888521
		jns[8] = 3150772814
	elseif jn == "神道无念" then
		jns[1] = "按技能等级提高灵力"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 1749937072
		jns[8] = 3852659463
	elseif jn == "牛逼神功" then
		jns[1] = "无效果"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 3975126128
		jns[8] = 2741787302
	elseif jn == "极度疯狂" then
		jns[1] = "受到物理攻击时会自动反击敌人"
		jns[3] = 5
		jns[4] = "30点魔法"
		jns[5] = "魔兽反噬技能达到20级 "
		jns[6] = "wzife.wdf"
		jns[7] = 363599535
		jns[8] = 2884919862
	elseif jn == "大慈大悲" then
		jns[1] = "按技能等级提高防御力"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 1267473253
		jns[8] = 3966881348
	elseif jn == "归元咒" then
		jns[1] = "消耗魔法值来补充自己的气血"
		jns[3] = 5
		jns[4] = "50点魔法"
		jns[5] = "归元心法技能达到1级"
		jns[6] = "wzife.wdf"
		jns[7] = 2473529751
		jns[8] = 3090930843
	elseif jn == "普渡众生" then
		jns[1] = "恢复队友的气血并治疗伤势"
		jns[3] = 3
		jns[4] = "50点魔法"
		jns[5] = "金刚经技能达到15级"
		jns[6] = "wzife.wdf"
		jns[7] = 688650727
		jns[8] = 3407231441
	elseif jn == "混元道果" then
		jns[1] = "按技能等级提高灵力"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 675093303
		jns[8] = 3799123064
	elseif jn == "飞花摘叶" then
		jns[1] = "吸取对方多人魔法为我方队员所使用"
		jns[3] = 4
		jns[4] = "60点魔法"
		jns[5] = "人物飞升且“清歌妙舞”技能达到120级"
		jns[6] = "wzife.wdf"
		jns[7] = 4065673057
		jns[8] = 1962869359
	elseif jn == "秋波暗送" then
		jns[1] = "按技能等级提高命中"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 1698608098
		jns[8] = 975668103
	elseif jn == "魔王护持" then
		jns[1] = "打造后为武器提高一定的属性"
		jns[3] = 12
		jns[4] = "和技能等级数相同的活力"
		jns[5] = "牛逼神功技能达到35级，人物等级达到30级"
		jns[6] = "wzife.wdf"
		jns[7] = 937481251
		jns[8] = 3778438121
	elseif jn == "反击" then
		jns[1] = "受到物理攻击时有30%几率自动反击，反击伤害为正常伤害的50%"
		jns[3] = 7
		jns[6] = "wzife.wdf"
		jns[7] = 2574462722
		jns[8] = 326702364
	elseif jn == "黄庭经" then
		jns[1] = "无效果"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 2680262225
		jns[8] = 1501050246
	elseif jn == "五行扭转" then
		jns[1] = "按技能等级提高防御力"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 3256679059
		jns[8] = 3457635171
	elseif jn == "魔兽神功" then
		jns[1] = "无效果"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 2952870578
		jns[8] = 10218458
	elseif jn == "大鹏展翅" then
		jns[1] = "按技能等级提高躲避力"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 1243494819
		jns[8] = 2200620761
	elseif jn == "推气过宫" then
		jns[1] = "战斗中恢复多人气血"
		jns[3] = 3
		jns[4] = "100点魔法，非战斗时减半"
		jns[5] = "歧黄之术技能达到35级"
		jns[6] = "wzife.wdf"
		jns[7] = 971215069
		jns[8] = 2227035198
	elseif jn == "归元心法" then
		jns[1] = "按技能等级提高防御力"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 3444112895
		jns[8] = 2996031232
	elseif jn == "飞行符" then
		jns[1] = "制作一张飞行符"
		jns[3] = 0
		jns[4] = "消耗50点金钱，20点魔法"
		jns[5] = "符之术技能达到21级"
		jns[6] = "wzife.wdf"
		jns[7] = 1788221468
		jns[8] = 1798664293
	elseif jn == "蛛丝阵法" then
		jns[1] = "按技能等级提高防御力"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 487492946
		jns[8] = 2233726885
	elseif jn == "红袖添香" then
		jns[1] = "战斗中提升自己和队友的速度"
		jns[3] = 3
		jns[4] = "30点魔法"
		jns[5] = "倾国倾城技能达到20级"
		jns[6] = "wzife.wdf"
		jns[7] = 547746768
		jns[8] = 1757842178
	elseif jn == "连环击" then
		jns[1] = "疯狂地连续的攻击敌人"
		jns[3] = 4
		jns[4] = "可连击次数×30点魔法"
		jns[5] = "狂兽诀技能达到30级，使用后解除当前所有增益状态"
		jns[6] = "wzife.wdf"
		jns[7] = 3608703815
		jns[8] = 673541382
	elseif jn == "高级连击" then
		jns[1] = "55%的几率连续两次物理攻击，如果对方有反震技能，只能攻击一次"
		jns[3] = 7
		jns[6] = "wzife.wdf"
		jns[7] = 1321871887
		jns[8] = 3016140514
	elseif jn == "隐身" then
		jns[1] = "自动附加地府修罗隐身法术2～3回合，拥有此技能物理攻击能力会降低20%，隐身状态下无法使用法术"
		jns[3] = 7
		jns[6] = "wzife.wdf"
		jns[7] = 1508147758
		jns[8] = 3007875758
	elseif jn == "高级隐身" then
		jns[1] = "自动附加地府修罗隐身法术3～5回合，拥有此技能物理攻击能力会降低15%，隐身状态下无法使用法术"
		jns[3] = 7
		jns[6] = "wzife.wdf"
		jns[7] = 2491734238
		jns[8] = 2948130962
	elseif jn == "似玉生香" then
		jns[1] = "令对手一定回合无法使用法术和物理攻击"
		jns[3] = 4
		jns[4] = "50点魔法"
		jns[5] = "闭月羞花技能等级达到40级以上"
		jns[6] = "wzife.wdf"
		jns[7] = 2732466496
		jns[8] = 3524410344
	elseif jn == "斜月步" then
		jns[1] = "按技能等级提高躲避力"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 769022309
		jns[8] = 2124205828
	elseif jn == "日光华" then
		jns[1] = "施展法术攻击多人，并附加固定伤害"
		jns[3] = 4
		jns[4] = "50点魔法"
		jns[5] = "五行学技能达到10级"
		jns[6] = "wzife.wdf"
		jns[7] = 2064123225
		jns[8] = 877019458
	elseif jn == "寡欲令" then
		jns[1] = "解除并避免盘丝洞封类法术的影响。"
		jns[3] = 5
		jns[4] = "50点魔法"
		jns[5] = "灵通术技能达到30级"
		jns[6] = "wzife.wdf"
		jns[7] = 653757983
		jns[8] = 482656655
	elseif jn == "法术连击" then
		jns[1] = "使用法术攻击目标时会有一定几率出现连续2次攻击敌人"
		jns[3] = 7
		jns[6] = "wzife.wdf"
		jns[7] = 2200246844
		jns[8] = 345682085
	elseif jn == "黄泉之息" then
		jns[1] = "攻击对方单人，并减少其一定的速度，夜间使用效果调整为白天的130%。"
		jns[3] = 4
		jns[4] = "50点魔法"
		jns[5] = "人物飞升且“幽冥术”技能达到120级 "
		jns[6] = "wzife.wdf"
		jns[7] = 3536984715
		jns[8] = 1893059881
	elseif jn == "魔音摄魂" then
		jns[1] = "令对手一定回合内无法恢复气血和疗伤"
		jns[3] = 4
		jns[4] = "40点魔法"
		jns[5] = "天外魔音技能达到45级"
		jns[6] = "wzife.wdf"
		jns[7] = 32064057
		jns[8] = 1554838399
	elseif jn == "锢魂术" then
		jns[1] = "使用成功后可使目标5个回合内在死亡状态下无法被复活。"
		jns[3] = 4
		jns[4] = "50点魔法"
		jns[5] = "幽冥术技能达到75级"
		jns[6] = "wzife.wd1"
		jns[7] = 1727365486
		jns[8] = 784403165
	elseif jn == "牛屎遁" then
		jns[1] = "平时状态下使用，可以瞬间回到自己的门派"
		jns[3] = 0
		jns[4] = "10点气血和10点魔法"
		jns[5] = "裂石步技能达到1级"
		jns[6] = "wzife.wdf"
		jns[7] = 2481624731
		jns[8] = 668274006
	elseif jn == "高级法术连击" then
		jns[1] = "使用法术攻击目标时会有较大几率出现连续2次攻击敌人"
		jns[3] = 7
		jns[6] = "wzife.wdf"
		jns[7] = 3484714916
		jns[8] = 1890987017
	elseif jn == "高级神佑复生" then
		jns[1] = "战斗死亡时有30%的几率复活为正常状态，如果同时拥有鬼魂术（普通或高级），神佑复生的效果将取消。"
		jns[3] = 7
		jns[6] = "wzife.wdf"
		jns[7] = 2040400078
		jns[8] = 3049938323
	elseif jn == "牛劲" then
		jns[1] = "战斗中暂时提高自己的法术伤害力"
		jns[3] = 5
		jns[4] = "20点魔法"
		jns[5] = "火牛阵技能达到30级"
		jns[6] = "wzife.wdf"
		jns[7] = 3521936089
		jns[8] = 1080213476
	elseif jn == "无常步" then
		jns[1] = "按技能等级提高速度"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 2772099555
		jns[8] = 71871380
	elseif jn == "为官之道" then
		jns[1] = "无效果"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 2338752455
		jns[8] = 2050205097
	elseif jn == "狮搏" then
		jns[1] = "以高于平时的伤害力攻击对方单人"
		jns[3] = 4
		jns[4] = "30点魔法"
		jns[5] = "生死搏技能达到20级"
		jns[6] = "wzife.wdf"
		jns[7] = 3700481839
		jns[8] = 1627374280
	elseif jn == "威慑" then
		jns[1] = "令怪物或玩家召唤兽无法行动，不能对玩家使用"
		jns[3] = 4
		jns[4] = "20点魔法"
		jns[5] = "训兽诀技能达到15级"
		jns[6] = "wzife.wdf"
		jns[7] = 81423983
		jns[8] = 894640149
	elseif jn == "盘丝步" then
		jns[1] = "按技能等级提高躲避力"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 3406981495
		jns[8] = 337337940
	elseif jn == "磐龙灭法" then
		jns[1] = "按技能等级提高伤害力"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 423192983
		jns[8] = 1962038233
	elseif jn == "清歌妙舞" then
		jns[1] = "按技能等级提高速度"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 1027945253
		jns[8] = 2444515719
	elseif jn == "魔息术" then
		jns[1] = "一定回合内恢复自身的魔法 "
		jns[3] = 5
		jns[4] = "30点气血"
		jns[5] = "人物飞升且“阴阳二气诀”技能达到120级 "
		jns[6] = "wzife.wdf"
		jns[7] = 3643037170
		jns[8] = 787252900
	elseif jn == "三花聚顶" then
		jns[1] = "消耗一定的气血来补充魔法，非战斗时每2分钟使用一次"
		jns[3] = 5
		jns[4] = "30点气血"
		jns[5] = "明性修身技能达到30级"
		jns[6] = "wzife.wdf"
		jns[7] = 3813527840
		jns[8] = 3150915326
	elseif jn == "幽冥术" then
		jns[1] = "无效果"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 2105426613
		jns[8] = 414994835
	elseif jn == "龙附" then
		jns[1] = "打造后为武器提高一定的属性"
		jns[3] = 12
		jns[4] = "和技能等级数相同的活力"
		jns[5] = "龙附技能达到35级，人物等级达到30级"
		jns[6] = "wzife.wdf"
		jns[7] = 2888970157
		jns[8] = 1784954158
	elseif jn == "勾魂" then
		jns[1] = "恢复自身气血，减少对方一定的气血"
		jns[3] = 4
		jns[4] = "40点魔法"
		jns[5] = "秋波暗送技能达到20级"
		jns[6] = "wzife.wdf"
		jns[7] = 3333121941
		jns[8] = 802455732
	elseif jn == "盘丝大法" then
		jns[1] = "按技能等级提高伤害力"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 2544956347
		jns[8] = 136964443
	elseif jn == "知己知彼" then
		jns[1] = "使用后可以领悟目标的状态"
		jns[3] = 4
		jns[4] = "80点魔法"
		jns[5] = "清明自在达到35级以上"
		jns[6] = "wzife.wdf"
		jns[7] = 196316992
		jns[8] = 2448181313
	elseif jn == "天罡气" then
		jns[1] = "按技能等级提高伤害力"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 4224325719
		jns[8] = 517623127
	elseif jn == "高级隐身" then
		jns[1] = "动附加地府修罗隐身法术3～5回合，拥有此技能物理攻击能力会降低15%，隐身状态下无法使用法术"
		jns[3] = 7
		jns[6] = "wzife.wdf"
		jns[7] = 2491734238
		jns[8] = 2948130962
	elseif jn == "落雷符" then
		jns[1] = "作用为当目标为怪物时攻击对方多个目标，作用人数公式为技能等级除以30+1，最多3个。随着作用人数增加降低伤害效果，魔法消耗随着作用人数增加而增加。对含有鬼魂术、高级鬼魂术的敌人伤害增加20%"
		jns[3] = 4
		jns[4] = "作用人数*30点魔法"
		jns[5] = "“符之术”技能达到20级 "
		jns[6] = "wzife.wd1"
		jns[7] = 3476452217
		jns[8] = 3226830020
	elseif jn == "象形" then
		jns[1] = "攻击敌人并令其下回合无法行动，但使用后自己也将在下回合停止行动且取消变身状态"
		jns[3] = 4
		jns[4] = "80魔法"
		jns[5] = "生死搏技能达到20级。"
		jns[6] = "wzife.wdf"
		jns[7] = 3175084157
		jns[8] = 108912467
	elseif jn == "天魔解体" then
		jns[1] = "使用后持续一定回合数将自身的物理防御降低50%，防御值的10%转化为临时伤害，死亡后效果清除"
		jns[3] = 5
		jns[4] = "30点魔法，复活后的当前回合无法使用"
		jns[5] = "人物飞升且“生死搏”技能达到120级"
		jns[6] = "wzife.wdf"
		jns[7] = 2713209956
		jns[8] = 2477360209
	elseif jn == "水遁" then
		jns[1] = "平时或战斗中使用，可以瞬间回到自己的门派"
		jns[3] = 0
		jns[4] = "战斗时消耗当前所有魔法，非战斗时消耗10点气血、魔法"
		jns[5] = "游龙术技能达到1级"
		jns[6] = "wzife.wdf"
		jns[7] = 596614171
		jns[8] = 2671300567
	elseif jn == "震天诀" then
		jns[1] = "按技能等级提高伤害力"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 1449209742
		jns[8] = 1917106392
	elseif jn == "斗转星移" then
		jns[1] = "平时状态下使用，可以瞬间回到自己的门派"
		jns[3] = 0
		jns[4] = "10点气血和10点魔法"
		jns[5] = "七星遁技能达到1级"
		jns[6] = "wzife.wdf"
		jns[7] = 2019188530
		jns[8] = 655674701
	elseif jn == "水属性吸收" then
		jns[1] = "30%的几率免受水属性法术伤害，并按应受伤害的大小恢复气血，但受到火属性法术攻击时伤害会增加30%"
		jns[3] = 7
		jns[6] = "wzife.wdf"
		jns[7] = 92545119
		jns[8] = 1756512785
	elseif jn == "宁心" then
		jns[1] = "解除并避免女儿村封类法术的影响"
		jns[3] = 3
		jns[4] = "30点魔法"
		jns[5] = "宁气诀技能达到20级"
		jns[6] = "wzife.wdf"
		jns[7] = 2585090388
		jns[8] = 1957863037
	elseif jn == "明性修身" then
		jns[1] = "按技能等级提高防御力"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 4104116990
		jns[8] = 3074583809
	elseif jn == "打造技巧" then
		jns[1] = "铸造名家欧冶子传下的技能，可以提高打造武器的能力"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 3866239213
		jns[8] = 1635206107
	elseif jn == "千里神行" then
		jns[1] = "平时状态下使用，可以瞬间回到自己的门派"
		jns[3] = 0
		jns[4] = "消耗10点气血和10点魔法"
		jns[5] = "疾风步技能达到1级"
		jns[6] = "wzife.wdf"
		jns[7] = 13494159
		jns[8] = 1717996623
	-- 1.3新增
	elseif jn == "天地无极" then
		jns[1] = "无效果"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 2616462789
		jns[8] = 3629430297
	elseif jn == "九转玄功" then
		jns[1] = "无效果"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 1837364177
		jns[8] = 1720159516
	elseif jn == "武神显圣" then
		jns[1] = "无效果"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 3229675127
		jns[8] = 2285367568
	elseif jn == "啸傲" then
		jns[1] = "按技能等级提高灵力"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 1753145086
		jns[8] = 796505945
	elseif jn == "气吞山河" then
		jns[1] = "按技能等级提高伤害力"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 4005775594
		jns[8] = 1613219782
	elseif jn == "诛魔" then
		jns[1] = "按技能等级提高防御力"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 150136690
		jns[8] = 2802612826
	elseif jn == "法天象地" then
		jns[1] = "按技能等级提高命中"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 2858795509
		jns[8] = 3937616310
	elseif jn == "踏山裂石" then
		jns[1] = "临时提升必杀几率对单个敌人进行物理攻击"
		jns[3] = 4
		jns[4] = "50点魔法"
		jns[5] = "“气吞山河”技能达到25级"
		jns[6] = "wzife.wd4"
		jns[7] = 0xF4DCF38F
		jns[8] = 0x1C603FAE
	elseif jn == "裂石" then
		jns[1] = "临时提升必杀几率对单个敌人进行物理攻击,增加1点战意值。"
		jns[3] = 4
		jns[4] = "50点魔法"
		jns[5] = "“气吞山河”技能达到25级"
		jns[6] = "wzife.wd4"
		jns[7] = 0xF4DCF38F
		jns[8] = 0x1C603FAE
	elseif jn == "断岳势" then
		jns[1] = "临时提升必杀几率对单个敌人进行2次物理攻击。"
		jns[3] = 4
		jns[4] = "50点魔法、1点战意"
		jns[5] = "“气吞山河”技能达到35级"
		jns[6] = "wzife.wd4"
		jns[7] = 0x5AA54949
		jns[8] = 0x5C95AF41
	elseif jn == "天崩地裂" then
		jns[1] = "临时提升必杀几率对单个敌人进行3次物理攻击。最后一次攻击不会被保护。"
		jns[3] = 4
		jns[4] = "50点魔法、3点战意"
		jns[5] = "“气吞山河”技能达到45级"
		jns[6] = "wzife.wd4"
		jns[7] = 0x9ADAEA80
		jns[8] = 0x3FB03390
	elseif jn == "浪涌" then
		jns[1] = "根据对方防御值临时提升一定伤害力对单个敌人进行物理攻击。目标为怪物时增加作用人数。攻击怪物个数=技能等级除以35+1。最多3个。增加1点战意值。 "
		jns[3] = 4
		jns[4] = "个数*20点魔法"
		jns[5] = "“气吞山河”技能达到25级"
		jns[6] = "wzife.wd4"
		jns[7] = 0xCE61D91C
		jns[8] = 0x1A289BEA
	elseif jn == "惊涛怒" then
		jns[1] = "根据对方防御值临时提升一定伤害力对多个敌人进行物理攻击。攻击个数=技能等级出除以35+1,最多3人。"
		jns[3] = 4
		jns[4] = "个数*20点魔法、1点战意"
		jns[5] = "“气吞山河”技能达到35级"
		jns[6] = "wzife.wd4"
		jns[7] = 0xB91C6953
		jns[8] = 0xBE11779C
	elseif jn == "翻江搅海" then
		jns[1] = "根据对方防御值临时提升一定伤害力对多个敌人进行物理攻击。攻击个数=技能等级除以30+2，最多6人。"
		jns[3] = 4
		jns[4] = "个数*30点魔法、3点战意"
		jns[5] = "“气吞山河”技能达到45级"
		jns[6] = "wzife.wd4"
		jns[7] = 0x26419C11
		jns[8] = 0x11879028
	elseif jn == "腾雷" then
		jns[1] = "对目标造成伤害并有机会使目标受技能恢复效果降低。"
		jns[3] = 4
		jns[4] = "60点魔法"
		jns[5] = "“诛魔”技能达到120级，且人物飞升"
		jns[6] = "wzife.wd4"
		jns[7] = 0x569D01F7
		jns[8] = 0x956BA0A2
	elseif jn == "指地成钢" then
		jns[1] = "克制无底洞弟子的必杀技。"
		jns[3] = 4
		jns[4] = "150点愤怒"
		jns[5] = "“诛魔”技能达到25级，人物等级达到20级。"
		jns[6] = "wzife.wd4"
		jns[7] = 0xF4DCF38F
		jns[8] = 0x1C603FAE
	elseif jn == "不动如山" then
		jns[1] = "使用后减少自身受到的法术伤害与物理伤害。持续1回合。"
		jns[3] = 5
		jns[4] = "150点魔法"
		jns[5] = "“九转玄功”技能达到25级"
		jns[6] = "wzife.wd4"
		jns[7] = 0xD96F2331
		jns[8] = 0x38C47290
	elseif jn == "碎星诀" then
		jns[1] = "提升自己或队友的物理伤害结果，持续一定回合。不能与镇魂诀同时存在。"
		jns[3] = 5
		jns[4] = "30点魔法"
		jns[5] = "“武神显圣”技能达到30级"
		jns[6] = "wzife.wd4"
		jns[7] = 0x136442C0
		jns[8] = 0x5F8D7935
	elseif jn == "镇魂诀" then
		jns[1] = "提升自己或者队友的必杀几率，持续一定回合。 不能与碎星诀同时存在。"
		jns[3] = 3
		jns[4] = "5%的当前气血"
		jns[5] = "“武神显圣”技能达到120级，且人物飞升"
		jns[6] = "wzife.wd4"
		jns[7] = 0x9E1580AA
		jns[8] = 0xF808DCC6
	elseif jn == "无穷妙道" then
		jns[1] = "一定几率解除无底洞封印法术。"
		jns[3] = 5
		jns[4] = "60点魔法"
		jns[5] = "“法天象地”技能达到30级"
		jns[6] = "wzife.wd4"
		jns[7] = 0xAFDB81A4
		jns[8] = 0x76FBBEEC
	elseif jn == "纵地金光" then
		jns[1] = "平时状态下使用，可以瞬间回到自己的门派。"
		jns[3] = 0
		jns[4] = "10点气血和10点魔法"
		jns[5] = "“法天象地”技能达到1级。"
		jns[6] = "wzife.wd4"
		jns[7] = 0xE6A2AA59
		jns[8] = 0xFEF5D678
	-- 神木林
	elseif jn == "瞬息万变" then
		jns[1] = "无效果"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 91138644
		jns[8] = 3611723828
	elseif jn == "万灵诸念" then
		jns[1] = "按技能等级提高灵力"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 1673295044
		jns[8] = 3633730222
	elseif jn == "巫咒" then
		jns[1] = "按技能等级提高伤害力"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 1387740863
		jns[8] = 3945429798
	elseif jn == "万物轮转" then
		jns[1] = "按技能等级提高防御力"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 236054114
		jns[8] = 3548374182
	elseif jn == "天人庇护" then
		jns[1] = "按技能等级提高躲避力"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 466502506
		jns[8] = 2656066797
	elseif jn == "神木恩泽" then
		jns[1] = "无效果"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 1911264426
		jns[8] = 785936658
	elseif jn == "驭灵咒" then
		jns[1] = "按技能等级提高最大魔法上限"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 3018347230
		jns[8] = 1524159458
	elseif jn == "落叶萧萧" then
		jns[1] = "使用法术攻击敌方多个目标。 攻击个数=技能等级除以35+1,最多5人。"
		jns[3] = 4
		jns[4] = "70点魔法*作用人数"
		jns[5] = "“瞬息万变”技能达到35级"
		jns[6] = "wzife.wd4"
		jns[7] = 0x2E734F9D
		jns[8] = 0x0B8CF3A1
	elseif jn == "荆棘舞" then
		jns[1] = "使用法术攻击敌方，造成较高伤害。"
		jns[3] = 4
		jns[4] = "80点魔法"
		jns[5] = "“万灵诸念”技能达到20级"
		jns[6] = "wzife.wd4"
		jns[7] = 0xDD2AB898
		jns[8] = 0x6A647570
	elseif jn == "尘土刃" then
		jns[1] = "使用法术攻击敌方单体目标，并附加固定伤害。"
		jns[3] = 4
		jns[4] = "80点魔法"
		jns[5] = "“万灵诸念”技能达到20级"
		jns[6] = "wzife.wd4"
		jns[7] = 0x3FE17E30
		jns[8] = 0x71C197B0
	elseif jn == "冰川怒" then
		jns[1] = "使用法术攻击敌方单体目标。并且有一定概率冻结目标。冻结期间目标伤害降低10%，并且每回合概率不行动"
		jns[3] = 4
		jns[4] = "80点魔法"
		jns[5] = "“万灵诸念”技能达到20级"
		jns[6] = "wzife.wd4"
		jns[7] = 0xEDF81F56
		jns[8] = 0x3B12CD18
	elseif jn == "雾杀" then
		jns[1] = "使用法术攻击敌方单人目标，对敌人造成持续毒性伤害。"
		jns[3] = 4
		jns[4] = "150点魔法"
		jns[5] = "“巫咒”技能达到40级"
		jns[6] = "wzife.wd4"
		jns[7] = 0x1EE55D3C
		jns[8] = 0x0DA2D8DF
	elseif jn == "血雨" then
		jns[1] = "消耗自身气血，对敌人单体目标造成大量伤害。 使用后，自己下回合无法使用法术。 "
		jns[3] = 4
		jns[4] = "200点魔法，200点气血"
		jns[5] = "“巫咒”技能达到40级"
		jns[6] = "wzife.wd4"
		jns[7] = 0x126B932F
		jns[8] = 0x7D52C301
	elseif jn == "星月之惠" then
		jns[1] = "回复自身一定的气血值。"
		jns[3] = 5
		jns[4] = "150点魔法"
		jns[5] = "“巫咒”技能达到40级"
		jns[6] = "wzife.wd4"
		jns[7] = 4284560198
		jns[8] = 8287795
	elseif jn == "炎护" then
		jns[1] = "抵御50%的气血伤害，每抵御1点伤害消耗1点魔法"
		jns[3] = 5
		jns[4] = "100点魔法"
		jns[5] = "“天人庇护”技能达到50级"
		jns[6] = "wzife.wd4"
		jns[7] = 0xA215E746
		jns[8] = 0xC5D73984
	elseif jn == "叶隐" then
		jns[1] = "平时状态下使用，可以瞬间回到自己的门派。"
		jns[3] = 0
		jns[4] = "10点气血和10点魔法"
		jns[5] = "“天人庇护”技能达到1级"
		jns[6] = "wzife.wd4"
		jns[7] = 0x64FEA3A4
		jns[8] = 0x51763883
	elseif jn == "神木呓语" then
		jns[1] = "打造后为鞋子临时增加一定的魔法值。"
		jns[3] = 12
		jns[4] = "10点气血和10点魔法"
		jns[5] = "“神木恩泽”技能达到35级，人物等级达到30级。"
		jns[6] = "wzife.wd4"
		jns[7] = 0x977F5625
		jns[8] = 0x33CC0A38
	elseif jn == "蜜润" then
		jns[1] = "增加己方多人的法术伤害力 "
		jns[3] = 5
		jns[4] = "100点魔法"
		jns[5] = "“驭灵咒”技能达到20级"
		jns[6] = "wzife.wd4"
		jns[7] = 0x058EE366
		jns[8] = 0xF83E2272
	elseif jn == "蝼蚁蚀天" then
		jns[1] = "克制凌波城弟子的必杀技。"
		jns[3] = 0
		jns[4] = "150点愤怒值"
		jns[5] = "“驭灵咒”技能达到25级，人物等级达到20级"
		jns[6] = "wzife.wd4"
		jns[7] = 0xAC0B8B61
		jns[8] = 0xAC574467
	-- 无底洞
	elseif jn == "枯骨心法" then
		jns[1] = "无效果"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 3947876534
		jns[8] = 3256658495
	elseif jn == "阴风绝章" then
		jns[1] = "无效果"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 580599606
		jns[8] = 2376753741
	 elseif jn == "鬼蛊灵蕴" then
		jns[1] = "按技能等级提高灵力"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 2137124880
		jns[8] = 642299714
	elseif jn == "燃灯灵宝" then
		jns[1] = "按技能等级提高防御力"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 2206649654
		jns[8] = 2011054851
	elseif jn == "地冥妙法" then
		jns[1] = "无效果"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 2066772317
		jns[8] = 1202816090
	elseif jn == "混元神功" then
		jns[1] = "按技能等级提伤害力"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 3367413411
		jns[8] = 2065734785
	elseif jn == "秘影迷踪" then
		jns[1] = "按技能等级提高速度"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 4041502466
		jns[8] = 2278980523
	elseif jn == "移魂化骨" then
		jns[1] = "消耗自身气血使目标获得吸血效果，持续一定回合。"
		jns[3] = 3
		jns[4] = "最大气血的10%"
		jns[5] = "“枯骨心法”技能达到20级"
		jns[6] = "wzife.wd4"
		jns[7] = 0x173015AE
		jns[8] = 0x121AC8D4
	elseif jn == "夺魄令" then
		jns[1] = "令目标一定回合内无法使用法术。"
		jns[3] = 4
		jns[4] = "30点魔法"
		jns[5] = "“阴风绝章”技能达到25级"
		jns[6] = "wzife.wd4"
		jns[7] = 0x62221B56
		jns[8] = 0x076EA85A
	elseif jn == "煞气诀" then
		jns[1] = "使目标一定回合无法做部分行动（禁止使用物理、法术、特技、法宝、物品），并且该目标不会受到攻击。可作用于敌人或队友，不能作用于自己。使用后2回合内降低自己的速度。"
		jns[3] = 4
		jns[4] = "50点魔法"
		jns[5] = "“阴风绝章”技能达到30级"
		jns[6] = "wzife.wd4"
		jns[7] = 0xC0504605
		jns[8] = 0x28D6DCD8
	elseif jn == "惊魂掌" then
		jns[1] = "使用后使对手在持续回合内无法被他人保护（天神护法、指令保护）。"
		jns[3] = 4
		jns[4] = "50点魔法"
		jns[5] = "“阴风绝章”技能达到50级"
		jns[6] = "wzife.wd4"
		jns[7] = 0xC232A281
		jns[8] = 0x71307D22
	elseif jn == "摧心术" then
		jns[1] = "使敌方2个目标速度降低，持续一定回合"
		jns[3] = 4
		jns[4] = "100点魔法"
		jns[5] = "“阴风绝章”技能达到120级，且人物飞升"
		jns[6] = "wzife.wd4"
		jns[7] = 0x1CC2B0B0
		jns[8] = 0xD6A5B20C
	elseif jn == "夺命咒" then
		jns[1] = "使用固定伤害攻击对方多个目标，目标个数=技能等级除以35+1,最多5人。"
		jns[3] = 4
		jns[4] = "20点魔法，作用多人时消耗增加"
		jns[5] = "“鬼蛊灵蕴”技能达到35级"
		jns[6] = "wzife.wd4"
		jns[7] = 0x2A3E7A3C
		jns[8] = 0xA9AF9E72
	elseif jn == "明光宝烛" then
		jns[1] = "使己方多人一定回合内大幅度提高防御力。"
		jns[3] = 3
		jns[4] = "100点魔法"
		jns[5] = "“燃灯灵宝”技能达到35级"
		jns[6] = "wzife.wd4"
		jns[7] = 0x54DB6CDE
		jns[8] = 0x59D84304
	elseif jn == "金身舍利" then
		jns[1] = "使己方多人一定回合内承受的法术伤害结果减少"
		jns[3] = 4
		jns[4] = "100点魔法"
		jns[5] = "“燃灯灵宝”技能达到120级，且人物飞升"
		jns[6] = "wzife.wd4"
		jns[7] = 0x1BE322B2
		jns[8] = 0xFE884980
	elseif jn == "地涌金莲" then
		jns[1] = "恢复自己或者队友的气血与气血上限"
		jns[3] = 3
		jns[4] = "50点魔法"
		jns[5] = "“地冥妙法”技能达到20级"
		jns[6] = "wzife.wd4"
		jns[7] = 0x40FB7647
		jns[8] = 0xF437CA2F
	elseif jn == "万木凋枯" then
		jns[1] = "克制神木林弟子的技能"
		jns[3] = 4
		jns[4] = "150点愤怒"
		jns[5] = "“地冥妙法”技能达到25级"
		jns[6] = "wzife.wd4"
		jns[7] = 0x036B4345
		jns[8] = 0xF2E06AF8
	elseif jn == "元阳护体" then
		jns[1] = "打造后为武器提升一定的气血"
		jns[3] = 12
		jns[4] = "和技能等级相同的活力"
		jns[5] = "“混元神功”技能达到25级"
		jns[6] = "wzife.wd4"
		jns[7] = 0xABD57D92
		jns[8] = 0x2EF58426
	elseif jn == "遁地术" then
		jns[1] = "平时状态下使用，可以瞬间回到自己的门派。"
		jns[3] = 0
		jns[4] = "10点气血和10点魔法"
		jns[5] = "“秘影迷踪”技能达到1级"
		jns[6] = "wzife.wd4"
		jns[7] = 0x1D14968A
		jns[8] = 0x34D061C7
	elseif jn == "惊心一剑" then
		jns[1] = "对敌人造成巨大的物理伤害并"
		jns[3] = 4
		jns[4] = "100点魔法"
		jns[6] = "wzife.wdf"
		jns[7] = 472040976
		jns[8] = 376561149
	elseif jn == "力劈华山" then
		jns[1] = "无视对方的防御使对方造成巨大的伤害"
		jns[3] = 4
		jns[4] = "150点魔法"
		jns[6] = "wzife.wdf"
		jns[7] = 3633016146
		jns[8] = 2223068576
	elseif jn == "移花接木" then
		jns[1] = "每次吸收30%的气血伤害"
		jns[3] = 7
		jns[6] = "wzife.wd1"
		jns[7] = 0x5886F7D3
		jns[8] = 0x5886F7D3
	elseif jn == "壁垒击破" then
		jns[1] = "忽视防御的攻击。攻击的目标防御，则会受到更大伤害。用此技能攻击时，会忽视“高级防御”和“防御”这两个召唤兽技能产生的技能效果。"
		jns[3] = 4
		jns[4] = "50点魔法"
		jns[6] = "wzife.wd1"
		jns[7] = 0xF1D5925A
		jns[8] = 0xF1D5925A
	elseif jn == "神迹" then
		jns[1] = "每回合结束时自动解除一切异常状态"
		jns[3] = 7
		jns[6] = "wzife.wdf"
		jns[7] = 1245429649
		jns[8] = 1198707975
	elseif jn == "雷击" then
		jns[1] = "雷属性的攻击法术，按召唤兽等级附加一定的法术伤害"
		jns[3] = 4
		jns[4] = "30点魔法"
		jns[6] = "wzife.wdf"
		jns[7] = 3336994935
		jns[8] = 2495588313
	elseif jn == "上古灵符" then
		jns[1] = "给予对手巨大的法术波动伤害"
		jns[3] = 4
		jns[4] = "100点魔法"
		jns[6] = "wzife.wdf"
		jns[7] = 0xAA1341AF
		jns[8] = 0xAA1341AF
	elseif jn == "善恶有报" then
		jns[1] = "攻击时有一定几率给予对手造成双倍的伤害，也有可能为对方恢复一定气血"
		jns[3] = 4
		jns[4] = "100点魔法"
		jns[6] = "wzife.wdf"
		jns[7] = 641427651
		jns[8] = 1898344999
	elseif jn == "死亡召唤" then
		jns[1] = "给予对手巨大的伤害，并且使对手处于死亡禁锢状态下，该状态存在时使鬼魂术无效并且不能使用药品进行复活。"
		jns[3] = 4
		--jns[4] = "50点魔法"
		jns[6] = "wzife.wdf"
		jns[7] = 1218594609
		jns[8] = 4279125360
	elseif jn == "夜舞倾城" then
		jns[1] = "造成速度6倍的巨大伤害，不受高级强力、高级敏捷以外的技能加成，并且不可暴击。"
		jns[3] = 4
		jns[4] = "100点魔法"
		jns[6] = "wzife.wdf"
		jns[7] = 387579012
		jns[8] = 1832394806
	elseif jn == "灵能激发" then
		jns[1] = "进入战斗后，临时提高自己的法术伤害能力。（法力点数越高效果越好，持续5回合）"
		jns[3] = 7
		jns[6] = "wzife.wd1"
		jns[7] = 0x400FF62B
		jns[8] = 0x0DB9B664
	elseif jn == "盾气" then
		jns[1] = "进入战斗后，临时提高其等级*1.2的防御能力（持续6回合）"
		jns[3] = 7
		jns[6] = "wzife.wd2"
		jns[7] = 0x04B409B4
		jns[8] = 0x04B409B4
	elseif jn == "高级盾气" then
		jns[1] = "进入战斗后，则提高其等级*1.5的防御能力（持续6回合）"
		jns[3] = 7
		jns[6] = "wzife.wd2"
		jns[7] = 0x8EC237B5
		jns[8] = 0x8EC237B5
	elseif jn == "合纵" then
		jns[1] = "本方每有一种与其不同的召唤兽，则提高其等级#W//5.5的物理伤害结果。同时，灵降低10%"
		jns[3] = 7
		jns[6] = "wzife.wd4"
		jns[7] = 0xA94D8FEA
		jns[8] = 0xA94D8FEA
	elseif jn == "高级合纵" then
		jns[1] = "本方每有一种与其不同的召唤兽，则提高其等级#W//4的物理伤害结果。同时，灵力降低10%"
		jns[3] = 7
		jns[6] = "wzife.wd4"
		jns[7] = 0x4EAD21FF
		jns[8] = 0x4EAD21FF
	elseif jn == "高级否定信仰" then
		jns[1] = "不受异常、辅助效果影响，受法术伤害减少20%，受到鬼魂类怪物攻击时伤害增加20%，不能同时拥有某些信仰类技能"
		jns[3] = 7
		jns[6] = "wzife.wdf"
		jns[7] = 484689261
		jns[8] = 2449787202
	elseif jn == "高级精神集中" then
		jns[1] = "精神集中，可以抵御封类异常状态，躲避力提高10%，但物理攻击能力会降低20%"
		jns[3] = 7
		jns[6] = "wzife.wdf"
		jns[7] = 3121640283
		jns[8] = 3049938323
	elseif jn == "月光" then
		jns[1] = "召唤数道月光攻击敌人，同一个人可以被多道月光攻击。"
		jns[3] = 4
		jns[4] = "100点魔法"
		jns[6] = "wzife.wd5"
		jns[7] = 0x00000022
		jns[8] = 0x00000022
	-- 特技
	elseif jn == "气疗术" then
		jns[1] = "恢复（上限3%+200）的气血，对单人使用"
		jns[3] = 3
		jns[4] = "30点愤怒"
		jns[6] = "wzife.wdf"
		jns[7] = 175234791
		jns[8] = 2394534448
	elseif jn == "心疗术" then
		jns[1] = "恢复（上限6%+400）的气血，对单人使用"
		jns[3] = 3
		jns[4] = "60点愤怒"
		jns[6] = "wzife.wdf"
		jns[7] = 1936940204
		jns[8] = 4247881671
	elseif jn == "命疗术" then
		jns[1] = "恢复（上限9%+600）的气血，对单人使用"
		jns[3] = 3
		jns[4] = "90点愤怒"
		jns[6] = "wzife.wdf"
		jns[7] = 2327070966
		jns[8] = 1214582243
	elseif jn == "凝气诀" then
		jns[1] = "恢复上限（15%+200）的魔法，对单人使用"
		jns[3] = 3
		jns[4] = "60点愤怒"
		jns[6] = "wzife.wdf"
		jns[7] = 2234398453
		jns[8] = 4231419592
	elseif jn == "凝神诀" then
		jns[1] = "恢复上限（15%+400）的魔法，对单人使用"
		jns[3] = 3
		jns[4] = "90点愤怒"
		jns[6] = "wzife.wdf"
		jns[7] = 3010398248
		jns[8] = 3594183195
	elseif jn == "气归术" then
		jns[1] = "自身恢复四分之一的气血"
		jns[3] = 5
		jns[4] = "30点愤怒"
		jns[6] = "wzife.wdf"
		jns[7] = 1743955726
		jns[8] = 1501636093
	elseif jn == "命归术" then
		jns[1] = "自身恢复二分之一的气血"
		jns[3] = 5
		jns[4] = "60点愤怒"
		jns[6] = "wzife.wdf"
		jns[7] = 2585363944
		jns[8] = 1305176222
	elseif jn == "四海升平" then
		jns[1] = "全体恢复四分之一的气血"
		jns[3] = 3
		jns[4] = "135点愤怒"
		jns[6] = "wzife.wdf"
		jns[7] = 2015850288
		jns[8] = 2239024625
	elseif jn == "回魂咒" then
		jns[1] = "单体复活"
		jns[3] = 3
		jns[4] = "100点愤怒"
		jns[6] = "wzife.wdf"
		jns[7] = 3815030652
		jns[8] = 2541979797
	elseif jn == "起死回生" then
		jns[1] = "单体复活并恢复二分之一的气血"
		jns[3] = 3
		jns[4] = "120点愤怒"
		jns[6] = "wzife.wdf"
		jns[7] = 2205777788
		jns[8] = 3279499363
	elseif jn == "水清诀" then
		jns[1] = "单体解除异常状态"
		jns[3] = 3
		jns[4] = "50点愤怒"
		jns[6] = "wzife.wdf"
		jns[7] = 1988393110
		jns[8] = 2231990553
	elseif jn == "冰清诀" then
		jns[1] = "单体解除异常状态并恢复四分之一的气血"
		jns[3] = 3
		jns[4] = "100点愤怒"
		jns[6] = "wzife.wdf"
		jns[7] = 4269368884
		jns[8] = 994373130
	elseif jn == "玉清诀" then
		jns[1] = "全体解除异常状态"
		jns[3] = 3
		jns[4] = "125点愤怒"
		jns[6] = "wzife.wdf"
		jns[7] = 2317466220
		jns[8] = 1064948127
	elseif jn == "晶清诀" then
		jns[1] = "全体解除异常状态并恢复四分之一的气血"
		jns[3] = 3
		jns[4] = "150点愤怒"
		jns[6] = "wzife.wdf"
		jns[7] = 4162645482
		jns[8] = 2183757094


	elseif jn == "罗汉金钟" then
		jns[1] = "全体队友受到的法术伤害减半，效果为3回合"
		jns[3] = 66
		jns[4] = "150点愤怒"
		jns[6] = "wzife.wd1"
		jns[7] = 0x00000001
		jns[8] = 0x00000002
	elseif jn == "圣灵之甲" then
		jns[1] = "提升我方全体的防御，效果持续到战斗结束"
		jns[3] = 66
		jns[4] = "80点愤怒"
		jns[6] = "wzife.wd1"
		jns[7] = 0x00000003
		jns[8] = 0x00000004
	elseif jn == "魔兽之印" then
		jns[1] = "提升我方全体的伤害力，效果持续到战斗结束 "
		jns[3] = 66
		jns[4] = "70点愤怒"
		jns[6] = "wzife.wd1"
		jns[7] = 0x00000005
		jns[8] = 0x00000006
	elseif jn == "光辉之甲" then
		jns[1] = "提升队友的防御，效果持续到战斗结束"
		jns[3] = 3
		jns[4] = "40点愤怒"
		jns[6] = "wzife.wd1"
		jns[7] = 0x00000007
		jns[8] = 0x00000008
	elseif jn == "太极护法" then
		jns[1] = "受到的法术伤害减半，效果为3回合 "
		jns[3] = 3
		jns[4] = "90点愤怒"
		jns[6] = "wzife.wd1"
		jns[7] = 0x00000009
		jns[8] = 0x00000010
	elseif jn == "野兽之力" then
		jns[1] = "提升队友的伤害力，效果持续到战斗结束 "
		jns[3] = 3
		jns[4] = "70点愤怒"
		jns[6] = "wzife.wd1"
		jns[7] = 0x00000011
		jns[8] = 0x00000012
	elseif jn == "慈航普渡" then
		jns[1] = "复活我方全体队友。"
		jns[3] = 66
		jns[4] = "150点愤怒"
		jns[6] = "wzife.wd1"
		jns[7] = 0x00000013
		jns[8] = 0x00000014
	elseif jn == "八凶法阵" then
		jns[1] = "超级赤焰兽专属技能，发动法术攻击4个敌人。"
		jns[3] = 4
		jns[4] = "作用目标*30点魔法"
		jns[6] = "wzife.wd1"
		jns[7] = 0x00000015
		jns[8] = 0x00000016
	elseif jn == "叱咤风云" then
		jns[1] = "水系法术攻击目标和两个随机目标，提高法术连击的伤害，法术连击可无限重复触发。"
		jns[3] = 4
		jns[4] = "100点魔法"
		jns[6] = "wzife.wd1"
		jns[7] = 0x00000017
		jns[8] = 0x00000018
	elseif jn == "净台妙谛" then --1
		jns[1] = "增加自身体质*成长*2的气血。"
		jns[3] = 7
		jns[6] = "wzife.wd1"
		jns[7] = 0x00000019
		jns[8] = 0x00000020
	elseif jn == "法术防御" then
		jns[1] = "极强的法术防御技能。可以防御法术攻击，减少65%的法术伤害，但无法防御物理攻击。"
		jns[3] = 66
		jns[4] = "100点魔法"
		jns[6] = "wzife.wd1"
		jns[7] = 0x00000021
		jns[8] = 0x00000022
	elseif jn == "理直气壮" then --1
		jns[1] = "普通攻击时，40%的几率攻击3次；但物理伤害效果降低20%。"
		jns[3] = 7
		jns[6] = "wzife.wd1"
		jns[7] = 0x00000023
		jns[8] = 0x00000024
	elseif jn == "天降灵葫" then
		jns[1] = "群体法术攻击，随机攻击1~5个目标，最多5人。"
		jns[3] = 4
		jns[4] = "100点魔法"
		jns[6] = "wzife.wd1"
		jns[7] = 0x00000025
		jns[8] = 0x00000026
	elseif jn == "灵能激发" then --1
		jns[1] = "进入战斗后，提高自己的法术伤害能力。（魔力点数越高效果越好，持续到战斗结束）"
		jns[3] = 7
		jns[6] = "wzife.wd1"
		jns[7] = 0x00000027
		jns[8] = 0x00000028
	elseif jn == "高级法术抵抗" then --1
		jns[1] = "减少10%所受的法术伤害，但同时物理伤害能力减少10%。"
		jns[3] = 7
		jns[6] = "wzife.wd1"
		jns[7] = 0x00000029
		jns[8] = 0x00000030
	elseif jn == "灵山禅语" then
		jns[1] = "增加自身魔力*（成长-0.3）的法防。" --1
		jns[3] = 7
		jns[6] = "wzife.wd1"
		jns[7] = 0x00000031
		jns[8] = 0x00000032
	elseif jn == "观照万象" then
		jns[1] = "使用所有主动技能进攻目标,冷却回合10回合。"
		jns[3] = 4
		jns[4] = "200点魔法"
		jns[6] = "wzife.wd1"
		jns[7] = 0x00000033
		jns[8] = 0x00000034
	elseif jn == "弱点击破" then
		jns[1] = "单体无视一半防御攻击"
		jns[3] = 4
		jns[4] = "50点愤怒"
		jns[6] = "wzife.wdf"
		jns[7] = 4136547665
		jns[8] = 2136234800
	elseif jn == "冥王爆杀" then
		jns[1] = "减少对方气血，最小伤害为50"
		jns[3] = 4
		jns[4] = "60点愤怒"
		jns[6] = "wzife.wdf"
		jns[7] = 0x59DBD730
		jns[8] = 0x59DBD730

   	elseif jn == "冥王暴杀" then
		jns[1] = "减少对方气血，最小伤害为50"
		jns[3] = 4
		jns[4] = "60点愤怒"
		jns[6] = "wzife.wdf"
		jns[7] = 0x59DBD730
		jns[8] = 0x59DBD730


	elseif jn == "破血狂攻" then
		jns[1] = "狂性大发，可以连续攻击两次"
		jns[3] = 4
		jns[4] = "50点愤怒"
		jns[6] = "wzife.wdf"
		jns[7] = 4254723553
		jns[8] = 326320655
  elseif jn == "破碎无双" then
		jns[1] = "狂性大发，可以连续攻击两次"
		jns[3] = 4
		jns[4] = "50点愤怒"
		jns[6] = "wzife.wdf"
		jns[7] = 4254723553
		jns[8] = 326320655



	elseif jn == "破甲术" then
		jns[1] = "降低敌人的物理防御力，效果持续到战斗结束"
		jns[3] = 4
		jns[4] = "35点愤怒"
		jns[6] = "wzife.wdf"
		jns[7] = 1415639395
		jns[8] = 752055472
	elseif jn == "碎甲术" then
		jns[1] = "降低敌方全体的物理防御力，效果持续到战斗结束"
		jns[3] = 4
		jns[4] = "80点愤怒"
		jns[6] = "wzife.wdf"
		jns[7] = 1415639395
		jns[8] = 752055472
	elseif jn == "放下屠刀" then
		jns[1] = "降低敌人的物理攻击力，效果持续到战斗结束"
		jns[3] = 4
		jns[4] = "30点愤怒"
		jns[6] = "wzife.wdf"
		jns[7] = 3659778884
		jns[8] = 441260658
	elseif jn == "笑里藏刀" then
		jns[1] = "减少敌方单体目标70点愤怒"
		jns[3] = 4
		jns[4] = "40点愤怒"
		jns[6] = "wzife.wdf"
		jns[7] = 3659778884
		jns[8] = 441260658
	elseif jn == "河东狮吼" then
		jns[1] = "降低敌方全体的物理攻击力，效果持续到战斗结束"
		jns[3] = 4
		jns[4] = "100点愤怒"
		jns[6] = "wzife.wdf"
		jns[7] = 4154480125
		jns[8] = 1389260370
	-- 奇经八脉
	-- 方寸山
	elseif jn == "苦缠" then
		jns[1] = "失魂符、失心符、定身符降低属性的效果增加3%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xE99E9C96
		jns[8] = 0xE99E9C96
	elseif jn == "雷动" then
		jns[1] = "使用落雷符时增加100点伤害。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xD2180C25
		jns[8] = 0xD2180C25
	elseif jn == "奔雷" then
		jns[1] = "使用五雷咒时，额外攻击另一个敌方目标。自身封印命中率下降15%。霹雳咒等级≥125时，首目标额外提高10%伤害。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xB490BD29
		jns[8] = 0xB490BD29
	elseif jn == "黄粱" then
		jns[1] = "敌方目标被自己催眠时。必须受到100点以上的伤害才会苏醒。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xD3CF1A9E
		jns[8] = 0xD3CF1A9E
	elseif jn == "不舍" then
		jns[1] = "每受到大于气血上限20%的物理伤害后，会自动使用归元咒，被封印时无法触发。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xB60A561A
		jns[8] = 0xB60A561A
	elseif jn == "鬼怮" then
		jns[1] = "五雷咒提升对含有鬼魂术的敌人伤害提高30%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xB44BA05E
		jns[8] = 0xB44BA05E
	elseif jn == "补缺" then
		jns[1] = "回合开始时，若自身魔法小于魔法上限30%时，有35%几率回复乾天罡气同等量的魔法"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x3A33F2CD
		jns[8] = 0x3A33F2CD
	elseif jn == "不倦" then
		jns[1] = "催眠符命中效果增加20%"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xA2F9E185
		jns[8] = 0xA2F9E185
	elseif jn == "集中" then
		jns[1] = "提升(武器伤害/命中)*24的灵力。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xA2F9E185
		jns[8] = 0xA2F9E185
	elseif jn == "不灭" then
		jns[1] = "每次使用完封印类法术时，有15%的几率自动使用技能归元咒并在一定回合内提高自身10%的防御和灵力"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xAE728B11
		jns[8] = 0xAE728B11
	elseif jn == "化身" then
		jns[1] = "分身术持续回合数提高1回合"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xE950182D
		jns[8] = 0xE950182D
	--[[elseif jn == "调息" then
		jns[1] = "带有分身术状态时，回合结束恢复气血上限*4%的气血与魔法上限*3%的魔法"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x2ACC6068
		jns[8] = 0x2ACC6068 --]]
	elseif jn == "批亢" then
		jns[1] = "带有分身术状态时，所受伤害降低15%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x200F0880
		jns[8] = 0x200F0880
	elseif jn == "斗法" then
		jns[1] = "增加10%的封印命中率。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x1EEA41F8
		jns[8] = 0x1EEA41F8
	elseif jn == "吐纳" then
		jns[1] = "主动使用的归元咒将额外恢复气血上限*20%的气血，但额外消耗对应值*25%的魔法值。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x47BCA30B
		jns[8] = 0x47BCA30B
	elseif jn == "飞符炼魂" then
		jns[1] = "一道法力强大的符咒，能在攻击敌人的同时附加封印效果，由于效果惊人，菩提祖师禁止弟子随意使用。使用法术攻击目标后70%几率追加使用法术落魄符，并额外造成300点伤害。"
		jns[3] = 4
		jns[4] = "60点魔法"
		jns[6] = "wzife.wd2"
		jns[7] = 0x4C6405CB
		jns[8] = 0x4C6405CB
		jns[12] = '5回合'
	elseif jn == "鬼念" then
		jns[1] = "含有鬼魂术(包括高级鬼魂术)类的敌人降低对自身造成伤害的15%"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0x173015AE
		jns[8] = 0x173015AE
	elseif jn == "碎甲" then
		jns[1] = "使碎甲符作用人数提高3人，持续回合数增加1回合。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xF701C5B5
		jns[8] = 0xF701C5B5
	elseif jn == "摧心" then
		jns[1] = "当自身对目标造成物理伤害之后，目标概率会在之后的3回合内进入虚弱状态，降低10%的伤害力、灵力和物理防御。该效果的持续回合可以被刷新。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xF2BAFEF2
		jns[8] = 0xF2BAFEF2
	elseif jn == "顺势而为" then
		jns[1] = "精于封印的方寸弟子可以耗费一定的愤怒值对目标施加强大的法力，在下一次使用封系符咒时100%封印目标，封印效果持续3回合。"
		jns[3] = 4
		jns[4] = "60点愤怒"
		jns[6] = "wzife.wd2"
		jns[7] = 0x9E6FFF66
		jns[8] = 0x9E6FFF66
		jns[12] = "5回合"
	elseif jn == "钟馗论道" then
		jns[1] = "方寸弟子乃鬼魂生物的噩梦，他们甚至能够临时将自己善于对付鬼魂生物的能力赋予其队友。给己方指定成员（包括召唤兽）附加驱鬼技能状态"
		jns[3] = 3
		jns[4] = "40点魔法"
		jns[6] = "wzife.wd2"
		jns[7] = 0xB7CDB6AA
		jns[8] = 0xB7CDB6AA
	-- 女儿
	elseif jn == "自矜" then
		jns[1] = "每次使用单体封印技能失败时，使得下次单体封印时成功率提高30%。到下一次命中时清空该效果。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x22A77A43
		jns[8] = 0x22A77A43
	elseif jn == "暗伤" then
		jns[1] = "雨落寒沙增加武器伤害*18%的固定伤害。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x50E3D938
		jns[8] = 0x50E3D938
	elseif jn == "杏花" then
		jns[1] = "使用雨落寒沙技能攻击时对方中毒几率增加4%。并且能对带有“高级毒”的单位起效。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x30B186DD
		jns[8] = 0x30B186DD
	elseif jn == "花舞" then
		jns[1] = "每回合开始时提升自身6%的初始速度,持续到战斗结束。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xD5669AE4
		jns[8] = 0xD5669AE4
	elseif jn == "倩影" then
		jns[1] = "提升自己50点速度。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x86C6B8EF
		jns[8] = 0x86C6B8EF
	elseif jn == "淬芒" then
		jns[1] = "每一次你使对方中毒，都可以为自己增加4%的封印命中率，封印对方时，封印命中率将重置"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x20661796
		jns[8] = 0x20661796
	elseif jn == "傲娇" then
		jns[1] = "使用特技时，愤怒消耗减少5点。使用笑里藏刀时，愤怒消耗额外减少6点。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x53DABF54
		jns[8] = 0x53DABF54
	elseif jn == "花护" then
		jns[1] = "使用水清诀、冰清诀、晶清诀、玉清诀时，愤怒消耗减少8点，并且可以使目标100%抵抗封类法术，持续一回合。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xC412A4C0
		jns[8] = 0xC412A4C0
	elseif jn == "天香" then
		jns[1] = "每次使对方中毒，你回复5点愤怒。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x2AD7F908
		jns[8] = 0x2AD7F908
	elseif jn == "国色" then
		jns[1] = "召唤兽进入战斗时速度增加12%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x0D719443
		jns[8] = 0x0D719443
	elseif jn == "鸿影" then
		jns[1] = "若处于被封印状态，仍然可以使用雨落寒沙技能。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x25260F44
		jns[8] = 0x25260F44
	elseif jn == "轻霜" then
		jns[1] = "任何企图攻击你的对手都有30%在攻击时受到毒的影响，每回合损失毒经技能等级*3的气血，持续4回合，该状态不可叠加。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x848E3B4F
		jns[8] = 0x848E3B4F
	elseif jn == "机巧" then
		jns[1] = "每次你的封印成功时，敌方会受到毒的影响，每回合损失毒经技能等级*3的气血，持续4回合，该状态不可叠加。（仅封印回合有效）"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xE6EF1BBC
		jns[8] = 0xE6EF1BBC
	elseif jn == "毒引" then
		jns[1] = "对手主动解除由女儿村弟子产生的毒效果时，会额外受到600点气血损失，但最低将对手气血降为1点。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x57BD8D19
		jns[8] = 0x57BD8D19
	elseif jn == "毒雾" then
		jns[1] = "使用封印技能时，有30%几率使目标中毒。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xA3E0CA7F
		jns[8] = 0xA3E0CA7F
	elseif jn == "嫣然" then
		jns[1] = "一笑倾城和似玉生香的命中率提高12%，对每个目标的持续回合有60%的几率提升1回合。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x463DBA13
		jns[8] = 0x463DBA13
	elseif jn == "磐石" then
		jns[1] = "一个回合中，受到一个目标的伤害后，之后每次所受其他目标的伤害会递减50点。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x4F264E2A
		jns[8] = 0x4F264E2A
	elseif jn == "花殇" then
		jns[1] = "飞花摘叶目标人数提高3人，持续回合提高一回合，且命中几率提高5%"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x3590A7E4
		jns[8] = 0x3590A7E4
	elseif jn == "碎玉弄影" then
		jns[1] = "“宁为玉碎，不为瓦全”，又有多少对手可以从女儿村弟子曼妙的舞姿身影中体味那一份决绝呢？以牺牲4%的封印命中率对目标使用似玉生香，若第一次不中，则可以触发第二次，第二次也牺牲4%的封印命中率。"
		jns[3] = 4
		jns[4] = "40点愤怒"
		jns[6] = "wzife.wd2"
		jns[7] = 0x347D755D
		jns[8] = 0x347D755D
		jns[12] = "5回合"
	elseif jn == "额外能力" then
		jns[1] = "学习“碎玉弄影”以后，每个额外乾元丹会增加40点封印命中等级，学习“鸿渐于陆”以后，每个额外的乾元丹会增加80点抵抗封妖等级。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xA209C3C2
		jns[8] = 0xA209C3C2
	elseif jn == "鸿渐于陆" then
		jns[1] = "伤其十指，不如断其一指。必要的时刻可以将伤害凝聚起来，给予对手一次致命的攻击。附加武器伤害*130%的伤害对对手单体进行攻击，使目标有100%率中毒。"
		jns[3] = 4
		jns[4] = "100点魔法"
		jns[6] = "wzife.wd2"
		jns[7] = 0x18D93692
		jns[8] = 0x18D93692
		jns[12] = "4回合"
	-- 神木林
	elseif jn == "风灵" then
		jns[1] = "每次使用落叶萧萧攻击时，每命中一个目标都有48%的几率使施法者获得风灵效果，风灵效果持续到战斗结束，最高可叠加10层；施法者进行法术攻击时额外增加风灵层数*瞬息万变技能等级*0.1的法术攻击伤害力。"
		jns[6] = "wzife.wd4"
		jns[7] = 0x4BB78E6D
		jns[8] = 0x4BB78E6D
	elseif jn == "法身" then
		jns[1] = "你的落叶萧萧在对目标施放时会额外作用一个单位。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0xC3E2C628
		jns[8] = 0xC3E2C628
	elseif jn == "咒术" then
		jns[1] = "同时被落叶萧萧命中的目标有25%几率获得“雾杀”效果。如果目标带有雾杀效果，且目标雾杀效果消失时会为施法者附加一层“雾痕”的效果，雾痕会使施法者增加雾痕层数*0.1*巫咒技能等级的法术伤害，但雾痕效果最高叠加6层"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0xDBFE0302
		jns[8] = 0xDBFE0302
	elseif jn == "灵压" then
		jns[1] = "法术攻击类技能伤害结果提高8%。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0x8BE68718
		jns[8] = 0x8BE68718
	elseif jn == "咒法" then
		jns[1] = "巫咒等级≥人物等级时，增加60点法术伤害力。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0xE17F1C2E
		jns[8] = 0xE17F1C2E
	elseif jn == "蔓延" then
		jns[1] = "使用荆棘舞时会消耗自身所有的雾痕，每层雾痕额外增加30点伤害效果"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0xDA21274D
		jns[8] = 0xDA21274D
	elseif jn == "鞭挞" then
		jns[1] = "荆棘舞会额外增加“万灵诸念”等级*风灵层数*0.3的法术伤害力。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0x2AAB3A47
		jns[8] = 0x2AAB3A47
	elseif jn == "月影" then
		jns[1] = "星月之惠效果增加20%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x95F03B6B
		jns[8] = 0x95F03B6B
	elseif jn == "不侵" then
		jns[1] = "带有“炎护”时，攻击你的目标有50%的几率被附加“雾杀”效果。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0x51C241BE
		jns[8] = 0x51C241BE
	elseif jn == "风魂" then
		jns[1] = "战斗中提升自身风灵层数*10的防御。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0xD53A237C
		jns[8] = 0xD53A237C
	elseif jn == "冰锥" then
		jns[1] = "当使用冰川怒成功冰冻目标时有几率将是施法者身上的雾痕层数提高一倍；当冰川怒对触发过“高级神佑复生”或“神佑复生”的目标时将附加风灵层数*15的伤害值。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0x83D1EA06
		jns[8] = 0x83D1EA06
	elseif jn == "血契" then
		jns[1] = "使用血雨时会消耗自身全部的雾痕印记，但会额外对目标使用一次血雨，且使用血雨时无需休息并且会附加200点的固定伤害，但同时自身会再次消耗200点魔法。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0x1A899ACD
		jns[8] = 0x1A899ACD
	elseif jn == "滋养" then
		jns[1] = "使用蜜润时，会为目标额外回复自身一定的魔法"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0x82DE1BB0
		jns[8] = 0x82DE1BB0
	elseif jn == "纯净" then
		jns[1] = "进入战斗时临时提高万物轮转等级*2的气血上限"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0x8E6B4692
		jns[8] = 0x8E6B4692
	elseif jn == "破杀" then
		jns[1] = "“雾杀”在消失时会发生爆炸，爆炸产生的伤害为最后回合本应造成伤害的150%。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0xE567BAAB
		jns[8] = 0xE567BAAB
	elseif jn == "追击" then
		jns[1] = "当使用尘土刃时有风灵层数*5%的几率对额外的一个目标造成50%的伤害。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0xCE2EEB29
		jns[8] = 0xCE2EEB29
	elseif jn == "灵能" then
		jns[1] = "使用落叶萧萧将有30%的几率对目标额外造成(施法者灵力#W//瞬息万变技能等级)*5的伤害"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0xF316F196
		jns[8] = 0xF316F196
	elseif jn == "寄生" then
		jns[1] = "使用尘土刃时将会引爆目标身上的所有雾痕印记，每层印记造成75点的固定伤害。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0x92FE057C
		jns[8] = 0x92FE057C
	elseif jn == "风卷残云" then
		jns[1] = "神木林在觉醒，风在咆哮！大风带着神木林弟子的怒意无情的打击面前的敌人。对目标使用一次落叶萧萧技能，并且对目标附加风灵印记层数*50点的固定伤害。"
		jns[3] = 4
		jns[4] = "150点魔法"
		jns[6] = "wzife.wd4"
		jns[7] = 0x3778487D
		jns[8] = 0x3778487D
		jns[12] = "5回合"
	elseif jn == "凋零之歌" then
		jns[1] = "歌声飘进敌人的耳中，颤动着敌人心窝，在无形中侵袭着敌阵的斗志，埋下毁灭之种。目标接下来2回合受到的法术伤害增加16%，若目标带有雾杀效果，则引爆雾杀效果，否则只能造成100点伤害；并使对手随机3个未带雾杀效果的目标获得雾杀效果。"
		jns[3] = 4
		jns[4] = "100点魔法"
		jns[6] = "wzife.wd4"
		jns[7] = 0x281E732A
		jns[8] = 0x281E732A
		jns[12] = "8回合"
	-- 化生寺
	elseif jn == "止戈" then
		jns[1] = "在原恢复技能的治疗量上再增加自身武器伤害*18%的治疗量。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x96670F08
		jns[8] = 0x96670F08
	elseif jn == "销武" then
		jns[1] = "唧唧歪歪所造成的伤害将提高与人物等级同等的伤害量"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x9A717CB4
		jns[8] = 0x9A717CB4
	elseif jn == "佛屠" then
		jns[1] = "金刚护法的的增益效果将在原始效果上再次增加武器伤害的9%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x32BE260B
		jns[8] = 0x32BE260B
	elseif jn == "佛誉" then
		jns[1] = "活血效果提高20%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xF28C8F12
		jns[8] = 0xF28C8F12
	elseif jn == "仁心" then
		jns[1] = "使用活血时有20%的几率使活血的功效增加100%，但会额外消耗100点魔法。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x265842A6
		jns[8] = 0x265842A6
	elseif jn == "聚气" then
		jns[1] = "每次使用恢复类门派技能时，都将会获得一层聚气印记，每层聚气印记将额外提高辅助类门派技能的功效9%"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x86873B99
		jns[8] = 0x86873B99
	elseif jn == "佛显" then
		jns[1] = "推气过宫治疗效果提升10%"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x8D52FE90
		jns[8] = 0x8D52FE90
	elseif jn == "心韧" then
		jns[1] = "在使用推气过宫时有15%的几率使治疗效果增加100%，但同时也将额外消耗150点魔法。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x823DD991
		jns[8] = 0x823DD991
	elseif jn == "归气" then
		jns[1] = "自身所有的治疗类技能都将额外增加10%的消耗，但是治疗效果将增加8%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x369BD94B
		jns[8] = 0x369BD94B
	elseif jn == "天照" then
		jns[1] = "每次使用舍身取义时都将有20%的几率恢复75点魔法，但将额外扣除75点气血。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xE1910A2F
		jns[8] = 0xE1910A2F
	elseif jn == "舍利" then
		jns[1] = "自身死亡后，己方队员随机一名队员将增加自身与自身愤怒同等的愤怒量，但是最高不会超过120点，一场战斗最多触发3次此效果."
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xEE1C323A
		jns[8] = 0xEE1C323A
	elseif jn == "感念" then
		jns[1] = "使用舍身取义时，临时提升目标物理防御及法术防御10%，持续3回合，不可叠加。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xDC31E128
		jns[8] = 0xDC31E128
	elseif jn == "慈针" then
		jns[1] = "使用我佛慈悲可以使自身获得30点愤怒。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xFD3253DA
		jns[8] = 0xFD3253DA
	elseif jn == "佛性" then
		jns[1] = "我佛慈悲可以增加目标80点物理防御及法术防御，持续5回合。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x5D47F1F4
		jns[8] = 0x5D47F1F4
	elseif jn == "妙悟" then
		jns[1] = "恢复目标人物等级*3的气血及等级*2的魔法。同时自身会触发一次一苇渡江效果"
		jns[3] = 3
		jns[4] = "50点魔法"
		jns[6] = "wzife.wd2"
		jns[7] = 0x2F3B9A81
		jns[8] = 0x2F3B9A81
		jns[12] = "5回合"
	elseif jn == "慈心" then
		jns[1] = "使用慈航普度时消耗的愤怒减少40点。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x5816C756
		jns[8] = 0x5816C756
	elseif jn == "映法" then
		jns[1] = "金刚护法、金刚护体、一苇渡江有50%几率对所有单位起效。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xC8D9EE20
		jns[8] = 0xC8D9EE20
	elseif jn == "流刚" then
		jns[1] = "金刚护法、金刚护体、一苇渡江的效果增加20%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x067D652B
		jns[8] = 0x067D652B
	elseif jn == "渡劫金身" then
		jns[1] = "每次使用治疗类技能有10%的几率实现双倍恢复；且治疗效果将增加15%，但治疗类技能每作用一个目标，会额外消耗40点魔法。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x3819B112
		jns[8] = 0x3819B112
	elseif jn == "额外能力" then
		jns[1] = "学习“渡劫金身”以后，每个额外能力的乾元丹会增加30点治疗能力，学习“诸天看护”以后，每个额外的乾元丹会增加80点法术防御。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xA209C3C2
		jns[8] = 0xA209C3C2
	elseif jn == "诸天看护" then
		jns[1] = "给目标附加一个状态，该状态使目标将所受到的所有伤害减少50%，持续1个回合，并为目标附加反震状态，持续5回合。"
		jns[3] = 3
		jns[4] = "100点魔法"
		jns[6] = "wzife.wd2"
		jns[7] = 0xED073209
		jns[8] = 0xED073209
		jns[12] = "5回合"
	-- 大唐官府
	elseif jn == "目空" then
		jns[1] = "大唐官府，使用特技翩鸿一击、后发制人时无视对手10%的防御"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x72ED61A1
		jns[8] = 0x72ED61A1
	elseif jn == "风刃" then
		jns[1] = "大唐官府，普通攻击时可以对其他任意三个单位造成等级*3的伤害"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xF97A7093
		jns[8] = 0xF97A7093
	elseif jn == "扶阵" then
		jns[1] = "大唐官府，使队伍每个人的阵法加成效果在原数值提升3%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xD5131E6F
		jns[8] = 0xD5131E6F
	elseif jn == "翩鸿一击" then
		jns[1] = "兵贵神速，对敌人造成135%的伤害，并且提高下回合15%的速度。"
		jns[3] = 4
		jns[4] = "50点魔法"
		jns[6] = "wzife.wd2"
		jns[7] = 0x30E001D4
		jns[8] = 0x30E001D4
		jns[12] = "5回合"
	elseif jn == "勇武" then
		jns[1] = "后发制人将获得以下额外效果：额外增加防御值40%的伤害结果；使用时不消耗气血，转而使自己增加气血上限*15%的气血（最高为人物等级*8）；使用时增加自身10点愤怒。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x265842A6
		jns[8] = 0x265842A6
	elseif jn == "长驱直入" then
		jns[1] = "以迅雷不及掩耳之势切入战场，给敌军最薄弱的环节予以致命一击，电光火石之间令对手甚至来不及做出反应，无法施展保护，造成110%伤害并有60%几率降低敌人10%的防御。"
		jns[3] = 4
		jns[4] = "50点魔法"
		jns[6] = "wzife.wd2"
		jns[7] = 0xAB6EA7B4
		jns[8] = 0xAB6EA7B4
		jns[12] = "4回合"
	elseif jn == "杀意" then
		jns[1] = "触发物理必杀时。必杀伤害增加20%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xBB962DBE
		jns[8] = 0xBB962DBE
	elseif jn == "念心" then
		jns[1] = "攻击目标且自身召唤兽为在场时，额外增加10%必杀率。（鬼魂倒地视为未在场）"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xAB64E8CF
		jns[8] = 0xAB64E8CF
	elseif jn == "静岳" then
		jns[1] = "处于后发制人或者横扫千军，破釜沉舟的休息状态时，所受伤害减少150点。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xB363459E
		jns[8] = 0xB363459E
	elseif jn == "干将" then
		jns[1] = "使用破斧沉舟技能时有20%的几率额外增加一个伤害目标。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x01C779BC
		jns[8] = 0x01C779BC
	elseif jn == "勇念" then
		jns[1] = "使用横扫千军时，忽略目标10%防御。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x2EF39CEC
		jns[8] = 0x2EF39CEC
	elseif jn == "神凝" then
		jns[1] = "自身提高10%抗封印率。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x9640C6B0
		jns[8] = 0x9640C6B0
	elseif jn == "狂狷" then
		jns[1] = "将自身（力量属性/耐力属性）*16转化为伤害力。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xAFA63BA0
		jns[8] = 0xAFA63BA0
	elseif jn == "不惊" then
		jns[1] = "额外忽视目标自身武器宝石锻造等级*5的防御。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x8F6C13D3
		jns[8] = 0x8F6C13D3
	elseif jn == "突进" then
		jns[1] = "每回合开始时有45%的几率触发，提升自身防御值8%的伤害力。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xA839BBD0
		jns[8] = 0xA839BBD0
	elseif jn == "破空" then
		jns[1] = "使用破釜沉舟时，对目标造成目标防御*0.3的额外伤害。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x0821ADC7
		jns[8] = 0x0821ADC7
	elseif jn == "历战" then
		jns[1] = "带有“安神决”时，受到的法术伤害降低50%。安神诀有70%几率抵抗驱散效果。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x438B3BD1
		jns[8] = 0x438B3BD1
	elseif jn == "连破" then
		jns[1] = "横扫千军有18%几率不进入休息状态。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x8E319047
		jns[8] = 0x8E319047
	elseif jn == "无敌" then
		jns[1] = "横扫千军变为4次攻击，气血消耗额外增加10%"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x4640D75C
		jns[8] = 0x4640D75C
	elseif jn == "破军" then
		jns[1] = "使用横扫千军时每次攻击时额外增加受击目标气血最大上限的1%*攻击次序+200的伤害结果。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xDC241728
		jns[8] = 0xDC241728
	-- 阴曹地府
	elseif jn == "判官" then
		jns[1] = "判官令造成的伤害增加10%、魔法损耗增加50%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xC4A24497
		jns[8] = 0xC4A24497
	elseif jn == "回旋" then
		jns[1] = "受到包括固定伤害在内的所有法术伤害减少60点。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x299CC362
		jns[8] = 0x299CC362
	elseif jn == "夜行" then
		jns[1] = "夜间增加人物40点速度、40点伤害、50点阎罗令伤害。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x6CB4C5F1
		jns[8] = 0x6CB4C5F1
	elseif jn == "入骨" then
		jns[1] = "尸腐毒被解除时，使目标减少5%当前气血。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xB9D06801
		jns[8] = 0xB9D06801
	elseif jn == "聚魂" then
		jns[1] = "摄魂的所有基础效果增加4%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x0EF6D102
		jns[8] = 0x0EF6D102
	elseif jn == "六道无量" then
		jns[1] = "地府弟子将六道轮回之力附着在单体的物理攻击之上，令敌人避无可避。攻击时附带六道轮回技能等级×60%的伤害结果。该技能攻击玩家时，双方防御下降双方防御差*0.5（最高为自身等级*2），持续2回合。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xBC2DD56E
		jns[8] = 0xBC2DD56E
	elseif jn == "索魂" then
		jns[1] = "锢魂术命中目标后，如果目标在此锢魂术状态下死亡，都可以增加施法者锢魂术2%的命中率，上限为10%，持续到战斗结束。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xF259DD30
		jns[8] = 0xF259DD30
	elseif jn == "伤魂" then
		jns[1] = "你对带有尸腐毒的单位提高100点封印命中等级、80点物理伤害力。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xEDAB40CF
		jns[8] = 0xEDAB40CF
	elseif jn == "百炼" then
		jns[1] = "武器耐久度消耗降低50%。使用百爪狂杀时临时增加武器命中*30%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x2197928B
		jns[8] = 0x2197928B
	elseif jn == "黄泉" then
		jns[1] = "黄泉之息的减速效果增加50%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x11A0C1AE
		jns[8] = 0x11A0C1AE
	elseif jn == "毒印" then
		jns[1] = "你的六道无量和判官令将额外对一个带有尸腐毒的单位起效。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x49D3C846
		jns[8] = 0x49D3C846
	elseif jn == "百爪狂杀" then
		jns[1] = "地府弟子吸收冥界阴气，进而激发自身的暴戾之气，将对敌方进行疯狂的连击。法术驱动的物理攻击，可以攻击4个目标，每个目标单独判断命中。每增加1个攻击目标，对所有目标的伤害结果降低10%。消耗：作用人数×35MP。"
		jns[3] = 4
		jns[6] = "wzife.wd2"
		jns[7] = 0x8FCE05BE
		jns[8] = 0x8FCE05BE
	elseif jn == "幽光" then
		jns[1] = "九幽的每回合回复当前气血值的上限增加120点。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x337664F3
		jns[8] = 0x337664F3
	elseif jn == "泉爆" then
		jns[1] = "队伍中只有一个阴曹地府弟子时：每场战斗的第一次黄泉之息将造成400%的伤害。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x14AB7311
		jns[8] = 0x14AB7311
	elseif jn == "鬼火" then
		jns[1] = "每次使用特技后回复10点愤怒。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x93AE3E78
		jns[8] = 0x93AE3E78
	elseif jn == "魂飞" then
		jns[1] = "你的魂飞魄散首目标若为玩家且当回合死亡，则附加锢魂术，持续2回合。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xC415DB52
		jns[8] = 0xC415DB52
	elseif jn == "汲魂" then
		jns[1] = "每次对方玩家单位死亡，恢复自身等级*2的气血并且增加10点伤害力，持续到战斗结束。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x808E00C5
		jns[8] = 0x808E00C5
	elseif jn == "击破" then
		jns[1] = "攻击防御的目标额外增加50%伤害。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xB79CC34C
		jns[8] = 0xB79CC34C
	elseif jn == "魑魅缠身" then
		jns[1] = "地府弟子可以招来地狱深处的魑魅魍魉，被他们附身的敌人将具备鬼魂精魄的特质，在擅于驱鬼的对手面前无所遁形。为对方任意成员（单目标）附加“冤魂”状态，持续5回合，冤魂状态的效果为：1.若冤魂状态的目标为召唤兽，则被携带驱鬼技能的目标攻击时伤害增加50%，被携带高级驱鬼技能的目标攻击时伤害增加100%；2.若冤魂状态的目标为人物或者NPC时，则被携带驱鬼技能的目标攻击时伤害增加15%，被携带高级驱鬼技能的目标攻击时伤害增加30%。消耗：40点愤怒值。冷却：4回合。该技能为法术技能，受封印法术限制。该技能不能对拥有鬼魂及高级鬼魂技能的目标使用。"
		jns[3] = 4
		jns[6] = "wzife.wd2"
		jns[7] = 0x2B37D923
		jns[8] = 0x2B37D923
	elseif jn == "夜之王者" then
		jns[1] = "黑夜是属于我的！技能“百爪狂杀”附加六道轮回技能等级*60%的伤害结果。夜晚的必杀几率增加10%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x5192EAE6
		jns[8] = 0x5192EAE6
	-- 盘丝洞
	elseif jn == "鼓乐" then
		jns[1] = "魔音摄魂的命中率增加20%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xC17A7A56
		jns[8] = 0xC17A7A56
	elseif jn == "妖气" then
		jns[1] = "增加武器伤害*12%的封印命中等级。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xB3956495
		jns[8] = 0xB3956495
	elseif jn == "怜心" then
		jns[1] = "姐妹同心的命中率增加12%。队伍中只有一个盘丝洞弟子时：每场战斗的第一次姐妹同心必中。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x38D87BEB
		jns[8] = 0x38D87BEB
	elseif jn == "迷瘴" then
		jns[1] = "使用含情脉脉命中目标后，吸取目标5项属性中最高项所对应的主能力4%给自己，持续5回合。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x661970E1
		jns[8] = 0x661970E1
	elseif jn == "粘附" then
		jns[1] = "增加武器伤害*18%的天罗地网伤害。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xD2180C25
		jns[8] = 0xD2180C25
	elseif jn == "意乱" then
		jns[1] = "使用魔音摄魂命中目标时，目标不能回复魔法值。（当与其他封印效果叠加时，回魔效果变为40%。）"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x0B95DA6D
		jns[8] = 0x0B95DA6D
	elseif jn == "绝殇" then
		jns[1] = "被自己封印的目标在解除封印时获得的气血回复降低100%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x72B48AE0
		jns[8] = 0x72B48AE0
	elseif jn == "安抚" then
		jns[1] = "战斗中使用药品的效果增加15%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x756CE723
		jns[8] = 0x756CE723
	elseif jn == "忘忧" then
		jns[1] = "封印住目标后，每回合开始时目标损失60点魔法值，直到封印解除。若因此效果导致魔法值为0，则额外受到目标等级*3的气血伤害。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x59ED800F
		jns[8] = 0x59ED800F
	elseif jn == "忘川" then
		jns[1] = "当目标力量点大于等级*4或者魔力点大于等级*4时，含情脉脉额外增加8%的命中几率。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xBAA9AF30
		jns[8] = 0xBAA9AF30
	elseif jn == "迷梦" then
		jns[1] = "幻镜术可以将法术反弹两次给敌方任意目标，并且减少2个冷却回合。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xD713CFD8
		jns[8] = 0xD713CFD8
	elseif jn == "倾情" then
		jns[1] = "使用姐妹同心成功后，如果目标的魔法值为0，则有45%的几率额外施放一次含情脉脉技能。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xF28C8F12
		jns[8] = 0xF28C8F12
	elseif jn == "情劫" then
		jns[1] = "瘴气持续回合数增加3。同时带有瘴气的目标在解除瘴气时获得的气血恢复受瘴气影响。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x949B1634
		jns[8] = 0x949B1634
	elseif jn == "脱壳" then
		jns[1] = "自身所受到敌方任意持续回合≥5的负面持续性法术时，持续回合变为5回合。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xFF0081A3
		jns[8] = 0xFF0081A3
	elseif jn == "迷意" then
		jns[1] = "带有瘴气的目标受到的回魔效果降低30%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x1A6D023E
		jns[8] = 0x1A6D023E
	elseif jn == "结阵" then
		jns[1] = "你的盘丝阵效果增加200%，但持续回合数减少3。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x93AE3E78
		jns[8] = 0x93AE3E78
	elseif jn == "媚态" then
		jns[1] = "你的勾魂、摄魄必定命中；你使用瘴气时，清除目标身上的寡欲令。"
		jns[3] = 8
		jns[6] = "wzife.wd3"
		jns[7] = 0x26A40C6E
		jns[8] = 0x26A40C6E
	elseif jn == "利刃" then
		jns[1] = "对方阵营所有目标每回合结束时损失30点魔法值。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x8282C7D1
		jns[8] = 0x8282C7D1
	elseif jn == "落花成泥" then
		jns[1] = "靡靡之音进入敌人耳际，使目标下回合彷徨不知所措、额外受到15%伤害，同时80%几率无法行动。（不受化生寺门派特色影响）。消耗：40点愤怒值。"
		jns[3] = 4
		jns[6] = "wzife.wd2"
		jns[7] = 0x4D94B673
		jns[8] = 0x4D94B673
	elseif jn == "偷龙转凤" then
		jns[1] = "这是集天地玄妙的大成之技，修习此技，不仅要有绝代风华的女儿身，更要有一颗玲珑剔透的七窍心。对目标施法后（只能是队友或自己），目标立刻损失所有魔法值，但在回合结束时会获得损失魔法值的10%，持续8回合。消耗：80点愤怒。冷却回合：8回合。（该技能为法术技能，受封印法术限制。）"
		jns[3] = 3
		jns[4] = "80点愤怒"
		jns[6] = "wzife.wd2"
		jns[7] = 0xC3BF2DE7
		jns[8] = 0xC3BF2DE7
		jns[9] = "8回合"
	-- 无底洞
	elseif jn == "金莲" then
		jns[1] = "地涌金莲额外作用一个目标。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0x33470573
		jns[8] = 0x33470573
	elseif jn == "追魂" then
		jns[1] = "敏捷点数≥人物等级*2.2时，对目标使用的夺命咒伤害结果增加“枯骨心法”等级100%。你的夺魄令会封印目标的物理攻击。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0x4345B564
		jns[8] = 0x4345B564
	elseif jn == "回敬" then
		jns[1] = "当前气血≤气血上限*50%时，封印命中率增加15%*（1-当前HP/最大HP）。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0x8E2CB1FA
		jns[8] = 0x8E2CB1FA
	elseif jn == "由己渡人" then
		jns[1] = "复活一名队友，同时附加一个持续一回合的护盾。复活后恢复“地冥妙法”等级*6气血恢复“地冥妙法”等级*12的临时气血附加一个可以吸收（消耗气血+“地冥妙法”等级*4）的护盾消耗：10%的当前气血自身气血少于最大气血10%时无法使用。"
		jns[3] = 3
		jns[6] = "wzife.wd4"
		jns[7] = 0xDE58924A
		jns[8] = 0xDE58924A
	elseif jn == "自愈" then
		jns[1] = "地涌金莲的恢复自身的气血量增加50%。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0x4F57FF06
		jns[8] = 0x4F57FF06
	elseif jn == "陷阱" then
		jns[1] = "夺魄令被解除时，自身回复自身等级*1点气血。当前气血≤气血上限*50%时，该效果额外增加200%。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0x3E7BB1D9
		jns[8] = 0x3E7BB1D9
	elseif jn == "化莲" then
		jns[1] = "地涌金莲增加武器伤害*30%点治疗能力。队伍中只有1个无底洞弟子时，地涌金莲首目标额外恢复地冥妙法*6点气血。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0x40FB7647
		jns[8] = 0x40FB7647
	elseif jn == "风墙" then
		jns[1] = "受到攻击时，额外抵挡人物等级*16的伤害。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0xA35299B7
		jns[8] = 0xA35299B7
	elseif jn == "御兽" then
		jns[1] = "自身携带的召唤兽（及孩子）进入战斗时，如果速度≥召唤兽等级*3，则增加召唤兽等级*1.6的速度。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0x4972C591
		jns[8] = 0x4972C591
	elseif jn == "精进" then
		jns[1] = "明光宝烛、金身舍利效果增加200%，每回合减少40%。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0x3AC8DBC2
		jns[8] = 0x3AC8DBC2
	elseif jn == "救人" then
		jns[1] = "煞气决对队友使用必定命中，且会额外回复地冥妙法等级*5的气血。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0xFD01D3AD
		jns[8] = 0xFD01D3AD
	elseif jn == "灵身" then
		jns[1] = "当前气血≤气血上限*50%时，自身获得的金身舍利和明光宝烛持续回合数增加4、效果增加200%。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0x90622900
		jns[8] = 0x90622900
	elseif jn == "持戒" then
		jns[1] = "惊魂掌命中率变为原先的300%（无视命中率上限），但持续回合数上限变为2回合，目标将无法受好友保护。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0x7B3ACA53
		jns[8] = 0x7B3ACA53
	elseif jn == "内伤" then
		jns[1] = "夺命咒攻击目标时，对目标额外造成50+枯骨心法技能等级*150%的伤害。每场战斗的第一次夺命咒会作用多个单位，数量和攻击目标时相同。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0x70FDB194
		jns[8] = 0x70FDB194
	elseif jn == "反先" then
		jns[1] = "摧心术的目标额外减少阴风绝章*40%点速度，同时减少8%封印命中率、物理暴击率、法术暴击率。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0xFB48D5CC
		jns[8] = 0xFB48D5CC
	elseif jn == "忍辱" then
		jns[1] = "每当你被对方封印时，无论是否成功，都有100%概率获得6点愤怒。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0xB1254F74
		jns[8] = 0xB1254F74
	elseif jn == "暗潮" then
		jns[1] = "愤怒在90以下时，每回合结束获得4点愤怒。"
		jns[3] = 8
		jns[6] = "wzife.wd3"
		jns[7] = 0x26A40C6E
		jns[8] = 0x26A40C6E
	elseif jn == "噬魂" then
		jns[1] = "你的“移魂化骨”吸取生命值的40%会转化为你的生命值。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0x173015AE
		jns[8] = 0x173015AE
	elseif jn == "同舟共济" then
		jns[1] = "为目标队友分担伤害，持续3回合。目标队友承受30%伤害，你承受30%伤害。消耗：最大气血的10%当前气血需≥最大气血50%才能使用冷却回合：5。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0x57365436
		jns[8] = 0x57365436
	elseif jn == "妖风四起" then
		jns[1] = "驱动妖风封印敌人，使其不能使用法术。成功率与成功率上限=夺魄令成功率+10%。该封印不能被水清、冰清、玉清、晶清解除。（可封印处于休息状态的单位）持续2回合。消耗：40点愤怒。冷却回合：6。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0x8295E360
		jns[8] = 0x8295E360
	-- 魔王寨
	elseif jn == "充沛" then
		jns[1] = "战斗内临时提高10%的气血和气血上限"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x8A07409C
		jns[8] = 0x8A07409C
	elseif jn == "炙烤" then
		jns[1] = "你的牛劲附加感知效果,且效果提升3%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xBAA64557
		jns[8] = 0xBAA64557
	elseif jn == "震怒" then
		jns[1] = "飞砂走石在对目标使用时有10%的几率会额外作用一个单位。。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x403FE10F
		jns[8] = 0x403FE10F
	elseif jn == "蚀天" then
		jns[1] = "受到大于等于气血上限20%的伤害则进入激怒状态，法术伤害增加150点，持续3回合。效果不能叠加。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xAC17A1D4
		jns[8] = 0xAC17A1D4
	elseif jn == "敛恨" then
		jns[1] = "受到物理暴击、法术暴击伤害后，本次所受与后面所受到的所有伤害减少20%。当回合有效。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x6F367EF0
		jns[8] = 0x6F367EF0
	elseif jn == "赤暖" then
		jns[1] = "使用三味真火将恢复气血，恢复效果为本次造成伤害#W//50。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x36BEA656
		jns[8] = 0x36BEA656
	elseif jn == "火神" then
		jns[1] = "飞砂走石造成的伤害将额外增加火云术等级*1.5的伤害"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xBF44D568
		jns[8] = 0xBF44D568
	elseif jn == "震天" then
		jns[1] = "震天诀等级≥人物等级时，增加60点法术伤害力。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x06B6105D
		jns[8] = 0x06B6105D
	elseif jn == "神焰" then
		jns[1] = "飞砂走石造成的伤害将受自身气血影响，气血越低，附加伤害将越高"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x9D84EC63
		jns[8] = 0x9D84EC63
	elseif jn == "神炎" then
		jns[1] = "三味真火造成的伤害将受自身气血影响，气血越低，附加的伤害将越高"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xBF44D568
		jns[8] = 0xBF44D568
	elseif jn == "返火" then
		jns[1] = "火甲术反馈的伤害效果增加70%。"
		jns[3] = 8
		jns[6] = "wzife.wd3"
		jns[7] = 0x013D6355
		jns[8] = 0x013D6355
	elseif jn == "崩摧" then
		jns[1] = "每次使用三昧真火与飞砂走石，有5%的几率降低目标10%的法术防御力，持续4回合。不能叠加。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x4935E53B
		jns[8] = 0x4935E53B
	elseif jn == "魔冥" then
		jns[1] = "每次使用完飞沙走石或三味真火后，可以恢复自身魔法上限*5%的魔法量。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x8BF70190
		jns[8] = 0x8BF70190
	elseif jn == "燃魂" then
		jns[1] = "#W/增加当前魔法/魔法上限*50的法术伤害力、抗封等级。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x79602FB7
		jns[8] = 0x79602FB7
	elseif jn == "狂月" then
		jns[1] = "战斗内额增加10%的魔法值"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x0A9E4158
		jns[8] = 0x0A9E4158
	elseif jn == "威吓" then
		jns[1] = "自身处于牛劲状态时，对目标的伤害增加12%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x3816E2FC
		jns[8] = 0x3816E2FC
	elseif jn == "连营" then
		jns[1] = "牛劲技能持续回合数加一。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x90EEA1F5
		jns[8] = 0x90EEA1F5
	elseif jn == "魔心" then
		jns[1] = "使用三昧真火或飞砂走石时10概率使伤害翻倍"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xDAA0F7D4
		jns[8] = 0xDAA0F7D4
	elseif jn == "魔焰滔天" then
		jns[1] = "为了能给敌人造成更大的伤害，魔王寨的弟子是不怕赌上自己运气的。每回合开始时,临时附加20%法术暴击的状态，持续到战斗结束，每回合额外消耗的魔法100"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x525B9DB0
		jns[8] = 0x525B9DB0
	elseif jn == "烈焰真诀" then
		jns[1] = "烈焰缠身，此时他们不再是普通的魔王寨弟子，他们具有更强大的法术暴击能力。使用后增加10%的魔法暴击率。持续4回合。"
		jns[3] = 8
		jns[4] = "50点魔法"
		jns[6] = "wzife.wd2"
		jns[7] = 0x1299A579
		jns[8] = 0x1299A579
		jns[12] = "5回合"
	-- 狮驼岭
	elseif jn == "爪印" then
		jns[1] = "每次攻击敌人或被敌人攻击后，在敌人身上留下爪印，每个印记使得自己在下次攻击对手时增加人物等级*0.5伤害结果。印记只有在每回合的第一次攻击中有效，印记持续5回合或至对手死亡后消失，印记可叠加，最多叠加10个。持续回合效果可被刷新。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x6E34D2AA
		jns[8] = 0x6E34D2AA
	elseif jn == "翼展" then
		jns[1] = "你的鹰击攻击伤害增加生死薄技能等级*1.2"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x35A96711
		jns[8] = 0x35A96711
	elseif jn == "驭兽" then
		jns[1] = "提升全队伍所有在场召唤兽的能力：你的训兽诀等级*0.4的伤害，你的训兽诀等级*0.4的防御，你的训兽诀等级*0.2的灵力。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x97EF1BE4
		jns[8] = 0x97EF1BE4
	elseif jn == "化血" then
		jns[1] = "在攻击中有30%几率吸收造成伤害的16%的气血。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xBE24B04C
		jns[8] = 0xBE24B04C
	elseif jn == "宁息" then
		jns[1] = "变身的持续回合数加2，且效果提升3%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xF0B320B8
		jns[8] = 0xF0B320B8
	elseif jn == "兽王" then
		jns[1] = "使用完变身技能后，所有攻击类技能对目标造成变身技能等级*2的额外伤害(无变身状态无效)。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x287A0188
		jns[8] = 0x287A0188
	elseif jn == "狮吼" then
		jns[1] = "狮搏伤害提高15%；狮搏击倒目标时，额外触发一次狮搏。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xD10DF1DF
		jns[8] = 0xD10DF1DF
	elseif jn == "怒象" then
		jns[1] = "当气血少于上限的30%时，有70%的几率在使用象形时保留变身状态并延长变身1回合。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x7CDE78AD
		jns[8] = 0x7CDE78AD
	elseif jn == "鹰啸" then
		jns[1] = "鹰击可以使目标造成的伤害降低15%，持续2回合。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x1D7F1771
		jns[8] = 0x1D7F1771
	elseif jn == "乱破" then
		jns[1] = "使用连环击时，每次击打有45%几率附加狂兽决技能等级×100%的伤害。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x6D372C69
		jns[8] = 0x6D372C69
	elseif jn == "魔息" then
		jns[1] = "魔息术效果提升50%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xC84857CA
		jns[8] = 0xC84857CA
	elseif jn == "威慑" then
		jns[1] = "你对目标使用的狮搏有30%几率附带持续2回合的“威慑”效果。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x9D1ABD9E
		jns[8] = 0x9D1ABD9E
	elseif jn == "狂袭" then
		jns[1] = "攻击时减少被反震的概率20%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x5154ED66
		jns[8] = 0x5154ED66
	elseif jn == "失心" then
		jns[1] = "使用狮搏或鹰击有15%的几率让目标1回合无法行动。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x43CEF766
		jns[8] = 0x43CEF766
	elseif jn == "羁绊" then
		jns[1] = "你每次回复生命值，你的召唤兽也会回复该数值的10%。你的召唤兽每次回复生命值，你也会回复该数值的10%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x5C170F92
		jns[8] = 0x5C170F92
	elseif jn == "死地" then
		jns[1] = "死亡时将提升你下一次鹰击（100+损失愤怒*3）的伤害力。"
		jns[3] = 8
		jns[6] = "wzife.wd3"
		jns[7] = 0x143A6B82
		jns[8] = 0x143A6B82
	elseif jn == "乱击" then
		jns[1] = "你的连环击额外增加一次特殊的攻击。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x28EFDCA8
		jns[8] = 0x28EFDCA8
	elseif jn == "悲恸" then
		jns[1] = "人物死亡时，你的召唤兽受到的伤害降低15%，造成的伤害提高15%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x1D0F8066
		jns[8] = 0x1D0F8066
	elseif jn == "背水" then
		jns[1] = "虽千万人吾亦往矣，不胜则死！牺牲自身20%的当前气血，对目标造成(当前气血24%+普通攻击物理伤害+爪印个数*200)的伤害，并清除目标爪印效果。对方所受伤害最高不超过使用者自身力量点×600%的气血。消耗：20%的当前气血。自身气血少于气血上限20%时无法使用。（需要有变身状态，使用后休息1回合）"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x0B171EFB
		jns[8] = 0x0B171EFB
	elseif jn == "肝胆" then
		jns[1] = "人与幻兽之间的情感，你们这些俗人又怎能了解？肝胆相照、形影相随，四海为家、浪迹天涯。命令自己的召唤兽忠诚的保护己方任意目标（除了自己的召唤兽），该技能选择目标释放后，自己的召唤兽将在3回合内无限保护目标，直至目标或者召唤兽自己死亡。保护时召唤兽承担所受伤害的40%，被保护目标承受40%的伤害。消耗：80点MP。技能冷却回合：3。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x04600746
		jns[8] = 0x04600746
	-- 天宫
	elseif jn == "威吓" then
		jns[1] = "五雷轰顶成功时造成的伤害比例在基础上增加8%并且目标本回合内不再增加愤怒值。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x4E4ECD7C
		jns[8] = 0x4E4ECD7C
	elseif jn == "疾雷" then
		jns[1] = "使用天雷斩攻击NPC时，额外增加0.6*(敏捷点数-人物等级)的伤害力。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x67324D63
		jns[8] = 0x67324D63
	elseif jn == "轰鸣" then
		jns[1] = "使用五雷轰顶技能成功时使目标减少240点物理防御，效果持续3回合，效果不能叠加，不能刷新。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x11DBB164
		jns[8] = 0x11DBB164
	elseif jn == "趁虚" then
		jns[1] = "每次使用特技之后，在接下来两个回合的封印成功率提高8%，效果不可叠加，可以被刷新。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x54E910DB
		jns[8] = 0x54E910DB
	elseif jn == "余韵" then
		jns[1] = "“魔兽之印”“河东狮吼”“圣灵之甲”“碎甲术”“停陷术”“啸风诀”的效果增加50%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x8009DFB1
		jns[8] = 0x8009DFB1
	elseif jn == "驭意" then
		jns[1] = "增加自身魔力属性点5%的速度；自身封印命中率降低5%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x2CBA65C0
		jns[8] = 0x2CBA65C0
	elseif jn == "震慑" then
		jns[1] = "使用错乱成功封印对手后，使目标同时附有掌心雷的封印效果；自身法术伤害力降低10%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xC5CB9BBB
		jns[8] = 0xC5CB9BBB
	elseif jn == "神念" then
		jns[1] = "使用法宝时，额外获得10点愤怒。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xA79CD890
		jns[8] = 0xA79CD890
	elseif jn == "伏魔" then
		jns[1] = "附魔天书的效果增加50%；自身封印命中率降低5%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x7D54F95D
		jns[8] = 0x7D54F95D
	elseif jn == "苏醒" then
		jns[1] = "在一回合内掉血量达到自身气血上限的40%，回合结束时自动移除自身封印类异常状态，人物死亡时则失效。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xC8EF7B06
		jns[8] = 0xC8EF7B06
	elseif jn == "护佑" then
		jns[1] = "增加50点防御力及法术防御力。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xFEAD9161
		jns[8] = 0xFEAD9161
	elseif jn == "电芒" then
		jns[1] = "被雷霆万钧击中的目标，身上将缠绕着电流。带有此电流的目标再次受到雷霆万钧打击时额外承受5%的伤害，持续3回合，不可叠加，可以被刷新。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x7B970F69
		jns[8] = 0x7B970F69
	elseif jn == "月桂" then
		jns[1] = "增加武器伤害*12%的封印命中等级，但不再增加法术伤害力。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x71D17EEA
		jns[8] = 0x71D17EEA
	elseif jn == "怒火" then
		jns[1] = "当因气血损失而增加＞10的愤怒时，可以额外增加5点愤怒。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x58B7E9CB
		jns[8] = 0x58B7E9CB
	elseif jn == "灵光" then
		jns[1] = "装备上的宝石舍利子效果增加25%；自身封印命中率降低5%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x9571F0A2
		jns[8] = 0x9571F0A2
	elseif jn == "神律" then
		jns[1] = "天神护体法防效果增加100%，额外增加云霄步等级*0.3的速度，但不再增加法伤。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xEA46BD71
		jns[8] = 0xEA46BD71
	elseif jn == "洞察" then
		jns[1] = "你的知己知彼额外提高自身等级*2的伤害、防御、法伤、法防、封印等级、抗封等级，持续3回合。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x8660A7C9
		jns[8] = 0x8660A7C9
	elseif jn == "雷波" then
		jns[1] = "雷霆万钧对首目标造成的伤害提高8%，“电芒”产生的电流增加1持续回合数。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xA7603CC9
		jns[8] = 0xA7603CC9
	elseif jn == "画地为牢" then
		jns[1] = "天宫弟子随手布下的囚牢，却是无数穷凶极恶之徒的饮恨之所。对敌方使用后，降低敌方1个单位16%的对封印法术抵抗能力以及16%的封印能力，持续回合为5回合。消耗：50点魔法；冷却时间：5回合。"
		jns[3] = 4
		jns[6] = "wzife.wd2"
		jns[7] = 0xBAF731FA
		jns[8] = 0xBAF731FA
	elseif jn == "风雷韵动" then
		jns[1] = "以风为弦、以雷为钟，其鸣如黄钟大吕般的攻击不仅能击溃对方的躯体，也能摧毁抵抗的意志。该技能本身伤害不会给目标增加愤怒值并降低目标8点愤怒，不受佛法无边影响。消耗：60点魔法。"
		jns[3] = 4
		jns[6] = "wzife.wd2"
		jns[7] = 0x169010C9
		jns[8] = 0x169010C9
	-- 普陀山
	elseif jn == "化戈" then
		jns[1] = "增加武器伤害*18%的治疗量。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x8FE4B9FF
		jns[8] = 0x8FE4B9FF
	elseif jn == "推衍" then
		jns[1] = "自身敏捷≥等级*2.2时，五行法术对目标伤害增加21%，。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x7D712683
		jns[8] = 0x7D712683
	elseif jn == "借灵" then
		jns[1] = "武器伤害的24%转化为五行法术伤害。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x9C0D1C5B
		jns[8] = 0x9C0D1C5B
	elseif jn == "莲花心音" then
		jns[1] = "普陀弟子以莲花苞为躯，引魂入体，则可以复活在战斗中死亡的鬼魂幻兽。复活场上一个处于死亡状态的鬼魂宠，被复活目标获得60%的气血上限与当前36%的魔法值。"
		jns[3] = 8
		jns[4] = "60点魔法"
		jns[6] = "wzife.wd2"
		jns[7] = 0x07DEBF4F
		jns[8] = 0x07DEBF4F
	elseif jn == "生克" then
		jns[1] = "队伍内成员的五行克制能力增加4%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x1C454D91
		jns[8] = 0x1C454D91
	elseif jn == "默诵" then
	    jns[1] = "紧箍咒造成的伤害增加100%，同时如果目标处于紧箍咒时每回合结束时增加自身6点愤怒。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x6AB318F7
		jns[8] = 0x6AB318F7
	elseif jn == "劳心" then
		jns[1] = "当前气血≤气血上限*30%时，使用普渡众生或者杨柳甘露技能带来的气血恢复效果额外增加100%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x00B8064E
		jns[8] = 0x00B8064E
	elseif jn == "普渡" then
		jns[1] = "普渡众生的气血恢复效果增加12%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x9110FB84
		jns[8] = 0x9110FB84
	elseif jn == "化怨" then
		jns[1] = "当前气血≤气血上限*30%时，受到的所有伤害减少25%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xBBC8F2A2
		jns[8] = 0xBBC8F2A2
	elseif jn == "甘露" then
		jns[1] = "对目标使用杨柳甘露法术成功时，有50%的几率附带普渡众生效果4回合。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xAF6FDE97
		jns[8] = 0xAF6FDE97
	elseif jn == "法印" then
		jns[1] = "颠倒五行法术吸收几率与上限增加10%、躲避率增加8%，持续回合数增加3。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x4B145B23
		jns[8] = 0x4B145B23
	elseif jn == "秘术" then
		jns[1] = "使用五行法术时，将波动150点伤害"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xF109AB4C
		jns[8] = 0xF109AB4C
	elseif jn == "灵动" then
		jns[1] = "灵动九天效果增加30点，持续回合数增加3。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x4DCD5F44
		jns[8] = 0x4DCD5F44
	elseif jn == "雨润" then
		jns[1] = "当队伍中成员的普渡众生效果消失时，目标会额外恢复灵性等级*0.7的气血"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x4290BCBB
		jns[8] = 0x4290BCBB
	elseif jn == "莲心剑意" then
		jns[1] = "普陀山的弟子情系众生、虔心不染，如一朵莲花绽放在凡尘中。但江湖险恶、妖风魔雨，为了护佑苍生，她们也不得不常怀剑意，惩恶除奸。使用此技能后进入进攻状态，增加法术修炼等级*3%的固定伤害最终效果（只对首目标有效），降低12%的回复效果。"
		jns[3] = 3
		jns[4] = "30点MP"
		jns[6] = "wzife.wd2"
		jns[7] = 0xC2D6BBD3
		jns[8] = 0xC2D6BBD3
	elseif jn == "玉帛" then
		jns[1] = "护法金刚技能所为人物增加伤害的8%转化为普渡众生气血恢复效果。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xA96E7A76
		jns[8] = 0xA96E7A76
	elseif jn == "道衍" then
		jns[1] = "普渡众生的作用对象额外增加2个。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xCE18F021
		jns[8] = 0xCE18F021
	elseif jn == "法咒" then
		jns[1] = "五行法术有20%的几率使伤害增加50%"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x2A398778
		jns[8] = 0x2A398778
	elseif jn == "波澜不惊" then
		jns[1] = "普陀山弟子由于精通五行造化，方可布下这吸收一切伤害的结界阵法。颠倒五行增加20%的法术连击效果。"
		jns[3] = 5
		jns[6] = "wzife.wd2"
		jns[7] = 0xAED0F931
		jns[8] = 0xAED0F931
	elseif jn == "五行制化" then
		jns[1] = "随机使用五行法术中的任意一个，但将目标提升为10，且伤害增加30%"
		jns[3] = 4
		jns[4] = "70点魔法"
		jns[6] = "wzife.wd2"
		jns[7] = 0xF46EB09D
		jns[8] = 0xF46EB09D
		jns[12] = "6回合"
	-- 凌波城
	elseif jn == "山破" then
		jns[1] = "使用天崩地裂后，自身恢复气血上限5%的血量。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0x673833C4
		jns[8] = 0x673833C4
	elseif jn == "战诀" then
		jns[1] = "使用碎星诀和镇魂诀时，额外提高10%的必杀率，不可叠加，持续到战斗结束。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0xB97A5577
		jns[8] = 0xB97A5577
	elseif jn == "抗击" then
		jns[1] = "不动如山增加100%反击效果。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0x37FCB484
		jns[8] = 0x37FCB484
	elseif jn == "聚气" then
		jns[1] = "使用消耗愤怒≥60的特技时，有20%的几率触发不动如山的效果。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0x6009D906
		jns[8] = 0x6009D906
	elseif jn == "神诀" then
		jns[1] = "使用天崩地裂与翻江倒海的技能时，刷新自身碎星诀或镇魂诀状态的回合数到初始值，并增加25%的效果，最多增加100%。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0x7D0D0DAB
		jns[8] = 0x7D0D0DAB
	elseif jn == "魂聚" then
		jns[1] = "每次使用攻击类技能，增加6点愤怒。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0xB7BD0013
		jns[8] = 0xB7BD0013
	elseif jn == "神躯" then
		jns[1] = "受到大于等于气血上限20%的伤害时，超过20%的部分会降低30%。。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0xCF5AD689
		jns[8] = 0xCF5AD689
	elseif jn == "斩魔" then
		jns[1] = "碎星诀和镇魂诀效果提升12%。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0xE2910606
		jns[8] = 0xE2910606
	elseif jn == "不动" then
		jns[1] = "若在不动如山的状态下死亡，会额外保留80点愤怒。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0x9769021C
		jns[8] = 0x9769021C
	elseif jn == "力战" then
		jns[1] = "天崩地裂最后一击额外造成360点伤害。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0x0E10688C
		jns[8] = 0x0E10688C
	elseif jn == "破击" then
		jns[1] = "裂石，断岳势，天崩地裂出现必杀的几率翻倍，但产生必杀时只会造成1.6倍的伤害。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0x6E010D11
		jns[8] = 0x6E010D11
	elseif jn == "怒涛" then
		jns[1] = "浪涌，惊涛怒，翻江搅海的每一次攻击有70%几率降低目标人物自身等级/2的防御，持续2回合。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0xE971301E
		jns[8] = 0xE971301E
	elseif jn == "海沸" then
		jns[1] = "增加人物力量*8%的伤害力。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0xBCE3BB39
		jns[8] = 0xBCE3BB39
	elseif jn == "怒火" then
		jns[1] = "每次使用攻击类技能后，如果当前回合受到20%气血上限的伤害时，下回合自身伤害提升10%，防御降低10%。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0xDEECD728
		jns[8] = 0xDEECD728
	elseif jn == "煞气" then
		jns[1] = "使用攻击类技能时附加100点伤害力。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0x338B3040
		jns[8] = 0x338B3040
	elseif jn == "强袭" then
		jns[1] = "每次使用不动如山后，都会使攻击类技能伤害提升12%，持续3回合。状态不可刷新，不叠加。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0xC6AD7685
		jns[8] = 0xC6AD7685
	elseif jn == "雷附" then
		jns[1] = "提升腾雷的命中率10%，被腾雷附上致死状态的单位若在2回合内死亡，有50%的概率回复人物气血上限5%的血量。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0x7F38C97C
		jns[8] = 0x7F38C97C
	elseif jn == "再战" then
		jns[1] = "每次使用断岳势造成一个单位的死亡都会使下回合的断岳势伤害结果提高10%。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0x606669C9
		jns[8] = 0x606669C9
	elseif jn == "天神怒斩" then
		jns[1] = "天神盛怒，以开天辟地之势，挥刀怒斩，天崩地裂的攻击次数变为4次，但气血消耗将加倍。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0xA8AF3DC0
		jns[8] = 0xA8AF3DC0
	elseif jn == "真君显灵" then
		jns[1] = "敲动战鼓，一鼓作气拿下敌人。进入“真君显灵”状态，持续3回合，提升自身10%物理伤害，降低自身10%物理防御。消耗：100点魔法。冷却回合：5。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0x4017404F
		jns[8] = 0x4017404F
	-- 五庄观
	elseif jn == "体恤" then
		jns[1] = "当生命之泉的作用目标气血≤30%时，生命之泉恢复效果增加150点。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xF19C2D33
		jns[8] = 0xF19C2D33
	elseif jn == "锤炼" then
		jns[1] = "武器耐久损失速度降低40%，增加3%武器伤害。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x18172D37
		jns[8] = 0x18172D37
	elseif jn == "神附" then
		jns[1] = "增加人物力量*8%的伤害力。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x43F66789
		jns[8] = 0x43F66789
	elseif jn == "心浪" then
		jns[1] = "回合结束时，若你愤怒少于50点，随机增加1~15点愤怒。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x284FBFEC
		jns[8] = 0x284FBFEC
	elseif jn == "养生" then
		jns[1] = "当你气血降低到50%以下，且没有生命之泉时，获得生命之泉效果。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xCF2DA86F
		jns[8] = 0xCF2DA86F
	elseif jn == "强击" then
		jns[1] = "攻击时忽视召唤兽10%的防御值；自身封印命中率降低5%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xA88BC46C
		jns[8] = 0xA88BC46C
	elseif jn == "归本" then
		jns[1] = "日月乾坤命中时，60%取消对方主动法宝增加的持续效果。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x736BD2FA
		jns[8] = 0x736BD2FA
	elseif jn == "修心" then
		jns[1] = "使用除“慈航普度”以外的特技时，若愤怒不足将使用（所需愤怒*20）点魔法代替。每场战斗限一次。"
		jns[3] = 8
		jns[6] = "wzife.wd3"
		jns[7] = 0x151405E2
		jns[8] = 0x151405E2
	elseif jn == "混元" then
		jns[1] = "当你气血≥70%时，临时提升5%的伤害力。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x03636ACD
		jns[8] = 0x03636ACD
	elseif jn == "修身" then
		jns[1] = "力量、体质、魔力、耐力、敏捷均增加14点。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x47BCA30B
		jns[8] = 0x47BCA30B
	elseif jn == "同辉" then
		jns[1] = "天地同寿状态下的目标防御值降低变为35%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xBF6B4C8C
		jns[8] = 0xBF6B4C8C
	elseif jn == "雨杀" then
		jns[1] = "使用烟雨剑法需要的气血要求降低5%。烟雨剑法第二次攻击的必杀率提高20%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xA88BC46C
		jns[8] = 0xB6C48838
	elseif jn == "乾坤" then
		jns[1] = "如果你连续2回合及以上没有使用日月乾坤，则你下一次使用日月乾坤成功率提高12%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x86543FA8
		jns[8] = 0x86543FA8
	elseif jn == "意境" then
		jns[1] = "本方所有目标每回合结束时回复24点魔法值、1点愤怒。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xC5AFBFE0
		jns[8] = 0xC5AFBFE0
	elseif jn == "傲视" then
		jns[1] = "当攻击出现必杀时，下一次使用日月乾坤的成功率提高20%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xB6C48838
		jns[8] = 0xB6C48838
	elseif jn == "陌宝" then
		jns[1] = "日月乾坤将附加无法使用道具的效果。自身物理伤害结果降低15%，封印命中率提升2%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xA88BC46C
		jns[8] = 0xA88BC46C
	elseif jn == "心随意动" then
		jns[1] = "这是五庄弟子的最高心境，于此心法下施展“日月乾坤”，令人陶陶乎直入另一个世界。激活后（再次使用关闭此状态），持续8回合后自动关闭。持续回合内：1.提升七星遁等级*1.5的封印命中等级、伤害力；2.使用日月乾坤封印成功后自己下回合不能使用日月乾坤；消耗：30点MP。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xFD5AC0B0
		jns[8] = 0xFD5AC0B0
	elseif jn == "致命" then
		jns[1] = "被你攻击的目标在回合结束时，若目标的气血小于气血上限的10%则直接暴毙。（对NPC最多造成等级*10点伤害）"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x8C44F88C
		jns[8] = 0x8C44F88C
	elseif jn == "清风望月" then
		jns[1] = "五庄观的弟子可以于乾坤腾挪之中领悟妙法，吸收2个队友身上的封印效果，使自己进入疯狂状态2回合。消耗：40点愤怒。冷却回合：4。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x8FE977C4
		jns[8] = 0x8FE977C4
	elseif jn == "天命剑法" then
		jns[1] = "率意而行、道法自然，在五庄弟子出手之际，他自身也道不出这一招之中蕴含了多少剑意。或许，只有冥冥之中的三清可知吧？以无人能够预知的剑术攻击目标，对其随机发动1~7次物理攻击。使用后下回合不能行动。使用需要气血≥气血上限的70%；消耗：消耗最大气血的2%*实际攻击次数。冷却回合：5回合。"
		jns[3] = 4
		jns[4] = "消耗最大气血的2%*实际攻击次数"
		jns[6] = "wzife.wd2"
		jns[7] = 0x30EA31AF
		jns[8] = 0x30EA31AF
		jns[12] = "5回合"
	-- 龙宫
	elseif jn == "波涛" then
		jns[1] = "龙腾造成的伤害将额外增加破浪诀等级*1.5的固定伤害。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x4714CA13
		jns[8] = 0x4714CA13
	elseif jn == "破浪" then
		jns[1] = "每次使用技能时有概率额外提高100点临时法伤（只用于本次出手）"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xA5F354BA
		jns[8] = 0xA5F354BA
	elseif jn == "云霄" then
		jns[1] = "龙卷雨击造成伤害的时候，将概率额外增加100点临时伤害"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x8A3EF0F0
		jns[8] = 0x8A3EF0F0
	elseif jn == "逐浪" then
		jns[1] = "龙卷雨击造成的伤害将额外增加破浪诀等级*0.5的固定伤害。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x890B8397
		jns[8] = 0x890B8397
	elseif jn == "踏涛" then
		jns[1] = "破浪诀等级≥人物等级时，增加60点法伤。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x45238FC3
		jns[8] = 0x45238FC3
	elseif jn == "清吟" then
		jns[1] = "龙吟技能额外将减少目标50-100点的气血值。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xA135A426
		jns[8] = 0xA135A426
	elseif jn == "天龙" then
		jns[1] = "每3次使用技能都能激发龙宫弟子的潜力，使得下一次法术攻击时临时提升150法术伤害力。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x4DEF4B05
		jns[8] = 0x4DEF4B05
	elseif jn == "龙珠" then
		jns[1] = "每次使用二龙戏珠时，有8%的几率额外增加一个目标。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xF4F33841
		jns[8] = 0xF4F33841
	elseif jn == "龙骇" then
		jns[1] = "任何门派伤害法术造成的伤害增加40点伤害结果。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xDFF0E26B
		jns[8] = 0xDFF0E26B
	elseif jn == "龙慑" then
		jns[1] = "对敌人额外增加100点法术伤害结果。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xA9FDF759
		jns[8] = 0xA9FDF759
	elseif jn == "傲翔" then
		jns[1] = "神龙摆尾持续回合增加1回合，效果增加10%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xA925D675
		jns[8] = 0xA925D675
	elseif jn == "飞龙" then
		jns[1] = "受到大于等于气血上限25%的伤害都有70%的几率触发神龙摆尾技能。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x45A7F519
		jns[8] = 0x45A7F519
	elseif jn == "戏珠" then
		jns[1] = "增加二龙戏珠伤害，数值为目标(1-当前气血#W//目标气血上限)*1000。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x4B2FA59C
		jns[8] = 0x4B2FA59C
	elseif jn == "回魔" then
		jns[1] = "每回合回复魔法上限与当前灵力的差值的5%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xEE1C323A
		jns[8] = 0xEE1C323A
	elseif jn == "月魂" then
		jns[1] = "装备上的月亮石效果增加40%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xBF6B4C8C
		jns[8] = 0xBF6B4C8C
	elseif jn == "汹涌" then
		jns[1] = "当目标处于法术减免状态下，忽视8%的减免效果。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x773514B8
		jns[8] = 0x773514B8
	elseif jn == "龙魄" then
		jns[1] = "龙卷雨击有10%几率额外作用3人。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x97C568AA
		jns[8] = 0x97C568AA
	elseif jn == "摧意" then
		jns[1] = "龙腾造成的伤害≥目标气血上限*20%时，减少目标300点魔法值。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x13DFE838
		jns[8] = 0x13DFE838
	elseif jn == "亢龙归海" then
		jns[1] = "矫健的神龙翻腾四海的英姿很少有人目睹，而之后更无人能够道出其中的神威。使用法术连续两次攻击敌人，造成的伤害为龙腾的90%。使用后需要休息一回合。"
		jns[3] = 4
		jns[4] = "200点魔法"
		jns[6] = "wzife.wd2"
		jns[7] = 0xCE07792D
		jns[8] = 0xCE07792D
		jns[12] = "6回合"
	elseif jn == "雷浪穿云" then
		jns[1] = "当那天地间卷起的白浪与电闪中的云彩揉成一片，任谁都无力承当神龙见首不见尾的后续打击。对目标使用后，目标在5回合内遭受的所有法术伤害增加30%，使用法术技能消耗魔法增加100%+30点。消耗：60点MP。"
		jns[3] = 4
		jns[4] = "60点魔法"
		jns[6] = "wzife.wd2"
		jns[7] = 0x77EC444B
		jns[8] = 0x77EC444B
	--
	elseif jn == "BOSS绝杀" then
		jns[1] = nil
		jns[3] = 4
		jns[4] = nil
		jns[6] = nil
		jns[7] = nil
		jns[8] = nil
	elseif jn == "同生共死" then
		jns[1] = nil
		jns[3] = 10
		jns[4] = nil
		jns[6] = nil
		jns[7] = nil
		jns[8] = nil
	elseif jn == "超级连击" then
		jns[1] = nil
		jns[3] = 7
		jns[6] = "wzife.wdf"
		jns[7] = nil
		jns[8] = nil
	elseif jn == "额外能力" then
		jns[1] = ""
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xA209C3C2
		jns[8] = 0xA209C3C2

   elseif jn == "调息" then
		jns[1] = "非战斗情况下使用，可以按技能等级恢复一定气血值。"
		jns[3] = 108
		jns[6] = "wzife.wdf"
		jns[7] = 0x94308B6B
		jns[8] = 0x5956387D

    elseif jn == "打坐" then
		jns[1] = "非战斗情况下使用，可以按技能等级恢复一定魔法值。"
		jns[3] = 108
		jns[6] = "wzife.wdf"
		jns[7] = 0xB77AFA4C
		jns[8] = 0xA0D18931

      elseif jn == "妙手空空" then
		jns[1] = "战斗中使用的法术，可从怪物身上偷来银两或宝物。#G/(每次使用都将消耗目标等级*4点魔法)"
		jns[3] = 108
		jns[6] = "wzife.wdf"
		jns[7] = 0xD4815978
		jns[8] = 0x8466E376
     elseif jn == "宝石工艺" then
		jns[1] = "提高合成宝石的成功率。"
		jns[3] = 108
		jns[6] = "wzife.wdf"
		jns[7] = 0x408D50D7
		jns[8] = 0x5899607A

     elseif jn == "奇门遁甲" then
		jns[1] = "在特定场景使用道具“导标旗”做标记，用以传送。1级时可以在长寿村做标记，2级时增加傲来国，3级增加长安城，4级增加朱紫国。"
		jns[3] = 108
		jns[6] = "wzife.wdf"
		jns[7] = 0xFDB72ACA
		jns[8] = 0xEFE3F812

    elseif jn == "仙灵店铺" then
		jns[1] = "平时使用，能够呼出购买界面直接购买商品。"
		jns[3] = 108
		jns[6] = "wzife.wdf"
		jns[7] = 0x47877A93
		jns[8] = 0xF3719878
	elseif jn == "建筑之术" then
		jns[1] = "提高建造房屋的能力，玩家拥有较高的技能后，可以建造更高级的房屋，并获得更多的室内空间。"
		jns[3] = 108
		jns[6] = "wzife.wdf"
		jns[7] = 0x9F2DFDB6
		jns[8] = 0x16418D92
	elseif jn == "变化之术" then
		jns[1] = "学习后可以使用特殊的变身卡片变换造型，变身后可以获得相应的附加效果，而且不会被他人PK。技能等级提高后可以使用更为高级的卡片，并延长一定的变身时间。"
		jns[3] = 108
		jns[6] = "wzife.wdf"
		jns[7] =  0xD8118484--0xE6CAA561 --0xD8118484
		jns[8] = 0xE6CAA561--0xD8118484

   	elseif jn == "火眼金睛" then
		jns[1] = "学习后可以使用特殊的变身卡片变换造型，变身后可以获得相应的附加效果，而且不会被他人PK。技能等级提高后可以使用更为高级的卡片，并延长一定的变身时间。"
		jns[3] = 108
		jns[6] = "wzife.wdf"
		jns[7] = 0xE9D07953
		jns[8] = 0x43CBAF9C




	--女魃墓
	elseif jn == "天火献誓" then
		jns[1] = "天女魃操纵天火的神力与生俱来。是修行本门技能的基础。"
		jns[3] = 8
		jns[6] = "wzife.wd6"
		jns[7] = 0X00000063
		jns[8] = 0X00000063
	elseif jn == "天罚之焰" then
		jns[1] = "手中燃起灼灼炼焰，焚尽背恩忘义之徒。"
		jns[3] = 8
		jns[6] = "wzife.wd6"
		jns[7] = 0X00000057
		jns[8] = 0X00000057
	elseif jn == "煌火无明" then
		jns[1] = "天女魃沉睡千年，煌火无明，魂梦成魇。梦中种种，惊、怒、怨、怖、仇皆化为凌厉诅咒，取人性命。"
		jns[3] = 8
		jns[6] = "wzife.wd6"
		jns[7] = 0X00000058
		jns[8] = 0X00000058
	elseif jn == "化神以灵" then
		jns[1] = "悲而有灵，如惔如焚。怨而化魔，煌火燎原。怨怼仇恨可幻化为魑魅魍魉，与本门弟子一道出战。"
		jns[3] = 8
		jns[6] = "wzife.wd6"
		jns[7] = 0X00000060
		jns[8] = 0X00000060
	elseif jn == "弹指成烬" then
		jns[1] = "生杀予夺，聚灭无常，弹指间，天火灼灼，魂火烬而烈焰生。"
		jns[3] = 8
		jns[6] = "wzife.wd6"
		jns[7] = 0X00000059
		jns[8] = 0X00000059
	elseif jn == "藻光灵狱" then
		jns[1] = "粲粲三珠树，寄生赤水阴。三珠玄木蕴天地精华而生，灵光盈盈，吐叶垂华。沐其清辉，心静而神宁。"
		jns[3] = 8
		jns[6] = "wzife.wd6"
		jns[7] = 0X00000061
		jns[8] = 0X00000061
	elseif jn == "离魂" then
		jns[1] = "勘破生死者，无影无形，心神意动，可绝云霓,入青霄，翱翔于杳冥之上。"
		jns[3] = 8
		jns[6] = "wzife.wd6"
		jns[7] = 0X00000062
		jns[8] = 0X00000062
	elseif jn == "炽火流离" then
		jns[1] = "以炽热的火焰灼烧对手，吸噬其神魂，对单个敌方目标造成伤害并恢复自身生命"
		jns[3] = 4
		jns[4] = "30点魔法"
		jns[5] = "“天罚之焰”技能达到10级"
		jns[6] = "wzife.wd6"
		jns[7] = 0X00000100
		jns[8] = 0X00000165
	elseif jn == "极天炼焰" then
		jns[1] = "天火煌煌，腾焰飞芒，极天之势，可焚万物，克制天机城弟子的必杀技，使用后需要休息1回合，成功率受技能等级与目标等级之差影响"
		jns[3] = 4
		jns[4] = "150点愤怒"
		jns[5] = "“天罚之焰”技能达到25级"
		jns[6] = "wzife.wd6"
		jns[7] = 0X00000101
		jns[8] = 0X00000166
	elseif jn == "谜毒之缚" then
		jns[1] = "梦魇化为毒魅紧紧盘绕对手，使之无法呼吸，使目标造成的伤害和治疗降低，可叠加6层，作用目标数=技能等级/40+1，最多5个。"
		jns[3] = 4
		jns[4] = "(30+10*作用目标数)点魔法"
		jns[5] = "“煌火无明”技能达到15级"
		jns[6] = "wzife.wd6"
		jns[7] = 0X00000108
		jns[8] = 0X00000173
	elseif jn == "诡蝠之刑" then
		jns[1] = "诡蝠振翅，阴风缭绕，见之皆毛骨悚然，使目标造成伤害时受到反噬，可叠加6层，作用目标数=技能等级/40+1，最多5个"
		jns[3] = 4
		jns[4] = "(30+10*作用目标数)点魔法"
		jns[5] = "“煌火无明”技能达到10级"
		jns[6] = "wzife.wd6"
		jns[7] = 0X00000109
		jns[8] = 0X00000174
	elseif jn == "怨怖之泣" then
		jns[1] = "幽怨的哀哭绕梁不绝，令人魂悸而魄动，使目标增益状态更快消失，负面状态持续时间延长，可叠加6层，作用目标数=技能等级/40+1，最多5个"
		jns[3] = 4
		jns[4] = "(30+10*作用目标数)点魔法"
		jns[5] = "“煌火无明”技能达到30级"
		jns[6] = "wzife.wd6"
		jns[7] = 0X00000110
		jns[8] = 0X00000175
	elseif jn == "誓血之祭" then
		jns[1] = "歃血为祭，唤天魔之哮，可惊天地，对目标造成大量伤害并诅咒对方，使用后需休息一回合"
		jns[3] = 4
		jns[4] = "50点魔法"
		jns[5] = "“煌火无明”技能达到40级当前气血≥最大气血*50%"
		jns[6] = "wzife.wd6"
		jns[7] = 0X00000111
		jns[8] = 0X00000176
	elseif jn == "唤灵·魂火" then
		jns[1] = "怨之极，为仇，为怒，化形为魂火，有燎发摧枯之能，召唤(技能等级/125+2)个怨灵"
		jns[3] = 66
		jns[4] = "30点魔法"
		jns[5] = "“化神以灵”技能达到1级"
		jns[6] = "wzife.wd6"
		jns[7] = 0X00000102
		jns[8] = 0X00000167
	elseif jn == "唤魔·堕羽" then
		jns[1] = "魂火灼灼而烬，堕羽浴火而生，其光其焰，威不可测，牺牲两个怨灵，召唤一个幻魔"
		jns[3] = 66
		jns[4] = "50点魔法"
		jns[5] = "“化神以灵”技能达到20级"
		jns[6] = "wzife.wd6"
		jns[7] = 0X00000103
		jns[8] = 0X00000168
	elseif jn == "唤魔·毒魅" then
		jns[1] = "天火焚灵兽，灵兽神魂俱灭，其惊怖之状幻化为魔，靡坚不摧，牺牲召唤兽，召唤一个幻魔"
		jns[3] = 66
		jns[4] = "100点魔法"
		jns[5] = "“化神以灵”技能达到120级且角色飞升"
		jns[6] = "wzife.wd6"
		jns[7] = 0X00000112
		jns[8] = 0X00000177
	elseif jn == "唤灵·焚魂" then
		jns[1] = "天火焚灵兽，灵兽形陨神散，化为魂火，牺牲召唤兽，召唤六个怨灵"
		jns[3] = 66
		jns[4] = "100点魔法"
		jns[5] = "“化神以灵”技能达到120级且角色飞升"
		jns[6] = "wzife.wd6"
		jns[7] = 0X00000113
		jns[8] = 0X00000178
	elseif jn == "天魔觉醒" then
		jns[1] = "感惊、怒、怨、怖、仇之咒，天魔惊起而嗟，声震八荒，天震地骇，将吸收目标身上的诅咒并转换成一个幻魔"
		jns[3] = 4
		jns[4] = "1个金鸦火羽，100点魔法"
		jns[5] = "角色化圣"
		jns[6] = "wzife.wd6"
		jns[7] = 0X00000114
		jns[8] = 0X00000179
	elseif jn == "净世煌火" then
		jns[1] = "天火灼灼，吞噬怨灵以补充自身的气血，牺牲一个怨灵，恢复气血并解除异常状态"
		jns[3] = 3
		jns[4] = "50点魔法"
		jns[5] = "“弹指成烬”技能达到25级"
		jns[6] = "wzife.wd6"
		jns[7] = 0X00000106
		jns[8] = 0X00000171
	elseif jn == "焚魔烈焰" then
		jns[1] = "魂火烈烈，怨灵化燎原之焰灼烧对手，牺牲一个怨灵，对三个单位造成伤害"
		jns[3] = 4
		jns[4] = "(50*作用目标数)点魔法"
		jns[5] = "“弹指成烬”技能达到35级"
		jns[6] = "wzife.wd6"
		jns[7] = 0X00000107
		jns[8] = 0X00000172
	elseif jn == "幽影灵魄" then
		jns[1] = "女魃墓弟子可采撷三珠树幻影所结灵魄，赋予装备神秘的力量，平时状态下使用，临时赋予鞋子提升抗封的功效，下线后消失"
		jns[3] = 4
		jns[4] = "和技能等级相同点数的活力"
		jns[5] = "“藻光灵狱”技能达到35级且角色等级达到30级"
		jns[6] = "wzife.wd6"
		jns[7] = 0X00000104
		jns[8] = 0X00000169
	elseif jn == "魂兮归来" then
		jns[1] = "魂兮归来！吟诵起古老乐歌的女魃墓弟子可倏忽间返回门派，平时状态下使用，可以瞬间回到自己的门派，成功率受技能等级影响"
		jns[3] = 0
		jns[4] = "10点气血、10点魔法"
		jns[5] = "“离魂”技能达到1级"
		jns[6] = "wzife.wd6"
		jns[7] = 0X00000105
		jns[8] = 0X00000170
	--天机城
	elseif jn == "神工无形" then
		jns[1] = "大道无形，大巧不工。以神为意，方可御甲万里。此技能是本门修行的基础。"
		jns[3] = 8
		jns[6] = "wzife.wd6"
		jns[7] = 0X00000070
		jns[8] = 0X00000070
	elseif jn == "攻玉以石" then
		jns[1] = "他山之石，可以攻玉。对友敌双方的深入研究，使你得以捭阖纵横，机变如神。"
		jns[3] = 8
		jns[6] = "wzife.wd6"
		jns[7] = 0X00000064
		jns[8] = 0X00000064
	elseif jn == "擎天之械" then
		jns[1] = "吾有偃甲，壮伟无伦，擎天蔽日，威压乾坤。施展此技能，召唤出擎天巨甲，造就一道敌人永难跨越的屏障。"
		jns[3] = 8
		jns[6] = "wzife.wd6"
		jns[7] = 0X00000065
		jns[8] = 0X00000065
	elseif jn == "千机奇巧" then
		jns[1] = "偃甲机簧精妙，毫厘之变，可激摇地拔山之能。精于偃术者，伏脉敌方之身，引发其懈怠之时，攻无不克。"
		jns[3] = 8
		jns[6] = "wzife.wd6"
		jns[7] = 0X00000069
		jns[8] = 0X00000069
	elseif jn == "匠心不移" then
		jns[1] = "御甲之人以全部精神贯注其中，方可操纵自如。习至得心应手，便可引领友方攻势。"
		jns[3] = 8
		jns[6] = "wzife.wd6"
		jns[7] = 0X00000066
		jns[8] = 0X00000066
	elseif jn == "运思如电" then
		jns[1] = "心窍开启，如有神助。修习此技能将令你心念如电，义理精要了然于胸。"
		jns[3] = 8
		jns[6] = "wzife.wd6"
		jns[7] = 0X00000068
		jns[8] = 0X00000068
	elseif jn == "探奥索隐" then
		jns[1] = "浩繁辰星，烂漫银河。有景如斯，心岂缚于俗务？引首以望，吾辈意在苍穹。此技能可迫使天地展露其秘密，万物兴歇尽在掌握。"
		jns[3] = 8
		jns[6] = "wzife.wd6"
		jns[7] = 0X00000067
		jns[8] = 0X00000067
	elseif jn == "一发而动" then
		jns[1] = "心念一动，身遂覆以偃甲。精心准备一枚零件，在回合结束时进入偃甲状态。 "
		jns[3] = 4
		jns[4] = "1个金鸦火羽，100点魔法"
		jns[5] = "角色化圣"
		jns[6] = "wzife.wd6"
		jns[7] = 0X00000099
		jns[8] = 0X00000164
	elseif jn == "针锋相对" then
		jns[1] = "针尖化为刀刃，敌人对你的锋锐将避无可避。物理攻击1～3名敌方单位，减少其对除了你之外的目标造成的所有伤害，可叠加3层。"
		jns[3] = 4
		jns[4] = "50点魔法"
		jns[5] = "“攻玉以石”技能达到25级"
		jns[6] = "wzife.wd6"
		jns[7] = 0X00000090
		jns[8] = 0X00000155
	elseif jn == "攻守易位" then
		jns[1] = "攻守二势，神意相通，臻于化境，转换自如。将你的“攻之械”和“守之械”互相转化。"
		jns[3] = 4
		jns[4] = "30点魔法"
		jns[5] = "“攻玉以石”技能达到120级且角色飞升"
		jns[6] = "wzife.wd6"
		jns[7] = 0X00000091
		jns[8] = 0X00000156
	elseif jn == "锋芒毕露" then
		jns[1] = "尽情展示偃甲魄力，使敌人如飞蛾扑火，无法将攻势从你身上转移。嘲讽1～5名敌方单位一定回合，使其攻击性行为以你为目标。"
		jns[3] = 4
		jns[4] = "50点魔法"
		jns[5] = "“擎天之械”技能达到25级"
		jns[6] = "wzife.wd6"
		jns[7] = 0X00000096
		jns[8] = 0X00000161
	elseif jn == "诱袭" then
		jns[1] = "巧用偃术，以逸待劳，诱导指定的敌人发动进攻，反击制胜。挑衅1名敌方目标，使其对你进行物理攻击并触发你的反击。"
		jns[3] = 4
		jns[4] = "70点魔法"
		jns[5] = "“千机奇巧”技能达到45级"
		jns[6] = "wzife.wd6"
		jns[7] = 0X00000088
		jns[8] = 0X00000153
	elseif jn == "匠心·破击" then
		jns[1] = "以偃术伏脉敌身，在适当时机激发，对其造成加倍伤害。对敌方单位造成固定伤害。"
		jns[3] = 4
		jns[4] = "（30*作用人数）点魔法"
		jns[5] = "“千机奇巧”技能达到1级"
		jns[6] = "wzife.wd6"
		jns[7] = 0X00000089
		jns[8] = 0X00000154
	elseif jn == "匠心·削铁" then
		jns[1] = "独运巧匠之心，令友伴的兵刃削铁如泥。增加1～5名友方单位本回合造成的所有伤害。"
		jns[3] = 3
		jns[4] = "100点魔法"
		jns[5] = "“匠心不移”技能达到120级且角色飞升"
		jns[6] = "wzife.wd6"
		jns[7] = 0X00000093
		jns[8] = 0X00000158
	elseif jn == "匠心·固甲" then
		jns[1] = "独运巧匠之心，令友伴的护甲坚不可摧。减少1～5名友方单位本回合受到的所有伤害。"
		jns[3] = 3
		jns[4] = "100点魔法"
		jns[5] = "“匠心不移”技能达到35级"
		jns[6] = "wzife.wd6"
		jns[7] = 0X00000094
		jns[8] = 0X00000159
	elseif jn == "匠心·蓄锐" then
		jns[1] = "独运巧匠之心，令友伴的元气平复如故。回复1～5名友方单位的气血。"
		jns[3] = 3
		jns[4] = "80点魔法"
		jns[5] = "“匠心不移”技能达到25级"
		jns[6] = "wzife.wd6"
		jns[7] = 0X00000095
		jns[8] = 0X00000160
	elseif jn == "天马行空" then
		jns[1] = "心至则身至，任天涯海角，瞬息便可回到门派之中。平时状态下使用，可以瞬间回到自己的门派"
		jns[3] = 4
		jns[4] = "10点气血、10点魔法"
		jns[5] = "“运思如电”技能达到1级"
		jns[6] = "wzife.wd6"
		jns[7] = 0X00000092
		jns[8] = 0X00000157
	elseif jn == "鬼斧神工" then
		jns[1] = "大巧之造，可夺天工，赋予装备惊神泣鬼之能。临时赋予腰带增加封印命中的功效，下线后消失"
		jns[3] = 4
		jns[4] = "和技能等级相同点数的活力"
		jns[5] = "“探奥索隐”技能达到35级且角色等级达到30级"
		jns[6] = "wzife.wd6"
		jns[7] = 0X00000097
		jns[8] = 0X00000162
	elseif jn == "移山填海" then
		jns[1] = "独揽自然之钥，运格物之力以辗轧敌人。克制花果山弟子的必杀技，使用后需要休息1回合，成功率受技能等级与目标等级之差影响 "
		jns[3] = 4
		jns[4] = "150点愤怒"
		jns[5] = "“探奥索隐”技能达到25级"
		jns[6] = "wzife.wd6"
		jns[7] = 0X00000098
		jns[8] = 0X00000163
	--花果山
	elseif jn == "神通广大" then
		jns[1] = "齐天大圣降妖伏魔，嫉恶如仇，其法术之高，神通广大，无所不能。通晓此技能，是本门修行的基础。"
		jns[3] = 8
		jns[6] = "wzife.wd6"
		jns[7] = 0X00000056
		jns[8] = 0X00000056
	elseif jn == "如意金箍" then
		jns[1] = "大禹治水之定海神针为齐天大圣的随身兵器，乌铁神珍，大小随心。习得此棒法可助力本门弟子给予对手重击，令其不敢小觑。"
		jns[3] = 8
		jns[6] = "wzife.wd6"
		jns[7] = 0X00000050
		jns[8] = 0X00000050
	elseif jn == "齐天逞胜" then
		jns[1] = "齐天大圣之名方可遂悟空之意，闹凌霄、撼东海、戏阎王，无一不为逞胜之举。花果山弟子均继承了此等威仪自信。"
		jns[3] = 8
		jns[6] = "wzife.wd6"
		jns[7] = 0X00000051
		jns[8] = 0X00000051
	elseif jn == "金刚之躯" then
		jns[1] = "孙悟空在太上老君的丹炉中用三昧真火足足炼了七七四十九日，锻成金刚之躯。花果山弟子也继承其坚韧躯体，凡刃不能伤。"
		jns[3] = 8
		jns[6] = "wzife.wd6"
		jns[7] = 0X00000055
		jns[8] = 0X00000055
	elseif jn == "灵猴九窍" then
		jns[1] = "混沌初分，鸿蒙始辨。花果山孕育仙石，上有九窍八孔，终于见风化作灵明石猴。此猴通变化，识天时，知地利，天地间一切似乎尽在其掌握。"
		jns[3] = 8
		jns[6] = "wzife.wd6"
		jns[7] = 0X00000052
		jns[8] = 0X00000052
	elseif jn == "七十二变" then
		jns[1] = "地煞之术，该当七十二般变化。可男可女，可老可少，可人可物，变化无穷，习此变化之术，天雷、阴火、赑风均可避之。"
		jns[3] = 8
		jns[6] = "wzife.wd6"
		jns[7] = 0X00000054
		jns[8] = 0X00000054
	elseif jn == "腾云驾霧" then
		jns[1] = "以云雾飞行于天穹，自在无穷。"
		jns[3] = 8
		jns[6] = "wzife.wd6"
		jns[7] = 0X00000053
		jns[8] = 0X00000053
	elseif jn == "威震凌霄" then
		jns[1] = "灵霄宝殿惊玉皇，十万天军无可挡。被大圣选定的攻击目标，其勇气和攻势将大大减弱。对目标造成伤害，并降低目标物理/法术暴击等级。"
		jns[3] = 4
		jns[4] = "100点魔法"
		jns[5] = "“神通广大”技能达到120级且角色飞升。"
		jns[6] = "wzife.wd6"
		jns[7] = 0X00000085
		jns[8] = 0X00000150
	elseif jn == "气慑天军" then
		jns[1] = "大闹天宫之际，虽有天军名将，仍震慑于大圣之气势，众人攻势均不能近其要害。对自己使用，大量提升抗物理/法术暴击等级。"
		jns[3] = 3
		jns[4] = "100点魔法"
		jns[5] = "“神通广大”技能达到120级且角色飞升。"
		jns[6] = "wzife.wd6"
		jns[7] = 0X00000086
		jns[8] = 0X00000151
	elseif jn == "当头一棒" then
		jns[1] = "迎头一棒，直截了当。花果山弟子之威不需掩饰，敢于侵犯者将被予以毫不留情的警告。临时提升伤害攻击一个敌方单位，目标气血百分比若处于60%~70%，造成双倍伤害。"
		jns[3] = 4
		jns[4] = "75点魔法"
		jns[5] = "“如意金箍”技能达到1级"
		jns[6] = "wzife.wd6"
		jns[7] = 0x00000071
		jns[8] = 0x00000136
	elseif jn == "神针撼海" then
		jns[1] = "神针撼动，东海倾波，龙宫不稳，海中生灵无一不处在你攻势的笼罩之下。对多个目标造成物理伤害。作用目标数=技能等级/35+1，最多5个。"
		jns[3] = 4
		jns[4] = "75点魔法"
		jns[5] = "“如意金箍”技能达到1级"
		jns[6] = "wzife.wd6"
		jns[7] = 0x00000072
		jns[8] = 0x00000137
	elseif jn == "杀威铁棒" then
		jns[1] = "面对敌人的嚣张气焰，花果山弟子的铁棒将大大煞其威风，令其对己攻势减弱。临时提升伤害攻击一个敌方单位，并降低目标本回合对自己的伤害。"
		jns[3] = 4
		jns[4] = "75点魔法"
		jns[5] = "“如意金箍”技能达到1级"
		jns[6] = "wzife.wd6"
		jns[7] = 0x00000073
		jns[8] = 0x00000138
	elseif jn == "泼天乱棒" then
		jns[1] = "金箍棒影覆盖整个天穹，热爱逐胜的花果山弟子，不会放过任何一名敌人。"
		jns[3] = 4
		jns[4] = "75点魔法"
		jns[5] = "“如意金箍”技能达到1级"
		jns[6] = "wzife.wd6"
		jns[7] = 0x00000074
		jns[8] = 0x00000139
	elseif jn == "九幽除名" then
		jns[1] = "在生死薄上划去自己名字，使得勾魂鬼差无法近身。"
		jns[3] = 3
		jns[4] = "75点魔法"
		jns[5] = "“齐天逞胜”技能达到1级"
		jns[6] = "wzife.wd6"
		jns[7] = 0x00000081
		jns[8] = 0x00000146
	elseif jn == "移星换斗" then
		jns[1] = "拥有偷天换地之能，可转换星斗的位置，借此影响自身属性的转变。"
		jns[3] = 3
		jns[4] = "30点气血"
		jns[5] = "“齐天逞胜”技能达到15级"
		jns[6] = "wzife.wd6"
		jns[7] = 0x00000082
		jns[8] = 0x00000147
	elseif jn == "云暗天昏" then
		jns[1] = "一棒之威，云暗天昏，星落云散，花果山弟子的速度也随这一棒的威力而提升。"
		jns[3] = 4
		jns[4] = "75点魔法"
		jns[5] = "“齐天逞胜”技能达到1级"
		jns[6] = "wzife.wd6"
		jns[7] = 0x00000083
		jns[8] = 0x00000148
	elseif jn == "担山赶月" then
		jns[1] = "力拔山河，肩挑日月，以盖世之力为装备附加力量。"
		jns[3] = 3
		jns[4] = "和技能等级相同点数的活力"
		jns[5] = "“金刚之躯”技能达到35级且角色等级达到30级"
		jns[6] = "wzife.wd6"
		jns[7] = 0x00000075
		jns[8] = 0x00000140
	elseif jn == "铜头铁臂" then
		jns[1] = "老君丹炉中练就铜头铁臂，勇猛强悍，刀枪不入。"
		jns[3] = 3
		jns[4] = "75点魔法"
		jns[5] = "“金刚之躯”技能达到1级"
		jns[6] = "wzife.wd6"
		jns[7] = 0x00000076
		jns[8] = 0x00000141
	elseif jn == "无所遁形" then
		jns[1] = "敌方弱点在你面前无所遁形，利用对方防守之缺陷予以狠狠一击。"
		jns[3] = 3
		jns[4] = "75点魔法"
		jns[5] = "“灵猴九窍”技能达到1级"
		jns[6] = "wzife.wd6"
		jns[7] = 0x00000079
		jns[8] = 0x00000144
	elseif jn == "天地洞明" then
		jns[1] = "祭此奇技，霎时间天地洞明，战场一切形势尽收眼中。"
		jns[3] = 4
		jns[4] = "1个金鸦火羽、50点魔法"
		jns[5] = "角色化圣"
		jns[6] = "wzife.wd6"
		jns[7] = 0x00000087
		jns[8] = 0x00000152
	elseif jn == "除光息焰" then
		jns[1] = "驾云布雨，止熄魔火，令炼焰失辉。"
		jns[3] = 4
		jns[4] = "150点愤怒"
		jns[5] = "“灵猴九窍”技能达到25级且角色等级达到20级"
		jns[6] = "wzife.wd6"
		jns[7] = 0x00000080
		jns[8] = 0x00000145
	elseif jn == "呼子唤孙" then
		jns[1] = "拔下一撮毫毛，一口仙气吹去，猴子猴孙纷纷来助。"
		jns[3] = 66
		jns[4] = "30点魔法"
		jns[5] = "“七十二变”技能达到10级"
		jns[6] = "wzife.wd6"
		jns[7] = 0x00000077
		jns[8] = 0x00000142
	elseif jn == "八戒上身" then
		jns[1] = "施展七十二般变化之术，将敌人变成一只没有威胁的小猪。"
		jns[3] = 4
		jns[4] = "50点魔法"
		jns[5] = "“七十二变”技能达到45级"
		jns[6] = "wzife.wd6"
		jns[7] = 0x00000078
		jns[8] = 0x00000143
	elseif jn == "筋斗云" then
		jns[1] = "一个筋斗十万八千里，无论在三界任一角落均可瞬间回到门派。"
		jns[3] = 0
		jns[4] = "10点气血、10点魔法"
		jns[5] = "“腾云驾雾”技能达到1级"
		jns[6] = "wzife.wd6"
		jns[7] = 0x00000084
		jns[8] = 0x00000149


	-- 女魃墓
	elseif jn == "腐蚀" then
		jns[1] = "你的怨灵和幻魔对带有诅咒的单位伤害提高1%*总层数。"
		jns[3] = 8
		jns[6] = "wzife.wd6"
		jns[7] = 0x00000223
		jns[8] = 0x00000223
	elseif jn == "引魂" then
		jns[1] = "与NPC战斗时：进入战斗时会立刻召唤一个怨灵，若因为没有怨灵使用焚魔烈焰失败，且回合结束时场上没有怨灵，则会获得随机1-2个怨灵；你的怨灵只会攻击处于“谜毒之缚、诡蝠之刑、怨怖之泣”的单位，且伤害提升100%。"
		jns[3] = 8
		jns[6] = "wzife.wd6"
		jns[7] = 0x00000224
		jns[8] = 0x00000224
	elseif jn == "咒怨" then
		jns[1] = "誓血之祭附带的诅咒提高为2层且伤害提高20%"
		jns[3] = 8
		jns[6] = "wzife.wd6"
		jns[7] = 0x00000225
		jns[8] = 0x00000225
	elseif jn == "不共戴天" then
		jns[1] = "以锥心刻骨之恸、之怨、之怒化作为三界至阴至狠之诅咒，令对手骨化形销。提高目标身上所有来自你的诅咒4层，并且本回合内，这些诅咒不会被清除。"
		jns[3] = 8
		jns[6] = "wzife.wd6"
		jns[7] = 0x00000226
		jns[8] = 0x00000226
	elseif jn == "灵诅" then
		jns[1] = "谜毒之缚、诡蝠之刑、怨怖之泣作用人数增加1。"
		jns[3] = 8
		jns[6] = "wzife.wd6"
		jns[7] = 0x00000227
		jns[8] = 0x00000227
	elseif jn == "噬魔" then
		jns[1] = "对人物单位造成的所有伤害提高10%。"
		jns[3] = 8
		jns[6] = "wzife.wd6"
		jns[7] = 0x00000228
		jns[8] = 0x00000228
	elseif jn == "异兆" then
		jns[1] = "使用唤灵·魂火有50%几率额外召唤一个怨灵"
		jns[3] = 8
		jns[6] = "wzife.wd6"
		jns[7] = 0x00000229
		jns[8] = 0x00000229
	elseif jn == "不灭" then
		jns[1] = "你的谜毒之缚、诡蝠之刑、怨怖之泣有6%*层数的几率无法被晶清诀和玉清诀解除。"
		jns[3] = 8
		jns[6] = "wzife.wd6"
		jns[7] = 0x00000230
		jns[8] = 0x00000230
	elseif jn == "灵威" then
		jns[1] = "你的法术击飞目标时，会召唤一个怨灵。"
		jns[3] = 8
		jns[6] = "wzife.wd6"
		jns[7] = 0x00000231
		jns[8] = 0x00000231
	elseif jn == "余烬" then
		jns[1] = "场上没有怨灵时，使用焚魔烈焰会牺牲所有幻魔，每个牺牲的幻魔将会临时增加3个作用目标和等级*1的法伤。"
		jns[3] = 8
		jns[6] = "wzife.wd6"
		jns[7] = 0x00000232
		jns[8] = 0x00000232
	elseif jn == "遗世" then
		jns[1] = "队伍中只有一个女魃墓弟子时，对方带有谜毒之缚、诡蝠之刑、怨怖之泣的单位被击飞时，获得状态“遗世”：你的下次焚魔烈焰不需要牺牲单位，持续3回合。"
		jns[3] = 8
		jns[6] = "wzife.wd6"
		jns[7] = 0x00000233
		jns[8] = 0x00000233
	elseif jn == "怒火" then
		jns[1] = "焚魔烈焰额外作用一个单位。"
		jns[3] = 8
		jns[6] = "wzife.wd6"
		jns[7] = 0x00000234
		jns[8] = 0x00000234
	elseif jn == "凋零" then
		jns[1] = "你的怨灵和幻魔受到的伤害降低10%。与玩家战斗时，召唤的首回合受到的伤害额外降低50%。"
		jns[3] = 8
		jns[6] = "wzife.wd6"
		jns[7] = 0x00000235
		jns[8] = 0x00000235
	elseif jn == "血泉" then
		jns[1] = "目标的每层谜毒之缚、诡蝠之刑、怨怖之泣会使得你炽火流离和誓血之祭造成的伤害提高3%。"
		jns[3] = 8
		jns[6] = "wzife.wd6"
		jns[7] = 0x00000236
		jns[8] = 0x00000236
	elseif jn == "俱灭" then
		jns[1] = "场上有怨灵时，炽火流离会额外消耗一个怨灵，此次法术必中且伤害提升30%，并且不会触发“降魔斗篷”、“蟠龙玉璧”。"
		jns[3] = 8
		jns[6] = "wzife.wd6"
		jns[7] = 0x00000237
		jns[8] = 0x00000237
	elseif jn == "焕然" then
		jns[1] = "你的怨灵增加15%气血。"
		jns[3] = 8
		jns[6] = "wzife.wd6"
		jns[7] = 0x00000238
		jns[8] = 0x00000238
	elseif jn == "伤蚀" then
		jns[1] = "你的怨灵/幻魔攻击时，有100%概率使目标获得随机诅咒。"
		jns[3] = 8
		jns[6] = "wzife.wd6"
		jns[7] = 0x00000239
		jns[8] = 0x00000239
	elseif jn == "狂焰" then
		jns[1] = "每个怨灵会使得你造成的伤害提高3%。"
		jns[3] = 8
		jns[6] = "wzife.wd6"
		jns[7] = 0x00000240
		jns[8] = 0x00000240
	elseif jn == "觉醒" then
		jns[1] = "回合结束时，每个在场的幻魔会使得你下回合速度提高5%。"
		jns[3] = 4
		jns[4] = "200点魔法"
		jns[6] = "wzife.wd6"
		jns[7] = 0x00000241
		jns[8] = 0x00000241
	elseif jn == "无相诛戮" then
		jns[1] = "天女魃自幼乖僻邪谬，冷厉无情，绝境之时，唤怨灵化炽焰，不惜伤及队友。对一个单位造成大量法术伤害，但己方已死人物会附带2回合死亡禁锢。（效果与“天罚之焰”等级、己方死亡人数相关）"
		jns[3] = 4
		jns[4] = "60点魔法"
		jns[6] = "wzife.wd6"
		jns[7] = 0x00000243
		jns[8] = 0x00000243
		jns[12] = "6回合"
	-- 天机城
	elseif jn == "锐志" then
		jns[1] = "提升锋芒毕露12%的基础命中率，且命中率上限增加至100%。"
		jns[3] = 8
		jns[6] = "wzife.wd6"
		jns[7] = 0x00000202
		jns[8] = 0x00000202
	elseif jn == "精奇" then
		jns[1] = "自身敏捷≥等级*3或力量≥等级*3时，增加武器伤害*18%的“破击”伤害。与NPC战斗时，随机获得1-2个零件。"
		jns[3] = 8
		jns[6] = "wzife.wd6"
		jns[7] = 0x00000203
		jns[8] = 0x00000203
	elseif jn == "善工" then
		jns[1] = "针锋相对对召唤兽、召唤物的伤害提升10%。"
		jns[3] = 8
		jns[6] = "wzife.wd6"
		jns[7] = 0x00000204
		jns[8] = 0x00000204
	elseif jn == "玄机" then
		jns[1] = "处于偃甲状态时，额外增加（15%+10%*攻之械数量）的抵抗封印几率，但不再增加伤害结果。"
		jns[3] = 8
		jns[6] = "wzife.wd6"
		jns[7] = 0x00000205
		jns[8] = 0x00000205
	elseif jn == "催锋" then
		jns[1] = "使用“匠心”类技能后，提升等级*1的伤害和封印命中等级，持续2回合。"
		jns[3] = 8
		jns[6] = "wzife.wd6"
		jns[7] = 0x00000206
		jns[8] = 0x00000206
	elseif jn == "巧偃" then
		jns[1] = "被“诱袭”的目标本回合受到的物理和法术伤害增加10%。"
		jns[3] = 8
		jns[6] = "wzife.wd6"
		jns[7] = 0x00000207
		jns[8] = 0x00000207
	elseif jn == "连枷" then
		jns[1] = "“破击”的首目标若处于“锋芒毕露”状态，则本回合强制进入法术封印状态，这个效果不能被“晶清诀”或“玉清诀”解除（不能被解除的效果对NPC无效）"
		jns[3] = 8
		jns[6] = "wzife.wd6"
		jns[7] = 0x00000208
		jns[8] = 0x00000208
	elseif jn == "断矶" then
		jns[1] = "如果目标同时带有“锋芒毕露”和“针锋相对”两种状态，则造成的所有伤害额外降低20%。"
		jns[3] = 8
		jns[6] = "wzife.wd6"
		jns[7] = 0x00000209
		jns[8] = 0x00000209
	elseif jn == "纯青" then
		jns[1] = "如果使用“针锋相对”时自身气血百分比大于目标，临时提升100点伤害力。"
		jns[3] = 8
		jns[6] = "wzife.wd6"
		jns[7] = 0x00000210
		jns[8] = 0x00000210
	elseif jn == "无痕" then
		jns[1] = "偃甲状态下被处于“锋芒毕露”的单位攻击时，攻之械带来的减少伤害效果提升20%。"
		jns[3] = 8
		jns[6] = "wzife.wd6"
		jns[7] = 0x00000211
		jns[8] = 0x00000211
	elseif jn == "奇肱" then
		jns[1] = "对召唤兽和召唤物的“针锋相对”持续时间翻倍，且无视目标的“神迹”和“高级神迹”。"
		jns[3] = 8
		jns[6] = "wzife.wd6"
		jns[7] = 0x00000212
		jns[8] = 0x00000212
	elseif jn == "攻云" then
		jns[1] = "对带有“针锋相对”的单位使用“破击”或“火炮之术”时，额外提升“你的伤害力*40%”的固定伤害。"
		jns[3] = 8
		jns[6] = "wzife.wd6"
		jns[7] = 0x00000213
		jns[8] = 0x00000213
	elseif jn == "造化" then
		jns[1] = "若场上处于来自于你的“锋芒毕露”的单位数量大于等于2个，则减少自身受到所有伤害10%。"
		jns[3] = 8
		jns[6] = "wzife.wd6"
		jns[7] = 0x00000214
		jns[8] = 0x00000214
	elseif jn == "天匠" then
		jns[1] = "偃甲状态下，连续使用匠心会增加（20%+12%*攻之械数量）的效果。"
		jns[3] = 8
		jns[6] = "wzife.wd6"
		jns[7] = 0x00000215
		jns[8] = 0x00000215
	elseif jn == "穷变" then
		jns[1] = "你的“针锋相对”被解除时，你的下次攻击额外获得等级*1的伤害力"
		jns[3] = 8
		jns[6] = "wzife.wd6"
		jns[7] = 0x00000216
		jns[8] = 0x00000216
	elseif jn == "鲸甲" then
		jns[1] = "偃甲状态使用原始愤怒消耗超过120的特技时，偃甲状态延长一回合。"
		jns[3] = 8
		jns[6] = "wzife.wd6"
		jns[7] = 0x00000217
		jns[8] = 0x00000217
	elseif jn == "天机神迹" then
		jns[1] = "回合结束时，如果本方没有玩家单位倒地，你获得2点抵抗封印等级，持续到战斗结束。"
		jns[3] = 8
		jns[6] = "wzife.wd6"
		jns[7] = 0x00000218
		jns[8] = 0x00000218
	elseif jn == "不厌" then
		jns[1] = "处于偃甲状态中，使用特技后回复攻之械*25的愤怒。"
		jns[3] = 8
		jns[6] = "wzife.wd6"
		jns[7] = 0x00000219
		jns[8] = 0x00000219
	elseif jn == "铜山铁壁" then
		jns[1] = "使得你的偃甲过载，提高自身防御，替友方所有单位承受一定次数的攻击。"
		jns[3] = 4
		jns[4] = "200点魔法"
		jns[6] = "wzife.wd6"
		jns[7] = 0x00000220
		jns[8] = 0x00000220
	elseif jn == "所向披靡" then
		jns[1] = "使你的偃甲过载，偃甲提升伤害的效果翻倍，对目标释放一次强力的“针锋相对”；如果本次攻击造成目标死亡，你的偃甲持续时间延长一回合。"
		jns[3] = 4
		jns[4] = "60点魔法"
		jns[6] = "wzife.wd6"
		jns[7] = 0x00000222
		jns[8] = 0x00000222
		jns[12] = "6回合"
	-- 花果山
	elseif jn == "顽心" then
		jns[1] = "使用普通攻击时，可以保留当前回合的如意神通至下回合。"
		jns[3] = 8
		jns[6] = "wzife.wd6"
		jns[7] = 0x00000181
		jns[8] = 0x00000181
	elseif jn == "逐胜" then
		jns[1] = "与NPC战斗时，你的普通攻击额外攻击一个单位，但普通攻击不再触发追加法术、无心插柳、嗜血幡。"
		jns[3] = 8
		jns[6] = "wzife.wd6"
		jns[7] = 0x00000182
		jns[8] = 0x00000182
	elseif jn == "愈勇" then
		jns[1] = "使用如意神通时，会使得自己造成的伤害增加2%，受到的伤害降低2%，持续到使用了防御、法宝或者特技为止，可叠加3层。"
		jns[3] = 8
		jns[6] = "wzife.wd6"
		jns[7] = 0x00000183
		jns[8] = 0x00000183
	elseif jn == "斗志" then
		jns[1] = "你使用的如意神通效果增加6%，但不在下回合随机出现。"
		jns[3] = 8
		jns[6] = "wzife.wd6"
		jns[7] = 0x00000184
		jns[8] = 0x00000184
	elseif jn == "忘形" then
		jns[1] = "使队伍中的每个玩家增加3%的物理暴击和法术暴击几率。（不可叠加）"
		jns[3] = 8
		jns[6] = "wzife.wd6"
		jns[7] = 0x00000185
		jns[8] = 0x00000185
	elseif jn == "贪天" then
		jns[1] = "你使用的如意神通有50%几率出现在下回合并且效果增加3%。"
		jns[3] = 8
		jns[6] = "wzife.wd6"
		jns[7] = 0x00000186
		jns[8] = 0x00000186
	elseif jn == "显圣" then
		jns[1] = "使用晶清诀、罗汉金钟的愤怒消耗下降8点，并且使你下回合可以使用任何如意神通。"
		jns[3] = 8
		jns[6] = "wzife.wd6"
		jns[7] = 0x00000187
		jns[8] = 0x00000187
	elseif jn == "锤炼" then
		jns[1] = "你的杀威铁棒造成暴击时，随机驱散目标的一个增益状态。"
		jns[3] = 8
		jns[6] = "wzife.wd6"
		jns[7] = 0x00000188
		jns[8] = 0x00000188
	elseif jn == "火眼" then
		jns[1] = "弱点击破造成的伤害增加50%。"
		jns[3] = 8
		jns[6] = "wzife.wd6"
		jns[7] = 0x00000189
		jns[8] = 0x00000189
	elseif jn == "闹天" then
		jns[1] = "你的当头一棒将提升15%的伤害结果。"
		jns[3] = 8
		jns[6] = "wzife.wd6"
		jns[7] = 0x00000190
		jns[8] = 0x00000190
	elseif jn == "铁骨" then
		jns[1] = "装备上的月亮石和翡翠石效果提升40%。"
		jns[3] = 8
		jns[6] = "wzife.wd6"
		jns[7] = 0x00000191
		jns[8] = 0x00000191
	elseif jn == "搅海" then
		jns[1] = "你的神针撼海对每个目标有10%的几率造成双倍伤害。"
		jns[3] = 8
		jns[6] = "wzife.wd6"
		jns[7] = 0x00000192
		jns[8] = 0x00000192
	elseif jn == "伏妖" then
		jns[1] = "增加（人物力量*10%+40）的伤害力"
		jns[3] = 8
		jns[6] = "wzife.wd6"
		jns[7] = 0x00000193
		jns[8] = 0x00000193
	elseif jn == "豪胆" then
		jns[1] = "额外获得10%暴击率。"
		jns[3] = 8
		jns[6] = "wzife.wd6"
		jns[7] = 0x00000194
		jns[8] = 0x00000194
	elseif jn == "压邪" then
		jns[1] = "连续两回合及以上使用如意神通时，临时提升等级*2的伤害力。"
		jns[3] = 8
		jns[6] = "wzife.wd6"
		jns[7] = 0x00000195
		jns[8] = 0x00000195
	elseif jn == "战魄" then
		jns[1] = "每次使用如意神通，获得（可使用如意神通数量*1）点愤怒。"
		jns[3] = 8
		jns[6] = "wzife.wd6"
		jns[7] = 0x00000196
		jns[8] = 0x00000196
	elseif jn == "不坏" then
		jns[1] = "自身气血≤气血上限*30%时，回复类药品效果提升30%。"
		jns[3] = 8
		jns[6] = "wzife.wd6"
		jns[7] = 0x00000197
		jns[8] = 0x00000197
	elseif jn == "荡魔" then
		jns[1] = "击倒目标时将立即增加12%的伤害结果，不可叠加，可刷新，持续2回合。"
		jns[3] = 8
		jns[6] = "wzife.wd6"
		jns[7] = 0x00000198
		jns[8] = 0x00000198
	elseif jn == "战神" then
		jns[1] = "造成人物、召唤兽、孩子、NPC单位死亡后，当回合内本方单位对人物单位造成的物理法术伤害提升8%，且你下回合额外随机一个如意神通。"
		jns[3] = 4
		jns[4] = "200点魔法"
		jns[6] = "wzife.wd6"
		jns[7] = 0x00000199
		jns[8] = 0x00000199
	elseif jn == "齐天神通" then
		jns[1] = "花果山弟子逆天而立，战天斗地，每回合使用如意神通均有50%的几率额外释放一次，但临时降低30%的抵抗封印能力，状态持续4回合"
		jns[3] = 4
		jns[4] = "60点魔法"
		jns[6] = "wzife.wd6"
		jns[7] = 0x00000201
		jns[8] = 0x00000201
		jns[12] = "8回合"








--孩子技能

	elseif jn == "龙腾　" then
		jns[1] = "施展法术攻击对方单人"
		jns[3] = 4
		jns[4] = "50点魔法"
		jns[6] = "wzife.wdf"
		jns[7] = 0xD80B146A
		jns[8] = 0xD80B146A
	elseif jn == "龙卷雨击　" then
		jns[1] = "施展法术攻击对方，技能达到一定等级后可攻击多人"
		jns[3] = 4
		jns[4] = "25点魔法，攻击多人时消耗增加"
		jns[6] = "wzife.wdf"
		jns[7] = 0x938AEA05
		jns[8] = 0x938AEA05
	elseif jn == "百毒不侵　" then
		jns[1] = "解毒并在一定回合内避免中毒"
		jns[3] = 5
		jns[4] = "30点魔法"
		jns[6] = "wzife.wdf"
		jns[7] = 0x13318204
		jns[8] = 0x13318204
	elseif jn == "烟雨剑法　" then
		jns[1] = "使用后可以连续攻击对手二次"
		jns[3] = 4
		jns[4] = "50点魔法"
		jns[6] = "wzife.wdf"
		jns[7] = 0x5761C661
		jns[8] = 0x5761C661
	elseif jn == "五雷轰顶　" then
		jns[1] = "减少敌人25%当前气血及魔法，但最高不会超过自己等级×50，失败只减少5%的当前气血"
		jns[3] = 4
		jns[4] = "50点魔法"
		jns[6] = "wzife.wdf"
		jns[7] = 0xC507BCBC
		jns[8] = 0xC507BCBC
	elseif jn == "飞砂走石　" then
		jns[1] = "使用后可以攻击对方多个对象"
		jns[3] = 4
		jns[4] = "30点魔法，攻击多人时消耗增加"
		jns[6] = "wzife.wdf"
		jns[7] = 0xE7D0E01C
		jns[8] = 0xE7D0E01C
	elseif jn == "修罗隐身　" then
		jns[1] = "战斗中隐藏自己或队友的身形，令对手无法攻击，隐身状态下不能施展法术。"
		jns[3] = 5
		jns[4] = "150点魔法，对自己使用每回合消耗施法者15点魔法，对队友使用每回合消耗施法者10点魔法。"
		jns[6] = "wzife.wdf"
		jns[7] = 0x6E023772
		jns[8] = 0x6E023772
	elseif jn == "金刚护体　" then
		jns[1] = "战斗中临时提高自己或队友的防御力，技能达到一定等级后可用于多人"
		jns[3] = 3
		jns[4] = "30点魔法"
		jns[6] = "wzife.wdf"
		jns[7] = 0xC9100668
		jns[8] = 0xC9100668
	elseif jn == "杨柳甘露　" then
		jns[1] = "使用后可以复活已经死亡的队友，可以复活处在“锢魂术”或者“死亡召唤”状态下剩余回合小于等于2的队友。"
		jns[3] = 5
		jns[4] = "150点魔法"
		jns[6] = "wzife.wdf"
		jns[7] = 0xEB5817E2
		jns[8] = 0xEB5817E2
	elseif jn == "天雷斩　" then
		jns[1] = "使用后可以给予敌人重击，并降低灵力。但自己也会减少物理防御力。"
		jns[3] = 4
		jns[4] = "30点魔法"
		jns[6] = "wzife.wdf"
		jns[7] = 0x5DD8E94B
		jns[8] = 0x5DD8E94B
	elseif jn == "杀气诀　" then
		jns[1] = "战斗中临时提高自己或队友的命中"
		jns[3] = 3
		jns[4] = "40点魔法"
		jns[6] = "wzife.wdf"
		jns[7] = 0x09372E8B
		jns[8] = 0x09372E8B
	elseif jn == "楚楚可怜　" then
		jns[1] = "停止行动并保护自己免受伤害"
		jns[3] = 5
		jns[4] = "30点魔法"
		jns[6] = "wzife.wdf"
		jns[7] = 0xA2EE76AA
		jns[8] = 0xA2EE76AA
	elseif jn == "五雷咒　" then
		jns[1] = "施展法术攻击对方单人"
		jns[3] = 4
		jns[4] = "30点魔法"
		jns[6] = "wzife.wdf"
		jns[7] = 0xEB230CF9
		jns[8] = 0xEB230CF9
	elseif jn == "后发制人　" then
		jns[1] = "休息一回合后临时提高伤害力、命中和速度，自动攻击目标"
		jns[3] = 4
		jns[4] = "最大气血的5%"
		jns[6] = "wzife.wdf"
		jns[7] = 0xBB71A17C
		jns[8] = 0xBB71A17C
	elseif jn == "三昧真火　" then
		jns[1] = "使用后可以攻击对方单个对象"
		jns[3] = 4
		jns[4] = "30点魔法"
		jns[6] = "wzife.wdf"
		jns[7] = 0x5E588E98
		jns[8] = 0x5E588E98
	elseif jn == "炼气化神　" then
		jns[1] = "一定回合内补充自己和队友的魔法"
		jns[3] = 3
		jns[4] = "作用人数*30点气血"
		jns[6] = "wzife.wdf"
		jns[7] = 0x0E9CDCFD
		jns[8] = 0x0E9CDCFD
	elseif jn == "姐妹同心　" then
		jns[1] = "战斗中使用，可以减少对手的魔法值"
		jns[3] = 4
		jns[4] = "50点魔法"
		jns[6] = "wzife.wdf"
		jns[7] = 0x74778781
		jns[8] = 0x74778781
	elseif jn == "定身符　" then
		jns[1] = "概率令对手一定回合停止行动，并降低法术防御力"
		jns[3] = 4
		jns[4] = "60点魔法"
		jns[6] = "wzife.wdf"
		jns[7] = 0x046977F8
		jns[8] = 0x046977F8
	elseif jn == "活血　" then
		jns[1] = "使用后可以恢复队友的气血和气血上限"
		jns[3] = 6
		jns[4] = "70点魔法，非战斗时减半"
		jns[6] = "wzife.wdf"
		jns[7] = 0xEA7F436C
		jns[8] = 0xEA7F436C
	elseif jn == "极度疯狂　" then
		jns[1] = "受到物理攻击时会自动反击敌人"
		jns[3] = 5
		jns[4] = "30点魔法"
		jns[6] = "wzife.wdf"
		jns[7] = 0xD65442FC
		jns[8] = 0xD65442FC
	elseif jn == "日光华　" then
		jns[1] = "施展法术攻击多人，并附加固定伤害"
		jns[3] = 4
		jns[4] = "50点魔法"
		jns[6] = "wzife.wdf"
		jns[7] = 0xA86A02EB
		jns[8] = 0xA86A02EB
	elseif jn == "威慑　" then
		jns[1] = "令怪物或玩家召唤兽无法行动，不能对玩家使用"
		jns[3] = 4
		jns[4] = "20点魔法"
		jns[6] = "wzife.wdf"
		jns[7] = 0xA137ABDF
		jns[8] = 0xA137ABDF
	elseif jn == "勾魂　" then
		jns[1] = "恢复自身气血，减少对方一定的气血"
		jns[3] = 4
		jns[4] = "40点魔法"
		jns[6] = "wzife.wdf"
		jns[7] = 0x786BF450
		jns[8] = 0x786BF450
	elseif jn == "裂石　" then
		jns[1] = "临时提升必杀几率对单个敌人进行物理攻击"
		jns[3] = 4
		jns[4] = "50点魔法"
		jns[6] = "wzife.wd4"
		jns[7] = 0xE02C7382
		jns[8] = 0xE02C7382
	elseif jn == "不动如山　" then
		jns[1] = "使用后减少自身受到的法术伤害与物理伤害。"
		jns[3] = 5
		jns[4] = "150点魔法"
		jns[6] = "wzife.wd4"
		jns[7] = 0xCF1CE630
		jns[8] = 0xCF1CE630
	elseif jn == "雾杀　" then
		jns[1] = "使用法术攻击敌方单人目标，对敌人造成持续毒性伤害。"
		jns[3] = 4
		jns[4] = "150点魔法"
		jns[6] = "wzife.wd4"
		jns[7] = 0x0DBDFE1D
		jns[8] = 0x0DBDFE1D
	elseif jn == "蜜润　" then
		jns[1] = "增加己方多人的法术伤害力。 "
		jns[3] = 5
		jns[4] = "人数*25点魔法"
		jns[6] = "wzife.wd4"
		jns[7] = 0x2FAC40E2
		jns[8] = 0x2FAC40E2
	elseif jn == "金身舍利　" then
		jns[1] = "使己方多人一定回合内承受的法术伤害结果减少"
		jns[3] = 5
		jns[4] = "100点魔法"
		jns[6] = "wzife.wd4"
		jns[7] = 0xFFD44324
		jns[8] = 0xFFD44324
	elseif jn == "地涌金莲　" then
		jns[1] = "恢复自己或者队友的气血与气血上限"
		jns[3] = 3
		jns[4] = "50点魔法"
		jns[6] = "wzife.wd4"
		jns[7] = 0x081C0AA4
		jns[8] = 0x081C0AA4
	elseif jn == "还魂咒" then
		jns[1] = "施展法术复活死去的同伴，同时恢复其一定气血，大概为孩子等级×2的血量。"
		jns[3] = 5
		jns[4] = "150点魔法"
		jns[6] = "wzife.wdf"
		jns[7] = 0x987B0EEE
		jns[8] = 0x987B0EEE
	elseif jn == "治疗" then
		jns[1] = "为目标恢复一定量的气血和小部分气血上限，效果受孩子等级影响。(恢复气血=孩子等级*4+50点)。"
		jns[3] = 5
		jns[4] = "50点魔法"
		jns[6] = "wzife.wdf"
		jns[7] = 0x86E4409F
		jns[8] = 0x86E4409F
	elseif jn == "蚩尤之搏" then
		jns[1] = "突破对手一定防御力后进行攻击。"
		jns[3] = 4
		jns[4] = "50点魔法"
		jns[6] = "wzife.wdf"
		jns[7] = 0x2F2CB896
		jns[8] = 0x2F2CB896
	elseif jn == "仙人指路" then
		jns[1] = "恢复目标队友气血，并在回合结束时解除其封类异常状态。"
		jns[3] = 5
		jns[4] = "20点魔法"
		jns[6] = "wzife.wd2"
		jns[7] = 0x8F3BA732
		jns[8] = 0x8F3BA732
	elseif jn == "四面埋伏" then
		jns[1] = "提升目标队友的封印法术的命中率11%(只在该队友气血≤40%时才生效)；效果持续4回合。"
		jns[3] = 5
		jns[4] = "50点魔法"
		jns[6] = "wzife.wd2"
		jns[7] = 0xE2CDD1D3
		jns[8] = 0xE2CDD1D3
	elseif jn == "赴汤蹈火" then
		jns[1] = "提高HP:540点。\n提高法术防御:162点。"
		jns[3] = 7
		jns[4] = "50点魔法"
		jns[6] = "wzife.wd2"
		jns[7] = 0x1dbafffc
		jns[8] = 0x1dbafffc
	elseif jn == "千锤百炼" then
		jns[1] = "提高HP:540点。\n提高法术防御:306点。"
		jns[3] = 7
		jns[4] = "50点魔法"
		jns[6] = "wzife.wd4"
		jns[7] = 0x0B683A44
		jns[8] = 0x0B683A44
	elseif jn == "开门见山" then
		jns[1] = "提高HP.38O点。提高物理攻击结果100点。"
		jns[3] = 7
		jns[4] = "50点魔法"
		jns[6] = "wzife.wd2"
		jns[7] = 0x6ee33a3f
		jns[8] = 0x6ee33a3f
	elseif jn == "张弛有道" then
		jns[1] = "每回合结束时，都获得1层秘法能量，使你下一次法术攻击效果增加。随等级、悟性、层数增加.秘法能量在生效后消失，最多叠加2层.——对了，就是这个节奏,虽然没有加技能特效但是伤害确实加了 2层增加百分之10伤害。"
		jns[3] = 7
		jns[4] = "50点魔法"
		jns[6] = "wzife.wd2"
		jns[7] = 0xdc6ae286
		jns[8] = 0xdc6ae286
	elseif jn == "峰回路转" then
		jns[1] = "当你进场时，立即为全体队友恢复HP。"
		jns[3] = 7
		jns[4] = "50点魔法"
		jns[6] = "wzife.wd4"
		jns[7] = 0x0B683A43
		jns[8] = 0x0B683A43





	end
	return jns
end