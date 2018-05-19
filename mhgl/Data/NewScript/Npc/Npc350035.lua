--beifang
--万梅山庄梅花桩NPC
--积分3
Preload("Quest60220.lua")

Npc350035 = {							
	npc_id = 350035,					
	name = GetNpcName(350035),	
}

function Npc350035:Talk(bProcess)	
	if npc and npc:GetNpc_id() == player:GetQuests():GetFlag(60220) then	           
        local flag60221 = player:GetQuests():GetFlag(60221)	 
		local flag60230 = player:GetQuests():GetFlag(60230)
		if flag60221 == 0 then
		    if IsProcess() then			    
		        flag60230 = flag60230 + 3
				player:GetQuests():SetFlag(60230,flag60230)
				player:GetQuests():SetFlag(60221,1)					
			end
			NpcSay("\#W获得\#P3\#W点副本积分。")
        elseif flag60221 == 1 then
			NpcAsk("要继续前进吗？")	
			SetAnswer(1, "继续")
			SetAnswer(2, "离开")
			WaitAnswer(2)
		    if GetAnswer() == 1 then
			    if IsProcess() then
		            Quest60220:Take()
			    end
			end
		end			
	else
	    NpcSay( { 		
					"\\r 檐外双梅树，庭前昨夜风。 \\r 不知何处笛，并起一声中。 ",
					"\\r 万树寒无色，南枝独有花。 \\r 香闻流水处，影落野人家。 ",
					"\\r 无事不寻梅，得梅归去来。 \\r 雪深春尚浅，一半到家开。 ",
					"\\r 折梅逢驿使，寄与陇头人。 \\r 江南无所有，聊赠一枝春。 ",
					"\\r 君自故乡来，应知故乡事。 \\r 来日欹穸前，寒梅著花未。 ",
					"\\r 折梅逢驿使，寄与陇头人。 \\r 江南无所有，聊赠一枝春。 ",
					"\\r 墙角数枝梅，凌寒独自开。 \\r 遥知不足雪，为有暗香来。 ",
					"\\r 定定住天涯，依依向物华。 \\r 寒梅最堪恨，长作去年花。 ",
					"\\r 迎春故早发，独自不疑寒。 \\r 畏落众花后，无人别意看。 ",
					"\\r 君自故乡来，应知故乡事。 \\r 来日倚窗前，寒梅著花未？ ",
					"\\r 已见寒梅发，复闻啼鸟声。 \\r 心心视春草，畏向玉阶生。 ",
					"\\r 定定住天涯，依依向物华。 \\r 寒梅最堪恨，长作去年花。 ",
					"\\r 忽见寒梅树，花开汉水滨。 \\r 不知春色早，疑是弄珠人。 ",
					"\\r 白玉堂前一树梅，今朝忽见数花开。 \\r 几家门户重重闭，春色如何入得来？ ",
					"\\r 莫向霜晨怨未开，白头朝夕自相摧。 \\r 斩新一朵含风露，恰似西厢待月来。 ",
					"\\r 梅花开尽白花开，过尽行人君不来。 \\r 不趁青梅尝煮酒，要看细雨熟黄梅。 ",
					"\\r 梦里清江醉墨香，蕊寒枝瘦凛冰霜。 \\r 如今白黑浑休问，且作人间时世妆。 ",
					"\\r 梅花屡见笔如神，松竹宁知更逼真。 \\r 百卉千花皆面友，岁寒只见此三人。 ",
					"\\r 有梅无雪不精神，有雪无梅俗了人。 \\r 日暮诗成天又雪，与梅并作十分香。 ",
					"\\r 梅雪争春未肯降，骚人搁笔费评章。 \\r 梅须逊雪三分白，雪却输梅一段香。 ",
					"\\r 闻君寺后野梅发，香蜜染成宫样黄。 \\r 不拟折来遮老眼，欲知春色到池塘。 ",
					"\\r 小阁明窗半掩门，看书作睡正昏昏。 \\r 无端却被梅花恼，特地吹香破梦魂。 ",
					"\\r 寒夜客来茶当酒，竹炉汤沸火初红。 \\r 寻常一样窗前月，才有梅花便不同。 ",
					"\\r 湘妃危立冻蛟背，海月冷挂珊瑚枝。 \\r 丑怪惊人能妩媚，断魂只有晓寒知。 ",
					"\\r 寒水一瓶春数枝，清香不减小溪时。 \\r 横斜竹底无人见，莫与微云淡月知。 ",
					"\\r 年年芳信负红梅，江畔垂垂又欲开。 \\r 珍重多情关伊令，直和根拨送春来。 ",
					"\\r 池边新栽七株梅，欲到花时点检来。 \\r 莫怕长洲桃李嫉，今年好为使君开。 ",
					"\\r 画师不作粉脂面，却恐傍人嫌我直。 \\r 相逢莫道不相识，夏馥从来琢玉人。 ",
					"\\r 冰雪林中著此身，不同桃李混芳尘。 \\r 忽然一夜清香发，散作乾坤万里春。 ",
					"\\r 我家洗砚池边树，朵朵花开淡墨痕。 \\r 不要人夸好颜色，只留清气满乾坤。 ",
					"\\r 三月东风吹雪消，湖南山色翠如浇。 \\r 一声羌管无人见，无数梅花落野桥。 ",
					"\\r 姑射仙人冰雪肤，昔年伴我向西湖。 \\r 别来几度春风换，标格而今似旧无。 ",
					"\\r 苏老堤边玉一林，六桥风月是知音。 \\r 任他桃李争欢赏，不为繁华易素心。 ",
					"\\r 并蒂连技朵朵双，偏宜照影傍寒塘。 \\r 只愁画角惊吹散，片影分飞最可伤。 ",
					"\\r 明月孤山处士家，湖光寒浸玉横斜。 \\r 似将篆籀纵横笔，铁线圈成个个花。 ",
					"\\r 雨余春涧水争分，野雉双飞过古坟。 \\r 眼见人家住深坞，梅花绕屋不开门。 ",
					"\\r 芳草茸茸没屦深，清和天气润园林。 \\r 霏微小雨初晴处，暗数青梅立树阴。 ",
					"\\r 疏林晴旭散啼鸦，高阁朱帘 地遮。  \\r 为问王孙归也未？玉梅开到北枝花。 ",
					"\\r 逢花却忆故园梅，雪掩寒山径不开。 \\r 明月愁心两相似，一枝素影待人来。 ",
					"\\r 从来不见梅花谱，信手拈来自有神。 \\r 不信试看千万树，东风吹着便成春。 ",
					"\\r 皓态孤芳压俗姿，不堪复写拂云枝。 \\r 从来万事嫌高格，莫怪梅花着地垂。 ",
					"\\r 雪压江村阵作寒，园林俱是玉英攒。 \\r 急须沽酒浇清冻，亦有疏梅唤客看。 ",
					"\\r 春风无力柳条斜，新草微分一抹沙。 \\r 欲向主人借锄插，扫开残雪种梅花。 ",
					"\\r 上皇朝罢酒初酣，写出梅花蕊半含。 \\r 惆怅汴宫春去后，一枝流落到江南。 ",
					"\\r 微雪初消月半池，篱边遥见两三枝。 \\r 清香传得天心在，未话寻常草木知。 ",
					"\\r 竹篱巴外野梅香，带雪分来入醉乡。 \\r 纸张独眠春自在，漫劳车马笑人忙。 ",
					"\\r 梅花得意占群芳，雪后追寻笑我忙。 \\r 折取一技悬竹杖，归来随路有清香。 ",
					"\\r 檀口粉肋含笑语，春风拂拂为开怀。 \\r 酒人得此添狂兴，诗句从天泼下来。 ",
					"\\r 晨起开门雪满山，雪睛云淡日光寒。 \\r 檐流未滴梅花冻，一种清孤不等闲。 ",
					"\\r 老梅愈老愈精神，水店山楼若有人。 \\r 清到十分寒满把，如知明月是前身。 ",
					"\\r 雪后轻桡入翠微，花溪寒气上春衣。 \\r 过桥南岸寻春去，踏遍梅花带月归。 ",
					"\\r 小院栽梅一两行，画空疏影满衣裳。 \\r 冰华化雪月添白，一日东风一日香。 ",
					"\\r 姹紫嫣红耻效颦，独从末路见精神。 \\r 溪山深处苍崖下，数点开来不借春。 ",
					"\\r 奇香异色著林端，百十年来忽兴阑。 \\r 尽把精华收拾去，止留骨格与人看。 ",
					"\\r 梅花此日未生芽，旋转乾坤属画家。 \\r 笔底春风挥不尽，东涂西抹总开花。 ",
					"\\r 挥毫落纸墨痕新，几点梅花最可人。 \\r 愿借天风吹得远，家家门巷尽成春。 ",
					"\\r 耐得人间雪与霜，百花头上尔先香。 \\r 清风自有神仙骨，冷艳偏宜到玉堂。 ",
					"\\r 庭院无尘夜有霜，见来不是等闲香。 \\r 寒宵同作罗浮梦，绝胜东坡在雪堂。 ",
					"\\r 一树寒梅白玉条，迥临村旁傍溪桥。 \\r 不知进水花先发，疑是经冬雪未销。 ",
					"\\r 寒夜客来茶当酒，竹炉汤沸火初红。 \\r 寻常一样穸前月，才有梅花便不同。 ",
					"\\r 不受尘埃半点侵，竹篱茅舍自甘心。 \\r 只因误识林和靖，惹得诗人说到今。 ",
					"\\r 花间小坐夕阳迟，香雪千枝与万枝。 \\r 自入春来无好句，杖藜到此忽成诗。 ",
					"\\r 江北不如南地暖，江南好断北人肠。 \\r 胭脂桃颊梨花粉，共作寒梅一面妆。 ",
					"\\r 折得寒香不露机，小穸斜日两三枝。 \\r 罗帷翠叶深调护，已被游蜂圣得知。 ",
					"\\r 日暖香繁巳盛开，开时曾达千百回。 \\r 春风岂是多情思，相伴花前去又来。 ",
					"\\r 山边幽谷水边村，曾被疏花断客魂。 \\r 犹恨东风无意思，更吹烟雨暗黄昏。 ",
					"\\r 闻道梅花圻晓风，雪堆遍满四山中。 \\r 何方可化身千亿，一树梅花一放翁。 ",
					"\\r 幽谷那堪更北枝，年年自分着花迟。 \\r 高标逸韵君知否，正是层冰积雪时。 ",
					"\\r 雪虐风号愈凛然，花中气节最高坚。 \\r 过时自会飘零去，耻向东君更乞怜。 ",
					"\\r 华发寻春喜见梅，一株临路雪倍堆。 \\r 凤城南陌他年忆，香杳难随驿使来。 ",
					"\\r 早花常犯寒，繁实常苦酸。 \\r 何事上春日，坐令芳意阑？ \\r 夭桃定相笑，游妓肯回看！ \\r 君问调金鼎，方知正味难。 ",
					"\\r 数萼初含雪，孤标画本难。 \\r 香中别有韵，清极不知寒。 \\r 横笛和愁听，斜技依病看。 \\r 逆风如解意，容易莫摧残。 ",
					"\\r 当年腊月半，已觉梅花阑。 \\r 不信今春晚，俱来雪里看。 \\r 树动悬冰落，枝高出手寒。 \\r 早知觅不见，真悔著衣单。 ",
					"\\r 绝讶梅花晚，争来雪里窥。 \\r 下枝低可见，高处远难知。 \\r 俱羞惜腕露，相让道腰羸。 \\r 定须还剪采，学作两三技。 ",
					"\\r 梅蕊腊前破，梅花年后多。 \\r 绝知春意好，最奈客愁何？ \\r 雪树元同色，江风亦自波。 \\r 故园不可见，巫岫郁嵯峨。 ",
					"\\r 万木冻欲折，孤根暖独回。 \\r 前村深雪里，昨夜一枝开。 \\r 风递幽香出，禽窥素艳来。 \\r 明年如应律，先发映春台。 ",
					"\\r 匝路亭亭艳，非时袅袅香。 \\r 素娥惟与月，青女不饶霜。 \\r 赠远虚盈手，伤离适断肠。 \\r 为谁成早秀？不待作年芳   ",
					"\\r 早梅发高树，回映楚天碧。 \\r 朔风飘夜香，繁霜滋晓白。 \\r 欲为万里赠，杳杳山水隔。 \\r 寒英坐销落，何用慰远客。 ",
					"\\r 疏技横玉瘦，小萼点珠光。 \\r 一朵忽先发，百花皆后春。 \\r 欲传春信息，不怕雪埋藏。 \\r 玉笛休三弄，东君正主张。 ",
					"\\r 空山身欲老，徂岁腊还来。 \\r 愁怯年年柳，伤心处处梅。 \\r 绿蔬挑甲短，红蜡点花开。 \\r 冰雪如何有，东风日夜回。 ",
					"\\r 探梅冒雨兴还生，石迳铿然杖有声。 \\r 云影花光乍吞吐，松涛岩溜互喧争。 \\r 韵宜禅榻闲中领，幽爱园扉破处行。 \\r 望去茫茫香雪海，吾家山畔好题名。 ",
					"\\r 和风和雨点苔纹，漠漠残香静里闻。 \\r 林下积来全是雪，岭头飞去半为云。 \\r 不须横管吹江郭，最惜空枝冷夕曛。 \\r 回首孤山山下路，霜禽粉蝶任纷纷。 ",
					"\\r 琼枝只合在瑶台，谁向江南处处栽。 \\r 雪满山中高士卧，月明林下美人来。 \\r 寒依疏影萧萧竹，春掩残香漠漠苔。 \\r 自去何郎无好咏，东风愁绝几回开。 ",
					"\\r 酒未开樽句未裁，寻春问腊到蓬莱。 \\r 不求大士瓶中露，为乞嫦娥槛外梅。 \\r 入世冷桃红雪去，离尘香割紫云来。 \\r 槎桠谁惜诗肩瘦，衣上犹沾佛院苔。 ",
					"\\r 桃未芳菲杏未红，冲寒先已笑东风。 \\r 魂飞庾岭春难辨，霞隔罗浮梦未通。 \\r 绿萼添妆融宝炬，缟仙扶醉跨残虹。 \\r 看来岂是寻常色，浓淡由他冰雪中。 ",
					"\\r 白梅懒赋赋红梅，逞艳先迎醉眼开。 \\r 冻脸有痕皆是血，酸心无恨亦成灰。 \\r 误吞丹药移真骨，偷下瑶池脱旧胎。 \\r 江北江南春灿烂，寄言蜂蝶漫疑猜。 ",
					"\\r 疏是枝条艳是花，春妆儿女竟奢华。 \\r 闲厅曲槛无余雪，流水空山有落霞。 \\r 幽梦冷随红袖笛，游仙香泛绛河槎。 \\r 前身定是瑶台种，无复相疑色相差。 ",
					"\\r 红酥肯放琼苞碎，探著南枝开遍末？ \\r 不知酝藉几多时，但见包藏无限意。 \\r 道人憔悴春窗底，闷损阑干愁不倚。 \\r 要来小看便来休，未必明朝风不起。 ",
					"\\r 众芳摇落独喧妍，占尽风情向小园。 \\r 疏影横斜水清浅，暗香浮动月黄昏。 \\r 霜禽欲下先偷眼，粉蝶如知合断魂。 \\r 幸有微吟可相狎，不须擅板共金樽。 ",
					"\\r 昨夜东风转斗杓，陌头杨柳雪才消。 \\r 晓来一树如繁杏，开向孤村隔小桥。 \\r 应是化工嫌粉瘦，故将颜色助花娇。 \\r 青枝绿叶何须辨，万卉丛中夺锦标。 ",						
			 } )
	end	
end

AddNpcTable(Npc350035)
