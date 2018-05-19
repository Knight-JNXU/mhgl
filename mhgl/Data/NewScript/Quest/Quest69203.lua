-- 定义任务表 : 任务表是个 lua table, 名称要与脚本名称相同
Quest69203 = {
	quest_id = 69203,							-- 任务 ID
	type_id = 6936,								-- 大类 ID
	type_name = "日常活动",
	round_info = {max_round = 2, limit_round = 2, limit_type = 1}, 
	name = "游泳大赛",							-- 任务名称
	feature = { "cancel", "failOverTime"},						-- 任务特性
	time_mark = 696,						-- 时间标志
	time_limit = 7200,
}

-- Quest69203 拿取任务方法
function Quest69203:Take()

	local Quest = player:GetQuests():GetQuest(69203)
	if Quest == nil and npc and npc:GetNpc_id() == 300085 then
		self.descript = string.format("中国梦幻游泳大赛已经开始了，快到\#A1号接引人\#W处报道。##请抓紧速度，每次中国梦幻游泳大赛的前十名会有丰厚奖励。\\r每关挑战失败需要等待3分钟，然后继续找当前接引人挑战。中国梦幻游泳大赛过程中可以使用各种传送道具或者技能。")
		self.target_npc = { {npc_id=300086, map_id=8, x = 41, y = 242} }
		self.end_npc = {npc_id = 300086, map_id = 8, x = 41, y = 242}   --花果山  1号
		AddQuestParty(self)
	else
		if Quest:GetTargetNpcId(1) == 300086 then--1
			if party then
				for i = 0,  party:GetRealMemNum() - 1 do
					local member = party:GetInPartyMember(i)
					self:Return(member,1)
					local q = member:GetQuests():GetQuest(69203)
					q:SetDescription("中国梦幻游泳大赛已经开始了，快到\#A2号接引人\#W处报道。##请抓紧速度，每次中国梦幻游泳大赛的前十名会有丰厚奖励。\\r每关挑战失败需要等待3分钟，然后继续找当前接引人挑战。中国梦幻游泳大赛过程中可以使用各种传送道具或者技能。")
					q:SetTargetNPC(1,300087, 21,10,142)    --龙宫 2号
					q:SetEndNPC(300087, 21,10,142)
					q:UpdateData()
				end
			end
		elseif Quest:GetTargetNpcId(1) == 300087 then--2
			if party then
				for i = 0,  party:GetRealMemNum() - 1 do
					local q = party:GetInPartyMember(i):GetQuests():GetQuest(69203)
					q:SetDescription("中国梦幻游泳大赛已经开始了，快到\#P东海湾虾兵\#W的江边放下\#B荷灯\#W，然后去\#A3号接引人\#W处报道。##请抓紧速度，每次中国梦幻游泳大赛的前十名会有丰厚奖励。\\r每关挑战失败需要等待3分钟，然后继续找当前接引人挑战。中国梦幻游泳大赛过程中可以使用各种传送道具或者技能。")
					q:SetTargetNPC(1,300088, 21,24,19)   --龙宫3号
					q:SetEndNPC(300088, 21,24,19)
					q:UpdateData()
				end
			end
		elseif Quest:GetTargetNpcId(1) == 300088 then --3

			if party then
				for i = 0,  party:GetRealMemNum() - 1 do
		
					local member = party:GetInPartyMember(i)
		
					self:Return(member,3)
			
					local q = member:GetQuests():GetQuest(69203)
		
					q:SetDescription("中国梦幻游泳大赛正在紧张的进行中，快到\#A4号接引人\#W处报道。##请抓紧速度，每次中国梦幻游泳大赛的前十名会有丰厚奖励。\\r每关挑战失败需要等待3分钟，然后继续找当前接引人挑战。中国梦幻游泳大赛过程中可以使用各种传送道具或者技能。")
					q:SetTargetNPC(1,300089, 21,110,198)  --龙宫4号
					q:SetEndNPC(300089, 21,110,198)
					q:UpdateData()
				end
			end
		elseif Quest:GetTargetNpcId(1) == 300089 then--4
			NpcSayParty("欢迎参加中国梦幻游泳大赛，现在开始比赛的第四关。")
			NpcSayParty("随着仲夏到来，五毒渐渐在京城横行，扰乱百姓，你帮我去消灭他们吧。")
				
				local oneMap = {{map_id = 1, x1 = 13, y1 = 35, x2 = 162, y2 = 299}}	--随机生成建邺城一个怪物地图
				local loc = RandMapLoc(oneMap)
				if loc then
					script:GenerateNPC(300462, loc.map_id, loc.x, loc.y, true, 14400)  --生成怪物npcid
					local npcName = GetNpcName(300462)
					if party then
						for i = 0,  party:GetRealMemNum() - 1 do
							local q = party:GetInPartyMember(i):GetQuests():GetQuest(69203)
							q:SetDescription(string.format("到\#P建邺城(%d,%d)\#W一带帮助京城百姓除去\#A%s\#W。\\r小提示：由于毒蛇再生能力极强，最好在\#G5\#W回合内消灭它。\#R战斗死亡没有惩罚\#W。", loc.x, loc.y, npcName))
							q:SetTargetNPC(1,300462, 1,loc.x, loc.y)
							q:SetEndNPC(300462, 1,loc.x, loc.y)     
							q:UpdateData()
						end
					end
				end
		elseif Quest:GetTargetNpcId(1) == 300462 then--与毒蛇对战完毕
			if party then
				
				for i = 0,  party:GetRealMemNum() - 1 do
					local q = party:GetInPartyMember(i):GetQuests():GetQuest(69203)
					q:SetDescription("消灭了五毒之一的毒蛇，快到\#A5号接引人\#W处报道。##请抓紧速度，每次中国梦幻游泳大赛的前十名会有丰厚奖励。\\r每关挑战失败需要等待3分钟，然后继续找当前接引人挑战。中国梦幻游泳大赛过程中可以使用各种传送道具或者技能。")
					q:SetTargetNPC(1,300090, 21,114,55)
					q:SetEndNPC(300090, 21,114,55)      --龙宫5号
					q:UpdateData()
				end
			end
		elseif Quest:GetTargetNpcId(1) == 300090 then--5
			if party then
				for i = 0,  party:GetRealMemNum() - 1 do
					local member = party:GetInPartyMember(i)
					self:Return(member,5)
					local q = member:GetQuests():GetQuest(69203)
					q:SetDescription("中国梦幻游泳大赛正在紧张的进行中，快到\#A6号接引人\#W处报道。##请抓紧速度，每次中国梦幻游泳大赛的前十名会有丰厚奖励。\\r每关挑战失败需要等待3分钟，然后继续找当前接引人挑战。中国梦幻游泳大赛过程中可以使用各种传送道具或者技能。")
					q:SetTargetNPC(1,300091, 22,17,14)    --海底一层6号
					q:SetEndNPC(300091, 22,17,14)
					q:UpdateData()
				end
			end
		elseif Quest:GetTargetNpcId(1) == 300091 then
			NpcSayParty("欢迎参加中国梦幻游泳大赛，现在开始比赛的第六关。")
			NpcSayParty("随着仲夏到来，五毒渐渐在郊外横行，扰乱百姓，你帮我去消灭他们吧。")
			local map = GetMap(2)
			local oneMap = {{map_id = 2, x1 = 7, y1 = 15, x2 = map:GetWidth()-20, y2 = map:GetHeight()-10}}	
			local loc = RandMapLoc(oneMap)
			if loc then
				script:GenerateNPC(300463, loc.map_id, loc.x, loc.y, true, 14400)
				local npcName = GetNpcName(300463)
				if party then
					for i = 0,  party:GetRealMemNum() - 1 do
						local q = party:GetInPartyMember(i):GetQuests():GetQuest(69203)
						q:SetDescription(string.format("到\#P东海湾(%d,%d)\#W一带帮助当地百姓除去\#A%s\#W。\\r小提示：由于蝎子毒性极强，最好尽快将其消灭。\#R战斗死亡没有惩罚\#W。", loc.x, loc.y, npcName))
						q:SetTargetNPC(1,300463, loc.map_id,loc.x, loc.y)
						q:SetEndNPC(300463, loc.map_id, loc.x, loc.y)
						q:UpdateData()
					end
				end
			end
		elseif Quest:GetTargetNpcId(1) == 300463 then--与蝎子对战完毕
			if party then
				for i = 0,  party:GetRealMemNum() - 1 do
					local q = party:GetInPartyMember(i):GetQuests():GetQuest(69203)
					q:SetDescription("消灭了五毒之一的蝎子，即将到达终点了！快到\#A7号接引人\#W处报道。##请抓紧速度，每次游泳大赛的前十名会有丰厚奖励。\\r每关挑战失败需要等待3分钟，然后继续找当前接引人挑战。中国梦幻游泳大赛过程中可以使用各种传送道具或者技能。")
					q:SetTargetNPC(1,300092, 23,28,21)    ---海底一层7号
					q:SetEndNPC(300092, 23,28,21)
					q:UpdateData()
				end
			end
		elseif Quest:GetTargetNpcId(1) == 300092 then--7
			if party then
				for i = 0,  party:GetRealMemNum() - 1 do
					local q = party:GetInPartyMember(i):GetQuests():GetQuest(69203)
					q:SetDescription("中国梦幻游泳大赛正在紧张的进行中，即将到达终点了！快到\#A8号接引人\#W处报道。##请抓紧速度，每次中国梦幻游泳大赛的前十名会有丰厚奖励。\\r每关挑战失败需要等待3分钟，然后继续找当前接引人挑战。中国梦幻游泳大赛过程中可以使用各种传送道具或者技能。")
					q:SetTargetNPC(1,300093, 24,30,25)  ---海底一层8号
					q:SetEndNPC(300093,24,30,25)
					q:UpdateData()
				end
			end
		elseif Quest:GetTargetNpcId(1) == 300093 then
			if player:GetQuests():GetFlag(6956) == 1 then
				NpcSayParty("欢迎参加中国梦幻游泳大赛，现在开始比赛的第八关。")
				NpcSayParty("我今天站在这里站到腿都软了，你们帮我弄点东西吃，我就放你们过关。")
				local itemId = RandTable{10003,10004,10007,10041,10034,10031}
				
				for i = 0, party:GetRealMemNum() - 1 do
					local member = party:GetInPartyMember(i)
					member:GetQuests():SetFlag(6956,2)
					local q =member:GetQuests():GetQuest(69203)
					q:SetDescription(string.format("这位接引人想吃点东西了，你们帮忙找到\#G10\#W个\#B%s\#W和\#G1\#W个\#B佛光舍利子\#W给他吧。小提示：佛光舍利子可以到建邺城药店里购买。",GetItemName(itemId)))
					q:SetTargetItem(1,itemId,10,0,0,0,0)
					q:SetTargetItem(2,10008,1,0,0,0,0)   --物品id
					q:SetEndNPC(300093, 24, 30, 25)
					q:UpdateData()
				end
			elseif player:GetQuests():GetFlag(6956) == 2 then
				if player:GetItems():GetItemCount(Quest:GetTargetItemId(1)) >= Quest:GetTargetItemMax(1) and
					player:GetItems():GetItemCount(Quest:GetTargetItemId(2)) >= Quest:GetTargetItemMax(2) then
					NpcSayParty("这么快就弄到了，不错，你们可以到下一关报道了。")
					player:GetItems():RemoveItem(Quest:GetTargetItemId(1),Quest:GetTargetItemMax(1))
					player:GetItems():RemoveItem(Quest:GetTargetItemId(2),Quest:GetTargetItemMax(2))
					if party then
						for i = 0,  party:GetRealMemNum() - 1 do
							local member = party:GetInPartyMember(i)
							self:Return(member,8)
							local q = member:GetQuests():GetQuest(69203)
							q:ResetTarget()
							q:SetDescription("中国梦幻游泳大赛正在紧张的进行中，即将到达终点了！快到\#A9号接引人\#W处报道。##请抓紧速度，每次中国梦幻游泳大赛的前十名会有丰厚奖励。\\r每关挑战失败需要等待3分钟，然后继续找当前接引人挑战。中国梦幻游泳大赛过程中可以使用各种传送道具或者技能。")
							q:SetTargetNPC(1,300094, 25,34,29)      --海底四层9号
							q:SetEndNPC(300094,25,34,29)
							q:UpdateData()
						end
					end
				else
					NpcSayParty("我要的东西你们还没找到吗？（东西找齐后交给队长即可）")
					return
				end
			end
		elseif Quest:GetTargetNpcId(1) == 300094 then--9
			if party then
				for i = 0,  party:GetRealMemNum() - 1 do
					local q = party:GetInPartyMember(i):GetQuests():GetQuest(69203)
					q:SetDescription("中国梦幻游泳大赛正在紧张的进行中，即将到达终点了！快到\#A10号接引人\#W处报道。##请抓紧速度，每次中国梦幻游泳大赛的前十名会有丰厚奖励。\\r每关挑战失败需要等待3分钟，然后继续找当前接引人挑战。中国梦幻游泳大赛过程中可以使用各种传送道具或者技能。")
					q:SetTargetNPC(1,300095, 8,81,32)
					q:SetEndNPC(300095,8,81,32)
					q:UpdateData()
				end
			end
		elseif Quest:GetTargetNpcId(1) == 300095 then--10
			if player:GetQuests():GetFlag(6956) == 2 then
				NpcSayParty("欢迎参加中国梦幻游泳大赛，现在开始比赛的第十关。")
				NpcSayParty("随着仲夏到来，五毒渐渐在这里横行，扰乱百姓。你们到处逛逛，见到的话，就帮我消灭他们吧。")
				
				if party then
					for i = 0,  party:GetRealMemNum() - 1 do
						local q = party:GetInPartyMember(i):GetQuests():GetQuest(69203)
						q:SetDescription("在这里到处逛逛，如果见到五毒害虫之一的蟾蜍，消灭他们。\\r小提示：由于蟾蜍繁殖能力极强，最好能同时消灭蟾蜍怪。\#R战斗死亡没有惩罚\#W。")
						q:SetEncountNPC(1,300464, 8,1,math.random(30,50))
						q:SetEndNPC(300095,8,81,32)
						q:UpdateData()
					end
				end
			elseif  player:GetQuests():GetFlag(6956) == 3 then 
				if party then
					for i = 0,  party:GetRealMemNum() - 1 do
						local q = party:GetInPartyMember(i):GetQuests():GetQuest(69203)
						q:ResetTarget()
						q:SetDescription("消灭了五毒之一的蟾蜍，你们的队伍也即将到达终点！快到下一位接引人——\#A11号接引人\#W处报道。##请抓紧速度，每次游泳大赛的前十名会有丰厚奖励。\\r每关挑战失败需要等待3分钟，然后继续找当前接引人挑战。中国梦幻游泳大赛过程中可以使用各种传送道具或者技能。")
						q:SetTargetNPC(1,300096, 8,53,40)
						q:SetEndNPC(300096, 8,53,40)
						q:UpdateData()
					end
				end
			end
		elseif Quest:GetTargetNpcId(1) == 300096 then--11
			NpcSayParty("欢迎参加中国梦幻游泳大赛，现在开始比赛的第十一关。")
			for i = 0,  party:GetRealMemNum() - 1 do
				local q = party:GetInPartyMember(i):GetQuests():GetQuest(69203)
				q:SetDescription("快点帮助这位接引人拜见\#A孙悟空\#W吧。找到\#A孙悟空\#W完成任务。\\r游泳大赛过程中可以使用各种传送道具或者技能。")
				q:SetTargetNPC(1,86,76)
				q:SetEndNPC(86,76)
				q:UpdateData()
			end
		elseif Quest:GetTargetNpcId(1) == 86 then--找到GOGO侠客之后
			if party then
				for i = 0,  party:GetRealMemNum() - 1 do
					local member = party:GetInPartyMember(i)
					self:Return(member,11)
					local q = member:GetQuests():GetQuest(69203)
					q:SetDescription("你们的队伍即将到达终点！快到最后一位接引人——\#A12号接引人\#W处报道。##请抓紧速度，每次中国梦幻游泳大赛的前十名会有丰厚奖励。\\r每关挑战失败需要等待3分钟，然后继续找当前接引人挑战。中国梦幻游泳大赛过程中可以使用各种传送道具或者技能。")
					q:SetTargetNPC(1,300097, 8,13,39)
					q:SetEndNPC(300097, 8,13,39)
					q:UpdateData()
				end
			end
		elseif Quest:GetTargetNpcId(1) == 300097 then--12
			if party then
				for i = 0,  party:GetRealMemNum() - 1 do
					local member = party:GetInPartyMember(i)
					self:Return(member,12)
					member:GetQuests():RemoveQuest(69203)
					member:GetQuests():RemoveTimeMark(696)	
				end
			end
		end
	end
end

function Quest69203:Return(Charactor,round)

	if Charactor == nil then return false end

	
	local lv = Charactor:GetLevel()
	local Exp = (4*lv+10)*6.6*70*3*(5+round)*5/250    --5倍经验
	local Money = 100*lv*round*10/60   --10倍金钱
	Charactor:ChangeExpForScript(Exp,5)
	Charactor:ChangeMoneyForScript(Money,10036)
	ShowMessage(string.format("\#W获得经验值%d", Exp), Charactor)							
	ShowMessage(string.format("\#W获得金钱%d", Money), Charactor)
	
	if Charactor:GetItems():GetFreeSlot(0) >0 then
		local r = math.random(1,200)
		local ItemId = 0
		if r <= 1 then
			ItemId = RandTable({15006,15007,15008,15009}) --强化石
		elseif r <= 3 then
			ItemId = RandTable({20002,20003,20004,20005,20006}) --五宝
		elseif r <= 15 then
			ItemId = RandTable({30000,30001}) -- 66 C66
		elseif r <= 20 then
			ItemId = RandTable({60401,60402,60403,60404,60411,60412,60413,60414,60421,60422,60423,60424,60431,60432,60433,60434,60441,60442,60443,60444,60451,60452,60453,60454,60461,60462,60463,60464,60471,60472,60473,60474})--1级-4级宝石
		elseif r <= 25 then
			ItemId = 60136  --十步一杀
		elseif r <= 50 then
			ItemId = RandTable({60224,60226,60122,60123}) --召唤兽四倍经验丸
		end
		if ItemId ~= 0  then
			Charactor:GetItems():AddItemForScript(ItemId,1)
			ShowMessage(string.format("\#W获得物品%s", GetItemName(ItemId)), Charactor)
		  if math.random(1,2) == 1 then
				script:Rumor(string.format("%s \#O积极参与中国梦幻群侠游泳大赛赛，接引人奖励其\#B%s\#O一个。",Charactor:GetCharNameLink(),GetItemName(ItemId)),false)
			else
				script:Rumor(string.format("%s \#O中国梦幻群侠游泳大赛赛表现神勇，接引人被其表现所折服，决定奖励其\#B%s\#O一个。",Charactor:GetCharNameLink(),GetItemName(ItemId)),false)
			end
		end
	end
end

-- 必需在脚本最后将任务表加入系统中
AddQuestTable(Quest69203)
