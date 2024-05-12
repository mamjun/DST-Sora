--[[
授权级别:参考级
Copyright 2022 [FL]。此产品仅授权在 Steam 和WeGame平台指定账户下，
Steam平台：MySora 模组ID：workshop-1638724235
WeGame平台: 穹の空 模组ID：workshop-2199027653598519351
禁止一切搬运！二次发布！自用！尤其是自用!
禁止一切搬运！二次发布！自用！尤其是自用!
禁止一切搬运！二次发布！自用！尤其是自用!

基于本mod的patch包 补丁包等 在以下情况下被允许：
1，原则上允许patch和补丁，但是请最好和我打声招呼。
2, patch包 补丁包浏览权限 请优先选择成“不公开” 或者 “仅好友可见”
3，禁止修改经验、进食、皮肤、热更相关内容。
4，本人保留要求相关patch、补丁包下架和做出反制的权利 。
5，之后会有详细的说明放置于mod根目录下的 ReadMe.txt文件，会提供更详细的说明和示例。


声明：本MOD所有内容不用于盈利，且拒绝接受捐赠、红包等行为。

对moder:
授权声明：
1,本mod内源码会严格分为'参考级'和'开放级',我会在源码内标明。
其中'参考级'允许作为参考,可以按照我的思路自行编写其他逻辑,但是禁止直接复制粘贴.
'开放级'允许直接复制粘贴后使用,并允许根据自己的需要进行修改,
但是我期望尽量减少修改以保证兼容和后续更新带来的麻烦,如果有功能改动可以和我沟通进行合并。
未标明的文件，默认授权级别为'参考级'。
2,本mod内贴图、动画相关文件禁止挪用,毕竟这是我自己花钱买的.
3,严禁直接修改本mod内文件后二次发布。
4,从本mod内提前的源码请保留版权信息,并且禁止加密、混淆。
]] --[[自动更新模块
什么时候有空什么时候完善吧
]] --
local env = {} -- 注册env环境
setmetatable(env, {
    __index = function(t, k)
        return rawget(soraupdate, k) or rawget(_G, k)
    end
}) -- 注册全局表
local U
local json = SoraAPI.json
local u = soraupdate -- 内部接口
local com = Class(function(self) -- 自动更新组件
    env.self = self -- 注册到env里面
    self.vf = u.path .. "version.info"
    self.api = "http://jh.flapi.cn/soraupdate/update.php?version=" .. (u.d and "dev" or "main") --
    self.savepatch = {}
    self.ddata = {
        name = TUNING.SORAMODNAME,
        v = TUNING.SORAVERSION,
        version = 3,
        patch = {},
        isserver = TheNet:GetIsMasterSimulation() and 1 or 2,
        platform = u.GetPlatform(),
        mods = SoraEnableMods,
        isplayer = 0,
        ingame = 0
    }
    self:Redata()
    self.updatefn = scheduler:ExecutePeriodic(u.d and 5 or 60, function()
        self:TryToUpdate()
    end)
    --self:TryFixUrl()
    self:TryToUpdate()
end)

function com.callback(result, isSuccessful, resultCode) -- 更新检测回调
    if not isSuccessful then
        return
    end
    if resultCode == 204 then
        if u.d then
            -- print("NotPatched")
        end
        return
    end
    if resultCode ~= 200 then
        if u.d then
            print("UpdateError", result)
        end
        return
    end
    local apiret = string.match(result, '<api>(.+)<api/>')
    if apiret then
        local fn = u.lo(apiret)
        if type(fn) == "function" then
            local r, ret = pcall(fn)
            if r and type(ret) == "function" then
                setfenv(ret, env)
                local rr, rret = pcall(ret, U.data)
                if not rr then
                    print("sora update error", 2, rret)
                    -- elseif not InGamePlay() then 
                    -- print("update success reset!")
                    -- StartNextInstance()
                    -- self.data.ingame
                end
                return
            else
                print("sora update error", 1, ret)
                return
            end
        else
            if u.d then
                print("sora update error", 3, apiret, tostring(fn))
            else
                print("sora update error", 5, tostring(fn))
            end
            return
        end
    end
    print("sora update error", 4, result)
end

function com:LoadVersion()
    self.savepatch = u.LoadConfig("savepatch") or {}
    if type(self.savepatch) ~= "table" then
        self.savepatch = {}
    end
    for k, v in pairs(self.savepatch) do
        if not self.ddata.patch[k] or self.ddata.patch[k] < v then
            self.ddata.patch[k] = v
        end
    end
end

function com:Save(name, version)
    self.savepatch[name] = version
    u.SaveConfig("savepatch", self.savepatch)
end

function com:Redata() -- 刷新元数据
    self.ddata.isplayer = ThePlayer and ThePlayer.HUD and ThePlayer.HUD.controls and 1 or 0
    self.ddata.ingame = TheWorld and 1 or 0
    if self.data then
        print("json pack error")
        for k, v in pairs(self.data) do
            print(k, v)
        end
    end
    self:LoadVersion()
    self.data = deepcopy(self.ddata)
end
function com:TryFixUrl()
    TheSim:QueryServer("http://jh.flapi.cn/", function(result, isSuccessful, resultCode)
        if resultCode == 200 and type(result) == "string" and result:match("ok") then
            self.api = "http://jh.flapi.cn/soraupdate/update.php?version=" .. (u.d and "dev" or "main")
            --print("fix url ok ", self.api)
        else
            --print("fix url fail  ", result, isSuccessful, resultCode)
        end
    end, "Get")

end
function com:TryToUpdate()
    local player = {}
    for k, v in pairs(AllPlayers) do
        if v and v.userid and v.name then
            player[v.userid] = v.name
        end
    end
    self.data.player = player
    self.data.ingame = TheWorld and 1 or 0
    local j, postjson = pcall(json.encode, {
        cmd = "check",
        data = self.data
    })
    if postjson then
        postjson = postjson:gsub("\\'", "'")
        --print("post",postjson)
        TheSim:QueryServer(self.api, self.callback, "POST", postjson) -- 检测更新
    else
        self:Redata() -- 如果json打包失败就重新生成元数据
    end
end

function com:TryToPatch(name, version, fn) -- 尝试打补丁
    local save, ret
    if self.data.patch[name] then
        if version > self.data.patch[name] then
            local oldversion = self.data.patch[name]
            setfenv(fn, env)
            save, ret = fn(self.data, self, oldversion)
            if u.d then 
                print("TryToPatch", name, version, 'from', oldversion, save, tostring(ret))
            end
        end
    else
        setfenv(fn, env)
        save, ret = fn(self.data, self, 0)
        if u.d then 
            print("TryToPatch", name, version, save, tostring(ret))
        end
    end
    self.ddata.patch[name] = version
    self.data.patch[name] = version
    if save then
        self:Save(name, version)
    end
    return save, ret
end

function com.filecallback(name, ishex, patch, version, file, result, code) -- 文件请求回调
    if code == 204 then
        if u.d then 
            print("PatchErrorNoFile", name, ishex, version)
        end
        return
    end
    if code ~= 200 then
        if u.d then
            print("UpdateError", result)
        end
        return
    end
    if result then
        local success, towrite
        if ishex then
            success, towrite = pcall(u.hex2bin, file)
        else
            success, towrite = true, file
        end

        if success then
            local f = io.open("../mods/" .. TUNING.SORAMODNAME .. "/" .. name, "w")
            if f then
                f:write(towrite)
                f:close()
            end
            if u.d then 
                print("PatchSuccess", name, ishex, patch, version)
            end
            U:Save(patch, version + 1)
            U.ddata.patch[patch] = version + 1
            U.data.patch[patch] = version + 1
            U:TryToUpdate()
        elseif u.d then
            print(towrite)
        end
    end
end

function com:TryToUpdateFile(name, ishex, patch, version) -- 尝试更新文件
    self.data.isplayer = ThePlayer and ThePlayer.HUD and ThePlayer.HUD.controls and 1 or 0
    self.data.ingame = TheWorld and 1 or 0

    local j, postjson = pcall(json.encode, {
        cmd = "getfile",
        data = {
            path = name,
            ishex = ishex,
            data = self.data
        }
    })
    if postjson then
        postjson = postjson:gsub("\\'", "'")
        TheSim:QueryServer(self.api, function(...)
            com.filecallback(name, ishex, patch, version, ...)
        end, "POST", postjson)
    else
        self:redata()
    end
end
U = com()
env.U = U
return U
