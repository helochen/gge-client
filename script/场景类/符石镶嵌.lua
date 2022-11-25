--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2021-02-24 17:09:24
--======================================================================--
local 场景类_符石镶嵌 = class()

local floor = math.floor
local format = string.format
local tp,zts1
local insert = table.insert

function 场景类_符石镶嵌:初始化(根)
    self.ID = 60
    self.xx = 0
    self.yy = 0
    self.x = 100
    self.y = 200
    self.注释 = "符石镶嵌"
    self.可视 = false
    self.鼠标 = false
    self.焦点 = false
    self.可移动 = true
    self.介绍文本 = 根._丰富文本(180,300)
    :添加元素("f",0xFFFF6EC7)
    self.介绍文本2 = 根._丰富文本(180,300)
    self.大模型 = nil
    self.符石数量 = 0
    tp = 根
    zts1 = tp.字体表.描边字体
    zts2 = tp.字体表.道具字体
    self.窗口时间 = 0
    self.道具 = nil
end

function 场景类_符石镶嵌:打开(道具)
    if self.可视 then
        for i=1,5 do
            self.物品[i]:置物品(nil)
            self.选中符石[i] = 0
        end
        self.可视 = false
        self.符石数量 = 0
        self.资源组 = nil
        self.物品 = nil
        self.选中符石 = nil
        return
    else
        insert(tp.窗口_,self)
        local 资源 = tp.资源
        local 按钮 = tp._按钮
        local 自适应 = tp._自适应
        self.资源组 = {
            [1] = 资源:载入('wzife.wd1',"网易WDF动画",0x444EB0FF),
            [2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),
            [3] = 自适应.创建(1,1,99,18,1,3,nil,18),
            [4] = 资源:载入('wzife.wd1',"网易WDF动画",0x0B9E4143),
            [5] = 资源:载入('wzife.wd1',"网易WDF动画",0xB0C4E507),
            [6] = 资源:载入('wzife.wd1',"网易WDF动画",0x685ABA69),
            [7] = 资源:载入('wzife.wd1',"网易WDF动画",0x431EEEC5),
            [8] = 资源:载入('wzife.wd1',"网易WDF动画",0xC53B87D1),
            [9] = 按钮.创建(自适应.创建(12,4,55,22,1,1),0,0,4,true,true,"镶嵌"),
            [10] = 按钮.创建(自适应.创建(12,4,55,22,1,1),0,0,4,true,true,"还原"),
            [11] = 资源:载入('wzife.wd1',"网易WDF动画",0x7F09EF0A)--边框
        }
        self.资源组[2]:绑定窗口_(60)
        self.资源组[9]:绑定窗口_(60)
        self.资源组[10]:绑定窗口_(60)
        local 格子 = tp._物品格子
        self.物品 = {}
        for i=1,5 do
            self.物品[i] = 格子(0,0,i,"道具行囊")
        end
        self.选中符石 ={}
        for i=1,5 do
            self.选中符石[i] = 0
        end

        self.x = tp.窗口.道具行囊.x+298
        self.y = tp.窗口.道具行囊.y-10
        self.道具 = 道具.道具[道具.ID].物品
        self.格子 = 道具.ID
        self.符石数量 = #self.道具
        self.大模型 = tp.资源:载入(self.道具.资源,"网易WDF动画",self.道具.大模型资源)
        self.介绍文本:清空()
        self.介绍文本2:清空()
        self.介绍文本:添加文本(self.道具.介绍)
        self.介绍文本:添加文本("#W/【装备条件】 等级"..self.道具.级别限制)
        if self.道具.角色限制 ~=nil then
            if self.道具.角色限制[2] == nil then
                self.介绍文本:添加文本("#W/【装备角色】"..self.道具.角色限制[1])
            else
                self.介绍文本:添加文本("#W/【装备角色】"..self.道具.角色限制[1].."、"..self.道具.角色限制[2])
            end
        end
        self.介绍文本:添加文本(format("#G/开运孔数：%s",self.道具.开运孔数.当前.."孔/"..self.道具.开运孔数.上限.."孔"))
        for i=1,5 do
            if self.道具.符石[i] ~= nil and  self.道具.符石[i].名称 ~= nil then
                self.物品[i]:置物品(self.道具.符石[i])
                local sx = ""
                local 气血 = self.道具.符石[i].气血
                local 魔法 = self.道具.符石[i].魔法
                local 命中 = self.道具.符石[i].命中
                local 伤害 = self.道具.符石[i].伤害
                local 防御 = self.道具.符石[i].防御
                local 速度 = self.道具.符石[i].速度
                local 躲避 = self.道具.符石[i].躲避
                local 灵力 = self.道具.符石[i].灵力
                local 体质 = self.道具.符石[i].体质
                local 魔力 = self.道具.符石[i].魔力
                local 力量 = self.道具.符石[i].力量
                local 耐力 = self.道具.符石[i].耐力
                local 敏捷 = self.道具.符石[i].敏捷
                local 法术伤害 = self.道具.符石[i].法术伤害
                local 法术防御 = self.道具.符石[i].法术防御
                local 固定伤害 = self.道具.符石[i].固定伤害
                if 气血 ~= 0 and 气血 ~= nil then
                    sx = sx.."气血 +"..气血.." "
                end
                if 魔法 ~= 0 and 魔法 ~= nil  then
                    sx = sx.."魔法 +"..魔法.." "
                end
                if 命中 ~= 0  and 命中 ~= nil then
                    sx = sx.."命中 +"..命中.." "
                end
                if 伤害 ~= 0 and 伤害 ~= nil  then
                    sx = sx.."伤害 +"..伤害.." "
                end
                if 防御 ~= 0 and 防御 ~= nil  then
                    sx = sx.."防御 +"..防御.." "
                end
                if 速度 ~= 0 and 速度 ~= nil  then
                    sx = sx.."速度 +"..速度.." "
                end
                if 躲避 ~= 0 and 躲避 ~= nil  then
                    sx = sx.."躲避 +"..躲避.." "
                end
                if 灵力 ~= 0 and 灵力 ~= nil  then
                    sx = sx.."灵力 +"..灵力.." "
                end
                if 体质 ~= 0 and 体质 ~= nil  then
                    sx = sx.."体质 +"..体质.." "
                end
                if 魔力 ~= 0 and 魔力 ~= nil  then
                    sx = sx.."魔力 +"..魔力.." "
                end
                if 力量 ~= 0 and 力量 ~= nil  then
                    sx = sx.."力量 +"..力量.." "
                end
                if 耐力 ~= 0 and 耐力 ~= nil  then
                    sx = sx.."耐力 +"..耐力.." "
                end
                if 敏捷 ~= 0 and 敏捷 ~= nil  then
                    sx = sx.."敏捷 +"..敏捷.." "
                end
                if 法术伤害 ~= 0 and 法术伤害 ~= nil  then
                    sx = sx.."法术伤害 +"..法术伤害.." "
                end
                if 法术防御 ~= 0 and 法术防御 ~= nil  then
                    sx = sx.."法术防御 +"..法术防御.." "
                end
                if 固定伤害 ~= 0 and 固定伤害 ~= nil  then
                    sx = sx.."固定伤害 +"..固定伤害.." "
                end
                if sx ~= "" then
                    self.介绍文本:添加文本("#G/符石："..sx)
                end
            end
        end
        if self.道具.符石组合~=nil and self.道具.符石组合.符石组合~=nil and #self.道具.符石组合.符石组合~=0 and self.道具.开运孔数.当前 == self.道具.开运孔数.上限 then
            self.符石组合信息 = self:取符石组合介绍(self.道具.符石组合)
            self.介绍文本:添加文本("#f/符石组合："..self.道具.符石组合.符石组合)
            self.介绍文本:添加文本("#f/门派条件："..self.符石组合信息.门派)
            self.介绍文本:添加文本("#f/部位条件："..self.符石组合信息.部位)
            self.介绍文本:添加文本("#f/"..self.符石组合信息.介绍)
        end
        tp.运行时间 = tp.运行时间 + 1
        self.窗口时间 = tp.运行时间
        self.可视 = true
    end
end

function 场景类_符石镶嵌:刷新()
    for i=1,5 do
        self.物品[i]:置物品(nil)
        if tp.队伍[1].符石[i] ~= nil and  tp.队伍[1].符石[i].名称 ~= nil then
            self.物品[i]:置物品(self.道具.符石组合[i])
        end
    end
end


function 场景类_符石镶嵌:显示(dt,x,y)
    self.焦点 = false
    self.资源组[1]:更新(x,y)
    self.资源组[2]:更新(x,y)
    self.资源组[9]:更新(x,y,self.符石数量 ~= 0)
    self.资源组[10]:更新(x,y,self.符石数量 ~= 0)
    self.资源组[11]:更新(dt)
    if self.资源组[2]:事件判断() then
        self:打开()
        return false
    elseif self.资源组[9]:事件判断() then
        self.发送信息 = {}
        self.发送信息.道具id = self.选中符石[1]..","..self.选中符石[2]..","..self.选中符石[3]..","..self.选中符石[4]..","..self.选中符石[5]
        self.发送信息.装备id = self.格子
        发送数据(4511,self.发送信息,1)
        self:打开()
        return false
    elseif self.资源组[10]:事件判断() then
        self:打开()
        return false
    end
    self.资源组[1]:显示(self.x,self.y)
    self.资源组[2]:显示(self.x+340,self.y+12)
    self.资源组[9]:显示(self.x+130,self.y+444)
    self.资源组[10]:显示(self.x+190,self.y+444)
    tp.窗口标题背景_:置区域(0,0,95,16)
    tp.窗口标题背景_:显示(self.x+131,self.y+9)
    zts1:置字间距(3)
    zts1:显示(self.x+141,self.y+9,"符石镶嵌")
    zts1:置字间距(0)
    self.大模型:显示(self.x+30,self.y+77)
    zts2:置字间距(3)
    zts2:置颜色(0xFFFFFF00)
    zts2:显示(self.x+140,self.y+55,self.道具.名称)
    self.介绍文本:显示(self.x+140,self.y+86)
    self.介绍文本2:显示(self.x+140,self.y+220)
    local xx = 0
    local yy = 1
    local xs = 0
    for i=1,5 do
        xx = xx + 1
        self.资源组[3+i]:显示(self.x+(60*i)-24,self.y+383)
        self.物品[i]:置坐标(self.x+(60*i)-17,self.y+386)
        self.物品[i]:显示(dt,x,y,self.鼠标,nil)

        if self.物品[i].物品 ~= nil  then
            if self.物品[i].焦点 then
                tp.提示:道具行囊(x,y,self.物品[i].物品,true)
            end
            self.资源组[11]:显示(self.x+(60*i)+4,self.y+413)
        end
        if xx >= 2 then
            xx = 0
            yy = yy + 1
        end
        if self.物品[i].事件 then
            if tp.场景.抓取物品 ~= nil and self.物品[i].物品 == nil and self.物品[i].焦点 then
                if self.道具.开运孔数.当前 < i then
                    tp.提示:写入("#Y/该位置还未开孔")
                    return
                else
                    self.选中符石[i] = tp.场景.抓取物品ID
                    self.符石数量 =self.符石数量+1
                    if self:可装备(tp.场景.抓取物品,i) then
                        self.物品[i]:置物品(tp.场景.抓取物品)
                        self.物品[i].确定 = false
                        tp.窗口.道具行囊.物品[tp.场景.抓取物品ID].确定 = false
                        tp.场景.抓取物品 = nil
                        tp.场景.抓取物品ID = nil
                        tp.场景.抓取物品注释 = nil
                    end
                end
            elseif tp.场景.抓取物品 ~= nil and self.物品[i].物品 ~= nil and self.物品[i].焦点 then
                if self.道具.开运孔数.当前 < i then
                    tp.提示:写入("#Y/该位置还未开孔")
                    return
                else
                    self.选中符石[i] = tp.场景.抓取物品ID
                    self.符石数量 =self.符石数量+1
                    if self:可装备(tp.场景.抓取物品,i) then
                        local jy = self.物品[i].物品
                        local jy1 = tp.场景.抓取物品
                        local jy2 = tp.场景.抓取物品ID
                        tp.窗口.道具行囊.物品[tp.场景.抓取物品ID].确定 = false
                        tp.场景.抓取物品 = nil
                        tp.场景.抓取物品ID = nil
                        tp.场景.抓取物品注释 = nil
                        self.物品[i]:置物品(jy1)
                        --tp.窗口.道具行囊.物品[jy2]:置物品(jy)
                    end
                end
            elseif tp.场景.抓取物品 == nil and self.物品[i].物品 ~= nil and self.物品[i].焦点 then
                if self.道具.开运孔数.当前 < i then
                    tp.提示:写入("#Y/该位置还未开孔")
                    return
                else
                    tp.场景.抓取物品 = self.物品[i].物品
                    tp.场景.抓取物品ID = i
                    tp.场景.抓取物品注释 = self.物品[i].注释
                    self.选中符石[i] = tp.场景.抓取物品ID
                    self.符石数量 =self.符石数量+1
                    self.物品[i].确定 = true
                    self.物品[i]:置物品(nil)
                end
            end
        elseif self.物品[i].右键 then
        end
    end

end

function 场景类_符石镶嵌:取符石组合介绍(数据)
  local jies = {}
    if 数据.符石组合=="无心插柳" then
        if 数据.等级 == 1 then
            jies.介绍="每回合第1下物理攻击怪物目标时溅射其他目标并造成当前伤害的15%伤害。"
        elseif 数据.等级 == 2 then
            jies.介绍="每回合第1下物理攻击怪物目标时溅射其他目标并造成当前伤害的20%伤害。"
        elseif 数据.等级 == 3 then
            jies.介绍="每回合第1下物理攻击怪物目标时溅射其他目标并造成当前伤害的25%伤害。"
        elseif 数据.等级 == 4 then
            jies.介绍="每回合第1下物理攻击怪物目标时溅射其他目标并造成当前伤害的30%伤害。"
        end
        jies.门派 = "无"
        jies.部位 = "所有"
    elseif 数据.符石组合=="万丈霞光" then
        if 数据.等级 == 1 then
            jies.介绍="增加50点治疗能力，包括师门技能和特技"
        elseif 数据.等级 == 2 then
            jies.介绍="增加80点治疗能力，包括师门技能和特技"
        elseif 数据.等级 == 3 then
          jies.介绍="增加120点治疗能力，包括师门技能和特技"
        elseif 数据.等级 == 4 then
          jies.介绍="增加200点治疗能力，包括师门技能和特技"
        end
        jies.门派 = "无"
        jies.部位 = "所有"
    elseif 数据.符石组合=="飞檐走壁" then
        if 数据.等级 == 1 then
            jies.介绍="释放法术时降低8%的MP消耗"
        elseif 数据.等级 == 2 then
            jies.介绍="释放法术时降低12%的MP消耗"
        elseif 数据.等级 == 3 then
          jies.介绍="释放法术时降低16%的MP消耗"
        end
        jies.门派 = "无"
        jies.部位 = "所有"
    elseif 数据.符石组合=="百步穿杨" then
        if 数据.等级 == 1 then
            jies.介绍="物理类攻击时有20%的几率给目标额外造成200点伤害"
        elseif 数据.等级 == 2 then
            jies.介绍="物理类攻击时有20%的几率给目标额外造成450点伤害"
        elseif 数据.等级 == 3 then
          jies.介绍="物理类攻击时有20%的几率给目标额外造成600点伤害"
        elseif 数据.等级 == 4 then
          jies.介绍="物理类攻击时有20%的几率给目标额外造成800点伤害"
        end
        jies.门派 = "无"
        jies.部位 = "所有"
    elseif 数据.符石组合=="隔山打牛" then
        if 数据.等级 == 1 then
            jies.介绍="法术攻击时有20%的几率临时提升自身80点灵力"
        elseif 数据.等级 == 2 then
            jies.介绍="法术攻击时有20%的几率临时提升自身120点灵力"
        elseif 数据.等级 == 3 then
          jies.介绍="法术攻击时有25%的几率临时提升自身170点灵力"
        elseif 数据.等级 == 4 then
          jies.介绍="法术攻击时有25%的几率临时提升自身200点灵力"
        end
        jies.门派 = "无"
        jies.部位 = "所有"
    elseif 数据.符石组合=="心随我动" then
        if 数据.等级 == 1 then
            jies.介绍="遭受物理类攻击时有25%几率抵挡250点伤害"
        elseif 数据.等级 == 2 then
            jies.介绍="遭受物理攻击时有25%几率抵挡400点伤害"
        elseif 数据.等级 == 3 then
          jies.介绍="遭受物理类攻击时有25%几率抵挡700点伤害"
        elseif 数据.等级 == 4 then
          jies.介绍="遭受物理类攻击时有25%几率抵挡900点伤害"
        end
        jies.门派 = "无"
        jies.部位 = "所有"
    elseif 数据.符石组合=="云随风舞" then
        if 数据.等级 == 1 then
            jies.介绍="遭受法术攻击时有20%几率抵挡200点伤害"
        elseif 数据.等级 == 2 then
            jies.介绍="遭受法术攻击时有20%几率抵挡400点伤害"
        elseif 数据.等级 == 3 then
          jies.介绍="遭受法术攻击时有20%几率抵挡700点伤害"
        elseif 数据.等级 == 4 then
          jies.介绍="遭受法术攻击时有20%几率抵挡800点伤害"
        end
        jies.门派 = "无"
        jies.部位 = "所有"
    elseif 数据.符石组合=="风卷残云" then
        if 数据.等级 == 1 then
          jies.介绍="击倒鬼魂目标时有5%几率将其打飞出场"
        elseif 数据.等级 == 2 then
          jies.介绍="击倒鬼魂目标时有10%几率将其打飞出场"
        elseif 数据.等级 == 3 then
          jies.介绍="击倒鬼魂目标时有15%几率将其打飞出场"
        elseif 数据.等级 == 4 then
          jies.介绍="击倒鬼魂目标时有20%几率将其打飞出场"
        end
        jies.门派 = "无"
        jies.部位 = "所有"
    elseif 数据.符石组合=="天降大任" then
        if 数据.等级 == 1 then
          jies.介绍="无视召唤兽5%的物理防御进行攻击。(该组合全身只有一件装备起效)"
        elseif 数据.等级 == 2 then
          jies.介绍="无视召唤兽10%的物理防御进行攻击。(该组合全身只有一件装备起效)"
        elseif 数据.等级 == 3 then
          jies.介绍="无视召唤兽15%的物理防御进行攻击。(该组合全身只有一件装备起效)"
        end
        jies.门派 = "无"
        jies.部位 = "所有"
    elseif 数据.符石组合=="无懈可击" then
        jies.介绍="提升自身30点防御力"
        jies.门派 = "无"
        jies.部位 = "所有"
    elseif 数据.符石组合=="望穿秋水" then
        jies.介绍="提升自身30点灵力"
        jies.门派 = "无"
        jies.部位 = "所有"

    elseif 数据.符石组合=="凤舞九天" then
        jies.介绍="提升自身30点灵力"
        jies.门派 = "无"
        jies.部位 = "所有"
    elseif 数据.符石组合=="君临天下" then
        jies.介绍="提升自身40点伤害"
        jies.门派 = "无"
        jies.部位 = "所有"
    elseif 数据.符石组合=="势如破竹" then
        jies.介绍="提升自身40点速度"
        jies.门派 = "无"
        jies.部位 = "所有"
    elseif 数据.符石组合=="不动明王" then
        jies.介绍="提升自身60点防御"
        jies.门派 = "无"
        jies.部位 = "所有"
    elseif 数据.符石组合=="万里横行" then
        jies.介绍="提升自身40点伤害"
        jies.门派 = "无"
        jies.部位 = "所有"
    elseif 数据.符石组合=="日落西山" then
        jies.介绍="提升自身40点速度"
        jies.门派 = "无"
        jies.部位 = "所有"
    elseif 数据.符石组合=="网罗乾坤" then
        if 数据.等级 == 1 then
        jies.介绍="使用天罗地网时，增加人物等级/2的伤害"
        elseif 数据.等级 == 2 then
        jies.介绍="使用天罗地网时，增加人物等级/1.5的伤害"
        elseif 数据.等级 == 3 then
        jies.介绍="使用天罗地网时，增加人物等级的伤害"
        end
        jies.门派 = "盘丝洞"
        jies.部位 = "所有"
    elseif 数据.符石组合=="石破天惊" then
        if 数据.等级 == 1 then
            jies.介绍="使用落雷符时增加人物等级/2的伤害，装备该组合时降低5%的防御"
        elseif 数据.等级 == 2 then
            jies.介绍="使用落雷符时增加人物等级/1.5的伤害，装备该组合时降低5%的防御"
        elseif 数据.等级 == 3 then
          jies.介绍="使用落雷符时增加人物等级的伤害，装备该组合时降低5%的防御"
        end
        jies.门派 = "方寸山"
        jies.部位 = "所有"
    elseif 数据.符石组合=="天雷地火" then
        if 数据.等级 == 1 then
            jies.介绍="使用天雷斩、雷霆万钧时增加人物等级/2的伤害，装备该组合时降低5%的防御"
        elseif 数据.等级 == 2 then
            jies.介绍="使用天雷斩、雷霆万钧时增加人物等级/1.5的伤害，装备该组合时降低5%的防御"
        elseif 数据.等级 == 3 then
          jies.介绍="使用天雷斩、雷霆万钧时增加人物等级的伤害，装备该组合时降低5%的防御"
        end
        jies.门派 = "天宫"
        jies.部位 = "所有"
    elseif 数据.符石组合=="烟雨飘摇" then
        if 数据.等级 == 1 then
            jies.介绍="使用烟雨剑法、飘渺式时增加人物等级/2的伤害，装备该组合时降低5%的防御"
        elseif 数据.等级 == 2 then
            jies.介绍="使用烟雨剑法、飘渺式时增加人物等级/1.5的伤害，装备该组合时降低5%的防御"
        elseif 数据.等级 == 3 then
          jies.介绍="使用烟雨剑法、飘渺式时增加人物等级的伤害，装备该组合时降低5%的防御"
        end
        jies.门派 = "五庄观"
        jies.部位 = "所有"
    elseif 数据.符石组合=="索命无常" then
        if 数据.等级 == 1 then
            jies.介绍="使用阎罗令时，增加人物等级/2的伤害，装备该组合时降低5%的防御"
        elseif 数据.等级 == 2 then
            jies.介绍="使用阎罗令时，增加人物等级/1.5的伤害，装备该组合时降低5%的防御"
        elseif 数据.等级 == 3 then
          jies.介绍="使用阎罗令时，增加人物等级的伤害，装备该组合时降低5%的防御"
        end
        jies.门派 = "阴曹地府"
        jies.部位 = "所有"
    elseif 数据.符石组合=="行云流水" then
        if 数据.等级 == 1 then
            jies.介绍="使用五行法术时，增加人物等级/2的伤害，装备该组合时降低5%的防御"
        elseif 数据.等级 == 2 then
            jies.介绍="使用五行法术时，增加人物等级/1.5的伤害，装备该组合时降低5%的防御"
        elseif 数据.等级 == 3 then
          jies.介绍="使用五行法术时，增加人物等级的伤害，装备该组合时降低5%的防御"
        end
        jies.门派 = "普陀山"
        jies.部位 = "所有"
    elseif 数据.符石组合=="福泽天下" then
        if 数据.等级 == 1 then
            jies.介绍="使用唧唧歪歪时，增加人物等级/2的伤害，装备该组合时降低5%的防御"
        elseif 数据.等级 == 2 then
            jies.介绍="使用唧唧歪歪时，增加人物等级/2的伤害，装备该组合时降低5%的防御"
        elseif 数据.等级 == 3 then
          jies.介绍="使用唧唧歪歪时，增加人物等级/2的伤害，装备该组合时降低5%的防御"
        end
        jies.门派 = "化生寺"
        jies.部位 = "所有"
    elseif 数据.符石组合=="暗度陈仓" then
        jies.介绍="受到物理攻击时，降低3%的所受伤害。"
        jies.门派 = "无"
        jies.部位 = "所有"
    elseif 数据.符石组合=="点石成金" then
        jies.介绍="防御时，遭受物理攻击所受到的伤害降低20%"
        jies.门派 = "无"
        jies.部位 = "所有"
    elseif 数据.符石组合=="化敌为友" then
        jies.介绍="受到法术攻击时，降低3%的所受伤害。"
        jies.门派 = "无"
        jies.部位 = "所有"
    elseif 数据.符石组合=="凤舞九天" then
        jies.介绍="使用暗器时增加人物等级×1的伤害"
        jies.门派 = "女儿村"
        jies.部位 = "所有"
    elseif 数据.符石组合=="高山流水" then
        if 数据.等级 == 1 then
            jies.介绍="增加人物等级/3+30的法术伤害。(该组合全身只有一件装备起效)"
        elseif 数据.等级 == 2 then
            jies.介绍="增加人物等级/2+30的法术伤害。(该组合全身只有一件装备起效)"
        elseif 数据.等级 == 3 then
          jies.介绍="增加人物等级+30的法术伤害。(该组合全身只有一件装备起效)"
        end
        jies.门派 = "无"
        jies.部位 = "所有"
    elseif 数据.符石组合=="化神以灵符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能化神以灵等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能化神以灵等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能化神以灵等级6级"
        end
        jies.门派 = "女魃墓"
        jies.部位 = "武器"
    elseif 数据.符石组合=="百无禁忌" then
        if 数据.等级 == 1 then
            jies.介绍="提高自身4%对抗封印类技能的能力"
        elseif 数据.等级 == 2 then
            jies.介绍="提高自身8%对抗封印类技能的能力"
        elseif 数据.等级 == 3 then
          jies.介绍="提高自身12%对抗封印类技能的能力"
        end
        jies.门派 = "无"
        jies.部位 = "靴"
    elseif 数据.符石组合=="为官之道符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能为官之道等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能为官之道等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能为官之道等级6级"
        end
        jies.门派 = "大唐官府"
        jies.部位 = "头盔/发钗"
    elseif 数据.符石组合=="黄庭经符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能黄庭经等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能黄庭经等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能黄庭经等级6级"
        end
        jies.门派 = "方寸山"
        jies.部位 = "头盔/发钗"
    elseif 数据.符石组合=="小乘佛法符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能小乘佛法等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能小乘佛法等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能小乘佛法等级6级"
        end
        jies.门派 = "化生寺"
        jies.部位 = "头盔/发钗"
    elseif 数据.符石组合=="毒经符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能毒经等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能毒经等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能毒经等级6级"
        end
        jies.门派 = "女儿村"
        jies.部位 = "头盔/发钗"
    elseif 数据.符石组合=="天罡气符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能天罡气等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能天罡气等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能天罡气等级6级"
        end
        jies.门派 = "天宫"
        jies.部位 = "头盔/发钗"
    elseif 数据.符石组合=="九龙诀符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能九龙诀等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能九龙诀等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能九龙诀等级6级"
        end
        jies.门派 = "龙宫"
        jies.部位 = "头盔/发钗"
    elseif 数据.符石组合=="周易学符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能周易学等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能周易学等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能周易学等级6级"
        end
        jies.门派 = "五庄观"
        jies.部位 = "头盔/发钗"
    elseif 数据.符石组合=="灵性符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能灵性等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能灵性等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能灵性等级6级"
        end
        jies.门派 = "普陀山"
        jies.部位 = "头盔/发钗"
    elseif 数据.符石组合=="灵通术符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能灵通术等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能灵通术等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能灵通术等级6级"
        end
        jies.门派 = "阴曹地府"
        jies.部位 = "头盔/发钗"
    elseif 数据.符石组合=="牛逼神功符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能牛逼神功等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能牛逼神功等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能牛逼神功等级6级"
        end
        jies.门派 = "魔王寨"
        jies.部位 = "头盔/发钗"
    elseif 数据.符石组合=="魔兽神功符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能魔兽神功等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能魔兽神功等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能魔兽神功等级6级"
        end
        jies.门派 = "狮驼岭"
        jies.部位 = "头盔/发钗"
    elseif 数据.符石组合=="蛛丝阵法符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能蛛丝阵法等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能蛛丝阵法等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能蛛丝阵法等级6级"
        end
        jies.门派 = "盘丝洞"
        jies.部位 = "头盔/发钗"
    elseif 数据.符石组合=="文韬武略符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能文韬武略等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能文韬武略等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能文韬武略等级6级"
        end
        jies.门派 = "盘丝洞"
        jies.部位 = "腰带"
    elseif 数据.符石组合=="归元心法符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能归元心法等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能归元心法等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能归元心法等级6级"
        end
        jies.门派 = "方寸山"
        jies.部位 = "腰带"
    elseif 数据.符石组合=="佛光普照符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能佛光普照等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能佛光普照等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能佛光普照等级6级"
        end
        jies.门派 = "化生寺"
        jies.部位 = "腰带"
    elseif 数据.符石组合=="倾国倾城符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能倾国倾城等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能倾国倾城等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能倾国倾城等级6级"
        end
        jies.门派 = "女儿村"
        jies.部位 = "腰带"
    elseif 数据.符石组合=="傲世诀符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能傲世诀等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能傲世诀等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能傲世诀等级6级"
        end
        jies.门派 = "天宫"
        jies.部位 = "腰带"
    elseif 数据.符石组合=="逆鳞符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能逆鳞等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能逆鳞等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能逆鳞等级6级"
        end
        jies.门派 = "龙宫"
        jies.部位 = "腰带"
    elseif 数据.符石组合=="明性修身符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能明性修身等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能明性修身等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能明性修身等级6级"
        end
        jies.门派 = "五庄观"
        jies.部位 = "腰带"
    elseif 数据.符石组合=="五行扭转符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能五行扭转等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能五行扭转等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能五行扭转等级6级"
        end
        jies.门派 = "普陀山"
        jies.部位 = "腰带"
    elseif 数据.符石组合=="拘魂诀符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能拘魂诀等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能拘魂诀等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能拘魂诀等级6级"
        end
        jies.门派 = "阴曹地府"
        jies.部位 = "腰带"
    elseif 数据.符石组合=="回身击符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能回身击等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能回身击等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能回身击等级6级"
        end
        jies.门派 = "魔王寨"
        jies.部位 = "腰带"
    elseif 数据.符石组合=="魔兽反嗜符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能魔兽反噬等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能魔兽反噬等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能魔兽反噬等级6级"
        end
        jies.门派 = "狮驼岭"
        jies.部位 = "腰带"
    elseif 数据.符石组合=="盘丝大法符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能盘丝大法等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能盘丝大法等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能盘丝大法等级6级"
        end
        jies.门派 = "盘丝洞"
        jies.部位 = "腰带"
    elseif 数据.符石组合=="十方无敌符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能十方无敌等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能十方无敌等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能十方无敌等级6级"
        end
        jies.门派 = "大唐官府"
        jies.部位 = "铠甲/女衣"
    elseif 数据.符石组合=="符之术符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能符之术等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能符之术等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能符之术等级6级"
        end
        jies.门派 = "方寸山"
        jies.部位 = "铠甲/女衣"
    elseif 数据.符石组合=="歧黄之术符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能歧黄之术等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能歧黄之术等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能歧黄之术等级6级"
        end
        jies.门派 = "化生寺"
        jies.部位 = "铠甲/女衣"
    elseif 数据.符石组合=="闭月羞花符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能闭月羞花等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能闭月羞花等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能闭月羞花等级6级"
        end
        jies.门派 = "女儿村"
        jies.部位 = "铠甲/女衣"
    elseif 数据.符石组合=="乾坤塔符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能乾坤塔等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能乾坤塔等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能乾坤塔等级6级"
        end
        jies.门派 = "天宫"
        jies.部位 = "铠甲/女衣"
    elseif 数据.符石组合=="呼风唤雨符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能呼风唤雨等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能呼风唤雨等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能呼风唤雨等级6级"
        end
        jies.门派 = "龙宫"
        jies.部位 = "铠甲/女衣"
    elseif 数据.符石组合=="乾坤袖符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能乾坤袖等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能乾坤袖等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能乾坤袖等级6级"
        end
        jies.门派 = "五庄观"
        jies.部位 = "铠甲/女衣"
    elseif 数据.符石组合=="金刚经符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能金刚经等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能金刚经等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能金刚经等级6级"
        end
        jies.门派 = "普陀山"
        jies.部位 = "铠甲/女衣"
    elseif 数据.符石组合=="幽冥术符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能幽冥术等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能幽冥术等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能幽冥术等级6级"
        end
        jies.门派 = "阴曹地府"
        jies.部位 = "铠甲/女衣"
    elseif 数据.符石组合=="火牛阵符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能火牛阵等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能火牛阵等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能火牛阵等级6级"
        end
        jies.门派 = "魔王寨"
        jies.部位 = "铠甲/女衣"
    elseif 数据.符石组合=="生死搏符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能生死搏等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能生死搏等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能生死搏等级6级"
        end
        jies.门派 = "狮驼岭"
        jies.部位 = "铠甲/女衣"
    elseif 数据.符石组合=="催情大法符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能催情大法等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能催情大法等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能催情大法等级6级"
        end
        jies.门派 = "盘丝洞"
        jies.部位 = "铠甲/女衣"
    elseif 数据.符石组合=="神兵鉴赏符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能神兵鉴赏等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能神兵鉴赏等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能神兵鉴赏等级6级"
        end
        jies.门派 = "大唐官府"
        jies.部位 = "武器"
    elseif 数据.符石组合=="霹雳咒符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能霹雳咒等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能霹雳咒等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能霹雳咒等级6级"
        end
        jies.门派 = "方寸山"
        jies.部位 = "武器"
    elseif 数据.符石组合=="诵经符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能诵经等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能诵经等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能诵经等级6级"
        end
        jies.门派 = "化生寺"
        jies.部位 = "武器"
    elseif 数据.符石组合=="沉鱼落雁符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能沉鱼落雁等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能沉鱼落雁等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能沉鱼落雁等级6级"
        end
        jies.门派 = "女儿村"
        jies.部位 = "武器"
    elseif 数据.符石组合=="宁气诀符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能宁气诀等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能宁气诀等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能宁气诀等级6级"
        end
        jies.门派 = "天宫"
        jies.部位 = "武器"
    elseif 数据.符石组合=="破浪诀符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能破浪诀等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能破浪诀等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能破浪诀等级6级"
        end
        jies.门派 = "龙宫"
        jies.部位 = "武器"
    elseif 数据.符石组合=="潇湘仙雨符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能潇湘仙雨等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能潇湘仙雨等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能潇湘仙雨等级6级"
        end
        jies.门派 = "五庄观"
        jies.部位 = "武器"
    elseif 数据.符石组合=="五行学说符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能五行学说等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能五行学说等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能五行学说等级6级"
        end
        jies.门派 = "普陀山"
        jies.部位 = "武器"
    elseif 数据.符石组合=="尸腐恶符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能尸腐恶等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能尸腐恶等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能尸腐恶等级6级"
        end
        jies.门派 = "阴曹地府"
        jies.部位 = "武器"
    elseif 数据.符石组合=="牛虱阵符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能牛虱阵等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能牛虱阵等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能牛虱阵等级6级"
        end
        jies.门派 = "魔王寨"
        jies.部位 = "武器"
    elseif 数据.符石组合=="阴阳二气诀符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能阴阳二气诀等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能阴阳二气诀等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能阴阳二气诀等级6级"
        end
        jies.门派 = "狮驼岭"
        jies.部位 = "武器"
    elseif 数据.符石组合=="姊妹相随符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能姊妹相随等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能姊妹相随等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能姊妹相随等级6级"
        end
        jies.门派 = "盘丝洞"
        jies.部位 = "武器"
    elseif 数据.符石组合=="无双一击符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能无双一击等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能无双一击等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能无双一击等级6级"
        end
        jies.门派 = "大唐官府"
        jies.部位 = "武器"
    elseif 数据.符石组合=="磬龙灭法符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能磬龙灭法等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能磬龙灭法等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能磬龙灭法等级6级"
        end
        jies.门派 = "方寸山"
        jies.部位 = "武器"
    elseif 数据.符石组合=="金刚伏魔符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能金刚伏魔等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能金刚伏魔等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能金刚伏魔等级6级"
        end
        jies.门派 = "化生寺"
        jies.部位 = "武器"
    elseif 数据.符石组合=="玉质冰肌符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能玉质冰肌等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能玉质冰肌等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能玉质冰肌等级6级"
        end
        jies.门派 = "女儿村"
        jies.部位 = "武器"
    elseif 数据.符石组合=="混天术符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能混天术等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能混天术等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能混天术等级6级"
        end
        jies.门派 = "天宫"
        jies.部位 = "武器"
    elseif 数据.符石组合=="龙附符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能龙附等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能龙附等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能龙附等级6级"
        end
        jies.门派 = "龙宫"
        jies.部位 = "武器"
    elseif 数据.符石组合=="修仙术符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能修仙术等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能修仙术等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能修仙术等级6级"
        end
        jies.门派 = "五庄观"
        jies.部位 = "武器"
    elseif 数据.符石组合=="护法金刚符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能护法金刚等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能护法金刚等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能护法金刚等级6级"
        end
        jies.门派 = "普陀山"
        jies.部位 = "武器"
    elseif 数据.符石组合=="六道轮回符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能六道轮回等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能六道轮回等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能六道轮回等级6级"
        end
        jies.门派 = "阴曹地府"
        jies.部位 = "武器"
    elseif 数据.符石组合=="震天诀符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能震天诀等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能震天诀等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能震天诀等级6级"
        end
        jies.门派 = "魔王寨"
        jies.部位 = "武器"
    elseif 数据.符石组合=="狂兽诀符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能狂兽诀等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能狂兽诀等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能狂兽诀等级6级"
        end
        jies.门派 = "狮驼岭"
        jies.部位 = "武器"
    elseif 数据.符石组合=="秋波暗送符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能秋波暗送等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能秋波暗送等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能秋波暗送等级6级"
        end
        jies.门派 = "盘丝洞"
        jies.部位 = "武器"
    elseif 数据.符石组合=="紫薇之术符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能紫薇之术等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能紫薇之术等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能紫薇之术等级6级"
        end
        jies.门派 = "大唐官府"
        jies.部位 = "项链"
    elseif 数据.符石组合=="神道无念符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能神道无念等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能神道无念等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能神道无念等级6级"
        end
        jies.门派 = "方寸山"
        jies.部位 = "项链"
    elseif 数据.符石组合=="大慈大悲符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能大慈大悲等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能大慈大悲等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能大慈大悲等级6级"
        end
        jies.门派 = "化生寺"
        jies.部位 = "项链"
    elseif 数据.符石组合=="香飘兰麝符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能香飘兰麝等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能香飘兰麝等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能香飘兰麝等级6级"
        end
        jies.门派 = "女儿村"
        jies.部位 = "项链"
    elseif 数据.符石组合=="清明自在符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能清明自在等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能清明自在等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能清明自在等级6级"
        end
        jies.门派 = "天宫"
        jies.部位 = "项链"
    elseif 数据.符石组合=="龙腾符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能龙腾等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能龙腾等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能龙腾等级6级"
        end
        jies.门派 = "龙宫"
        jies.部位 = "项链"
    elseif 数据.符石组合=="混元道果符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能混元道果等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能混元道果等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能混元道果等级6级"
        end
        jies.门派 = "五庄观"
        jies.部位 = "项链"
    elseif 数据.符石组合=="观音咒符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能观音咒等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能观音咒等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能观音咒等级6级"
        end
        jies.门派 = "普陀山"
        jies.部位 = "项链"
    elseif 数据.符石组合=="九幽阴魂符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能九幽阴魂等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能九幽阴魂等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能九幽阴魂等级6级"
        end
        jies.门派 = "阴曹地府"
        jies.部位 = "项链"
    elseif 数据.符石组合=="火云术符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能火云术等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能火云术等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能火云术等级6级"
        end
        jies.门派 = "魔王寨"
        jies.部位 = "项链"
    elseif 数据.符石组合=="训兽诀符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能训兽诀等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能训兽诀等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能训兽诀等级6级"
        end
        jies.门派 = "狮驼岭"
        jies.部位 = "项链"
    elseif 数据.符石组合=="天外魔音符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能天外魔音等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能天外魔音等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能天外魔音等级6级"
        end
        jies.门派 = "盘丝洞"
        jies.部位 = "项链"
    elseif 数据.符石组合=="疾风步符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能疾风步等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能疾风步等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能疾风步等级6级"
        end
        jies.门派 = "大唐官府"
        jies.部位 = "靴"
    elseif 数据.符石组合=="斜月步符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能斜月步等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能斜月步等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能斜月步等级6级"
        end
        jies.门派 = "方寸山"
        jies.部位 = "靴"
    elseif 数据.符石组合=="渡世步符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能渡世步等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能渡世步等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能渡世步等级6级"
        end
        jies.门派 = "化生寺"
        jies.部位 = "靴"
    elseif 数据.符石组合=="清歌妙舞符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能清歌妙舞等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能清歌妙舞等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能清歌妙舞等级6级"
        end
        jies.门派 = "女儿村"
        jies.部位 = "靴"
    elseif 数据.符石组合=="云霄步符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能云霄步等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能云霄步等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能云霄步等级6级"
        end
        jies.门派 = "天宫"
        jies.部位 = "靴"
    elseif 数据.符石组合=="游龙术符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能游龙术等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能游龙术等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能游龙术等级6级"
        end
        jies.门派 = "龙宫"
        jies.部位 = "靴"
    elseif 数据.符石组合=="七星遁符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能七星遁等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能七星遁等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能七星遁等级6级"
        end
        jies.门派 = "五庄观"
        jies.部位 = "靴"
    elseif 数据.符石组合=="莲花宝座符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能莲花宝座等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能莲花宝座等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能莲花宝座等级6级"
        end
        jies.门派 = "普陀山"
        jies.部位 = "靴"
    elseif 数据.符石组合=="无常步符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能无常步等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能无常步等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能无常步等级6级"
        end
        jies.门派 = "阴曹地府"
        jies.部位 = "靴"
    elseif 数据.符石组合=="裂石步符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能裂石步等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能裂石步等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能裂石步等级6级"
        end
        jies.门派 = "魔王寨"
        jies.部位 = "靴"
    elseif 数据.符石组合=="大鹏展翅符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能大鹏展翅等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能大鹏展翅等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能大鹏展翅等级6级"
        end
        jies.门派 = "狮驼岭"
        jies.部位 = "靴"
    elseif 数据.符石组合=="移形换影符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能移形换影等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能移形换影等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能移形换影等级6级"
        end
        jies.门派 = "盘丝洞"
        jies.部位 = "靴"
    --凌波城
    elseif 数据.符石组合=="天地无极符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能天地无极等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能天地无极等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能天地无极等级6级"
        end
        jies.门派 = "凌波城"
        jies.部位 = "武器"
    elseif 数据.符石组合=="啸傲符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能啸傲等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能啸傲等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能啸傲等级6级"
        end
        jies.门派 = "凌波城"
        jies.部位 = "武器"
    elseif 数据.符石组合=="法天象地符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能法天象地等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能法天象地等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能法天象地等级6级"
        end
        jies.门派 = "凌波城"
        jies.部位 = "靴"
    elseif 数据.符石组合=="气吞山河符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能气吞山河等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能气吞山河等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能气吞山河等级6级"
        end
        jies.门派 = "凌波城"
        jies.部位 = "铠甲/女衣"
    elseif 数据.符石组合=="武神显圣符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能武神显圣等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能武神显圣等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能武神显圣等级6级"
        end
        jies.门派 = "凌波城"
        jies.部位 = "腰带"
    elseif 数据.符石组合=="诛魔符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能诛魔等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能诛魔等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能诛魔等级6级"
        end
        jies.门派 = "凌波城"
        jies.部位 = "头盔/发钗"
    elseif 数据.符石组合=="九转玄功符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能九转玄功等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能九转玄功等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能九转玄功等级6级"
        end
        jies.门派 = "凌波城"
        jies.部位 = "项链"
    --神木林
    elseif 数据.符石组合=="天人庇护符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能天人庇护等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能天人庇护等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能天人庇护等级6级"
        end
        jies.门派 = "神木林"
        jies.部位 = "武器"
    elseif 数据.符石组合=="神木恩泽符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能神木恩泽等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能神木恩泽等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能神木恩泽等级6级"
        end
        jies.门派 = "神木林"
        jies.部位 = "武器"
    elseif 数据.符石组合=="驭灵咒符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能驭灵咒等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能驭灵咒等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能驭灵咒等级6级"
        end
        jies.门派 = "神木林"
        jies.部位 = "靴"
    elseif 数据.符石组合=="瞬息万变符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能瞬息万变等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能瞬息万变等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能瞬息万变等级6级"
        end
        jies.门派 = "神木林"
        jies.部位 = "铠甲/女衣"
    elseif 数据.符石组合=="万物轮转符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能万物轮转等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能万物轮转等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能万物轮转等级6级"
        end
        jies.门派 = "神木林"
        jies.部位 = "腰带"
    elseif 数据.符石组合=="巫咒符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能巫咒等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能巫咒等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能巫咒等级6级"
        end
        jies.门派 = "神木林"
        jies.部位 = "头盔/发钗"
    elseif 数据.符石组合=="万灵诸念符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能万灵诸念等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能万灵诸念等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能万灵诸念等级6级"
        end
        jies.门派 = "神木林"
        jies.部位 = "项链"
    --无底洞
    elseif 数据.符石组合=="秘影迷踪符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能秘影迷踪等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能秘影迷踪等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能秘影迷踪等级6级"
        end
        jies.门派 = "无底洞"
        jies.部位 = "武器"
    elseif 数据.符石组合=="混元神功符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能混元神功等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能混元神功等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能混元神功等级6级"
        end
        jies.门派 = "无底洞"
        jies.部位 = "武器"
    elseif 数据.符石组合=="鬼蛊灵蕴符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能鬼蛊灵蕴等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能鬼蛊灵蕴等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能鬼蛊灵蕴等级6级"
        end
        jies.门派 = "无底洞"
        jies.部位 = "靴"
    elseif 数据.符石组合=="阴风绝章符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能阴风绝章等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能阴风绝章等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能阴风绝章等级6级"
        end
        jies.门派 = "无底洞"
        jies.部位 = "铠甲/女衣"
    elseif 数据.符石组合=="地冥妙法符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能地冥妙法等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能地冥妙法等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能地冥妙法等级6级"
        end
        jies.门派 = "无底洞"
        jies.部位 = "腰带"
    elseif 数据.符石组合=="燃灯灵宝符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能燃灯灵宝等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能燃灯灵宝等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能燃灯灵宝等级6级"
        end
        jies.门派 = "无底洞"
        jies.部位 = "头盔/发钗"
    elseif 数据.符石组合=="枯骨心法符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能枯骨心法等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能枯骨心法等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能枯骨心法等级6级"
        end
        jies.门派 = "无底洞"
        jies.部位 = "项链"
    end
  return jies
end

function 场景类_符石镶嵌:可装备(wp,i)
    return true
end

function 场景类_符石镶嵌:检查点(x,y)
    if self.资源组 ~= nil and self.资源组[1]:是否选中(x,y)  then
        return true
    end
end

function 场景类_符石镶嵌:初始移动(x,y)
    tp.运行时间 = tp.运行时间 + 1
    if not tp.消息栏焦点 then
        self.窗口时间 = tp.运行时间
    end
    if not self.焦点 then
        tp.移动窗口 = true
    end
    if self.鼠标 and  not self.焦点 then
        self.xx = x - self.x
        self.yy = y - self.y
    end
end

function 场景类_符石镶嵌:开始移动(x,y)
    if self.鼠标 then
        self.x = x - self.xx
        self.y = y - self.yy
    end
end

return 场景类_符石镶嵌