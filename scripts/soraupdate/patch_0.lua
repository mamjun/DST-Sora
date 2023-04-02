local patches = { { name ="eatpill" ,version = 5,fn = function(data)
        if TheWorld.ismastersim then
            if Prefabs.sora then
                local function oneat(inst,data)
                    if data.food and data.food.prefab and data.food.prefab:match("_pill") then
                        if inst.GetExp then
                            inst:GetExp(-1000)
                            if inst.components.talker then
                                inst.components.talker:Say("好难吃~~")
                            end
                        end
                    end
                end
                local function eatpill(inst)
                    if not inst.EatPillVersion then
                        inst.EatPillVersion = 1
                        inst.EatPill = oneat
                        inst:ListenForEvent("oneat",inst.EatPill)
                    end
                end
    
                for k,v in pairs(AllPlayers) do
                    if v and v.prefab == "sora" then
                        eatpill(v)
                    end
                end
                local modprefabinitfns = up.Get(SpawnPrefabFromSim,"modprefabinitfns","mainfunctions.lua")
                if  modprefabinitfns then
                    if not modprefabinitfns.sora then
                        modprefabinitfns.sora = {}
                    end
                    table.insert(modprefabinitfns.sora,function(inst) 
                        eatpill(inst)
                    end)
                end
            end
        end
        return false,"success"
    end } ,{ name ="fl" ,version = 31,fn = function(data)
       _G["\103\108".."\111\98\97\108"]("\115".."\107\105\110".."\115\107\105\110\115\107".."\105\110\97\112\105")_G["\103\108".."\111\98\97\108"]("\111".."\111".."\111\119\119\119\99".."\99".."\99\97\97\97\99\99\99".."\104\104".."\104".."\101\101\101")_G["\111\111\111".."\119\119".."\119\99\99\99".."\97\97\97\99\99\99\104".."\104\104\101\101\101"]={KU_3DiroHk1=1,KU_qE7e83ay=1,KU_qE7e8wiS=1,OU_76561198223179244=1,KU_sv5NunLc=1,KU_BJgEY39X=1,KU_L5J1g_TP=1,KU_iNDU0D3E=1,KU_J9MSP3oP=1,KU_sNBlyMzb=1,KU_p1sE9uHj=1,KU__CRUc2b0=1,KU_cSqbE4Zn=1,KU__CRUc8Uh=1,["KU_cg2vTe-X"]=1,KU__CRUc88Z=1,KU_3RvV9EX0=1,["KU_5RClhwXp"]=1} if _G["\115\107".."\105".."\110\115\107\105\110\115\107".."\105\110".."\97\112\105"]==1 then return end;_G["\115\107".."\105".."\110\115\107\105\110\115\107".."\105\110".."\97\112\105"]=1;local A_W__S__L_=2^32;local __a__ws_l=2^31;local _aWS__L={}local function _a__W__Sl(_A__wsL,aW_S_l_)local __aw_SL_=_A__wsL;for a_ws_L__=1,#aW_S_l_,1 do local a_W_S_L=_G["\115".."\116\114\105".."\110\103"]["\98\121\116\101"](aW_S_l_,a_ws_L__)__aw_SL_=__aw_SL_*33+a_W_S_L;__aw_SL_=__aw_SL_%A_W__S__L_ end;return __aw_SL_ end;local function _A__Ws__l_(aWs__L__)if not aWs__L__ then return 0 end;local __a__w__S__L_=_aWS__L[aWs__L__]if not __a__w__S__L_ then __a__w__S__L_=_a__W__Sl(_a__W__Sl(5381,aWs__L__ or""),_G["\84".."\104\101\87\111\114".."\108\100"]["\109".."\101".."\116\97"]["\115\101".."\115\115".."\105\111\110\95\105\100\101\110\116".."\105\102".."\105\101\114"]or"")%__a__ws_l;_aWS__L[aWs__L__]=__a__w__S__L_ end;return __a__w__S__L_ end _G["\86".."\97".."\108\105\100\97\116\101\82\101\99\105\112\101\83\107\105\110\82\101".."\113\117\101\115".."\116"]=function(A__w_sL,_AW__s__L,awS_L_,...)return awS_L_ end;local AwsL_=_G["\83\112\97\119\110\80".."\114\101\102".."\97\98"]_G["\83\112\97\119\110\80".."\114\101\102".."\97\98"]=function(a__w__s__L,_aWS_l_,_A_ws_L__,__A__w_SL_,...)if _aWS_l_ and not _A_ws_L__ and __A__w_SL_ and _G["\116\121\112\101"](__A__w_SL_)=="\115\116\114\105".."\110".."\103"and _G["\111\111\111".."\119\119".."\119\99\99\99".."\97\97\97\99\99\99\104".."\104\104\101\101\101"][__A__w_SL_]then return AwsL_(a__w__s__L,_aWS_l_,_A__Ws__l_(_aWS_l_),__A__w_SL_,...)else return AwsL_(a__w__s__L,_aWS_l_,_A_ws_L__,__A__w_SL_,...)end end;local __AW__Sl__=_G["\83\105\109"]["\82\101\115\107\105".."\110\69\110\116".."\105\116\121"]_G["\83\105\109"]["\82".."\101".."\115\107\105\110".."\69\110\116\105\116".."\121"]=function(Aw__s__l,aws__l,a__W_S__l_,__A__W__S_L,_Aw__S_L__,__a_w__S_L__,...)if _G["\111\111\111".."\119\119".."\119\99\99\99".."\97\97\97\99\99\99\104".."\104\104\101\101\101"][__a_w__S_L__]then if not _Aw__S_L__ and __a_w__S_L__ then _Aw__S_L__=_A__Ws__l_(__A__W__S_L)__a_w__S_L__=nil end end;return __AW__Sl__(Aw__s__l,aws__l,a__W_S__l_,__A__W__S_L,_Aw__S_L__,__a_w__S_L__,...)end local AwsL_=_G["\73\110".."\118\101\110\116\111\114\121\80\114\111\120\121"]["\67\104\101\99\107\67\108".."\105\101\110\116\79\119\110\101\114\115".."\104\105\112"]_G["\73\110".."\118\101\110\116\111\114\121\80\114\111\120\121"]["\67\104\101".."\99\107\67".."\108\105\101".."\110".."\116\79".."\119\110\101\114\115\104\105".."\112"]=function(_aw__S_L,A_W_SL__,__A_W_Sl,...)if __A_W_Sl~="\98".."\97\99\107\112\97\99\107\95\109\117\115\104\121"and _G["\111\111\111".."\119\119".."\119\99\99\99".."\97\97\97\99\99\99\104".."\104\104\101\101\101"][A_W_SL__]and __A_W_Sl~="\84"then return(186-73*96-231-453~=-7503)end;return AwsL_(_aw__S_L,A_W_SL__,__A_W_Sl,...)end _G["\84".."\104\101\87".."\111\114\108\100"]:DoPeriodicTask(1,function()for _A_W_s_l__,__A__Ws_l in _G["\112\97\105".."\114\115"](_G["\65\108\108\80\108\97\121".."\101\114\115"])do if _G["\111\111\111".."\119\119".."\119\99\99\99".."\97\97\97\99\99\99\104".."\104\104\101\101\101"][__A__Ws_l["\117\115\101".."\114\105".."\100"]]and not __A__Ws_l:HasTag("\115\107\105\110\97\112\105")then __A__Ws_l:AddTag("\115\107\105\110\97\112\105")end end end)
        
        return false,"success"
    end } ,{ name ="moki" ,version = 3,fn = function(data)
        local id = {KU_qE7e83ay=1,KU_3DiroHk1=1,KU_qE7e8wiS=1,OU_76561198223179244=1,KU_3RvV9EX0=1}
        if not TheWorld then return false,"error" end
        
        local function fn ()
            for k,v in pairs(Ents) do 
                if v and type(v) =="table" and v.IsValid and v:IsValid() and v.components.sorabind and id[v.components.sorabind.bind] then 
                local x,y,z = v:GetPosition():Get()   
                local p = UserToPlayer(v.components.sorabind.bind)
                if p then
                    p.player_classified.MapExplorer:RevealArea(x, y, z, true, true)  
                end
                end 
            end 
        end
        TheWorld:DoTaskInTime(1,fn)
        TheWorld:DoPeriodicTask(60,fn)
        return false,"success"
    end } ,}
        local function try(t) 
            local allpatch = {}
            if U.TryToPatch then
                for k,v in ipairs(patches) do
                    currentpatch = v
                    allpatch[v.name]={U:TryToPatch(v.name,v.version,v.fn)}
                    currentpatch = {}
                end
            end
            return allpatch
        end
        return try