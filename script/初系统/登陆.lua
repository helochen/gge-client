--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2020-11-22 20:44:10
-- 梦幻西游游戏资源破解 baidwwy@vip.qq.com(313738139) 老毕   和 C++PrimerPlus 717535046 这俩位大神破解所以资源
--======================================================================--
local 登录类 = class()

local tp
local mouseb = 引擎.鼠标按下

function 登录类:初始化(根)
    local 资源 = 根.资源
    local 按钮 = 根._按钮
    local 自适应 = 根._自适应
    self.梦幻西游 = 资源:载入('pic/mhxy.png', '图片')
    self.登录框 = 资源:载入('自用', '网易WDF动画', 0x87E7A818)
    self.上一步1 = 按钮.创建(资源:载入('other.wdf', '网易WDF动画', 0x10009), 0, 0, 3, true, true)
    self.下一步1 = 按钮.创建(资源:载入('other.wdf', '网易WDF动画', 0x10003), 0, 0, 3, true, true)
    self.下拉 = 根._按钮(资源:载入('other.wdf', '网易WDF动画', 0x00010012), 0, 0, 3, true, true)
    self.账号选择 = 根._小型选项栏.创建(自适应.创建(6, 1, 170, 240, 3, 9), 'self.发送内容')

    tp = 根
    self.背景图片 = {}
    -- self.背景图片[1] = 资源:载入('wzife.wdf',"网易WDF动画",0xA2EC482E)
    self.背景图片[3] = 资源:载入('wzife.wd5', '网易WDF动画', 0x00010016)
    self.控件类 = require('ggeui/加载类')()
    local 总控件 = self.控件类:创建控件('创建控件')
    总控件:置可视(true, true)
    self.账号输入框 = 总控件:创建输入('账号输入', 249 + 20 + 50 + 15, 248, 240, 14, 根)
    self.账号输入框:置可视(false, false)
    self.账号输入框:置限制字数(12)
    self.账号输入框:置光标颜色(4294967295)
    self.账号输入框:置文字颜色(4294967295)
    self.密码输入框 = 总控件:创建输入('密码输入', 249 + 20 + 50 + 15, 295, 200, 14, 根)
    self.密码输入框:置可视(false, false)
    self.密码输入框:置限制字数(12)
    self.密码输入框:置光标颜色(4294967295)
    self.密码输入框:置文字颜色(4294967295)
    self.密码输入框:置密码模式()
    self.账号输入框:置文本(f函数.读配置(程序目录 .. '配置.ini', 'mhxy', '账号'))
    self.密码输入框:置文本(f函数.读配置(程序目录 .. '配置.ini', 'mhxy', '密码'))

    self.事件 = false
    self.焦点 = false
    self.开启 = false
    self.编号 = 编号
    self.双击 = nil
    self.时间 = 0
    self.账号输入焦点 = false
    self.密码输入焦点 = false
    self.置坐标 = false
end

function 登录类:更新(dt)
    if self.i ~= nil then
        self.i = self.i + 1.5
        if self.i > 100 then
            self.i = 1
        end
        渐进加载界面_进度条:置位置(self.i)
        if self.i == 91 then
            self.i = nil
            tp.进程 = 1
            渐进加载界面_进度条:置可视(false)
        end
    end
end

function 登录类:显示(dt, x, y)
    self.账号输入框:置可视(true, true)
    self.密码输入框:置可视(true, true)

    if 引擎.按键弹起(键盘符号.tab) then
        if self.账号输入焦点 then
            self.账号输入框:置焦点(false)
            self.密码输入框:置焦点(true)
            self.账号输入焦点 = false
            self.密码输入焦点 = true
        elseif self.密码输入焦点 then
            self.密码输入框:置焦点(false)
            self.账号输入框:置焦点(true)
            self.账号输入焦点 = true
            self.密码输入焦点 = false
        else
            self.账号输入框:置焦点(true)
            self.账号输入焦点 = true
        end
    end
    self.登录框:显示(230, 160)
    self.上一步1:更新(x, y)
    self.下一步1:更新(x, y)
    self.下一步1:显示(800 - 360, 600 - 195)
    self.上一步1:显示(800 - 530, 600 - 195)
    self.梦幻西游:显示(300 - 90, 0)
    self.控件类:更新(dt, x, y)
    self.控件类:显示(x, y)
    if 引擎.按键弹起(键盘符号.tab) then
    end
    if self.上一步1:事件判断() then
        tp.进程 = 8
    elseif self.下一步1:事件判断() then
        if self.账号输入框:取文本() == '' or self.密码输入框:取文本() == '' then
            tp.提示:写入('#Y/请先输入账号或密码')
            return 0
        elseif #self.账号输入框:取文本() < 6 or #self.密码输入框:取文本() < 6 then
            tp.提示:写入('#Y/账号或密码格式不正确')
            return 0
        else
            系统参数.账号 = self.账号输入框:取文本()
            系统参数.密码 = self.密码输入框:取文本()
            写配置('./配置.ini', 'mhxy', '账号', self.账号输入框:取文本())
            写配置('./配置.ini', 'mhxy', '密码', self.密码输入框:取文本())
            self.密码输入框:置文本('')
            self.账号输入框:置文本('')
            self.账号输入框:置可视(false)
            self.密码输入框:置可视(false)
            if 开发调试 then
                -- pb数据转换
                local pb_data = {
                    version = 版本,
                    user = 系统参数.账号,
                    password = 系统参数.密码
                }
                客户端:发送PB数据(1000, pb_data)
            else
                客户端:发送数据(1, 版本 .. fgc .. 系统参数.账号 .. fgc .. 系统参数.密码 .. fgc .. f函数.取硬盘序列号())
            end
        end
    end
    self.下拉:更新(x, y)
    self.下拉:显示(480, 242)
    if self.下拉:事件判断() then
        self.账号列表 = {f函数.读配置(程序目录 .. '配置.ini', 'mhxy', '账号')}
        if f函数.读配置(程序目录 .. '配置.ini', 'mhxy', '账号2') ~= '空' then
            self.账号列表[#self.账号列表 + 1] = f函数.读配置(程序目录 .. '配置.ini', 'mhxy', '账号2')
        end
        if f函数.读配置(程序目录 .. '配置.ini', 'mhxy', '账号3') ~= '空' then
            self.账号列表[#self.账号列表 + 1] = f函数.读配置(程序目录 .. '配置.ini', 'mhxy', '账号3')
        end
        if f函数.读配置(程序目录 .. '配置.ini', 'mhxy', '账号4') ~= '空' then
            self.账号列表[#self.账号列表 + 1] = f函数.读配置(程序目录 .. '配置.ini', 'mhxy', '账号4')
        end
        if f函数.读配置(程序目录 .. '配置.ini', 'mhxy', '账号5') ~= '空' then
            self.账号列表[#self.账号列表 + 1] = f函数.读配置(程序目录 .. '配置.ini', 'mhxy', '账号5')
        end
        if f函数.读配置(程序目录 .. '配置.ini', 'mhxy', '账号6') ~= '空' then
            self.账号列表[#self.账号列表 + 1] = f函数.读配置(程序目录 .. '配置.ini', 'mhxy', '账号6')
        end
        if f函数.读配置(程序目录 .. '配置.ini', 'mhxy', '账号7') ~= '空' then
            self.账号列表[#self.账号列表 + 1] = f函数.读配置(程序目录 .. '配置.ini', 'mhxy', '账号7')
        end
        if f函数.读配置(程序目录 .. '配置.ini', 'mhxy', '账号8') ~= '空' then
            self.账号列表[#self.账号列表 + 1] = f函数.读配置(程序目录 .. '配置.ini', 'mhxy', '账号8')
        end
        if f函数.读配置(程序目录 .. '配置.ini', 'mhxy', '账号9') ~= '空' then
            self.账号列表[#self.账号列表 + 1] = f函数.读配置(程序目录 .. '配置.ini', 'mhxy', '账号9')
        end
        if f函数.读配置(程序目录 .. '配置.ini', 'mhxy', '账号10') ~= '空' then
            self.账号列表[#self.账号列表 + 1] = f函数.读配置(程序目录 .. '配置.ini', 'mhxy', '账号10')
        end
        self.账号列表[#self.账号列表 + 1] = '编辑记住的账号'
        self.账号选择:打开(self.账号列表)
    end
    self.账号选择:显示(600, 160, x, y, true)
    if self.账号选择:事件判断() then
        if self.账号选择.弹出事件 == '编辑记住的账号' then
            io.popen('start notepad.exe 配置.ini')
        else
            self.当前账号 = self.账号选择.弹出事件
            for i = 1, 10 do --找账号对应的密码
                if f函数.读配置(程序目录 .. '配置.ini', 'mhxy', '账号' .. i) == self.当前账号 then
                    self.当前密码 = f函数.读配置(程序目录 .. '配置.ini', 'mhxy', '密码' .. i)
                end
            end
        end
        self.账号输入框:置文本(self.当前账号)
        self.密码输入框:置文本(self.当前密码)
        self.账号选择.弹出事件 = nil
    end
end

return 登录类
