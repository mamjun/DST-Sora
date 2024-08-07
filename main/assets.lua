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
]]
--资源

    --资源列表
    Assets = {
        Asset( "IMAGE", "images/ui/soraextendslot.tex" ),
        Asset( "ATLAS", "images/ui/soraextendslot.xml" ),
        
        Asset( "IMAGE", "images/saveslot_portraits/sora.tex" ),     --存档图标
        Asset( "ATLAS", "images/saveslot_portraits/sora.xml" ),     --
        Asset( "IMAGE", "images/selectscreen_portraits/sora.tex" ), --选择界面图标
        Asset( "ATLAS", "images/selectscreen_portraits/sora.xml" ),
        Asset( "IMAGE", "bigportraits/sora.tex" ),                  --人物背景大图
        Asset( "ATLAS", "bigportraits/sora.xml" ),
        Asset( "IMAGE", "images/map_icons/sora.tex" ),              --小地图图标
        Asset( "ATLAS", "images/map_icons/sora.xml" ),
        Asset( "IMAGE", "images/avatars/avatar_sora.tex" ),         --
        Asset( "ATLAS", "images/avatars/avatar_sora.xml" ),
        Asset( "IMAGE", "images/avatars/self_inspect_sora.tex" ),         --
        Asset( "ATLAS", "images/avatars/self_inspect_sora.xml" ),
        Asset( "IMAGE", "images/avatars/avatar_ghost_sora.tex" ),
        Asset( "ATLAS", "images/avatars/avatar_ghost_sora.xml" ),
        Asset( "IMAGE", "images/inventoryimages/soratab.tex" ),
        Asset( "ATLAS", "images/inventoryimages/soratab.xml" ),
        Asset( "IMAGE", "images/inventoryimages/soramakertab.tex" ),
        Asset( "ATLAS", "images/inventoryimages/soramakertab.xml" ),
        Asset("SOUNDPACKAGE", "sound/sora.fev"),
        Asset("SOUND", "sound/sora.fsb"),
        Asset( "IMAGE", "images/names_sora.tex" ),  --人物名字
        Asset( "ATLAS", "images/names_sora.xml" ),
        Asset( "IMAGE", "bigportraits/sora.tex" ),  --人物大图（椭圆的那个）
        Asset( "ATLAS", "bigportraits/sora.xml" ),
		Asset("ANIM", "anim/pockygame.zip"),
		Asset("ANIM", "anim/pockybuild.zip"),
        Asset("ANIM", "anim/sorawiki.zip"),   
        --Asset("ANIM", "anim/test.zip"),  
        Asset("ANIM", "anim/skin_progressbar.zip"),  
        Asset( "IMAGE", "images/inventoryimages/mk_cloudfxsora.tex" ),
        Asset( "ATLAS", "images/inventoryimages/mk_cloudfxsora.xml" ),
        Asset("ANIM", "anim/mk_cloudfxsora.zip"),  
        
        Asset( "IMAGE", "images/inventoryimages/sora_tab_items.tex" ),
        Asset( "ATLAS", "images/inventoryimages/sora_tab_items.xml" ),
        
        Asset( "IMAGE", "images/inventoryimages/sora_tab_tools.tex" ),
        Asset( "ATLAS", "images/inventoryimages/sora_tab_tools.xml" ),
        
        Asset( "IMAGE", "images/inventoryimages/sora_tab_build.tex" ),
        Asset( "ATLAS", "images/inventoryimages/sora_tab_build.xml" ),
        
        Asset( "IMAGE", "images/inventoryimages/sora_tab_knows.tex" ),
        Asset( "ATLAS", "images/inventoryimages/sora_tab_knows.xml" ),
        
        Asset( "IMAGE", "images/inventoryimages/sora_tab_knows2.tex" ),
        Asset( "ATLAS", "images/inventoryimages/sora_tab_knows2.xml" ),
        
        Asset( "IMAGE", "images/inventoryimages/sora_fl.tex" ),
        Asset( "ATLAS", "images/inventoryimages/sora_fl.xml" ),
        
    }
    
    
        -- 小地图
    AddMinimapAtlas("images/map_icons/sora.xml")
    AddMinimapAtlas("images/inventoryimages/sora2armor.xml")
    AddMinimapAtlas("images/inventoryimages/sora2bag.xml")
    AddMinimapAtlas("images/inventoryimages/sora2fire.xml")
    AddMinimapAtlas("images/inventoryimages/sora2birdchest.xml")
    AddMinimapAtlas("images/inventoryimages/sora2chest.xml")
    AddMinimapAtlas("images/inventoryimages/sora2hat.xml")
    AddMinimapAtlas("images/inventoryimages/sora2ice.xml")
    AddMinimapAtlas("images/inventoryimages/sora2sword.xml")
    AddMinimapAtlas("images/inventoryimages/sora3sword.xml")
    AddMinimapAtlas("images/inventoryimages/sorabag.xml")
    AddMinimapAtlas("images/inventoryimages/sorabowknot.xml")
    AddMinimapAtlas("images/inventoryimages/soraclothes.xml")
    AddMinimapAtlas("images/inventoryimages/sorahat.xml")
    AddMinimapAtlas("images/inventoryimages/sorahealing.xml")
    AddMinimapAtlas("images/inventoryimages/soramagic.xml")
    AddMinimapAtlas("images/inventoryimages/sorapick.xml")
    AddMinimapAtlas("images/inventoryimages/sorapocky.xml")
    AddMinimapAtlas("images/inventoryimages/sorarepairer.xml")
    AddMinimapAtlas("images/inventoryimages/soratab.xml")
    AddMinimapAtlas("images/inventoryimages/soratele.xml")
    AddMinimapAtlas("images/inventoryimages/sora2amulet.xml")
    AddMinimapAtlas("images/inventoryimages/sora2base.xml")
    AddMinimapAtlas("images/inventoryimages/sora2stone.xml")
    AddMinimapAtlas("images/inventoryimages/sora2tree.xml")
    AddMinimapAtlas("images/inventoryimages/sora_fl.xml")
    AddMinimapAtlas("images/inventoryimages/sora_flh.xml")
    AddMinimapAtlas("images/inventoryimages/sora_wq.xml")
    --声音
    RemapSoundEvent( "dontstarve/characters/sora/hurt", "sora/characters/hurt" )

