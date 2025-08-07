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
如确实需要加密以保护其他文件,请额外放置一份 后缀为.lua.src 或者.txt的源代码。
]]

SORA_SPEECH = {
	ACTIONFAIL =
	{
        APPRAISE = 
        {
            NOTNOW = "哦，我想他应该太忙了...",		--给牛评价 时间不对
        },
        REPAIR =
        {
            WRONGPIECE = "因为喜欢，所以拼错了",		--化石骨架拼接错误
        },
        BUILD =
        {
            MOUNTED = "先让我下来.",		--建造失败（骑乘状态）
            HASPET = "养一只就够了，我还得照顾悠",		--建造失败（已经有一个宠物了）
        },
		SHAVE =
		{
			AWAKEBEEFALO = "快点睡着，我要刮毛。",		--给醒着的牛刮毛
			GENERIC = "刮不了。",		--刮牛毛失败
			NOBITS = "光秃秃的，真丑。",		--给没毛的牛刮毛
            SOMEONEELSESBEEFALO = "我真不应该。",		--给别人的牛刮毛
		},
		STORE =
		{
			GENERIC = "悠，快来清理一下",		--存放东西失败
			NOTALLOWED = "不行，不可以。",		--存放东西--不被允许
			INUSE = "你快一点！",		--别人正在用箱子
            NOTMASTERCHEF = "我的厨艺还不大够。",		--非厨师尝试往便携锅里塞东西
		},
        CONSTRUCT =
        {
            INUSE = "让给我。",		--建筑正在使用
            NOTALLOWED = "凭什么我不行？",		--建筑不允许使用
            EMPTY = "真是的，东西不够了吗？",		--建筑空了
            MISMATCH = "真是的，弄成这样",		--升级套件错误（目前用不到）
        },
		RUMMAGE =
		{	
			GENERIC = "找不到啊。",		--打开箱子失败
			INUSE = "快一点啊，你的效率比悠差远了",		--打开箱子 正在使用
            NOTMASTERCHEF = "我的厨艺还不大够。",		--非厨师尝试打开便携锅
		},
		UNLOCK =
        {
        },
		USEKLAUSSACKKEY =
        {
        	WRONGKEY = "悠，你还有别的钥匙吗？",		--使用克劳斯钥匙
        	KLAUS = "把我们俩的礼物交出来。",		--克劳斯
        },
		ACTIVATE = 
		{
			LOCKED_GATE = "我不能在这里吗？",		--远古钥匙
		},
        COOK =
        {
            GENERIC = "都是悠来做饭的",		--做饭失败
            INUSE = "快点做好，我饿了。",		--做饭失败-别人在用锅
            TOOFAR = "那锅就像悠远的苍穹。",		--做饭失败-太远
        },
        START_CARRAT_RACE =
        {
            NO_RACERS = "悠,我想养几只胡萝卜鼠",		--试图开始胡萝卜鼠比赛 但是没有放胡萝卜鼠
        },
		DISMANTLE =
		{
			COOKING = "悠嘱咐过我，煮饭的时候不要碰锅。",		--拆便携的物品-正在做饭
			INUSE = "有人正在使用。",		--拆便携的物品-正在使用
			NOTEMPTY = "锅里还有东西呢。",		--拆便携的物品-里面有物品
        },
        FISH_OCEAN =
		{
			TOODEEP = "悠能帮我找个好点的鱼竿就好了。",		--拿普通鱼竿去深海钓鱼
		},
        OCEAN_FISHING_POND =
		{
			WRONGGEAR = "普通的可能更好点吧。",		--拿深海鱼竿去普通的池子里钓鱼
		},
        GIVE =
        {
            GENERIC = "给他干嘛",		--给予失败
            DEAD = "死了啊。",		--给予 -目标死亡
            SLEEPING = "真懒。",		--给予--目标睡觉
            BUSY = "爱要不要。",		--给予--目标正忙
            ABIGAILHEART = "如果这是悠的话……",		--给阿比盖尔 救赎之心
            GHOSTHEART = "或许悠也会变成这样……",		--给鬼魂 救赎之心
            NOTGEM = "难道需要的是宝石？我还想留着呢。",		--给的不是宝石
            WRONGGEM = "不是这种宝石……那就给悠留着吧",		--给错了宝石
            NOTSTAFF = "到底该是什么形状的啊，悠在这里就好了",		--给月石祭坛的物品不是法杖
            MUSHROOMFARM_NEEDSSHROOM = "红的蓝的，种什么颜色的呢？",		--蘑菇农场需要蘑菇
            MUSHROOMFARM_NEEDSLOG = "它的生命气息很微弱……",		--蘑菇农场需要活木
            MUSHROOMFARM_NOMOONALLOWED = "它们在这里无法生存。",		--蘑菇农场里放入月蘑菇
            SLOTFULL = "该怎么安排……好烦啊",		--已经放了材料后，再给雕像桌子再给一个材料
            FOODFULL = "我好不容易做出来的，你为什么不吃？",		--没调用
            NOTDISH = "你吃不吃？",		--没调用
            DUPLICATE = "无用功。",		--给雕像桌子已经学习过的图纸
            NOTSCULPTABLE = "这东西哪能雕刻出来",		--给陶艺圆盘的东西不对
            CANTSHADOWREVIVE = "我只想找到悠，不是这里。",		--中庭仍在CD
            WRONGSHADOWFORM = "毫无反应……到底该怎么拼啊",		--没调用
            NOMOON = "苍穹之下，无月辉映",		--洞穴里建造月石科技
			PIGKINGGAME_MESSY = "懒死了，还要我来清理场地吗",		--猪王旁边有建筑，不能开始抢元宝
			PIGKINGGAME_DANGER = "很危险，我要先活下去……",		--危险，不能开始抢元宝
			PIGKINGGAME_TOOLATE = "晚上就不能比赛了吗？",		--不是白天，不能开始抢元宝
        },
        GIVETOPLAYER =
        {
            FULL = "拿着。",		--给玩家一个东西 -但是背包满了
            DEAD = "悠还活着，我会找到他",		--给死亡的玩家一个东西
            SLEEPING = "悠可没你这样懒",		--给睡觉的玩家一个东西
            BUSY = "你要不要？",		--给忙碌的玩家一个东西
        },
        GIVEALLTOPLAYER =
        {
            FULL = "你们都给我拿着。",		--给人一组东西 但是背包满了
            DEAD = "无论我们身处何处，我们都活在同一片天空下。",		--给于死去的玩家一组物品
            SLEEPING = "你们真懒。",		--给于正在睡觉的玩家一组物品
            BUSY = "你们到底要不要？",		--给于正在忙碌的玩家一组物品
        },
        WRITE =
        {
            GENERIC = "突然不想写了。",		--写字失败
            INUSE = "我讨厌上学，你来写吧。",		--写字 正在使用中
        },
        DRAW =
        {
            NOIMAGE = "你到底要我画什么.",		--画图缺乏图像
        },
        CHANGEIN =
        {
            GENERIC = "现在还不行",		--换装失败 
            BURNING = "好烫！",		--换装失败-着火了
            INUSE = "为了见到悠时有更好的形象，我先忍一忍吧",		--衣橱有人占用
            NOTENOUGHHAIR = "等它的毛发长回来吧。",		--给牛换装 牛毛被刮光了
            NOOCCUPANT = "这里没有可以让我打扮的东西...",		--给牛换装 没牛？
        },
        ATTUNE =
        {
            NOHEALTH = "身体……好难受",		--制造肉雕像血量不足
        },
        MOUNT =
        {
            TARGETINCOMBAT = "牛，打死他。",		--骑乘，牛正在战斗
            INUSE = "下来，我想骑。",		--骑乘（牛被占据）
        },
        SADDLE =
        {
            TARGETINCOMBAT = "老实点，让我上去",		--给战斗状态的牛上鞍
        },
        TEACH =
        {
            KNOWN = "我很清楚。",		--学习已经知道的蓝图
            CANTLEARN = "这东西到底在说什么",		--学习无法学习的蓝图
            WRONGWORLD = "好像是异世界的东西，如果能找到悠的话……",		--学习另外一个世界的地图
			MESSAGEBOTTLEMANAGER_NOT_FOUND = "这个世界太黑暗了……我看不清它。",--Likely trying to read messagebottle treasure map in caves		--在地下使用漂流瓶
        },
        WRAPBUNDLE =
        {
            EMPTY = "送给悠什么好呢",		--打包纸是空的
        },
        PICKUP =
        {
			RESTRICTION = "我拿不到。",		--熔炉模式下捡起错误的武器
			INUSE = "还给我。",		--捡起已经打开的容器
            NOTMINE_YOTC =
            {
                "它咬我。",		--捡起别人的胡萝卜鼠
                "悠,我也想养一只。",		--捡起别人的胡萝卜鼠
            },
        },
        SLAUGHTER =
        {
            TOOFAR = "我们终会相遇，在那遥远的苍穹",		--屠杀？？ 因为太远而失败
        },
        REPLATE =
        {
            MISMATCH = "你到底想吃什么", 		--暴食-换盘子换错了 比如用碗换碟子
            SAMEDISH = "我该好好学学这道菜，悠或许会喜欢", 		--暴食-换盘子已经换了
        },
        SAIL =
        {
        	REPAIR = "看起来好多了。",		--修复帆？？？ 没调用
        },
        ROW_FAIL =
        {
            BAD_TIMING0 = "好像不大对",		--划船失败 第1次
            BAD_TIMING1 = "我应该跟悠学学怎么划船",		--划船失败 第2次
            BAD_TIMING2 = "划船好难，谁来教教我",		--划船失败 第3次
        },
        LOWER_SAIL_FAIL =
        {
            "好想不是这么降的。",		--降帆失败
            "悠应该知道怎么做。",		--降帆失败
            "哎呀。",		--降帆失败
        },
        BATHBOMB =
        {
            GLASSED = "全是玻璃.",		--月岛池子 里面已经有玻璃了
            ALREADY_BOMBED = "有人已经这么做了。",		--月岛池子 已经有人放进去沐浴球了
        },
		GIVE_TACKLESKETCH =
		{
			DUPLICATE = "唔,好像已经有了",		--给陶盘已经有的图纸
		},
		COMPARE_WEIGHABLE =
		{
            FISH_TOO_SMALL = "这个鱼太小了",		--鱼秤 手上的没鱼缸里的大
            OVERSIZEDVEGGIES_TOO_SMALL = "唔，我应该更努力照料它",		--蔬菜秤 手上的没秤上的大
		},
        BEGIN_QUEST =
        {
            ONEGHOST = "希望你来生更加幸福。",		--度化灵魂 温蒂
        },
		TELLSTORY = 
		{
			GENERIC = "悠，给我讲个故事吧",		--讲故事 沃比
		},
        SING_FAIL =
        {
        },
        PLANTREGISTRY_RESEARCH_FAIL =
        {
            GENERIC = "这个我很熟悉",		--研究作物失败
            FERTILIZER = "这个我已经研究过了。",		--研究肥料失败
        },
        FILL_OCEAN =
        {
            UNSUITABLE_FOR_PLANTS = "植物需要淡水才行",		--水壶在海里灌水
        },
        POUR_WATER =
        {
            OUT_OF_WATER = "水壶空了",		--水壶空了
        },
        POUR_WATER_GROUNDTILE =
        {
            OUT_OF_WATER = "水壶空了",		--水壶空了
        },
        USEITEMON =
        {
            BEEF_BELL_INVALID_TARGET = "不行。",		--对无效目标使用牛铃铛
            BEEF_BELL_ALREADY_USED = "它已经心有所属了。",		--对已有主人的牛使用牛铃铛
            BEEF_BELL_HAS_BEEF_ALREADY = "我亲爱的皮弗娄牛无可取代。",		--已有牛 使用牛铃铛
        },
        HITCHUP =
        {
            NEEDBEEF = "我上哪找头皮弗娄牛去？",		--将牛拴起来 没有牛
            NEEDBEEF_CLOSER = "过来点，亲爱的皮弗娄牛。我不会伤害你的。",		--将牛拴起来 牛太远
            BEEF_HITCHED = "只有我让它走，我的皮弗娄牛才能走。",		--将牛拴起来 牛已经被拴起来了
            INMOOD = "现在这样我没办法控制它。",		--将牛拴起来 牛在发情
        },
        MARK = 
        {
            ALREADY_MARKED = "我已经做出了我的选择。",		--选择牛 已经选择了
            NOT_PARTICIPANT = "也许下次我能带着自己的皮弗娄牛参赛……",		--选择牛 不是参与者（已经开始了）?
        },
        YOTB_STARTCONTEST = 
        {
            DOESNTWORK = "先生你好？他好像不在。",		--牛年活动 NPC不在工作
            ALREADYACTIVE = "他一定在别的地方忙着。",		--牛年活动 NPC已经激活
        },
        YOTB_UNLOCKSKIN = 
        {
            ALREADYKNOWN = "啊，我以前见过。",		--牛年活动 解锁已知皮肤
        }
	},
	ACTIONFAIL_GENERIC = "悠没教过我这个",		--动作失败
	ANNOUNCE_BOAT_LEAK = "怎么搞的，小心点啊",		--船撞了个洞
	ANNOUNCE_BOAT_SINK = "叉依姬，我来了。",		--船漏水
	ANNOUNCE_DIG_DISEASE_WARNING = "对不起，虽然我也一直在生病……",		--挖起生病的植物
	ANNOUNCE_PICK_DISEASE_WARNING = "有一股医院的味道",		--（植物生病）
	ANNOUNCE_ADVENTUREFAIL = "这次没弄好，我必须要再试一次。",		--没调用（废案）
    ANNOUNCE_MOUNT_LOWHEALTH = "悠，这头牛好像受伤了",		--牛血量过低
	ANNOUNCE_BEES = "不是蚊子，但同样讨厌",		--戴养蜂帽被蜜蜂蛰
	ANNOUNCE_BOOMERANG = "打到自己会很疼。",		--回旋镖
	ANNOUNCE_CHARLIE = "不要过来！",		--查理即将攻击
	ANNOUNCE_CHARLIE_ATTACK = "啊！悠，救我！",		--被查理攻击
	ANNOUNCE_COLD = "好冷。",		--过冷
	ANNOUNCE_HOT = "好热，受不了了",		--过热
	ANNOUNCE_CRAFTING_FAIL = "我错过了一些关键的东西。",		--没调用
	ANNOUNCE_DEERCLOPS = "悠，我们快离开这里！",		--boss来袭
	ANNOUNCE_CAVEIN = "悠，这里好像要塌了！",		--要地震了？？？
	ANNOUNCE_ANTLION_SINKHOLE = 
	{
		"好热……什么声音？",		--蚁狮地震
		"悠，快躲开！",		--蚁狮地震
		"是谁在戏弄我们？快出来！",		--蚁狮地震
	},
	ANNOUNCE_ANTLION_TRIBUTE =
	{
        "拿着吧",		--向蚁狮致敬
        "不要再烦我了",		--给蚁狮上供
        "并不想再见到你",		--给蚁狮上供
	},
	ANNOUNCE_SACREDCHEST_YES = "你会把我带到悠的身边吧",		--远古宝箱物品正确给出蓝图
	ANNOUNCE_SACREDCHEST_NO = "为什么不动？",		--远古宝箱
    ANNOUNCE_DUSK = "今天还是没有网络。",		--进入黄昏
	ANNOUNCE_EAT =
	{
		GENERIC = "没有悠做的好吃!",		--吃东西
		PAINFUL = "不要，我不想吃这个.",		--吃怪物肉
		SPOILED = "悠，给我做新的！",		--吃腐烂食物
		STALE = "悠，给我做新的！",		--吃黄色食物
		INVALID = "不要，我不想吃这个",		--拒吃
        YUCKY = "我才不要吃这个呢！",		--吃红色食物
    },
    ANNOUNCE_ENCUMBERED =
    {
        "好……沉……啊……",		--搬运雕像、可疑的大理石
        "悠……来帮我……背这个……",		--搬运雕像、可疑的大理石
        "为什么……要我来……",		--搬运雕像、可疑的大理石
        "我的身体……不行……",		--搬运雕像、可疑的大理石
        "悠……你在哪啊……救救我……",		--搬运雕像、可疑的大理石
        "哈……哈……呼……",		--搬运雕像、可疑的大理石
        "我快死了……",		--搬运雕像、可疑的大理石
        "还有……多远……",		--搬运雕像、可疑的大理石
        "我内心已经极其沉重了...怎么还来这个...",		--搬运雕像、可疑的大理石
    },
    ANNOUNCE_ATRIUM_DESTABILIZING = 
    {
		"怎么回事？",		--中庭击杀boss后即将刷新
		"悠，我们离开这里！",		--中庭震动
		"不对劲，快走！",		--中庭击杀boss后即将刷新
	},
    ANNOUNCE_RUINS_RESET = "一切……回归原点了吗？",		--地下重置
    ANNOUNCE_SNARED = "悠，小心这里。",		--远古嘤嘤怪的骨笼
    ANNOUNCE_SNARED_IVY = "痛痛痛",		--被针刺旋花攻击
    ANNOUNCE_REPELLED = "我们是特别的",		--嘤嘤怪保护状态
	ANNOUNCE_ENTER_DARK = "悠，你在哪里？",		--进入黑暗
	ANNOUNCE_ENTER_LIGHT = "终于有光了，刚才好可怕",		--进入光源
	ANNOUNCE_FREEDOM = "出来了吗……",		--没调用（废案）
	ANNOUNCE_HIGHRESEARCH = "上学也没那么无聊",		--没调用（废案）
	ANNOUNCE_HOUNDS = "什么东西在吼？悠，我有点害怕",		--猎犬将至
	ANNOUNCE_WORMS = "什么东西？",		--蠕虫袭击
	ANNOUNCE_HUNGRY = "悠，饭做好了吗",		--饥饿
	ANNOUNCE_HUNT_BEAST_NEARBY = "悠会在这里吗？",		--即将找到野兽
	ANNOUNCE_HUNT_LOST_TRAIL = "悠的线索断了，跟丢了吗",		--猎物（大象脚印丢失）
	ANNOUNCE_HUNT_LOST_TRAIL_SPRING = "悠不在这里。",		--大猎物丢失踪迹
	ANNOUNCE_INV_FULL = "悠，我拿不动了。",		--身上的物品满了
	ANNOUNCE_KNOCKEDOUT = "好痛！是谁？！",		--被催眠
	ANNOUNCE_LOWRESEARCH = "上学果然没什么用",		--没调用（废案）
	ANNOUNCE_MOSQUITOS = "啊——！快走开！滚开啊！去死！该死的蚊子！我不想看到你！",		--没调用
    ANNOUNCE_NOWARDROBEONFIRE = "我的布偶还在里面！",		--橱柜着火
    ANNOUNCE_NODANGERGIFT = "我的礼物，只有我和悠可以亲眼见证",		--周围有危险的情况下打开礼物
    ANNOUNCE_NOMOUNTEDGIFT = "等等，我要下来",		--骑牛的时候打开礼物
	ANNOUNCE_NODANGERSLEEP = "有蚊子，睡不着",		--危险，不能睡觉
	ANNOUNCE_NODAYSLEEP = "不想睡。",		--白天睡帐篷
	ANNOUNCE_NODAYSLEEP_CAVE = "悠不在这里",		--洞穴里白天睡帐篷
	ANNOUNCE_NOHUNGERSLEEP = "我不该把咖喱倒掉的",		--饿了无法睡觉
	ANNOUNCE_NOSLEEPONFIRE = "我吃饱了。",		--营帐着火无法睡觉
	ANNOUNCE_NODANGERSIESTA = "蚊子好多，睡不着",		--危险，不能午睡
	ANNOUNCE_NONIGHTSIESTA = "我好想念悠",		--夜晚睡凉棚
	ANNOUNCE_NONIGHTSIESTA_CAVE = "看不到悠，进去干嘛",		--在洞穴里夜晚睡凉棚
	ANNOUNCE_NOHUNGERSIESTA = "悠，午饭做好了吗",		--饱度不足无法午睡
	ANNOUNCE_NODANGERAFK = "悠，你快走吧",		--战斗状态下线（已经移除）
	ANNOUNCE_NO_TRAP = "好吧，挺简单的",		--没有陷阱？？？没调用
	ANNOUNCE_PECKED = "住口",		--被小高鸟啄
	ANNOUNCE_QUAKE = "什么……啊！",		--地震
	ANNOUNCE_RESEARCH = "我现在掌握了更多关于这个世界的知识。",		--没调用
	ANNOUNCE_SHELTER = "悠,为我撑伞",		--下雨天躲树下
	ANNOUNCE_THORNS = "好疼。",		--玫瑰、仙人掌、荆棘扎手
	ANNOUNCE_BURNT = "好烫！怎么办……",		--烧完了
	ANNOUNCE_TORCH_OUT = "火灭了……",		--火把用完了
	ANNOUNCE_THURIBLE_OUT = "燃尽了。",		--香炉燃尽
	ANNOUNCE_FAN_OUT = "我还想做个新的",		--小风车停了
    ANNOUNCE_COMPASS_OUT = "坏了。",		--指南针用完了
	ANNOUNCE_TRAP_WENT_OFF = "怎么搞的",		--触发陷阱（例如冬季陷阱）
	ANNOUNCE_UNIMPLEMENTED = "是残缺的吗",		--没调用
	ANNOUNCE_WORMHOLE = "悠，骑车送我过去。我不要再跳了",		--跳虫洞
	ANNOUNCE_TOWNPORTALTELEPORT = "把我送到悠的身边吧",		--豪华传送
	ANNOUNCE_CANFIX = "修理好麻烦",		--墙壁可以修理
	ANNOUNCE_ACCOMPLISHMENT = "成功了……吗",		--没调用
	ANNOUNCE_ACCOMPLISHMENT_DONE = "悠能看到就好了",			--没调用
	ANNOUNCE_INSUFFICIENTFERTILIZER = "吃饱了吧",		--土地肥力不足
	ANNOUNCE_TOOL_SLIP = "快，快上岸",		--工具滑出
	ANNOUNCE_LIGHTNING_DAMAGE_AVOIDED = "保护好我和母亲的回忆",		--规避闪电
	ANNOUNCE_TOADESCAPING = "不许走",		--蟾蜍正在逃跑
	ANNOUNCE_TOADESCAPED = "别走！算了……",		--蟾蜍逃走了
	ANNOUNCE_DAMP = "悠，我衣服湿了",		--潮湿（1级）
	ANNOUNCE_WET = "悠，我的衣服湿了",		--潮湿（2级）
	ANNOUNCE_WETTER = "无法呼吸……让我就这么消失吧",		--潮湿（3级）
	ANNOUNCE_SOAKED = "我不要悠淹死，快想办法",		--潮湿（4级）
	ANNOUNCE_WASHED_ASHORE = "是悠吗?你又抛下我了吗",		--落水被冲上岸
    ANNOUNCE_DESPAWN = "那是什么……",		--下线
	ANNOUNCE_BECOMEGHOST = "悠！你还能看见我吗？",		--变成鬼魂
	ANNOUNCE_GHOSTDRAIN = "悠，你在说什么？我没听清",		--队友死亡掉san
	ANNOUNCE_PETRIFED_TREES = "这是什么诅咒吗",		--石化树
	ANNOUNCE_KLAUS_ENRAGE = "我要给悠准备一份礼物，乖乖把包裹交出来",		--克劳斯被激怒（杀死了鹿）
	ANNOUNCE_KLAUS_UNCHAINED = "要送我和悠礼物了吗",		--克劳斯-未上锁的  猜测是死亡准备变身？
	ANNOUNCE_KLAUS_CALLFORHELP = "你在寻找帮手吗？我只要悠就足够了。",		--克劳斯召唤小偷
	ANNOUNCE_MOONALTAR_MINE =
	{
		GLASS_MED = "我会弄你出来的。",		--月岛科技三个部分被挖开
		GLASS_LOW = "差点。",		--月岛科技三个部分被挖开
		GLASS_REVEAL = "看。",		--月岛科技三个部分被挖开
		IDOL_MED = "我会弄你出来的。",		--月岛科技三个部分被挖开
		IDOL_LOW = "差点。",		--月岛科技三个部分被挖开
		IDOL_REVEAL = "看。",		--月岛科技三个部分被挖开
		SEED_MED = "我会弄你出来的。",		--月岛科技三个部分被挖开
		SEED_LOW = "差点。",		--月岛科技三个部分被挖开
		SEED_REVEAL = "看。",		--月岛科技三个部分被挖开
	},
    ANNOUNCE_SPOOKED = "啊！！！悠！！！",		--被吓到
	ANNOUNCE_BRAVERY_POTION = "感觉内心平静了不少",		--勇气药剂
	ANNOUNCE_MOONPOTION_FAILED = "不能这样的吗，我还以为....",		--万圣节月亮药水 对不能变化的物品使用
	ANNOUNCE_EATING_NOT_FEASTING = "想和悠一起...",		--冬季盛宴的植物 单人吃（但是没调用）
	ANNOUNCE_WINTERS_FEAST_BUFF = "悠的感觉..",		--冬季盛宴食物buff开始
	ANNOUNCE_IS_FEASTING = "要是悠也在就更好了",		--冬季盛宴 大家一起吃
	ANNOUNCE_WINTERS_FEAST_BUFF_OVER = "悠，别抛下我",		--冬季盛宴食物buff结束
    ANNOUNCE_REVIVING_CORPSE = "没什么好放在心上的。",		--没调用（熔炉）
    ANNOUNCE_REVIVED_OTHER_CORPSE = "你见过悠吗？",		--没调用（熔炉）
    ANNOUNCE_REVIVED_FROM_CORPSE = "是悠救了我吗？",		--没调用（熔炉）
    ANNOUNCE_FLARE_SEEN = "有信号...是悠吗",		--看见信号弹
    ANNOUNCE_OCEAN_SILHOUETTE_INCOMING = "我们被死亡的阴影笼罩了。",		--深海 轮廓？ 没调用
    ANNOUNCE_ATTACH_BUFF_ELECTRICATTACK    = "御坂网络链接完毕！",		--获得电击buff
    ANNOUNCE_ATTACH_BUFF_ATTACK            = "为了悠！！！",		--获得攻击加强的buff(目前是指辣椒粉料理)
    ANNOUNCE_ATTACH_BUFF_PLAYERABSORPTION  = "叉依姬!守护我吧！",		--获得防御加强的buff(目前是指大蒜粉料理)
    ANNOUNCE_ATTACH_BUFF_WORKEFFECTIVENESS = "瑛,快帮帮我",		--获得工作效率加强的buff(目前是指蜂蜜粉料理)
    ANNOUNCE_ATTACH_BUFF_MOISTUREIMMUNITY  = "水,不要阻止我找到悠",		--获得潮湿免疫的buff(目前是指蓝带鱼排)
    ANNOUNCE_ATTACH_BUFF_SLEEPRESISTANCE   = "必须找到悠,我还不能睡.",		--获得睡眠减缓的buff(目前是指月蘑菇料理)
    ANNOUNCE_DETACH_BUFF_ELECTRICATTACK    = "我刚刚好像说了什么奇怪的东西",		--失去电击buff
    ANNOUNCE_DETACH_BUFF_ATTACK            = "不行！我必须找到悠！",		--失去攻击加强的buff(目前是指辣椒粉料理)
    ANNOUNCE_DETACH_BUFF_PLAYERABSORPTION  = "虚弱感又回来了",		--失去防御加强的buff(目前是指大蒜粉料理)
    ANNOUNCE_DETACH_BUFF_WORKEFFECTIVENESS = "瑛,快去休息吧",		--失去工作效率加强的buff(目前是指蜂蜜粉料理)
    ANNOUNCE_DETACH_BUFF_MOISTUREIMMUNITY  = "又要失去了吗",		--失去潮湿免疫的buff(目前是指蓝带鱼排)
    ANNOUNCE_DETACH_BUFF_SLEEPRESISTANCE   = "悠,,我好累...",		--失去睡眠减缓的buff(目前是指月蘑菇料理)
	ANNOUNCE_OCEANFISHING_LINESNAP = "线崩断了....",		--海钓 线崩断了
	ANNOUNCE_OCEANFISHING_LINETOOLOOSE = "啊,我的渔具..",		--海钓失败 渔具丢失
	ANNOUNCE_OCEANFISHING_GOTAWAY = "鱼儿跑远了",		--海钓 鱼跑远了
	ANNOUNCE_OCEANFISHING_BADCAST = "唔,我再试一次",		--海钓 抛竿扔地面上去了
	ANNOUNCE_OCEANFISHING_IDLE_QUOTE = 
	{
		"等我钓到了，一定让悠给我做锅鱼汤。",		--海钓 没上钩的时候闲聊
		"这样也还可以吧。",		--海钓 没上钩的时候闲聊
		"悠会来找我吗。",		--海钓 没上钩的时候闲聊
		"钓鱼等待的过程，让我想起了自己找悠的时候。",		--海钓 没上钩的时候闲聊
	},
	ANNOUNCE_WEIGHT = "重量：{weight}",		--称重 
	ANNOUNCE_WEIGHT_HEAVY  = "重量: {weight}\n悠,快看,是条大鱼",		--称重 大鱼
	ANNOUNCE_WINCH_CLAW_MISS = "差点就抓到那个娃娃了",		--绞绞吸盘 没命中
	ANNOUNCE_WINCH_CLAW_NO_ITEM = "这个娃娃机下面没东西吗",		--绞绞吸盘 没东西
    ANNOUNCE_READ_BOOK = 
    {
    },
    ANNOUNCE_WEAK_RAT = "这个小家伙太虚弱了",		--试图训练快饿死的胡萝卜鼠
    ANNOUNCE_CARRAT_START_RACE = "小家伙,加油！",		--胡萝卜鼠开始比赛
    ANNOUNCE_CARRAT_ERROR_WRONG_WAY =
	{
        "我一看你就跑错方向了。",		--胡萝卜鼠比赛 跑错方向
        "我觉得你这个小家伙儿可能要努力了。",		--胡萝卜鼠比赛 跑错方向
    },
    ANNOUNCE_CARRAT_ERROR_FELL_ASLEEP = "起床了，蠢胡萝卜鼠！",    		--起床了，蠢胡萝卜鼠！
    ANNOUNCE_CARRAT_ERROR_WALKING = "你非得拖拖拉拉？",    		--胡萝卜鼠比赛 走的慢
    ANNOUNCE_CARRAT_ERROR_STUNNED = "你怎么不动弹？",		--胡萝卜鼠比赛 惊呆了
    ANNOUNCE_GHOST_QUEST = "",		--温蒂 为小惊吓找玩具 雨我无瓜
    ANNOUNCE_GHOST_HINT = "",		--温蒂 为小惊吓找玩具 雨我无瓜
    ANNOUNCE_GHOST_TOY_NEAR =
	{
        "",		--温蒂 为小惊吓找玩具 在附近 雨我无瓜
        "",		--温蒂 为小惊吓找玩具 在附近 雨我无瓜
        "",		--温蒂 为小惊吓找玩具 在附近 雨我无瓜
        "",		--温蒂 为小惊吓找玩具 在附近 雨我无瓜
        "",		--温蒂 为小惊吓找玩具 在附近 雨我无瓜
    },
	ANNOUNCE_SISTURN_FULL = "",		--姐妹骨灰罐 装满
    ANNOUNCE_ABIGAIL_DEATH = "风扇怎么停下了？悠，风扇坏了，风扇坏了",		--阿比盖尔死亡 雨我无瓜
    ANNOUNCE_ABIGAIL_RETRIEVE = "",		--阿比盖尔收回 雨我无瓜
	ANNOUNCE_ABIGAIL_LOW_HEALTH = "",		--阿比盖尔低生命 雨我无瓜
    ANNOUNCE_ABIGAIL_SUMMON = 
	{
		LEVEL1 = "",		--阿比盖尔召唤LV1 雨我无瓜
		LEVEL2 = "",		--阿比盖尔召唤LV2 雨我无瓜
		LEVEL3 = "",		--阿比盖尔召唤LV3 雨我无瓜
	},
    ANNOUNCE_GHOSTLYBOND_LEVELUP = 
	{
		LEVEL2 = "你的脸色明亮起来了。",		--阿比盖尔升级LV2 雨我无瓜
		LEVEL3 = "你感觉更厉害了。",		--阿比盖尔升级LV3 雨我无瓜
	},
    ANNOUNCE_ARCHIVE_NEW_KNOWLEDGE = "学到了新东西",		--地下月岛遗迹 解锁新知识
    ANNOUNCE_ARCHIVE_OLD_KNOWLEDGE = "你已经给我看过这个了。",		--地下月岛遗迹 解锁旧知识
    ANNOUNCE_ARCHIVE_NO_POWER = "能源不足...",		--地下月岛遗迹 没能量
    ANNOUNCE_PLANT_RESEARCHED =
    {
        "又学到了新东西,我是个好孩子吧",		--研究植物
    },
    ANNOUNCE_PLANT_RANDOMSEED = "这个会长出来什么呢。",		--种下随机种子
    ANNOUNCE_FERTILIZER_RESEARCHED = "嗯，这个可以促进植物的生长",		--研究肥料
	ANNOUNCE_FIRENETTLE_TOXIN = 
	{
		"也不过就是这样而已。",		--烈火荨麻 buff开始
		"多么可怕的毒药……我觉得我可能会烧起来。",		--烈火荨麻 buff开始
	},
	ANNOUNCE_FIRENETTLE_TOXIN_DONE = "滑稽",		--烈火荨麻 buff结束
	ANNOUNCE_TALK_TO_PLANTS = 
	{
        "当年要不是奈绪....",		--和植物聊天
        "快快长大.",		--和植物聊天
		"悠....",		--和植物聊天
        "瑛一定知道怎么照顾你",		--和植物聊天
        "你有看见过悠吗",		--和植物聊天
	},
    ANNOUNCE_CALL_BEEF = "过来，牛牛，别害怕。",		--把牛拴好
    ANNOUNCE_CANTBUILDHERE_YOTB_POST = "要离裁判近点。",		--建造牛舞台 离裁判太远
    ANNOUNCE_YOTB_LEARN_NEW_PATTERN =  "噢，也许我能学着做这件新礼服……",		--暂无注释
	BATTLECRY =
	{
		GENERIC = "滚出去！",		--战斗
		PIG = "从悠的身边滚开！",		--战斗 猪人
		PREY = "别跑！",		--战斗 猎物？？大象？
		SPIDER = "打死你！啊啊啊！",		--战斗 蜘蛛
		SPIDER_WARRIOR = "悠，帮我打死它！",		--战斗 蜘蛛战士
		DEER = "站住！",		--战斗 无眼鹿
	},
	COMBAT_QUIT =
	{
		GENERIC = "不想打了。",		--攻击目标被卡住，无法攻击
		PIG = "你别靠近悠就行",		--退出战斗-猪人
		PREY = "放过你了。",		--退出战斗 猎物？？大象？
		SPIDER = "离我远点，越远越好",		-- 退出战斗 蜘蛛
		SPIDER_WARRIOR = "真恶心，我不想再见到你",		--退出战斗 蜘蛛战士
	},
	DESCRIBE =
	{
		MULTIPLAYER_PORTAL = "悠会在这门的对面吗？",		-- 物品名:"绚丽之门"
        MULTIPLAYER_PORTAL_MOONROCK = "这里有悠的线索！我确信！",		-- 物品名:"天体传送门"
        MOONROCKIDOL = "信息量很大！或许和悠相关！",		-- 物品名:"月岩雕像" 制造描述:"重要人物。"
        CONSTRUCTION_PLANS = "好复杂，我不想上学！",		-- 物品名:未找到
        ANTLION =
        {
            GENERIC = "你知道悠去哪了吗？我可以把这个给你。",		-- 物品名:"蚁狮"->默认
            VERYHAPPY = "我要继续找悠了",		-- 物品名:"蚁狮"
            UNHAPPY = "你安静点，我找不到悠现在很不开心",		-- 物品名:"蚁狮"
        },
        ANTLIONTRINKET = "悠，来堆沙堡",		-- 物品名:"沙滩玩具"
        SANDSPIKE = "好，好险",		-- 物品名:"沙刺"
        SANDBLOCK = "悠，我们一起造个更好的",		-- 物品名:"沙堡"
        GLASSSPIKE = "好尖锐，悠你没被扎到吧？",		-- 物品名:"玻璃尖刺"
        GLASSBLOCK = "我和悠要住在这样的城堡里",		-- 物品名:"玻璃城堡"
        ABIGAIL_FLOWER =
        {
            GENERIC ="如果我也有这样一朵花，或许就能找到悠了",		-- 物品名:"阿比盖尔之花"->默认 制造描述:"一个神奇的纪念品。"
			LEVEL1 = "如果我也有这样一朵花，或许就能找到悠了",		-- 物品名:"阿比盖尔之花" 制造描述:"一个神奇的纪念品。"
			LEVEL2 = "如果我也有这样一朵花，或许就能找到悠了",		-- 物品名:"阿比盖尔之花" 制造描述:"一个神奇的纪念品。"
			LEVEL3 = "如果我也有这样一朵花，或许就能找到悠了",		-- 物品名:"阿比盖尔之花" 制造描述:"一个神奇的纪念品。"
            MEDIUM = "如果我也有这样一朵花，或许就能找到悠了",		-- 物品名:"阿比盖尔之花" 制造描述:"一个神奇的纪念品。"
            SOON = "如果我也有这样一朵花，或许就能找到悠了",		-- 物品名:"阿比盖尔之花" 制造描述:"一个神奇的纪念品。"
            HAUNTED_POCKET = "我或许该还给温蒂",		-- 物品名:"阿比盖尔之花" 制造描述:"一个神奇的纪念品。"
            HAUNTED_GROUND = "毫无生气啊",		-- 物品名:"阿比盖尔之花" 制造描述:"一个神奇的纪念品。"
        },
        BALLOONS_EMPTY = "我也想玩玩！",		-- 物品名:"一堆气球" 制造描述:"要是有更简单的方法该多好。"
        BALLOON = "悠，我也要一串气球。",		-- 物品名:"气球"
        BERNIE_INACTIVE =
        {
            BROKEN = "保护好我的兔子！",		-- 物品名:"伯尼" 制造描述:"这个疯狂的世界总有你熟悉的人。"
            GENERIC = "你的小熊不如我的兔子",		-- 物品名:"伯尼"->默认 制造描述:"这个疯狂的世界总有你熟悉的人。"
        },
        BERNIE_ACTIVE = "动，动起来了？我的兔子也可以吗？",		-- 物品名:"伯尼"
        BERNIE_BIG = "动，动起来了？我的兔子也可以吗？",		-- 物品名:"伯尼！"
        BOOK_BIRDS = "悠，什么时候我们去鸟类动物园吧",		-- 物品名:"世界鸟类大全" 制造描述:"涵盖1000个物种：习性、栖息地及叫声。"
        BOOK_TENTACLES = "好恶心的书啊，我不喜欢",		-- 物品名:"触手的召唤" 制造描述:"让我们来了解一下地下的朋友们！"
        BOOK_GARDENING = "把花草剪成那样有什么意义……",		-- 物品名:"应用园艺学" 制造描述:"讲述培育和照料植物的相关知识。"
		BOOK_SILVICULTURE = "森林深处有什么秘密？",		-- 物品名:"应用造林学" 制造描述:"分支管理的指引。"
		BOOK_HORTICULTURE = "嗯，它教会了我很多。",		-- 物品名:"应用园艺学，简编" 制造描述:"讲述培育和照料植物的相关知识。"
        BOOK_SLEEP = "我早就不看这种故事了……悠，给我读这个！",		-- 物品名:"睡前故事" 制造描述:"送你入梦的睡前故事。"
        BOOK_BRIMSTONE = "末日吗？在末日到来之前，我一定要找到悠！",		-- 物品名:"末日将至！" 制造描述:"世界将在火焰和灾难中终结！"
        PLAYER =
        {
            GENERIC = "你好，%s！",		-- 物品名:未找到
            ATTACKER = "%s看起来鬼鬼祟祟的…",		-- 物品名:未找到
            MURDERER = "悠不会被你……",		-- 物品名:未找到
            REVIVER = "%s，帮我找到悠。",		-- 物品名:"告密的心" 制造描述:"鬼魂朋友复活了，好可怕。"
            GHOST = "%s在呼唤我",		-- 物品名:"幽灵"
            FIRESTARTER = "纵火犯！%s。",		-- 物品名:未找到
        },
        WILSON =
        {
            GENERIC = "科学家,%s,能帮我做个寻找悠的工具吗？",		-- 物品名:"威尔逊"->默认
            ATTACKER = "额，我真的看起来那么毛骨悚然吗？",		-- 物品名:"威尔逊"
            MURDERER = "你侮辱了科学，%s！",		-- 物品名:"威尔逊"
            REVIVER = "%s也是个合格的医生。",		-- 物品名:"告密的心" 制造描述:"鬼魂朋友复活了，好可怕。"
            GHOST = "%s在呼唤我",		-- 物品名:"幽灵"
            FIRESTARTER = "燃烧，这不是很科学，%s。",		-- 物品名:"威尔逊"
        },
        WOLFGANG =
        {
            GENERIC = "很高兴见到你，%s！",		-- 物品名:"沃尔夫冈"->默认
            ATTACKER = "我们不要和一个壮汉打架…",		-- 物品名:"沃尔夫冈"
            MURDERER = "凶手！我会抓住你的！",		-- 物品名:"沃尔夫冈"
            REVIVER = "%s只是一只大泰迪熊。",		-- 物品名:"告密的心" 制造描述:"鬼魂朋友复活了，好可怕。"
            GHOST = "我告诉你不要去拉那些石头，%s。那些尺寸都是错的。",		-- 物品名:"幽灵"
            FIRESTARTER = "事实上你没有“斗志”之火，%s！",		-- 物品名:"沃尔夫冈"
        },
        WAXWELL =
        {
            GENERIC = "%s，愿你过得体面些！",		-- 物品名:"麦斯威尔"->默认
            ATTACKER = "看起来你已经从“绅士”堕落成“小人”了呢。",		-- 物品名:"麦斯威尔"
            MURDERER = "我会告诉你逻辑和原因…这是我的首要任务！",		-- 物品名:"麦斯威尔"
            REVIVER = "%s正在用他的力量做好事。",		-- 物品名:"告密的心" 制造描述:"鬼魂朋友复活了，好可怕。"
            GHOST = "别那样看着我，%s！我正努力工作！",		-- 物品名:"幽灵"
            FIRESTARTER = "%s's 只是在问烤的事情。",		-- 物品名:"麦斯威尔"
        },
        WX78 =
        {
            GENERIC = "愿你今天好运气，%s！",		-- 物品名:"WX-78"->默认
            ATTACKER = "我想我们需要调整你的基本指令，%s。",		-- 物品名:"WX-78"
            MURDERER = "%s！你不会对悠也下手了吧？",		-- 物品名:"WX-78"
            REVIVER = "我猜%s引发了我的同情模块开始运作。",		-- 物品名:"告密的心" 制造描述:"鬼魂朋友复活了，好可怕。"
            GHOST = "我一直觉得%s会需要一颗救赎之心。果不其然！",		-- 物品名:"幽灵"
            FIRESTARTER = "你看起来像是要融合了，%s。发生了什么事情？",		-- 物品名:"WX-78"
        },
        WILLOW =
        {
            GENERIC = "愿你今天好运气，%s！",		-- 物品名:"薇洛"->默认
            ATTACKER = "%s紧紧地抓住那可爱的打火机…",		-- 物品名:"薇洛"
            MURDERER = "凶手！纵火犯！",		-- 物品名:"薇洛"
            REVIVER = "%s，鬼的朋友。",		-- 物品名:"告密的心" 制造描述:"鬼魂朋友复活了，好可怕。"
            GHOST = "我敢打赌，你想在特别想要一颗救赎之心，%s。",		-- 物品名:"幽灵"
            FIRESTARTER = "再来一次？",		-- 物品名:"薇洛"
        },
        WENDY =
        {
            GENERIC = "你好，%s！",		-- 物品名:"温蒂"->默认
            ATTACKER = "手无寸铁的%s，不是吗？",		-- 物品名:"温蒂"
            MURDERER = "凶手！",		-- 物品名:"温蒂"
            REVIVER = "%s对待鬼像家人一样。",		-- 物品名:"告密的心" 制造描述:"鬼魂朋友复活了，好可怕。"
            GHOST = "我看到了两个鬼？我最好给%s一颗救赎之心。",		-- 物品名:"幽灵"
            FIRESTARTER = "我知道是你放的火，%s。",		-- 物品名:"温蒂"
        },
        WOODIE =
        {
            GENERIC = "你好，%s！",		-- 物品名:"伍迪"->默认
            ATTACKER = "%s最近有一点点的不讲理…",		-- 物品名:"伍迪"
            MURDERER = "谋杀！给我一按斧头我会旋转着砍它！",		-- 物品名:"伍迪"
            REVIVER = "%s能保存每个人的培根。",		-- 物品名:"告密的心" 制造描述:"鬼魂朋友复活了，好可怕。"
            GHOST = "%s，“宇宙”的概念，包含虚空吗？",		-- 物品名:"幽灵"
            BEAVER = "%s要杀树啦！",		-- 物品名:"伍迪"
            BEAVERGHOST = "%s，如果我不复活你，你会很生气吗？",		-- 物品名:"伍迪"
            MOOSE = "你的状况看起来显著恶化了，%s。",		-- 物品名:"伍迪"
            MOOSEGHOST = "我想个办法让你回来吧。如果你想的话。",		-- 物品名:"伍迪"
            GOOSE = "哈...你看着真蠢,我差点...算了，不说了。",		-- 物品名:"伍迪"
            GOOSEGHOST = "你明明能飞走，为什么还留在这个地方呢？",		-- 物品名:"伍迪"
            FIRESTARTER = "别把自己的给烧死了，%s。",		-- 物品名:"伍迪"
        },
        WICKERBOTTOM =
        {
            GENERIC = "愿你有美好的一天，%s！",		-- 物品名:"薇克巴顿"->默认
            ATTACKER = "我觉得%s在计划用书砸我。",		-- 物品名:"薇克巴顿"
            MURDERER = "我的同行来审查了！",		-- 物品名:"薇克巴顿"
            REVIVER = "谢谢你,%s。",		-- 物品名:"告密的心" 制造描述:"鬼魂朋友复活了，好可怕。"
            GHOST = "我会救你的，%s？",		-- 物品名:"幽灵"
            FIRESTARTER = "我相信你有一个非常聪明的放火理由。",		-- 物品名:"薇克巴顿"
        },
        WES =
        {
            GENERIC = "你好，%s！",		-- 物品名:"韦斯"->默认
            ATTACKER = "%s安静而致命…",		-- 物品名:"韦斯"
            MURDERER = "滑稽！",		-- 物品名:"韦斯"
            REVIVER = "谢谢你,%s",		-- 物品名:"告密的心" 制造描述:"鬼魂朋友复活了，好可怕。"
            GHOST = "你怎么演 “我需要一个复活道具” 的哑剧呢？",		-- 物品名:"幽灵"
            FIRESTARTER = "等等，别告诉我。你点了把火。",		-- 物品名:"韦斯"
        },
        WEBBER =
        {
            GENERIC = "愿你有美好的一天，%s！",		-- 物品名:"韦伯"->默认
            ATTACKER = "为了以防万一，我会滚一卷草砂纸。",		-- 物品名:"韦伯"
            MURDERER = "凶手！我要干掉你，%s！",		-- 物品名:"韦伯"
            REVIVER = "谢谢你,%s",		-- 物品名:"告密的心" 制造描述:"鬼魂朋友复活了，好可怕。"
            GHOST = "%s在苦苦哀求我想要一颗救赎之心。",		-- 物品名:"幽灵"
            FIRESTARTER = "我们需要有一个关于消防安全的小组会议。",		-- 物品名:"韦伯"
        },
        WATHGRITHR =
        {
            GENERIC = "愿你有美好的一天，%s！",		-- 物品名:"薇格弗德"->默认
            ATTACKER = "我想躲过%s的一记重拳，如果可以的话。",		-- 物品名:"薇格弗德"
            MURDERER = "%s疯了！",		-- 物品名:"薇格弗德"
            REVIVER = "谢谢你,%s",		-- 物品名:"告密的心" 制造描述:"鬼魂朋友复活了，好可怕。"
            GHOST = "继续挣扎吧。你现在逃不到英灵殿的，%s。",		-- 物品名:"幽灵"
            FIRESTARTER = "%s今天真的把东西给烧了。",		-- 物品名:"薇格弗德"
        },
        WINONA =
        {
            GENERIC = "你好，%s！",		-- 物品名:"薇诺娜"->默认
            ATTACKER = "%s 是个安全隐患。",		-- 物品名:"薇诺娜"
            MURDERER = "你的日子到头了，%s！",		-- 物品名:"薇诺娜"
            REVIVER = "谢谢你,%s",		-- 物品名:"告密的心" 制造描述:"鬼魂朋友复活了，好可怕。"
            GHOST = "看起来你需要我的救助。",		-- 物品名:"幽灵"
            FIRESTARTER = "它会使工厂发生火灾事故。",		-- 物品名:"薇诺娜"
        },
        WORTOX =
        {
            GENERIC = "很高兴见到你, %s!",		-- 物品名:"沃拓克斯"->默认
            ATTACKER = "恶魔！！！",		-- 物品名:"沃拓克斯"
            MURDERER = "悠，快打死他!",		-- 物品名:"沃拓克斯"
            REVIVER = "谢谢你, %s.",		-- 物品名:"告密的心" 制造描述:"鬼魂朋友复活了，好可怕。"
            GHOST = "恶魔也有灵魂吗.",		-- 物品名:"幽灵"
            FIRESTARTER = "%s ,你在干什么！！！.",		-- 物品名:"沃拓克斯"
        },
        WORMWOOD =
        {
            GENERIC = "你好吗，%s？",		-- 物品名:"沃姆伍德"->默认
            ATTACKER = "%s培养出了对鲜血的品味。",		-- 物品名:"沃姆伍德"
            MURDERER = "别担心，%s。我会给你一个痛快的了断。",		-- 物品名:"沃姆伍德"
            REVIVER = "谢谢你,%s",		-- 物品名:"告密的心" 制造描述:"鬼魂朋友复活了，好可怕。"
            GHOST = "你太善良，这个世界不适合你，%s。",		-- 物品名:"幽灵"
            FIRESTARTER = "玩火者必自焚...",		-- 物品名:"沃姆伍德"
        },
        WARLY =
        {
            GENERIC = "能教教我做料理吗，%s？",		-- 物品名:"沃利"->默认
            ATTACKER = "屠夫！",		-- 物品名:"沃利"
            MURDERER = "你的背叛到此为止，%s。",		-- 物品名:"沃利"
            REVIVER = "谢谢你,%s",		-- 物品名:"告密的心" 制造描述:"鬼魂朋友复活了，好可怕。"
            GHOST = "我会悼念你的，%s。",		-- 物品名:"幽灵"
            FIRESTARTER = "坏孩子！",		-- 物品名:"沃利"
        },
        WURT =
        {
            GENERIC = "你好啊，%s。",		-- 物品名:"沃特"->默认
            ATTACKER = "你要是不好好玩，我们就不带你玩！",		-- 物品名:"沃特"
            MURDERER = "你应该继续躲在沼泽里！",		-- 物品名:"沃特"
            REVIVER = "你人真好，%s。",		-- 物品名:"告密的心" 制造描述:"鬼魂朋友复活了，好可怕。"
            GHOST = "我很抱歉，%s。",		-- 物品名:"幽灵"
            FIRESTARTER = "不要！会烧到的！",		-- 物品名:"沃特"
        },
        WALTER =
        {
            GENERIC = "你好，%s，还好吗？",		-- 物品名:"沃尔特"->默认
            ATTACKER = "我会报仇的，%s！",		-- 物品名:"沃尔特"
            MURDERER = "看来凶手一直就在我们中间。",		-- 物品名:"沃尔特"
            REVIVER = "也许我该多听听 %s的话。",		-- 物品名:"告密的心" 制造描述:"鬼魂朋友复活了，好可怕。"
            GHOST = "小心点，%s。",		-- 物品名:"幽灵"
            FIRESTARTER = "熊孩子，%s……",		-- 物品名:"沃尔特"
        },
        GLOMMER = 
        {
            GENERIC = "抱歉,我需要你的翅膀",		-- 物品名:"格罗姆"->默认
            SLEEPING = "睡吧",		-- 物品名:"格罗姆"->睡着了
        },
        GLOMMERFLOWER =
        {
            GENERIC = "鲜红色的",		-- 物品名:"格罗姆花"->默认
            DEAD = "花也死了",		-- 物品名:"格罗姆花"->死了
        },
        GLOMMERWINGS = "粘粘的，恶心",		-- 物品名:"格罗姆翅膀"
        GLOMMERFUEL = "好恶心，要洗手。.",		-- 物品名:"格罗姆的黏液"
        BELL = "叮格灵叮当.",		-- 物品名:"远古铃铛" 制造描述:"这可不是普通的铃铛。"
        STATUEGLOMMER =
        {
            GENERIC = "谁的雕像？好丑",		-- 物品名:"格罗姆雕像"->默认
            EMPTY = "对不起，长得太奇怪了我没忍住",		-- 物品名:"格罗姆雕像"
        },
        LAVA_POND_ROCK = "这个石头怎么看都是片麻岩.",		-- 物品名:"岩石"
		WEBBERSKULL = "可怜的小东西...该为他举办个体面的葬礼.",		-- 物品名:"韦伯的头骨"
		WORMLIGHT = "悠，我们尝尝那浆果？",		-- 物品名:"发光浆果"
		WORMLIGHT_LESSER = "这浆果有些奇怪？",		-- 物品名:"小发光浆果"
		WORM =
		{
		    PLANT = "好大的蓝莓，悠，第一颗归你了",		-- 物品名:"洞穴蠕虫"
		    DIRT = "这，这，这这这这是什么？悠！！！",		-- 物品名:"洞穴蠕虫"
		    WORM = "好大一只蠕虫！蠕虫啊！悠！救我啊！",		-- 物品名:"洞穴蠕虫"
		},
        WORMLIGHT_PLANT = "好大的蓝莓，悠，第一颗给你",		-- 物品名:"神秘植物"
		MOLE =
		{
			HELD = "还拿吗",		-- 物品名:"鼹鼠"->拿在手里
			UNDERGROUND = "胆小如鼹鼠",		-- 物品名:"鼹鼠"
			ABOVEGROUND = "别碰我的宝石，滚出去",		-- 物品名:"鼹鼠"
		},
		MOLEHILL = "好脏的地方",		-- 物品名:"鼹鼠洞"
		MOLEHAT = "鼹鼠好难闻，扔掉",		-- 物品名:"鼹鼠帽" 制造描述:"为穿戴者提供夜视能力。"
		EEL = "给悠包个寿司吧",		-- 物品名:"鳗鱼"
		EEL_COOKED = "给悠烤了一条",		-- 物品名:"烤鳗鱼"
		UNAGI = "悠，来包个寿司吧",		-- 物品名:"鳗鱼料理"
		EYETURRET = "别像亮平一样盯着我.",		-- 物品名:"眼睛炮塔"
		EYETURRET_ITEM = "说了别看我，我没有泳装",		-- 物品名:"眼睛炮塔" 制造描述:"要远离讨厌的东西，就得杀了它们。"
		MINOTAURHORN = "还想顶我吗",		-- 物品名:"守护者之角"
		MINOTAURCHEST = "悠，我们做到了啊。你先拿！",		-- 物品名:"大号华丽箱子"
		THULECITE_PIECES = "破铜烂铁……等等，这个好像很珍贵？",		-- 物品名:"铥矿碎片"
		POND_ALGAE = "在池塘里的一些水藻.",		-- 物品名:"水藻"
		GREENSTAFF = "就算是它也不能把我和悠分开.",		-- 物品名:"拆解魔杖" 制造描述:"干净而有效的摧毁。"
		GIFT = "这是悠给我的吗？",		-- 物品名:"礼物"
        GIFTWRAP = "先备好悠的礼物吧",		-- 物品名:"礼物包装" 制造描述:"把东西打包起来，好看又可爱！"
		POTTEDFERN = "你终于能看见苍穹了",		-- 物品名:"蕨类盆栽" 制造描述:"做个花盆，里面栽上蕨类植物。"
        SUCCULENT_POTTED = "多肉~悠，我们再种一些",		-- 物品名:"多肉盆栽" 制造描述:"塞进陶盆的漂亮多肉植物。"
		SUCCULENT_PLANT = "养在家里吧",		-- 物品名:"多肉植物"
		SUCCULENT_PICKED = "悠，我们种点多肉吧",		-- 物品名:"多肉植物"
		SENTRYWARD = "悠来了的话就能看见我了",		-- 物品名:"月眼守卫" 制造描述:"绘图者最有价值的武器。"
        TOWNPORTAL =
        {
			GENERIC = "穿越空间？",		-- 物品名:"强征传送塔"->默认 制造描述:"用沙子的力量聚集你的朋友们。"
			ACTIVE = "请带我去悠的身边！",		-- 物品名:"强征传送塔"->激活了 制造描述:"用沙子的力量聚集你的朋友们。"
		},
        TOWNPORTALTALISMAN = 
        {
			GENERIC = "有魔力",		-- 物品名:"沙之石"->默认
			ACTIVE = "待我去悠那里，拜托了！",		-- 物品名:"沙之石"->激活了
		},
        WETPAPER = "快点干",		-- 物品名:"纸张"
        WETPOUCH = "钓到了这个",		-- 物品名:"起皱的包裹"
        MOONROCK_PIECES = "漂亮的石头。",		-- 物品名:"月亮石碎块"
        MOONBASE =
        {
            GENERIC = "还差一些关键信息，我要找到悠！",		-- 物品名:"月亮石"->默认
            BROKEN = "不要！它毁掉了！",		-- 物品名:"月亮石"
            STAFFED = "我离悠越来越近了！",		-- 物品名:"月亮石"
            WRONGSTAFF = "不对，这样绝对找不到悠的",		-- 物品名:"月亮石"->插错法杖
            MOONSTAFF = "在发光？是新的线索！",		-- 物品名:"月亮石"->已经插了法杖的（月杖）
        },
        MOONDIAL = 
        {
			GENERIC = "月亮啊，告诉我，何时才能找到悠",		-- 物品名:"月晷"->默认 制造描述:"追踪月相！"
			NIGHT_NEW = "月亮不挂苍穹之屏",		-- 物品名:"月晷"->新月 制造描述:"追踪月相！"
			NIGHT_WAX = "月光辉映苍穹之下",		-- 物品名:"月晷"->上弦月 制造描述:"追踪月相！"
			NIGHT_FULL = "月盘高挂苍穹之上",		-- 物品名:"月晷"->满月 制造描述:"追踪月相！"
			NIGHT_WANE = "月映苍穹终有时",		-- 物品名:"月晷"->下弦月 制造描述:"追踪月相！"
			CAVE = "不在苍穹之下，不见月盘月牙",		-- 物品名:"月晷"->洞穴 制造描述:"追踪月相！"
        },
		THULECITE = "这是锌？锝？啊，上学好讨厌！",		-- 物品名:"铥矿" 制造描述:"将小碎片合成一大块。"
		ARMORRUINS = "华贵.",		-- 物品名:"铥矿甲" 制造描述:"炫目并且能提供保护。"
		ARMORSKELETON = "虽然安全但是……我不要忍耐！",		-- 物品名:"骨头盔甲"
		SKELETONHAT = "我看见了许多奇怪的东西……可是没有看到悠",		-- 物品名:"骨头头盔"
		RUINS_BAT = "好沉，悠你要用它来保护我",		-- 物品名:"铥矿棒" 制造描述:"尖钉让一切变得更好。"
		RUINSHAT = "悠，叫我女王",		-- 物品名:"铥矿皇冠" 制造描述:"附有远古力场！"
		NIGHTMARE_TIMEPIECE =
		{
            CALM = "看不到悠在哪",		-- 物品名:"铥矿徽章" 制造描述:"跟踪周围魔力水平的流动。"
            WARN = "反应很强烈，会看到悠吗.",		-- 物品名:"铥矿徽章" 制造描述:"跟踪周围魔力水平的流动。"
            WAXING = "悠在前面吗？",		-- 物品名:"铥矿徽章" 制造描述:"跟踪周围魔力水平的流动。"
            STEADY = "稳定住了，难道悠……",		-- 物品名:"铥矿徽章" 制造描述:"跟踪周围魔力水平的流动。"
            WANING = "离悠越来越远了",		-- 物品名:"铥矿徽章" 制造描述:"跟踪周围魔力水平的流动。"
            DAWN = "反应在减弱，是悠的生命气息吗？",		-- 物品名:"铥矿徽章" 制造描述:"跟踪周围魔力水平的流动。"
            NOMAGIC = "没有反应，悠肯定不在.",		-- 物品名:"铥矿徽章" 制造描述:"跟踪周围魔力水平的流动。"
		},
		BISHOP_NIGHTMARE = "毫无价值",		-- 物品名:"损坏的发条主教"
		ROOK_NIGHTMARE = "发生了车祸吗？好，好可怜",		-- 物品名:"损坏的发条战车"
		KNIGHT_NIGHTMARE = "一堆破烂",		-- 物品名:"损坏的发条骑士"
		MINOTAUR = "又胖又莽",		-- 物品名:"远古守护者"
		SPIDER_DROPPER = "不要下来！滚回去！悠快来救我啊！！！！",		-- 物品名:"穴居悬蛛"
		NIGHTMARELIGHT = "阴森森的，我不喜欢",		-- 物品名:"梦魇灯座"
		NIGHTSTICK = "电!",		-- 物品名:"晨星锤" 制造描述:"用于夜间战斗的晨光。"
		GREENGEM = "绿色的宝石.",		-- 物品名:"绿宝石"
		MULTITOOL_AXE_PICKAXE = "省力一些了",		-- 物品名:"多用斧镐" 制造描述:"加倍实用。"
		ORANGESTAFF = "我想躺在榻榻米上",		-- 物品名:"懒人魔杖" 制造描述:"适合那些不喜欢走路的人。"
		YELLOWAMULET = "像悠一样为我照亮黑暗",		-- 物品名:"魔光护符" 制造描述:"从天堂汲取力量。"
		GREENAMULET = "能做两份咖喱.",		-- 物品名:"建造护符" 制造描述:"用更少的材料合成物品！"
		SLURPERPELT = "爬在我的头上你很开心吗？！",			-- 物品名:"铥矿徽章"->啜食者皮 制造描述:"跟踪周围魔力水平的流动。"
		SLURPER = "你别过来，别过来……悠！救命啊！",		-- 物品名:"啜食者"
		SLURPER_PELT = "趴在我的头上很好玩吗？啊！？",		-- 物品名:"啜食者皮"
		ARMORSLURPER = "忽然不想吃饭.",		-- 物品名:"饥饿腰带" 制造描述:"保持肚子不饿。"
		ORANGEAMULET = "就算可以穿梭各地，也找不到悠",		-- 物品名:"懒人护符" 制造描述:"适合那些不喜欢捡东西的人。"
		YELLOWSTAFF = "不知为何，感觉里面有一股热浪",		-- 物品名:"唤星者魔杖" 制造描述:"召唤一个小星星。"
		YELLOWGEM = "黄色的宝石，悠你看是不是很适合我？",		-- 物品名:"黄宝石"
		ORANGEGEM = "橙色的！悠你可以看一眼，就看一眼啊。",		-- 物品名:"橙宝石"
        OPALSTAFF = "悠，我要顶端这颗宝石！",		-- 物品名:"唤月者魔杖"
        OPALPRECIOUSGEM = "这个好漂亮！我要戴在头上！",		-- 物品名:"彩虹宝石"
        TELEBASE = 
		{
			VALID = "已经准备好出发了.",		-- 物品名:"传送焦点"->有效 制造描述:"装上宝石试试。"
			GEMS = "我需要更多地紫色宝石.",		-- 物品名:"传送焦点"->需要宝石 制造描述:"装上宝石试试。"
		},
		GEMSOCKET = 
		{
			VALID = "浪费。",		-- 物品名:"宝石底座"->有效
			GEMS = "有宝石也不给你。",		-- 物品名:"宝石底座"->需要宝石
		},
		STAFFLIGHT = "好热，离远点.",		-- 物品名:"矮人之星"
        STAFFCOLDLIGHT = "好凉快……好像有点冷",		-- 物品名:"极光"
        ANCIENT_ALTAR = "故弄玄虚.",		-- 物品名:"远古伪科学站"
        ANCIENT_ALTAR_BROKEN = "不能用。",		-- 物品名:"损坏的远古伪科学站"
        ANCIENT_STATUE = "什么品位",		-- 物品名:"远古雕像"
        LICHEN = "滑，难吃",		-- 物品名:"洞穴苔藓"
		CUTLICHEN = "有营养,但是不可长时间保存.",		-- 物品名:"苔藓"
		CAVE_BANANA = "悠，这香蕉我们没见过啊.",		-- 物品名:"洞穴香蕉"
		CAVE_BANANA_COOKED = "好吃!",		-- 物品名:"烤香蕉"
		CAVE_BANANA_TREE = "悠，我要吃香蕉船.",		-- 物品名:"洞穴香蕉树"
		ROCKY = "很安全，悠不会喜欢这样的",		-- 物品名:"石虾"
		COMPASS =
		{
			GENERIC="你能带我找到悠吗",		-- 物品名:"指南针"->默认 制造描述:"指向北方。"
			N = "北边.",		-- 物品名:"指南针" 制造描述:"指向北方。"
			S = "南边.",		-- 物品名:"指南针" 制造描述:"指向北方。"
			E = "东边.",		-- 物品名:"指南针" 制造描述:"指向北方。"
			W = "西边.",		-- 物品名:"指南针" 制造描述:"指向北方。"
			NE = "东北方向.",		-- 物品名:"指南针" 制造描述:"指向北方。"
			SE = "东南方向.",		-- 物品名:"指南针" 制造描述:"指向北方。"
			NW = "西北方向.",		-- 物品名:"指南针" 制造描述:"指向北方。"
			SW = "西南方向.",		-- 物品名:"指南针" 制造描述:"指向北方。"
		},
        HOUNDSTOOTH = "悠要是被咬一口……太可怕了",		-- 物品名:"犬牙"
        ARMORSNURTLESHELL = "我才不要戴这个东西",		-- 物品名:"蜗壳护甲"
        BAT = "滚开啊！滚开！",		-- 物品名:"洞穴蝙蝠"
        BATBAT = "邪恶的武器",		-- 物品名:"蝙蝠棒" 制造描述:"所有科技都如此...耗费精神。"
        BATWING = "死了还是很讨厌。",		-- 物品名:"洞穴蝙蝠翅膀"
        BATWING_COOKED = "别再来了。",		-- 物品名:"烤蝙蝠翅膀"
        BATCAVE = "我才不想吵醒他们.",		-- 物品名:"蝙蝠洞"
        BEDROLL_FURRY = "悠，我们一起睡",		-- 物品名:"毛皮铺盖" 制造描述:"舒适地一觉睡到天亮！"
        BUNNYMAN = "你也不许靠近悠",		-- 物品名:"兔人"
        FLOWER_CAVE = "等找到了悠，我们就在这里数星星",		-- 物品名:"荧光花"
        GUANO = "就算是鸟的，也很恶心",		-- 物品名:"鸟粪"
        LANTERN = "打着灯笼也找不到悠",		-- 物品名:"提灯" 制造描述:"可加燃料、明亮、便携！"
        LIGHTBULB = "有趣",		-- 物品名:"荧光果"
        MANRABBIT_TAIL = "摸一摸",		-- 物品名:"兔绒"
        MUSHROOMHAT = "我不要绿色的！",		-- 物品名:"蘑菇帽"
        MUSHROOM_LIGHT2 =
        {
            ON = "这是我喜欢的颜色，悠你看怎么样？",		-- 物品名:"菌伞灯"->开启 制造描述:"受到火山岩浆灯饰学问的激发。"
            OFF = "不亮了，有点寂寞",		-- 物品名:"菌伞灯"->关闭 制造描述:"受到火山岩浆灯饰学问的激发。"
            BURNT = "我的，彩色菇灯，怎么会！！",		-- 物品名:"菌伞灯"->烧焦的 制造描述:"受到火山岩浆灯饰学问的激发。"
        },
        MUSHROOM_LIGHT =
        {
            ON = "悠，我们的家里有一个菇灯",		-- 物品名:"蘑菇灯"->开启 制造描述:"任何蘑菇的完美添加物。"
            OFF = "打开一下看看",		-- 物品名:"蘑菇灯"->关闭 制造描述:"任何蘑菇的完美添加物。"
            BURNT = "我的，我的菇灯啊……",		-- 物品名:"蘑菇灯"->烧焦的 制造描述:"任何蘑菇的完美添加物。"
        },
        SLEEPBOMB = "我能保护自己了",		-- 物品名:"睡袋" 制造描述:"可以扔掉的袋子睡意沉沉。"
        MUSHROOMBOMB = "用这个就可以保护自己了",		-- 物品名:"炸弹蘑菇"
        SHROOM_SKIN = "这皮……好恶心",		-- 物品名:"蘑菇皮"
        TOADSTOOL_CAP =
        {
            EMPTY = "空的。",		-- 物品名:"毒菌蟾蜍"
            INGROUND = "不对劲，悠，我们快离开这",		-- 物品名:"毒菌蟾蜍"->在地里面
            GENERIC = "相当危险",		-- 物品名:"毒菌蟾蜍"->默认
        },
        TOADSTOOL =
        {
            GENERIC = "我的头发好像沾了点毒气，啊！！！",		-- 物品名:"毒菌蟾蜍"->默认
            RAGE = "你，你别过来，你太丑了！！",		-- 物品名:"毒菌蟾蜍"->愤怒
        },
        MUSHROOMSPROUT =
        {
            GENERIC = "悠，我连蘑菇都能种出来了！",		-- 物品名:"孢子帽"->默认
            BURNT = "我的，我的蘑菇……",		-- 物品名:"孢子帽"->烧焦的
        },
        MUSHTREE_TALL =
        {
            GENERIC = "大蘑菇？",		-- 物品名:"蓝蘑菇树"->默认
            BLOOM = "不想吃蘑菇",		-- 物品名:"蓝蘑菇树"->蘑菇树繁殖？？
        },
        MUSHTREE_MEDIUM =
        {
            GENERIC = "没用的树",		-- 物品名:"红蘑菇树"->默认
            BLOOM = "我的力气……摘不下来.",		-- 物品名:"红蘑菇树"->蘑菇树繁殖？？
        },
        MUSHTREE_SMALL =
        {
            GENERIC = "摘不下的绿帽子",		-- 物品名:"绿蘑菇树"->默认
            BLOOM = "我可不能像你一样忍耐着绿帽子.",		-- 物品名:"绿蘑菇树"->蘑菇树繁殖？？
        },
        MUSHTREE_TALL_WEBBED = "蜘蛛认为这是很重要的.",		-- 物品名:"蛛网蓝蘑菇树"
        SPORE_TALL =
        {
            GENERIC = "孢子的尾巴在这里…….",		-- 物品名:"蓝色孢子"->默认
            HELD = "能在包里放多久呢？",		-- 物品名:"蓝色孢子"->拿在手里
        },
        SPORE_MEDIUM =
        {
            GENERIC = "悠？啊，只是孢子而已",		-- 物品名:"红色孢子"->默认
            HELD = "兜里亮闪闪的",		-- 物品名:"红色孢子"->拿在手里
        },
        SPORE_SMALL =
        {
            GENERIC = "呀！啊，原来不是蚊子",		-- 物品名:"绿色孢子"->默认
            HELD = "你会长成蘑菇？",		-- 物品名:"绿色孢子"->拿在手里
        },
        RABBITHOUSE =
        {
            GENERIC = "大胡萝卜",		-- 物品名:"兔屋"->默认 制造描述:"可容纳一只巨大的兔子及其所有物品。"
            BURNT = "塞不进锅里",		-- 物品名:"兔屋"->烧焦的 制造描述:"可容纳一只巨大的兔子及其所有物品。"
        },
        SLURTLE = "你真怂……像我一样。",		-- 物品名:"蛞蝓龟"
        SLURTLE_SHELLPIECES = "好像有什么特殊含义",		-- 物品名:"壳碎片"
        SLURTLEHAT = "好大的壳，能把我的头发塞进去",		-- 物品名:"背壳头盔"
        SLURTLEHOLE = "光是缩进壳里还不够吗",		-- 物品名:"蛞蝓龟窝"
        SLURTLESLIME = "黏糊糊的，我才不碰",		-- 物品名:"蛞蝓龟黏液"
        SNURTLE = "他不算很恶心,但还是恶心",		-- 物品名:"蜗牛龟"
        SPIDER_HIDER = "这蜘蛛长得更丑了！！",		-- 物品名:"洞穴蜘蛛"
        SPIDER_SPITTER = "蜘蛛——滚，开，啊！！",		-- 物品名:"喷射蜘蛛"
        SPIDERHOLE = "里面住着肯定很丑的家伙，我离远点吧",		-- 物品名:"蛛网岩"
        SPIDERHOLE_ROCK = "把有年岁的带子镶在上面.",		-- 物品名:"兔屋" 制造描述:"可容纳一只巨大的兔子及其所有物品。"
        STALAGMITE = "悠，帮我敲掉它",		-- 物品名:"石笋"
        STALAGMITE_TALL = "石头,石头,石头,石头......",		-- 物品名:"石笋"
        TURF_CARPETFLOOR = "家中必备",		-- 物品名:"地毯地板" 制造描述:"超级柔软。闻着就像皮弗娄牛。"
        TURF_CHECKERFLOOR = "悠，这地毯如何？",		-- 物品名:"棋盘地板" 制造描述:"精心制作成棋盘状的大理石地砖。"
        TURF_DIRT = "苍穹之下，属你最脏",		-- 物品名:"泥土地皮"
        TURF_FOREST = "森林，在苍穹下铺展",		-- 物品名:"森林地皮" 制造描述:"一块森林地皮。"
        TURF_GRASS = "长草，在苍穹之下起舞",		-- 物品名:"长草地皮" 制造描述:"一片草地。"
        TURF_MARSH = "沼泽，苍穹之下的阴影",		-- 物品名:"沼泽地皮" 制造描述:"沼泽在哪，家就在哪！"
        TURF_METEOR = "是苍穹的碎片吗。",		-- 物品名:"月球环形山地皮" 制造描述:"月球表面的月坑。"
        TURF_PEBBLEBEACH = "看起来不错",		-- 物品名:"岩石海滩地皮" 制造描述:"一块鹅卵石海滩地皮。"
        TURF_ROAD = "鹅卵石，苍穹之下劳碌的人",		-- 物品名:"卵石路" 制造描述:"修建你自己的道路，通往任何地方。"
        TURF_ROCKY = "岩石，在苍穹之下风华",		-- 物品名:"岩石地皮" 制造描述:"一块石头地皮。"
        TURF_SAVANNA = "草原，与苍穹相对",		-- 物品名:"热带草原地皮" 制造描述:"一块热带草原地皮。"
        TURF_WOODFLOOR = "家在脚下",		-- 物品名:"木地板" 制造描述:"优质复合地板。"
		TURF_CAVE="看不到苍穹的地块",		-- 物品名:"鸟粪地皮" 制造描述:"洞穴地面冰冷的岩石。"
		TURF_FUNGUS="菌类，躲避着苍穹",		-- 物品名:"菌类地皮" 制造描述:"一块长满了真菌的洞穴地皮。"
		TURF_FUNGUS_MOON = "充满月光的味道",		-- 物品名:"变异菌类地皮" 制造描述:"一块长满了变异真菌的洞穴地皮。"
		TURF_ARCHIVE = "历史感",		-- 物品名:"远古石刻"
		TURF_SINKHOLE="淤泥，在苍穹之下聚集",		-- 物品名:"黏滑地皮" 制造描述:"一块潮湿、沾满泥巴的草地地皮。"
		TURF_UNDERROCK="不曾见过苍穹的大地",		-- 物品名:"洞穴岩石地皮" 制造描述:"一块乱石嶙峋的洞穴地皮。"
		TURF_MUD="泥地，在苍穹之下延展",		-- 物品名:"泥泞地皮" 制造描述:"一块泥地地皮。"
		TURF_DECIDUOUS = "草地，在苍穹下变色",		-- 物品名:"桦树地皮" 制造描述:"一块桦树森林地皮。"
		TURF_SANDY = "沙滩！阳光！苍穹！",		-- 物品名:"兔屋" 制造描述:"可容纳一只巨大的兔子及其所有物品。"
		TURF_BADLANDS = "又是一种新地形",		-- 物品名:"兔屋" 制造描述:"可容纳一只巨大的兔子及其所有物品。"
		TURF_DESERTDIRT = "肮脏的地皮.",		-- 物品名:"沙漠地皮" 制造描述:"一片干燥的沙子。"
		TURF_FUNGUS_GREEN = "绿菌，不是青霉菌，对我的病没有帮助.",		-- 物品名:"菌类地皮" 制造描述:"一块爬满绿菌的洞穴地皮。"
		TURF_FUNGUS_RED = "红菌，在苍穹之下远征",		-- 物品名:"菌类地皮" 制造描述:"一块爬满红菌的洞穴地皮。"
		TURF_DRAGONFLY = "脚下冒着热气",		-- 物品名:"龙鳞地板" 制造描述:"消除火灾蔓延速度。"
		POWCAKE = "我想吃这个，但是悠说这个不健康。",		-- 物品名:"芝士蛋糕"
        CAVE_ENTRANCE = "碎石堆",		-- 物品名:"被堵住的洞穴"
        CAVE_ENTRANCE_RUINS = "悠会不会困在这里？",		-- 物品名:"被堵住的陷洞"->单机 洞二入口
       	CAVE_ENTRANCE_OPEN = 
        {
            GENERIC = "我，我不想进去……",		-- 物品名:"洞穴"->默认
            OPEN = "悠，你在这里面吗？",		-- 物品名:"洞穴"->打开
            FULL = "有人在里面？那我就不用去了吧……",		-- 物品名:"洞穴"->满了
        },
        CAVE_EXIT = 
        {
            GENERIC = "我要回家.",		-- 物品名:"楼梯"->默认
            OPEN = "爬这个好累.",		-- 物品名:"楼梯"->打开
            FULL = "上面你快上去啊！我！要！回！家！",		-- 物品名:"楼梯"->满了
        },
		MAXWELLPHONOGRAPH = "好吵，怎么关掉",		-- 物品名:"麦斯威尔的留声机"->单机 麦斯威尔留声机
		BOOMERANG = "太危险了",		-- 物品名:"回旋镖" 制造描述:"来自澳洲土著。"
		PIGGUARD = "你凶我？那你肯定也会凶悠吧",		-- 物品名:"猪人守卫"
		ABIGAIL =
		{
            LEVEL1 =
            {
                "",		-- 物品名:未找到 制造描述:未找到
                "",		-- 物品名:未找到 制造描述:未找到
            },
            LEVEL2 = 
            {
                "",		-- 物品名:未找到 制造描述:未找到
                "",		-- 物品名:未找到 制造描述:未找到
            },
            LEVEL3 = 
            {
                "",		-- 物品名:未找到 制造描述:未找到
                "",		-- 物品名:未找到 制造描述:未找到
            },
		},
		ADVENTURE_PORTAL = "我不想再一次上当了",		-- 物品名:"麦斯威尔之门"->单机 麦斯威尔之门
		AMULET = "像悠一样守护我",		-- 物品名:"重生护符" 制造描述:"逃离死神的魔爪。"
		ANIMAL_TRACK = "是悠！他在这附近吗？",		-- 物品名:"动物足迹"
		ARMORGRASS = "蚊子更多了！",		-- 物品名:"草甲" 制造描述:"提供少许防护。"
		ARMORMARBLE = "好重，我穿不了的",		-- 物品名:"大理石甲" 制造描述:"它很重，但能够保护你。"
		ARMORWOOD = "真的要穿这么丑的东西吗",		-- 物品名:"木甲" 制造描述:"为你抵御部分伤害。"
		ARMOR_SANITY = "你不能像悠一样给我安全感",		-- 物品名:"魂甲" 制造描述:"保护你的躯体，但无法保护你的心智。"
		ASH =
		{
			GENERIC = "消逝了",		-- 物品名:"灰烬"->默认
			REMAINS_GLOMMERFLOWER = "花烧掉了",		-- 物品名:"灰烬"->单机专用
			REMAINS_EYE_BONE = "什么？眼球……烧掉了？",		-- 物品名:"灰烬"->单机专用
			REMAINS_THINGIE = "什么烧毁了？",		-- 物品名:"灰烬"->单机专用
		},
		AXE = "好重。",		-- 物品名:"斧头" 制造描述:"砍倒树木！"
		BABYBEEFALO = 
		{
			GENERIC = "宝宝也有这么大的味道吗",		-- 物品名:"小皮弗娄牛"->默认
		    SLEEPING = "不要打鼾啊",		-- 物品名:"小皮弗娄牛"->睡着了
        },
        BUNDLE = "这让我想到悠做的料理!",		-- 物品名:"捆绑物资"
        BUNDLEWRAP = "我不想学做手工活",		-- 物品名:"捆绑包装" 制造描述:"打包你的东西的部分和袋子。"
		BACKPACK = "我……背不动这么多",		-- 物品名:"背包" 制造描述:"携带更多物品。"
		BACONEGGS = "好丰盛啊，悠.",		-- 物品名:"培根煎蛋"
		BANDAGE = "悠，别受伤了",		-- 物品名:"蜂蜜药膏" 制造描述:"愈合小伤口。"
		BASALT = "它太坚硬了,无法打破!",		-- 物品名:"玄武岩"
		BEARDHAIR = "好丑。悠你不会长吧",		-- 物品名:"胡子"
		BEARGER = "熊獾好烦熊獾好烦熊獾好烦熊獾好烦熊獾好烦熊獾好烦熊獾好烦熊獾好烦",		-- 物品名:"熊獾"
		BEARGERVEST = "不想吃饭了……不是在耍脾气啊",		-- 物品名:"熊皮背心" 制造描述:"熊皮背心。"
		ICEPACK = "冰棍也不会化",		-- 物品名:"保鲜背包" 制造描述:"容量虽小，但能保持东西新鲜。"
		BEARGER_FUR = "叫你吃。",		-- 物品名:"熊皮" 制造描述:"毛皮再生。"
		BEDROLL_STRAW = "我不要睡在这里。",		-- 物品名:"草席卷" 制造描述:"一觉睡到天亮。"
		BEEQUEEN = "坐下！把蜜给我们！",		-- 物品名:"蜂王"
		BEEQUEENHIVE = 
		{
			GENERIC = "这里好甜，我该不该弄点蜜呢",		-- 物品名:"蜂蜜地块"->默认
			GROWING = "悠，这里有好多蜜啊！",		-- 物品名:"蜂蜜地块"->正在生长
		},
        BEEQUEENHIVEGROWN = "好多好多的蜜，悠，我们一起取蜜啊。",		-- 物品名:"巨大蜂窝"
        BEEGUARD = "蚊子一样的烦死了！把蜜交出来！",		-- 物品名:"嗡嗡蜜蜂"
        HIVEHAT = "向我鞠躬！悠只属于我一个人！",		-- 物品名:"蜂王冠"
        MINISIGN =
        {
            GENERIC = "我该把悠再画一遍",		-- 物品名:"小木牌"->默认
            UNDRAWN = "画个悠的帅照吧",		-- 物品名:"小木牌"->没有画画
        },
        MINISIGN_ITEM = "谁啊，怎么乱放。",		-- 物品名:"小木牌" 制造描述:"用羽毛笔在这些上面画画。"
		BEE =
		{
			GENERIC = "像蚊子一样，离我远点",		-- 物品名:"蜜蜂"->默认
			HELD = "和蚊子不一样",		-- 物品名:"蜜蜂"->拿在手里
		},
		BEEBOX =
		{
			READY = "我去采蜜，悠你等着吧~",		-- 物品名:"蜂箱"->准备好的 满的 制造描述:"贮存你自己的蜜蜂。"
			FULLHONEY = "有蜂蜜了",		-- 物品名:"蜂箱"->蜂蜜满了 制造描述:"贮存你自己的蜜蜂。"
			GENERIC = "蜂蜜来自于此",		-- 物品名:"蜂箱"->默认 制造描述:"贮存你自己的蜜蜂。"
			NOHONEY = "快去采蜜",		-- 物品名:"蜂箱"->没有蜂蜜 制造描述:"贮存你自己的蜜蜂。"
			SOMEHONEY = "有收获了",		-- 物品名:"蜂箱"->有一些蜂蜜 制造描述:"贮存你自己的蜜蜂。"
			BURNT = "没有蜜了",		-- 物品名:"蜂箱"->烧焦的 制造描述:"贮存你自己的蜜蜂。"
		},
		MUSHROOM_FARM =
		{
			STUFFED = "悠你看，好多蘑菇啊！",		-- 物品名:"蘑菇农场"->塞，满了？？ 制造描述:"种蘑菇。"
			LOTS = "其实我自己都不敢相信，我真的能种蘑菇",		-- 物品名:"蘑菇农场"->很多 制造描述:"种蘑菇。"
			SOME = "悠，你要几个蘑菇？",		-- 物品名:"蘑菇农场"->有一些 制造描述:"种蘑菇。"
			EMPTY = "悠你看着，我要种出蘑菇来",		-- 物品名:"蘑菇农场" 制造描述:"种蘑菇。"
			ROTTEN = "红蘑菇，蓝蘑菇，绿蘑菇……哎，怎么不长蘑菇？",		-- 物品名:"蘑菇农场"->腐烂的--需要活木 制造描述:"种蘑菇。"
			BURNT = "把悠夺走了，把我的蘑菇也夺走了……",		-- 物品名:"蘑菇农场"->烧焦的 制造描述:"种蘑菇。"
			SNOWCOVERED = "你和我一样怕冷啊",		-- 物品名:"蘑菇农场"->被雪覆盖 制造描述:"种蘑菇。"
		},
		BEEFALO =
		{
			FOLLOWER = "家牛",		-- 物品名:"皮弗娄牛"->追随者
			GENERIC = "大牛",		-- 物品名:"皮弗娄牛"->默认
			NAKED = "秃牛",		-- 物品名:"皮弗娄牛"->牛毛被刮干净了
			SLEEPING = "懒牛",		-- 物品名:"皮弗娄牛"->睡着了
            DOMESTICATED = "每天刷一遍，闻起来好多了",		-- 物品名:"皮弗娄牛"->驯化牛
            ORNERY = "见到悠可不许凶，懂吗？",		-- 物品名:"皮弗娄牛"->战斗牛
            RIDER = "等一下我们要去找悠，动吗",		-- 物品名:"皮弗娄牛"->骑行牛
            PUDGY = "你不要咬我的头发！",		-- 物品名:"皮弗娄牛"->胖牛
            MYPARTNER = "起码我们俩可以互相作伴。",		-- 物品名:"皮弗娄牛"
		},
		BEEFALOHAT = "还是有味道.",		-- 物品名:"牛角帽" 制造描述:"成为牛群中的一员！连气味也变得一样。"
		BEEFALOWOOL = "还好校服不是这个做的，味道好重",		-- 物品名:"牛毛"
		BEEHAT = "把蚊帐戴在头上",		-- 物品名:"养蜂帽" 制造描述:"防止被愤怒的蜜蜂蜇伤。"
        BEESWAX = "淡淡的甜味……冰起来可以吃吗？",		-- 物品名:"蜂蜡" 制造描述:"一种有用的防腐蜂蜡。"
		BEEHIVE = "忙碌",		-- 物品名:"蜂窝"
		BEEMINE = "这不是蚊子，是蜜蜂。不是蚊子，是蜜蜂。是蜜蜂……别叫了你们",		-- 物品名:"蜜蜂地雷" 制造描述:"变成武器的蜜蜂。会出什么问题？"
		BEEMINE_MAXWELL = "离我远点",		-- 物品名:"麦斯威尔的蚊子陷阱"->单机 麦斯威尔的蚊子陷阱
		BERRIES = "草莓棒冰是这个味道",		-- 物品名:"浆果"
		BERRIES_COOKED = "冻起来就是草莓冰棒了吧",		-- 物品名:"烤浆果"
        BERRIES_JUICY = "好甜，我喜欢这个！但是太难保存了，没法给悠留一份",		-- 物品名:"多汁浆果"
        BERRIES_JUICY_COOKED = "甜香的味道在空气中弥漫，不给悠留了！",		-- 物品名:"烤多汁浆果"
		BERRYBUSH =
		{
			BARREN = "没有浆果了吗？",		-- 物品名:"浆果丛"
			WITHERED = "我讨厌夏天！！",		-- 物品名:"浆果丛"->枯萎了
			GENERIC = "红色浆果，草莓冰棒",		-- 物品名:"浆果丛"->默认
			PICKED = "快点长出来，我想吃",		-- 物品名:"浆果丛"->被采完了
			DISEASED = "这果子不能吃了……",		-- 物品名:"浆果丛"->生病了
			DISEASING = "怎么回事？奇怪的味道",		-- 物品名:"浆果丛"->正在生病？？
			BURNING = "那么多汁也会烧着吗！！",		-- 物品名:"浆果丛"->正在燃烧
		},
		BERRYBUSH_JUICY =
		{
			BARREN = "悠，它好像不长了，怎么办？",		-- 物品名:"多汁浆果丛"
			WITHERED = "我的浆果啊，讨厌的夏天，讨厌讨厌讨厌！",		-- 物品名:"多汁浆果丛"->枯萎了
			GENERIC = "甜甜的浆果，超好吃的。",		-- 物品名:"多汁浆果丛"->默认
			PICKED = "我要那个浆果，快点长大！",		-- 物品名:"多汁浆果丛"->被采完了
			DISEASED = "悠，它怎么变成这样了？",		-- 物品名:"多汁浆果丛"->生病了
			DISEASING = "悠，你看看这是怎么了。",		-- 物品名:"多汁浆果丛"->正在生病？？
			BURNING = "不要啊！我的浆果啊！",		-- 物品名:"多汁浆果丛"->正在燃烧
		},
		BIGFOOT = "大大大脚.",		-- 物品名:"大脚怪"->单机 大脚怪
		BIRDCAGE =
		{
			GENERIC = "鸟的家",		-- 物品名:"鸟笼"->默认 制造描述:"为你的鸟类朋友提供一个幸福的家。"
			OCCUPIED = "它只能凝望着苍穹",		-- 物品名:"鸟笼"->被占领 制造描述:"为你的鸟类朋友提供一个幸福的家。"
			SLEEPING = "它睡了",		-- 物品名:"鸟笼"->睡着了 制造描述:"为你的鸟类朋友提供一个幸福的家。"
			HUNGRY = "它饥了",		-- 物品名:"鸟笼"->有点饿了 制造描述:"为你的鸟类朋友提供一个幸福的家。"
			STARVING = "它饿了",		-- 物品名:"鸟笼"->挨饿 制造描述:"为你的鸟类朋友提供一个幸福的家。"
			DEAD = "也许他只是在休息？",		-- 物品名:"鸟笼"->死了 制造描述:"为你的鸟类朋友提供一个幸福的家。"
			SKELETON = "它死了",		-- 物品名:"骷髅"
		},
		BIRDTRAP = "苍穹的出口在这里",		-- 物品名:"捕鸟陷阱" 制造描述:"捕捉会飞的动物。"
		CAVE_BANANA_BURNT = "没有香蕉了",		-- 物品名:"鸟笼"->烧焦的洞穴香蕉树 制造描述:"为你的鸟类朋友提供一个幸福的家。"
		BIRD_EGG = "它是怎么变成蛋糕的？",		-- 物品名:"鸟蛋"
		BIRD_EGG_COOKED = "这个我还是能做给悠吃的",		-- 物品名:"煎蛋"
		BISHOP = "你好吵",		-- 物品名:"发条主教"
		BLOWDART_FIRE = "它会烧了我的房子的",		-- 物品名:"火焰吹箭" 制造描述:"向你的敌人喷火。"
		BLOWDART_SLEEP = "不要吸进去",		-- 物品名:"催眠吹箭" 制造描述:"催眠你的敌人。"
		BLOWDART_PIPE = "野蛮。",		-- 物品名:"吹箭" 制造描述:"向你的敌人喷射利齿。"
		BLOWDART_YELLOW = "有了它，我也可以保护悠了",		-- 物品名:"雷电吹箭" 制造描述:"朝你的敌人放闪电。"
		BLUEAMULET = "让夏天远离我",		-- 物品名:"寒冰护符" 制造描述:"多么冰冷酷炫的护符。"
		BLUEGEM = "它闪着冰冷能量的光",		-- 物品名:"蓝宝石"
		BLUEPRINT = 
		{ 
            COMMON = "好像没什么特别的，我应该也可以很容易学会吧",		-- 物品名:"蓝图"
            RARE = "好高深，如果我学会这个的话……",		-- 物品名:"蓝图"->罕见的
        },
        SKETCH = "美术教材，讨厌。",		-- 物品名:"{item}草图"
		BLUE_CAP = "黏糊糊的，不喜欢",		-- 物品名:"采摘的蓝蘑菇"
		BLUE_CAP_COOKED = "现在不同了......",		-- 物品名:"烤蓝蘑菇"
		BLUE_MUSHROOM =
		{
			GENERIC = "看着就没法吃",		-- 物品名:"蓝蘑菇"->默认
			INGROUND = "蘑菇也这么懒",		-- 物品名:"蓝蘑菇"->在地里面
			PICKED = "你也向往蓝天吗",		-- 物品名:"蓝蘑菇"->被采完了
		},
		BOARDS = "会变成家.",		-- 物品名:"木板" 制造描述:"更平直的木头。"
		BONESHARD = "不是悠的骨头，悠一定还安好.",		-- 物品名:"骨头碎片"
		BONESTEW = "能加点咖喱就好了",		-- 物品名:"炖肉汤"
		BUGNET = "我要把蚊子全都驱逐出去，一个不留",		-- 物品名:"捕虫网" 制造描述:"抓虫子用的。"
		BUSHHAT = "遮不住我的头发",		-- 物品名:"灌木丛帽" 制造描述:"很好的伪装！"
		BUTTER = "悠，这个真的是黄油？",		-- 物品名:"黄油"
		BUTTERFLY =
		{
			GENERIC = "悠，我想要蝴蝶",		-- 物品名:"蝴蝶"->默认
			HELD = "我自己也能抓到",		-- 物品名:"蝴蝶"->拿在手里
		},
		BUTTERFLYMUFFIN = "好像八寻的甜品店里有这个",		-- 物品名:"蝴蝶松饼"
		BUTTERFLYWINGS = "有些粉末",		-- 物品名:"蝴蝶翅膀"
		BUZZARD = "你不会抢我的雪糕吧",		-- 物品名:"秃鹫"
		SHADOWDIGGER = "别乱挖！",		-- 物品名:"蝴蝶"
		CACTUS = 
		{
			GENERIC = "看到你就感觉有些热",		-- 物品名:"仙人掌"->默认
			PICKED = "看起来不热了.",		-- 物品名:"仙人掌"->被采完了
		},
		CACTUS_MEAT_COOKED = "解暑的叶肉",		-- 物品名:"烤仙人掌肉"
		CACTUS_MEAT = "好多刺",		-- 物品名:"仙人掌肉"
		CACTUS_FLOWER = "看着就热",		-- 物品名:"仙人掌花"
		COLDFIRE =
		{
			EMBERS = "不好，热意回来了",		-- 物品名:"吸热篝火"->即将熄灭 制造描述:"这火是越烤越冷的冰火。"
			GENERIC = "一次性的风扇",		-- 物品名:"吸热篝火"->默认 制造描述:"这火是越烤越冷的冰火。"
			HIGH = "是不是有点冷",		-- 物品名:"吸热篝火"->高 制造描述:"这火是越烤越冷的冰火。"
			LOW = "怎么感觉有点热了",		-- 物品名:"吸热篝火"->低？ 制造描述:"这火是越烤越冷的冰火。"
			NORMAL = "好！凉！快！啊！",		-- 物品名:"吸热篝火"->普通 制造描述:"这火是越烤越冷的冰火。"
			OUT = "好热！再点一个吧",		-- 物品名:"吸热篝火"->出去？外面？ 制造描述:"这火是越烤越冷的冰火。"
		},
		CAMPFIRE =
		{
			EMBERS = "不要熄灭啊，我讨厌黑暗",		-- 物品名:"营火"->即将熄灭 制造描述:"燃烧时发出光亮。"
			GENERIC = "悠在这里就好了",		-- 物品名:"营火"->默认 制造描述:"燃烧时发出光亮。"
			HIGH = "啊！燎到头发了",		-- 物品名:"营火"->高 制造描述:"燃烧时发出光亮。"
			LOW = "好暗",		-- 物品名:"营火"->低？ 制造描述:"燃烧时发出光亮。"
			NORMAL = "暖暖的，就像悠一样",		-- 物品名:"营火"->普通 制造描述:"燃烧时发出光亮。"
			OUT = "悠，我好想你",		-- 物品名:"营火"->出去？外面？ 制造描述:"燃烧时发出光亮。"
		},
		CANE = "我走不动了",		-- 物品名:"步行手杖" 制造描述:"泰然自若地快步走。"
		CATCOON = "厨艺比我烂",		-- 物品名:"浣猫"
		CATCOONDEN = 
		{
			GENERIC = "住这里？",		-- 物品名:"空心树桩"->默认
			EMPTY = "被事故摧毁的家庭",		-- 物品名:"空心树桩"
		},
		CATCOONHAT = "悠，我可爱吗",		-- 物品名:"猫帽" 制造描述:"适合那些重视温暖甚于朋友的人。"
		COONTAIL = "毛茸茸的.",		-- 物品名:"猫尾"
		CARROT = "咖喱必备",		-- 物品名:"胡萝卜"
		CARROT_COOKED = "悠的咖喱",		-- 物品名:"烤胡萝卜"
		CARROT_PLANTED = "我看到了咖喱",		-- 物品名:"胡萝卜"
		CARROT_SEEDS = "种出小玩意.",		-- 物品名:"椭圆形种子"
		CARTOGRAPHYDESK =
		{
			GENERIC = "画图画图……画图好讨厌",		-- 物品名:"制图桌"->默认 制造描述:"准确地告诉别人你去过哪里。"
			BURNING = "火……我反而有些开心",		-- 物品名:"制图桌"->正在燃烧 制造描述:"准确地告诉别人你去过哪里。"
			BURNT = "可以不用画图了",		-- 物品名:"制图桌"->烧焦的 制造描述:"准确地告诉别人你去过哪里。"
		},
		WATERMELON_SEEDS = "种出清凉的夏天",		-- 物品名:"方形种子"
		CAVE_FERN = "叶子.",		-- 物品名:"蕨类植物"
		CHARCOAL = "火灾的遗恨.",		-- 物品名:"木炭"
        CHESSPIECE_PAWN = "你能像悠一样保护我？",		-- 物品名:"卒子雕塑"
        CHESSPIECE_ROOK =
        {
            GENERIC = "我和它易位",		-- 物品名:"战车雕塑"->默认
            STRUGGLE = "怎么回事？悠，快来保护我！",		-- 物品名:"战车雕塑"->三基佬棋子晃动
        },
        CHESSPIECE_KNIGHT =
        {
            GENERIC = "如果我是公主，悠就是我的骑士",		-- 物品名:"骑士雕塑"->默认
            STRUGGLE = "怎么回事？别住他的腿……不对这是国际象棋！",		-- 物品名:"骑士雕塑"->三基佬棋子晃动
        },
        CHESSPIECE_BISHOP =
        {
            GENERIC = "我站在黑格，悠站在白格",		-- 物品名:"主教雕塑"->默认
            STRUGGLE = "动，动了！悠你快换个格子！",		-- 物品名:"主教雕塑"->三基佬棋子晃动
        },
        CHESSPIECE_MUSE = "皇后……不是冰淇淋吗？",		-- 物品名:"女王雕塑"
        CHESSPIECE_FORMAL = "抓住你就赢了，悠是这么教我的",		-- 物品名:"国王雕塑"
        CHESSPIECE_HORNUCOPIA = "悠，我要这个，能吃的那种",		-- 物品名:"丰饶角雕塑"
        CHESSPIECE_PIPE = "不怎么好看，尤其是抽烟的",		-- 物品名:"泡泡烟斗雕塑"
        CHESSPIECE_DEERCLOPS = "做成雕像还是一直盯着我",		-- 物品名:"独眼巨鹿雕塑"
        CHESSPIECE_BEARGER = "总感觉我的零食有危险",		-- 物品名:"熊獾雕塑"
        CHESSPIECE_MOOSEGOOSE =
        {
            "现在我可以允许你吃个浆果。",		-- 物品名:"麋鹿鹅雕塑" 制造描述:未找到
        },
        CHESSPIECE_DRAGONFLY = "看到这个就想吃棒冰了",		-- 物品名:"龙蝇雕塑"
		CHESSPIECE_MINOTAUR = "你在守护着什么",		-- 物品名:"远古守护者雕塑"
        CHESSPIECE_BUTTERFLY = "如梦似幻",		-- 物品名:"月蛾雕塑"
        CHESSPIECE_ANCHOR = "悠会带我去海上玩吗",		-- 物品名:"锚雕塑"
        CHESSPIECE_MOON = "悠，你在哪儿...",		-- 物品名:"“月亮” 雕塑"
        CHESSPIECE_CARRAT = "卡哇伊！",		-- 物品名:"胡萝卜鼠雕塑"
        CHESSPIECE_MALBATROSS = "邪?天?翁?不是信天翁?",		-- 物品名:"邪天翁雕塑"
        CHESSPIECE_CRABKING = "你的爱人还在等待你",		-- 物品名:"帝王蟹雕塑"
        CHESSPIECE_TOADSTOOL = "真懒,身上都长满了蘑菇",		-- 物品名:"毒菌蟾蜍雕塑"
        CHESSPIECE_STALKER = "黑暗侵蚀了你",		-- 物品名:"远古织影者雕塑"
        CHESSPIECE_KLAUS = "看你还敢不敢偷走我的东西",		-- 物品名:"克劳斯雕塑"
        CHESSPIECE_BEEQUEEN = "甜蜜的味道",		-- 物品名:"蜂王雕塑"
        CHESSPIECE_ANTLION = "现在不需要向你上供了",		-- 物品名:"蚁狮雕塑"
        CHESSJUNK1 = "一堆破烂",		-- 物品名:"损坏的发条装置"
        CHESSJUNK2 = "破铜烂铁.",		-- 物品名:"损坏的发条装置"
        CHESSJUNK3 = "一堆破铜烂铁.",		-- 物品名:"损坏的发条装置"
		CHESTER = "悠，把东西放在这里吧",		-- 物品名:"切斯特"
		CHESTER_EYEBONE =
		{
			GENERIC = "你也在看我？",		-- 物品名:"眼骨"->默认
			WAITING = "其实你可以看着我",		-- 物品名:"眼骨"->需要等待
		},
		COOKEDMANDRAKE = "或许可以救我一命",		-- 物品名:"烤曼德拉草"
		COOKEDMEAT = "比悠的手艺差远了",		-- 物品名:"烤大肉"
		COOKEDMONSTERMEAT = "悠，快把这个扔掉",		-- 物品名:"烤怪物肉"
		COOKEDSMALLMEAT = "是烤肉啊，悠",		-- 物品名:"烤小肉"
		COOKPOT =
		{
			COOKING_LONG = "让悠见识我的手艺……",		-- 物品名:"烹饪锅"->饭还需要很久 制造描述:"制作更好的食物。"
			COOKING_SHORT = "会出来什么呢？",		-- 物品名:"烹饪锅"->饭快做好了 制造描述:"制作更好的食物。"
			DONE = "悠，来尝尝",		-- 物品名:"烹饪锅"->完成了 制造描述:"制作更好的食物。"
			EMPTY = "我该学一学烹饪技巧",		-- 物品名:"烹饪锅" 制造描述:"制作更好的食物。"
			BURNT = "悠，对不起…….",		-- 物品名:"烹饪锅"->烧焦的 制造描述:"制作更好的食物。"
		},
		CORN = "放进雪糕里吧",		-- 物品名:"玉米"
		CORN_COOKED = "悠不在，自己做爆米花",		-- 物品名:"爆米花"
		CORN_SEEDS = "种出主食",		-- 物品名:"簇状种子"
        CANARY =
		{
			GENERIC = "悠，这里有一只唱歌的鸟",		-- 物品名:"金丝雀"->默认
			HELD = "它好像不太开心……",		-- 物品名:"金丝雀"->拿在手里
		},
        CANARY_POISONED = "像我一样，在生死之间奋力挣扎着……",		-- 物品名:"金丝雀（中毒）"
		CRITTERLAB = "悠，我要养一只宠物",		-- 物品名:"岩石巢穴"
        CRITTER_GLOMLING = "抱歉,我需要你的翅膀",		-- 物品名:"小格罗姆"
        CRITTER_DRAGONLING = "你也会发火吗",		-- 物品名:"小龙蝇"
		CRITTER_LAMB = "毛茸茸的",		-- 物品名:"小钢羊"
        CRITTER_PUPPY = "诶？你是狼王?",		-- 物品名:"小座狼"
        CRITTER_KITTEN = "我更喜欢我的兔子",		-- 物品名:"小浣猫"
        CRITTER_PERDLING = "唔,你会下蛋吗",		-- 物品名:"小火鸡"
		CRITTER_LUNARMOTHLING = "莹莹微光,终会照亮世界",		-- 物品名:"小蛾子"
		CROW =
		{
			GENERIC = "黑色的羽翼翱翔在苍穹之下",		-- 物品名:"乌鸦"->默认
			HELD = "你再也无法触摸苍穹",		-- 物品名:"乌鸦"->拿在手里
		},
		CUTGRASS = "悠会给我做个草帽吧",		-- 物品名:"采下的草"
		CUTREEDS = "坚韧。",		-- 物品名:"采下的芦苇"
		CUTSTONE = "我居然能拿得动？",		-- 物品名:"石砖" 制造描述:"切成正方形的石头。"
		DEADLYFEAST = "看着就不好吃，倒掉吧。",		-- 物品名:"致命的盛宴"->致命盛宴 单机
		DEER =
		{
			GENERIC = "你肯定没看见悠",		-- 物品名:"无眼鹿"->默认
			ANTLER = "悠，你看着像不像钥匙？",		-- 物品名:"无眼鹿"
		},
        DEER_ANTLER = "这个……或许能打开包裹？给悠准备什么礼物好呢",		-- 物品名:"鹿角"
        DEER_GEMMED = "你脖子上的宝石现在属于悠了",		-- 物品名:"无眼鹿"
		DEERCLOPS = "别盯着我看，我没穿泳装",		-- 物品名:"独眼巨鹿"
		DEERCLOPS_EYEBALL = "你怎么还是盯着我",		-- 物品名:"独眼巨鹿眼球"
		EYEBRELLAHAT =	"它望着苍穹，替悠守护我.",		-- 物品名:"眼球伞" 制造描述:"面向天空的眼球让你保持干燥。"
		DEPLETED_GRASS =
		{
			GENERIC = "枯竭了",		-- 物品名:"草"->默认
		},
        GOGGLESHAT = "悠，你看我是不是很时尚？",		-- 物品名:"时髦的护目镜" 制造描述:"你可以瞪大眼睛看装饰性护目镜。"
        DESERTHAT = "不怕风沙了，可是依然很热啊",		-- 物品名:"沙漠护目镜" 制造描述:"从你的眼睛里把沙子揉出来。"
		DIRTPILE = "会不会有悠的线索？",		-- 物品名:"可疑的土堆"
		DIVININGROD =
		{
			COLD = "信号很模糊.",		-- 物品名:"冻伤"->冷了
			GENERIC = "看起来像一种制导装置.",		-- 物品名:"探测杖"->默认 制造描述:"肯定有方法可以离开这里..."
			HOT = "我控制不住这东西了!",		-- 物品名:"中暑"->热了
			WARM = "我正在向正确的方向走呢.",		-- 物品名:"探测杖"->温暖 制造描述:"肯定有方法可以离开这里..."
			WARMER = "我现在已经很接近了",		-- 物品名:"探测杖" 制造描述:"肯定有方法可以离开这里..."
		},
		DIVININGRODBASE =
		{
			GENERIC = "我很奇怪它到底能做什么.",		-- 物品名:"探测杖底座"->默认
			READY = "看起来我们需要一个更大的钥匙了.",		-- 物品名:"探测杖底座"->准备好的 满的
			UNLOCKED = "现在我的机器可以工作了!",		-- 物品名:"探测杖底座"->解锁了
		},
		DIVININGRODSTART = "这个棒子看起来很有用啊!",		-- 物品名:"探测杖底座"->单机探测杖底座
		DRAGONFLY = "还好你不是蚊子，不然就太讨厌了",		-- 物品名:"龙蝇"
		ARMORDRAGONFLY = "奇怪，不觉得热了",		-- 物品名:"鳞甲" 制造描述:"脾气火爆的盔甲。"
		DRAGON_SCALES = "悠，你看这个好漂亮.",		-- 物品名:"鳞片"
		DRAGONFLYCHEST = "存放我和悠的回忆",		-- 物品名:"龙鳞宝箱" 制造描述:"一种结实且防火的容器。"
		DRAGONFLYFURNACE = 
		{
			HAMMERED = "拆了之后就凉快了",		-- 物品名:"龙鳞火炉"->被锤了 制造描述:"给自己建造一个苍蝇暖炉。"
			GENERIC = "好热好热好热，我为什么要造这么个东西？", --no gems		-- 物品名:"龙鳞火炉"->默认 制造描述:"给自己建造一个苍蝇暖炉。"
			NORMAL = "雪糕都化了", --one gem		-- 物品名:"龙鳞火炉"->普通 制造描述:"给自己建造一个苍蝇暖炉。"
			HIGH = "好烫啊！我的头发燎到了！", --two gems		-- 物品名:"龙鳞火炉"->高 制造描述:"给自己建造一个苍蝇暖炉。"
		},
        HUTCH = "把这些带上，我要给悠看看",		-- 物品名:"哈奇"
        HUTCH_FISHBOWL =
        {
            GENERIC = "悠，养鱼要注意什么来着？",		-- 物品名:"星空"->默认
            WAITING = "你怎么了？该换水了吗？",		-- 物品名:"星空"->需要等待
        },
		LAVASPIT = 
		{
			HOT = "好烫，还恶心",		-- 物品名:"中暑"->热了
			COOL = "热，恶心.",		-- 物品名:"龙蝇唾液"
		},
		LAVA_POND = "高尚的!",		-- 物品名:"岩浆池"
		LAVAE = "摸上去太热了.",		-- 物品名:"岩浆虫"
		LAVAE_COCOON = "悠，我把它养死了……",		-- 物品名:"冷冻虫卵"
		LAVAE_PET = 
		{
			STARVING = "悠的那份，分你一点吧",		-- 物品名:"超级可爱岩浆虫"->挨饿
			HUNGRY = "饿了吗~_~",		-- 物品名:"超级可爱岩浆虫"->有点饿了
			CONTENT = "开心吗.",		-- 物品名:"超级可爱岩浆虫"->内容？？？、
			GENERIC = "让我摸摸",		-- 物品名:"超级可爱岩浆虫"->默认
		},
		LAVAE_EGG = 
		{
			GENERIC = "里面流出一股暖流.",		-- 物品名:"岩浆虫卵"->默认
		},
		LAVAE_EGG_CRACKED =
		{
			COLD = "没有生气.",		-- 物品名:"冻伤"->冷了
			COMFY = "炎热的生命",		-- 物品名:"岩浆虫卵"->舒服的
		},
		LAVAE_TOOTH = "这是一个卵齿！",		-- 物品名:"岩浆虫尖牙"
		DRAGONFRUIT = "稀有食材",		-- 物品名:"火龙果"
		DRAGONFRUIT_COOKED = "做成冰棍吧",		-- 物品名:"烤火龙果"
		DRAGONFRUIT_SEEDS = "种出好东西",		-- 物品名:"球茎状种子"
		DRAGONPIE = "我要学做这个，悠会喜欢的",		-- 物品名:"火龙果派"
		DRUMSTICK = "给悠留一个",		-- 物品名:"鸟腿"
		DRUMSTICK_COOKED = "好香",		-- 物品名:"炸鸟腿"
		DUG_BERRYBUSH = "移动的草莓棒冰机.",		-- 物品名:"浆果丛"
		DUG_BERRYBUSH_JUICY = "种出来之后可以让悠也尝尝",		-- 物品名:"多汁浆果丛"
		DUG_GRASS = "没有我的头发长.",		-- 物品名:"草丛"
		DUG_MARSH_BUSH = "会划破手",		-- 物品名:"尖刺灌木"
		DUG_SAPLING = "请长出冰棍",		-- 物品名:"树苗"
		DURIAN = "明明该很好吃的，为什么……",		-- 物品名:"榴莲"
		DURIAN_COOKED = "扔掉。",		-- 物品名:"超臭榴莲"
		DURIAN_SEEDS = "种出怪东西.",		-- 物品名:"脆籽荚"
		EARMUFFSHAT = "悠，你看我戴着这个如何",		-- 物品名:"兔耳罩" 制造描述:"毛茸茸的保暖物品。"
		EGGPLANT = "放进咖喱也不好吃",		-- 物品名:"茄子"
		EGGPLANT_COOKED = "有点想吃了。",		-- 物品名:"烤茄子"
		EGGPLANT_SEEDS = "种出不好吃的东西.",		-- 物品名:"漩涡种子"
		ENDTABLE = 
		{
			BURNT = "我的花瓶……谁干的！！",		-- 物品名:"茶几"->烧焦的 制造描述:"一张装饰桌。"
			GENERIC = "悠，你说插什么花好呢",		-- 物品名:"茶几"->默认 制造描述:"一张装饰桌。"
			EMPTY = "悠，送我一朵花吧",		-- 物品名:"茶几" 制造描述:"一张装饰桌。"
			WILTED = "悠，你又给谁送花了吧",		-- 物品名:"茶几"->枯萎的 制造描述:"一张装饰桌。"
			FRESHLIGHT = "好暗，我有点害怕",		-- 物品名:"茶几"->茶几-新的发光的 制造描述:"一张装饰桌。"
			OLDLIGHT = "该换个灯泡了，悠", -- will be wilted soon, light radius will be very small at this point		-- 物品名:"茶几"->茶几-旧的发光的 制造描述:"一张装饰桌。"
		},
		DECIDUOUSTREE = 
		{
			BURNING = "悠，躲远一点",		-- 物品名:"桦栗树"->正在燃烧
			BURNT = "我应该更珍惜它们一些",		-- 物品名:"桦栗树"->烧焦的
			CHOPPED = "光秃秃的",		-- 物品名:"桦栗树"->被砍了
			POISON = "像蚊子一样，好恶心啊",		-- 物品名:"桦栗树"->毒化的
			GENERIC = "还挺漂亮",		-- 物品名:"桦栗树"->默认
		},
		ACORN = "能放进雪糕里？",		-- 物品名:"桦栗果"
        ACORN_SAPLING = "很快，你就会变成坚果~",		-- 物品名:"桦栗树树苗"
		ACORN_COOKED = "想吃果仁雪糕了",		-- 物品名:"烤桦栗果"
		BIRCHNUTDRAKE = "悠，这个怎么种？",		-- 物品名:"桦栗果精"
		EVERGREEN =
		{
			BURNING = "悠，离远点",		-- 物品名:"常青树"->正在燃烧
			BURNT = "烧焦了",		-- 物品名:"常青树"->烧焦的
			CHOPPED = "没蚊子了，但好热",		-- 物品名:"常青树"->被砍了
			GENERIC = "树荫下有蚊子",		-- 物品名:"常青树"->默认
		},
		EVERGREEN_SPARSE =
		{
			BURNING = "不好，着火了",		-- 物品名:"粗壮常青树"->正在燃烧
			BURNT = "我该更加珍惜这棵树的",		-- 物品名:"粗壮常青树"->烧焦的
			CHOPPED = "光秃秃的",		-- 物品名:"粗壮常青树"->被砍了
			GENERIC = "常青树",		-- 物品名:"粗壮常青树"->默认
		},
		TWIGGYTREE = 
		{
			BURNING = "保护我的中奖标记！",		-- 物品名:"多枝树"->正在燃烧
			BURNT = "我的中奖标记烧掉了……",		-- 物品名:"多枝树"->烧焦的
			CHOPPED = "雪糕棍我都检查了一遍，没有中奖。",		-- 物品名:"多枝树"->被砍了
			GENERIC = "上面一定有一根中奖的雪糕棍",					-- 物品名:"多枝树"->默认
			DISEASED = "这长得不是雪糕棍，这是什么？",		-- 物品名:"多枝树"->生病了
		},
		TWIGGY_NUT_SAPLING = "上面会有一个中奖的雪糕棍吗",		-- 物品名:"多枝树苗"
        TWIGGY_OLD = "没有雪糕棍了",		-- 物品名:"多枝树"
		TWIGGY_NUT = "听说这个能长出雪糕棍",		-- 物品名:"多枝树种"->多枝树果
		EYEPLANT = "好恶心，不许盯着我.",		-- 物品名:"眼球草"
		INSPECTSELF = "我还活着……我会找到悠的！",		-- 物品名:"多枝树"->检查自己
		FARMPLOT =
		{
			GENERIC = "咖喱是从这里长出来的吗",		-- 物品名:未找到
			GROWING = "我不要忍耐！",		-- 物品名:未找到
			NEEDSFERTILIZER = "它渴望关怀",		-- 物品名:未找到
			BURNT = "一片荒芜",		-- 物品名:未找到
		},
		FEATHERHAT = "悠，这顶帽子如何",		-- 物品名:"羽毛帽" 制造描述:"头上的装饰。"
		FEATHER_CROW = "苍穹下的黑影",		-- 物品名:"黑色羽毛"
		FEATHER_ROBIN = "来自苍穹。",		-- 物品名:"红色羽毛"
		FEATHER_ROBIN_WINTER = "蓝色的天穹，蓝色的羽毛",		-- 物品名:"蔚蓝羽毛"
		FEATHER_CANARY = "在苍穹之下闪耀的辉光",		-- 物品名:"黄色羽毛"
		FEATHERPENCIL = "写下我对悠的思念……",		-- 物品名:"羽毛笔" 制造描述:"是的，羽毛是必须的。"
        COOKBOOK = "这里记载了妈妈教我的料理",		-- 物品名:"烹饪指南" 制造描述:"查看你收集的食谱。"
		FEM_PUPPET = "她被困住了!",		-- 物品名:未找到
		FIREFLIES =
		{
			GENERIC = "荧火，夏夜，我和悠.",		-- 物品名:"萤火虫"->默认
			HELD = "放飞它们，能看到悠吗",		-- 物品名:"萤火虫"->拿在手里
		},
		FIREHOUND = "不要过来！",		-- 物品名:"红色猎犬"
		FIREPIT =
		{
			EMBERS = "快熄了",		-- 物品名:"石头营火"->即将熄灭 制造描述:"一种更安全、更高效的营火。"
			GENERIC = "安全的火",		-- 物品名:"石头营火"->默认 制造描述:"一种更安全、更高效的营火。"
			HIGH = "好险，没燎到头发",		-- 物品名:"石头营火"->高 制造描述:"一种更安全、更高效的营火。"
			LOW = "弱了",		-- 物品名:"石头营火"->低？ 制造描述:"一种更安全、更高效的营火。"
			NORMAL = "别烧头发",		-- 物品名:"石头营火"->普通 制造描述:"一种更安全、更高效的营火。"
			OUT = "熄了.",		-- 物品名:"石头营火"->出去？外面？ 制造描述:"一种更安全、更高效的营火。"
		},
		COLDFIREPIT =
		{
			EMBERS = "不好，热意回来了",		-- 物品名:"吸热火坑"->即将熄灭 制造描述:"燃烧效率更高，但仍然越烤越冷。"
			GENERIC = "风扇的代替品",		-- 物品名:"吸热火坑"->默认 制造描述:"燃烧效率更高，但仍然越烤越冷。"
			HIGH = "是不是有点冷",		-- 物品名:"吸热火坑"->高 制造描述:"燃烧效率更高，但仍然越烤越冷。"
			LOW = "怎么感觉有点热了",		-- 物品名:"吸热火坑"->低？ 制造描述:"燃烧效率更高，但仍然越烤越冷。"
			NORMAL = "好！凉！快！啊！",		-- 物品名:"吸热火坑"->普通 制造描述:"燃烧效率更高，但仍然越烤越冷。"
			OUT = "好热！快点把它启动.",		-- 物品名:"吸热火坑"->出去？外面？ 制造描述:"燃烧效率更高，但仍然越烤越冷。"
		},
		FIRESTAFF = "它会让这里变得更热的",		-- 物品名:"火魔杖" 制造描述:"利用火焰的力量！"
		FIRESUPPRESSOR = 
		{	
			ON = "让热浪滚出去",		-- 物品名:"雪球发射器"->开启 制造描述:"拯救植物，扑灭火焰，可添加燃料。"
			OFF = "用不上你。",		-- 物品名:"雪球发射器"->关闭 制造描述:"拯救植物，扑灭火焰，可添加燃料。"
			LOWFUEL = "快要压不住热浪了",		-- 物品名:"雪球发射器"->燃料不足 制造描述:"拯救植物，扑灭火焰，可添加燃料。"
		},
		FISH = "是悠钓上来的吧",		-- 物品名:"鱼"
		FISHINGROD = "悠，我们一起出发",		-- 物品名:"钓竿" 制造描述:"去钓鱼。为了鱼。"
		FISHSTICKS = "戳我的肋骨.",		-- 物品名:"炸鱼排"
		FISHTACOS = "异国风味。真想给悠尝尝",		-- 物品名:"鱼肉玉米卷"
		FISH_COOKED = "悠，来尝尝",		-- 物品名:"烤鱼"
		FLINT = "不好看。",		-- 物品名:"燧石"
		FLOWER = 
		{
            GENERIC = "悠，我和花谁更……我没心情赏花。",		-- 物品名:"花"->默认
            ROSE = "悠，你看这玫瑰……等我找到你一定要亲手送我。",		-- 物品名:"花"->玫瑰
        },
        FLOWER_WITHERED = "你一定渴望与苍穹相望",		-- 物品名:"枯萎的花"
		FLOWERHAT = "悠，好看吗？",		-- 物品名:"花环" 制造描述:"放松神经的东西。"
		FLOWER_EVIL = "啊!它太邪恶了!",		-- 物品名:"邪恶花"
		FOLIAGE = "一些绿叶植物.",		-- 物品名:"蕨叶"
		FOOTBALLHAT = "包不住我的头发",		-- 物品名:"橄榄球头盔" 制造描述:"保护你的脑壳。"
        FOSSIL_PIECE = "这个应该拼到……头疼！悠你来拼！",		-- 物品名:"化石碎片"
        FOSSIL_STALKER =
        {
			GENERIC = "到底该怎么拼啊……好烦",		-- 物品名:"奇异的骨架"->默认
			FUNNY = "我拼出了什么东西……悠你不许笑！",		-- 物品名:"奇异的骨架"->趣味？？
			COMPLETE = "成功了！悠，我拼出来了！",		-- 物品名:"奇异的骨架"->准备好了
        },
        STALKER = "我……不能害怕！说不定悠的秘密就在这里！",		-- 物品名:"复活的骨架"
        STALKER_ATRIUM = "你把悠藏到哪里去了？告诉我！！！",		-- 物品名:"远古织影者"
        STALKER_MINION = "你们知道悠在哪吗？",		-- 物品名:"编织暗影"
        THURIBLE = "即便如此也不能找到悠吗？我不要这个，我要悠！",		-- 物品名:"暗影香炉"
        ATRIUM_OVERGROWTH = "我不认识这些符号。",		-- 物品名:"远古方尖碑"
		FROG =
		{
			DEAD = "谁来给我抓蚊子呢.",		-- 物品名:"青蛙"->死了
			GENERIC = "去抓蚊子，立刻，马上！",		-- 物品名:"青蛙"->默认
			SLEEPING = "起来，蚊子在嗡嗡叫",		-- 物品名:"青蛙"->睡着了
		},
		FROGGLEBUNWICH = "不抓蚊子，就被面包抓住",		-- 物品名:"蛙腿三明治"
		FROGLEGS = "你为什么不去吃蚊子",		-- 物品名:"蛙腿"
		FROGLEGS_COOKED = "你该好好吃蚊子的",		-- 物品名:"烤蛙腿"
		FRUITMEDLEY = "和冰棒一样美妙.",		-- 物品名:"水果圣代"
		FURTUFT = "黑白的毛.", 		-- 物品名:"毛丛"
		GEARS = "复杂",		-- 物品名:"齿轮"
		GHOST = "还好不是悠的，也不是我的",		-- 物品名:"幽灵"
		GOLDENAXE = "好像更重了",		-- 物品名:"黄金斧头" 制造描述:"砍树也要有格调！"
		GOLDENPICKAXE = "真浪费。",		-- 物品名:"黄金鹤嘴锄" 制造描述:"像大Boss一样砸碎岩石。"
		GOLDENPITCHFORK = "这草叉值一次芬兰的假期了",		-- 物品名:"黄金干草叉" 制造描述:"重新布置整个世界。"
		GOLDENSHOVEL = "浪费",		-- 物品名:"黄金铲子" 制造描述:"挖掘作用相同，但使用寿命更长。"
		GOLDNUGGET = "这是……无上的幸福！",		-- 物品名:"金块"
		GRASS =
		{
			BARREN = "你为什么不肯生长？",		-- 物品名:"草"
			WITHERED = "你和我一样讨厌夏天吧",		-- 物品名:"草"->枯萎了
			BURNING = "啊！我还以为我的头发烧了",		-- 物品名:"草"->正在燃烧
			GENERIC = "像我的头发",		-- 物品名:"草"->默认
			PICKED = "会长大的。",		-- 物品名:"草"->被采完了
			DISEASED = "草（痛惜）",		-- 物品名:"草"->生病了
			DISEASING = "草（警觉）",		-- 物品名:"草"->正在生病？？
		},
		GRASSGEKKO = 
		{
			GENERIC = "跑什么跑，我就问你见过悠没有",			-- 物品名:"草壁虎"->默认
			DISEASED = "好恶心，不问你了。",		-- 物品名:"草壁虎"->生病了
		},
		GREEN_CAP = "它也是灯。",		-- 物品名:"采摘的绿蘑菇"
		GREEN_CAP_COOKED = "这能放进咖喱里吗",		-- 物品名:"烤绿蘑菇"
		GREEN_MUSHROOM =
		{
			GENERIC = "看着就不想吃",		-- 物品名:"绿蘑菇"->默认
			INGROUND = "这么懒，怪不得绿了",		-- 物品名:"绿蘑菇"->在地里面
			PICKED = "与绿地融为一体",		-- 物品名:"绿蘑菇"->被采完了
		},
		GUNPOWDER = "危险",		-- 物品名:"火药" 制造描述:"一把火药。"
		HAMBAT = "咖喱也能做成咖喱棒吗",		-- 物品名:"火腿棒" 制造描述:"舍不得火腿套不着狼。"
		HAMMER = "好重，悠你来吧",		-- 物品名:"锤子" 制造描述:"敲碎各种东西。"
		HEALINGSALVE = "悠，我受伤了……",		-- 物品名:"治疗药膏" 制造描述:"对割伤和擦伤进行消毒杀菌。"
		HEATROCK =
		{
			FROZEN = "好凉爽！",		-- 物品名:"暖石"->冰冻 制造描述:"储存热能供旅行途中使用。"
			COLD = "还不够凉！",		-- 物品名:"冻伤"->冷了
			GENERIC = "夏雪冬花",		-- 物品名:"暖石"->默认 制造描述:"储存热能供旅行途中使用。"
			WARM = "暖暖的.",		-- 物品名:"暖石"->温暖 制造描述:"储存热能供旅行途中使用。"
			HOT = "好烫！",		-- 物品名:"中暑"->热了
		},
		HOME = "一定有人住在这",		-- 物品名:"暖石"->没调用 制造描述:"储存热能供旅行途中使用。"
		HOMESIGN =
		{
			GENERIC = "写了什么",		-- 物品名:"路牌"->默认 制造描述:"在世界中留下你的标记。"
            UNWRITTEN = "空的~",		-- 物品名:"路牌"->没有写字 制造描述:"在世界中留下你的标记。"
			BURNT = "黑的.",		-- 物品名:"路牌"->烧焦的 制造描述:"在世界中留下你的标记。"
		},
		ARROWSIGN_POST =
		{
			GENERIC = "有悠的信息吗？”。",		-- 物品名:"指路标志"->默认 制造描述:"对这个世界指指点点。或许只是打下手势。"
            UNWRITTEN = "没有任何悠的线索",		-- 物品名:"指路标志"->没有写字 制造描述:"对这个世界指指点点。或许只是打下手势。"
			BURNT = "“会不会把悠的消息烧掉了……”",		-- 物品名:"指路标志"->烧焦的 制造描述:"对这个世界指指点点。或许只是打下手势。"
		},
		ARROWSIGN_PANEL =
		{
			GENERIC = "会是悠留下的痕迹吗？”。",		-- 物品名:"指路标志"->默认
            UNWRITTEN = "没有悠的线索，也没有任何别的信息",		-- 物品名:"指路标志"->没有写字
			BURNT = "我来晚了吗？这上面会不会有悠的信息……",		-- 物品名:"指路标志"->烧焦的
		},
		HONEY = "真的是蜂蜜啊",		-- 物品名:"蜂蜜"
		HONEYCOMB = "把蜂蜜交出来",		-- 物品名:"蜂巢"
		HONEYHAM = "吃多了会长胖吧，但是就是想吃.",		-- 物品名:"蜜汁火腿"
		HONEYNUGGETS = "甜甜的，悠你也尝尝",		-- 物品名:"蜜汁卤肉"
		HORN = "叫你拱我",		-- 物品名:"牛角"
		HOUND = "悠，救我啊！",		-- 物品名:"猎犬"
		HOUNDCORPSE =
		{
			GENERIC = "它死了。",		-- 物品名:"猎犬"->默认
			BURNING = "再也不见",		-- 物品名:"猎犬"->正在燃烧
			REVIVING = "悠,我好害怕",		-- 物品名:"猎犬"
		},
		HOUNDBONE = "这不是悠，绝对不是",		-- 物品名:"犬骨"
		HOUNDMOUND = "这里是……啊！悠，救我！",		-- 物品名:"猎犬丘"
		ICEBOX = "我要塞满雪糕",		-- 物品名:"冰箱" 制造描述:"延缓食物变质。"
		ICEHAT = "自制雪糕~",		-- 物品名:"冰帽" 制造描述:"用科学技术合成的冰帽。"
		ICEHOUND = "好冷，悠，快来救我！",		-- 物品名:"蓝色猎犬"
		INSANITYROCK =
		{
			ACTIVE = "悠，这个在动！",		-- 物品名:"方尖碑"->激活了
			INACTIVE = "诡异得很",		-- 物品名:"方尖碑"->没有激活
		},
		JAMMYPRESERVES = "好甜，啊，粘手上了.",		-- 物品名:"果酱"
		KABOBS = "悠，你也来一串",		-- 物品名:"肉串"
		KILLERBEE =
		{
			GENERIC = "天呐！比蚊子还讨厌！",		-- 物品名:"杀人蜂"->默认
			HELD = "赶紧杀掉",		-- 物品名:"杀人蜂"->拿在手里
		},
		KNIGHT = "动作好僵硬",		-- 物品名:"发条骑士"
		KOALEFANT_SUMMER = "怎么是你！悠呢！",		-- 物品名:"考拉象"
		KOALEFANT_WINTER = "更胖了",		-- 物品名:"考拉象"
		KRAMPUS = "别碰我东西！滚出去！",		-- 物品名:"坎普斯"
		KRAMPUS_SACK = "我背不动啊，悠你来帮我",		-- 物品名:"坎普斯背包"
		LEIF = "悠！这东西好吓人啊！",		-- 物品名:"树精守卫"
		LEIF_SPARSE = "看什么看",		-- 物品名:"树精守卫"
		LIGHTER  = "可以用这个给悠做菜吗",		-- 物品名:"薇洛的打火机" 制造描述:"火焰在雨中彻夜燃烧。"
		LIGHTNING_ROD =
		{
			CHARGED = "我的小兔子别怕~",		-- 物品名:"避雷针" 制造描述:"防雷劈。"
			GENERIC = "保护我的家，还有我的家人",		-- 物品名:"避雷针"->默认 制造描述:"防雷劈。"
		},
		LIGHTNINGGOAT = 
		{
			GENERIC = "安静点，我要羊奶",		-- 物品名:"伏特羊"->默认
			CHARGED = "悠快按住它，它有羊奶",		-- 物品名:"伏特羊"
		},
		LIGHTNINGGOATHORN = "咩~.",		-- 物品名:"伏特羊角"
		GOATMILK = "牛奶雪糕。",		-- 物品名:"带电的羊奶"
		LITTLE_WALRUS = "悠，我不忍心杀了它",		-- 物品名:"小海象"
		LIVINGLOG = "活的",		-- 物品名:"活木头" 制造描述:"用你的身体来代替\n你该干的活吧。"
		LOG =
		{
			BURNING = "真的烧了",		-- 物品名:"木头"->正在燃烧
			GENERIC = "易燃",		-- 物品名:"木头"->默认
		},
		LUCY = "如果你不知道悠去了哪，就给我闭嘴",		-- 物品名:"露西斧"
		LUREPLANT = "悠，我们养一些吧.",		-- 物品名:"食人花"
		LUREPLANTBULB = "我可不想把它种出来",		-- 物品名:"食人花种子"
		MALE_PUPPET = "有点可怜",		-- 物品名:"木头"
		MANDRAKE_ACTIVE = "别跟着我，去找悠",		-- 物品名:"曼德拉草"
		MANDRAKE_PLANTED = "不要装睡，你出来",		-- 物品名:"曼德拉草"
		MANDRAKE = "你好吵",		-- 物品名:"曼德拉草"
        MANDRAKESOUP = "悠，你一定要喝一口.",		-- 物品名:"曼德拉草汤"
        MANDRAKE_COOKED = "给悠准备着",		-- 物品名:"木头"
        MAPSCROLL = "没有关于悠的信息",		-- 物品名:"地图" 制造描述:"向别人展示你看到什么！"
        MARBLE = "悠，我们能住上这种材质的房子吗",		-- 物品名:"大理石"
        MARBLEBEAN = "我从没见过这种豆子，悠肯定也没有",		-- 物品名:"大理石豌豆" 制造描述:"种植一片大理石森林。"
        MARBLEBEAN_SAPLING = "悠，你肯定不会种大理石",		-- 物品名:"大理石芽"
        MARBLESHRUB = "悠你看，大理石居然会生长！",		-- 物品名:"大理石灌木"
        MARBLEPILLAR = "真碍事",		-- 物品名:"大理石柱"
        MARBLETREE = "悠，这石头居然会长大",		-- 物品名:"大理石树"
        MARSH_BUSH =
        {
			BURNT = "这下不扎手了",		-- 物品名:"尖刺灌木"->烧焦的
            BURNING = "烧吧",		-- 物品名:"尖刺灌木"->正在燃烧
            GENERIC = "好危险",		-- 物品名:"尖刺灌木"->默认
            PICKED = "好疼",		-- 物品名:"尖刺灌木"->被采完了
        },
        BURNT_MARSH_BUSH = "一切都燃烧殆尽了.",		-- 物品名:"尖刺灌木"
        MARSH_PLANT = "植物",		-- 物品名:"植物"
        MARSH_TREE =
        {
            BURNING = "烧着……",		-- 物品名:"针刺树"->正在燃烧
            BURNT = "焦了",		-- 物品名:"针刺树"->烧焦的
            CHOPPED = "倒了",		-- 物品名:"针刺树"->被砍了
            GENERIC = "坚挺",		-- 物品名:"针刺树"->默认
        },
        MAXWELL = "悠到底在哪？",		-- 物品名:"麦斯威尔"->单机 麦斯威尔
        MAXWELLHEAD = "告诉我，悠到底在哪",		-- 物品名:"麦斯威尔的头"->单机 麦斯威尔的头
        MAXWELLLIGHT = "放我回去，听见没有.",		-- 物品名:"麦斯威尔灯"->单机 麦斯威尔的灯
        MAXWELLLOCK = "悠关在里面吗？.",		-- 物品名:"梦魇锁"->单机 麦斯威尔的噩梦锁
        MAXWELLTHRONE = "他看起来不舒服啊.",		-- 物品名:"梦魇王座"->单机 麦斯威尔的噩梦王座
        MEAT = "悠，晚上吃烤肉吧",		-- 物品名:"肉"
        MEATBALLS = "悠，我做的，尝尝吧",		-- 物品名:"肉丸"
        MEATRACK =
        {
            DONE = "悠，来吃肉干",		-- 物品名:"晾肉架"->完成了 制造描述:"晾肉的架子。"
            DRYING = "悠，我在自己做肉干呢",		-- 物品名:"晾肉架"->正在风干 制造描述:"晾肉的架子。"
            DRYINGINRAIN = "好讨厌的雨.我不要忍耐！",		-- 物品名:"晾肉架"->雨天风干 制造描述:"晾肉的架子。"
            GENERIC = "原来肉干是这么做的吗",		-- 物品名:"晾肉架"->默认 制造描述:"晾肉的架子。"
            BURNT = "悠，给我买肉干.",		-- 物品名:"晾肉架"->烧焦的 制造描述:"晾肉的架子。"
            DONE_NOTMEAT = "肉干晾好了。",		-- 物品名:"晾肉架" 制造描述:"晾肉的架子。"
            DRYING_NOTMEAT = "海苔是这么做的",		-- 物品名:"晾肉架" 制造描述:"晾肉的架子。"
            DRYINGINRAIN_NOTMEAT = "呜，我的海苔",		-- 物品名:"晾肉架" 制造描述:"晾肉的架子。"
        },
        MEAT_DRIED = "悠，你先咬一口.",		-- 物品名:"风干肉"
        MERM = "又丑又蠢",		-- 物品名:"鱼人"
        MERMHEAD =
        {
            GENERIC = "瞅，丑，臭",		-- 物品名:"鱼人头"->默认
            BURNT = "更加瞅，丑，臭",		-- 物品名:"鱼人头"->烧焦的
        },
        MERMHOUSE =
        {
            GENERIC = "破房子",		-- 物品名:"漏雨的小屋"->默认
            BURNT = "烧了之后更破了",		-- 物品名:"漏雨的小屋"->烧焦的
        },
        MINERHAT = "为了照明，要戴上这么丑的东西吗",		-- 物品名:"矿工帽" 制造描述:"用你脑袋上的灯照亮夜晚。"
        MONKEY = "别碰我的东西，只有悠才能碰",		-- 物品名:"暴躁猴"
        MONKEYBARREL = "滚回去！别出来！",		-- 物品名:"暴躁猴桶"
        MONSTERLASAGNA = "我要吐出来了！",		-- 物品名:"怪物千层饼"
        FLOWERSALAD = "一碗菜叶",		-- 物品名:"花沙拉"
        ICECREAM = "雪糕！冰棍！冰淇淋！棒冰！",		-- 物品名:"冰淇淋"
        WATERMELONICLE = "西瓜棒冰！太开心了！",		-- 物品名:"西瓜冰棍"
        TRAILMIX = "悠，我们各吃一半",		-- 物品名:"什锦干果"
        HOTCHILI = "好，好辣。",		-- 物品名:"辣椒炖肉"
        GUACAMOLE = "难吃，贵",		-- 物品名:"鳄梨酱"
        MONSTERMEAT = "这不是肉",		-- 物品名:"怪物肉"
        MONSTERMEAT_DRIED = "这什么味道……这不是肉干",		-- 物品名:"怪物肉干"
        MOOSE = "不太清楚这是啥.",		-- 物品名:"漏雨的小屋"
        MOOSE_NESTING_GROUND = "这是我们的家！滚出去！",		-- 物品名:"漏雨的小屋"
        MOOSEEGG = "滚出去，这里是我和悠的家",		-- 物品名:"漏雨的小屋"
        MOSSLING = "滚开！这些都是我和悠的！不许吃！",		-- 物品名:"麋鹿鹅幼崽"
        FEATHERFAN = "悠，不用修风扇了。",		-- 物品名:"羽毛扇" 制造描述:"超柔软、超大的扇子。"
        MINIFAN = "不知何故,微风出来后快一倍.",		-- 物品名:"旋转的风扇" 制造描述:"你得跑起来，才能带来风！"
        GOOSE_FEATHER = "不会再热了",		-- 物品名:"麋鹿鹅羽毛"
        STAFF_TORNADO = "旋转的地狱.",		-- 物品名:"天气风向标" 制造描述:"把你的敌人吹走。"
        MOSQUITO =
        {
            GENERIC = "滚出去滚出去滚出去滚出去滚出去滚出去！！！！！！",		-- 物品名:"蚊子"->默认
            HELD = "蚊子好烦蚊子好烦蚊子好烦蚊子好烦蚊子好烦",		-- 物品名:"蚊子"->拿在手里
        },
        MOSQUITOSACK = "就算死了还是好讨厌好讨厌好讨厌好讨厌",		-- 物品名:"蚊子血囊"
        MOUND =
        {
            DUG = "谁？吓我一跳",		-- 物品名:"坟墓"->被挖了
            GENERIC = "悠！还好不是悠",		-- 物品名:"坟墓"->默认
        },
        NIGHTLIGHT = "这光……悠，我有点难受",		-- 物品名:"魂灯" 制造描述:"用你的噩梦点亮夜晚。"
        NIGHTMAREFUEL = "悠，我害怕这个",		-- 物品名:"噩梦燃料" 制造描述:"傻子和疯子使用的邪恶残渣。"
        NIGHTSWORD = "悠，别碰它",		-- 物品名:"暗夜剑" 制造描述:"造成噩梦般的伤害。"
        NITRE = "悠，听说这东西会爆炸，真的吗？",		-- 物品名:"硝石"
        ONEMANBAND = "你们也觉得我很可爱吗？",		-- 物品名:"独奏乐器" 制造描述:"疯子音乐家也有粉丝。"
        OASISLAKE =
		{
			GENERIC = "悠，我们来钓鱼！",		-- 物品名:"湖泊"->默认
			EMPTY = "什么时候才能钓鱼啊。",		-- 物品名:"湖泊"
		},
        PANDORASCHEST = "悠会不会躺在……不可能的",		-- 物品名:"华丽箱子"
        PANFLUTE = "我不懂音乐……",		-- 物品名:"排箫" 制造描述:"抚慰凶猛野兽的音乐。"
        PAPYRUS = "我要给悠写封信……",		-- 物品名:"莎草纸" 制造描述:"用于书写。"
        WAXPAPER = "给悠包个礼物吧",		-- 物品名:"蜡纸" 制造描述:"用于打包东西。"
        PENGUIN = "是企鹅！嘴有点奇怪？",		-- 物品名:"企鸥"
        PERD = "滚出去！不许吃我的浆果！",		-- 物品名:"火鸡"
        PEROGIES = "像咖喱一样内容丰富",		-- 物品名:"波兰水饺"
        PETALS = "漂亮的花",		-- 物品名:"花瓣"
        PETALS_EVIL = "同是生在苍穹之下，你怎么会开成这样",		-- 物品名:"恶魔花瓣"
        PHLEGM = "太恶心了！悠快把这个清理掉！",		-- 物品名:"脓鼻涕"
        PICKAXE = "很形象,不是吗?",		-- 物品名:"鹤嘴锄" 制造描述:"凿碎岩石。"
        PIGGYBACK = "这包太大了，我背不动啊……",		-- 物品名:"小猪包" 制造描述:"能装许多东西，但会减慢你的速度。"
        PIGHEAD =
        {
            GENERIC = "好丑的装饰",		-- 物品名:"猪头"->默认
            BURNT = "怎么有点香味.",		-- 物品名:"猪头"->烧焦的
        },
        PIGHOUSE =
        {
            FULL = "你躲在里面偷看我？还是在偷看悠？",		-- 物品名:"猪屋"->满了 制造描述:"可以住一只猪。"
            GENERIC = "房子，悠会不会躲在里面？",		-- 物品名:"猪屋"->默认 制造描述:"可以住一只猪。"
            LIGHTSOUT = "你最好永远别开灯！",		-- 物品名:"猪屋"->关灯了 制造描述:"可以住一只猪。"
            BURNT = "你也失去了自己的家",		-- 物品名:"猪屋"->烧焦的 制造描述:"可以住一只猪。"
        },
        PIGKING = "这么懒，怪不得这么臭。我得离他远点",		-- 物品名:"猪王"
        PIGMAN =
        {
            DEAD = "有人应该说说它的家庭.",		-- 物品名:"猪人"->死了
            FOLLOWER = "好吧，我允许你跟着我",		-- 物品名:"猪人"->追随者
            GENERIC = "你不要靠近悠！",		-- 物品名:"猪人"->默认
            GUARD = "看起来很严肃.",		-- 物品名:"猪人"->警戒
            WEREPIG = "你，你想干嘛？悠！悠你在哪？",		-- 物品名:"猪人"->疯猪
        },
        PIGSKIN = "现在我允许悠喜欢你了",		-- 物品名:"猪皮"
        PIGTENT = "这什么味啊",		-- 物品名:"猪人"
        PIGTORCH = "好丑的火炬，火倒是很旺盛",		-- 物品名:"猪火炬"
        PINECONE = "种出木头",		-- 物品名:"松果"
        PINECONE_SAPLING = "在生长。",		-- 物品名:"常青树苗"
        LUMPY_SAPLING = "这棵树是怎么繁殖的？",		-- 物品名:"有疙瘩的树苗"
        PITCHFORK = "太粗暴了，不适合我",		-- 物品名:"干草叉" 制造描述:"铲地用具。"
        PLANTMEAT = "这不是肉……悠，你先吃一下试试",		-- 物品名:"叶肉"
        PLANTMEAT_COOKED = "有点香啊，悠你来尝尝吧",		-- 物品名:"烤叶肉"
        PLANT_NORMAL =
        {
            GENERIC = "好脏，好累",		-- 物品名:"农作物"->默认
            GROWING = "我不要忍耐！",		-- 物品名:"农作物"->正在生长
            READY = "悠，我种出来了啊！",		-- 物品名:"农作物"->准备好的 满的
            WITHERED = "好热，我讨厌夏天",		-- 物品名:"农作物"->枯萎了
        },
        POMEGRANATE = "悠，这个籽好多",		-- 物品名:"石榴"
        POMEGRANATE_COOKED = "这种吃法……悠，你来尝尝？",		-- 物品名:"切片熟石榴"
        POMEGRANATE_SEEDS = "种出万颗籽",		-- 物品名:"风刮来的种子"
        POND = "这位小美女是谁呀",		-- 物品名:"池塘"
        POOP = "好脏，我真的要去捡吗……",		-- 物品名:"粪肥"
        FERTILIZER = "不想施肥.",		-- 物品名:"便便桶" 制造描述:"少拉点在手上，多拉点在庄稼上。"
        PUMPKIN = "好大，能装咖喱",		-- 物品名:"南瓜"
        PUMPKINCOOKIE = "是南瓜曲奇！",		-- 物品名:"南瓜饼干"
        PUMPKIN_COOKED = "放进咖喱里面吧，味道一定不错！",		-- 物品名:"烤南瓜"
        PUMPKIN_LANTERN = "悠！我害怕！",		-- 物品名:"南瓜灯" 制造描述:"长着鬼脸的照明用具。"
        PUMPKIN_SEEDS = "种出满足感",		-- 物品名:"尖种子"
        PURPLEAMULET = "苍穹都被它染黑了",		-- 物品名:"梦魇护符" 制造描述:"引起精神错乱。"
        PURPLEGEM = "魔力充盈",		-- 物品名:"紫宝石" 制造描述:"结合你们的颜色！"
        RABBIT =
        {
            GENERIC = "小兔兔，过来",		-- 物品名:"兔子"->默认
            HELD = "悠，我可以养兔子吗？",		-- 物品名:"兔子"->拿在手里
        },
        RABBITHOLE =
        {
            GENERIC = "出来，我要摸摸",		-- 物品名:"兔洞"->默认
            SPRING = "悠，我们来模仿一下它们吧",		-- 物品名:"兔洞"->春天 or 潮湿
        },
        RAINOMETER =
        {
            GENERIC = "明天又是讨厌的天气",		-- 物品名:"雨量计"->默认 制造描述:"观测降雨机率。"
            BURNT = "讨厌的天气也看不到了",		-- 物品名:"雨量计"->烧焦的 制造描述:"观测降雨机率。"
        },
        RAINCOAT = "让雨去它该去的地方:别淋着我就好.",		-- 物品名:"雨衣" 制造描述:"让你保持干燥的防水外套。"
        RAINHAT = "罩不住头发啊",		-- 物品名:"雨帽" 制造描述:"手感柔软，防雨必备。"
        RATATOUILLE = "没有咖喱怎么吃！",		-- 物品名:"蔬菜杂烩"
        RAZOR = "给悠做一个吧，别长出难看的胡子",		-- 物品名:"剃刀" 制造描述:"剃掉你脏脏的山羊胡子。"
        REDGEM = "悠，我拿到了一块宝石！",		-- 物品名:"红宝石"
        RED_CAP = "有毒",		-- 物品名:"采摘的红蘑菇"
        RED_CAP_COOKED = "看起来还是不能吃.",		-- 物品名:"烤红蘑菇"
        RED_MUSHROOM =
        {
            GENERIC = "不能吃，也不好吃",		-- 物品名:"红蘑菇"->默认
            INGROUND = "你不想看看这苍穹吗",		-- 物品名:"红蘑菇"->在地里面
            PICKED = "你可以不用长出来",		-- 物品名:"红蘑菇"->被采完了
        },
        REEDS =
        {
            BURNING = "沼泽上也能起火吗……",		-- 物品名:"芦苇"->正在燃烧
            GENERIC = "悠，你来拔",		-- 物品名:"芦苇"->默认
            PICKED = "我居然把它拔光了",		-- 物品名:"芦苇"->被采完了
        },
        RELIC = "更换了纪元.",		-- 物品名:"废墟"
        RUINS_RUBBLE = "破败",		-- 物品名:"损毁的废墟"
        RUBBLE = "只是碎石砾而已.",		-- 物品名:"碎石"
        RESEARCHLAB =
        {
            GENERIC = "虽然可以勉强学一下……但是我讨厌上学！",		-- 物品名:"科学机器"->默认 制造描述:"解锁新的合成配方！"
            BURNT = "少了正好啊.",		-- 物品名:"科学机器"->烧焦的 制造描述:"解锁新的合成配方！"
        },
        RESEARCHLAB2 =
        {
            GENERIC = "好难懂！太复杂了！我不想上学！！",		-- 物品名:"炼金引擎"->默认 制造描述:"解锁更多合成配方！"
            BURNT = "烧的好。",		-- 物品名:"炼金引擎"->烧焦的 制造描述:"解锁更多合成配方！"
        },
        RESEARCHLAB3 =
        {
            GENERIC = "这是……魔法？我要学这个吗……",		-- 物品名:"暗影操控器"->默认 制造描述:"这还是科学吗？"
            BURNT = "奇迹和魔法都是不存在的",		-- 物品名:"暗影操控器"->烧焦的 制造描述:"这还是科学吗？"
        },
        RESEARCHLAB4 =
        {
            GENERIC = "谁又会给东西起这样的名字呢?",		-- 物品名:"灵子分解器"->默认 制造描述:"增强高礼帽的魔力。"
            BURNT = "就算一把火烧了我也还得给它命名.",		-- 物品名:"灵子分解器"->烧焦的 制造描述:"增强高礼帽的魔力。"
        },
        RESURRECTIONSTATUE =
        {
            GENERIC = "这个，能救活悠吗？",		-- 物品名:"肉块雕像"->默认 制造描述:"以肉的力量让你重生。"
            BURNT = "焚尽的尸体",		-- 物品名:"肉块雕像"->烧焦的 制造描述:"以肉的力量让你重生。"
        },
        RESURRECTIONSTONE = "有生的气息，悠会在这附近吗？",		-- 物品名:"试金石"
        ROBIN =
        {
            GENERIC = "苍穹之下的鲜红",		-- 物品名:"红雀"->默认
            HELD = "悠，你看这只鸟",		-- 物品名:"红雀"->拿在手里
        },
        ROBIN_WINTER =
        {
            GENERIC = "苍穹之下的雪白",		-- 物品名:"雪雀"->默认
            HELD = "悠，这个好可爱",		-- 物品名:"雪雀"->拿在手里
        },
        ROBOT_PUPPET = "它被困住了!",		-- 物品名:"雪雀"
        ROCK_LIGHT =
        {
            GENERIC = "一个陈旧的熔岩坑.",		-- 物品名:"熔岩坑"->默认
            OUT = "看起来很脆弱.",		-- 物品名:"熔岩坑"->出去？外面？
            LOW = "岩浆正在冷却.",		-- 物品名:"熔岩坑"->低？
            NORMAL = "好看又舒服",		-- 物品名:"熔岩坑"->普通
        },
        CAVEIN_BOULDER =
        {
            GENERIC = "悠，这个你能搬得动吧",		-- 物品名:"岩石"->默认
            RAISED = "我够不到，悠你可以吗",		-- 物品名:"岩石"->提高了？
        },
        ROCK = "悠，我搬不动这么大的石头",		-- 物品名:"岩石"
        PETRIFIED_TREE = "它看起来像害怕的死尸。",		-- 物品名:"岩石"
        ROCK_PETRIFIED_TREE = "石化的诅咒？悠不会也……",		-- 物品名:"石化树"
        ROCK_PETRIFIED_TREE_OLD = "这是石化诅咒？悠会不会……",		-- 物品名:"岩石"
        ROCK_ICE =
        {
            GENERIC = "会有企鹅吗？",		-- 物品名:"迷你冰川"->默认
            MELTED = "企鹅不会来了……",		-- 物品名:"迷你冰川"->融化了
        },
        ROCK_ICE_MELTED = "像雪糕一样画了.",		-- 物品名:"融化的迷你冰川"
        ICE = "做成雪糕吧.",		-- 物品名:"冰"
        ROCKS = "好重，扔不出去",		-- 物品名:"石头"
        ROOK = "悠，快躲开！",		-- 物品名:"发条战车"
        ROPE = "我居然能编出结实的绳子",		-- 物品名:"绳子" 制造描述:"紧密编成的草绳，非常有用。"
        ROTTENEGG = "这蛋都臭了！悠，快扔了！",		-- 物品名:"腐烂鸟蛋"
        ROYAL_JELLY = "最高级的蜂蜜！我一定要悠尝尝",		-- 物品名:"蜂王浆"
        JELLYBEAN = "这可是顶级的糖，要给悠留一半",		-- 物品名:"彩虹糖豆"
        SADDLE_BASIC = "我要骑上去吗……",		-- 物品名:"鞍具" 制造描述:"你坐在动物身上。仅仅是理论上。"
        SADDLE_RACE = "快一点，带我找到悠",		-- 物品名:"闪亮鞍具" 制造描述:"抵消掉完成目标所花费的时间。或许。"
        SADDLE_WAR = "像悠一样很有安全感。",		-- 物品名:"战争鞍具" 制造描述:"战场首领的王位。"
        SADDLEHORN = "鞍不用的时候还是取下来吧.",		-- 物品名:"鞍角" 制造描述:"把鞍具撬开。"
        SALTLICK = "今天你们就陪我一下吧，在我找到悠之前……",		-- 物品名:"舔盐块" 制造描述:"好好喂养你家的牲畜。"
        BRUSH = "让牛变得像悠一样干净",		-- 物品名:"刷子" 制造描述:"减缓皮弗娄牛毛发的生长速度。"
		SANITYROCK =
		{
			ACTIVE = "动，动起来了！悠，救命啊！",		-- 物品名:"方尖碑"->激活了
			INACTIVE = "它好像能动？",		-- 物品名:"方尖碑"->没有激活
		},
		SAPLING =
		{
			BURNING = "中奖的那个雪糕棍不会没了吧",		-- 物品名:"树苗"->正在燃烧
			WITHERED = "好热好热好热.",		-- 物品名:"树苗"->枯萎了
			GENERIC = "长着雪糕棍",		-- 物品名:"树苗"->默认
			PICKED = "上面没有雪糕棍了",		-- 物品名:"树苗"->被采完了
			DISEASED = "雪糕棍怎么长成这样了……",		-- 物品名:"树苗"->生病了
			DISEASING = "雪糕棍长势不对！",		-- 物品名:"树苗"->正在生病？？
		},
   		SCARECROW = 
   		{
			GENERIC = "悠，你听到了歌声吗？",		-- 物品名:"友善的稻草人"->默认 制造描述:"模仿最新的秋季时尚。"
			BURNING = "不妖！稻草人在哭泣啊！",		-- 物品名:"友善的稻草人"->正在燃烧 制造描述:"模仿最新的秋季时尚。"
			BURNT = "歌声也没有了……悠，你在哪啊",		-- 物品名:"友善的稻草人"->烧焦的 制造描述:"模仿最新的秋季时尚。"
   		},
   		SCULPTINGTABLE=
   		{
			EMPTY = "悠，给我搬点石料过来",		-- 物品名:"陶轮" 制造描述:"大理石在你手里将像黏土一样！"
			BLOCK = "悠，你来做吧……",		-- 物品名:"陶轮"->锁住了 制造描述:"大理石在你手里将像黏土一样！"
			SCULPTURE = "悠，快看看我做了什么！",		-- 物品名:"陶轮"->雕像做好了 制造描述:"大理石在你手里将像黏土一样！"
			BURNT = "无所谓了。",		-- 物品名:"陶轮"->烧焦的 制造描述:"大理石在你手里将像黏土一样！"
   		},
        SCULPTURE_KNIGHTHEAD = "其他部分在哪里？",		-- 物品名:"可疑的大理石"
		SCULPTURE_KNIGHTBODY = 
		{
			COVERED = "不详",		-- 物品名:"大理石雕像"->被盖住了-三基佬雕像可以敲大理石的时候
			UNCOVERED = "断了。",		-- 物品名:"大理石雕像"->没有被盖住-三基佬雕像被开采后
			FINISHED = "修复了，好累。",		-- 物品名:"大理石雕像"->三基佬雕像修好了
			READY = "好像……在动？悠，我有点怕",		-- 物品名:"大理石雕像"->准备好的 满的
		},
        SCULPTURE_BISHOPHEAD = "像个头",		-- 物品名:"可疑的大理石"
		SCULPTURE_BISHOPBODY = 
		{
			COVERED = "悠，我把它拼好了，厉害吧",		-- 物品名:"大理石雕像"->被盖住了-三基佬雕像可以敲大理石的时候
			UNCOVERED = "一块大东西失踪了。",		-- 物品名:"大理石雕像"->没有被盖住-三基佬雕像被开采后
			FINISHED = "怎么了？",		-- 物品名:"大理石雕像"->三基佬雕像修好了
			READY = "动起来了？悠，我，我害怕",		-- 物品名:"大理石雕像"->准备好的 满的
		},
        SCULPTURE_ROOKNOSE = "这是从哪里来的？",		-- 物品名:"可疑的大理石"
		SCULPTURE_ROOKBODY = 
		{
			COVERED = "积灰很深",		-- 物品名:"大理石雕像"->被盖住了-三基佬雕像可以敲大理石的时候
			UNCOVERED = "样子好奇怪。",		-- 物品名:"大理石雕像"->没有被盖住-三基佬雕像被开采后
			FINISHED = "舒服多了。",		-- 物品名:"大理石雕像"->三基佬雕像修好了
			READY = "这个东西在动？悠，你在附近吗？",		-- 物品名:"大理石雕像"->准备好的 满的
		},
        GARGOYLE_HOUND = "它会让我找到悠的。",		-- 物品名:"可疑的月岩"
        GARGOYLE_WEREPIG = "里面或许有悠的线索",		-- 物品名:"可疑的月岩"
		SEEDS = "种出什么？",		-- 物品名:"种子"
		SEEDS_COOKED = "瓜子已经有了，电脑和沙发呢？",		-- 物品名:"烤种子"
		SEWING_KIT = "我不要自己缝扣子！我拒绝！",		-- 物品名:"针线包" 制造描述:"缝补受损的衣物。"
		SEWING_TAPE = "我不想自己修补",		-- 物品名:"可靠的胶布" 制造描述:"缝补受损的衣物。"
		SHOVEL = "悠，该扫除了",		-- 物品名:"铲子" 制造描述:"挖掘各种各样的东西。"
		SILK = "有点恶心，但是很坚韧",		-- 物品名:"蜘蛛丝"
		SKELETON = "我要活下去，找到悠",		-- 物品名:"骷髅"
		SCORCHED_SKELETON = "悠，这里太可怕了",		-- 物品名:"易碎骨骼"
		SKULLCHEST = "不，不要打开它……",		-- 物品名:"骷髅箱"
		SMALLBIRD =
		{
			GENERIC = "悠不在这，我们相依为命",		-- 物品名:"小鸟"->默认
			HUNGRY = "我会努力学习烹饪的，你等一下",		-- 物品名:"小鸟"->有点饿了
			STARVING = "撑住，我马上给你弄吃的",		-- 物品名:"小鸟"->挨饿
			SLEEPING = "墨宝妈妈爱",		-- 物品名:"小鸟"->睡着了
		},
		SMALLMEAT = "这是什么肉来着",		-- 物品名:"小肉"
		SMALLMEAT_DRIED = "小了一点，没有悠的份了",		-- 物品名:"小风干肉"
		SPAT = "一个易怒的动物.",		-- 物品名:"钢羊"
		SPEAR = "我也可以保护悠了",		-- 物品名:"长矛" 制造描述:"使用尖的那一端。"
		SPEAR_WATHGRITHR = "很不适合女孩子啊",		-- 物品名:"战斗长矛" 制造描述:"黄金使它更锋利。"
		WATHGRITHRHAT = "好重，不过可以让我安心地去找悠",		-- 物品名:"战斗头盔" 制造描述:"独角兽是你的保护神。"
		SPIDER =
		{
			DEAD = "死了也还是恶心!",		-- 物品名:"蜘蛛"->死了
			GENERIC = "滚开啊！你们好丑！",		-- 物品名:"蜘蛛"->默认
			SLEEPING = "别在我家里睡觉",		-- 物品名:"蜘蛛"->睡着了
		},
		SPIDERDEN = "里面全是恶心的东西",		-- 物品名:"蜘蛛巢"
		SPIDEREGGSACK = "我，好恶心，我不想拿着了",		-- 物品名:"蜘蛛卵" 制造描述:"跟你的朋友寻求点帮助。"
		SPIDERGLAND = "味道奇怪，不过可以应急一下",		-- 物品名:"蜘蛛腺"
		SPIDERHAT = "又丑又黏，谁会戴上这个",		-- 物品名:"蜘蛛帽" 制造描述:"蜘蛛们会喊你\"妈妈\"。"
		SPIDERQUEEN = "啊啊啊!好大！好丑！好讨厌！",		-- 物品名:"蜘蛛女王"
		SPIDER_WARRIOR =
		{
			DEAD = "杀了你杀了你杀了你……已经死了啊",		-- 物品名:"蜘蛛战士"->死了
			GENERIC = "悠！我好害怕！",		-- 物品名:"蜘蛛战士"->默认
			SLEEPING = "快，快跑",		-- 物品名:"蜘蛛战士"->睡着了
		},
		SPOILED_FOOD = "已经长毛了，悠你快扔掉",		-- 物品名:"腐烂食物"
        STAGEHAND =
        {
			AWAKE = "哇！你不会是想抓我的辫子吧？",		-- 物品名:"舞台之手"->醒了
			HIDING = "悠，这个东西是不是跟了我一路？",		-- 物品名:"舞台之手"->藏起来了
        },
        STATUE_MARBLE = 
        {
            GENERIC = "不是悠，是谁呢",		-- 物品名:"大理石雕像"->默认
            TYPE1 = "没有头……这不是悠，这只是个雕塑！",		-- 物品名:"大理石雕像"->类型1
            TYPE2 = "还不错，可惜不是悠",		-- 物品名:"大理石雕像"->类型2
            TYPE3 = "可爱的花瓶。", --bird bath type statue		-- 物品名:"大理石雕像"
        },
		STATUEHARP = "竖琴……不会弹。",		-- 物品名:"竖琴雕像"
		STATUEMAXWELL = "真丑，比悠差太多了。",		-- 物品名:"麦斯威尔雕像"
		STEELWOOL = "这不是羊毛",		-- 物品名:"钢丝绵"
		STINGER = "叫你蛰我",		-- 物品名:"蜂刺"
		STRAWHAT = "悠，我戴上草帽是不是特别可爱？",		-- 物品名:"草帽" 制造描述:"帮助你保持清凉干爽。"
		STUFFEDEGGPLANT = "虽然不是咖喱，但是也很棒",		-- 物品名:"酿茄子"
		SWEATERVEST = "悠，我穿这个怎么样",		-- 物品名:"犬牙背心" 制造描述:"粗糙，但挺时尚。"
		REFLECTIVEVEST = "啊，还是好热啊，好热啊！",		-- 物品名:"清凉夏装" 制造描述:"穿上这件时尚的背心，让你神清气爽。"
		HAWAIIANSHIRT = "太花了",		-- 物品名:"花衬衫" 制造描述:"适合夏日穿着，或在周五便装日穿着。"
		TAFFY = "真的是太妃糖，好开心",		-- 物品名:"太妃糖"
		TALLBIRD = "悠，那大鸟好吓人",		-- 物品名:"高脚鸟"
		TALLBIRDEGG = "好大的蛋，会很好吃吧",		-- 物品名:"高脚鸟蛋"
		TALLBIRDEGG_COOKED = "好大一颗蛋，悠我们一起吃吧",		-- 物品名:"煎高脚鸟蛋"
		TALLBIRDEGG_CRACKED =
		{
			COLD = "让我来温暖你",		-- 物品名:"冻伤"->冷了
			GENERIC = "新的生命？",		-- 物品名:"孵化中的高脚鸟蛋"->默认
			HOT = "很热吗？我把雪糕给你",		-- 物品名:"中暑"->热了
			LONG = "我……可以再忍耐一会",		-- 物品名:"孵化中的高脚鸟蛋"->还需要很久
			SHORT = "悠，它快要诞生了！你快来看！",		-- 物品名:"孵化中的高脚鸟蛋"->很快了
		},
		TALLBIRDNEST =
		{
			GENERIC = "悠，你看那有一颗蛋！",		-- 物品名:"高脚鸟巢"->默认
			PICKED = "空巢的感受，我深有体会。",		-- 物品名:"高脚鸟巢"->被采完了
		},
		TEENBIRD =
		{
			GENERIC = "我该多珍惜你一些的",		-- 物品名:"小高脚鸟"->默认
			HUNGRY = "给你炖咖喱好吗？但我做的不好吃",		-- 物品名:"小高脚鸟"->有点饿了
			STARVING = "我这就给你弄吃的去.",		-- 物品名:"小高脚鸟"->挨饿
			SLEEPING = "墨宝妈妈爱",		-- 物品名:"小高脚鸟"->睡着了
		},
		TELEPORTATO_BASE =
		{
			ACTIVE = "有了这个我肯定可以穿越空间和时间!",		-- 物品名:"木制传送台"->激活了
			GENERIC = "这好像是跟另一个世界的连接点!",		-- 物品名:"木制传送台"->默认
			LOCKED = "还有一些未解之谜呢.",		-- 物品名:"木制传送台"->锁住了
			PARTIAL = "快乐,那个发明即将完成!",		-- 物品名:"木制传送台"->已经有部分了
		},
		TELEPORTATO_BOX = "这或许会控制整个宇宙的极性",		-- 物品名:"盒状零件"
		TELEPORTATO_CRANK = "强壮到足以应付最危险的实验",		-- 物品名:"曲柄零件"
		TELEPORTATO_POTATO = "这个金属制的土豆包含强大而又可怕的力量......",		-- 物品名:"金属土豆状零件"
		TELEPORTATO_RING = "一枚可以聚集空间能量的戒指",		-- 物品名:"环状零件"
		TELESTAFF = "带我去悠那里吧！能不能……",		-- 物品名:"传送魔杖" 制造描述:"穿越空间的法杖！时间要另外收费。"
		TENT = 
		{
			GENERIC = "家已经有了，但是悠呢",		-- 物品名:"帐篷"->默认 制造描述:"回复精神值，但要花费时间并导致饥饿。"
			BURNT = "我的家……又被烧毁了吗",		-- 物品名:"帐篷"->烧焦的 制造描述:"回复精神值，但要花费时间并导致饥饿。"
		},
		SIESTAHUT = 
		{
			GENERIC = "好热，我想睡一会……",		-- 物品名:"遮阳篷"->默认 制造描述:"躲避烈日，回复精神值。"
			BURNT = "连你也……被夏天击溃了吗",		-- 物品名:"遮阳篷"->烧焦的 制造描述:"躲避烈日，回复精神值。"
		},
		TENTACLE = "好，好恶心啊！！悠，悠你快来，快来啊……",		-- 物品名:"触手"
		TENTACLESPIKE = "有点恶心，但是好像很顺手",		-- 物品名:"触手尖刺"
		TENTACLESPOTS = "好丑的皮，湿乎乎的",		-- 物品名:"触手皮"
		TENTACLE_PILLAR = "我——才——不——跳！",		-- 物品名:"大触手"
        TENTACLE_PILLAR_HOLE = "似乎很臭,但值得探索.",		-- 物品名:"硕大的泥坑"
		TENTACLE_PILLAR_ARM = "悠，用的时候小心点",		-- 物品名:"小触手"
		TENTACLE_GARDEN = "我不跳，我不跳！",		-- 物品名:"大触手"
		TOPHAT = "悠，你戴上看看",		-- 物品名:"高礼帽" 制造描述:"最经典的帽子款式。"
		TORCH = "一丝安全感",		-- 物品名:"火炬" 制造描述:"可携带的光源。"
		TRANSISTOR = "电感，电抗，电容……天啊这都是什么",		-- 物品名:"电子元件" 制造描述:"科学至上！滋滋滋！"
		TRAP = "我想要一只鸟",		-- 物品名:"陷阱" 制造描述:"捕捉小型生物。"
		TRAP_TEETH = "应该能……代替悠保护我吧",		-- 物品名:"犬牙陷阱" 制造描述:"弹出来并咬伤任何踩到它的东西。"
		TRAP_TEETH_MAXWELL = "悠你小心！",		-- 物品名:"麦斯威尔的犬牙陷阱" 制造描述:"弹出来并咬伤任何踩到它的东西。"
		TREASURECHEST = 
		{
			GENERIC = "我的宝物只能我自己看",		-- 物品名:"箱子"->默认 制造描述:"一种结实的容器。"
			BURNT = "都……都没了……",		-- 物品名:"箱子"->烧焦的 制造描述:"一种结实的容器。"
		},
		TREASURECHEST_TRAP = "我感觉……有些危险",		-- 物品名:"宝箱"
		SACRED_CHEST = 
		{
			GENERIC = "这些财宝属于我和悠",		-- 物品名:"远古宝箱"->默认
			LOCKED = "在我找到悠之前，谁都不许动",		-- 物品名:"远古宝箱"->锁住了
		},
		TREECLUMP = "真碍事",		-- 物品名:"远古宝箱"
		TRINKET_1 = "怎么回事这个形状？", --Melted Marbles		-- 物品名:"熔化的弹珠"
		TRINKET_2 = "悠，你知道这是什么吗？", --Fake Kazoo		-- 物品名:"假卡祖笛"
		TRINKET_3 = "一团乱麻", --Gord's Knot		-- 物品名:"戈尔迪之结"
		TRINKET_4 = "它一定是某种宗教制品", --Gnome		-- 物品名:"地精爷爷"
		TRINKET_5 = "不幸的是,它太小了没法让我从此逃脱", --Toy Rocketship		-- 物品名:"迷你火箭"
		TRINKET_6 = "我不是电工", --Frazzled Wires		-- 物品名:"烂电线"
		TRINKET_7 = "我没有时间游戏和享乐!", --Ball and Cup		-- 物品名:"杯子和球"
		TRINKET_8 = "这东西有什么用……", --Rubber Bung		-- 物品名:"硬化橡胶塞"
		TRINKET_9 = "纽扣！我才不要缝纽扣", --Mismatched Buttons		-- 物品名:"不搭的纽扣"
		TRINKET_10 = "我希望能在需要用到这些东西之前就能离开这里.", --Dentures		-- 物品名:"二手假牙"
		TRINKET_11 = "他轻声地跟我说美丽的谎言", --Lying Robot		-- 物品名:"机器人玩偶"
		TRINKET_12 = "触手还能变成这样的吗？", --Dessicated Tentacle		-- 物品名:"干瘪的触手"
		TRINKET_13 = "这东西是什么材质的?", --Gnomette		-- 物品名:"地精奶奶"
		TRINKET_14 = "这不是什么好东西", --Leaky Teacup		-- 物品名:"漏水的茶杯"
		TRINKET_15 = "不可思议!这把吉他居然会缩水!", --Pawn		-- 物品名:"白色主教"
		TRINKET_16 = "什么风把这玩意吹到这儿来了?", --Pawn		-- 物品名:"黑色主教"
		TRINKET_17 = "还有一个在哪?", --Bent Spork		-- 物品名:"弯曲的叉子"
		TRINKET_18 = "一个逝去纪元的遗物!", --Trojan Horse		-- 物品名:"玩具木马"
		TRINKET_19 = "湿润的大脑.从来没有听说过...", --Unbalanced Top		-- 物品名:"失衡陀螺"
		TRINKET_20 = "我不确定是什么,但是让我感觉更聪明!", --Backscratcher		-- 物品名:"痒痒挠"
		TRINKET_21 = "我应该测量它来确定它的规模.", --Egg Beater		-- 物品名:"破搅拌器"
		TRINKET_22 = "我很确定有人想要这个.", --Frayed Yarn		-- 物品名:"磨损的纱线"
		TRINKET_23 = "某个人失信于他的诺言.", --Shoehorn		-- 物品名:"鞋拔子"
		TRINKET_24 = "我不要幸运，我只要悠", --Lucky Cat Jar		-- 物品名:"幸运猫扎尔"
		TRINKET_25 = "不能杀蚊子", --Air Unfreshener		-- 物品名:"臭气制造器"
		TRINKET_26 = "没有土豆泥", --Potato Cup		-- 物品名:"土豆杯"
		TRINKET_27 = "挺结实的", --Coat Hanger		-- 物品名:"钢丝衣架"
		TRINKET_28 = "战车。", --Rook		-- 物品名:"白色战车"
        TRINKET_29 = "载着我去悠那里", --Rook		-- 物品名:"黑色战车"
        TRINKET_30 = "悠一定会像白骑士一样迎接我", --Knight		-- 物品名:"白色骑士"
        TRINKET_31 = "你能代替悠来守护我吗？", --Knight		-- 物品名:"黑色骑士"
        TRINKET_32 = "锰球？铯球？我讨厌化学！", --Cubic Zirconia Ball		-- 物品名:"立方氧化锆球"
        TRINKET_33 = "悠，你再搭讪别人就把这个戴手上", --Spider Ring		-- 物品名:"蜘蛛指环"
        TRINKET_34 = "很欠打", --Monkey Paw		-- 物品名:"猴爪"
        TRINKET_35 = "做实验用的？讨厌。", --Empty Elixir		-- 物品名:"空的长生不老药"
        TRINKET_36 = "我的牙齿好得很", --Faux fangs		-- 物品名:"人造尖牙"
        TRINKET_37 = "木桩？", --Broken Stake		-- 物品名:"断桩"
        TRINKET_38 = "用这个来找找悠在哪……", -- Binoculars Griftlands trinket		-- 物品名:"双筒望远镜"
        TRINKET_39 = "像我一样，形单影只", -- Lone Glove Griftlands trinket		-- 物品名:"单只手套"
        TRINKET_40 = "这尺子都长歪了", -- Snail Scale Griftlands trinket		-- 物品名:"蜗牛秤"
        TRINKET_41 = "不是雪碧", -- Goop Canister Hot Lava trinket		-- 物品名:"黏液罐"
        TRINKET_42 = "呀！吓我一跳。", -- Toy Cobra Hot Lava trinket		-- 物品名:"玩具眼镜蛇"
        TRINKET_43= "正常的玩具", -- Crocodile Toy Hot Lava trinket		-- 物品名:"鳄鱼玩具"
        TRINKET_44 = "碎了，看不到悠了", -- Broken Terrarium ONI trinket		-- 物品名:"破碎的玻璃罐"
        TRINKET_45 = "在说什么？与悠有关吗？", -- Odd Radio ONI trinket		-- 物品名:"奇怪的收音机"
        TRINKET_46 = "悠，你会修吗？", -- Hairdryer ONI trinket		-- 物品名:"损坏的吹风机"
        LOST_TOY_1  = "这个玻璃球是谁丢的呢",		-- 物品名:"遗失的玻璃球"
        LOST_TOY_2  = "我好像听过这个的传说",		-- 物品名:"多愁善感的卡祖笛"
        LOST_TOY_7  = "悠好像教过我怎么玩",		-- 物品名:"珍视的抽线陀螺"
        LOST_TOY_10 = "谁这么不小心,牙齿都丢了",		-- 物品名:"缺少的牙齿"
        LOST_TOY_11 = "看起来好像挺贵的",		-- 物品名:"珍贵的玩具机器人"
        LOST_TOY_14 = "这让我想到了妈妈",		-- 物品名:"妈妈最爱的茶杯"
        LOST_TOY_18 = "这是谁丢的",		-- 物品名:"宝贵的玩具木马"
        LOST_TOY_19 = "悠好像教过我怎么玩",		-- 物品名:"最爱的陀螺"
        LOST_TOY_42 = "这是?",		-- 物品名:"装错的玩具眼镜蛇"
        LOST_TOY_43 = "唔,是哪个粗心的蓝孩子丢的",		-- 物品名:"宠爱的鳄鱼玩具"
        HALLOWEENCANDY_1 = "我好像很久没见过苹果了",		-- 物品名:"糖果苹果"
        HALLOWEENCANDY_2 = "悠，我有玉米，你能做吗",		-- 物品名:"糖果玉米"
        HALLOWEENCANDY_3 = "那……也叫玉米？",		-- 物品名:"不太甜的玉米"
        HALLOWEENCANDY_4 = "我要把你扯成碎片……还是好恶心",		-- 物品名:"粘液蜘蛛"
        HALLOWEENCANDY_5 = "奇怪的糖",		-- 物品名:"浣猫糖果"
        HALLOWEENCANDY_6 = "这么点糖",		-- 物品名:"\"葡萄干\""
        HALLOWEENCANDY_7 = "太少了",		-- 物品名:"葡萄干"
        HALLOWEENCANDY_8 = "虽然是幽灵，但并不是凉飕飕的",		-- 物品名:"鬼魂棒棒糖"
        HALLOWEENCANDY_9 = "就算是果冻也太恶心了",		-- 物品名:"果冻虫"
        HALLOWEENCANDY_10 = "悠，我要正常的棒棒糖！",		-- 物品名:"触须棒棒糖"
        HALLOWEENCANDY_11 = "就当是悠送我的",		-- 物品名:"巧克力猪"
        HALLOWEENCANDY_12 = "每个含有600千卡……谁会吃虫子啊！！", --ONI meal lice candy		-- 物品名:"糖果虱"
        HALLOWEENCANDY_13 = "好硬，比雪糕还硬", --Griftlands themed candy		-- 物品名:"无敌硬糖"
        HALLOWEENCANDY_14 = "这糖是哪国的？", --Hot Lava pepper candy		-- 物品名:"熔岩椒"
        CANDYBAG = "悠，我给你留了一部分",		-- 物品名:"糖果袋" 制造描述:"只带万圣夜好吃的东西。"
		HALLOWEEN_ORNAMENT_1 = "我是小幽灵~",		-- 物品名:"幽灵装饰"
		HALLOWEEN_ORNAMENT_2 = "蝙蝠好讨厌，不要",		-- 物品名:"蝙蝠装饰"
		HALLOWEEN_ORNAMENT_3 = "蜘蛛啊！原来是饰品？悠快把它扔掉", 		-- 物品名:"蜘蛛装饰"
		HALLOWEEN_ORNAMENT_4 = "近距离看的话……还是很恶心啊！",		-- 物品名:"触手装饰"
		HALLOWEEN_ORNAMENT_5 = "悠，你要是抛弃我，我就把这东西挂在你的床上",		-- 物品名:"悬垂蜘蛛装饰"
		HALLOWEEN_ORNAMENT_6 = "不吉利，我不喜欢", 		-- 物品名:"乌鸦装饰"
		HALLOWEENPOTION_DRINKS_WEAK = "这个好像能喝，悠你先试试",		-- 物品名:"远古宝箱"
		HALLOWEENPOTION_DRINKS_POTENT = "这药水很强力，悠你先试试。",		-- 物品名:"远古宝箱"
        HALLOWEENPOTION_BRAVERY = "悠，我变得勇敢了……虽然是药水的作用",		-- 物品名:"远古宝箱"
		HALLOWEENPOTION_MOON = "这个会让我变漂亮吗",		-- 物品名:"月亮精华液"
		HALLOWEENPOTION_FIRE_FX = "这不是喝的……好像很危险！", 		-- 物品名:"远古宝箱"
		MADSCIENCE_LAB = "我讨厌上学……不过这个好像挺有意思的",		-- 物品名:"疯狂科学家实验室" 制造描述:"疯狂实验无极限。唯独神智有极限。"
		LIVINGTREE_ROOT = "好像还有一些，悠你帮我挖出来", 		-- 物品名:"完全正常的树根"
		LIVINGTREE_SAPLING = "悠，我打赌这树不一样！",		-- 物品名:"完全正常的树苗"
        DRAGONHEADHAT = "悠不在，那就只有我当头了",		-- 物品名:"幸运兽脑袋" 制造描述:"野兽装束的前端。"
        DRAGONBODYHAT = "后面的，别踩到我的头发了！",		-- 物品名:"幸运兽躯体" 制造描述:"野兽装束的中间部分。"
        DRAGONTAILHAT = "悠尾续龙",		-- 物品名:"幸运兽尾巴" 制造描述:"野兽装束的尾端。"
        PERDSHRINE =
        {
            GENERIC = "告诉我悠在哪",		-- 物品名:"火鸡神龛"->默认 制造描述:"供奉庄严之火鸡。"
            EMPTY = "你要什么才能告诉我悠的下落？",		-- 物品名:"火鸡神龛" 制造描述:"供奉庄严之火鸡。"
            BURNT = "没有变成烤鸡。",		-- 物品名:"火鸡神龛"->烧焦的 制造描述:"供奉庄严之火鸡。"
        },
        REDLANTERN = "本该是团聚的日子……可是悠呢？",		-- 物品名:"红灯笼" 制造描述:"照亮你的路的幸运灯笼。"
        LUCKY_GOLDNUGGET = "悠，我们有钱去欧洲了",		-- 物品名:"幸运黄金"
        FIRECRACKERS = "看到爆竹就想到元旦，说到元旦……悠你在哪啊",		-- 物品名:"红鞭炮" 制造描述:"用重击来庆祝！"
        PERDFAN = "夏天会给我带来凉爽和好运吗",		-- 物品名:"幸运扇" 制造描述:"额外的运气，超级多。"
        REDPOUCH = "压岁钱吗",		-- 物品名:"红袋子"
        WARGSHRINE = 
        {
            GENERIC = "现在你该告诉我悠去哪了吧",		-- 物品名:"座狼神龛"->默认 制造描述:"供奉陶土之座狼。"
            EMPTY = "嗷~~谁要祭拜你",		-- 物品名:"座狼神龛" 制造描述:"供奉陶土之座狼。"
            BURNT = "既然不知道，那就只能烧掉了",		-- 物品名:"座狼神龛"->烧焦的 制造描述:"供奉陶土之座狼。"
        },
        CLAYWARG = 
        {
        	GENERIC = "这大狗能动！悠，救我啊！",		-- 物品名:"黏土座狼"->默认
        	STATUE = "黏土做的？如此栩栩如生",		-- 物品名:"黏土座狼"->雕像
        },
        CLAYHOUND = 
        {
        	GENERIC = "为什么黏土也会这么凶啊！悠，救我啊！",		-- 物品名:"黏土猎犬"->默认
        	STATUE = "虽然小了点，但是非常精致",		-- 物品名:"黏土猎犬"->雕像
        },
        HOUNDWHISTLE = "悠你看，狗狗会跟着我走的",		-- 物品名:"幸运哨子" 制造描述:"对野猎犬吹哨。"
        CHESSPIECE_CLAYHOUND = "这东西能栓住我的烦恼。",		-- 物品名:"猎犬雕塑"
        CHESSPIECE_CLAYWARG = "这家伙终于安静了……",		-- 物品名:"座狼雕塑"
		PIGSHRINE =
		{
            GENERIC = "和猪交易？我有点怕",		-- 物品名:"猪神龛"->默认 制造描述:"供奉富饶之猪人。"
            EMPTY = "把悠的那份肉分给他们一点？",		-- 物品名:"猪神龛" 制造描述:"供奉富饶之猪人。"
            BURNT = "烧掉了。",		-- 物品名:"猪神龛"->烧焦的 制造描述:"供奉富饶之猪人。"
		},
		PIG_TOKEN = "这腰带太粗了，悠也戴不上。",		-- 物品名:"金色腰带"
		PIG_COIN = "可以用它雇佣个护卫",		-- 物品名:"猪鼻铸币"
		YOTP_FOOD1 = "悠，我们一起吃。",		-- 物品名:"致敬烤肉" 制造描述:"向猪王敬肉。"
		YOTP_FOOD2 = "只有猪会吃这种东西",		-- 物品名:"八宝泥馅饼" 制造描述:"那里隐藏着什么？"
		YOTP_FOOD3 = "没有鱼丸串吗",		-- 物品名:"鱼头串" 制造描述:"棍子上的荣华富贵。"
		PIGELITE1 = "你在看什么？", --BLUE		-- 物品名:"韦德"
		PIGELITE2 = "不许拽我鞭子！", --RED		-- 物品名:"伊格内修斯"
		PIGELITE3 = "你跟我有仇吗？一直追着我打", --WHITE		-- 物品名:"德米特里"
		PIGELITE4 = "如果我和悠一起，怎么会怕你们", --GREEN		-- 物品名:"索耶"
		PIGELITEFIGHTER1 = "暴风雨在他体内肆虐着。", --BLUE		-- 物品名:"韦德"
		PIGELITEFIGHTER2 = "怒不可遏。", --RED		-- 物品名:"伊格内修斯"
		PIGELITEFIGHTER3 = "他的整个职业生涯都以暴力为基础。", --WHITE		-- 物品名:"德米特里"
		PIGELITEFIGHTER4 = "石化。", --GREEN		-- 物品名:"索耶"
		CARRAT_GHOSTRACER = "就是个影子而已。",		-- 物品名:"查理的胡萝卜鼠"
        YOTC_CARRAT_RACE_START = "加油,冲向终点",		-- 物品名:"起点" 制造描述:"冲向比赛！"
        YOTC_CARRAT_RACE_CHECKPOINT = "快快,快去下一站",		-- 物品名:"检查点" 制造描述:"通往光荣之路上的一站。"
        YOTC_CARRAT_RACE_FINISH =
        {
            GENERIC = "终点就在那儿",		-- 物品名:"终点线"->默认 制造描述:"你走投无路了。"
            BURNT = "是谁放的火",		-- 物品名:"终点线"->烧焦的 制造描述:"你走投无路了。"
            I_WON = "悠，我赢了，快奖励我",		-- 物品名:"终点线" 制造描述:"你走投无路了。"
            SOMEONE_ELSE_WON = "这次是你赢了，下次我要赢回来。",		-- 物品名:"终点线" 制造描述:"你走投无路了。"
        },
		YOTC_CARRAT_RACE_START_ITEM = "从哪里开始呢",		-- 物品名:"起点套装" 制造描述:"冲向比赛！"
        YOTC_CARRAT_RACE_CHECKPOINT_ITEM = "冲向那儿",		-- 物品名:"检查点套装" 制造描述:"通往光荣之路上的一站。"
		YOTC_CARRAT_RACE_FINISH_ITEM = "到哪里结束呢",		-- 物品名:"终点线套装" 制造描述:"你走投无路了。"
		YOTC_SEEDPACKET = "我们来种点蔬菜吧",		-- 物品名:"种子包" 制造描述:"一包普通的混合种子。"
		YOTC_SEEDPACKET_RARE = "一定能种出好的咖喱食材",		-- 物品名:"高级种子包" 制造描述:"一包高质量的种子。"
		MINIBOATLANTERN = "带着我的思念找到悠吧",		-- 物品名:"漂浮灯笼" 制造描述:"闪着暖暖的光亮。"
        YOTC_CARRATSHRINE =
        {
            GENERIC = "叉依姬?哦不这是胡萝卜鼠神龛",		-- 物品名:"胡萝卜鼠神龛"->默认 制造描述:"供奉灵巧之胡萝卜鼠。"
            EMPTY = "它应该喜欢胡萝卜吧",		-- 物品名:"胡萝卜鼠神龛" 制造描述:"供奉灵巧之胡萝卜鼠。"
            BURNT = "是谁这么坏啊",		-- 物品名:"胡萝卜鼠神龛"->烧焦的 制造描述:"供奉灵巧之胡萝卜鼠。"
        },
        YOTC_CARRAT_GYM_DIRECTION = 
        {
            GENERIC = "我应该锻炼下我养的胡萝卜鼠",		-- 物品名:"方向健身房"->默认
            RAT = "带着我,找到悠",		-- 物品名:"方向健身房"
            BURNT = "是谁这么坏啊",		-- 物品名:"方向健身房"->烧焦的
        },
        YOTC_CARRAT_GYM_SPEED = 
        {
            GENERIC = "我应该锻炼下我养的胡萝卜鼠",		-- 物品名:"速度健身房"->默认
            RAT = "加油！跑快快！",		-- 物品名:"速度健身房"
            BURNT = "是谁这么坏啊",		-- 物品名:"速度健身房"->烧焦的
        },
        YOTC_CARRAT_GYM_REACTION = 
        {
            GENERIC = "我应该锻炼下我养的胡萝卜鼠",		-- 物品名:"反应健身房"->默认
            RAT = "别再原地犯傻了",		-- 物品名:"反应健身房"
            BURNT = "是谁这么坏啊",		-- 物品名:"反应健身房"->烧焦的
        },
        YOTC_CARRAT_GYM_STAMINA = 
        {
            GENERIC = "我应该锻炼下我养的胡萝卜鼠",		-- 物品名:"耐力健身房"->默认
            RAT = "加油，你马上就能吃到了",		-- 物品名:"耐力健身房"
            BURNT = "是谁这么坏啊",		-- 物品名:"耐力健身房"->烧焦的
        }, 
        YOTC_CARRAT_GYM_DIRECTION_ITEM = "这个可以锻炼胡萝卜鼠的方向感",		-- 物品名:"方向健身房套装" 制造描述:"提高你的胡萝卜鼠的方向感。"
        YOTC_CARRAT_GYM_SPEED_ITEM = "这能让胡萝卜鼠跑的更快",		-- 物品名:"速度健身房套装" 制造描述:"增加你的胡萝卜鼠的速度。"
        YOTC_CARRAT_GYM_STAMINA_ITEM = "小家伙努力锻炼的地方",		-- 物品名:"耐力健身房套装" 制造描述:"增强你的胡萝卜鼠的耐力。"
        YOTC_CARRAT_GYM_REACTION_ITEM = "打地鼠？打胡萝卜鼠！",		-- 物品名:"反应健身房套装" 制造描述:"加快你的胡萝卜鼠的反应时间。"
        YOTC_CARRAT_SCALE_ITEM = "查看小家伙的能力",           		-- 物品名:"胡萝卜鼠秤套装" 制造描述:"看看你的胡萝卜鼠的情况。"
        YOTC_CARRAT_SCALE = 
        {
            GENERIC = "胡萝卜鼠有多重呢？",		-- 物品名:"胡萝卜鼠秤"->默认
            CARRAT = "我小可爱要来咯！",		-- 物品名:"胡萝卜鼠" 制造描述:"灵巧机敏，富含胡萝卜素。"
            CARRAT_GOOD = "看起来挺不错。",		-- 物品名:"胡萝卜鼠秤"
            BURNT = "是谁这么坏啊",		-- 物品名:"胡萝卜鼠秤"->烧焦的
        },                
        YOTB_BEEFALOSHRINE =
        {
            GENERIC = "这头驮重物的野兽能获得最高荣誉。",		-- 物品名:"皮弗娄牛神龛"->默认 制造描述:"供奉坚毅的皮弗娄牛。"
            EMPTY = "它要供品。",		-- 物品名:"皮弗娄牛神龛" 制造描述:"供奉坚毅的皮弗娄牛。"
            BURNT = "烧得什么也没剩下。",		-- 物品名:"皮弗娄牛神龛"->烧焦的 制造描述:"供奉坚毅的皮弗娄牛。"
        },
        BEEFALO_GROOMER =
        {
            GENERIC = "把我的牛打扮的漂漂亮亮的",		-- 物品名:"皮弗娄牛美妆台"->默认-
            OCCUPIED = "等他用完吧",		-- 物品名:"皮弗娄牛美妆台"->被占领
            BURNT = "烧成了灰烬。",		-- 物品名:"皮弗娄牛美妆台"->烧焦的
        },
        BEEFALO_GROOMER_ITEM = "牛牛的化妆台",		-- 物品名:"美妆台套装" 制造描述:"美牛原型机。"
		BISHOP_CHARGE_HIT = "啊",		-- 物品名:"皮弗娄牛美妆台"->被主教攻击
		TRUNKVEST_SUMMER = "穿上也还是好热啊",		-- 物品名:"透气背心" 制造描述:"暖和，但算不上非常暖和。"
		TRUNKVEST_WINTER = "我穿着一头大象",		-- 物品名:"松软背心" 制造描述:"足以抵御冬季暴雪的保暖背心。"
		TRUNK_COOKED = "好香！不舍得吃啊",		-- 物品名:"象鼻排"
		TRUNK_SUMMER = "吃掉这个会不会太奢侈了",		-- 物品名:"象鼻"
		TRUNK_WINTER = "这个好像可以做成很好的东西……但我讨厌针线活！",		-- 物品名:"冬象鼻"
		TUMBLEWEED = "像我一样漂泊不定.",		-- 物品名:"风滚草"
		TURKEYDINNER = "悠，今天的晚餐好丰盛，我要开动了！",		-- 物品名:"火鸡大餐"
		TWIGS = "怎么还没找到中奖标记呢？",		-- 物品名:"树枝"
		UMBRELLA = "悠，帮我打伞",		-- 物品名:"雨伞" 制造描述:"遮阳挡雨！"
		GRASS_UMBRELLA = "还是好热",		-- 物品名:"花伞" 制造描述:"漂亮轻便的保护伞。"
		UNIMPLEMENTED = "能不能快一点！",		-- 物品名:"皮弗娄牛美妆台"
		WAFFLES = "我在是否要加更多糖汁上犹豫不决.",		-- 物品名:"华夫饼"
		WALL_HAY = 
		{	
			GENERIC = "毫无安全感",		-- 物品名:"草墙"->默认
			BURNT = "悠，我还是需要你保护啊",		-- 物品名:"草墙"->烧焦的
		},
		WALL_HAY_ITEM = "装饰品，而且很粗糙",		-- 物品名:"草墙" 制造描述:"草墙墙体。不太结实。"
		WALL_STONE = "好像能安全点了",		-- 物品名:"石墙"
		WALL_STONE_ITEM = "就算没有悠，这也能安全一点了吧",		-- 物品名:"石墙" 制造描述:"石墙墙体。"
		WALL_RUINS = "铝墙？铬墙？我讨厌化学！",		-- 物品名:"铥矿墙"
		WALL_RUINS_ITEM = "是锶块，还是锝块……啊我讨厌化学！",		-- 物品名:"铥矿墙" 制造描述:"这些墙可以承受相当多的打击。"
		WALL_WOOD = 
		{
			GENERIC = "你不能像悠一样保护我",		-- 物品名:"木墙"->默认
			BURNT = "太不安全了",		-- 物品名:"木墙"->烧焦的
		},
		WALL_WOOD_ITEM = "比装饰品强点",		-- 物品名:"木墙" 制造描述:"木墙墙体。"
		WALL_MOONROCK = "没有悠在，你会守护我吧",		-- 物品名:"月岩墙"
		WALL_MOONROCK_ITEM = "非常坚硬的墙，就像悠一样给我安全感",		-- 物品名:"月岩墙" 制造描述:"月球疯子之墙。"
		FENCE = "这可拦不住班长.",		-- 物品名:"木栅栏"
        FENCE_ITEM = "我要自己保护自己了",		-- 物品名:"木栅栏" 制造描述:"木栅栏部分。"
        FENCE_GATE = "要是悠记得锁门就好了",		-- 物品名:"木门"
        FENCE_GATE_ITEM = "有门才有家，有家才……也没有悠。",		-- 物品名:"木门" 制造描述:"木栅栏的门。"
		WALRUS = "悠，有人要杀我啊！",		-- 物品名:"海象"
		WALRUSHAT = "悠，我给你捡到了一定好帽子啊",		-- 物品名:"贝雷帽"
		WALRUS_CAMP =
		{
			EMPTY = "空了，但是锁门了",		-- 物品名:"海象营地"
			GENERIC = "谁？谁住在这里？",		-- 物品名:"海象营地"->默认
		},
		WALRUS_TUSK = "悠你看，我才是猎人",		-- 物品名:"海象牙"
		WARDROBE = 
		{
			GENERIC = "它掌控着黑暗，禁用的秘密。。。",		-- 物品名:"衣柜"->默认 制造描述:"随心变换面容。"
            BURNING = "烧！烧！烧！",		-- 物品名:"衣柜"->正在燃烧 制造描述:"随心变换面容。"
			BURNT = "那个已经落伍了。",		-- 物品名:"衣柜"->烧焦的 制造描述:"随心变换面容。"
		},
		WARG = "好凶！悠，我……你不要吠了！",		-- 物品名:"座狼"
		WASPHIVE = "你，你们想干什么？悠！我害怕！",		-- 物品名:"杀人蜂蜂窝"
		WATERBALLOON = "悠，我们玩水球！",		-- 物品名:"水球" 制造描述:"球体灭火。"
		WATERMELON = "只有西瓜可以击败夏天",		-- 物品名:"西瓜"
		WATERMELON_COOKED = "不凉爽了啊",		-- 物品名:"烤西瓜"
		WATERMELONHAT = "为了凉爽的夏日，这不算什么……",		-- 物品名:"西瓜帽" 制造描述:"提神醒脑，但感觉黏黏的。"
		WAXWELLJOURNAL = "完全看不懂。学校里也不会教。",		-- 物品名:"暗影秘典" 制造描述:"这将让你大吃一惊。"
		WETGOOP = "我会做出能让悠喜欢的菜的",		-- 物品名:"失败料理"
        WHIP = "这下你们都可以乖乖地滚开了",		-- 物品名:"皮鞭" 制造描述:"提出有建设性的反馈意见。"
		WINTERHAT = "暖暖的，就是头发放不进去啊",		-- 物品名:"冬帽" 制造描述:"保持脑袋温暖。"
		WINTEROMETER = 
		{
			GENERIC = "明天会不会凉快点？",		-- 物品名:"温度测量仪"->默认 制造描述:"测量环境气温。"
			BURNT = "一定很热",		-- 物品名:"温度测量仪"->烧焦的 制造描述:"测量环境气温。"
		},
        WINTER_TREE =
        {
            BURNT = "不会再有圣诞老人了吗……",		-- 物品名:"冬季圣诞树"->烧焦的
            BURNING = "不要！快灭火！我要这棵树！",		-- 物品名:"冬季圣诞树"->正在燃烧
            CANDECORATE = "悠，快把我们的装饰品拿过来！",		-- 物品名:"冬季圣诞树"->烛台？？？
            YOUNG = "圣诞树，圣诞树！",		-- 物品名:"冬季圣诞树"->还年轻
        },
		WINTER_TREESTAND = 
		{
			GENERIC = "悠，我们来种一棵圣诞树！",		-- 物品名:"圣诞树墩"->默认 制造描述:"种植并装饰一棵冬季圣诞树！"
            BURNT = "连圣诞树也……",		-- 物品名:"圣诞树墩"->烧焦的 制造描述:"种植并装饰一棵冬季圣诞树！"
		},
        WINTER_ORNAMENT = "圣诞来了，可是悠呢",		-- 物品名:"圣诞小玩意"
        WINTER_ORNAMENTLIGHT = "悠，我们一起装扮圣诞树啊？",		-- 物品名:"圣诞灯"
        WINTER_ORNAMENTBOSS = "这个令人印象特别深刻。",		-- 物品名:"华丽的装饰"
		WINTER_ORNAMENTFORGE = "好像是战士的奖品……不是给我的",		-- 物品名:"熔炉装饰"
		WINTER_ORNAMENTGORGE = "是厨神的奖励吗？可我的厨艺肯定不行",		-- 物品名:"暴食装饰"
        WINTER_FOOD1 = "悠，听说圣诞节要做姜饼屋……", --gingerbread cookie		-- 物品名:"小姜饼"
        WINTER_FOOD2 = "牙疼", --sugar cookie		-- 物品名:"糖曲奇饼"
        WINTER_FOOD3 = "不能帮我走路", --candy cane		-- 物品名:"拐杖糖"
        WINTER_FOOD4 = "太难吃了，悠，你可以拿去送人。", --fruitcake		-- 物品名:"永远的水果蛋糕"
        WINTER_FOOD5 = "我是在啃木头吗……", --yule log cake		-- 物品名:"巧克力树洞蛋糕"
        WINTER_FOOD6 = "一口一个", --plum pudding		-- 物品名:"李子布丁"
        WINTER_FOOD7 = "这是苹果？但我不能喝酒。", --apple cider		-- 物品名:"苹果酒"
        WINTER_FOOD8 = "趁着冬天喝掉吧", --hot cocoa		-- 物品名:"热可可"
        WINTER_FOOD9 = "好吃……呀，没给悠留一份", --eggnog		-- 物品名:"美味的蛋酒"
		WINTERSFEASTOVEN =
		{
			GENERIC = "温暖的火炉。",		-- 物品名:"砖砌烤炉"->默认 制造描述:"燃起了喜庆的火焰。"
			COOKING = "会是什么好吃的呢？",		-- 物品名:"砖砌烤炉"->无效 制造描述:"燃起了喜庆的火焰。"
			ALMOST_DONE_COOKING = "好耶！",		-- 物品名:"砖砌烤炉" 制造描述:"燃起了喜庆的火焰。"
			DISH_READY = "小小的吃一口不会被发现吧？",		-- 物品名:"砖砌烤炉" 制造描述:"燃起了喜庆的火焰。"
		},
		BERRYSAUCE = "希望不会有火鸡来抢它…",		-- 物品名:"快乐浆果酱"
		BIBINGKA = "嗯，十分好吃，就是有点儿干...",		-- 物品名:"比宾卡米糕"
		CABBAGEROLLS = "不太喜欢的口感，不过还不错。",		-- 物品名:"白菜卷"
		FESTIVEFISH = "喜庆的料理。",		-- 物品名:"节庆鱼料理"
		GRAVY = "拌饭应该会非常好吃。",		-- 物品名:"好肉汁"
		LATKES = "这个比面包还噎人...",		-- 物品名:"土豆饼"
		LUTEFISK = "会是什么口感呢？",		-- 物品名:"苏打鱼"
		MULLEDDRINK = "不了不了，不喝酒。",		-- 物品名:"香料潘趣酒"
		PANETTONE = "好甜，好喜欢。",		-- 物品名:"托尼甜面包"
		PAVLOVA = "蛋糕啊，希望悠也能尝尝。",		-- 物品名:"巴甫洛娃蛋糕"
		PICKLEDHERRING = "略有些反感的味道。",		-- 物品名:"腌鲱鱼"
		POLISHCOOKIE = "香香的，酥酥的。",		-- 物品名:"波兰饼干"
		PUMPKINPIE = "南瓜独有的甜蜜香气。",		-- 物品名:"南瓜派"
		ROASTTURKEY = "火鸡肉或许有些柴。",		-- 物品名:"烤火鸡"
		STUFFING = "希望能给我来一杯饮料。",		-- 物品名:"烤火鸡面包馅"
		SWEETPOTATO = "冬天就应该吃这个！",		-- 物品名:"红薯焗饭"
		TAMALES = "不错的美食。",		-- 物品名:"塔马利"
		TOURTIERE = "越吃越饿...",		-- 物品名:"饕餮馅饼"
		TABLE_WINTERS_FEAST = 
		{
			GENERIC = "多叫上几个人一起吧。",		-- 物品名:"冬季盛宴餐桌"->默认 制造描述:"一起来享用冬季盛宴吧。"
			HAS_FOOD = "看起来非常的华丽。",		-- 物品名:"冬季盛宴餐桌" 制造描述:"一起来享用冬季盛宴吧。"
			WRONG_TYPE = "很好很好。",		-- 物品名:"冬季盛宴餐桌" 制造描述:"一起来享用冬季盛宴吧。"
			BURNT = "是谁这么坏啊",		-- 物品名:"冬季盛宴餐桌"->烧焦的 制造描述:"一起来享用冬季盛宴吧。"
		},
		GINGERBREADWARG = "我可以去啃一口吗？", 		-- 物品名:"姜饼座狼"
		GINGERBREADHOUSE = "短糖果屋，我的最爱。", 		-- 物品名:"姜饼猪屋"
		GINGERBREADPIG = "你还好吗，小可爱？",		-- 物品名:"姜饼猪"
		CRUMBS = "再不吃掉就会消失了。",		-- 物品名:"饼干屑"
		WINTERSFEASTFUEL = "像玻璃珠一样的晶莹透亮。",		-- 物品名:"节日欢愉"
        KLAUS = "把你的包裹交出来，它已经属于悠了！",		-- 物品名:"克劳斯"
        KLAUS_SACK = "我先拿，剩下的都是悠的",		-- 物品名:"赃物袋"
		KLAUSSACKKEY = "我先挑礼物，剩下的是悠的~",		-- 物品名:"麋鹿茸"
		WORMHOLE =
		{
			GENERIC = "悠，要不你先跳一下……",		-- 物品名:"虫洞"->默认
			OPEN = "更吓人了，我才不跳！",		-- 物品名:"虫洞"->打开
		},
		WORMHOLE_LIMITED = "我才不会跳进去的",		-- 物品名:"生病的虫洞"->一次性虫洞 单机
		ACCOMPLISHMENT_SHRINE = "我想要利用它,而且我还想要世界知道我这样做了.",        		-- 物品名:"奖杯" 制造描述:"证明你作为一个人的价值。"
		LIVINGTREE = "你在偷窥我？",		-- 物品名:"完全正常的树"
		ICESTAFF = "冰淇淋机，嘿嘿.",		-- 物品名:"冰魔杖" 制造描述:"把敌人冰冻在原地。"
		REVIVER = "这个世界和那个世界，哪个才是隐世！",		-- 物品名:"告密的心" 制造描述:"鬼魂朋友复活了，好可怕。"
		SHADOWHEART = "生命力好强，能够唤醒谁呢？会不会是悠？",		-- 物品名:"暗影心房"
        ATRIUM_RUBBLE = 
        {
			LINE_1 = "它描绘了一个古老的文明。这些人看起来又饿又怕。",		-- 物品名:"远古壁画"->第一行
			LINE_2 = "这些石碑已经难以辨认了。",		-- 物品名:"远古壁画"->第二行
			LINE_3 = "有什么邪恶的力量笼罩着这座城市和这里人们。",		-- 物品名:"远古壁画"->第三行
			LINE_4 = "人们的皮肤开始脱落，变成了另一种存在。",		-- 物品名:"远古壁画"->第四行
			LINE_5 = "它展示了一个科技发达的宏伟的城市。",		-- 物品名:"远古壁画"->第五行
		},
        ATRIUM_STATUE = "这显然不是悠的雕像",		-- 物品名:"远古雕像"
        ATRIUM_LIGHT = 
        {
			ON = "悠，你看这灯柱有什么秘密？",		-- 物品名:"远古灯柱"->开启
			OFF = "悠，如何才能把它点亮呢？",		-- 物品名:"远古灯柱"->关闭
		},
        ATRIUM_GATE =
        {
			ON = "打开了！悠……不是悠吗？",		-- 物品名:"远古大门"->开启
			OFF = "悠会在这里吗？我该不该打开它",		-- 物品名:"远古大门"->关闭
			CHARGING = "它在充能，会和悠有关吗？",		-- 物品名:"远古大门"->充能中
			DESTABILIZING = "怎，怎么回事？我该离开还是……说不定悠就在……",		-- 物品名:"远古大门"->不稳定
			COOLDOWN = "我只弄明白了一件事，悠不在这里。",		-- 物品名:"远古大门"->冷却中
        },
        ATRIUM_KEY = "它究竟是哪里的钥匙？关着悠的监牢吗？",		-- 物品名:"远古钥匙"
		LIFEINJECTOR = "能让我的病好一些吗？",		-- 物品名:"强心针" 制造描述:"提高下你那日渐衰退的最大健康值吧。"
		SKELETON_PLAYER =
		{
			MALE = "这是 %s ，不是悠",		-- 物品名:"骷髅"->男性
			FEMALE = "这是 %s ，不是悠",		-- 物品名:"骷髅"->女性
			ROBOT = "这是 %s ，不是悠",		-- 物品名:"骷髅"->机器人
			DEFAULT = "这是 %s ，不是悠",		-- 物品名:"物品栏物品"->默认
		},
		ROCK_MOON = "悠，这石头好奇怪，难道是月亮上来的？",		-- 物品名:"岩石"
		MOONROCKNUGGET = "好硬",		-- 物品名:"月岩"
		MOONROCKCRATER = "把宝石放在这里吗？我还想带着去欧洲呢",		-- 物品名:"带孔月岩" 制造描述:"用于划定地盘的岩石。"
		MOONROCKSEED = "我听见了悠的声音！",		-- 物品名:"天体宝球"
        REDMOONEYE = "能让我看到远方的悠吗？",		-- 物品名:"红色月眼"
        PURPLEMOONEYE = "把这个送给悠怎么样呢",		-- 物品名:"紫色月眼"
        GREENMOONEYE = "翠绿色的……其实我不喜欢绿色。",		-- 物品名:"绿色月眼"
        ORANGEMOONEYE = "我要启程去找悠，用这个来标记吧",		-- 物品名:"橘色月眼"
        YELLOWMOONEYE = "黄色的，让我想起了悠",		-- 物品名:"黄色月眼"
        BLUEMOONEYE = "寒月不在苍穹，而在手心",		-- 物品名:"蓝色月眼"
        BOARRIOR = "你的体型如此巨大！",		-- 物品名:"大熔炉猪战士"->大熔炉猪战士
        BOARON = "我可以搞定他！",		-- 物品名:"战猪"
        PEGHOOK = "那口水有腐蚀性！",		-- 物品名:"蝎子"
        TRAILS = "他的手臂十分强壮。",		-- 物品名:"野猪猩"
        TURTILLUS = "它的外壳如此尖锐！",		-- 物品名:"坦克龟"
        SNAPPER = "这一只会咬人。",		-- 物品名:"鳄鱼指挥官"
		RHINODRILL = "他有一个尖鼻子来干这事。",		-- 物品名:"后扣帽犀牛兄弟"
		BEETLETAUR = "我从这都能闻到它！",		-- 物品名:"地狱独眼巨猪"
        LAVAARENA_PORTAL = 
        {
            ON = "我现在要走了。",		-- 物品名:"远古大门"->开启
            GENERIC = "我不知道我们如何来到了这里，我只希望我们能返回家园。",		-- 物品名:"远古大门"->默认
        },
        HEALINGSTAFF = "它可以治疗我们。",		-- 物品名:"生命魔杖"
        FIREBALLSTAFF = "看谁还敢欺负我和悠！",		-- 物品名:"地狱魔杖"
        HAMMER_MJOLNIR = "这是一把可以重创怪物的巨锤。",		-- 物品名:"锻锤"
        SPEAR_GUNGNIR = "我可以用它快速充电。",		-- 物品名:"尖齿矛"
        BLOWDART_LAVA = "这是我可以掌握并熟练使用的武器。",		-- 物品名:"吹箭"
        BLOWDART_LAVA2 = "它可以推动气流射出致命地箭矢。",		-- 物品名:"熔化吹箭"
        WEBBER_SPIDER_MINION = "我猜他们正在为我们而战。",		-- 物品名:"蜘蛛宝宝"
        BOOK_FOSSIL = "这本书会将怪物们石化一段时间。",		-- 物品名:"石化之书"
		SPEAR_LANCE = "它削的十分的尖利。",		-- 物品名:"螺旋矛"
		BOOK_ELEMENTAL = "我看不懂上面写的啥。",		-- 物品名:"召唤之书"
        QUAGMIRE_ALTAR = 
        {
        	GENERIC = "我们最好赶紧动身做一些祭品。",		-- 物品名:"饕餮祭坛"->默认
        	FULL = "这是消化过程的一环。",		-- 物品名:"饕餮祭坛"->满了
    	},
		QUAGMIRE_SUGARWOODTREE = 
		{
			GENERIC = "它充满了美味的树液。",		-- 物品名:"糖木树"->默认
			STUMP = "这棵树哪去了？真是摸不着头脑。",		-- 物品名:"糖木树"->暴食模式糖木树只剩树桩了
			TAPPED_EMPTY = "树汁树汁快点来。",		-- 物品名:"糖木树"->暴食模式糖木树空了
			TAPPED_READY = "甜美的金黄色汁液。",		-- 物品名:"糖木树"->暴食模式糖木树好了
			TAPPED_BUGS = "蚂蚁就是这么来的。",		-- 物品名:"糖木树"->暴食模式糖木树上有蚂蚁
			WOUNDED = "它看上去病了。",		-- 物品名:"糖木树"->暴食糖木树生病了
		},
		QUAGMIRE_SPOTSPICE_SHRUB = 
		{
			GENERIC = "它让我想起了那些触手怪。",		-- 物品名:"带斑点的小灌木"->默认
			PICKED = "我从灌木上摘不到更多的东西了。",		-- 物品名:"带斑点的小灌木"->被采完了
		},
		QUAGMIRE_SALT_RACK =
		{
			READY = "盐已经在绳子上结晶了。",		-- 物品名:"盐架"->准备好的 满的
			GENERIC = "科学的进步需要时间。",		-- 物品名:"盐架"->默认
		},
		QUAGMIRE_SAFE = 
		{
			GENERIC = "这是个保险箱，用于确保物品安全。",		-- 物品名:"保险箱"->默认
			LOCKED = "没有钥匙是开不开的。",		-- 物品名:"保险箱"->锁住了
		},
		QUAGMIRE_MUSHROOMSTUMP =
		{
			GENERIC = "那些是蘑菇吗？我被难住了。",		-- 物品名:"蘑菇"->默认
			PICKED = "我不觉得它会重新长出来。",		-- 物品名:"蘑菇"->被采完了
		},
        QUAGMIRE_RUBBLE_HOUSE =
        {
            "这里空无一人。",		-- 物品名:"残破的房子" 制造描述:未找到
            "这个小镇被摧毁了。",		-- 物品名:"残破的房子" 制造描述:未找到
            "我想知道他们到底惹怒了谁。",		-- 物品名:"残破的房子" 制造描述:未找到
        },
        QUAGMIRE_SWAMPIGELDER =
        {
            GENERIC = "如果我猜的没错的话，你应该是这里的负责人，对吗？",		-- 物品名:"沼泽猪长老"->默认
            SLEEPING = "现在它正在睡觉。",		-- 物品名:"沼泽猪长老"->睡着了
        },
        QUAGMIRE_FOOD =
        {
        	GENERIC = "我应该把它放在噬咬祭坛上祭献。",		-- 物品名:未找到
            MISMATCH = "这不是它想要的。",		-- 物品名:未找到
            MATCH = "。",		-- 物品名:未找到
            MATCH_BUT_SNACK = "这更像是一种小吃，真的。",		-- 物品名:未找到
        },
        QUAGMIRE_PARK_GATE =
        {
            GENERIC = "看来一把钥匙是进去的关键。",		-- 物品名:"铁门"->默认
            LOCKED = "锁得很紧。",		-- 物品名:"铁门"->锁住了
        },
        QUAGMIRE_PIGEON =
        {
            DEAD = "他们已经死了。",		-- 物品名:"鸽子"->死了 制造描述:"这是一只完整的活鸽。"
            GENERIC = "羽翼初满。",		-- 物品名:"鸽子"->默认 制造描述:"这是一只完整的活鸽。"
            SLEEPING = "它现在还在睡觉。",		-- 物品名:"鸽子"->睡着了 制造描述:"这是一只完整的活鸽。"
        },
        WINONA_CATAPULT = 
        {
        	GENERIC = "这个东西，可以像悠一样保护我",		-- 物品名:"薇诺娜的投石机"->默认 制造描述:"向敌人投掷大石块"
        	OFF = "没电了吗？还是悠可靠得多。",		-- 物品名:"薇诺娜的投石机"->关闭 制造描述:"向敌人投掷大石块"
        	BURNING = "哇，这个也会着火的吗？",		-- 物品名:"薇诺娜的投石机"->正在燃烧 制造描述:"向敌人投掷大石块"
        	BURNT = "变得破木头了",		-- 物品名:"薇诺娜的投石机"->烧焦的 制造描述:"向敌人投掷大石块"
        },
        WINONA_SPOTLIGHT = 
        {
        	GENERIC = "我站在舞台中心",		-- 物品名:"薇诺娜的聚光灯"->默认 制造描述:"白天夜里都发光"
        	OFF = "怎么不亮了？",		-- 物品名:"薇诺娜的聚光灯"->关闭 制造描述:"白天夜里都发光"
        	BURNING = "哇，后台起火啊",		-- 物品名:"薇诺娜的聚光灯"->正在燃烧 制造描述:"白天夜里都发光"
        	BURNT = "我的舞台也没了……",		-- 物品名:"薇诺娜的聚光灯"->烧焦的 制造描述:"白天夜里都发光"
        },
        WINONA_BATTERY_LOW = 
        {
        	GENERIC = "悠，我们学过这个原理吧？",		-- 物品名:"薇诺娜的发电机"->默认 制造描述:"要确保电力供应充足"
        	LOWPOWER = "电力不足啊，什么破玩意",		-- 物品名:"薇诺娜的发电机"->没电了 制造描述:"要确保电力供应充足"
        	OFF = "悠，这个怎么没有工作？",		-- 物品名:"薇诺娜的发电机"->关闭 制造描述:"要确保电力供应充足"
        	BURNING = "不会爆炸吧？",		-- 物品名:"薇诺娜的发电机"->正在燃烧 制造描述:"要确保电力供应充足"
        	BURNT = "坏掉了，我可不会修。",		-- 物品名:"薇诺娜的发电机"->烧焦的 制造描述:"要确保电力供应充足"
        },
        WINONA_BATTERY_HIGH = 
        {
        	GENERIC = "发电机！看起来好复杂啊",		-- 物品名:"薇诺娜的宝石发电机"->默认 制造描述:"这玩意烧宝石，所以肯定不会差。"
        	LOWPOWER = "好像电力不足？",		-- 物品名:"薇诺娜的宝石发电机"->没电了 制造描述:"这玩意烧宝石，所以肯定不会差。"
        	OFF = "没电了，没用了。",		-- 物品名:"薇诺娜的宝石发电机"->关闭 制造描述:"这玩意烧宝石，所以肯定不会差。"
        	BURNING = "悠，小心漏电事故……我也要小心",		-- 物品名:"薇诺娜的宝石发电机"->正在燃烧 制造描述:"这玩意烧宝石，所以肯定不会差。"
        	BURNT = "一股浓烈的焦味",		-- 物品名:"薇诺娜的宝石发电机"->烧焦的 制造描述:"这玩意烧宝石，所以肯定不会差。"
        },
        COMPOSTWRAP = "充满了养分。",		-- 物品名:"肥料包" 制造描述:"\"草本\"的疗法。"
        ARMOR_BRAMBLE = "我好像刺猬一样",		-- 物品名:"荆棘外壳" 制造描述:"让大自然告诉你什么叫\"滚开\"。"
        TRAP_BRAMBLE = "反击！",		-- 物品名:"荆棘陷阱" 制造描述:"都有机会中招的干\n扰陷阱。"
        BOATFRAGMENT03 = "应该还有可以回收的部分。",		-- 物品名:"船碎片"
        BOATFRAGMENT04 = "应该还有可以回收的部分。",		-- 物品名:"船碎片"
        BOATFRAGMENT05 = "应该还有可以回收的部分。",		-- 物品名:"船碎片"
		BOAT_LEAK = "快,快,快修好它",		-- 物品名:"漏洞"
        MAST = "我应该快点儿修好它。",		-- 物品名:"桅杆" 制造描述:"乘风破浪会有时。"
        SEASTACK = "小心,别撞到了",		-- 物品名:"浮堆"
        FISHINGNET = "今天能有鱼吃吗？好期待。。",		-- 物品名:"渔网" 制造描述:"就是一张网。"
        ANTCHOVIES = "好漂亮啊。",		-- 物品名:"蚁头凤尾鱼"
        STEERINGWHEEL = "在海上最好的方向就是自己的感觉。",		-- 物品名:"方向舵" 制造描述:"航海必备道具。"
        ANCHOR = "沉重的，巨大的...",		-- 物品名:"锚" 制造描述:"船用刹车"
        BOATPATCH = "希望不会用到它。",		-- 物品名:"船补丁" 制造描述:"打补丁永远不晚。"
        DRIFTWOOD_TREE = 
        {
            BURNING = "哦，烧起来了！。",		-- 物品名:"浮木"->正在燃烧
            BURNT = "燃尽了。。",		-- 物品名:"浮木"->烧焦的
            CHOPPED = "让我带你走吧。",		-- 物品名:"浮木"->被砍了
            GENERIC = "树木和大海的交织。。",		-- 物品名:"浮木"->默认
        },
        DRIFTWOOD_LOG = "诡异的的白色。",		-- 物品名:"浮木桩"
        MOON_TREE = 
        {
            BURNING = "我想我应该先灭火。",		-- 物品名:"月树"->正在燃烧
            BURNT = "未尝不是一种解脱。",		-- 物品名:"月树"->烧焦的
            CHOPPED = "他是怎么把月蛾塞进去的呢？",		-- 物品名:"月树"->被砍了
            GENERIC = "诡异的美。",		-- 物品名:"月树"->默认
        },
		MOON_TREE_BLOSSOM = "美丽而又短暂。",		-- 物品名:"月树花"
        MOONBUTTERFLY = 
        {
        	GENERIC = "梦幻般的",		-- 物品名:"月蛾"->默认
        	HELD = "好漂亮",		-- 物品名:"月蛾"->拿在手里
        },
		MOONBUTTERFLYWINGS = "可惜。",		-- 物品名:"月蛾翅膀"
        MOONBUTTERFLY_SAPLING = "不一样的树。",		-- 物品名:"月树苗"
        ROCK_AVOCADO_FRUIT = "好硬的壳",		-- 物品名:"石果"
        ROCK_AVOCADO_FRUIT_RIPE = "不管快吃的话要坏掉了。",		-- 物品名:"成熟石果"
        ROCK_AVOCADO_FRUIT_RIPE_COOKED = "输了的应该会好吃一些。",		-- 物品名:"熟石果"
        ROCK_AVOCADO_FRUIT_SPROUT = "希望能结出更多的果子。",		-- 物品名:"发芽的石果"
        ROCK_AVOCADO_BUSH = 
        {
        	BARREN = "我能把它带回家吗。",		-- 物品名:"石果灌木丛"
			WITHERED = "它需要养料。",		-- 物品名:"石果灌木丛"->枯萎了
			GENERIC = "再等会儿吧。",		-- 物品名:"石果灌木丛"->默认
			PICKED = "已经被我摘下了。",		-- 物品名:"石果灌木丛"->被采完了
			DISEASED = "应该被铲除。",		-- 物品名:"石果灌木丛"->生病了
            DISEASING = "正在发生着变异。",		-- 物品名:"石果灌木丛"->正在生病？？
			BURNING = "烧起来了，心疼。",		-- 物品名:"石果灌木丛"->正在燃烧
		},
        DEAD_SEA_BONES = "不幸的人。",		-- 物品名:"海骨"
        HOTSPRING = 
        {
        	GENERIC = "可惜太浅了，不然想去泡一泡。",		-- 物品名:"温泉"->默认
        	BOMBED = "还是有些温度。",		-- 物品名:"温泉"
        	GLASS = "没想到还有这种东西。",		-- 物品名:"温泉"
			EMPTY = "结束了。",		-- 物品名:"温泉"
        },
        MOONGLASS = "美丽且脆弱。",		-- 物品名:"月亮碎片"
        MOONGLASS_ROCK = "诡异的姿态。",		-- 物品名:"月光玻璃"
        BATHBOMB = "有些香香的",		-- 物品名:"沐浴球" 制造描述:"春天里来百花香？这点子把地都炸碎了"
        TRAP_STARFISH =
        {
            GENERIC = "我觉得海星。",		-- 物品名:"海星"->默认
            CLOSED = "充满攻击性的海星。",		-- 物品名:"海星"
        },
        DUG_TRAP_STARFISH = "呼，好险。",		-- 物品名:"海星陷阱"
        SPIDER_MOON = 
        {
        	GENERIC = "奇怪的蜘蛛。",		-- 物品名:"破碎蜘蛛"->默认
        	SLEEPING = "原来它也会睡觉。",		-- 物品名:"破碎蜘蛛"->睡着了
        	DEAD = "最终的结果。",		-- 物品名:"破碎蜘蛛"->死了
        },
        MOONSPIDERDEN = "不入虎穴焉得虎子。",		-- 物品名:"破碎蜘蛛洞"
		FRUITDRAGON =
		{
			GENERIC = "我喜欢它。",		-- 物品名:"沙拉蝾螈"->默认
			RIPE = "真可爱。",		-- 物品名:"沙拉蝾螈"
			SLEEPING = "像一只小猫一样。",		-- 物品名:"沙拉蝾螈"->睡着了
		},
        PUFFIN =
        {
            GENERIC = "噢，无忧无虑啊。",		-- 物品名:"海鹦鹉"->默认
            HELD = "你想吃这个吗？",		-- 物品名:"海鹦鹉"->拿在手里
            SLEEPING = "它睡得真香。",		-- 物品名:"海鹦鹉"->睡着了
        },
		MOONGLASSAXE = "锋利的斧头",		-- 物品名:"月光玻璃斧" 制造描述:"脆弱而有效。"
		GLASSCUTTER = "锋利的武器往往都是十分脆弱的。",		-- 物品名:"玻璃刀" 制造描述:"尖端武器。"
        ICEBERG =
        {
            GENERIC = "夏天我应该会很喜欢它。",		-- 物品名:"迷你冰山"->默认
            MELTED = "融化了一点。",		-- 物品名:"迷你冰山"->融化了
        },
        ICEBERG_MELTED = "融化了一点。",		-- 物品名:"融化的迷你冰山"
        MINIFLARE = "要是有烟花就好了。",		-- 物品名:"信号弹" 制造描述:"为你信任的朋友照亮前路。"
		MOON_FISSURE = 
		{
			GENERIC = "光从地下冒充出来了。", 		-- 物品名:"天体裂隙"->默认
			NOLIGHT = "根源到底在哪儿呢？",		-- 物品名:"天体裂隙"
		},
        MOON_ALTAR =
        {
            MOON_ALTAR_WIP = "再找找吧。",		-- 物品名:未找到
            GENERIC = "它到底有什么秘密？",		-- 物品名:未找到
        },
        MOON_ALTAR_IDOL = "是我看不懂的科技。",		-- 物品名:"天体祭坛雕像"
        MOON_ALTAR_GLASS = "它缺失了一部分。",		-- 物品名:"天体祭坛底座"
        MOON_ALTAR_SEED = "它想得到某种能量。",		-- 物品名:"天体祭坛宝球"
        MOON_ALTAR_ROCK_IDOL = "感觉里面有东西...",		-- 物品名:"在呼唤我"
        MOON_ALTAR_ROCK_GLASS = "感觉里面有东西...",		-- 物品名:"在呼唤我"
        MOON_ALTAR_ROCK_SEED = "感觉里面有东西...",		-- 物品名:"在呼唤我"
        MOON_ALTAR_CROWN = "你现在安全了。",		-- 物品名:"未激活天体贡品"
        MOON_ALTAR_COSMIC = "未知的知识。",		-- 物品名:"天体贡品"
        MOON_ALTAR_ASTRAL = "你又完整了。",		-- 物品名:"天体圣殿"
        MOON_ALTAR_ICON = "我会带你去的。",		-- 物品名:"天体圣殿象征"
        MOON_ALTAR_WARD = "交给我吧。",        		-- 物品名:"天体圣殿卫戍"
        SEAFARING_PROTOTYPER =
        {
            GENERIC = "我会有些晕船。",		-- 物品名:"智囊团"->默认 制造描述:"海上科学。"
            BURNT = "航海一次就够了。",		-- 物品名:"智囊团"->烧焦的 制造描述:"海上科学。"
        },
        BOAT_ITEM = "打包好的船。",		-- 物品名:"船套装" 制造描述:"让大海成为你的领地。"
        STEERINGWHEEL_ITEM = "这是我做的。",		-- 物品名:"方向舵套装" 制造描述:"航海必备道具。"
        ANCHOR_ITEM = "很重。",		-- 物品名:"锚套装" 制造描述:"船用刹车"
        MAST_ITEM = "船的动力。",		-- 物品名:"桅杆套装" 制造描述:"乘风破浪会有时。"
        MUTATEDHOUND = 
        {
        	DEAD = "还好，还好。",		-- 物品名:"恐怖猎犬"->死了
        	GENERIC = "它看起来十分凶恶。",		-- 物品名:"恐怖猎犬"->默认
        	SLEEPING = "就这样睡过去吧。",		-- 物品名:"恐怖猎犬"->睡着了
        },
        MUTATED_PENGUIN = 
        {
			DEAD = "它可没那么友善。",		-- 物品名:"月岩企鸥"->死了
			GENERIC = "这就是月亮的力量吗。",		-- 物品名:"月岩企鸥"->默认
			SLEEPING = "睡吧。",		-- 物品名:"月岩企鸥"->睡着了
		},
        CARRAT = 
        {
        	DEAD = "小可爱消失了。",		-- 物品名:"胡萝卜鼠"->死了 制造描述:"灵巧机敏，富含胡萝卜素。"
        	GENERIC = "很有活力的小家伙。",		-- 物品名:"胡萝卜鼠"->默认 制造描述:"灵巧机敏，富含胡萝卜素。"
        	HELD = "来，让我看看。",		-- 物品名:"胡萝卜鼠"->拿在手里 制造描述:"灵巧机敏，富含胡萝卜素。"
        	SLEEPING = "睡着的样子也很可爱。",		-- 物品名:"胡萝卜鼠"->睡着了 制造描述:"灵巧机敏，富含胡萝卜素。"
        },
		BULLKELP_PLANT = 
        {
            GENERIC = "应该不会很好吃。",		-- 物品名:"公牛海带"->默认
            PICKED = "再等它长吧。",		-- 物品名:"公牛海带"->被采完了
        },
		BULLKELP_ROOT = "滑滑的。",		-- 物品名:"公牛海带茎"
        KELPHAT = "看到他就让我很难受。",		-- 物品名:"海花冠" 制造描述:"让人神经焦虑的东西。"
		KELP = "快拿走，",		-- 物品名:"海带叶"
		KELP_COOKED = "这样看着还稍微好了些。",		-- 物品名:"熟海带叶"
		KELP_DRIED = "脆脆的。",		-- 物品名:"干海带叶"
		GESTALT = "不知道它们在守护着什么？",		-- 物品名:"虚影"
        GESTALT_GUARD = "我和它们格格不入。",		-- 物品名:"大虚影"
		COOKIECUTTER = "神奇的生物。",		-- 物品名:"饼干切割机"
		COOKIECUTTERSHELL = "看来是不太能吃。",		-- 物品名:"饼干切割机壳"
		COOKIECUTTERHAT = "外表看着很强大，但是却十分的脆弱。",		-- 物品名:"饼干切割机帽子" 制造描述:"穿着必须犀利。"
		SALTSTACK =
		{
			GENERIC = "怎么看着有些熟悉？",		-- 物品名:"盐堆"->默认
			MINED_OUT = "被摧毁了。",		-- 物品名:"盐堆"
			GROWING = "生生不息。",		-- 物品名:"盐堆"->正在生长
		},
		SALTROCK = "很咸。",		-- 物品名:"盐晶"
		SALTBOX = "我可不希望我的蔬菜都变成了蔬菜干。",		-- 物品名:"盐盒" 制造描述:"用盐来储存食物。"
		TACKLESTATION = "这是我的兴趣。",		-- 物品名:"钓具容器" 制造描述:"传统的用饵钓鱼。"
		TACKLESKETCH = "应该能更好的钓鱼了。",		-- 物品名:"{item}广告"
        MALBATROSS = "是鸟还是鸭子？",		-- 物品名:"邪天翁"
        MALBATROSS_FEATHER = "暖和的毛。",		-- 物品名:"邪天翁羽毛"
        MALBATROSS_BEAK = "好大的嘴。",		-- 物品名:"邪天翁喙"
        MAST_MALBATROSS_ITEM = "速度更快了/",		-- 物品名:"飞翼风帆套装" 制造描述:"像海鸟一样航向深蓝。"
        MAST_MALBATROSS = "飞起来咯。",		-- 物品名:"飞翼风帆" 制造描述:"像海鸟一样航向深蓝。"
		MALBATROSS_FEATHERED_WEAVE = "这可不是一门好掌握的技术。",		-- 物品名:"羽毛帆布" 制造描述:"精美的羽毛布料。"
        GNARWAIL =
        {
            GENERIC = "我给你一块肉，跟着我吧。",		-- 物品名:"一角鲸"->默认
            BROKENHORN = "真可怜。",		-- 物品名:"一角鲸"
            FOLLOWER = "过来，过来~",		-- 物品名:"一角鲸"->追随者
            BROKENHORN_FOLLOWER = "小可怜。",		-- 物品名:"一角鲸"
        },
        GNARWAIL_HORN = "居然是空心的。",		-- 物品名:"一角鲸的角"
        WALKINGPLANK = "厚重。",		-- 物品名:"木板"
        OAR = "需要很大的技巧。",		-- 物品名:"桨" 制造描述:"划，划，划小船。"
		OAR_DRIFTWOOD = "比木头稍好一些。",		-- 物品名:"浮木桨" 制造描述:"小桨要用浮木造？"
		OCEANFISHINGROD = "比池塘有难度。",		-- 物品名:"海钓竿" 制造描述:"像职业选手一样钓鱼吧。"
		OCEANFISHINGBOBBER_NONE = "我需要饵料。",		-- 物品名:"鱼钩"
        OCEANFISHINGBOBBER_BALL = "钓鱼最好的帮手。",		-- 物品名:"木球浮标" 制造描述:"经典设计，初学者和职业钓手两相宜。"
        OCEANFISHINGBOBBER_OVAL = "钓鱼最好的帮手。",		-- 物品名:"硬物浮标" 制造描述:"在经典浮标的基础上融入了时尚设计。"
		OCEANFISHINGBOBBER_CROW = "钓鱼最好的帮手。",		-- 物品名:"黑羽浮标" 制造描述:"深受职业钓手的喜爱。"
		OCEANFISHINGBOBBER_ROBIN = "钓鱼最好的帮手。",		-- 物品名:"红羽浮标" 制造描述:"深受职业钓手的喜爱。"
		OCEANFISHINGBOBBER_ROBIN_WINTER = "钓鱼最好的帮手。",		-- 物品名:"蔚蓝羽浮标" 制造描述:"深受职业钓手的喜爱。"
		OCEANFISHINGBOBBER_CANARY = "钓鱼最好的帮手。",		-- 物品名:"黄羽浮标" 制造描述:"深受职业钓手的喜爱。"
		OCEANFISHINGBOBBER_GOOSE = "钓鱼最好的帮手。",		-- 物品名:"鹅羽浮标" 制造描述:"高级羽绒浮标。"
		OCEANFISHINGBOBBER_MALBATROSS = "钓鱼最好的帮手。",		-- 物品名:"邪天翁羽浮标" 制造描述:"高级巨鸟浮标。"
		OCEANFISHINGLURE_SPINNER_RED = "看起来对鱼很有诱惑力。",		-- 物品名:"日出旋转亮片" 制造描述:"早起的鱼儿有虫吃。"
		OCEANFISHINGLURE_SPINNER_GREEN = "看起来对鱼很有诱惑力。",		-- 物品名:"黄昏旋转亮片" 制造描述:"低光照环境里效果最好。"
		OCEANFISHINGLURE_SPINNER_BLUE = "看起来对鱼很有诱惑力。",		-- 物品名:"夜间旋转亮片" 制造描述:"适用于夜间垂钓。"
		OCEANFISHINGLURE_SPOON_RED = "看起来对鱼很有诱惑力。",		-- 物品名:"日出匙型假饵" 制造描述:"早起的鱼儿有虫吃。"
		OCEANFISHINGLURE_SPOON_GREEN = "看起来对鱼很有诱惑力。",		-- 物品名:"黄昏匙型假饵" 制造描述:"在夕阳中继续垂钓。"
		OCEANFISHINGLURE_SPOON_BLUE = "看起来对鱼很有诱惑力。",		-- 物品名:"夜间匙型假饵" 制造描述:"适用于夜间垂钓。"
		OCEANFISHINGLURE_HERMIT_RAIN = "我想如果要使用他因该要穿着雨衣。",		-- 物品名:"雨天鱼饵" 制造描述:"留着雨天用。"
		OCEANFISHINGLURE_HERMIT_SNOW = "一边烤火一边钓鱼。",		-- 物品名:"雪天鱼饵" 制造描述:"雪天适合用它钓鱼。"
		OCEANFISHINGLURE_HERMIT_DROWSY = "这能够减轻鱼的痛苦吗？",		-- 物品名:"麻醉鱼饵" 制造描述:"把鱼闷住就抓住了一半。"
		OCEANFISHINGLURE_HERMIT_HEAVY = "只有最重的才会上钩/",		-- 物品名:"重量级鱼饵" 制造描述:"钓一条大鱼！"
		OCEANFISH_SMALL_1 = "你有没有见过孔雀鱼？",		-- 物品名:"小孔雀鱼"
		OCEANFISH_SMALL_2 = "可以用来写字吗?",		-- 物品名:"针鼻喷墨鱼"
		OCEANFISH_SMALL_3 = "还可以凑合。",		-- 物品名:"小饵鱼"
		OCEANFISH_SMALL_4 = "希望他也能长大。",		-- 物品名:"三文鱼苗"
		OCEANFISH_SMALL_5 = "神奇的？生物？",		-- 物品名:"爆米花鱼"
		OCEANFISH_SMALL_6 = "看起来好丑。",		-- 物品名:"落叶比目鱼"
		OCEANFISH_SMALL_7 = "好漂亮的鱼。",		-- 物品名:"花朵金枪鱼"
		OCEANFISH_SMALL_8 = "像个小火炉一样。",		-- 物品名:"炽热太阳鱼"
        OCEANFISH_SMALL_9 = "希望拿在手上的时候不会喷水。",		-- 物品名:"口水鱼"
		OCEANFISH_MEDIUM_1 = "看起来有些丑。",		-- 物品名:"泥鱼"
		OCEANFISH_MEDIUM_2 = "不知道好不好吃。",		-- 物品名:"斑鱼"
		OCEANFISH_MEDIUM_3 = "他看起来很强壮。",		-- 物品名:"浮夸狮子鱼"
		OCEANFISH_MEDIUM_4 = "鲶鱼不会太好吃。",		-- 物品名:"黑鲶鱼"
		OCEANFISH_MEDIUM_5 = "它到底是什么？",		-- 物品名:"玉米鳕鱼"
		OCEANFISH_MEDIUM_6 = "这么漂亮几乎都不舍得吃了。几乎。",		-- 物品名:"花锦鲤"
		OCEANFISH_MEDIUM_7 = "这么漂亮几乎都不舍得吃了。几乎。",		-- 物品名:"金锦鲤"
		OCEANFISH_MEDIUM_8 = "仿佛艺术品。",		-- 物品名:"冰鲷鱼"
		PONDFISH = "很好吃。",		-- 物品名:"淡水鱼"
		PONDEEL = "一条鳗鱼。",		-- 物品名:"活鳗鱼"
        FISHMEAT = "我应该吃快点。",		-- 物品名:"生鱼肉"
        FISHMEAT_COOKED = "鱼肉很好吃，而且还不会胖。",		-- 物品名:"鱼排"
        FISHMEAT_SMALL = "海里还有更大的。",		-- 物品名:"小鱼块"
        FISHMEAT_SMALL_COOKED = "小鱼吃的不太爽。",		-- 物品名:"烤小鱼块"
		SPOILED_FISH = "他的生命被定格了。",		-- 物品名:"变质的鱼"
		FISH_BOX = "永久的保鲜。",		-- 物品名:"锡鱼罐" 制造描述:"保持鱼与网捕之日一样新鲜。"
        POCKET_SCALE = "我要钓上最大的鱼。",		-- 物品名:"弹簧秤" 制造描述:"随时称鱼的重量！"
		TACKLECONTAINER = "钓鱼我可是专业的。",		-- 物品名:"钓具箱" 制造描述:"整齐收纳你的钓具。"
		SUPERTACKLECONTAINER = "更专业了。",		-- 物品名:"超级钓具箱" 制造描述:"更多收纳钓具的空间？我上钩了！"
		TROPHYSCALE_FISH =
		{
			GENERIC = "我可以在这里展现钓鱼水平。",		-- 物品名:"鱼类计重器"->默认 制造描述:"炫耀你的斩获。"
			HAS_ITEM = "重量: {weight}\n捕获人: {owner}",		-- 物品名:"鱼类计重器" 制造描述:"炫耀你的斩获。"
			HAS_ITEM_HEAVY = "重量: {weight}\n捕获人: {owner}\n这一定是最强壮的鱼",		-- 物品名:"鱼类计重器" 制造描述:"炫耀你的斩获。"
			BURNING = "有水是怎么烧起来的？",		-- 物品名:"鱼类计重器"->正在燃烧 制造描述:"炫耀你的斩获。"
			BURNT = "居然没被扑灭？",		-- 物品名:"鱼类计重器"->烧焦的 制造描述:"炫耀你的斩获。"
			OWNER = "重量: {weight}\n捕获人: {owner}\n啊，我竟然…做到了……",		-- 物品名:"鱼类计重器" 制造描述:"炫耀你的斩获。"
			OWNER_HEAVY = "重量: {weight}\n捕获人: {owner}\n悠!快来看!我厉害吧",		-- 物品名:"鱼类计重器" 制造描述:"炫耀你的斩获。"
		},
		OCEANFISHABLEFLOTSAM = "顽强的前人。",		-- 物品名:"海洋残骸"
		CALIFORNIAROLL = "和我的寿司比起来还是差不少啊。",		-- 物品名:"加州卷"
		SEAFOODGUMBO = "我觉得完全不需要放盐。",		-- 物品名:"海鲜浓汤"
		SURFNTURF = "热量爆炸的搭配。",		-- 物品名:"海鲜牛排"
        WOBSTER_SHELLER = "坚硬的外壳却也保护不了它。", 		-- 物品名:"龙虾"
        WOBSTER_DEN = "我有点无法理解。",		-- 物品名:"龙虾窝"
        WOBSTER_SHELLER_DEAD = "死了就没那么美味了，我最好快点吃掉它。",		-- 物品名:"死龙虾"
        WOBSTER_SHELLER_DEAD_COOKED = "一顿美餐！",		-- 物品名:"美味的龙虾"
        LOBSTERBISQUE = "有个勺子就更好了。",		-- 物品名:"龙虾汤"
        LOBSTERDINNER = "十足的美味。",		-- 物品名:"龙虾正餐"
        WOBSTER_MOONGLASS = "月亮的力量。",		-- 物品名:"月光龙虾"
        MOONGLASS_WOBSTER_DEN = "变异的产物。",		-- 物品名:"月光玻璃窝"
		TRIDENT = "大海的力量。",		-- 物品名:"刺耳三叉戟" 制造描述:"在汹涌波涛中引领潮流吧！"
		WINCH =
		{
			GENERIC = "海中的宝藏，我来了。",		-- 物品名:"夹夹绞盘"->默认 制造描述:"让它帮你捞起重的东西吧。"
			RETRIEVING_ITEM = "它把什么东西从海中里捞了出来……",		-- 物品名:"夹夹绞盘" 制造描述:"让它帮你捞起重的东西吧。"
			HOLDING_ITEM = "这是我应得的。",		-- 物品名:"夹夹绞盘" 制造描述:"让它帮你捞起重的东西吧。"
		},
        HERMITHOUSE =
	{
            GENERIC = "我应该能够帮她。",		-- 物品名:"隐士之家"->默认
            BUILTUP = "修好之后会很好看。",		-- 物品名:"隐士之家"
        }, 
        SHELL_CLUSTER = "很好听。",		-- 物品名:"贝壳堆"
		SINGINGSHELL_OCTAVE3 =
		{
			GENERIC = "好听啊。",		-- 物品名:"低音贝壳钟"->默认
		},
		SINGINGSHELL_OCTAVE4 =
		{
			GENERIC = "它们真美……",		-- 物品名:"中音贝壳钟"->默认
		},
		SINGINGSHELL_OCTAVE5 =
		{
			GENERIC = "天籁之音。",		-- 物品名:"高音贝壳钟"->默认
        },
        CHUM = "鱼的最爱。",		-- 物品名:"鱼食" 制造描述:"鱼儿的美食。"
        SUNKENCHEST =
        {
            GENERIC = "未知的，宝藏。",		-- 物品名:"沉底宝箱"->默认
            LOCKED = "钥匙在哪儿呢?",		-- 物品名:"沉底宝箱"->锁住了
        },
        HERMIT_BUNDLE = "被感谢了呢。",		-- 物品名:"一包谢意"
        HERMIT_BUNDLE_SHELLS = "贝壳钟的音色很好听。",		-- 物品名:"贝壳钟包" 制造描述:"她卖的贝壳。"
        RESKIN_TOOL = "能把其他物品变得更好看了。",		-- 物品名:"清洁扫把" 制造描述:"把装潢的东西清扫的干干净净。"
        MOON_FISSURE_PLUGGED = "他们暂时停住了。",		-- 物品名:"堵住的裂隙"
        WOBYBIG = 
        {
            "软绵绵。",		-- 物品名:"沃比" 制造描述:未找到
            "软绵绵。",		-- 物品名:"沃比" 制造描述:未找到
        },
        WOBYSMALL = 
        {
            "小小的软绵绵。",		-- 物品名:"沃比" 制造描述:未找到
            "小小的软绵绵。",		-- 物品名:"沃比" 制造描述:未找到
        },
		WALTERHAT = "我不太适合这种危险的东西。",		-- 物品名:"松树先锋队帽子" 制造描述:"形式和功能高于时尚。"
		SLINGSHOT = "可能不如我的法杖方便。",		-- 物品名:"可靠的弹弓" 制造描述:"不带它千万别去冒险！"
		SLINGSHOTAMMO_ROCK = "原始的弹药。",				-- 物品名:"鹅卵石" 制造描述:"简单，低效。"
		SLINGSHOTAMMO_MARBLE = "略有威力。",				-- 物品名:"大理石弹" 制造描述:"可别把它们弄丢了！"
		SLINGSHOTAMMO_THULECITE = "上面有诅咒的力量。",			-- 物品名:"诅咒弹药" 制造描述:"会出什么问题？"
        SLINGSHOTAMMO_GOLD = "华丽的弹药。",		-- 物品名:"黄金弹药" 制造描述:"因为高级，所以有效。"
        SLINGSHOTAMMO_SLOW = "上面附有缓速魔法。",		-- 物品名:"减速弹药" 制造描述:"什么是“物理定律”？"
        SLINGSHOTAMMO_FREEZE = "上面附有冰冻魔法。",		-- 物品名:"冰冻弹药" 制造描述:"把敌人冰冻在原地。"
		SLINGSHOTAMMO_POOP = "好臭啊。",		-- 物品名:"便便弹" 制造描述:"恶心，但是能让敌人分心。"
        PORTABLETENT = "便携的安息之所。",		-- 物品名:"宿营帐篷" 制造描述:"便捷的保护设备，让你免受风吹雨打。"
        PORTABLETENT_ITEM = "打包好的帐篷，是要去野营吗?",		-- 物品名:"帐篷卷" 制造描述:"便捷的保护设备，让你免受风吹雨打。"
        BATTLESONG_DURABILITY = "战士的歌谣，我不太能理解。",		-- 物品名:"武器化的颤音" 制造描述:"让武器有更多的时间成为焦点。"
        BATTLESONG_HEALTHGAIN = "战士的歌谣，我不太能理解。",		-- 物品名:"心碎歌谣" 制造描述:"一首偷心的颂歌。"
        BATTLESONG_SANITYGAIN = "战士的歌谣，我不太能理解。",		-- 物品名:"醍醐灌顶华彩" 制造描述:"用歌声慰藉你的心灵。"
        BATTLESONG_SANITYAURA = "战士的歌谣，我不太能理解。",		-- 物品名:"英勇美声颂" 制造描述:"无所畏惧！"
        BATTLESONG_FIRERESISTANCE = "战士的歌谣，我不太能理解。。",		-- 物品名:"防火假声" 制造描述:"抵御火辣的戏评人。"
        BATTLESONG_INSTANT_TAUNT = "实在是太没礼貌了。",		-- 物品名:"粗鲁插曲" 制造描述:"用言语扔一个番茄。"
        BATTLESONG_INSTANT_PANIC = "吓了我一跳。",		-- 物品名:"惊心独白" 制造描述:"如此出色的表演，就问你怕不怕。"
		GHOSTLYELIXIR_SLOWREGEN = "奇异的魔法药，和我的有所不同。",		-- 物品名:"亡者补药" 制造描述:"时间会抚平所有伤口。"
		GHOSTLYELIXIR_FASTREGEN = "奇异的魔法药，和我的有所不同。",		-- 物品名:"灵魂万灵药" 制造描述:"治疗重伤的强力药剂。"
		GHOSTLYELIXIR_SHIELD = "奇异的魔法药，和我的有所不同。",		-- 物品名:"不屈药剂" 制造描述:"保护你的姐妹不受伤害。"
		GHOSTLYELIXIR_ATTACK = "奇异的魔法药，和我的有所不同。",		-- 物品名:"夜影万金油" 制造描述:"召唤黑暗的力量。"
		GHOSTLYELIXIR_SPEED = "奇异的魔法药，和我的有所不同。",		-- 物品名:"强健精油" 制造描述:"给你的灵魂来一剂强心针。"
		GHOSTLYELIXIR_RETALIATION = "奇异的魔法药，和我的有所不同。",		-- 物品名:"蒸馏复仇" 制造描述:"对敌人以牙还牙。"
		SISTURN =
		{
			GENERIC = "这是一种特殊的纪念吧。",		-- 物品名:"姐妹骨灰罐"->默认 制造描述:"让你疲倦的灵魂休息的地方。"
			SOME_FLOWERS = "美丽的鲜花。",		-- 物品名:"姐妹骨灰罐" 制造描述:"让你疲倦的灵魂休息的地方。"
			LOTS_OF_FLOWERS = "灵魂都得到了安抚。",		-- 物品名:"姐妹骨灰罐" 制造描述:"让你疲倦的灵魂休息的地方。"
		},
        PORTABLECOOKPOT_ITEM =
        {
            GENERIC = "我能随时随地做饭了。",		-- 物品名:"便携烹饪锅"->默认 制造描述:"随时随地为美食家服务。"
            DONE = "方便的锅。",		-- 物品名:"便携烹饪锅"->完成了 制造描述:"随时随地为美食家服务。"
			COOKING_LONG = "希望能做得更快一点。",		-- 物品名:"便携烹饪锅"->饭还需要很久 制造描述:"随时随地为美食家服务。"
			COOKING_SHORT = "很快就会好了。",		-- 物品名:"便携烹饪锅"->饭快做好了 制造描述:"随时随地为美食家服务。"
			EMPTY = "空空的。",		-- 物品名:"便携烹饪锅" 制造描述:"随时随地为美食家服务。"
        },
        PORTABLEBLENDER_ITEM = "能给食物加上特殊的滋味。",		-- 物品名:"便携研磨器" 制造描述:"把原料研磨成粉状调味品。"
        PORTABLESPICER_ITEM =
        {
            GENERIC = "方便的调料器，比我自己撒的均匀多了。",		-- 物品名:"便携香料站"->默认 制造描述:"调味让饭菜更可口。"
            DONE = "完成了。",		-- 物品名:"便携香料站"->完成了 制造描述:"调味让饭菜更可口。"
        },
        SPICEPACK = "能保鲜一段时间了。",		-- 物品名:"厨师袋" 制造描述:"使你的食物保持新鲜。"
        SPICE_GARLIC = "是臭味还是香味呢?",		-- 物品名:"蒜粉" 制造描述:"用口臭防守是最好的进攻。"
        SPICE_SUGAR = "甜甜的蜂蜜粉。",		-- 物品名:"蜂蜜水晶" 制造描述:"令人心平气和的甜美。"
        SPICE_CHILI = "我要和很多的水，哦不，是牛奶。",		-- 物品名:"辣椒面" 制造描述:"刺激十足的粉末。"
        SPICE_SALT = "最基础的味道。",		-- 物品名:"调味盐" 制造描述:"为你的饭菜加点咸味。"
        MONSTERTARTARE = "这真的是料理吗？",		-- 物品名:"怪物鞑靼"
        FRESHFRUITCREPES = "我看着就十分可口。",		-- 物品名:"鲜果可丽饼"
        FROGFISHBOWL = "看着就没什么食欲。",		-- 物品名:"蓝带鱼排"
        POTATOTORNADO = "肉，肉，还是得吃肉。",		-- 物品名:"花式回旋块茎"
        DRAGONCHILISALAD = "好奇怪的名字。",		-- 物品名:"辣龙椒沙拉"
        GLOWBERRYMOUSSE = "到底是什么原理能让我发光呢？",		-- 物品名:"发光浆果慕斯"
        VOLTGOATJELLY = "好Q弹的感觉。",		-- 物品名:"伏特羊肉冻"
        NIGHTMAREPIE = "我的精神一下不太好了。",		-- 物品名:"恐怖国王饼"
        BONESOUP = "营养丰富。",		-- 物品名:"骨头汤"
        MASHEDPOTATOES = "仅仅看着它就让我的肚子咕咕叫了。",		-- 物品名:"奶油土豆泥"
        POTATOSOUFFLE = "香香又酥酥。",		-- 物品名:"蓬松土豆蛋奶酥"
        MOQUECA = "谢谢你，沃利。",		-- 物品名:"海鲜杂烩"
        GAZPACHO = "如果能热一热会更好喝。",		-- 物品名:"芦笋冷汤"
        ASPARAGUSSOUP = "汤。",		-- 物品名:"芦笋汤"
        VEGSTINGER = "虽然是酒，但是没有一点儿酒精。",		-- 物品名:"蔬菜鸡尾酒"
        BANANAPOP = "夏天必备佳品。",		-- 物品名:"香蕉冻"
        CEVICHE = "如此开胃。",		-- 物品名:"酸橘汁腌鱼"
        SALSA = "不错不错。",		-- 物品名:"生鲜萨尔萨酱"
        PEPPERPOPPER = "下 饭 菜。",		-- 物品名:"爆炒填馅辣椒"
        TURNIP = "好大的萝卜。",		-- 物品名:"大萝卜"
        TURNIP_COOKED = "大萝卜烤好了。",		-- 物品名:"烤大萝卜"
        TURNIP_SEEDS = "它们到底会长出什么呢？",		-- 物品名:"圆形种子"
        GARLIC = "它给食物增添风味。",		-- 物品名:"大蒜"
        GARLIC_COOKED = "它有点好闻。",		-- 物品名:"烤大蒜"
        GARLIC_SEEDS = "它们到底会长出什么呢？",		-- 物品名:"种子荚"
        ONION = "切的时候要小心。",		-- 物品名:"洋葱"
        ONION_COOKED = "好香。",		-- 物品名:"烤洋葱"
        ONION_SEEDS = "它们到底会长出什么呢？",		-- 物品名:"尖形种子"
        POTATO = "好吃，可以当主食。",		-- 物品名:"土豆"
        POTATO_COOKED = "烤过之后更香了。",		-- 物品名:"烤土豆"
        POTATO_SEEDS = "它们到底会长出什么呢？",		-- 物品名:"毛茸茸的种子"
        TOMATO = "酸酸甜甜。",		-- 物品名:"番茄"
        TOMATO_COOKED = "烤熟之后别有一番滋味。",		-- 物品名:"烤番茄"
        TOMATO_SEEDS = "它们孕育的生命，是一个谜。",		-- 物品名:"带刺的种子"
        ASPARAGUS = "蔬菜对我有好处。?", 		-- 物品名:"芦笋"
        ASPARAGUS_COOKED = "生吃可能更好吃。",		-- 物品名:"烤芦笋"
        ASPARAGUS_SEEDS = "它们到底会长出什么呢？",		-- 物品名:"筒状种子"
        PEPPER = "看着微不足道。",		-- 物品名:"辣椒"
        PEPPER_COOKED = "烤熟之后更辣了。",		-- 物品名:"烤辣椒"
        PEPPER_SEEDS = "它们到底会长出什么呢？",		-- 物品名:"块状种子"
        WEREITEM_BEAVER = "这是一种深厚的诅咒。。",		-- 物品名:"俗气海狸像" 制造描述:"唤醒海狸人的诅咒"
        WEREITEM_GOOSE = "十分的邪恶。",		-- 物品名:"俗气鹅像" 制造描述:"唤醒鹅人的诅咒"
        WEREITEM_MOOSE = "不友善。",		-- 物品名:"俗气鹿像" 制造描述:"唤醒鹿人的诅咒"
        MERMHAT = "或许我应该会更聪明。",		-- 物品名:"聪明的伪装" 制造描述:"鱼人化你的朋友。"
        MERMTHRONE =
        {
            GENERIC = "鱼人的王国",		-- 物品名:"皇家地毯"->默认
            BURNT = "鱼人的王国崩塌了",		-- 物品名:"皇家地毯"->烧焦的
        },        
        MERMTHRONE_CONSTRUCTION =
        {
            GENERIC = "我不明白你为什么要费劲做这个。",		-- 物品名:"皇家手工套装"->默认 制造描述:"建立一个新的鱼人王朝。"
            BURNT = "那么辛苦都白干了。",		-- 物品名:"皇家手工套装"->烧焦的 制造描述:"建立一个新的鱼人王朝。"
        },        
        MERMHOUSE_CRAFTED = 
        {
            GENERIC = "还没有遭受到时间的蹂躏。",		-- 物品名:"鱼人工艺屋"->默认 制造描述:"适合鱼人的家。"
            BURNT = "只剩灰烬。",		-- 物品名:"鱼人工艺屋"->烧焦的 制造描述:"适合鱼人的家。"
        },
        MERMWATCHTOWER_REGULAR = "他们暂时不会伤害我们了。",		-- 物品名:"鱼人工艺屋" 制造描述:"适合鱼人的家。"
        MERMWATCHTOWER_NOKING = "他们漫无目的的战斗……",		-- 物品名:"鱼人工艺屋" 制造描述:"适合鱼人的家。"
        MERMKING = "他皇室的气派十足，尽管长了好多疣。",		-- 物品名:"鱼人之王"
        MERMGUARD = "是敌是友？",		-- 物品名:"忠诚鱼人守卫"
        MERM_PRINCE = "你准备好担负领袖的重担了吗？",		-- 物品名:"过程中的皇室"
        SQUID = "黑暗时代的明亮双眼。",		-- 物品名:"鱿鱼"
		GHOSTFLOWER = "我保证会用好它。",		-- 物品名:"哀悼荣耀"
        SMALLGHOST = "又一个缩短了的生命。",		-- 物品名:"小惊吓"
        CRABKING = 
        {
            GENERIC = "它的蟹棒会有多大？",		-- 物品名:"帝王蟹"->默认
            INERT = "一堆破沙子……都没点装饰。",		-- 物品名:"帝王蟹"
        },
		CRABKING_CLAW = "它想把我拖到冰冷的深海里去。",		-- 物品名:"巨钳"
		MESSAGEBOTTLE = "除我之外，还有生还者？",		-- 物品名:"瓶中信"
		MESSAGEBOTTLEEMPTY = "寄托着思念。",		-- 物品名:"空瓶子"
        MEATRACK_HERMIT =
        {
            DONE = "肉晾好了。",		-- 物品名:"晾肉架"->完成了
            DRYING = "它在干燥的风中晃来晃去。",		-- 物品名:"晾肉架"->正在风干
            DRYINGINRAIN = "雨水让它没那么容易晾干。",		-- 物品名:"晾肉架"->雨天风干
            GENERIC = "食物能保存得更久了。",		-- 物品名:"晾肉架"->默认
            BURNT = "它晾肉的日子永远结束了。",		-- 物品名:"晾肉架"->烧焦的
            DONE_NOTMEAT = "肉晾好了。",		-- 物品名:"晾肉架"
            DRYING_NOTMEAT = "它在干燥的风中晃来晃去。",		-- 物品名:"晾肉架"
            DRYINGINRAIN_NOTMEAT = "雨水让它没那么容易晾干。",		-- 物品名:"晾肉架"
        },
        BEEBOX_HERMIT =
        {
            READY = "它们的辛勤工作收获颇丰！",		-- 物品名:"蜂箱"->准备好的 满的
            FULLHONEY = "它们的辛勤工作收获颇丰!",		-- 物品名:"蜂箱"->蜂蜜满了
            GENERIC = "这里只剩下甜蜜的回忆。",		-- 物品名:"蜂箱"->默认
            NOHONEY = "好想吃蜂蜜...",		-- 物品名:"蜂箱"->没有蜂蜜
            SOMEHONEY = "再加把劲。",		-- 物品名:"蜂箱"->有一些蜂蜜
            BURNT = "蜂蜜烧掉了。",		-- 物品名:"蜂箱"->烧焦的
        },
        HERMITCRAB = "你也在等你的爱人吗",		-- 物品名:"寄居蟹隐士"
        HERMIT_PEARL = "我来照顾它。",		-- 物品名:"珍珠的珍珠"
        HERMIT_CRACKED_PEARL = "你的爱意，传达到了。",		-- 物品名:"开裂珍珠"
        WATERPLANT = "真美。",		-- 物品名:"海草"
        WATERPLANT_BOMB = "有意思的小玩具。",		-- 物品名:"种壳"
        WATERPLANT_BABY = "奇异的生物。",		-- 物品名:"海芽"
        WATERPLANT_PLANTER = "我可以将它带回去。",		-- 物品名:"海芽插穗"
        SHARK = "危险并且强大。",		-- 物品名:"岩石大白鲨"
        MASTUPGRADE_LAMP_ITEM = "无法开关的灯，总是缺了点什么。",		-- 物品名:"甲板照明灯" 制造描述:"桅杆照明附件。"
        MASTUPGRADE_LIGHTNINGROD_ITEM = "最好不会用到它。",		-- 物品名:"避雷导线" 制造描述:"为你的桅杆带来过电般的刺激。"
        WATERPUMP = "感谢口水鱼的付出。",		-- 物品名:"消防泵" 制造描述:"水水水，到处都是水！"
        BARNACLE = "我们把它从它的家里撬了出来。",		-- 物品名:"藤壶"
        BARNACLE_COOKED = "有点……难嚼。",		-- 物品名:"熟藤壶"
        BARNACLEPITA = "饼皮好硬。",		-- 物品名:"藤壶皮塔饼"
        BARNACLESUSHI = "还是没我自己的寿司好吃。",		-- 物品名:"藤壶握寿司"
        BARNACLINGUINE = "我喜欢吃白面，加黄油。",		-- 物品名:"藤壶中细面"
        BARNACLESTUFFEDFISHHEAD = "我总觉得鱼还在看着我。",		-- 物品名:"酿鱼头"
        LEAFLOAF = "好新奇的味道，和我以前吃过的东西完全不同。",		-- 物品名:"叶肉糕"
        LEAFYMEATBURGER = "减肥好帮手。",		-- 物品名:"素食堡"
        LEAFYMEATSOUFFLE = "哦。我还以为是甜点呢……",		-- 物品名:"果冻沙拉"
        MEATYSALAD = "这个沙拉的味道很奇怪……",		-- 物品名:"牛肉绿叶菜"
		MOLEBAT = "大自然给这种生物开了一个残酷的玩笑。",		-- 物品名:"裸鼹鼠蝙蝠"
        MOLEBATHILL = "真的是十分的奇怪。",		-- 物品名:"裸鼹鼠蝙蝠山丘"
        BATNOSE = "它不会再打扰我们了。",		-- 物品名:"裸露鼻孔"
        BATNOSE_COOKED = "熟的也不太好吃。",		-- 物品名:"炭烤鼻孔"
        BATNOSEHAT = "我也会是第一名吗?",		-- 物品名:"牛奶帽"
        MUSHGNOME = "它是如此的……有弹性。",		-- 物品名:"蘑菇地精"
        SPORE_MOON = "这小东西啪啪啪地爆炸。",		-- 物品名:"月亮孢子"
        MOON_CAP = "这是来自月亮的力量。",		-- 物品名:"月亮蘑菇"
        MOON_CAP_COOKED = "全都是有韧性的。",		-- 物品名:"熟月亮蘑菇"
        MUSHTREE_MOON = "我越来越好奇了。",		-- 物品名:"月亮蘑菇树"
        LIGHTFLIER = "会发光的小可爱。",		-- 物品名:"球状光虫"
        GROTTO_POOL_BIG = "如此的美丽。",		-- 物品名:"玻璃绿洲"
        GROTTO_POOL_SMALL = "如此的美丽。",		-- 物品名:"小玻璃绿洲"
        DUSTMOTH = "不知道他们是为了什么，信仰吗?",		-- 物品名:"尘蛾"
        DUSTMOTHDEN = "最终还是到了我们的手中。",		-- 物品名:"整洁洞穴"
        ARCHIVE_LOCKBOX = "我要怎么打开它？也许钥匙就在附近。",		-- 物品名:"蒸馏的知识"
        ARCHIVE_CENTIPEDE = "它应该是不死的。",		-- 物品名:"远古哨兵蜈蚣"
        ARCHIVE_CENTIPEDE_HUSK = "它没有死，只是断电了。",		-- 物品名:"哨兵蜈蚣壳"
        ARCHIVE_COOKPOT =
        {
            COOKING_LONG = "里面的东西还是活的。",		-- 物品名:"远古窑"->饭还需要很久
            COOKING_SHORT = "这需要煮煮。",		-- 物品名:"远古窑"->饭快做好了
            DONE = "食物终于出炉了。",		-- 物品名:"远古窑"->完成了
            EMPTY = "盖满了灰尘。",		-- 物品名:"远古窑"
            BURNT = "烧焦了。",		-- 物品名:"远古窑"->烧焦的
        },
        ARCHIVE_MOON_STATUE = "不知道是在纪念谁？",		-- 物品名:"远古月亮雕像"
        ARCHIVE_RUNE_STATUE = 
        {
            LINE_1 = "这是一种已经消亡的文字。",		-- 物品名:"远古月亮符文石"->第一行
            LINE_2 = "它重要到需要刻在石头里，但我们永远不会知道它的意义。",		-- 物品名:"远古月亮符文石"->第二行
            LINE_3 = "真可惜啊。",		-- 物品名:"远古月亮符文石"->第三行
            LINE_4 = "它重要到需要刻在石头里，但我们永远不会知道它的意义。",		-- 物品名:"远古月亮符文石"->第四行
            LINE_5 = "真可惜啊。",		-- 物品名:"远古月亮符文石"->第五行
        },        
        ARCHIVE_RESONATOR =
	{
            GENERIC = "所有的道路都通向苦难。",		-- 物品名:"天体探测仪"->默认
            IDLE = "没有什么值得寻找的了。",		-- 物品名:"天体探测仪"
        },
        ARCHIVE_RESONATOR_ITEM = "不知道是谁设计的他。",		-- 物品名:"天体探测仪" 制造描述:"它会出土什么秘密呢？"
        ARCHIVE_LOCKBOX_DISPENCER =
	{
          POWEROFF = "毫无生气。就像这个地方的一切。",		-- 物品名:"知识饮水机"
          GENERIC =  "这是世界的知识，不，只是一部分而已。",		-- 物品名:"知识饮水机"->默认
        },
        ARCHIVE_SECURITY_DESK =
	{
            POWEROFF = "毫无生机。",		-- 物品名:"远古哨所"
            GENERIC = "悲哀……已经没有人守护了。",		-- 物品名:"远古哨所"->默认
        },
        ARCHIVE_SECURITY_PULSE = "你要去哪儿？",		-- 物品名:"远古哨所"
        ARCHIVE_SWITCH =
	{
            VALID = "它已经得到了想要的宝藏。",		-- 物品名:"华丽基座"->有效
            GEMS = "它还不完整。",		-- 物品名:"华丽基座"->需要宝石
        },
        ARCHIVE_PORTAL =
	{
            POWEROFF = "它会将我带到什么地方？",		-- 物品名:"封印的传送门"
            GENERIC = "不是所有事情都可以轻易地挽回。",		-- 物品名:"封印的传送门"->默认
        },
        WALL_STONE_2 = "在里面又有什么来保护我呢？",		-- 物品名:"档案馆石墙"
        WALL_RUINS_2 = "这些并没能保护古人，不是吗！",		-- 物品名:"档案馆铥墙"
        REFINED_DUST = "尘归尘……土归更厚的土。",		-- 物品名:"尘土块" 制造描述:"远古甜品的关键原料。"
        DUSTMERINGUE = "没甜味的甜点……",		-- 物品名:"琥珀美食"
        SHROOMCAKE = "它会让我成长吗？还是会缩水？蘑菇真有趣。",		-- 物品名:"蘑菇蛋糕"
        NIGHTMAREGROWTH = "当邪恶来敲门。",		-- 物品名:"梦魇城墙"
        TURFCRAFTINGSTATION = "我们可以改变脚下的大地，但不能改变过去。",		-- 物品名:"土地夯实器" 制造描述:"一点点的改变世界。"
        MOON_ALTAR_LINK = "是不是有什么东西藏在里面？",		-- 物品名:"神秘能量"
        COMPOSTINGBIN =
        {
            GENERIC = "成熟的农作物科技。",		-- 物品名:"堆肥桶"->默认 制造描述:"能让土壤变得臭烘烘和肥沃。"
            WET = "水太多，可怜的植物可能会被淹死。",		-- 物品名:"堆肥桶" 制造描述:"能让土壤变得臭烘烘和肥沃。"
            DRY = "干燥而易碎。",		-- 物品名:"堆肥桶" 制造描述:"能让土壤变得臭烘烘和肥沃。"
            BALANCED = "我想这就够了。",		-- 物品名:"堆肥桶" 制造描述:"能让土壤变得臭烘烘和肥沃。"
            BURNT = "谁去清理一下呢？",		-- 物品名:"堆肥桶"->烧焦的 制造描述:"能让土壤变得臭烘烘和肥沃。"
        },
        COMPOST = "腐烂与衰败。",		-- 物品名:"堆肥"
        SOIL_AMENDER = 
		{ 
			GENERIC = "我们用它们海生表亲的腐烂外壳来滋养土壤。",		-- 物品名:"催长剂起子"->默认 制造描述:"海里来的瓶装养分。"
			STALE = "它分解得很好。",		-- 物品名:"催长剂起子"->过期了 制造描述:"海里来的瓶装养分。"
			SPOILED = "它他需要发酵，这就是自然的力量。",		-- 物品名:"催长剂起子"->腐烂了 制造描述:"海里来的瓶装养分。"
		},
		SOIL_AMENDER_FERMENTED = "现在完成了。",		-- 物品名:"超级催长剂"
        WATERINGCAN = 
        {
            GENERIC = "这是我农田的第一步。",		-- 物品名:"空浇水壶"->默认 制造描述:"让植物保持快乐和水分。"
            EMPTY = "我希望它也能用来浇花。",		-- 物品名:"空浇水壶" 制造描述:"让植物保持快乐和水分。"
        },
        PREMIUMWATERINGCAN =
        {
            GENERIC = "是不是有些奢侈了。",		-- 物品名:"空鸟嘴壶"->默认 制造描述:"灌溉方面的创新!"
            EMPTY = "它的容量比我想象中的大。",		-- 物品名:"空鸟嘴壶" 制造描述:"灌溉方面的创新!"
        },
		FARM_PLOW = "他能给我开出一片良田。",		-- 物品名:"耕地机"
		FARM_PLOW_ITEM = "看来这里的土质也不是那么的硬。",		-- 物品名:"耕地机" 制造描述:"为你的植物犁一块地。"
		FARM_HOE = "我要为种子们准备好生长的地方。",		-- 物品名:"园艺锄" 制造描述:"翻耕，为撒播农作物做准备。"
		GOLDEN_FARM_HOE = "谁都可以成为一个种田小能手。",		-- 物品名:"奢华园艺锄" 制造描述:"优雅地耕地。"
		NUTRIENTSGOGGLESHAT = "他的科技含量十分的高，以至于有些繁杂。",		-- 物品名:"高级耕作先驱帽" 制造描述:"让你看到一个成功的花园。"
		PLANTREGISTRYHAT = "我能通过他看到微观世界。",		-- 物品名:"耕作先驱帽" 制造描述:"让你的园艺专业知识得到增长。"
        FARM_SOIL_DEBRIS = "你不属于这里。",		-- 物品名:"农田杂物"
		FIRENETTLES = "它们刺痛得很厉害。",		-- 物品名:"火荨麻叶"
		FORGETMELOTS = "就算是野草，或许我也会非常喜欢它。",		-- 物品名:"必忘我"
		SWEETTEA = "我的身心都放松了不少。",		-- 物品名:"舒缓茶"
		TILLWEED = "一种最顽固的杂草。",		-- 物品名:"犁地草"
		TILLWEEDSALVE = "杂物再利用。",		-- 物品名:"犁地草膏" 制造描述:"慢慢去处病痛。"
		TROPHYSCALE_OVERSIZEDVEGGIES =
		{
			GENERIC = "这是我辛勤的证明。",		-- 物品名:"农产品秤"->默认 制造描述:"称量你珍贵的水果和蔬菜。"
			HAS_ITEM = "重量: {weight}\n收获日: {day}\n也许还行吧。",		-- 物品名:"农产品秤" 制造描述:"称量你珍贵的水果和蔬菜。"
			HAS_ITEM_HEAVY = "重量: {weight}\n收获日: {day}\n它的重量一定能把我压的粉碎。",		-- 物品名:"农产品秤" 制造描述:"称量你珍贵的水果和蔬菜。"
            HAS_ITEM_LIGHT = "他或许是有些太轻了。",		-- 物品名:"农产品秤" 制造描述:"称量你珍贵的水果和蔬菜。"
			BURNING = "它在火中燃烧。",		-- 物品名:"农产品秤"->正在燃烧 制造描述:"称量你珍贵的水果和蔬菜。"
			BURNT = "哦，看来我需要一个新的了。",		-- 物品名:"农产品秤"->烧焦的 制造描述:"称量你珍贵的水果和蔬菜。"
        },
        CARROT_OVERSIZED = "一丛巨大的、虬结的可食用的根茎。",		-- 物品名:"巨型胡萝卜"
        CORN_OVERSIZED = "我可以给所有人爆出足够多的玉米花。",		-- 物品名:"巨型玉米"
        PUMPKIN_OVERSIZED = "他能做成《灰姑娘》里的南瓜马车吗？好期待。",		-- 物品名:"巨型南瓜"
        EGGPLANT_OVERSIZED = "似乎没什么两样。",		-- 物品名:"巨型茄子"
        DURIAN_OVERSIZED = "这个为什么要长这么大？",		-- 物品名:"巨型榴莲"
        POMEGRANATE_OVERSIZED = "他的籽也一起变大了吗？",		-- 物品名:"巨型石榴"
        DRAGONFRUIT_OVERSIZED = "巨大的火龙...果。",		-- 物品名:"巨型火龙果"
        WATERMELON_OVERSIZED = "看来我一个人是吃不完了。",		-- 物品名:"巨型西瓜"
        TOMATO_OVERSIZED = "变大了似乎也还是这个味道。",		-- 物品名:"巨型番茄"
        POTATO_OVERSIZED = "我不知道我自己能不能搬得动……",		-- 物品名:"巨型土豆"
        ASPARAGUS_OVERSIZED = "能做好几份芦笋汤了。",		-- 物品名:"巨型芦笋"
        ONION_OVERSIZED = "你不会让我流泪的。",		-- 物品名:"巨型洋葱"
        GARLIC_OVERSIZED = "有些像小辫子。",		-- 物品名:"巨型大蒜"
        PEPPER_OVERSIZED = "好多辣椒。",		-- 物品名:"巨型辣椒"
        VEGGIE_OVERSIZED_ROTTEN = "就这样了。",		-- 物品名:"农产品秤" 制造描述:"称量你珍贵的水果和蔬菜。"
		FARM_PLANT =
		{
			GENERIC = "一株植物。",		-- 物品名:未找到
			SEED = "一个人在地里，下面冷不冷？",		-- 物品名:未找到
			GROWING = "这也是它的希望。",		-- 物品名:未找到
			FULL = "这个能给我吗？",		-- 物品名:未找到
			ROTTEN = "我也无能为力。",		-- 物品名:未找到
			FULL_OVERSIZED = "它怎么长这么大的？",		-- 物品名:未找到
			ROTTEN_OVERSIZED = "万物归终。",		-- 物品名:未找到
			FULL_WEED = "园子里的杂草都难逃被铲除的宿命。",		-- 物品名:未找到
			BURNING = "所有的工作，都被毁了……",		-- 物品名:未找到
		},
        FRUITFLY = "他们只守护植物。",		-- 物品名:"果蝇"
        LORDFRUITFLY = "这是我的农田，我不欢迎你。",		-- 物品名:"果蝇王"
        FRIENDLYFRUITFLY = "哦。它似乎很友好。",		-- 物品名:"友好果蝇"
        FRUITFLYFRUIT = "现在你们的王是我的了。",		-- 物品名:"友好果蝇果"
        SEEDPOUCH = "更加方便了。",		-- 物品名:"种子袋" 制造描述:"妥善保管好种子。"
        YOTB_SEWINGMACHINE = "用它给牛缝些衣服",		-- 物品名:"缝纫机"
        YOTB_SEWINGMACHINE_ITEM = "要组装起来才有用。",		-- 物品名:"缝纫机套装" 制造描述:"做出完美的皮弗娄牛礼服吧。"
        YOTB_STAGE = "好奇怪的小摊位。",		-- 物品名:"裁判席"
        YOTB_POST =  "皮弗娄牛的舞台",		-- 物品名:"皮弗娄牛舞台"
        YOTB_STAGE_ITEM = "是时候邀请一个专家了",		-- 物品名:"裁判席" 制造描述:"邀请专家出席。"
        YOTB_POST_ITEM =  "在那儿展示我的牛呢",		-- 物品名:"皮弗娄牛舞台" 制造描述:"让你的皮弗娄牛登上舞台中央。"
        YOTB_PATTERN_FRAGMENT_1 = "新款式",		-- 物品名:"恐怖款式碎片" 制造描述:"来一点恐怖的灵感。"
        YOTB_PATTERN_FRAGMENT_2 = "新款式",		-- 物品名:"正式款式碎片" 制造描述:"来一点正式的灵感。"
        YOTB_PATTERN_FRAGMENT_3 = "新款式",		-- 物品名:"喜庆款式碎片" 制造描述:"来一点喜庆的灵感。"
        YOTB_BEEFALO_DOLL_WAR =
	{
            GENERIC = "可爱的小玩偶。",		-- 物品名:"战士皮弗娄牛玩偶"->默认
            YOTB = "评委先生也许想看看它。",		-- 物品名:"战士皮弗娄牛玩偶"
        },
        YOTB_BEEFALO_DOLL_DOLL =
	{
            GENERIC = "可爱的小玩偶。",		-- 物品名:"娃娃皮弗娄牛玩偶"->默认
            YOTB = "评委先生也许想看看它。",		-- 物品名:"娃娃皮弗娄牛玩偶"
        },
        YOTB_BEEFALO_DOLL_FESTIVE =
	{
            GENERIC = "可爱的小玩偶。",		-- 物品名:"喜庆皮弗娄牛玩偶"->默认
            YOTB = "评委先生也许想看看它。",		-- 物品名:"喜庆皮弗娄牛玩偶"
        },
        YOTB_BEEFALO_DOLL_NATURE =
	{
            GENERIC = "可爱的小玩偶。",		-- 物品名:"花朵皮弗娄牛玩偶"->默认
            YOTB = "评委先生也许想看看它。",		-- 物品名:"花朵皮弗娄牛玩偶"
        },
        YOTB_BEEFALO_DOLL_ROBOT =
	{
            GENERIC = "可爱的小玩偶。",		-- 物品名:"铁甲皮弗娄牛玩偶"->默认
            YOTB = "评委先生也许想看看它。",		-- 物品名:"铁甲皮弗娄牛玩偶"
        },
        YOTB_BEEFALO_DOLL_ICE =
	{
            GENERIC = "可爱的小玩偶。",		-- 物品名:"寒霜皮弗娄牛玩偶"->默认
            YOTB = "评委先生也许想看看它。",		-- 物品名:"寒霜皮弗娄牛玩偶"
        },
        YOTB_BEEFALO_DOLL_FORMAL =
	{
            GENERIC = "可爱的小玩偶。",		-- 物品名:"正式皮弗娄牛玩偶"->默认
            YOTB = "评委先生也许想看看它。",		-- 物品名:"正式皮弗娄牛玩偶"
        },
        YOTB_BEEFALO_DOLL_VICTORIAN =
	{
            GENERIC = "可爱的小玩偶。",		-- 物品名:"维多利亚皮弗娄牛玩偶"->默认
            YOTB = "评委先生也许想看看它。",		-- 物品名:"维多利亚皮弗娄牛玩偶"
        },
        YOTB_BEEFALO_DOLL_BEAST =
	{
            GENERIC = "可爱的小玩偶。",		-- 物品名:"幸运野兽弗娄牛玩偶"->默认
            YOTB = "评委先生也许想看看它。",		-- 物品名:"幸运野兽弗娄牛玩偶"
        },
        WAR_BLUEPRINT = "战无不胜！",		-- 物品名:"战士礼服款式"
        DOLL_BLUEPRINT = "很漂亮。",		-- 物品名:"娃娃礼服款式"
        FESTIVE_BLUEPRINT = "节日的气氛",		-- 物品名:"节日盛装款式"
        ROBOT_BLUEPRINT = "坚不可摧",		-- 物品名:"铁甲礼服款式"
        NATURE_BLUEPRINT = "满是花朵",		-- 物品名:"花朵礼服款式"
        FORMAL_BLUEPRINT = "看起来很体面。",		-- 物品名:"正式礼服款式"
        VICTORIAN_BLUEPRINT = "维多利亚",		-- 物品名:"维多利亚礼服款式"
        ICE_BLUEPRINT = "凛冬降临",		-- 物品名:"寒霜礼服款式"
        BEAST_BLUEPRINT = "带来好运",		-- 物品名:"幸运野兽礼服款式"
        BEEF_BELL = "我应该选一头牛",		-- 物品名:"皮弗娄牛铃" 制造描述:"与皮弗娄牛交朋友。"
    },
    DESCRIBE_GENERIC = "我不太懂。",		--检查物品描述的缺省值
    DESCRIBE_TOODARK = "悠，握住我的手",		--天太黑
    DESCRIBE_SMOLDERING = "不好，要着火了",		--冒烟
    DESCRIBE_PLANTHAPPY = "它很满足。",		--检查植物 植物满足
    DESCRIBE_PLANTVERYSTRESSED = "它很痛苦。快帮帮它。",		--检查植物 植物压力山大(没戴眼镜时检查)
    DESCRIBE_PLANTSTRESSED = "周围的一些东西让它的生活相当困难。",		--检查植物 植物有压力(没戴眼镜时检查)
    DESCRIBE_PLANTSTRESSORKILLJOYS = "我应该整理一下花园",		--检查植物 有讨厌的(腐烂的大蔬菜、杂草、土壤杂物碎片)
    DESCRIBE_PLANTSTRESSORFAMILY = "它很孤独……",		--检查植物 同类作物不足
    DESCRIBE_PLANTSTRESSOROVERCROWDING = "它离其他植物太近了……会窒息……",		--检查植物 过度拥挤
    DESCRIBE_PLANTSTRESSORSEASON = "他不适合这个季节",		--检查植物 季节错误
    DESCRIBE_PLANTSTRESSORMOISTURE = "我忘了浇水了",		--检查植物 缺少水分
    DESCRIBE_PLANTSTRESSORNUTRIENTS = "它缺少营养。",		--检查植物 缺少养分
    DESCRIBE_PLANTSTRESSORHAPPINESS = "它很寂寞,我应该陪陪它",		--检查植物 没聊天
    EAT_FOOD =
    {
        TALLBIRDEGG_CRACKED = "你不会抢走悠吧",		--吃孵化的高脚鸟蛋
		WINTERSFEASTFUEL = "很熟悉的味道，以前应该和悠一起吃过。",		--吃冬季盛宴食物
    },
}

return SORA_SPEECH