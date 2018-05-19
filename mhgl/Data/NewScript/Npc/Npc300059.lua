Preload("Quest50006.lua")
Npc300059 = {							-- 爱吃机器人
	npc_id = 300059,						-- NPC ID
	name = GetNpcName(300059),				-- NPC 名称
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc300059:Talk(bProcess) 
		if player:GetQuests():HasQuest(50006) and player:GetQuests():GetQuest(50006):IsFailed() then
			NpcSay("请去京城（27.280）魏征除取消任务再次科举吧。")
			return
		elseif player:GetQuests():HasQuest(50007) and player:GetQuests():GetQuest(50007):IsFailed() and player:GetQuests():TimeMarkOver(50007, 300) == true then
			NpcSay("请去京城（27.280）魏征除取消任务再次科举吧。")
			return
		elseif player:GetQuests():HasQuest(50008) and player:GetQuests():GetQuest(50008):IsFailed() then
			NpcSay("请去京城（27.280）魏征除取消任务再次科举吧。")
			return
		end
--		Quest50006:Take()
  NpcAsk("当今皇帝求贤若渴，欲广纳天下有才之士为朝廷效力，造福黎民。想要参加会试需要先通过老夫这关乡试。")
	SetAnswer(1, "我了解下科举规则")
	SetAnswer(2, "我要参加乡试")	
	SetAnswer(3, "我要报名会试")
	SetAnswer(4, "离开")
	WaitAnswer(4)
	if GetAnswer() == 1 then
	    NpcAsk("当今皇帝求贤若渴，欲广纳天下有才之士为朝廷效力，造福黎民。想要参加会试需要先通过老夫这关乡试。")
		SetAnswer(1, "我想了解下什么是乡试")
		SetAnswer(2, "我想了解下什么是会试")
		SetAnswer(3, "离开")
		WaitAnswer(3)
		if GetAnswer() == 1 then
		    NpcSay("乡试在每月的首个周六和周日15:00——19:30进行，\#P等级≥30级\#W的玩家都可以参加。乡试的形式为答题，凡答对40题中的至少30题即可过关，否则即被淘汰。每次科举玩家只能参加一次会试。")
		elseif GetAnswer() == 2 then
			NpcAsk("会试分为文试和武试两种类型，你想了解哪一种呢？")
			SetAnswer(1, "我想了解下文试")
			SetAnswer(2, "我想了解下武试")
			SetAnswer(3, "离开")
			WaitAnswer(3)
			if GetAnswer() == 1 then
				NpcSay("通过会试的玩家即可在我这里报名参加参加文试。文试为答题形式，共20关。每关有两次答题机会，答对可得到丰厚奖励，并进入下一关考试，两次均答错则没有奖励，在一定时间内完成文试并回答全部正确的玩家还会获得特殊称谓。若对自己的成绩不满意可以消耗50点体力重新答题，但不允许改变会试类型。每次科举最多可以参加3次会试。")
			elseif GetAnswer() == 2 then
				NpcSay("通过会试的玩家即可在我这里报名选择参加武试。武试形式包括寻人、说服召唤兽和战斗，共20关。考生只需要根据完成任务条件即可过关，每过一关可以得到丰厚奖励，在一定时间内完成武试的玩家还会获得特殊称谓。若对自己的成绩不满意可以消耗50点体力重新答题，但不允许改变会试类型。每次科举最多可以参加3次会试。")
			end
		end
		
	elseif GetAnswer() == 2 then
		local flag = player:GetQuests():GetFlag(50006)
		if (player:GetQuests():HasQuest(50006) or flag == 1) and player:GetQuests():TimeMarkOver(50006, 300) == false then
			if flag == 1 then
				NpcSay("少侠已经通过乡试了，快去参加会试吧。")
			elseif player:GetQuests():HasQuest(50006) then
				NpcSay("少侠已经通过乡试了，快在本官这里报名会试吧。")
			end
		elseif player:GetQuests():TimeMarkOver(50006, 300) == false then
			NpcSay("每次科举只有一次乡试的机会，请少侠下次再来吧。")
		else
			NpcAsk("准备好开始答题了吗？")
		    SetAnswer(1, "开始答题")
			SetAnswer(2, "再等等")
			WaitAnswer(2)
			
			if GetAnswer() == 1 then
				local t = player:GetQuests():GetFlag(444)--回答正确数
				local m = player:GetQuests():GetFlag(555)--回答题目数
				if player:GetLevel() < 30 then
				    NpcSay("低于30级不能参加科举。")
					return
				end
			   
			    local Question ={
					{id=1, title="以下哪个NPC不在京城留香阁里的？",               a1="陈妈妈",         a2="陈百万",       a3="罗百万",     a4="小桃红",               r=2},
					{id=2, title="摄妖香是在哪里买的？",                            a1="杂货店",         a2="打铁铺",       a3="布店",     a4="武器店",               r=1},
					{id=3, title="游戏中搜索NPC的快捷键是什么？",                 a1="Alt+J",         a2="Ctrl+J",       a3="Shift+J",     a4="Alt+Ctrl+J",               r=1},
					{id=4, title="游戏中“召唤兽”的快捷键是什么？",                  a1="Alt+Ctrl+P",         a2="Ctrl+P",       a3="Shift+P",     a4="Alt+P",               r=4},
					{id=5, title="游戏中“宠物”的快捷键是什么？",                  a1="Alt+Ctrl+O",         a2="Ctrl+O",       a3="Alt+O",     a4="Shift+O",               r=3},
					{id=6, title="游戏中“商城”的快捷键是什么？",                  a1="Alt+Ctrl+N",         a2="Alt+N",       a3="Ctrl+N",     a4="Shift+N",               r=2},
					{id=7, title="游戏中“好友”的快捷键是什么？",                  a1="Alt+Ctrl+F",         a2="Alt+F",       a3="Ctrl+F",     a4="Shift+F",               r=2},
					{id=8, title="主线任务能不能取消？",                          a1="不能",         a2="能",       a3="有的能，有的不能",     a4="以上都不对",               r=1},
					{id=9, title="新创建的角色出生在哪张地图？",                  a1="建邺城",         a2="京城",       a3="东海湾",     a4="桃源村",               r=1},
					{id=10, title="游戏中玩家可以使用的一共有多少个聊天频道？",                 a1="5",         a2="7",       a3="8",     a4="10",               r=2},
					{id=11, title="荼蘼花事中一共有几种角色？",                 a1="6",         a2="7",       a3="8",     a4="9",               r=3},
					{id=12, title="长安由多少比组成？",               a1="10",         a2="9",       a3="6",     a4="10",               r=1},
					{id=13, title="赵元宝在建邺城的哪座建筑物附近？",                 a1="兵器谱",         a2="杂货铺",       a3="衙门",     a4="钱庄",               r=4},
					{id=14, title="洞冥草在长安那个地方有卖？",               a1="兵器谱",         a2="药店",       a3="钱庄",     a4="杂货铺",               r=4},
					{id=15, title="以下哪个NPC不在建邺城上的？",                  a1="仓库管理员",         a2="管家",       a3="符全",     a4="宝石商人",               r=4},
					{id=17, title="在东海湾不会遇到以下哪个怪物？",    a1="大海龟",         a2="海星",       a3="大海龟头领",     a4="巨蛙",               r=4},
					{id=18, title="以下哪个选项是打开大地图后不能使用的功能",     a1="自动寻路",         a2="路线显示",       a3="全部显示",     a4="地方简介",               r=1},
					{id=19, title="佛光舍利子在哪个地图上的药店有卖？",                 a1="建邺城的药店",         a2="京城的药店",       a3="朱紫国的药店",     a4="女儿国的药店",               r=1},
					{id=20, title="金疮药在哪个地图上的药店有卖？",                 a1="京城的药店",         a2="朱紫国的药店",       a3="傲来国的药店",     a4="建邺城的药店",               r=4},
					{id=21, title="四叶花在哪个地图上的药店有卖？",               a1="京城的药店",         a2="建邺城的药店",       a3="花果山的药店",     a4="天宫的药店",               r=2},
					{id=22, title="熊胆在哪个地图上的药店有卖？",               a1="朱紫国的药店",         a2="傲来国的药店",       a3="建邺城的药店",     a4="长寿村的药店",               r=3},
					{id=23, title="游戏中结婚必须满足那个条件？",               a1="双倍好友度1000点",         a2="成为好友",       a3="结拜后",     a4="成为好友,好友度为1000点",               r=4},
					{id=24, title="游戏中多少级才能进行拜玩家为师？",               a1="10级",         a2="15级",       a3="20级",     a4="25级",               r=2},
					{id=25, title="双方结拜后会送什么酒？",               a1="女儿红",         a2="虎骨酒",       a3="邵春香",     a4="梅花酒",               r=3},
					{id=26, title="使用金柳露可对召唤兽产生什么效果？",               a1="属性加50点",         a2="等级提升",       a3="等级归0级",     a4="放生",               r=3},
					{id=27, title="主界面可以放置几个快捷键技能？",               a1="8",         a2="7",       a3="10",     a4="5",               r=3},
					{id=28, title="若是双方要进行结婚,需要找个那个Npc?",                 a1="国子监",         a2="程咬金",       a3="月老",     a4="红娘",               r=3},
					{id=29, title="30级的武器在哪个地图上的武器店有卖？",         a1="京城的武器店",         a2="朱紫国的武器店",       a3="傲来国的武器店",     a4="建邺城的武器店",               r=3},
					{id=30, title="30级的防具在哪个地图上的布店有卖？",           a1="京城的武器店",         a2="朱紫国的武器店",       a3="傲来国的武器店",     a4="建邺城的武器店",               r=3},
					{id=31, title="30级的饰品在哪个地图上的饰品店有卖？",         a1="京城的武器店",         a2="朱紫国的武器店",       a3="傲来国的武器店",     a4="建邺城的武器店",               r=3},
					{id=37, title="在游戏中“交易”的快捷键是什么？",               a1="Alt+X",         a2="Ctrl+X",       a3="Shift+X",     a4="Alt+Ctrl+X",               r=1},
					{id=38, title="在游戏中“给予”的快捷键是什么？",               a1="Alt+Ctrl+G",         a2="Ctrl+G",       a3="Alt+G",     a4="Shift+G",               r=3},
					{id=39, title="在游戏中打开“技能”快捷栏的快捷键是什么？",         a1="Alt+Ctrl+W",         a2="Ctrl+W",       a3="Alt+W",     a4="Shift+W",               r=3},
					{id=40, title="在游戏中打开“物品”栏的快捷键是什么？",         a1="Alt+Ctrl+E",         a2="Ctrl+E",       a3="Alt+E",     a4="Shift+E",               r=3},
					{id=41, title="在游戏中打开“系统界面”的快捷键是什么？",       a1="Alt+Ctrl+S",         a2="Ctrl+S",       a3="Shift+S",     a4="Alt+S",               r=4},
					{id=42, title="在游戏中查看角色属性的快捷键是什么？",         a1="Alt+Ctrl+C",         a2="Ctrl+C",       a3="Shift+C",     a4="Alt+C",               r=4},
					{id=43, title="在游戏中进行快速换线的快捷键是什么？",         a1="Alt+Ctrl+Y",         a2="Ctrl+Y ",       a3="Shift+Y",     a4="Alt+Y",               r=4},
					{id=44, title="在游戏中打开“中地图”的快捷键是什么？",         a1="TAB",         a2="Alt+TAB",       a3="Ctrl+TAB",     a4="Shift+TAB",               r=1},
					{id=45, title="在游戏中打开“新手帮助”的快捷键是什么？",       a1="Alt+Ctrl+H",         a2="Alt+H",       a3="Ctrl+H",     a4="Shift+H",               r=2},
					{id=46, title="招式快捷栏有多少个空位可以设定？",             a1="5个",         a2="10个",       a3="15个",     a4="20个",               r=2},
					{id=65, title="游戏中会出现在东海湾的召唤兽是？",a1="老虎"  , a2="章鱼" ,  a3="海星"  ,   a4="海毛虫",r=3},
					{id=66, title="游戏中野猪会出现在哪个场景？",a1="江南野外"  , a2="东海湾"  , a3="长安城" ,    a4="北俱芦洲",r=1},
					{id=67, title="游戏中会出现在花果山的召唤兽是？",a1="黑熊精"  , a2="小龙女"  , a3="狼"  ,   a4="古代瑞兽",r=2},
					{id=68, title="游戏中会出现在海底迷宫一层的宝宝是？",a1="树怪" ,  a2="蟹将" ,  a3="龟丞相"  ,   a4="虾兵",r=4},
					{id=69, title="游戏中出现龙龟的场景是？",a1="东海湾",   a2="小西天" ,  a3="蓬莱仙岛" ,    a4="花果山",r=3},
					{id=70, title="游戏中会出现红萼仙子的场景是？",a1="东海湾" ,  a2="小西天"  , a3="花果山"  ,   a4="蓬莱仙岛",r=4},
					{id=71, title="游戏中踏云兽会出现的是？",a1="东海湾" ,  a2="小西天"   ,a3="蓬莱仙岛"  ,   a4="花果山",r=3},
					{id=72, title="游戏中在长寿村郊外的会出现是？",a1="老虎" ,  a2="黑熊" ,  a3="狼" ,   a4="野猪",r=3},
					{id=74, title="游戏中不会出现在无名鬼域的是？",a1="鬼将",   a2="马面" ,  a3="画魂" ,    a4="幽灵",r=2},
					{id=75, title="游戏中鬼将出现的场景是？",a1="小西天"  , a2="无名鬼域" ,  a3="花果山"  ,   a4="江南野外",r=2},
					{id=76, title="游戏中大力金刚出现在哪个场景？",a1="蓬莱仙岛",   a2="小西天"  ,  a3="小雷音寺"  ,   a4="江南野外",r=3},
					{id=77, title="游戏中不会出现在大雁塔的是？",a1="强盗"  , a2="狐狸精" ,  a3="虎头怪"  ,   a4="没有怪物",r=4},
					{id=78, title="下列物品中不属于暗器的是？",a1="顺逆神针",   a2="铁枣核" ,  a3="梅花针"  ,   a4="导标旗",r=4},
					{id=79, title="下列防具中哪个是20级的男性衣服？",a1="死亡斗篷"  , a2="神谕披风" ,   a3="鳞甲"  ,   a4="乾坤护心甲",r=3},
					{id=80, title="下列防具中哪个是20级的女性衣服？",a1="金丝蝉翼衫" ,  a2="紫香金乌裙"   , a3="五彩裙"   ,  a4="穰花翠裙",r=3},
					{id=82, title="下列武器中不属于有长柄武器的是？",a1="红缨枪" ,  a2="梨花" ,  a3="画龙点睛"  ,   a4="金背大砍刀",r=3},
					{id=87, title="游戏中存在下列哪些聊天频道？",a1="队伍" ,  a2="江湖"  ,  a3="帮派"  ,   a4="以上皆是",r=4},
					{id=88, title="游戏中抓鬼任务的NPC是谁？",a1="爸爸"  , a2="儿子" ,   a3="爷爷"  ,   a4="钟馗",r=4},
					{id=94, title="在NPC紫衣盗处可以学习的技能是？",a1="做药技能" ,  a2="复活技能"  , a3="修炼技能"  ,   a4="装逼技能",r=1},
					{id=95, title="在铁大力处不能够做到的操作时？",a1="合成精铁" ,  a2="打造武器"   , a3="宝石镶嵌"    , a4="装备修理",r=1},
					{id=96, title="皇榜处没有包含的排行榜是？",a1="古龙高手榜"  , a2="角色高手榜" ,   a3="古龙恶人榜"   ,  a4="门派富豪榜",r=4},
					{id=99, title="超级巫医在场景是哪里？",a1="蓬莱仙岛"   ,a2="五庄观" ,   a3="化生寺",    a4="大唐官府",r=1},
					{id=100, title="在NPC程咬金可以学到的技能是？",a1="横扫技能" ,  a2="装逼技能" ,   a3="打炮技能"  ,   a4="撩妹技能",r=1},
					{id=103, title="李世民出现在哪里？",a1="长安城" ,  a2="建邺城"   , a3="东海湾"  ,   a4="皇宫",r=4},
					{id=104, title="NPC魏征出现的场景是？",a1="长安城",   a2="建邺城" ,   a3="东海湾"   ,  a4="皇宫",r=4},
					{id=105, title="下列不属于召唤兽技能的是？",a1="高级必杀" ,  a2="装逼技能"   , a3="隐身" ,    a4="吸血",r=2},
					{id=106, title="下列不属于召唤兽技能的是？",a1="超级幸运" ,  a2="高级必杀" ,   a3="高级连击"  ,   a4="再生",r=1},
					{id=107, title="下列不属于召唤兽技能的是？",a1="高级强力",  a2="高级偷袭"  ,  a3="超级神佑复生"  ,   a4="高级反击",r=3},
					{id=108, title="下列不属于召唤兽技能的是？",a1="反击",   a2="必杀"    ,a3="暴走"  ,   a4="善恶有报",r=3},
					{id=109, title="下列不属于召唤兽技能的是？",a1="力劈华山" ,  a2="高级撩妹" ,   a3="须弥真言"  ,   a4="高级强力",r=2},
					{id=110, title="只收女弟子的门派是？",a1="五庄观" ,  a2="化生寺"  ,  a3="狮驼岭"   ,  a4="普陀山",r=4},
					{id=111, title="只收男弟子的门派是？",a1="普陀山" ,  a2="女儿村"  ,  a3="五庄观"  ,   a4="盘丝洞",r=3},
					{id=112, title="只收剑侠客的门派是？",a1="龙宫" ,  a2="五庄观"  ,  a3="狮驼岭"  ,   a4="方寸山",r=4},
					{id=113, title="不收剑侠客的门派是？",a1="方寸山"  , a2="化生寺"  ,  a3="大唐官府"  ,   a4="龙宫",r=4},
					{id=114, title="只有一种职业的门派是？",a1="龙宫" ,  a2="天宫"  ,  a3="化生寺"  ,   a4="以上全是",r=4},
					{id=126, title="龙太子使用的武器是？",a1="刀" ,  a2="枪" ,   a3="环"  ,   a4="双剑",r=2},
					{id=127, title="剑侠客使用的武器是？",a1="枪" ,  a2="枪",   a3="鞭"  ,   a4="刀",r=4},
					{id=128, title="逍遥生使用的武器是？",a1="枪" ,  a2="刀" ,   a3="扇"  ,   a4="剑",r=3},
					{id=129, title="骨精灵使用的武器是？",a1="双环"  , a2="环"  ,  a3="棒子"  ,   a4="双剑",r=3},
					{id=130, title="玄彩娥使用的武器是？",a1="双刀"  , a2="飘带" ,   a3="鞭"   ,  a4="双剑",r=2},
					{id=131, title="舞天姬使用的武器是？",a1="环"  , a2="双刀" ,   a3="爪"  ,   a4="双环",r=4},
					{id=132, title="下列角色使用的是剑武器的是？",a1="龙太子"  , a2="玄彩娥"  ,  a3="逍遥生"   ,  a4="虎头怪",r=3},
					{id=133, title="菩提老祖是哪个门派的掌门？",   a1="方寸山" ,  a2="大唐官府" ,   a3="龙宫"  ,  a4="化生寺",r=1},
					{id=134, title="隐密在水里的门派是？",    a1="大唐官府" ,  a2="普陀山"   , a3="化生寺"    , a4="龙宫",r=4},
					{id=135, title="龙宫的掌门是谁？",        a1="程咬金" ,  a2="东海龙王"  ,  a3="镇元大仙"    , a4="菩提老祖",r=2},	
					{id=137, title="《荼蘼花事》的运营公司是？",a1="荼蘼花事"  , a2="网易"  ,  a3="腾讯"  ,   a4="GameOne",r=1},
					{id=138, title="《荼蘼花事》的开发公司是？",a1="荼蘼花事"  , a2="久游网络"  ,  a3="盛大网络"  ,   a4="GameOne",r=1}
					}
				if not bProcess then	
					for i = 1, 30 do
						m = player:GetQuests():GetFlag(555)
						if m >= 30 then
							i = 31
							return
						end
						local R = RandTable(Question)			
						NpcAsk(string.format("%s,%s",R.title,t))
						SetAnswer(1, string.format("%s",R.a1))
						SetAnswer(2, string.format("%s",R.a2))
						SetAnswer(3, string.format("%s",R.a3))			
						SetAnswer(4, string.format("%s",R.a4))
						WaitAnswer(1)
						
						if GetAnswer() == R.r then
							local Lv = player:GetLevel()
							local Exp = (4*Lv+10)*6.6*20*(7+m)
							t = player:GetQuests():GetFlag(444)
							player:GetQuests():SetFlag(444,t+1)	
							player:ChangeExp(Exp,500)
							ShowError(string.format("\#W获得经验值%d",Exp))
						else
							NpcSay("回答错误")
						end
						player:GetQuests():SetFlag(555,m+1)	
					end	
				else	
					script:SetSaying(true)
					local t = player:GetQuests():GetFlag(444)
					NpcSay(string.format("本次答对的题目一共有#P%s道",t))
					if t >= 22 then
						Quest50006:Take()
						player:GetQuests():SetFlag(50006,0)
						player:GetQuests():SetFlag(444,0)
						player:GetQuests():SetFlag(555,0)
					else
						NpcSay("很遗憾，少侠未能通过乡试，请下次再来吧。")
						player:GetQuests():SetFlag(50006,0)
						player:GetQuests():SetFlag(444,0)
						player:GetQuests():SetFlag(555,0)
					end
					if player:GetQuests():TimeMarkOver(50006, 300) then
						player:GetQuests():RemoveTimeMark(50006)
					end
					player:GetQuests():SetTimeMark(50006)
				end
		  end		
		end
	elseif GetAnswer() == 3 then
		local flag = player:GetQuests():GetFlag(50006)
		if flag == 1 then
			if player:GetQuests():TimeMarkOver(50006, 300) == true then	
				NpcSay("只有通过乡试才能参加会试。")
				player:GetQuests():SetFlag(50006,0)
				player:GetQuests():RemoveQuest(50006)
				player:GetQuests():RemoveQuest(50007)
				player:GetQuests():RemoveQuest(50008)
			else
				NpcSay("少侠已经在参加会试了，想戏弄本官不成？")
			end
		else
			if not player:GetQuests():HasQuest(50006) then
				NpcSay("只有通过乡试才能参加会试。")
			else
				Quest50006:Take()
			end
		end
	end
end
-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc300059)
