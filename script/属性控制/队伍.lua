--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2021-04-19 20:40:31
--======================================================================--
local 内存类_队伍 = class()
local jnzb = require('script/显示类/技能')
local floor = math.floor
local ceil = math.ceil
local insert = table.insert
local remove = table.remove
local tp
function 内存类_队伍:初始化()
    self.等级 = 0
    self.名称 = ''
    self.性别 = 0
    self.模型 = ''
    self.种族 = ''
    self.称谓 = '无称谓'
    self.帮派 = '无帮派'
    self.门派 = '无门派'
    self.人气 = 600
    self.门贡 = 0
    self.帮贡 = 0
    self.气血 = 0
    self.魔法 = 0
    self.愤怒 = 0
    self.活力 = 100
    self.体力 = 100
    self.命中 = 0
    self.伤害 = 0
    self.防御 = 0
    self.速度 = 0
    self.躲避 = 0
    self.灵力 = 0
    self.法伤 = 0
    self.法防 = 0
    self.体质 = 0
    self.魔力 = 0
    self.力量 = 0
    self.耐力 = 0
    self.敏捷 = 0
    self.潜力 = 5
    self.坐骑 = {}
    self.修炼 = {攻击修炼 = {0, 0}, 法术修炼 = {0, 0}, 防御修炼 = {0, 0}, 速度修炼 = {0, 0}}
    self.最大体力 = 100
    self.最大活力 = 100
    self.最大气血 = 0
    self.最大魔法 = 0
    self.当前经验 = 0
    self.最大经验 = 0
    self.宝宝列表 = {}
    self.子女列表 = {}
    self.参战宝宝 = {}
    self.可选门派 = {}
    self.当前称谓 = ''
    self.装备 = {}
    self.灵饰 = {}
    self.锦衣 = {}
    self.锦衣佩戴 = {}
    self.法宝 = {}
    self.师门技能 = {}
    self.人物技能 = {}
    self.特殊技能 = {}
    self.辅助技能 = {}
    self.战斗技能 = {}
    self.快捷技能 = {}
    self.染色方案 = 0
    self.染色组 = {}
    self.技能等级 = {0, 0, 0, 0}
    self.装备属性 = {
        气血 = 0,
        魔法 = 0,
        命中 = 0,
        伤害 = 0,
        防御 = 0,
        速度 = 0,
        躲避 = 0,
        灵力 = 0,
        体质 = 0,
        魔力 = 0,
        力量 = 0,
        耐力 = 0,
        敏捷 = 0,
        月饼 = 0,
        乾元丹 = 0,
        附加乾元丹 = 0,
        剩余乾元丹 = 0,
        可换乾元丹 = 0
    }
    self.技能属性 = {气血 = 0, 魔法 = 0, 命中 = 0, 伤害 = 0, 防御 = 0, 速度 = 0, 躲避 = 0, 灵力 = 0, 体质 = 0, 魔力 = 0, 力量 = 0, 耐力 = 0, 敏捷 = 0}
    self.临时属性 = {气血 = 0, 魔法 = 0, 命中 = 0, 伤害 = 0, 防御 = 0, 速度 = 0, 躲避 = 0, 灵力 = 0, 体质 = 0, 魔力 = 0, 力量 = 0, 耐力 = 0, 敏捷 = 0}
    self.奇经八脉 = {}
    self.人物状态 = {}
    self.VIP = {礼包 = {VIP1 = 0, VIP2 = 0, VIP3 = 0, VIP4 = 0, VIP5 = 0, VIP6 = 0}, VIP = 0, VIP值 = 0}
    self.变身 = {}
    self.默认技能 = false
    self.可持有武器 = nil
    self.自动 = nil
    self.默认技能 = nil
    self.武魂 = {}
    --
    self.地图数据 = {}
    self.数字id = 0
end

function 内存类_队伍:PB刷新宝宝技能(编号, 技能)
    if self.宝宝列表 ~= nil and #self.宝宝列表 > 0 then
        if 编号 ~= nil then
            for n = 1, #self.宝宝列表 do
                if 编号 == self.宝宝列表[n] then
                    if 技能 ~= nil and #技能 > 0 then
                        self.宝宝列表[n].skillObjects = {}
                        for i = 1, #技能 do
                            -- 技能对象
                            local 临时技能 = 技能[i]
                            self.宝宝列表[n].skillObjects[i] = tp._技能.创建()
                            self.宝宝列表[n].skillObjects[i]:置对象(临时技能, 2)
                        end
                    end
                end
            end
        else
            for n = 1, #self.宝宝列表 do
                local skills = self.宝宝列表[n].skill
                if skills ~= nil and #skills > 0 then
                    self.宝宝列表[n].skillObjects = {}
                    for i = 1, #skills do
                        -- 技能对象
                        local 临时技能 = skills[i]
                        self.宝宝列表[n].skillObjects[i] = tp._技能.创建()
                        self.宝宝列表[n].skillObjects[i]:置对象(临时技能, 2)
                    end
                end
            end
        end
    end
end

function 内存类_队伍:刷新宝宝技能(编号, 技能)
    if 编号 ~= nil and 技能 ~= nil then
        local 临时技能 = ''
        if self.宝宝列表[编号] ~= nil then
            self.宝宝列表[编号].技能 = 技能
            for i = 1, #self.宝宝列表[编号].技能 do
                临时技能 = self.宝宝列表[编号].技能[i]
                self.宝宝列表[编号].技能[i] = tp._技能.创建()
                self.宝宝列表[编号].技能[i]:置对象(临时技能, 2)
            end
        end
    else
        local 临时技能 = ''
        for n = 1, #self.宝宝列表 do
            if self.宝宝列表[n] ~= nil and self.宝宝列表[n].技能 ~= nil and #self.宝宝列表[n].技能 > 0 then
                for i = 1, #self.宝宝列表[n].技能 do
                    临时技能 = self.宝宝列表[n].技能[i]
                    self.宝宝列表[n].技能[i] = tp._技能.创建()
                    self.宝宝列表[n].技能[i]:置对象(临时技能, 2)
                end
            end
        end
    end
end

-- TODO 法术认证逻辑
function 内存类_队伍:PB刷新宝宝认证技能()
    local 临时技能 = ''
    for n = 1, #self.宝宝列表 do
        if self.宝宝列表[n].法术认证属性 == nil then
            self.宝宝列表[n].法术认证属性 = {}
        end
        if self.宝宝列表[n] ~= nil and self.宝宝列表[n].authSkill ~= nil and gbk.len(self.宝宝列表[n].authSkill) > 0 then ---增加属性两字就OK
            临时技能 = self.宝宝列表[n].authSkill
            self.宝宝列表[n].法术认证属性[1] = tp._技能.创建()
            self.宝宝列表[n].法术认证属性[1]:置对象(临时技能, 2)
        end
    end
end

function 内存类_队伍:刷新宝宝认证技能()
    local 临时技能 = ''
    for n = 1, #self.宝宝列表 do
        if self.宝宝列表[n] ~= nil and self.宝宝列表[n].法术认证属性 ~= nil and #self.宝宝列表[n].法术认证属性 > 0 then ---增加属性两字就OK
            for i = 1, #self.宝宝列表[n].法术认证属性 do
                临时技能 = self.宝宝列表[n].法术认证[i]
                self.宝宝列表[n].法术认证属性[i] = tp._技能.创建()
                self.宝宝列表[n].法术认证属性[i]:置对象(临时技能, 2)
            end
        end
    end
end

function 内存类_队伍:取包含技能(名称)
    local 技能 = {
        为官之道 = {'杀气诀'},
        无双一击 = {'后发制人'},
        神兵鉴赏 = {'兵器谱'},
        疾风步 = {'千里神行'},
        十方无敌 = {'横扫千军', '破釜沉舟'},
        紫薇之术 = {'斩龙诀'},
        文韬武略 = {'反间之计', '安神诀', '嗜血'},
        黄庭经 = {'三星灭魔'},
        磐龙灭法 = {nil},
        霹雳咒 = {'五雷咒'},
        符之术 = {'飞行符', '兵解符', '催眠符', '失心符', '落魄符', '失忆符', '追魂符', '离魂符', '失魂符', '定身符', '碎甲符', '落雷符'},
        归元心法 = {'归元咒', '凝神术'},
        神道无念 = {'乾天罡气', '分身术', '神兵护法'},
        斜月步 = {'乙木仙遁'},
        小乘佛法 = {'紫气东来'},
        金刚伏魔 = {'佛法无边'},
        诵经 = {'唧唧歪歪'},
        佛光普照 = {'达摩护体', '金刚护法', '韦陀护法', '金刚护体', '一苇渡江', '拈花妙指'},
        大慈大悲 = {'我佛慈悲'},
        歧黄之术 = {'推拿', '活血', '推气过宫', '妙手回春', '救死扶伤', '解毒', '舍身取义'},
        渡世步 = {'佛门普渡'},
        毒经 = {nil},
        倾国倾城 = {'红袖添香', '楚楚可怜', '一笑倾城'},
        沉鱼落雁 = {'满天花雨', '情天恨海', '雨落寒沙'},
        闭月羞花 = {'莲步轻舞', '如花解语', '似玉生香', '娉婷嬝娜'},
        香飘兰麝 = {'轻如鸿毛'},
        玉质冰肌 = {'百毒不侵'},
        清歌妙舞 = {'移形换影', '飞花摘叶'},
        灵通术 = {'堪察令', '寡欲令'},
        六道轮回 = {'魂飞魄散'},
        幽冥术 = {'阎罗令', '锢魂术', '黄泉之息'},
        拘魂诀 = {'判官令', '还阳术', '尸气漫天'},
        九幽阴魂 = {'幽冥鬼眼', '冤魂不散'},
        尸腐恶 = {'尸腐毒', '修罗隐身'},
        无常步 = {'杳无音讯'},
        牛逼神功 = {'魔王护持'},
        震天诀 = {'魂飞魄散'},
        火云术 = {'飞砂走石', '三昧真火', '火甲术'},
        火牛阵 = {'牛劲', '踏山裂石'},
        牛虱阵 = {'无敌牛虱', '无敌牛妖', '摇头摆尾'},
        回身击 = {'魔王回首'},
        裂石步 = {'牛屎遁'},
        魔兽神功 = {'变身', '魔兽啸天'},
        生死搏 = {'象形', '鹰击', '狮搏', '天魔解体'},
        训兽诀 = {'威慑'},
        阴阳二气诀 = {'定心术', '魔息术'},
        狂兽诀 = {'连环击', '神力无穷'},
        大鹏展翅 = {'振翅千里'},
        魔兽反噬 = {'极度疯狂'},
        蛛丝阵法 = {'盘丝舞', '夺命蛛丝'},
        迷情大法 = {'含情脉脉', '瘴气', '魔音摄魂'},
        秋波暗送 = {'勾魂', '摄魄'},
        天外魔音 = {nil},
        盘丝大法 = {'盘丝阵', '复苏'},
        盘丝步 = {'天罗地网', '天蚕丝', '幻镜术'},
        姊妹相随 = {'姐妹同心'},
        天罡气 = {'天神护体', '天神护法', '天诛地灭', '五雷轰顶', '雷霆万钧', '浩然正气'},
        傲世诀 = {'天雷斩'},
        清明自在 = {'知己知彼'},
        宁气诀 = {'宁心'},
        乾坤塔 = {'镇妖', '错乱'},
        混天术 = {'百万神兵', '金刚镯'},
        云霄步 = {'腾云驾雾'},
        九龙诀 = {'解封', '清心', '二龙戏珠'},
        破浪诀 = {'神龙摆尾'},
        呼风唤雨 = {'龙卷雨击'},
        龙腾术 = {'龙腾'},
        逆鳞术 = {'逆鳞'},
        游龙术 = {'乘风破浪', '水遁'},
        龙附术 = {'龙吟', '龙啸九天', '龙附'},
        灵性 = {'自在心法'},
        护法金刚 = {nil},
        观音咒 = {'紧箍咒', '杨柳甘露'},
        五行学说 = {'日光华', '靛沧海', '巨岩破', '苍茫树', '地裂火'},
        金刚经 = {'普渡众生', '灵动九天', '莲华妙法'},
        五行扭转 = {'五行错位', '颠倒五行'},
        莲花宝座 = {'坐莲'},
        周易学 = {'驱魔', '驱尸'},
        潇湘仙雨 = {'烟雨剑法', '飘渺式'},
        乾坤袖 = {'日月乾坤', '天地同寿', '乾坤妙法'},
        修仙术 = {'炼气化神', '生命之泉', '太极生化', '一气化三清'},
        混元道果 = {nil},
        明性修身 = {'三花聚顶'},
        七星遁 = {'斗转星移'},
        瞬息万变 = {'落叶萧萧'},
        万灵诸念 = {'荆棘舞', '尘土刃', '冰川怒'},
        巫咒 = {'雾杀', '血雨'},
        万物轮转 = {'星月之惠'},
        天人庇护 = {'炎护', '叶隐'},
        神木恩泽 = {'神木呓语'},
        驭灵咒 = {'蜜润', '蝼蚁蚀天'},
        天地无极 = {nil},
        九转玄功 = {'不动如山'},
        武神显圣 = {'碎星诀', '镇魂诀'},
        啸傲 = {nil},
        气吞山河 = {'裂石', '断岳势', '天崩地裂', '浪涌', '惊涛怒', '翻江搅海'},
        诛魔 = {'腾雷', '指地成钢'},
        法天象地 = {'无穷妙道', '纵地金光'},
        枯骨心法 = {'移魂化骨'},
        阴风绝章 = {'夺魄令', '煞气诀', '惊魂掌', '摧心术'},
        鬼蛊灵蕴 = {'夺命咒'},
        燃灯灵宝 = {'明光宝烛', '金身舍利'},
        地冥妙法 = {'地涌金莲', '万木凋枯'},
        混元神功 = {'元阳护体'},
        秘影迷踪 = {'遁地术'},
        天火献誓 = {nil},
        天罚之焰 = {'炽火流离', '极天炼焰'},
        煌火无明 = {'谜毒之缚', '诡蝠之刑', '怨怖之泣', '誓血之祭'},
        化神以灵 = {'唤灵·魂火', '唤魔·堕羽', '唤魔·毒魅', '唤灵·焚魂', '天魔觉醒'},
        弹指成烬 = {'净世煌火', '焚魔烈焰'},
        藻光灵狱 = {'幽影灵魄'},
        离魂 = {'魂兮归来'},
        神工无形 = {'一发而动'},
        攻玉以石 = {'针锋相对', '攻守易位'},
        擎天之械 = {'锋芒毕露'},
        千机奇巧 = {'诱袭', '匠心·破击'},
        匠心不移 = {'匠心·削铁', '匠心·固甲', '匠心·蓄锐'},
        运思如电 = {'天马行空'},
        探奥索隐 = {'鬼斧神工', '移山填海'},
        神通广大 = {'威震凌霄', '气慑天军'},
        如意金箍 = {'当头一棒', '神针撼海', '杀威铁棒', '泼天乱棒'},
        齐天逞胜 = {'九幽除名', '移星换斗', '云暗天昏'},
        金刚之躯 = {'担山赶月', '铜头铁臂'},
        灵猴九窍 = {'无所遁形', '天地洞明', '除光息焰'},
        七十二变 = {'呼子唤孙', '八戒上身'},
        腾云驾霧 = {'筋斗云'}
    }
    return 技能[名称]
end

function 内存类_队伍:BP人物属性(role)
    self.数字id = role.id
    local attr = role.attribute
    -- 人物拉取信息部去改变人物属性
    if attr ~= nil then
        self.等级 = attr.lv
        self.名称 = gbk.fromutf8(attr.name)
        self.性别 = attr.sex
        self.模型 = gbk.fromutf8(attr.model)
        self.种族 = gbk.fromutf8(attr.race)
        self.称谓 = gbk.fromutf8(attr.title)
        self.当前称谓 = gbk.fromutf8(attr.title)
        self.帮派 = '无帮派'
        if gbk.len(gbk.fromutf8(attr.org)) > 0 then
            self.帮派 = gbk.fromutf8(attr.org)
        end
        self.门派 = '无门派'
        attr.sect = gbk.fromutf8(attr.sect)
        if gbk.len(attr.sect) > 0 then
            self.门派 = attr.sect
        end
        self.人气 = attr.popular
        self.门贡 = attr.sectContribute
        self.帮贡 = attr.orgContribute
        self.气血 = attr.blood[1]
        self.最大气血 = attr.blood[2]
        self.魔法 = attr.magic[1]
        self.最大魔法 = attr.magic[2]
        self.愤怒 = attr.angry
        self.活力 = attr.vitality[1]
        self.体力 = attr.power[1]
        self.命中 = attr.baseInfo[1]
        self.伤害 = attr.baseInfo[2]
        self.防御 = attr.baseInfo[3]
        self.速度 = attr.baseInfo[4]
        self.躲避 = attr.baseInfo[5]
        self.灵力 = attr.baseInfo[6]
        self.法伤 = attr.baseInfo[7]
        self.法防 = attr.baseInfo[8]
        self.体质 = attr.base[1]
        self.魔力 = attr.base[2]
        self.力量 = attr.base[3]
        self.耐力 = attr.base[4]
        self.敏捷 = attr.base[5]
        self.潜力 = attr.potential
        -- TOOD 后续完成
        self.剧情点 = 0 -- 初始化值
        -- 技能属性
        self.技能属性 = {
            气血 = 0,
            魔法 = 0,
            命中 = 0,
            伤害 = 0,
            防御 = 0,
            速度 = 0,
            躲避 = 0,
            灵力 = 0,
            体质 = 0,
            魔力 = 0,
            力量 = 0,
            耐力 = 0,
            敏捷 = 0,
            月饼 = 0,
            乾元丹 = 0,
            附加乾元丹 = 0,
            剩余乾元丹 = 0,
            可换乾元丹 = 0
        }
        -- // 灵饰属性
        self.剧情技能 = {}
        -- // 辅助技能
        self.辅助技能 = {}
        self.修炼 = {
            当前 = '攻击修炼',
            防御修炼 = {[1] = 0, [2] = 0, [3] = 20},
            抗法修炼 = {[1] = 0, [2] = 0, [3] = 20},
            法术修炼 = {[1] = 0, [2] = 0, [3] = 20},
            攻击修炼 = {[1] = 0, [2] = 0, [3] = 20},
            猎术修炼 = {[1] = 0, [2] = 0, [3] = 20}
        }
        self.bb修炼 = {}
    end
end

function 内存类_队伍:BP设置地图信息(map)
    -- 地图属性赋值
    self.地图数据.x = map.x
    self.地图数据.y = map.y
    self.地图数据.地图编号 = map.mapId
    self.角色坐标 = {x = self.地图数据.x, y = self.地图数据.y}
end

function 内存类_队伍:BP重置属性(属性)
    -- BP人物属性
    self:BP人物属性(属性)
    -- 师门技能
    local 临时技能 = 0
    local sectSkills = 属性.sectSkills
    if sectSkills ~= nil then
        for n = 1, #sectSkills do
            临时技能 = require('script/显示类/技能')()
            sectSkills[n].name = gbk.fromutf8(sectSkills[n].name)
            临时技能:置对象(sectSkills[n].name)
            临时技能.包含技能 = {}
            临时技能.学会 = sectSkills[n].ok
            临时技能.等级 = sectSkills[n].lv
            local w = sectSkills[n].children
            for s = 1, #w do
                w[s].name = gbk.fromutf8(w[s].name)
                临时技能.包含技能[s] = require('script/显示类/技能')()
                临时技能.包含技能[s]:置对象(w[s].name)
                临时技能.包含技能[s].学会 = w[s].ok
                临时技能.包含技能[s].等级 = w[s].lv
            end
            self.师门技能[n] = 临时技能
        end
    end

    if
        tp.当前称谓 ~= nil and tp.当前称谓 ~= '' and gbk.len(self.当前称谓) > 0 and tp.当前称谓 ~= self.当前称谓 and tp.场景 ~= nil and
            tp.场景.人物 ~= nil
     then
        if tp.当前称谓 == '至尊财神' then
            tp.场景.人物.至尊财神 = nil
        elseif tp.当前称谓 == '狂暴之力' then
            tp.场景.人物.狂暴之力 = nil
        elseif tp.当前称谓 == '武林圣者' then
            tp.场景.人物.武林圣者 = nil
        elseif tp.当前称谓 == '超凡入圣' then
            tp.场景.人物.超凡入圣 = nil
        elseif tp.当前称谓 == '洞察先机' then
            tp.场景.人物.洞察先机 = nil
        elseif tp.当前称谓 == '独步青云' then
            tp.场景.人物.独步青云 = nil
        elseif tp.当前称谓 == '风华绝代' then
            tp.场景.人物.风华绝代 = nil
        elseif tp.当前称谓 == '风云再起' then
            tp.场景.人物.风云再起 = nil
        elseif tp.当前称谓 == '盖世无双' then
            tp.场景.人物.盖世无双 = nil
        elseif tp.当前称谓 == '盖世英豪' then
            tp.场景.人物.盖世英豪 = nil
        elseif tp.当前称谓 == '九五之尊' then
            tp.场景.人物.九五之尊 = nil
        elseif tp.当前称谓 == '龙皇' then
            tp.场景.人物.龙皇 = nil
        elseif tp.当前称谓 == '神豪' then
            tp.场景.人物.神豪 = nil
        elseif tp.当前称谓 == '战神' then
            tp.场景.人物.战神 = nil
        elseif tp.当前称谓 == '纵横三界王者风云' then
            tp.场景.人物.纵横三界王者风云 = nil
        elseif tp.当前称谓 == '武神坛甲组冠军' then
            tp.场景.人物.甲组冠军 = nil
        elseif tp.当前称谓 == '武神坛甲组亚军' then
            tp.场景.人物.甲组亚军 = nil
        elseif tp.当前称谓 == '武神坛甲组季军' then
            tp.场景.人物.甲组季军 = nil
        elseif tp.当前称谓 == '武神坛明星冠军' then
            tp.场景.人物.明星冠军 = nil
        elseif tp.当前称谓 == '武神坛明星亚军' then
            tp.场景.人物.明星亚军 = nil
        elseif tp.当前称谓 == '武神坛明星季军' then
            tp.场景.人物.明星季军 = nil
        elseif tp.当前称谓 == '九天揽月' then
            tp.场景.人物.九天揽月 = nil
        elseif tp.当前称谓 == '剑指苍穹' then
            tp.场景.人物.剑指苍穹 = nil
        elseif tp.当前称谓 == '势不可挡' then
            tp.场景.人物.势不可挡 = nil
        elseif tp.当前称谓 == '王者风范' then
            tp.场景.人物.王者风范 = nil
        elseif tp.当前称谓 == '绝世豪侠' then
            tp.场景.人物.绝世豪侠框 = nil
        elseif tp.当前称谓 == '江湖豪侠' then
            tp.场景.人物.江湖豪侠框 = nil
        elseif tp.当前称谓 == '威震四方' then
            tp.场景.人物.梦幻大亨框 = nil
        elseif tp.当前称谓 == '只手遮天' then
            tp.场景.人物.黄称谓边框 = nil
        elseif tp.当前称谓 == '降龙伏虎' then
            tp.场景.人物.黄称谓边框 = nil
        elseif tp.当前称谓 == '富可敌国' then
            tp.场景.人物.富可敌国框 = nil
        elseif tp.当前称谓 == '幕神梦幻' then
            tp.场景.人物.幕神梦幻框 = nil
        elseif tp.当前称谓 == '窈窕淑女' then
            tp.场景.人物.窈窕淑女框 = nil
        end
    end
    tp.当前称谓 = self.当前称谓
    if tp.当前称谓 ~= nil and gbk.len(tp.当前称谓) > 0 and tp.当前称谓 ~= '' and tp.场景 ~= nil and tp.场景.人物 ~= nil then
        if tp.当前称谓 == '至尊财神' then
            tp.场景.人物.至尊财神 = tp.资源:载入('wzife.wd5', '网易假人动画', 0x01000051)
        elseif tp.当前称谓 == '狂暴之力' then
            tp.场景.人物.狂暴之力 = tp.资源:载入('wzife.wd5', '网易假人动画', 0x01000074)
        elseif tp.当前称谓 == '武林圣者' then
            tp.场景.人物.武林圣者 = tp.资源:载入('wzife.wd5', '网易假人动画', 0x01000076)
        elseif tp.当前称谓 == '超凡入圣' then
            tp.场景.人物.超凡入圣 = tp.资源:载入('wzife.wd5', '网易假人动画', 0x01000087)
        elseif tp.当前称谓 == '洞察先机' then
            tp.场景.人物.洞察先机 = pwd('39')
        elseif tp.当前称谓 == '独步青云' then
            tp.场景.人物.独步青云 = pwd('40')
        elseif tp.当前称谓 == '风华绝代' then
            tp.场景.人物.风华绝代 = pwd('41')
        elseif tp.当前称谓 == '风云再起' then
            tp.场景.人物.风云再起 = pwd('42')
        elseif tp.当前称谓 == '盖世无双' then
            tp.场景.人物.盖世无双 = pwd('43')
        elseif tp.当前称谓 == '盖世英豪' then
            tp.场景.人物.盖世英豪 = pwd('44')
        elseif tp.当前称谓 == '九五之尊' then
            tp.场景.人物.九五之尊 = pwd('45')
        elseif tp.当前称谓 == '龙皇' then
            tp.场景.人物.龙皇 = pwd('46')
        elseif tp.当前称谓 == '神豪' then
            tp.场景.人物.神豪 = pwd('47')
        elseif tp.当前称谓 == '战神' then
            tp.场景.人物.战神 = pwd('48')
        elseif tp.当前称谓 == '纵横三界王者风云' then
            tp.场景.人物.纵横三界王者风云 = pwd('49')
        elseif tp.当前称谓 == '武神坛甲组冠军' then
            tp.场景.人物.甲组冠军 = tp.资源:载入('xzsc.wdf', '网易WDF动画', 0xC4A082C0)
        elseif tp.当前称谓 == '武神坛甲组亚军' then
            tp.场景.人物.甲组亚军 = tp.资源:载入('xzsc.wdf', '网易WDF动画', 0xE7706EE2)
        elseif tp.当前称谓 == '武神坛甲组季军' then
            tp.场景.人物.甲组季军 = tp.资源:载入('xzsc.wdf', '网易WDF动画', 0x6336F8B3)
        elseif tp.当前称谓 == '武神坛明星冠军' then
            tp.场景.人物.明星冠军 = tp.资源:载入('xzsc.wdf', '网易WDF动画', 0xEB07CCCD)
        elseif tp.当前称谓 == '武神坛明星亚军' then
            tp.场景.人物.明星亚军 = tp.资源:载入('xzsc.wdf', '网易WDF动画', 0x550B771D)
        elseif tp.当前称谓 == '武神坛明星季军' then
            tp.场景.人物.明星季军 = tp.资源:载入('xzsc.wdf', '网易WDF动画', 0x69E88E4D)
        elseif tp.当前称谓 == '九天揽月' then
            tp.场景.人物.九天揽月 = tp.资源:载入('xzsc.wdf', '网易WDF动画', 0xAAFEC211)
        elseif tp.当前称谓 == '剑指苍穹' then
            tp.场景.人物.剑指苍穹 = tp.资源:载入('xzsc.wdf', '网易WDF动画', 0xFFAE13EE)
        elseif tp.当前称谓 == '势不可挡' then
            tp.场景.人物.势不可挡 = tp.资源:载入('xzsc.wdf', '网易WDF动画', 0xBEBEAE78)
        elseif tp.当前称谓 == '王者风范' then
            tp.场景.人物.王者风范 = tp.资源:载入('xzsc.wdf', '网易WDF动画', 0xCEAA7B7A)
        elseif tp.当前称谓 == '绝世豪侠' then
            tp.场景.人物.绝世豪侠框 = tp.资源:载入('xzsc.wdf', '网易WDF动画', 0xF15069E9)
        elseif tp.当前称谓 == '江湖豪侠' then
            tp.场景.人物.江湖豪侠框 = tp.资源:载入('xzsc.wdf', '网易WDF动画', 0xF15069E9)
        elseif tp.当前称谓 == '威震四方' then
            tp.场景.人物.梦幻大亨框 = tp.资源:载入('xzsc.wdf', '网易WDF动画', 0x0975DF49)
        elseif tp.当前称谓 == '只手遮天' then
            tp.场景.人物.黄称谓边框 = tp.资源:载入('xzsc.wdf', '网易WDF动画', 0xD7EA9DC8)
        elseif tp.当前称谓 == '降龙伏虎' then
            tp.场景.人物.黄称谓边框 = tp.资源:载入('xzsc.wdf', '网易WDF动画', 0xD7EA9DC8)
        elseif tp.当前称谓 == '富可敌国' then
            tp.场景.人物.富可敌国框 = tp.资源:载入('xzsc.wdf', '网易WDF动画', 0x21F08540)
        elseif tp.当前称谓 == '幕神梦幻' then
            tp.场景.人物.幕神梦幻框 = tp.资源:载入('xzsc.wdf', '网易WDF动画', 0x21F08540)
        elseif tp.当前称谓 == '窈窕淑女' then
            tp.场景.人物.窈窕淑女框 = tp.资源:载入('xzsc.wdf', '网易WDF动画', 0x800F661C)
        end
        tp.场景.人物.称谓偏移 = 生成XY(tp.字体表.人物字体:取宽度(tp.当前称谓) / 2, -15)
    end
end

function 内存类_队伍:重置属性(属性)
    for n, v in pairs(属性) do
        if type(n) ~= 'function' and type(n) ~= '运行父函数' and n ~= '存档数据' and n ~= '宝宝列表' then
            if type(n) == 'table' then ----------
                self[n] = table.loadstring(table.tostring(v))
            else
                if type(v) == 'table' then
                    -- print("重置属性装备", n , "->内容table：" ,table.tostring(v))
                else
                    -- print("重置属性装备", n , "->内容：" ,v)
                end
                self[n] = v
            end
        end
    end
    local 临时技能 = 0
    for n = 1, #self.师门技能 do
        临时技能 = require('script/显示类/技能')()
        临时技能:置对象(self.师门技能[n].名称)
        临时技能.包含技能 = {}
        临时技能.学会 = self.师门技能[n].学会
        临时技能.等级 = self.师门技能[n].等级
        local w = self:取包含技能(self.师门技能[n].名称)
        for s = 1, #w do
            临时技能.包含技能[s] = require('script/显示类/技能')()
            临时技能.包含技能[s]:置对象(w[s])
            临时技能.包含技能[s].学会 = self.师门技能[n].包含技能[s].学会
            临时技能.包含技能[s].等级 = self.师门技能[n].包含技能[s].等级
        end
        self.师门技能[n] = 临时技能
    end
    self.角色坐标 = {x = self.地图数据.x, y = self.地图数据.y}
    self.当前称谓 = self.当前称谓
    if tp.当前称谓 ~= nil and tp.当前称谓 ~= '' and tp.当前称谓 ~= self.当前称谓 and tp.场景 ~= nil and tp.场景.人物 ~= nil then
        if tp.当前称谓 == '至尊财神' then
            tp.场景.人物.至尊财神 = nil
        elseif tp.当前称谓 == '狂暴之力' then
            tp.场景.人物.狂暴之力 = nil
        elseif tp.当前称谓 == '武林圣者' then
            tp.场景.人物.武林圣者 = nil
        elseif tp.当前称谓 == '超凡入圣' then
            tp.场景.人物.超凡入圣 = nil
        elseif tp.当前称谓 == '洞察先机' then
            tp.场景.人物.洞察先机 = nil
        elseif tp.当前称谓 == '独步青云' then
            tp.场景.人物.独步青云 = nil
        elseif tp.当前称谓 == '风华绝代' then
            tp.场景.人物.风华绝代 = nil
        elseif tp.当前称谓 == '风云再起' then
            tp.场景.人物.风云再起 = nil
        elseif tp.当前称谓 == '盖世无双' then
            tp.场景.人物.盖世无双 = nil
        elseif tp.当前称谓 == '盖世英豪' then
            tp.场景.人物.盖世英豪 = nil
        elseif tp.当前称谓 == '九五之尊' then
            tp.场景.人物.九五之尊 = nil
        elseif tp.当前称谓 == '龙皇' then
            tp.场景.人物.龙皇 = nil
        elseif tp.当前称谓 == '神豪' then
            tp.场景.人物.神豪 = nil
        elseif tp.当前称谓 == '战神' then
            tp.场景.人物.战神 = nil
        elseif tp.当前称谓 == '纵横三界王者风云' then
            tp.场景.人物.纵横三界王者风云 = nil
        elseif tp.当前称谓 == '武神坛甲组冠军' then
            tp.场景.人物.甲组冠军 = nil
        elseif tp.当前称谓 == '武神坛甲组亚军' then
            tp.场景.人物.甲组亚军 = nil
        elseif tp.当前称谓 == '武神坛甲组季军' then
            tp.场景.人物.甲组季军 = nil
        elseif tp.当前称谓 == '武神坛明星冠军' then
            tp.场景.人物.明星冠军 = nil
        elseif tp.当前称谓 == '武神坛明星亚军' then
            tp.场景.人物.明星亚军 = nil
        elseif tp.当前称谓 == '武神坛明星季军' then
            tp.场景.人物.明星季军 = nil
        elseif tp.当前称谓 == '九天揽月' then
            tp.场景.人物.九天揽月 = nil
        elseif tp.当前称谓 == '剑指苍穹' then
            tp.场景.人物.剑指苍穹 = nil
        elseif tp.当前称谓 == '势不可挡' then
            tp.场景.人物.势不可挡 = nil
        elseif tp.当前称谓 == '王者风范' then
            tp.场景.人物.王者风范 = nil
        elseif tp.当前称谓 == '绝世豪侠' then
            tp.场景.人物.绝世豪侠框 = nil
        elseif tp.当前称谓 == '江湖豪侠' then
            tp.场景.人物.江湖豪侠框 = nil
        elseif tp.当前称谓 == '威震四方' then
            tp.场景.人物.梦幻大亨框 = nil
        elseif tp.当前称谓 == '只手遮天' then
            tp.场景.人物.黄称谓边框 = nil
        elseif tp.当前称谓 == '降龙伏虎' then
            tp.场景.人物.黄称谓边框 = nil
        elseif tp.当前称谓 == '富可敌国' then
            tp.场景.人物.富可敌国框 = nil
        elseif tp.当前称谓 == '幕神梦幻' then
            tp.场景.人物.幕神梦幻框 = nil
        elseif tp.当前称谓 == '窈窕淑女' then
            tp.场景.人物.窈窕淑女框 = nil
        end
    end
    tp.当前称谓 = self.当前称谓
    if tp.当前称谓 ~= nil and tp.当前称谓 ~= '' and tp.场景 ~= nil and tp.场景.人物 ~= nil then
        if tp.当前称谓 == '至尊财神' then
            tp.场景.人物.至尊财神 = tp.资源:载入('wzife.wd5', '网易假人动画', 0x01000051)
        elseif tp.当前称谓 == '狂暴之力' then
            tp.场景.人物.狂暴之力 = tp.资源:载入('wzife.wd5', '网易假人动画', 0x01000074)
        elseif tp.当前称谓 == '武林圣者' then
            tp.场景.人物.武林圣者 = tp.资源:载入('wzife.wd5', '网易假人动画', 0x01000076)
        elseif tp.当前称谓 == '超凡入圣' then
            tp.场景.人物.超凡入圣 = tp.资源:载入('wzife.wd5', '网易假人动画', 0x01000087)
        elseif tp.当前称谓 == '洞察先机' then
            tp.场景.人物.洞察先机 = pwd('39')
        elseif tp.当前称谓 == '独步青云' then
            tp.场景.人物.独步青云 = pwd('40')
        elseif tp.当前称谓 == '风华绝代' then
            tp.场景.人物.风华绝代 = pwd('41')
        elseif tp.当前称谓 == '风云再起' then
            tp.场景.人物.风云再起 = pwd('42')
        elseif tp.当前称谓 == '盖世无双' then
            tp.场景.人物.盖世无双 = pwd('43')
        elseif tp.当前称谓 == '盖世英豪' then
            tp.场景.人物.盖世英豪 = pwd('44')
        elseif tp.当前称谓 == '九五之尊' then
            tp.场景.人物.九五之尊 = pwd('45')
        elseif tp.当前称谓 == '龙皇' then
            tp.场景.人物.龙皇 = pwd('46')
        elseif tp.当前称谓 == '神豪' then
            tp.场景.人物.神豪 = pwd('47')
        elseif tp.当前称谓 == '战神' then
            tp.场景.人物.战神 = pwd('48')
        elseif tp.当前称谓 == '纵横三界王者风云' then
            tp.场景.人物.纵横三界王者风云 = pwd('49')
        elseif tp.当前称谓 == '武神坛甲组冠军' then
            tp.场景.人物.甲组冠军 = tp.资源:载入('xzsc.wdf', '网易WDF动画', 0xC4A082C0)
        elseif tp.当前称谓 == '武神坛甲组亚军' then
            tp.场景.人物.甲组亚军 = tp.资源:载入('xzsc.wdf', '网易WDF动画', 0xE7706EE2)
        elseif tp.当前称谓 == '武神坛甲组季军' then
            tp.场景.人物.甲组季军 = tp.资源:载入('xzsc.wdf', '网易WDF动画', 0x6336F8B3)
        elseif tp.当前称谓 == '武神坛明星冠军' then
            tp.场景.人物.明星冠军 = tp.资源:载入('xzsc.wdf', '网易WDF动画', 0xEB07CCCD)
        elseif tp.当前称谓 == '武神坛明星亚军' then
            tp.场景.人物.明星亚军 = tp.资源:载入('xzsc.wdf', '网易WDF动画', 0x550B771D)
        elseif tp.当前称谓 == '武神坛明星季军' then
            tp.场景.人物.明星季军 = tp.资源:载入('xzsc.wdf', '网易WDF动画', 0x69E88E4D)
        elseif tp.当前称谓 == '九天揽月' then
            tp.场景.人物.九天揽月 = tp.资源:载入('xzsc.wdf', '网易WDF动画', 0xAAFEC211)
        elseif tp.当前称谓 == '剑指苍穹' then
            tp.场景.人物.剑指苍穹 = tp.资源:载入('xzsc.wdf', '网易WDF动画', 0xFFAE13EE)
        elseif tp.当前称谓 == '势不可挡' then
            tp.场景.人物.势不可挡 = tp.资源:载入('xzsc.wdf', '网易WDF动画', 0xBEBEAE78)
        elseif tp.当前称谓 == '王者风范' then
            tp.场景.人物.王者风范 = tp.资源:载入('xzsc.wdf', '网易WDF动画', 0xCEAA7B7A)
        elseif tp.当前称谓 == '绝世豪侠' then
            tp.场景.人物.绝世豪侠框 = tp.资源:载入('xzsc.wdf', '网易WDF动画', 0xF15069E9)
        elseif tp.当前称谓 == '江湖豪侠' then
            tp.场景.人物.江湖豪侠框 = tp.资源:载入('xzsc.wdf', '网易WDF动画', 0xF15069E9)
        elseif tp.当前称谓 == '威震四方' then
            tp.场景.人物.梦幻大亨框 = tp.资源:载入('xzsc.wdf', '网易WDF动画', 0x0975DF49)
        elseif tp.当前称谓 == '只手遮天' then
            tp.场景.人物.黄称谓边框 = tp.资源:载入('xzsc.wdf', '网易WDF动画', 0xD7EA9DC8)
        elseif tp.当前称谓 == '降龙伏虎' then
            tp.场景.人物.黄称谓边框 = tp.资源:载入('xzsc.wdf', '网易WDF动画', 0xD7EA9DC8)
        elseif tp.当前称谓 == '富可敌国' then
            tp.场景.人物.富可敌国框 = tp.资源:载入('xzsc.wdf', '网易WDF动画', 0x21F08540)
        elseif tp.当前称谓 == '幕神梦幻' then
            tp.场景.人物.幕神梦幻框 = tp.资源:载入('xzsc.wdf', '网易WDF动画', 0x21F08540)
        elseif tp.当前称谓 == '窈窕淑女' then
            tp.场景.人物.窈窕淑女框 = tp.资源:载入('xzsc.wdf', '网易WDF动画', 0x800F661C)
        end
        tp.场景.人物.称谓偏移 = 生成XY(tp.字体表.人物字体:取宽度(tp.当前称谓) / 2, -15)
    end
end

function 内存类_队伍:置根(根)
    tp = 根
end

function 内存类_队伍:置新对象(ID)
    local ms = tp:取模型(ID)
    local ls = tp:队伍角色(ms)
    self.ID = ID
    self.名称 = ls.名称
    self.性别 = ls.性别
    self.模型 = ls.模型
    self.种族 = ls.种族
    self.可选门派 = ls.门派
    self.染色组 = {}
    self.染色方案 = ls.染色方案
    self.当前称谓 = ls.当前称谓
    self.可持有武器 = ls.武器
    local cs = tp:取初始属性(self.种族)
    self.体质 = cs[1]
    self.魔力 = cs[2]
    self.力量 = cs[3]
    self.耐力 = cs[4]
    self.敏捷 = cs[5]
    if not self:有无技能('牛刀小试') then
        local 初始技能 = jnzb()
        初始技能:置对象('牛刀小试')
        insert(self.人物技能, 初始技能)
    end
    local fz = {'强身术', '冥想', '强壮', '暗器技巧'}
    for i = 1, #fz do
        local 辅助技能 = jnzb()
        辅助技能:置对象(fz[i])
        辅助技能.等级 = 0
        insert(self.辅助技能, 辅助技能)
    end
    self:刷新信息('1')
end

function 内存类_队伍:穿戴装备(装备, 格子)
    self.装备属性.气血 = self.装备属性.气血 + (装备.气血 or 0)
    self.装备属性.魔法 = self.装备属性.魔法 + (装备.魔法 or 0)
    self.装备属性.命中 = self.装备属性.命中 + (装备.命中 or 0)
    self.装备属性.伤害 = self.装备属性.伤害 + (装备.伤害 or 0)
    self.装备属性.防御 = self.装备属性.防御 + (装备.防御 or 0)
    self.装备属性.速度 = self.装备属性.速度 + (装备.速度 or 0)
    self.装备属性.躲避 = self.装备属性.躲避 + (装备.躲避 or 0)
    self.装备属性.灵力 = self.装备属性.灵力 + (装备.灵力 or 0)
    self.装备属性.气血 = self.装备属性.气血 + (装备.体质 or 0) * 5
    self.装备属性.魔法 = self.装备属性.魔法 + (装备.魔力 or 0) * 5
    self.装备属性.伤害 = self.装备属性.伤害 + floor(((装备.力量 or 0) * 3.5))
    self.装备属性.防御 = self.装备属性.防御 + floor(((装备.耐力 or 0) * 2.3))
    self.装备属性.速度 = self.装备属性.速度 + floor(((装备.敏捷 or 0) * 2.3))
    if 格子 < 7 then
        self.装备[格子] = 装备
        if 装备.特技 ~= nil then
            self.特殊技能[格子] = jnzb()
            self.特殊技能[格子]:置对象(装备.特技)
        end
        if 装备.套装效果 ~= nil then
            local sl = {}
            local ab = true
            for i = 1, #self.套装 do
                if self.套装[i][1] == 装备.套装效果[1] and self.套装[i][2] == 装备.套装效果[2] then
                    local abc = false
                    local abd = true
                    for s = 1, #self.套装[i][4] do
                        if self.套装[i][4][s] == 格子 then
                            abd = false
                            break
                        end
                    end
                    if abd then
                        insert(self.套装[i][4], 格子)
                        abc = true
                    end
                    if abc then
                        self.套装[i][3] = (self.套装[i][3] or 0) + 1
                    end
                    ab = false
                    break
                end
            end
            if ab then
                insert(self.套装, {装备.套装效果[1], 装备.套装效果[2], 1, {格子}})
            end
        end
        if 格子 == 3 then
            tp.场景.人物:穿戴装备()
        end
    else
        self.灵饰[格子 - 9] = 装备
        if 格子 - 9 == 5 then
            tp.场景.人物:穿戴翅膀()
        end
    end
    if tp.窗口.队伍栏.可视 then
        tp.窗口.队伍栏.队伍格子[1]:置人物(tp.队伍[1])
    end
    self:刷新信息('2')
end

function 内存类_队伍:卸下装备(装备, 格子)
    self.装备属性.气血 = self.装备属性.气血 - (装备.气血 or 0)
    self.装备属性.魔法 = self.装备属性.魔法 - (装备.魔法 or 0)
    self.装备属性.命中 = self.装备属性.命中 - (装备.命中 or 0)
    self.装备属性.伤害 = self.装备属性.伤害 - (装备.伤害 or 0)
    self.装备属性.防御 = self.装备属性.防御 - (装备.防御 or 0)
    self.装备属性.速度 = self.装备属性.速度 - (装备.速度 or 0)
    self.装备属性.躲避 = self.装备属性.躲避 - (装备.躲避 or 0)
    self.装备属性.灵力 = self.装备属性.灵力 - (装备.灵力 or 0)
    self.装备属性.气血 = self.装备属性.气血 - (装备.体质 or 0) * 5
    self.装备属性.魔法 = self.装备属性.魔法 - (装备.魔力 or 0) * 5
    self.装备属性.伤害 = self.装备属性.伤害 - floor(((装备.力量 or 0) * 3.5))
    self.装备属性.防御 = self.装备属性.防御 - floor(((装备.耐力 or 0) * 2.3))
    self.装备属性.速度 = self.装备属性.速度 - floor(((装备.敏捷 or 0) * 2.3))
    if 格子 < 7 then
        if 装备.套装效果 ~= nil then
            for i = 1, #self.套装 do
                if self.套装[i] ~= nil and self.套装[i][1] == 装备.套装效果[1] and self.套装[i][2] == 装备.套装效果[2] then
                    local abd = nil
                    for s = 1, #self.套装[i][4] do
                        if self.套装[i][4][s] == 格子 then
                            abd = s
                            break
                        end
                    end
                    if abd then
                        remove(self.套装[i][4], abd)
                    end
                    if #self.套装[i][4] == 0 then
                        remove(self.套装, i)
                    end
                end
            end
        end
        if 格子 == 3 then
            tp.场景.人物:卸下装备()
        end
        if tp.窗口.队伍栏.可视 then
            tp.窗口.队伍栏.队伍格子[1]:置人物(tp.队伍[1])
        end
        self.装备[格子] = nil
    else
        self.灵饰[格子 - 9] = nil
        if 格子 - 9 == 5 then
            tp.场景.人物:卸下翅膀()
        end
    end
    self:刷新信息('2')
end

function 内存类_队伍:置门派(门派)
    self.门派 = 门派
    self.人物技能 = {}
    if not self:有无技能('牛刀小试') then
        local 初始技能 = jnzb()
        初始技能:置对象('牛刀小试')
        insert(self.人物技能, 初始技能)
    end
    local 列表 = tp:取门派技能(self.门派)
    for n = 1, #列表 do
        self.师门技能[n] = jnzb()
        self.师门技能[n]:置对象(列表[n])
        self.师门技能[n].等级 = 1
        local w = tp:取包含技能(self.师门技能[n].名称)
        self.师门技能[n].包含技能 = {}
        for s = 1, #w do
            if w[s] ~= nil then
                self.师门技能[n].包含技能[s] = jnzb()
                self.师门技能[n].包含技能[s]:置对象(w[s])
                self.师门技能[n].包含技能[s].等级 = self.师门技能[n].等级
            end
        end
        self:升级技能(self.师门技能[n])
    end
    self:刷新信息('1')
end

function 内存类_队伍:升级()
    self.等级 = self.等级 + 1
    self.体质 = self.体质 + 1
    self.魔力 = self.魔力 + 1
    self.力量 = self.力量 + 1
    self.耐力 = self.耐力 + 1
    self.敏捷 = self.敏捷 + 1
    self.潜力 = self.潜力 + 5
    self.最大体力 = self.最大体力 + 10
    self.最大活力 = self.最大活力 + 10
    self.当前经验 = self.当前经验 - self.最大经验
    self:刷新信息('1')
end

function 内存类_队伍:降级(级数)
    self.等级 = self.等级 - 级数
    self.体质 = self.体质 - 级数
    self.魔力 = self.魔力 - 级数
    self.力量 = self.力量 - 级数
    self.耐力 = self.耐力 - 级数
    self.敏捷 = self.敏捷 - 级数
    self.潜力 = self.潜力 - 级数 * 5
    self.最大体力 = self.最大体力 - 级数 * 10
    self.最大活力 = self.最大活力 - 级数 * 10
    if self.潜力 <= 0 then
        self.潜力 = 0
    end
    self:刷新信息('1')
end

function 内存类_队伍:刷新信息(是否, 体质, 魔力)
    local 五维属性 = tp:取属性(self.种族, {self.体质, self.魔力, self.力量, self.耐力, self.敏捷}, self.技能等级)
    self.命中 = 五维属性['命中'] + self.装备属性.命中 + self.技能属性.命中
    self.伤害 = 五维属性['伤害'] + self.装备属性.伤害 + self.技能属性.伤害 + floor(self.装备属性.命中 / 3)
    self.防御 = 五维属性['防御'] + self.装备属性.防御 + self.技能属性.防御
    self.速度 = 五维属性['速度'] + self.装备属性.速度 + self.技能属性.速度
    self.灵力 = 五维属性['灵力'] + self.装备属性.灵力 + self.技能属性.灵力
    self.躲避 = 五维属性['躲避'] + self.装备属性.躲避 + self.技能属性.躲避
    self.最大气血 = 五维属性['气血'] + self.装备属性.气血 + self.技能属性.气血
    self.最大魔法 = 五维属性['法力'] + self.装备属性.魔法 + self.技能属性.魔法
    if 是否 == '1' then
        self.气血 = self.最大气血
        self.魔法 = self.最大魔法
    end
    if 体质 ~= nil and 体质 > 0 then
        self.气血 = self.最大气血
    end
    if 魔力 ~= nil and 魔力 > 0 then
        self.魔法 = self.最大魔法
    end
    self.气血 = self.气血 + self.装备属性.气血 + self.技能属性.气血
    self.魔法 = self.魔法 + self.装备属性.魔法 + self.技能属性.魔法
    if self.气血 > self.最大气血 then
        self.气血 = self.最大气血 - self.气血 + self.气血
    end
    if self.魔法 > self.最大魔法 then
        self.魔法 = self.最大魔法 - self.魔法 + self.魔法
    end
    if self.愤怒 > 150 then
        self.愤怒 = 150 - self.愤怒 + self.愤怒
    end
    if self.活力 > 100 then
        self.活力 = 100 - self.活力 + self.活力
    end
    if self.体力 > 100 then
        self.体力 = 100 - self.体力 + self.体力
    end
    self.等级 = self.等级
    if self.等级 <= 174 then
        self.最大经验 = tp:取经验(1, self.等级)
    end
    if self.门派 ~= '无' and self.门派 ~= '无门派' and self.师门技能[1] == nil then
        local 列表 = tp:取门派技能(self.门派)
        for n = 1, #列表 do
            self.师门技能[n] = jnzb()
            self.师门技能[n]:置对象(列表[n])
            self.师门技能[n].包含技能 = {}
            local w = tp:取包含技能(self.师门技能[n].名称)
            for s = 1, #w do
                self.师门技能[n].包含技能[s] = jnzb()
                self.师门技能[n].包含技能[s]:置对象(w[s])
            end
        end
    end
    if self.师门技能[1] ~= nil then
        if 是否 == '2' then
            for n = 1, 7 do
                for l = 1, #self.师门技能[n].包含技能 do
                    if self:有无技能(self.师门技能[n].包含技能[l].名称) then
                        self.师门技能[n].包含技能[l].学会 = true
                    end
                end
            end
        end
    end
end

function 内存类_队伍:刷新临时信息(是否, 体质, 魔力)
    local 五维属性 = self:临时取属性(self.种族, {self.临时属性.体质, self.临时属性.魔力, self.临时属性.力量, self.临时属性.耐力, self.临时属性.敏捷}, self.技能等级)
    self.临时属性 = {
        气血 = 五维属性['气血'],
        魔法 = 五维属性['法力'],
        命中 = 五维属性['命中'],
        伤害 = 五维属性['伤害'],
        防御 = 五维属性['防御'],
        速度 = 五维属性['速度'],
        躲避 = 五维属性['躲避'],
        灵力 = 五维属性['灵力'],
        体质 = self.临时属性.体质,
        魔力 = self.临时属性.魔力,
        力量 = self.临时属性.力量,
        耐力 = self.临时属性.耐力,
        敏捷 = self.临时属性.敏捷
    }
end

function 内存类_队伍:临时取属性(种族, 五维, 技能)
    local 属性 = {}
    local 力量 = 五维[3]
    local 体力 = 五维[1]
    local 魔力 = 五维[2]
    local 耐力 = 五维[4]
    local 敏捷 = 五维[5]
    技能 = 技能 or {0, 0, 0, 0}
    if 种族 == '人' or 种族 == 1 then
        属性 = {
            命中 = ceil(力量 * 2),
            伤害 = ceil(力量 * 0.67),
            防御 = ceil(耐力 * 1.5),
            速度 = ceil(敏捷),
            灵力 = ceil(体力 * 0.3 + 魔力 * 0.7 + 耐力 * 0.2 + 力量 * 0.4),
            躲避 = ceil(敏捷),
            气血 = ceil((体力 * 5 + 100) * (1 + 技能[1] / 100) + 技能[3] * 4) - 100,
            法力 = ceil((魔力 * 3 + 80) * (1 + 技能[2] / 100)) - 80
        }
    elseif 种族 == '魔' or 种族 == 2 then
        属性 = {
            命中 = ceil(力量 * 2.3),
            伤害 = ceil(力量 * 0.77),
            防御 = ceil(耐力 * 214 / 153),
            速度 = ceil(敏捷),
            灵力 = ceil(体力 * 0.3 + 魔力 * 0.7 + 耐力 * 0.2 + 力量 * 0.4 - 0.3),
            躲避 = ceil(敏捷),
            气血 = ceil((体力 * 6 + 100) * (1 + 技能[1] / 100) + 技能[3] * 4) - 100,
            法力 = ceil((魔力 * 2.5 + 80) * (1 + 技能[2] / 100)) - 80
        }
    elseif 种族 == '仙' or 种族 == 3 then
        属性 = {
            命中 = ceil(力量 * 1.7),
            伤害 = ceil(力量 * 0.57),
            防御 = ceil(耐力 * 1.6),
            速度 = ceil(敏捷),
            灵力 = ceil(体力 * 0.3 + 魔力 * 0.7 + 耐力 * 0.2 + 力量 * 0.4 - 0.3),
            躲避 = ceil(敏捷),
            气血 = ceil((体力 * 4.5 + 100) * (1 + 技能[1] / 100) + 技能[3] * 4) - 100,
            法力 = ceil((魔力 * 3.5 + 80) * (1 + 技能[2] / 100)) - 80
        }
    end
    return 属性
end

function 内存类_队伍:有无技能(名称)
    for n = 1, #self.人物技能 do
        if self.人物技能[n].名称 == 名称 then
            return true
        end
    end
    return false
end

function 内存类_队伍:学会技能(id, gz)
    if self.师门技能[id] ~= nil then
        for s = 1, #self.师门技能[id].包含技能 do
            if self.师门技能[id].包含技能[s].名称 == gz and not self:有无技能(gz) then
                self.师门技能[id].包含技能[s].学会 = true
                self.师门技能[id].包含技能[s].等级 = self.师门技能[id].等级
                insert(self.人物技能, self.师门技能[id].包含技能[s])
                tp.窗口.消息框:添加文本('学会技能 ' .. gz)
            end
        end
    end
end

function 内存类_队伍:升级技能(jn) -- 升级获得技能
    -- 化生
    if jn.等级 == nil then
        jn.等级 = 1
    end
    if jn.名称 == '小乘佛法' then
        self.技能属性.灵力 = floor(jn.等级 * 2.5)
    elseif jn.名称 == '金刚伏魔' then
        self.技能属性.伤害 = floor(jn.等级 * 2.5)
        if jn.等级 >= 120 then
            self:学会技能(2, '佛法无边')
        end
    elseif jn.名称 == '诵经' then
        if jn.等级 >= 1 then
            self:学会技能(3, '唧唧歪歪')
        end
    elseif jn.名称 == '佛光普照' then
        if jn.等级 >= 20 then
            self:学会技能(4, '韦陀护法')
        end
        if jn.等级 >= 35 then
            self:学会技能(4, '金刚护体')
        end
        if jn.等级 >= 30 then
            self:学会技能(4, '达摩护体')
            self:学会技能(4, '一苇渡江')
            self:学会技能(4, '金刚护法')
        end
    elseif jn.名称 == '大慈大悲' then
        if jn.等级 >= 40 then
            self:学会技能(5, '我佛慈悲')
        end
        self.技能属性.防御 = floor(jn.等级 * 2.5)
    elseif jn.名称 == '歧黄之术' then
        if jn.等级 >= 10 then
            self:学会技能(6, '推拿')
        end
        if jn.等级 >= 15 then
            self:学会技能(6, '解毒')
        end
        if jn.等级 >= 25 then
            self:学会技能(6, '活血')
        end
        if jn.等级 >= 35 then
            self:学会技能(6, '推气过宫')
        end
        if jn.等级 >= 120 then
            self:学会技能(6, '舍身取义')
        end
    elseif jn.名称 == '渡世步' then
        -- 大唐
        if jn.等级 == 1 then
            self:学会技能(7, '佛门普渡')
        end
        self.技能属性.躲避 = floor(jn.等级 * 2.5)
    elseif jn.名称 == '为官之道' then
        if jn.等级 >= 15 then
            self:学会技能(1, '杀气诀')
        end
    elseif jn.名称 == '无双一击' then
        if jn.等级 >= 25 then
            self:学会技能(2, '后发制人')
        end
        self.技能属性.命中 = floor(jn.等级 * 2.5)
    elseif jn.名称 == '神兵鉴赏' then
    elseif jn.名称 == '疾风步' then
        if jn.等级 >= 1 then
            self:学会技能(4, '千里神行')
        end
        self.技能属性.躲避 = floor(jn.等级 * 2.5)
    elseif jn.名称 == '十方无敌' then
        if jn.等级 >= 30 then
            self:学会技能(5, '横扫千军')
        end
        if jn.等级 >= 120 then
            self:学会技能(5, '破釜沉舟')
        end
        self.技能属性.伤害 = floor(jn.等级 * 2.5)
    elseif jn.名称 == '紫薇之术' then
        self.技能属性.灵力 = floor(jn.等级 * 2.5)
    elseif jn.名称 == '文韬武略' then
        -- 龙宫
        if jn.等级 >= 120 then
            self:学会技能(7, '安神诀')
        end
        self.技能属性.防御 = floor(jn.等级 * 2.5)
    elseif jn.名称 == '九龙诀' then
        if jn.等级 >= 15 then
            self:学会技能(1, '清心')
        end
        if jn.等级 >= 30 then
            self:学会技能(1, '解封')
        end
        if jn.等级 >= 130 then
            self:学会技能(1, '二龙戏珠')
        end
        self.技能属性.灵力 = floor(jn.等级 * 2.5)
    elseif jn.名称 == '破浪诀' then
        self.技能属性.伤害 = floor(jn.等级 * 2.5)
        if jn.等级 >= 120 then
            self:学会技能(2, '神龙摆尾')
        end
    elseif jn.名称 == '呼风唤雨' then
        if jn.等级 >= 15 then
            self:学会技能(3, '龙卷雨击')
        end
    elseif jn.名称 == '龙腾术' then
        if jn.等级 >= 50 then
            self:学会技能(4, '龙腾')
        end
    elseif jn.名称 == '逆鳞术' then
        if jn.等级 >= 30 then
            self:学会技能(5, '逆鳞')
        end
        self.技能属性.防御 = floor(jn.等级 * 2.5)
    elseif jn.名称 == '游龙术' then
        if jn.等级 >= 1 then
            self:学会技能(6, '水遁')
        end
        if jn.等级 >= 20 then
            self:学会技能(6, '乘风破浪')
        end
        self.技能属性.躲避 = floor(jn.等级 * 2.5)
    elseif jn.名称 == '龙附术' then
        -- 方寸
        if jn.等级 >= 25 then
            self:学会技能('龙啸九天')
        end
        if jn.等级 >= 30 then
            self:学会技能(7, '龙吟')
        end
        if jn.等级 >= 35 then
            self:学会技能(7, '龙附')
        end
    elseif jn.名称 == '磐龙灭法' then
        self.技能属性.伤害 = floor(jn.等级 * 2.5)
    elseif jn.名称 == '霹雳咒' then
        if jn.等级 >= 1 then
            self:学会技能(3, '五雷咒')
        end
    elseif jn.名称 == '符之术' then
        if jn.等级 >= 10 then
            self:学会技能(4, '催眠符')
        end
        if jn.等级 >= 15 then
            self:学会技能(4, '落魄符')
        end
        if jn.等级 >= 20 then
            self:学会技能(4, '追魂符')
        end
        if jn.等级 >= 21 then
            self:学会技能(4, '飞行符')
        end
        if jn.等级 >= 30 then
            self:学会技能(4, '定身符')
        end
        if jn.等级 >= 20 then
            self:学会技能(4, '落雷符')
        end
        if jn.等级 >= 25 then
            self:学会技能(4, '失魂符')
            self:学会技能(4, '离魂符')
        end
        if jn.等级 >= 40 then
            self:学会技能(4, '失心符')
        end
        if jn.等级 >= 120 then
            self:学会技能(4, '碎甲符')
        end
    elseif jn.名称 == '归元心法' then
        if jn.等级 >= 10 then
            self:学会技能(5, '归元咒')
        end
        self.技能属性.防御 = floor(jn.等级 * 2.5)
    elseif jn.名称 == '神道无念' then
        if jn.等级 >= 30 then
            self:学会技能(6, '乾天罡气')
        end
        if jn.等级 >= 120 then
            self:学会技能(6, '分身术')
        end
        self.技能属性.灵力 = floor(jn.等级 * 2.5)
    elseif jn.名称 == '斜月步' then
        -- 地府
        if jn.等级 >= 1 then
            self:学会技能(7, '乙木仙遁')
        end
        self.技能属性.躲避 = floor(jn.等级 * 2.5)
    elseif jn.名称 == '幽冥术' then
        if jn.等级 >= 25 then
            self:学会技能(3, '阎罗令')
        end
    elseif jn.名称 == '六道轮回' then
        self.技能属性.伤害 = floor(jn.等级 * 2.5)
    elseif jn.名称 == '拘魂诀' then
        if jn.等级 >= 20 then
            self:学会技能(4, '判官令')
        end
        if jn.等级 >= 120 then
            self:学会技能(4, '还阳术')
        end
    elseif jn.名称 == '九幽阴魂' then
        self.技能属性.灵力 = floor(jn.等级 * 2.5)
    elseif jn.名称 == '尸腐恶' then
        if jn.等级 >= 20 then
            self:学会技能(6, '尸腐毒')
        end
        self.技能属性.防御 = floor(jn.等级 * 2.5)
    elseif jn.名称 == '无常步' then
        -- 天宫
        if jn.等级 >= 1 then
            self:学会技能(7, '杳无音讯')
        end
        self.技能属性.速度 = floor(jn.等级 * 2.5)
    elseif jn.名称 == '天罡气' then
        if jn.等级 >= 30 then
            self:学会技能(1, '天神护体')
        end
        if jn.等级 >= 40 then
            self:学会技能(1, '天神护法')
        end
        if jn.等级 >= 35 then
            self:学会技能(1, '五雷轰顶')
        end
        if jn.等级 >= 120 then
            self:学会技能(1, '雷霆万钧')
        end
        self.技能属性.伤害 = floor(jn.等级 * 2.5)
    elseif jn.名称 == '傲世诀' then
        if jn.等级 >= 25 then
            self:学会技能(2, '天雷斩')
        end
    elseif jn.名称 == '宁气诀' then
        self.技能属性.灵力 = floor(jn.等级 * 2.5)
    elseif jn.名称 == '清明自在' then
        self.技能属性.气血 = floor(jn.等级 * 3)
    elseif jn.名称 == '乾坤塔' then
        if jn.等级 >= 50 then
            self:学会技能(5, '错乱')
        end
        self.技能属性.防御 = floor(jn.等级 * 2.5)
    elseif jn.名称 == '混天术' then
        if jn.等级 >= 40 then
            self:学会技能(6, '百万神兵')
        end
    elseif jn.名称 == '云霄步' then
        -- 魔王
        if jn.等级 >= 1 then
            self:学会技能(7, '腾云驾雾')
        end
        self.技能属性.躲避 = floor(jn.等级 * 2.5)
    elseif jn.名称 == '火云术' then
        if jn.等级 >= 30 then
            self:学会技能(3, '飞砂走石')
        end
        if jn.等级 >= 20 then
            self:学会技能(3, '三昧真火')
        end
    elseif jn.名称 == '裂石步' then
        if jn.等级 >= 1 then
            self:学会技能(7, '牛屎遁')
        end
        self.技能属性.躲避 = floor(jn.等级 * 2.5)
    elseif jn.名称 == '震天诀' then
        self.技能属性.伤害 = floor(jn.等级 * 2.5)
    elseif jn.名称 == '火牛阵' then
        if jn.等级 >= 30 then
            self:学会技能(4, '牛劲')
        end
        self.技能属性.灵力 = floor(jn.等级 * 2.5)
    elseif jn.名称 == '回身击' then
        self.技能属性.防御 = floor(jn.等级 * 2.5)
    elseif jn.名称 == '裂石步' then
        --普陀
        self.技能属性.速度 = floor(jn.等级 * 2.5)
    elseif jn.名称 == '灵性' then
        self.技能属性.灵力 = floor(jn.等级 * 2.5)
    elseif jn.名称 == '护法金刚' then
        self.技能属性.伤害 = floor(jn.等级 * 2.5)
    elseif jn.名称 == '金刚经' then
        if jn.等级 >= 15 then
            self:学会技能(5, '普渡众生')
        end
        if jn.等级 >= 120 then
            self:学会技能(5, '灵动九天')
        end
    elseif jn.名称 == '观音咒' then
        if jn.等级 >= 30 then
            self:学会技能(3, '紧箍咒')
        end
        if jn.等级 >= 20 then
            self:学会技能(3, '杨柳甘露')
        end
    elseif jn.名称 == '五行学说' then
        if jn.等级 >= 10 then
            self:学会技能(4, '日光华')
        end
        if jn.等级 >= 10 then
            self:学会技能(4, '靛沧海')
        end
        if jn.等级 >= 10 then
            self:学会技能(4, '巨岩破')
        end
        if jn.等级 >= 10 then
            self:学会技能(4, '苍茫树')
        end
        if jn.等级 >= 10 then
            self:学会技能(4, '地裂火')
        end
    elseif jn.名称 == '五行扭转' then
        if jn.等级 >= 20 then
            self:学会技能(6, '颠倒五行')
        end
        self.技能属性.防御 = floor(jn.等级 * 2.5)
    elseif jn.名称 == '莲花宝座' then
        -- 五庄观
        if jn.等级 >= 1 then
            self:学会技能(7, '坐莲')
        end
        self.技能属性.躲避 = floor(jn.等级 * 2.5)
    elseif jn.名称 == '周易学' then
        self.技能属性.魔法 = floor(jn.等级 * 3)
    elseif jn.名称 == '潇湘仙雨' then
        if jn.等级 >= 25 then
            self:学会技能(2, '烟雨剑法')
        end
        if jn.等级 >= 20 then
            self:学会技能(2, '飘渺式')
        end
        self.技能属性.伤害 = floor(jn.等级 * 2.5)
    elseif jn.名称 == '乾坤袖' then
        if jn.等级 >= 20 then
            self:学会技能(3, '日月乾坤')
        end
    elseif jn.名称 == '修仙术' then
        if jn.等级 >= 30 then
            self:学会技能(4, '炼气化神')
        end
        if jn.等级 >= 30 then
            self:学会技能(4, '生命之泉')
        end
    elseif jn.名称 == '混元道果' then
        self.技能属性.灵力 = floor(jn.等级 * 2.5)
    elseif jn.名称 == '明性修身' then
        if jn.等级 >= 30 then
            self:学会技能(6, '三花聚顶')
        end
        self.技能属性.防御 = floor(jn.等级 * 2.5)
    elseif jn.名称 == '七星遁' then
        -- 狮驼岭
        if jn.等级 >= 1 then
            self:学会技能(7, '斗转星移')
        end
        self.技能属性.躲避 = floor(jn.等级 * 2.5)
    elseif jn.名称 == '魔兽神功' then
        if jn.等级 >= 20 then
            self:学会技能(1, '变身')
        end
    elseif jn.名称 == '生死搏' then
        if jn.等级 >= 20 then
            self:学会技能(2, '象形')
        end
        if jn.等级 >= 30 then
            self:学会技能(2, '鹰击')
        end
        if jn.等级 >= 20 then
            self:学会技能(2, '狮搏')
        end
        self.技能属性.伤害 = floor(jn.等级 * 2.5)
    elseif jn.名称 == '训兽诀' then
        self.技能属性.灵力 = floor(jn.等级 * 2.5)
    elseif jn.名称 == '狂兽诀' then
        if jn.等级 >= 30 then
            self:学会技能(5, '连环击')
        end
    elseif jn.名称 == '大鹏展翅' then
        if jn.等级 >= 1 then
            self:学会技能(6, '振翅千里')
        end
        self.技能属性.躲避 = floor(jn.等级 * 2.5)
    elseif jn.名称 == '魔兽反噬' then
        -- 盘丝洞
        self.技能属性.防御 = floor(jn.等级 * 2.5)
    elseif jn.名称 == '秋波暗送' then
        if jn.等级 >= 20 then
            self:学会技能(3, '勾魂')
        end
        if jn.等级 >= 20 then
            self:学会技能(3, '摄魄')
        end
        self.技能属性.命中 = floor(jn.等级 * 2.5)
    elseif jn.名称 == '蛛丝阵法' then
        if jn.等级 >= 30 then
            self:学会技能(35, '盘丝舞')
        end
        self.技能属性.防御 = floor(jn.等级 * 2.5)
    elseif jn.名称 == '迷情大法' then
        if jn.等级 >= 30 then
            self:学会技能(2, '含情脉脉')
        end
    elseif jn.名称 == '盘丝大法' then
        if jn.等级 >= 20 then
            self:学会技能(5, '盘丝阵')
        end
        self.技能属性.伤害 = floor(jn.等级 * 2.5)
    elseif jn.名称 == '盘丝步' then
        -- 凌波城
        if jn.等级 >= 15 then
            self:学会技能(6, '天罗地网')
        end
        if jn.等级 >= 1 then
            self:学会技能(6, '天蚕丝')
        end
        self.技能属性.躲避 = floor(jn.等级 * 2.5)
    elseif jn.名称 == '九转玄功' then
        if jn.等级 >= 25 then
            self:学会技能(2, '不动如山')
        end
    elseif jn.名称 == '武神显圣' then
        if jn.等级 >= 30 then
            self:学会技能(3, '碎星诀')
        end
    elseif jn.名称 == '气吞山河' then
        if jn.等级 >= 25 then
            self:学会技能(5, '裂石')
        end
        if jn.等级 >= 25 then
            self:学会技能(5, '浪涌')
        end
        if jn.等级 >= 35 then
            self:学会技能(5, '断岳势')
        end
        if jn.等级 >= 45 then
            self:学会技能(5, '天崩地裂')
        end
        if jn.等级 >= 45 then
            self:学会技能(5, '翻江搅海')
        end
        if jn.等级 >= 35 then
            self:学会技能(5, '惊涛怒')
        end
        self.技能属性.伤害 = floor(jn.等级 * 2.5)
    elseif jn.名称 == '啸傲' then
        self.技能属性.灵力 = floor(jn.等级 * 2.5)
    elseif jn.名称 == '诛魔' then
        self.技能属性.防御 = floor(jn.等级 * 2.5)
    elseif jn.名称 == '法天象地' then
        -- 神木林
        if jn.等级 >= 1 then
            self:学会技能(7, '纵地金光')
        end
        self.技能属性.命中 = floor(jn.等级 * 2.5)
    elseif jn.名称 == '瞬息万变' then
        if jn.等级 >= 35 then
            self:学会技能(1, '落叶萧萧')
        end
    elseif jn.名称 == '万灵诸念' then
        if jn.等级 >= 20 then
            self:学会技能(2, '荆棘舞')
        end
        if jn.等级 >= 20 then
            self:学会技能(2, '尘土刃')
        end
        if jn.等级 >= 20 then
            self:学会技能(2, '冰川怒')
        end
        self.技能属性.灵力 = floor(jn.等级 * 2.5)
    elseif jn.名称 == '巫咒' then
        if jn.等级 >= 40 then
            self:学会技能(3, '雾杀')
        end
        if jn.等级 >= 40 then
            self:学会技能(3, '血雨')
        end
        self.技能属性.伤害 = floor(jn.等级 * 2.5)
    elseif jn.名称 == '万物轮转' then
        if jn.等级 >= 35 then
            self:学会技能(4, '星月之惠')
        end
        self.技能属性.防御 = floor(jn.等级 * 2.5)
    elseif jn.名称 == '天人庇护' then
        if jn.等级 >= 50 then
            self:学会技能(5, '炎护')
        end
        if jn.等级 >= 1 then
            self:学会技能(5, '叶隐')
        end
        self.技能属性.躲避 = floor(jn.等级 * 2.5)
    elseif jn.名称 == '神木恩泽' then
    elseif jn.名称 == '驭灵咒' then
        -- 无底洞
        if jn.等级 >= 20 then
            self:学会技能(7, '蜜润')
        end
        self.技能属性.魔法 = floor(jn.等级 * 3)
    elseif jn.名称 == '枯骨心法' then
        if jn.等级 >= 20 then
            self:学会技能(1, '移魂化骨')
        end
    elseif jn.名称 == '阴风绝章' then
        if jn.等级 >= 25 then
            self:学会技能(2, '夺魄令')
        end
        if jn.等级 >= 30 then
            self:学会技能(2, '煞气决')
        end
        if jn.等级 >= 50 then
            self:学会技能(2, '惊魂掌')
        end
        if jn.等级 >= 20 then
            self:学会技能(2, '摧心术')
        end
    elseif jn.名称 == '鬼蛊灵蕴' then
        if jn.等级 >= 35 then
            self:学会技能(3, '夺命咒')
        end
        self.技能属性.灵力 = floor(jn.等级 * 2.5)
    elseif jn.名称 == '燃灯灵宝' then
        if jn.等级 >= 35 then
            self:学会技能(4, '明光宝烛')
        end
        self.技能属性.防御 = floor(jn.等级 * 2.5)
    elseif jn.名称 == '地冥妙法' then
        if jn.等级 >= 20 then
            self:学会技能(5, '地涌金莲')
        end
    elseif jn.名称 == '混元神功' then
        self.技能属性.伤害 = floor(jn.等级 * 2.5)
    elseif jn.名称 == '秘影迷踪' then
        -- 女儿
        if jn.等级 >= 1 then
            self:学会技能(7, '遁地术')
        end
        self.技能属性.速度 = floor(jn.等级 * 2.5)
    elseif jn.名称 == '毒经' then
        self.技能属性.伤害 = floor(jn.等级 * 2.5)
    elseif jn.名称 == '倾国倾城' then
        if jn.等级 >= 20 then
            self:学会技能(2, '红袖添香')
        end
        if jn.等级 >= 10 then
            self:学会技能(2, '楚楚可怜')
        end
        if jn.等级 >= 120 then
            self:学会技能(2, '一笑倾城')
        end
    elseif jn.名称 == '沉鱼落雁' then
        if jn.等级 >= 25 then
            self:学会技能(3, '满天花雨')
        end
        if jn.等级 >= 20 then
            self:学会技能(3, '雨落寒沙')
        end
    elseif jn.名称 == '闭月羞花' then
        if jn.等级 >= 30 then
            self:学会技能(4, '莲步轻舞')
        end
        if jn.等级 >= 30 then
            self:学会技能(4, '如花解语')
        end
        if jn.等级 >= 40 then
            self:学会技能(4, '似玉生香')
        end
    elseif jn.名称 == '香飘兰麝' then
        self.技能属性.灵力 = floor(jn.等级 * 2.5)
    elseif jn.名称 == '玉质冰肌' then
        if jn.等级 >= 10 then
            self:学会技能(6, '百毒不侵')
        end
        self.技能属性.防御 = floor(jn.等级 * 2.5)
    elseif jn.名称 == '清歌妙舞' then
        if jn.等级 >= 1 then
            self:学会技能(7, '移形换影')
        end
        if jn.等级 >= 120 then
            self:学会技能(7, '飞花摘叶')
        end
        self.技能属性.速度 = floor(jn.等级 * 2.5)
    end
    self:刷新信息()
end

return 内存类_队伍
