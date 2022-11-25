--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
--======================================================================--
function 引擎.取头像(jp)
	local jps = {}
	if jp == "虎头怪" then
		jps[2] = 1845064969
		jps[3] = 2571786186
		jps[4] = 1584078605
		jps[5] = 3359055550
		jps[6] = 865988562
		jps[8] = 0X00000004
		jps[7] = "wzife.wdf"
		jps[11] = 0x1014
		jps[12] = "自用"
	elseif jp == "GM" then
		jps[4] = 2954963460
		jps[7] = "wzife.wdf"
	elseif jp == "男人_马副将" then
		jps[4] = 0x67B62ED5
		jps[7] = "wzife.wdf"
	elseif jp == "男人_钟馗" then
		jps[4] = 911604837
		jps[7] = "wzife.wdf"
   	elseif jp == "五行大师" or jp == "男人_方丈" then
		jps[4] = 0x0A0BC629
		jps[7] = "wzife.wdf"
   	elseif jp == "热心仙人" then
		jps[4] = 0x12210C6A
		jps[7] = "wzife.wdf"
    elseif jp == "马猴" then
		jps[4] = 0x87DB4BCC
		jps[7] = "wzife.wdf"
    elseif jp == "珍品商人" then
		jps[4] = 0x1C9CBA0C
		jps[7] = "wzife.wdf"
    elseif jp == "白无常" then
		jps[4] = 0x2EAD989A
		jps[7] = "wzife.wdf"
	elseif jp == "黑无常" then
		jps[4] = 0x8CAD1F2F
		jps[7] = "wzife.wdf"
	elseif jp == "男人_将军" then
		jps[4] = 1892571830
		jps[7] = "wzife.wdf"
	elseif jp == "女人_染色师" then
		jps[4] = 480033292
		jps[7] = "wzife.wdf"
	elseif jp == "男人_衙役" then
		jps[4] = 4162524865
		jps[7] = "wzife.wdf"
	elseif jp == "舞天姬" then
		jps[2] = 4183923439
		jps[3] = 837105923
		jps[4] = 3547289847
		jps[5] = 2410388328
		jps[6] = 783365583
		jps[8] = 0X00000009
		jps[7] = "wzife.wdf"
		jps[11] = 0x103
		jps[12] = "自用"
   	elseif jp == "罗百万" then
		jps[4] = 0x00F98F61
		jps[7] = "wzife.wdf"
   	elseif jp == "太白金星" then
		jps[4] = 0x3E2EE17D
		jps[7] = "wzife.wdf"
    elseif jp == "南极仙翁" then
		jps[4] = 0x304E494E
		jps[7] = "wzife.wdf"
    elseif jp == "孙悟空" then
		jps[4] = 0x3FA3472C
		jps[7] = "wzife.wdf"
   	elseif jp == "少女" then
		jps[4] = 0x421D6F27
		jps[7] = "wzife.wdf"
   	elseif jp == "陈妈妈" then
		jps[4] = 0x0E756971
		jps[7] = "wzife.wdf"
    elseif jp == "文伯" then
		jps[4] = 0x61117204
		jps[7] = "wzife.wdf"
   	elseif jp == "袁天罡" then
		jps[4] = 0xF9CC9FCF
		jps[7] = "wzife.wdf"
	elseif jp == "男人_老伯" then
		jps[4] = 1628533252
		jps[7] = "wzife.wdf"
	elseif jp == "女人_赵姨娘" then
		jps[4] = 2355335750
		jps[7] = "wzife.wdf"
	elseif jp == "仓库保管员" then
		jps[4] = 0x6081AD14
		jps[7] = "wzife.wdf"
	elseif jp == "奸商" then
		jps[4] = 0x0BB9C549
		jps[7] = "shape.wdf"
	elseif jp == "女人_程夫人" then
		jps[4] = 1679184112
		jps[7] = "wzife.wdf"
	elseif jp == "龙太子" then
		jps[2] = 2968964991
		jps[3] = 3724855951
		jps[4] = 269238848
		jps[5] = 1570362097
		jps[6] = 2585947038
		jps[8] = 0X00000007
		jps[7] = "wzife.wdf"
		jps[11] = 0x1010
		jps[12] = "自用"
	elseif jp == "男人_巫医" then
		jps[4] = 4118131077
		jps[7] = "wzife.wdf"
	elseif jp == "神天兵" then
		jps[2] = 3633356312
		jps[3] = 2078571550
		jps[4] = 419903813
		jps[5] = 3805405383
		jps[6] = 2041810656
		jps[8] = 0X00000008
		jps[7] = "wzife.wdf"
		jps[11] = 0x105
		jps[12] = "自用"
	elseif jp == "男人_兰虎" then
		jps[4] = 2294980292
		jps[7] = "wzife.wdf"
	-- elseif jp == "神树" then
	-- 	jps[4] = 2294980292
	-- 	jps[7] = "wzife.wdf"
	elseif jp == "帮派机关人" then
		jps[4] = 2294980292
		jps[7] = "wzife.wdf"
	elseif jp == "帮派传送" then
		jps[4] = 2294980292
		jps[7] = "wzife.wdf"
	elseif jp == "逍遥生" then
		jps[2] = 3988784113
		jps[3] = 2557559806
		jps[4] = 4177070114
		jps[5] = 3996010872
		jps[6] = 92987728
		jps[8] = 0X00000010
		jps[7] = "wzife.wdf"
		jps[11] = 0x104
		jps[12] = "自用"
	elseif jp == "男人_师爷" then
		jps[4] = 1814687522
		jps[7] = "wzife.wdf"
	elseif jp == "女人_王大嫂" then
		jps[4] = 1960181513
		jps[7] = "wzife.wdf"
	elseif jp == "小孩_雷黑子" then
		jps[4] = 228320831
		jps[7] = "wzife.wdf"
	elseif jp == "小孩_飞儿" then
		jps[4] = 532741292
		jps[7] = "wzife.wdf"
	elseif jp == "女人_丫鬟" then
		jps[4] = 1109225255
		jps[7] = "wzife.wdf"
	elseif jp == "偃无师" then
		jps[2] = 10559816
		jps[3] = 10559817
		jps[4] = 10559815
		jps[5] = 10559824
		jps[6] = 10559814
		jps[8] = 0X00000015
		jps[7] = "wzife.wd5"
		jps[11] = 0x109
		jps[12] = "自用"
	elseif jp == "女人_万圣公主" then
		jps[4] = 779713906
		jps[7] = "wzife.wdf"
	elseif jp == "男人_钓鱼" then
		jps[4] = 3801299271
		jps[7] = "wzife.wdf"
	elseif jp == "男人_道士" then
		jps[4] = 2438497070
		jps[7] = "wzife.wdf"
	elseif jp == "男人_土地" then
		jps[4] = 1388762331
		jps[7] = "wzife.wdf"
	elseif jp == "程咬金" or jp == "程咬金" then
		jps[4] = 1487235894
		jps[7] = "wzife.wdf"
	elseif jp == "男人_村长" then
		jps[4] = 3943196492
		jps[7] = "wzife.wdf"
	elseif jp == "男人_苦力" then
		jps[4] = 3813740252
		jps[7] = "wzife.wdf"
	elseif jp == "男人_酒店老板" then
		jps[4] = 822917658
		jps[7] = "wzife.wdf"
	elseif jp == "玄彩娥" then
		jps[2] = 1823274963
		jps[3] = 1560323955
		jps[4] = 2423018618
		jps[5] = 947503475
		jps[6] = 838654255
		jps[8] = 0X00000011
		jps[7] = "wzife.wdf"
		jps[11] = 0x1015
		jps[12] = "自用"
	elseif jp == "空度禅师" or jp == "空度禅师" then
		jps[4] = 168543785
		jps[7] = "wzife.wdf"
	elseif jp == "杀破狼" then
		jps[2] = 2873683137
		jps[3] = 2518794069
		jps[4] = 3753428933
		jps[5] = 1033988096
		jps[6] = 1978306148
		jps[8] = 0X00000017
		jps[7] = "wzife.wdf"
		jps[11] = 0x1011
		jps[12] = "自用"
	elseif jp == "鬼潇潇" then
		jps[2] = 10559800
		jps[3] = 10559809
		jps[4] = 10559801
		jps[5] = 10559826
		jps[6] = 10559808
		jps[8] = 0X00000013
		jps[7] = "wzife.wd5"
		jps[11] = 0x1017
		jps[12] = "自用"
	elseif jp == "男人_驿站老板" then
		jps[4] = 2033100888
		jps[7] = "wzife.wdf"
	elseif jp == "男人_老孙头" then
		jps[4] = 112144826
		jps[7] = "wzife.wdf"
	elseif jp == "男人_老财" then
		jps[4] = 4009791583
		jps[7] = "wzife.wdf"
	elseif jp == "桃夭夭" then
		jps[2] = 10559810
		jps[3] = 10559813
		jps[4] = 10559811
		jps[5] = 10559825
		jps[6] = 10559812
		jps[8] = 0X00000014
		jps[7] = "wzife.wd5"
		jps[11] = 0x107
		jps[12] = "自用"
	elseif jp == "巫蛮儿" then
		jps[2] = 1969001626
		jps[3] = 4127390861
		jps[4] = 1288146214
		jps[5] = 2569948308
		jps[6] = 2921462013
		jps[8] = 0X00000016
		jps[7] = "wzife.wdf"
		jps[11] = 0x1013
		jps[12] = "自用"
	elseif jp == "男人_财主" then
		jps[4] = 1238039746
		jps[7] = "wzife.wdf"
	elseif jp == "英女侠" then
		jps[2] = 4082176052
		jps[3] = 1714055813
		jps[4] = 112453972
		jps[5] = 1619905405
		jps[6] = 3703514110
		jps[8] = 0X00000012
		jps[7] = "wzife.wdf"
		jps[11] = 0x102
		jps[12] = "自用"
	elseif jp == "男人_老书生" then
		jps[4] = 2687352542
		jps[7] = "wzife.wdf"
	elseif jp == "男人_武器店老板" then
		jps[4] = 1972346464
		jps[7] = "wzife.wdf"
	elseif jp == "狐美人" then
		jps[2] = 193125810
		jps[3] = 1337913854
		jps[4] = 3274417234
		jps[5] = 764631086
		jps[6] = 507487855
		jps[8] = 0X00000003
		jps[7] = "wzife.wdf"
		jps[11] = 0x108
		jps[12] = "自用"
	elseif jp == "剑侠客" then
		jps[2] = 3615876352
		jps[3] = 3402595886
		jps[4] = 1410056737
		jps[5] = 366914688
		jps[6] = 485626985
		jps[8] = 0X00000005
		jps[7] = "wzife.wdf"
		jps[11] = 0x106
		jps[12] = "自用"
	elseif jp == "男人_服装店老板" then
		jps[4] = 873292509
		jps[7] = "wzife.wdf"
	elseif jp == "男人_特产商人" then
		jps[4] = 820615594
		jps[7] = "wzife.wdf"
	elseif jp == "男人_店小二" then
		jps[4] = 1314051870
		jps[7] = "wzife.wdf"
	elseif jp == "男人_胖和尚" then
		jps[4] = 2343936794
		jps[7] = "wzife.wdf"
	elseif jp == "羽灵神" then
		jps[2] = 4194685178
		jps[3] = 983360139
		jps[4] = 1939929797
		jps[5] = 311711491
		jps[6] = 415704253
		jps[8] = 0X00000018
		jps[7] = "wzife.wdf"
		jps[11] = 0x101
		jps[12] = "自用"
	elseif jp == "男人_药店老板" then
		jps[4] = 3265788014
		jps[7] = "wzife.wdf"
	elseif jp == "普陀山_接引仙女" or jp == "普陀_接引仙女" then
		jps[4] = 2139408709
		jps[7] = "wzife.wdf"
	elseif jp == "飞燕女" then
		jps[2] = 343987807
		jps[3] = 2821539099
		jps[4] = 1784035300
		jps[5] = 819471807
		jps[6] = 3149034421
		jps[8] = 0X00000001
		jps[7] = "wzife.wdf"
		jps[11] = 0x1012
		jps[12] = "自用"
	elseif jp == "男人_小白龙" then
		jps[4] = 4193268133
		jps[7] = "wzife.wdf"
	elseif jp == "巨魔王" then
		jps[2] = 1285321634
		jps[3] = 2476120802
		jps[4] = 3683691832
		jps[5] = 4077790929
		jps[6] = 3295538630
		jps[8] = 0X00000006
		jps[7] = "wzife.wdf"
		jps[11] = 0x1018
		jps[12] = "自用"
	elseif jp == "骨精灵" then
		jps[2] = 1580183394
		jps[3] = 2126719765
		jps[4] = 3992137269
		jps[5] = 1433642861
		jps[6] = 2072196139
		jps[8] = 0X00000002
		jps[7] = "wzife.wdf"
		jps[11] = 0x1016
		jps[12] = "自用"
	elseif jp == "男人_书生" then
		jps[4] = 2000255336
		jps[7] = "wzife.wdf"
	elseif jp == "女兵" then
		jps[4] = 0x3483A111
		jps[7] = "wzife.wdf"

   elseif jp == "校尉" then
		jps[4] = 0x1CA66D04
		jps[7] = "wzife.wdf"
	elseif jp == "男人_镖头" then
		jps[4] = 3664176840
		jps[7] = "wzife.wdf"
	elseif jp == "东海龙王" then
		jps[4] = 0xECF36B2F
		jps[7] = "wzife.wdf"
	elseif jp == "菩提祖师" then
		jps[4] = 0x8D656188
		jps[7] = "wzife.wdf"
	-- 宝宝
	elseif jp == "老虎" then
		jps[1] = 2884944692
		jps[2] = 112797492
		jps[4] = 733899105
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wdf"
	elseif jp == "白熊" or jp == "进阶白熊" then
		jps[1] = 2688180973
		jps[2] = 1239205038
		jps[4] = 2829996846
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wdf"
	elseif jp == "狐狸精" then
		jps[1] = 2947372452
		jps[2] = 2595406262
		jps[4] = 3804079655
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wdf"
	elseif jp == "巨蛙" then
		jps[1] = 2912434813
		jps[2] = 764214178
		jps[4] = 2659602767
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wdf"
	elseif jp == "虾兵" then
		jps[1] = 3699130960
		jps[2] = 4286860295
		jps[4] = 2735321589
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wdf"
	elseif jp == "海星" then
		jps[1] = 4177785765
		jps[2] = 4143729758
		jps[4] = 3719397389
		jps[7] = "wzife.wd3"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wd3"
	elseif jp == "小龙女" then
		jps[1] = 1011216828
		jps[2] = 1290256383
		jps[4] = 988341833
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wdf"
	elseif jp == "山贼" then
		jps[1] = 2782152284
		jps[2] = 3976779107
		jps[4] = 1728913426
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wdf"
	elseif jp == "浣熊" then
		jps[1] = 552439695
		jps[2] = 3177371809
		jps[4] = 0xFDDAB4FC
		jps[7] = "wzife.wd3"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wd3"
	elseif jp == "风伯" or jp == "进阶风伯" then
		jps[1] = 3248391626
		jps[2] = 719745696
		jps[4] = 941642663
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wdf"
	elseif jp == "大蝙蝠" then
		jps[1] = 3439573428
		jps[2] = 2431427618
		jps[4] = 1786934327
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wdf"
	elseif jp == "牛头" then
		jps[1] = 1840812657
		jps[2] = 3453038788
		jps[4] = 393688350
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wdf"
	elseif jp == "强盗" then
		jps[1] = 2428037866
		jps[2] = 845989318
		jps[4] = 3523609487
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wdf"
	elseif jp == "骷髅怪" then
		jps[1] = 2097826905
		jps[2] = 3814241482
		jps[4] = 4216884852
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wdf"
	elseif jp == "超级腾蛇" or jp == "进阶超级腾蛇" then
		jps[1] = 357833101
		jps[2] = 2971200744
		jps[4] = 1727184564
		jps[7] = "wzife.wd4"
		jps[8] = "wzife.wd4"
		jps[10] = "wzife.wd4"
	--elseif jp == "超级周杰伦" or jp == "进阶超级周杰伦" then
		--jps[1] = 0xF24FA5D2
		--jps[2] = 0xFF6CA52A
		--jps[4] = 0xF24FA5D2
		--jps[7] = "xzsc.wdf"----中小没有
		--jps[8] = "xzsc.wdf"----中小没有
		--jps[10] = "xzsc.wdf"----中小没有
	elseif jp == "超级青鸾" or jp == "进阶超级青鸾" then
		jps[1] = 3498430262
		jps[2] = 163881352
		jps[4] = 3232229809
		jps[7] = "wzife.wd4"
		jps[8] = "wzife.wd4"
		jps[10] = "wzife.wd4"
	elseif jp == "超级海豚" or jp == "进阶超级海豚" then
		jps[1] = 2864684382
		jps[2] = 3378538574
		jps[4] = 4012567479
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd4"
		jps[10] = "wzife.wd1"
	elseif jp == "树怪" then
		jps[1] = 807943717
		jps[2] = 2097599408
		jps[4] = 3820368751
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wdf"
	elseif jp == "羊头怪" then
		jps[1] = 3067158065
		jps[2] = 3446812620
		jps[4] = 2748895041
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wdf"
	elseif jp == "蛤蟆精" then
		jps[1] = 3933407599
		jps[2] = 4282820336
		jps[4] = 2880820579
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wdf"
	elseif jp == "海毛虫" then
		jps[1] = 2192983959
		jps[2] = 1468443994
		jps[4] = 3386223660
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wdf"
	elseif jp == "野猪" then
		jps[1] = 3747647005
		jps[2] = 142547082
		jps[4] = 3173891907
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wdf"
	elseif jp == "超级白泽" or jp == "进阶超级白泽" then
		jps[1] = 395177473
		jps[2] = 1752548678
		jps[4] = 1574100738
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd4"
		jps[10] = "wzife.wdf"
	elseif jp == "赌徒" then
		jps[1] = 502917217
		jps[2] = 112240141
		jps[4] = 4236512932
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wdf"
	elseif jp == "野鬼" then
		jps[1] = 1865790315
		jps[2] = 1650865768
		jps[4] = 1597484578
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wdf"
	elseif jp == "雷鸟人" or jp == "进阶雷鸟人" then
		jps[1] = 607493950
		jps[2] = 2817403771
		jps[4] = 1747934471
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wdf"
	elseif jp == "进阶鬼将" then
		jps[1] = 1902560432
		jps[2] = 2605733564
		jps[4] = 2127129827
		jps[7] = "wzife.wd3"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wd3"
	elseif jp == "天将" or jp == "进阶天将" then
		jps[1] = 723502434
		jps[2] = 2029126872
		jps[4] = 4080269364
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wdf"
	elseif jp == "空度禅师" then
		jps[1] = 3469228247
		jps[2] = 3469228247
		jps[4] = 2722670730
		jps[7] = "wzife.wdf"
		jps[8] = "wzife.wdf"
		jps[10] = "wzife.wd3"
	elseif jp == "超级泡泡" or jp == "进阶超级泡泡" then
		jps[1] = 1858466588
		jps[2] = 1565116319
		jps[4] = 3604737905
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd4"
		jps[10] = "wzife.wdf"
		elseif jp == "马面" then
		jps[1] = 933979823
		jps[2] = 2781336139
		jps[4] = 2826138416
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wdf"
		elseif jp == "黑熊" then
		jps[1] = 957649333
		jps[2] = 1902947395
		jps[4] = 1870817946
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wdf"
		elseif jp == "泪妖" or jp == "进阶泪妖" then
		jps[1] = 17
		jps[2] = 18
		jps[4] = 19
		jps[7] = "wzife.wd5"
		jps[8] = "wzife.wd5"
		jps[10] = "wzife.wd5"
		elseif jp == "超级神虎" or jp == "进阶超级神虎" then
		jps[1] = 806836571
		jps[2] = 3693409752
		jps[4] = 2632798018
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd1"
		jps[10] = "wzife.wd1"
		--jps[7] = "wzife.wd1"
		--jps[8] = "wzife.wd4"
		--jps[10] = "wzife.wdf"
	elseif jp == "泡泡" then
		jps[1] = 4050677707
		jps[2] = 55973808
		jps[4] = 0xFF17FA58
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wdf"
		elseif jp == "大海龟" then
		jps[1] = 2714859661
		jps[2] = 3281946778
		jps[4] = 317880455
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wdf"
	elseif jp == "灵灯侍者" or jp == "进阶灵灯侍者" then
		jps[1] = 0x531C4EFB
		jps[2] = 0x531C4EFB
		jps[4] = 0x5365A558
		jps[7] = "wzife.wd4"
		jps[8] = "wzife.wd4"
		jps[10] = "wzife.wd4"
	elseif jp == "芙蓉仙子" or jp == "进阶芙蓉仙子" then
		jps[1] = 4121905597
		jps[2] = 2793865041
		jps[4] = 2671553122
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wdf"
		elseif jp == "如意仙子" or jp == "进阶如意仙子" then
		jps[1] = 4121347566
		jps[2] = 492761196
		jps[4] = 3454607497
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wdf"
		elseif jp == "护卫" then
		jps[1] = 3003124902
		jps[2] = 460123928
		jps[4] = 2830645755
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wdf"
		elseif jp == "星灵仙子" or jp == "进阶星灵仙子" then
		jps[1] = 755477669
		jps[2] = 3031617140
		jps[4] = 2030386776
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wdf"
		elseif jp == "章鱼" then
		jps[1] = 2360372717
		jps[2] = 3338733597
		jps[4] = 1091680315
		jps[7] = "wzife.wd3"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wd3"
	elseif jp == "超级神牛" or jp == "进阶超级神牛" then
		jps[1] = 2770367868
		jps[2] = 8920964
		jps[4] = 1407891169
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd4"
		jps[10] = "wzife.wd1"
	elseif jp == "持法天神" or jp == "进阶持法天神" then
		jps[1] = 0x531C4EFB
		jps[2] = 0x531C4EFB
		jps[4] = 0x5365A558
		jps[7] = "wzife.wd4"
		jps[8] = "wzife.wd4"
		jps[10] = "wzife.wd4"
	elseif jp == "凤凰" then
		jps[1] = 2850234683
		jps[2] = 596053716
		jps[4] = 3458040871
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wdf"
	elseif jp == "巡游天神" or jp == "进阶巡游天神" then
		jps[1] = 3987773111
		jps[2] = 2100382667
		jps[4] = 2044247984
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wdf"
	elseif jp == "雨师" or jp == "进阶雨师" then
		jps[1] = 2200353018
		jps[2] = 19291017
		jps[4] = 1537957474
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wdf"
	elseif jp == "花妖" then
		jps[1] = 2338416074
		jps[2] = 2255142284
		jps[4] = 3380778113
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wdf"
	elseif jp == "地狱战神" or jp == "进阶地狱战神" then
		jps[1] = 2359508056
		jps[2] = 746327310
		jps[4] = 3864761482
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wdf"
	elseif jp == "蛟龙" or jp == "进阶蛟龙" then
		jps[1] = 3508345275
		jps[2] = 4094125987
		jps[4] = 3767714972
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wdf"
	elseif jp == "僵尸" then
		jps[1] = 3766069112
		jps[2] = 4102096683
		jps[4] = 317839057
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wdf"
	elseif jp == "天兵" or jp == "进阶天兵" then
		jps[1] = 3819132628
		jps[2] = 4145388426
		jps[4] = 3090602745
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wdf"
	elseif jp == "黑山老妖" or jp == "进阶黑山老妖" then
		jps[1] = 3311169613
		jps[2] = 4098356171
		jps[4] = 3202907616
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wdf"
	elseif jp == "蟹将" then
		jps[1] = 617869473
		jps[2] = 1232097837
		jps[4] = 3244018387
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wdf"
	elseif jp == "龟丞相" then
		jps[1] = 3961318213
		jps[2] = 2855765457
		jps[4] = 2472471585
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wdf"
	elseif jp == "古代瑞兽" or jp == "进阶古代瑞兽" then
		jps[1] = 2768903465
		jps[2] = 98583065
		jps[4] = 3689496807
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wdf"
	elseif jp == "超级赤焰兽" or jp == "进阶超级赤焰兽" then
		jps[1] = 4174530934
		jps[2] = 107870971
		jps[4] = 2547291942
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd4"
		jps[10] = "wzife.wdf"
	elseif jp == "男人_判官" then
		jps[4] = 0x7530532F
		jps[7] = "wzife.wdf"
	elseif jp == "进阶凤凰" then
		jps[1] = 0xC2C70463
		jps[2] = 0x5F75075C
		jps[4] = 0x8217B8DC
		jps[7] = "wzife.wd3"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wd3"
	elseif jp == "阎罗王" then
		jps[4] = 0x7A22D6D1
		jps[7] = "wzife.wdf"
	elseif jp == "地藏王" then
		jps[4] = 0xE9F0579D
		jps[7] = "wzife.wdf"
	elseif jp == "男人_二郎神" then
		jps[4] = 0xB061E863
		jps[7] = "wzife.wdf"
	elseif jp == "李靖" then
		jps[4] = 0xDAE855F8
		jps[7] = "wzife.wdf"
	elseif jp == "男人_玉帝" then
		jps[4] = 0x23DB547E
		jps[7] = "wzife.wdf"
	elseif jp == "女人_王母" then
		jps[4] = 0x77B7E4FF
		jps[7] = "wzife.wdf"
	elseif jp == "男人_哪吒" then
		jps[4] = 0x0D24234C
		jps[7] = "wzife.wdf"
	elseif jp == "牛魔王" then
		jps[4] = 0x83547F15
		jps[7] = "wzife.wdf"
	elseif jp == "九头精怪" then
		jps[4] = 4215520146
		jps[7] = "wzife.wdf"
	elseif jp == "观音姐姐" then
		jps[4] = 2353721001
		jps[7] = "wzife.wdf"
	elseif jp == "镇元子" then
		jps[4] = 1686391246
		jps[7] = "wzife.wdf"
	elseif jp == "大大王" then
		jps[4] = 484405237
		jps[7] = "wzife.wdf"
	elseif jp == "如意仙子" or jp == "进阶如意仙子" then
		jps[1] = 4121347566
		jps[2] = 492761196
		jps[4] = 3454607497
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wdf"
	elseif jp == "芙蓉仙子" or jp == "进阶芙蓉仙子" then
		jps[1] = 4121905597
		jps[2] = 2793865041
		jps[4] = 2671553122
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wdf"
	elseif jp == "春十三娘" then
		jps[4] = 322188931
		jps[7] = "wzife.wdf"
	elseif jp == "白晶晶" then
		jps[4] = 3660656729
		jps[7] = "wzife.wdf"
	elseif jp == "哮天犬" then
		jps[4] = 1870550313
		jps[7] = "wzife.wdf"
	elseif jp == "二郎神" then
		jps[4] = 1473040466
		jps[7] = "wzife.wdf"
	elseif jp == "狂豹" or jp == "进阶狂豹" then
		jps[1] = 219665282
		jps[2] = 1524528894
		jps[4] = 3846452507
		jps[7] = "wzife.wd2"
		jps[8] = "wzife.wd2"
		jps[10] = "wzife.wd2"
	elseif jp == "犀牛将军_人" or jp == "进阶犀牛将军_人" then
		jps[1] = 2968680807
		jps[2] = 3900537832
		jps[4] = 3135724608
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd1"
		jps[10] = "wzife.wd1"
	elseif jp == "野猪精" or jp == "进阶野猪精" then
		jps[1] = 168146978
		jps[2] = 1878161646
		jps[4] = 2441183344
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wdf"
	elseif jp == "百足将军" or jp == "进阶百足将军" then
		jps[1] = 2528113285
		jps[2] = 2402778626
		jps[4] = 411591557
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wdf"
	elseif jp == "男人_太上老君" then
		jps[4] = 3134952256
		jps[7] = "wzife.wdf"
	elseif jp == "巫师" then
		jps[4] = 0x2F728796
		jps[7] = "wzife.wdf"
	elseif jp == "女人_满天星" then
		jps[4] = 0x221DF8A8
		jps[7] = "wzife.wdf"
	elseif jp == "女人_云小奴" then
		jps[4] = 0xEED08D0E
		jps[7] = "wzife.wdf"
	elseif jp == "巫奎虎" then
		jps[4] = 0x7ABE5099
		jps[7] = "wzife.wdf"
	-- 新增
	elseif jp == "修罗傀儡妖" or jp == "进阶修罗傀儡妖" then
		jps[1] = 4285444965
		jps[2] = 247202460
		jps[4] = 2902972578
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd1"
		jps[10] = "wzife.wd1"
	elseif jp == "地涌夫人" then
		jps[4] = 1261711986
		jps[7] = "wzife.wdf"
	elseif jp == "女人_灵鼠娃娃" then
		jps[4] = 1359318316
		jps[7] = "wzife.wdf"
	elseif jp == "男人_道童" then
		jps[4] = 505350540
		jps[7] = "wzife.wdf"
	elseif jp == "女人_翠花" then
		jps[4] = 0x2FB1A687
		jps[7] = "wzife.wdf"
	elseif jp == "孙婆婆" then
		jps[4] = 0xEEB6DF92
		jps[7] = "wzife.wdf"
	elseif jp == "女人_绿儿" then
		jps[4] = 0xA74969CD
		jps[7] = "wzife.wdf"
	elseif jp == "二大王" then
		jps[4] = 0x2478FFCE
		jps[7] = "wzife.wdf"
	elseif jp == "三大王" then
		jps[4] = 0x425EE9E7
		jps[7] = "wzife.wdf"
	elseif jp == "女人_孟婆" then
		jps[4] = 0x0167D818
		jps[7] = "wzife.wdf"
	elseif jp == "男人_诗中仙" then
		jps[4] = 0xF9CC9FCF
		jps[7] = "wzife.wdf"
	elseif jp == "蝴蝶仙子" or jp == "进阶蝴蝶仙子" then
		jps[1] = 1677407213
		jps[2] = 4080039826
		jps[4] = 2582828743
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd2"
		jps[10] = "wzife.wdf"
	elseif jp == "碧水夜叉" or jp == "进阶碧水夜叉" then
		jps[1] = 1174097827
		jps[2] = 26770166
		jps[4] = 3907250159
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wd1"
	elseif jp == "鲛人" or jp == "进阶鲛人" then
		jps[1] = 2995295835
		jps[2] = 3701855909
		jps[4] = 1518148985
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wd1"
	elseif jp == "蚌精" or jp == "进阶蚌精" then
		jps[1] = 3668891725
		jps[2] = 1029815994
		jps[4] = 2979503285
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wd1"
	elseif jp == "犀牛将军兽形" or jp == "进阶犀牛将军兽形" then
		jps[1] = 986332576
		jps[2] = 1077484867
		jps[4] = 227563618
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wd1"
	elseif jp == "犀牛将军人形" or jp == "进阶犀牛将军人形" then
		jps[1] = 2968680807
		jps[2] = 3900537832
		jps[4] = 3135724608
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wd1"
	elseif jp == "千年蛇魅" then
		jps[1] = 972556261
		jps[2] = 2871972167
		jps[4] = 2274925036
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wd1"
	elseif jp == "锦毛貂精" or jp == "进阶锦毛貂精" then
		jps[1] = 3834989008
		jps[2] = 750609804
		jps[4] = 902334614
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wd1"
	elseif jp == "鼠先锋" then
		jps[1] = 3222997654
		jps[2] = 805113078
		jps[4] = 1342055128
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wdf"
	elseif jp == "百足将军" then
		jps[1] = 2528113285
		jps[2] = 2402778626
		jps[4] = 411591557
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wd1"
	elseif jp == "野猪精" then
		jps[1] = 168146978
		jps[2] = 1878161646
		jps[4] = 2441183344
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wd1"
	elseif jp == "镜妖" then
		jps[1] = 0x00000014
		jps[2] = 0x00000015
		jps[4] = 0x00000016
		jps[7] = "wzife.wd5"
		jps[8] = "wzife.wd5"
		jps[10] = "wzife.wd5"
	elseif jp == "吸血鬼" then
		jps[1] = 1379673586
		jps[2] = 3799445230
		jps[4] = 1212654139
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd2"
		jps[10] = "wzife.wdf"
	elseif jp == "灵符女娲" then
		jps[1] = 3762430890
		jps[2] = 2615112952
		jps[4] = 118520622
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd2"
		jps[10] = "wzife.wdf"
	elseif jp == "律法女娲" then
		jps[1] = 1239658317
		jps[2] = 2673586775
		jps[4] = 2732588404
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd2"
		jps[10] = "wzife.wdf"
	elseif jp == "阴阳伞" then
		jps[1] = 1951696364
		jps[2] = 4206535996
		jps[4] = 704306082
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd1"
		jps[10] = "wzife.wd1"
	elseif jp == "鬼将" then
		jps[1] = 3822804362
		jps[2] = 1179103558
		jps[4] = 3897170901
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd2"
		jps[10] = "wzife.wdf"
	elseif jp == "画魂" then
		jps[1] = 1609960585
		jps[2] = 3503669630
		jps[4] = 627425695
		jps[7] = "wzife.wd2"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wd2"
	elseif jp == "幽萤娃娃" then
		jps[1] = 2242170274
		jps[2] = 1956155306
		jps[4] = 2628610241
		jps[7] = "wzife.wd2"
		jps[8] = "wzife.wd2"
		jps[10] = "wzife.wd2"
	elseif jp == "幽灵" then
		jps[1] = 729510727
		jps[2] = 81942435
		jps[4] = 3120234464
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd2"
		jps[10] = "wzife.wdf"
	elseif jp == "净瓶女娲" then
		jps[1] = 0x1170CAD1
		jps[2] = 4084317900
		jps[4] = 3758328923
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd2"
		jps[10] = "wzife.wdf"
	elseif jp == "噬天虎" then
		jps[1] = 3160877681
		jps[2] = 1733530
		jps[4] = 4147029249
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wdf"
	elseif jp == "炎魔神" then
		jps[1] = 3739826146
		jps[2] = 3235842995
		jps[4] = 3071253759
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wdf"
	elseif jp == "灵鹤" then
		jps[1] = 2349202336
		jps[2] = 1251627948
		jps[4] = 3209292450
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wdf"
	elseif jp == "雾中仙" then
		jps[1] = 502177711
		jps[2] = 265800893
		jps[4] = 1889604377
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wdf"
	elseif jp == "夜罗刹" then
		jps[1] = 3702724261
		jps[2] = 804554925
		jps[4] = 881041681
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wdf"
	elseif jp == "金饶僧" or jp == "进阶金饶僧" then
		jps[1] = 0x00000017
		jps[2] = 0x00000020
		jps[4] = 0x00000019
		jps[7] = "wzife.wd5"
		jps[8] = "wzife.wd5"
		jps[10] = "wzife.wd5"
	elseif jp == "琴仙" or jp == "进阶琴仙" then
		jps[1] = 0x00000018
		jps[2] = 0x00000021
		jps[4] = 0x00000018
		jps[7] = "wzife.wd5"
		jps[8] = "wzife.wd5"
		jps[10] = "wzife.wd5"
	elseif jp == "大力金刚" then
		jps[1] = 3132437560
		jps[2] = 2151335098
		jps[4] = 2473528127
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wdf"
	elseif jp == "超级土地公公" or jp == "进阶超级土地公公" then
		jps[1] = 0xFFED8411
		jps[2] = 0xFFED8411
		jps[4] = 0xFFED8411
		jps[7] = "wzife.wd3"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wd3"
	elseif jp == "超级神猴" or jp == "进阶超级神猴" then
		jps[1] = 0x50C0FCB2
		jps[2] = 0x50C0FCB1
		jps[4] = 0x50C0FCB1
		jps[7] = "wzife.wd3"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wd3"
	elseif jp == "般若天女" or jp == "进阶般若天女" then
		jps[1] = 0xA4E9EA97
		jps[2] = 0xA4E9EA96
		jps[4] = 0xA4E9EA96
		jps[7] = "wzife.wd3"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wd3"
	elseif jp == "妙华仙子" or jp == "进阶妙华仙子" then
		jps[1] = 0xA4E9EA97
		jps[2] = 0xA4E9EA96
		jps[4] = 0xA4E9EA96
		jps[7] = "wzife.wd3"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wd3"
	elseif jp == "超级神鸡" or jp == "进阶超级神鸡" then
		jps[1] = 0x6A8966BF
		jps[2] = 0x6A8966BE
		jps[4] = 0x6A8966BE
		jps[7] = "wzife.wd3"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wd3"
	elseif jp == "超级神羊" or jp == "进阶超级神羊" then
		jps[1] = 0xE8841FF3
		jps[2] = 0xE8841FF2
		jps[4] = 0xE8841FF2
		jps[7] = "wzife.wd3"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wd3"
	elseif jp == "超级六耳猕猴" or jp == "进阶超级六耳猕猴" then
		jps[1] = 0x4EDDACD1
		jps[2] = 0x4EDDACD0
		jps[4] = 0x4EDDACD0
		jps[7] = "wzife.wd3"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wd3"
	elseif jp == "机关人人形" then
		jps[1] = 3382803952
		jps[2] = 1923773347
		jps[4] = 584677861
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wd1"
	elseif jp == "龙龟" then
		jps[1] = 2475781575
		jps[2] = 1712806093
		jps[4] = 698656395
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wdf"
	elseif jp == "猫灵兽形" then
		jps[1] = 0x4C96F661
		jps[2] = 1215807719
		jps[4] = 1138200864
		jps[7] = "wzife.wd2"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wd2"
	elseif jp == "狂豹兽形" then
		jps[1] = 7606761
		jps[2] = 1373441141
		jps[4] = 3045729714
		jps[7] = "wzife.wd3"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wd2"
	elseif jp == "蝎子精" then
		jps[1] = 0x41BEFB9E
		jps[2] = 1163085736
		jps[4] = 3804293499
		jps[7] = "wzife.wd2"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wd2"
	elseif jp == "葫芦宝贝" then
		jps[1] = 0xECBF79F6
		jps[2] = 980702096
		jps[4] = 3724524677
		jps[7] = "wzife.wd2"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wd2"
	elseif jp == "红萼仙子" then
		jps[1] = 2903417989
		jps[2] = 1737309167
		jps[4] = 3346187540
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wdf"
	elseif jp == "踏云兽" then
		jps[1] = 4214653832
		jps[2] = 616829260
		jps[4] = 2059643063
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wdf"
	elseif jp == "巴蛇" then
		jps[1] = 1913757771
		jps[2] = 1915287565
		jps[4] = 1528984226
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wd1"
	elseif jp == "连弩车" then
		jps[1] = 1662121653
		jps[2] = 105533579
		jps[4] = 2997905429
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wd1"
	elseif jp == "机关鸟" then
		jps[1] = 1750290750
		jps[2] = 3459146624
		jps[4] = 1647853964
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wdf"
	elseif jp == "机关兽" then
		jps[1] = 2994114373
		jps[2] = 2470741631
		jps[4] = 409348876
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wdf"
	elseif jp == "混沌兽" then
		jps[1] = 0x55045B76
		jps[2] = 4250769396
		jps[4] = 2523582881
		jps[7] = "wzife.wd2"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wd2"
	elseif jp == "狂豹人形" then
		jps[1] = 219665282
		jps[2] = 1524528894
		jps[4] = 3846452507
		jps[7] = "wzife.wd2"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wd2"
	elseif jp == "猫灵人形" then
		jps[1] = 2378595026
		jps[2] = 3317138902
		jps[4] = 1503737740
		jps[7] = "wzife.wd2"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wd2"
	elseif jp == "蜃气妖" then
		jps[1] = 3242141482
		jps[2] = 3711237618
		jps[4] = 864205212
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wd1"
	elseif jp == "蔓藤妖花" then
		jps[1] = 185840334
		jps[2] = 131128391
		jps[4] = 225976457
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wd1"
	elseif jp == "修罗傀儡鬼" then
		jps[1] = 4050880784
		jps[2] = 2700774712
		jps[4] = 2812088632
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wd1"
	elseif jp == "巨力神猿" then
		jps[1] = 3369748905
		jps[2] = 1376621864
		jps[4] = 2019851896
		jps[7] = "wzife.wd2"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wd2"
	elseif jp == "长眉灵猴" then
		jps[1] = 1825613452
		jps[2] = 3981653788
		jps[4] = 3550741090
		jps[7] = "wzife.wd2"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wd2"
	elseif jp == "曼珠沙华" then
		jps[1] = 202294684
		jps[2] = 988464774
		jps[4] = 0xA9BF2A70
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wd1"
	elseif jp == "金身罗汉" then
		jps[1] = 1728172293
		jps[2] = 3013781984
		jps[4] = 0xD00C9DA9
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wd1"
	elseif jp == "修罗傀儡妖" then
		jps[1] = 4285444965
		jps[2] = 247202460
		jps[4] = 2902972578
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wd2"
	elseif jp == "牛妖" then
		jps[1] = 3240946244
		jps[2] = 177642586
		jps[4] = 4111500551
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd2"
		jps[10] = "wzife.wdf"
	elseif jp == "黑熊精" then
		jps[1] = 1472051449
		jps[2] = 2043585002
		jps[4] = 1034611852
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd2"
		jps[10] = "wzife.wdf"
	elseif jp == "兔子怪" then
		jps[1] = 974731679
		jps[2] = 3384109720
		jps[4] = 789858660
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd2"
		jps[10] = "wzife.wdf"
	elseif jp == "蜘蛛精" then
		jps[1] = 244427095
		jps[2] = 3867088030
		jps[4] = 3779656727
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd2"
		jps[10] = "wzife.wdf"
	elseif jp == "狼" then
		jps[1] = 1648534252
		jps[2] = 1016205034
		jps[4] = 1856422783
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd2"
		jps[10] = "wzife.wdf"
	elseif jp == "超级玉兔" then
		jps[1] = 0x00F276B5
		jps[2] = 0x00F276B4
		jps[4] = 0x00F276B6
		jps[7] = "wzife.wd5"
		jps[8] = "wzife.wd5"
		jps[10] = "wzife.wd5"

	elseif jp == "超级神猪" then
		jps[1] = 0x13
		jps[2] = 0x11
		jps[4] = 0x10
		jps[7] = "wzife.wd4"
		jps[8] = "wzife.wd4"
		jps[10] = "wzife.wd4"

	elseif jp == "超级猪小戒" then
		jps[1] = 0x00000017
		jps[2] = 0x00000018
		jps[4] = 0x00000019
		jps[7] = "wzife.wd4"
		jps[8] = "wzife.wd4"
		jps[10] = "wzife.wd4"

	elseif jp == "超级小白龙" then
		jps[1] = 0x00000014
		jps[2] = 0x00000015
		jps[4] = 0x00000016
		jps[7] = "wzife.wd4"
		jps[8] = "wzife.wd4"
		jps[10] = "wzife.wd4"

	elseif jp == "超级神鼠" then
		jps[1] = 0x00000026
		jps[2] = 0x00000027
		jps[4] = 0x00000028
		jps[7] = "wzife.wd4"
		jps[8] = "wzife.wd4"
		jps[10] = "wzife.wd4"

	elseif jp == "谛听" or jp == "进阶谛听"  then
		jps[1] = 0x00000020
		jps[2] = 0x00000021
		jps[4] = 0x00000022
		jps[7] = "wzife.wd4"
		jps[8] = "wzife.wd4"
		jps[10] = "wzife.wd4"
		elseif jp == "超级飞天" or jp == "进阶超级飞天" then
		jps[4] = 0x0A000177
		jps[2] = 0x0A000177
		jps[1] = 0x0A000176
		jps[7] = "wpal/121.wpal"
		jps[8] = "wpal/121.wpal"
		jps[10] = "wpal/121.wpal"
		elseif jp == "月魅" or jp == "进阶月魅" then
		jps[4] = 0xA0000193
		jps[2] = 0xA0000193
		jps[1] = 0xA0000192
		jps[7] = "wpal/121.wpal"
		jps[8] = "wpal/121.wpal"
		jps[10] = "wpal/121.wpal"




		elseif jp == "广目大仙" or  jp == "进阶广目大仙" then
			jps[2] = 0x10000127
			jps[1] = 0x10000126
			jps[7] = "wpal/121.wpal"
			jps[8] = "wpal/121.wpal"

			elseif jp == "狐不归" or jp == "进阶狐不归" then
		jps[4] = 0xA0000189
		jps[2] = 0xA0000189
		jps[1] = 0xA0000188
		jps[7] = "wpal/121.wpal"
		jps[8] = "wpal/121.wpal"
		jps[10] = "wpal/121.wpal"
		elseif jp == "涂山雪" or jp == "进阶涂山雪" then
		jps[4] = 0x0A000182
		jps[2] = 0x0A000182
		jps[1] = 0x0A000182
		jps[7] = "wpal/121.wpal"
		jps[8] = "wpal/121.wpal"
		jps[10] = "wpal/121.wpal"


	      elseif jp == "白龙" or jp == "进阶白龙" then
			jps[1] = 0x00000005
			jps[2] = 0x00000005
			jps[4] = 0x00000005
			jps[7] = "shanghai.wdf"
	        jps[8] = "shanghai.wdf"
	        jps[10] = "shanghai.wdf"

	        elseif jp == "轩辕黄帝" or jp == "进阶轩辕黄帝" then
			jps[1] = 0x00000106
			jps[2] = 0x00000106
			jps[4] = 0x00000106
			jps[7] = "幕神.rpk"
	        jps[8] = "幕神.rpk"
	        jps[10] = "幕神.rpk"
	        elseif jp =="小飞羽"then
	jps[1] = 0x00000330
	jps[2] = 0x00000330
	jps[4] = 0x00000331
	jps[7] = "幕神2.rpk"
	jps[8] = "幕神2.rpk"
	jps[10] = "幕神2.rpk"

elseif jp =="无常鬼差(白)"then
	jps[1] = 0x00000267
	jps[2] = 0x00000267
	jps[4] = 0x00000267
	jps[7] = "幕神2.rpk"
	jps[8] = "幕神2.rpk"
	jps[10] = "幕神2.rpk"
elseif jp =="进阶无常鬼差(白)"then
	jps[1] = 0x00000267
	jps[2] = 0x00000267
	jps[4] = 0x00000267
	jps[7] = "幕神2.rpk"
	jps[8] = "幕神2.rpk"
	jps[10] = "幕神2.rpk"

elseif jp =="飞羽"then
	jps[1] = 0x00000318
	jps[2] = 0x00000318
	jps[4] = 0x00000319
	jps[7] = "幕神2.rpk"
	jps[8] = "幕神2.rpk"
	jps[10] = "幕神2.rpk"

elseif jp =="白象王"then
	jps[1] = 0x00000460
	jps[2] = 0x00000460
	jps[4] = 0x00000461
	jps[7] = "幕神2.rpk"
	jps[8] = "幕神2.rpk"
	jps[10] = "幕神2.rpk"
elseif jp =="蚩尤王"then
	jps[1] = 0x00000462
	jps[2] = 0x00000462
	jps[4] = 0x00000463
	jps[7] = "幕神2.rpk"
	jps[8] = "幕神2.rpk"
	jps[10] = "幕神2.rpk"
elseif jp =="大棚王"then
	jps[1] = 0x00000464
	jps[2] = 0x00000464
	jps[4] = 0x00000465
	jps[7] = "幕神2.rpk"
	jps[8] = "幕神2.rpk"
	jps[10] = "幕神2.rpk"
elseif jp =="大妖皇"then
	jps[1] = 0x00000466
	jps[2] = 0x00000466
	jps[4] = 0x00000467
	jps[7] = "幕神2.rpk"
	jps[8] = "幕神2.rpk"
	jps[10] = "幕神2.rpk"
elseif jp =="二郎真君"then
	jps[1] = 0x00000468
	jps[2] = 0x00000468
	jps[4] = 0x00000469
	jps[7] = "幕神2.rpk"
	jps[8] = "幕神2.rpk"
	jps[10] = "幕神2.rpk"
elseif jp =="伏羲"then
	jps[1] = 0x00000470
	jps[2] = 0x00000470
	jps[4] = 0x00000471
	jps[7] = "幕神2.rpk"
	jps[8] = "幕神2.rpk"
	jps[10] = "幕神2.rpk"
elseif jp =="郭靖"then
	jps[1] = 0x00000472
	jps[2] = 0x00000472
	jps[4] = 0x00000473
	jps[7] = "幕神2.rpk"
	jps[8] = "幕神2.rpk"
	jps[10] = "幕神2.rpk"
elseif jp =="盘古"then
	jps[1] = 0x00000474
	jps[2] = 0x00000474
	jps[4] = 0x00000475
	jps[7] = "幕神2.rpk"
	jps[8] = "幕神2.rpk"
	jps[10] = "幕神2.rpk"
elseif jp =="齐天大圣"then
	jps[1] = 0x00000476
	jps[2] = 0x00000476
	jps[4] = 0x00000477
	jps[7] = "幕神2.rpk"
	jps[8] = "幕神2.rpk"
	jps[10] = "幕神2.rpk"
elseif jp =="轩辕"then
	jps[1] = 0x00000478
	jps[2] = 0x00000478
	jps[4] = 0x00000479
	jps[7] = "幕神2.rpk"
	jps[8] = "幕神2.rpk"
	jps[10] = "幕神2.rpk"
	elseif jp =="鲲鹏"then
	jps[1] = 0x00000488
	jps[2] = 0x00000487
	jps[4] = 0x00000486
	jps[7] = "幕神2.rpk"
	jps[8] = "幕神2.rpk"
	jps[10] = "幕神2.rpk"
	elseif jp =="进阶鲲鹏"then
	jps[1] = 0x00000488
	jps[2] = 0x00000487
	jps[4] = 0x00000486
	jps[7] = "幕神2.rpk"
	jps[8] = "幕神2.rpk"
	jps[10] = "幕神2.rpk"

elseif jp =="元始天尊"then
	jps[1] = 0x00000480
	jps[2] = 0x00000480
	jps[4] = 0x00000481
	jps[7] = "幕神2.rpk"
	jps[8] = "幕神2.rpk"
	jps[10] = "幕神2.rpk"
elseif jp =="祝融"then
	jps[1] = 0x00000482
	jps[2] = 0x00000482
	jps[4] = 0x00000483
	jps[7] = "幕神2.rpk"
	jps[8] = "幕神2.rpk"
	jps[10] = "幕神2.rpk"
elseif jp =="小飞羽"then
	jps[1] = 0x00000330
	jps[2] = 0x00000330
	jps[4] = 0x00000331
	jps[7] = "幕神2.rpk"
	jps[8] = "幕神2.rpk"
	jps[10] = "幕神2.rpk"

elseif jp =="无常鬼差(白)小"then
	jps[1] = 0x00000267
	jps[2] = 0x00000267
	jps[4] = 0x00000267
	jps[7] = "幕神2.rpk"
	jps[8] = "幕神2.rpk"
	jps[10] = "幕神2.rpk"
elseif jp =="进阶无常鬼差(白)小"then
	jps[1] = 0x00000267
	jps[2] = 0x00000267
	jps[4] = 0x00000267
	jps[7] = "幕神2.rpk"
	jps[8] = "幕神2.rpk"
	jps[10] = "幕神2.rpk"

elseif jp =="飞羽小"then
	jps[1] = 0x00000318
	jps[2] = 0x00000318
	jps[4] = 0x00000319
	jps[7] = "幕神2.rpk"
	jps[8] = "幕神2.rpk"
	jps[10] = "幕神2.rpk"
elseif jp =="进阶月灵"then
	jps[1] = 0xF6001277
	jps[2] = 0xF6001277
	jps[4] = 0xF6001277
	jps[7] = "幕神2.rpk"
	jps[8] = "幕神2.rpk"
	jps[10] = "幕神2.rpk"
elseif jp =="月灵"then
	jps[1] = 0xF6001277
	jps[2] = 0xF6001277
	jps[4] = 0xF6001277
	jps[7] = "幕神2.rpk"
	jps[8] = "幕神2.rpk"
	jps[10] = "幕神2.rpk"
elseif jp =="白象王小"then
	jps[1] = 0x00000460
	jps[2] = 0x00000460
	jps[4] = 0x00000461
	jps[7] = "幕神2.rpk"
	jps[8] = "幕神2.rpk"
	jps[10] = "幕神2.rpk"
elseif jp =="蚩尤王小"then
	jps[1] = 0x00000462
	jps[2] = 0x00000462
	jps[4] = 0x00000463
	jps[7] = "幕神2.rpk"
	jps[8] = "幕神2.rpk"
	jps[10] = "幕神2.rpk"
elseif jp =="大棚王小"then
	jps[1] = 0x00000464
	jps[2] = 0x00000464
	jps[4] = 0x00000465
	jps[7] = "幕神2.rpk"
	jps[8] = "幕神2.rpk"
	jps[10] = "幕神2.rpk"
elseif jp =="大妖皇小"then
	jps[1] = 0x00000466
	jps[2] = 0x00000466
	jps[4] = 0x00000467
	jps[7] = "幕神2.rpk"
	jps[8] = "幕神2.rpk"
	jps[10] = "幕神2.rpk"
elseif jp =="二郎真君小"then
	jps[1] = 0x00000468
	jps[2] = 0x00000468
	jps[4] = 0x00000469
	jps[7] = "幕神2.rpk"
	jps[8] = "幕神2.rpk"
	jps[10] = "幕神2.rpk"
elseif jp =="伏羲小"then
	jps[1] = 0x00000470
	jps[2] = 0x00000470
	jps[4] = 0x00000471
	jps[7] = "幕神2.rpk"
	jps[8] = "幕神2.rpk"
	jps[10] = "幕神2.rpk"
elseif jp =="郭靖小"then
	jps[1] = 0x00000472
	jps[2] = 0x00000472
	jps[4] = 0x00000473
	jps[7] = "幕神2.rpk"
	jps[8] = "幕神2.rpk"
	jps[10] = "幕神2.rpk"
elseif jp =="盘古小"then
	jps[1] = 0x00000474
	jps[2] = 0x00000474
	jps[4] = 0x00000475
	jps[7] = "幕神2.rpk"
	jps[8] = "幕神2.rpk"
	jps[10] = "幕神2.rpk"
elseif jp =="齐天大圣小"then
	jps[1] = 0x00000476
	jps[2] = 0x00000476
	jps[4] = 0x00000477
	jps[7] = "幕神2.rpk"
	jps[8] = "幕神2.rpk"
	jps[10] = "幕神2.rpk"
elseif jp =="轩辕小"then
	jps[1] = 0x00000478
	jps[2] = 0x00000478
	jps[4] = 0x00000479
	jps[7] = "幕神2.rpk"
	jps[8] = "幕神2.rpk"
	jps[10] = "幕神2.rpk"
elseif jp =="元始天尊小"then
	jps[1] = 0x00000480
	jps[2] = 0x00000480
	jps[4] = 0x00000481
	jps[7] = "幕神2.rpk"
	jps[8] = "幕神2.rpk"
	jps[10] = "幕神2.rpk"
elseif jp =="祝融小"then
	jps[1] = 0x00000482
	jps[2] = 0x00000482
	jps[4] = 0x00000483
	jps[7] = "幕神2.rpk"
	jps[8] = "幕神2.rpk"
	jps[10] = "幕神2.rpk"


	        elseif jp == "蚩尤战神" or jp == "进阶蚩尤战神" then
			jps[1] = 0x00000097
			jps[2] = 0x00000097
			jps[4] = 0x00000097
			jps[7] = "幕神.rpk"
	        jps[8] = "幕神.rpk"
	        jps[10] = "幕神.rpk"
	        elseif jp == "进阶辛丑神牛" or jp == "辛丑神牛" then
			 jps[1] = 2770367868
		     jps[2] = 8920964
		     jps[4] = 1407891169
		     jps[7] = "wzife.wd1"
		     jps[8] = "wzife.wd4"
		     jps[10] = "wzife.wd1"
	       elseif jp == "托塔天王" or jp == "进阶托塔天王" then
			jps[1] = 0x00000100
			jps[2] = 0x00000100
			jps[4] = 0x00000100
			jps[7] = "幕神.rpk"
	        jps[8] = "幕神.rpk"
	        jps[10] = "幕神.rpk"
	        elseif jp == "嫦娥仙子" or jp == "进阶嫦娥仙子" then
			jps[1] = 0x00000107
			jps[2] = 0x00000107
			jps[4] = 0x00000107
			jps[7] = "幕神.rpk"
	        jps[8] = "幕神.rpk"
	        jps[10] = "幕神.rpk"
	        elseif jp == "刑天" or jp == "进阶刑天" then
			jps[1] = 0x00000112
			jps[2] = 0x00000112
			jps[4] = 0x00000112
			jps[7] = "幕神.rpk"
	        jps[8] = "幕神.rpk"
	        jps[10] = "幕神.rpk"
	        elseif jp == "飞羽" or jp == "进阶飞羽" then
			jps[1] = 0x00000318
			jps[2] = 0x00000318
			jps[4] = 0x00000318
			jps[7] = "幕神2.rpk"
	        jps[8] = "幕神2.rpk"
	        jps[10] = "幕神2.rpk"
	        elseif jp == "明世隐" or jp == "进阶明世隐" then
			jps[1] = 0x00000267
			jps[2] = 0x00000267
			jps[4] = 0x00000267
			jps[7] = "幕神2.rpk"
	        jps[8] = "幕神2.rpk"
	        jps[10] = "幕神2.rpk"
	        elseif jp == "奶牛" or jp == "进阶奶牛" then
			jps[1] = 0x00000261
			jps[2] = 0x00000261
			jps[4] = 0x00000261
			jps[7] = "幕神2.rpk"
	        jps[8] = "幕神2.rpk"
	        jps[10] = "幕神2.rpk"
	        elseif jp == "火神祝融" or jp == "进阶火神祝融" then
			jps[1] = 0x00000098
			jps[2] = 0x00000098
			jps[4] = 0x00000098
			jps[7] = "幕神.rpk"
	        jps[8] = "幕神.rpk"
	        jps[10] = "幕神.rpk"
	        elseif jp == "水神共工" or jp == "进阶水神共工" then
			jps[1] = 0x00000102
			jps[2] = 0x00000102
			jps[4] = 0x00000102
			jps[7] = "幕神.rpk"
	        jps[8] = "幕神.rpk"
	        jps[10] = "幕神.rpk"
	        elseif jp == "北极仙翁" or jp == "进阶北极仙翁" then
			jps[1] = 0x00000111
			jps[2] = 0x00000111
			jps[4] = 0x00000111
			jps[7] = "幕神.rpk"
	        jps[8] = "幕神.rpk"
	        jps[10] = "幕神.rpk"
	        elseif jp == "土神后土" or jp == "进阶土神后土" then
			jps[1] = 0x00000105
			jps[2] = 0x00000105
			jps[4] = 0x00000105
			jps[7] = "幕神.rpk"
	        jps[8] = "幕神.rpk"
	        jps[10] = "幕神.rpk"
	        elseif jp == "盘古" or jp == "进阶盘古" then
			jps[1] = 0x00000109
			jps[2] = 0x00000109
			jps[4] = 0x00000109
			jps[7] = "幕神.rpk"
	        jps[8] = "幕神.rpk"
	        jps[10] = "幕神.rpk"
	        elseif jp == "齐天大圣" or jp == "进阶齐天大圣" then
			jps[1] = 0x00000099
			jps[2] = 0x00000099
			jps[4] = 0x00000099
			jps[7] = "幕神.rpk"
	        jps[8] = "幕神.rpk"
	        jps[10] = "幕神.rpk"
	        elseif jp == "太上老君" or jp == "进阶太上老君" then
			jps[1] = 0x00000101
			jps[2] = 0x00000101
			jps[4] = 0x00000101
			jps[7] = "幕神.rpk"
	        jps[8] = "幕神.rpk"
	        jps[10] = "幕神.rpk"
	        elseif jp == "太已真人" or jp == "进阶太已真人" then
			jps[1] = 0x00000113
			jps[2] = 0x00000113
			jps[4] = 0x00000113
			jps[7] = "幕神.rpk"
	        jps[8] = "幕神.rpk"
	        jps[10] = "幕神.rpk"
	        elseif jp == "上古天兵" or jp == "进阶上古天兵" then
			jps[1] = 0x00000096
			jps[2] = 0x00000096
			jps[4] = 0x00000096
			jps[7] = "幕神.rpk"
	        jps[8] = "幕神.rpk"
	        jps[10] = "幕神.rpk"
	        elseif jp == "上古瑞兽" or jp == "进阶上古瑞兽" then
			jps[1] = 0x00000108
			jps[2] = 0x00000108
			jps[4] = 0x00000108
			jps[7] = "幕神.rpk"
	        jps[8] = "幕神.rpk"
	        jps[10] = "幕神.rpk"
	         elseif jp == "判官" or jp == "进阶判官" then
			jps[1] = 0x00000114
			jps[2] = 0x00000114
			jps[4] = 0x00000114
			jps[7] = "幕神.rpk"
	        jps[8] = "幕神.rpk"
	        jps[10] = "幕神.rpk"
	        elseif jp == "白象精" or jp == "进阶白象精" then
			jps[1] = 0x00023021
			jps[2] = 0x00023021
			jps[4] = 0x00023021
			jps[7] = "幕神.rpk"
	        jps[8] = "幕神.rpk"
	        jps[10] = "幕神.rpk"
	        elseif jp == "上古精灵" or jp == "进阶上古精灵" then
			jps[1] = 0x00023049
			jps[2] = 0x00023049
			jps[4] = 0x00023049
			jps[7] = "幕神.rpk"
	        jps[8] = "幕神.rpk"
	        jps[10] = "幕神.rpk"
	        elseif jp == "红孩儿" or jp == "进阶红孩儿" then
			jps[1] = 0x00023109
			jps[2] = 0x00023109
			jps[4] = 0x00023109
			jps[7] = "幕神.rpk"
	        jps[8] = "幕神.rpk"
	        jps[10] = "幕神.rpk"
	        elseif jp == "上古蛟龙" or jp == "进阶上古蛟龙" then
			jps[1] = 0x00023130
			jps[2] = 0x00023130
			jps[4] = 0x00023130
			jps[7] = "幕神.rpk"
	        jps[8] = "幕神.rpk"
	        jps[10] = "幕神.rpk"
	        elseif jp == "大鹏王" or jp == "进阶大鹏王" then
			jps[1] = 0x00023143
			jps[2] = 0x00023143
			jps[4] = 0x00023143
			jps[7] = "幕神.rpk"
	        jps[8] = "幕神.rpk"
	        jps[10] = "幕神.rpk"
	        elseif jp == "达摩" or jp == "进阶达摩" then
			jps[1] = 0x00023158
			jps[2] = 0x00023158
			jps[4] = 0x00023158
			jps[7] = "幕神.rpk"
	        jps[8] = "幕神.rpk"
	        jps[10] = "幕神.rpk"
	        elseif jp == "雨神龙王" or jp == "进阶雨神龙王" then
			jps[1] = 0x00023211
			jps[2] = 0x00023211
			jps[4] = 0x00023211
			jps[7] = "幕神.rpk"
	        jps[8] = "幕神.rpk"
	        jps[10] = "幕神.rpk"
	        elseif jp == "菩缇老祖" or jp == "进阶菩缇老祖" then
			jps[1] = 0x00023246
			jps[2] = 0x00023246
			jps[4] = 0x00023246
			jps[7] = "幕神.rpk"
	        jps[8] = "幕神.rpk"
	        jps[10] = "幕神.rpk"
	        elseif jp == "青牛精" or jp == "进阶青牛精" then
			jps[1] = 0x00023303
			jps[2] = 0x00023303
			jps[4] = 0x00023303
			jps[7] = "幕神.rpk"
	        jps[8] = "幕神.rpk"
	        jps[10] = "幕神.rpk"
	        elseif jp == "青毛狮王" or jp == "进阶青毛狮王" then
			jps[1] = 0x00023319
			jps[2] = 0x00023319
			jps[4] = 0x00023319
			jps[7] = "幕神.rpk"
	        jps[8] = "幕神.rpk"
	        jps[10] = "幕神.rpk"
	        elseif jp == "六耳猕猴" or jp == "进阶六耳猕猴" then
			jps[1] = 0x00023336
			jps[2] = 0x00023336
			jps[4] = 0x00023336
			jps[7] = "幕神.rpk"
	        jps[8] = "幕神.rpk"
	        jps[10] = "幕神.rpk"
	        elseif jp == "如来佛祖" or jp == "进阶如来佛祖" then
			jps[1] = 0x00023352
			jps[2] = 0x00023352
			jps[4] = 0x00023352
			jps[7] = "幕神.rpk"
	        jps[8] = "幕神.rpk"
	        jps[10] = "幕神.rpk"
	        elseif jp == "陆压道人" or jp == "进阶陆压道人" then
			jps[1] = 0x00023515
			jps[2] = 0x00023515
			jps[4] = 0x00023515
			jps[7] = "幕神.rpk"
	        jps[8] = "幕神.rpk"
	        jps[10] = "幕神.rpk"
	        elseif jp == "瑭僧" or jp == "进阶瑭僧" then
			jps[1] = 0x00023535
			jps[2] = 0x00023535
			jps[4] = 0x00023535
			jps[7] = "幕神.rpk"
	        jps[8] = "幕神.rpk"
	        jps[10] = "幕神.rpk"
	        elseif jp == "王母娘娘" or jp == "进阶王母娘娘" then
			jps[1] = 0x00023553
			jps[2] = 0x00023553
			jps[4] = 0x00023553
			jps[7] = "幕神.rpk"
	        jps[8] = "幕神.rpk"
	        jps[10] = "幕神.rpk"
	        elseif jp == "小白龙" or jp == "进阶小白龙" then
			jps[1] = 0x00023613
			jps[2] = 0x00023613
			jps[4] = 0x00023613
			jps[7] = "幕神.rpk"
	        jps[8] = "幕神.rpk"
	        jps[10] = "幕神.rpk"
	        elseif jp == "白龙女" or jp == "进阶白龙女" then
			jps[1] = 0x00023636
			jps[2] = 0x00023636
			jps[4] = 0x00023636
			jps[7] = "幕神.rpk"
	        jps[8] = "幕神.rpk"
	        jps[10] = "幕神.rpk"
	        elseif jp == "青蛟龙" or jp == "进阶青蛟龙" then
			jps[1] = 0x00023650
			jps[2] = 0x00023650
			jps[4] = 0x00023650
			jps[7] = "幕神.rpk"
	        jps[8] = "幕神.rpk"
	        jps[10] = "幕神.rpk"
	        elseif jp == "画中仙" or jp == "进阶画中仙" then
			jps[1] = 0x00023710
			jps[2] = 0x00023710
			jps[4] = 0x00023710
			jps[7] = "幕神.rpk"
	        jps[8] = "幕神.rpk"
	        jps[10] = "幕神.rpk"
	        elseif jp == "玉皇大帝" or jp == "进阶玉皇大帝" then
			jps[1] = 0x00023728
			jps[2] = 0x00023728
			jps[4] = 0x00023728
			jps[7] = "幕神.rpk"
	        jps[8] = "幕神.rpk"
	        jps[10] = "幕神.rpk"

            elseif jp == "镇元大仙" or jp == "进阶镇元大仙" then
			jps[1] = 0x00023740
			jps[2] = 0x00023740
			jps[4] = 0x00023740
			jps[7] = "幕神.rpk"
	        jps[8] = "幕神.rpk"
	        jps[10] = "幕神.rpk"

             elseif jp == "火魔女" or jp == "进阶火魔女" then
			jps[1] = 0x00023755
			jps[2] = 0x00023755
			jps[4] = 0x00023755
			jps[7] = "幕神.rpk"
	        jps[8] = "幕神.rpk"
	        jps[10] = "幕神.rpk"



	elseif jp == "超级神狗" then
		jps[1] = 0x00000025
		jps[2] = 0x00000024
		jps[4] = 0x00000023
		jps[7] = "wzife.wd4"
		jps[8] = "wzife.wd4"
		jps[10] = "wzife.wd4"

	elseif jp == "小毛头" then
		jps[1] = 4056900334
		jps[2] = 3369341281
		jps[4] = 1255883361
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wdf"
	-- 进阶
	elseif jp == "进阶天兵" then
		jps[1] = 3043937193
		jps[2] = 864688647
		jps[4] = 4048229990
		jps[7] = "wzife.wd3"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wd3"
	elseif jp == "进阶黑山老妖" then
		jps[1] = 3582756924
		jps[2] = 1335109989
		jps[4] = 395811073
		jps[7] = "wzife.wd3"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wd3"
	elseif jp == "毗舍童子" or jp == "进阶毗舍童子" then
		jps[1] = 2307740890
		jps[2] = 3457776127
		jps[4] = 280235611
		jps[7] = "wzife.wd3"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wd3"
	elseif jp == "蚩尤" then
		jps[4] = 0x5822CC97
		jps[7] = "wzife.wdf"
	elseif jp == "知了王" then
		jps[4] = 3808489609
		jps[7] = "wzife.wdf"
	elseif jp == "和尚3" then
		jps[4] = 0x12210C6A
		jps[7] = "wzife.wdf"
	elseif jp == "考官2" then
		jps[4] = 0xEC3608BC
		jps[7] = "wzife.wdf"
	elseif jp == "将军1" then
		jps[4] = 0x1CA66D04
		jps[7] = "wzife.wdf"
	elseif jp == "和尚2" then
		jps[4] = 0x2B43EB3E
		jps[7] = "wzife.wdf"
	elseif jp == "和尚1" then
		jps[4] = 0xB365FAC7
		jps[7] = "wzife.wdf"
	elseif jp == "南极仙翁" then
		jps[4] = 810436942
		jps[7] = "wzife.wdf"
	elseif jp == "唐僧" then
		jps[4] = 2279413445
		jps[7] = "wzife.wdf"
	elseif jp == "孙悟空" then
		jps[4] = 0x3FA3472C
		jps[7] = "wzife.wdf"
	elseif jp == "猪八戒" then
		jps[4] = 0x93557CA2
		jps[7] = "wzife.wdf"
	elseif jp == "福星" then
		jps[4] = 0x279B729D
		jps[7] = "wzife.wdf"
	elseif jp == "帮派妖兽" then
		jps[4] = 0x49A7562B
		jps[7] = "wzife.wd1"
	elseif jp == "吴刚" then
		jps[4] = 0xEB321EDA
		jps[7] = "wzife.wdf"
	elseif jp == "皇帝" then
		jps[4] = 0xBBA4ED07
		jps[7] = "wzife.wdf"
	--########################################################?自己修改?##########################################
	elseif jp == "银两" then
		jps[4] = 0xC880FF79
		jps[7] = "shape.wdf"
	elseif jp == "物件_打铁炉" then
		jps[4] = 2074974822
		jps[7] = "shape.wdf"
	elseif jp == "食物" then
		jps[4] = 0xCEC4E67F
		jps[7] = "goods.wdf"
	elseif jp == "口粮" then
		jps[4] = 0xD13C14A1
		jps[7] = "goods.wdf"
	elseif jp == "摄妖香" then
		jps[4] = 0x7FC3DE36
		jps[7] = "goods.wdf"
	elseif jp == "药品" then
		jps[4] = 0x66CC7A29
		jps[7] = "goods.wdf"
	elseif jp == "白无常" then
		jps[4] = "0x2EAD989A"
		jps[7] = ""
	elseif jp == "黑无常" then
		jps[4] = "0x8CAD1F2F"
		jps[7] = ""
	elseif jp == "本事和尚" then------------梦战头像开始
		jps[4] = "0x2B43EB3E"
		jps[7] = ""
	elseif jp == "百晓星君" then
		jps[4] = "0x2E797D72"
		jps[7] = ""
	elseif jp == "宝石商人" then
		jps[4] = "0x49CAFCC2"
		jps[7] = ""
	elseif jp == "宝象国国王" then
		jps[4] = "0x49F4803B"
		jps[7] = ""
	elseif jp == "陈妈妈" then
		jps[4] = "0xE756971"
		jps[7] = ""
	elseif jp == "程夫人" then
		jps[4] = "0x641650F0"
		jps[7] = ""
	elseif jp == "吹牛王" then
		jps[4] = "0xE3510EDC"
		jps[7] = ""
	elseif jp == "崔判官" then
		jps[4] = "0x7530532F"
		jps[7] = ""
	elseif jp == "翠花" then
		jps[4] = "0x2FB1A687"
		jps[7] = ""
	elseif jp == "当铺老板" then
		jps[4] = "0x30E999AA"
		jps[7] = ""
	elseif jp == "赌霸天" then
		jps[4] = "0x13765D73"
		jps[7] = ""
	elseif jp == "拜师使者" then
		jps[4] = "0x67B62ED5"
		jps[7] = ""
	elseif jp == "冯铁匠" then
		jps[4] = "0xBF413F3E"
		jps[7] = ""
	elseif jp == "服装店老板" then
		jps[4] = "0x340D62DD"
		jps[7] = ""
	elseif jp == "符石道人" then
		jps[4] = "0xDD03EB6C"
		jps[7] = ""
	elseif jp == "海产收购商" then
		jps[4] = "0xE2933947"
		jps[7] = ""
	elseif jp == "简师爷" then
		jps[4] = "0x6C29EF22"
		jps[7] = ""
	elseif jp == "轿夫" then
		jps[4] = "0x758F9E60"
		jps[7] = ""
	elseif jp == "教书先生" then
		jps[4] = "0x77397968"
		jps[7] = ""
	elseif jp == "金圣宫" then
		jps[4] = "0x59EAA01D"
		jps[7] = ""
	elseif jp == "空慈方丈" then
		jps[4] = "0xA0BC629"
		jps[7] = ""
	elseif jp == "老孙头" then
		jps[4] = "0x6AF31BA"
		jps[7] = ""
	elseif jp == "乐器店老板" then
		jps[4] = "0xF98F61"
		jps[7] = ""
	elseif jp == "雷黑子" then
		jps[4] = "0xD9BE63F"
		jps[7] = ""
	elseif jp == "李世民" then
		jps[4] = "0xBBA4ED07"
		jps[7] = ""
	elseif jp == "刘老爹" then
		jps[4] = "0xEB08674C"
		jps[7] = ""
	elseif jp == "宠物仙子" then
		jps[4] = "0x7F84C945"
		jps[7] = ""
	elseif jp == "鲁成" then
		jps[4] = "0xBFC714C2"
		jps[7] = ""
	elseif jp == "染色师" then
		jps[4] = "0x1C9CBA0C"
		jps[7] = ""
	elseif jp == "南极仙翁" then
		jps[4] = "0x304E494E"
		jps[7] = ""
	elseif jp == "樵夫" then
		jps[4] = "0xEB321EDA"
		jps[7] = ""
	elseif jp == "秦琼" then
		jps[4] = "0x522601D6"
		jps[7] = ""
	elseif jp == "清风" then
		jps[4] = "0x1E1F098C"
		jps[7] = ""
	elseif jp == "穷汉" then
		jps[4] = "0x93EC2C89"
		jps[7] = ""
	elseif jp == "太上老君" then
		jps[4] = "0xBADB9340"
		jps[7] = ""
	elseif jp == "王大嫂" then
		jps[4] = "0x74D5FF09"
		jps[7] = ""
	elseif jp == "赵元宝" then
		jps[4] = "0x61117204"
		jps[7] = ""
	elseif jp == "香料店老板" then
		jps[4] = "0x37075308"
		jps[7] = ""
	elseif jp == "小木匠" then
		jps[4] = "0xC942664B"
		jps[7] = ""
	elseif jp == "小桃红" then
		jps[4] = "0x421D6F27"
		jps[7] = ""
	elseif jp == "类似于铃音" then
		jps[4] = "0x8C639246"
		jps[7] = ""
	elseif jp == "太白金星" then
		jps[4] = "0x3E2EE17D"
		jps[7] = ""
	elseif jp == "药店老板" then
		jps[4] = "0xC2A7F86E"
		jps[7] = ""
	elseif jp == "驿站老板" then
		jps[4] = "0x792EA858"
		jps[7] = ""
	elseif jp == "月老" then
		jps[4] = "0xA5E5DB73"
		jps[7] = ""
	elseif jp == "张老财" then
		jps[4] = "0xEF00905F"
		jps[7] = ""
	elseif jp == "张老头" then
		jps[4] = "0x5DA91845"
		jps[7] = ""
	elseif jp == "招罗弟" then
		jps[4] = "0x1FC0FCAC"
		jps[7] = ""
	elseif jp == "赵捕头" then
		jps[4] = "0xF81B16C1"
		jps[7] = ""
	elseif jp == "郑镖头" then
		jps[4] = "0xDA66E6C8"
		jps[7] = ""
	elseif jp == "钟馗" then
		jps[4] = "0x3655FC65"
		jps[7] = ""
	elseif jp == "周猎户" then
		jps[4] = "0x88CA9EC4"
		jps[7] = ""
	elseif jp == "朱紫校尉" then
		jps[4] = "0x1CA66D04"
		jps[7] = ""
	elseif jp == "白晶晶" then
		jps[4] = "0xDA313059"
		jps[7] = ""
	elseif jp == "春三十娘" then
		jps[4] = "0x13343683"
		jps[7] = ""
	elseif jp == "二大王" then
		jps[4] = "0x2478FFCE"
		jps[7] = ""
	elseif jp == "三大王" then
		jps[4] = "0x425EE9E7"
		jps[7] = ""
	elseif jp == "婆婆" then
		jps[4] = "0x167D818"
		jps[7] = ""
	elseif jp == "大宝" then
		jps[4] = "0xAF9D765"
		jps[7] = ""
	elseif jp == "哪吒" then
		jps[4] = "0xD24234C"
		jps[7] = ""
	elseif jp == "满天星" then
		jps[4] = "0x221DF8A8"
		jps[7] = ""
	elseif jp == "玉皇大帝" then
		jps[4] = "0x23DB547E"
		jps[7] = ""
	elseif jp == "白无常" then
		jps[4] = "0x2EAD989A"
		jps[7] = ""
	elseif jp == "酒店老板" then
		jps[4] = "0x310CBA1A"
		jps[7] = ""
	elseif jp == "管家" then
		jps[4] = "0x34D77690"
		jps[7] = ""
	elseif jp == "灵鼠娃娃" then
		jps[4] = "0x51058D2C"
		jps[7] = ""
	elseif jp == "火焰山土地" then
		jps[4] = "0x52C6D4DB"
		jps[7] = ""
	elseif jp == "金圣宫" then
		jps[4] = "0x59EAA01D"
		jps[7] = ""
	elseif jp == "仓库管理员" then
		jps[4] = "0x6081AD14"
		jps[7] = ""
	elseif jp == "守门天将" then
		jps[4] = "0x70CE5AB6"
		jps[7] = ""
	elseif jp == "嫦娥" then
		jps[4] = "0x76226129"
		jps[7] = ""
	elseif jp == "王母娘娘" then
		jps[4] = "0x77B7E4FF"
		jps[7] = ""
	elseif jp == "至尊宝" then
		jps[4] = "0x8309B5DC"
		jps[7] = ""
	elseif jp == "红毛猿" then
		jps[4] = "0x87DB4BCC"
		jps[7] = ""
	elseif jp == "唐僧" then
		jps[4] = "0x87DD16C5"
		jps[7] = ""
	elseif jp == "有个和尚" then
		jps[4] = "0x8BB5A31A"
		jps[7] = ""
	elseif jp == "黑无常" then
		jps[4] = "0x8CAD1F2F"
		jps[7] = ""
	elseif jp == "罗道人" then
		jps[4] = "0x9158832E"
		jps[7] = ""
	elseif jp == "颜如羽" then
		jps[4] = "0xA02DBEDE"
		jps[7] = ""
	elseif jp == "小宝" then
		jps[4] = "0xA74969CD"
		jps[7] = ""
	elseif jp == "杨戟" then
		jps[4] = "0xB061E863"
		jps[7] = ""
	elseif jp == "魏征" then
		jps[4] = "0xEC3608BC"
		jps[7] = ""
	elseif jp == "云小奴" then
		jps[4] = "0xEED08D0E"
		jps[7] = ""
	elseif jp == "超级巫医" then
		jps[4] = "0xF575B185"
		jps[7] = ""
	elseif jp == "马副将" then
		jps[4] = "0x3242A9D3"
		jps[7] = ""
	elseif jp == "西梁女兵" then
		jps[4] = "0x4BDE70FC"
		jps[7] = ""
	elseif jp == "巨子" then
		jps[4] = "0xBACDA9D6"
		jps[7] = ""
	elseif jp == "西梁女国国王" then
		jps[4] = "0x76C6D7D4"
		jps[7] = ""
	elseif jp == "莫夫人" then
		jps[4] = "0x868E2879"
		jps[7] = ""
	elseif jp == "小笛" then
		jps[4] = "0xDE850375"
		jps[7] = ""
	elseif jp == "上官丞相" then
		jps[4] = "0xF6D4D1DD"
		jps[7] = ""
	elseif jp == "袁天罡" then
		jps[4] = "0xF9CC9FCF"
		jps[7] = ""
	elseif jp == "小二" then
		jps[4] = "0x4E52D71E"
		jps[7] = ""
	elseif jp == "宝象国国王" then
		jps[4] = "0x49F4803B"
		jps[7] = ""
	elseif jp == "莫爷爷" then
		jps[4] = "0x18ACCF64"
		jps[7] = ""
	elseif jp == "蒋大全" then
		jps[4] = "0x75DD9222"
		jps[7] = ""
	elseif jp == "禄星" then
		jps[4] = "0x99EB8BE"
		jps[7] = ""
	elseif jp == "禄星2" then
		jps[4] = "0x99EB8BE"
		jps[7] = ""
	elseif jp == "福星" then
		jps[4] = "0x279B729D"
		jps[7] = ""
	elseif jp == "福星2" then
		jps[4] = "0x279B729D"
		jps[7] = ""
	elseif jp == "金圣宫2" then
		jps[4] = "0x59EAA01D"
		jps[7] = ""
	elseif jp == "小西天长和尚" then
		jps[4] = "0x12210C6A"
		jps[7] = ""
	elseif jp == "小西天和尚" then
		jps[4] = "0xB365FAC7"
		jps[7] = ""
	elseif jp == "二郎神2" then
		jps[4] = "0x57CCD052"
		jps[7] = ""
	elseif jp == "铁匠" then
		jps[4] = "0x6533EA01"
		jps[7] = ""
	elseif jp == "酒仙" then
		jps[4] = "0x8C6FE78"
		jps[7] = ""
	elseif jp == "小白龙" then
		jps[4] = "0xF9F031A5"
		jps[7] = ""
	elseif jp == "大大王" then
		jps[4] = "0x1CDF6FF5"
		jps[7] = ""
	elseif jp == "镇元子" then
		jps[4] = "0x648449CE"
		jps[7] = ""
	--===========新增泡泡召唤兽=====
	elseif jp == "飞燕女泡泡" then
		jps[1] = 1858466588
		jps[2] = 1565116319
		jps[4] = 0x01000048
		jps[7] = "wzife.wd1"
		jps[8] = "wzife.wd4"
		jps[10] = "wzife.wd5"
	elseif jp == "骨精灵泡泡" then
		jps[4] = 0x01000049
		jps[7] = "wzife.wd5"
	elseif jp == "剑侠客泡泡" then
		jps[4] = 0x01000047
		jps[7] = "wzife.wd5"
	elseif jp == "羽灵神泡泡" then
		jps[4] = 0x01000046
		jps[7] = "wzife.wd5"
	------------梦战头像结束
--########################################################?自己修改?##########################################
	end
	if jps[7] ==nil and jps[4] ==nil   then
	   	local jps0 = 引擎.召唤兽头像(jp)
	    if jps0~= nil then
	        if jps0.大图标~=nil then
	            jps[1] = jps0.小图标
	        end
	        if jps0.小图标~=nil then
	            jps[2] = jps0.大图标
	        end
	        if jps0.对话头像~=nil then
	            jps[4] = jps0.对话头像
	        end
	        if jps0.资源 ~= nil then
	        	if jps0.大图标~=nil then
		            jps[1] = jps0.小图标+0
		        end
		        if jps0.小图标~=nil then
		            jps[2] = jps0.大图标+0
		        end
		        if jps0.对话头像~=nil then
		            jps[4] = jps0.对话头像+0
		        end
	            jps[7] = "wzife.wd4"
				jps[8] = "wzife.wd4"
				jps[10] = "wzife.wd4"
	        end
	    end
	end
	if jps[7] ==nil and jps[4] ==nil   then
		jps[1] = 3043937193
		jps[2] = 864688647
		jps[4] = 4048229990
		jps[7] = "wzife.wd3"
		jps[8] = "wzife.wd3"
		jps[10] = "wzife.wd3"
    end
	return jps
end
