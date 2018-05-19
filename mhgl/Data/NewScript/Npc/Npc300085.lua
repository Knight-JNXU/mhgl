Preload("Quest69203.lua")
Npc300085 = {							-- 游泳大赛使者
	npc_id = 300085,						-- NPC ID
	name = GetNpcName(300085),				-- NPC 名称
										-- NPC 会派出的任务表
}

--  对话方法，bProcess 为脚本处理阶段
function Npc300085:Talk(bProcess)
	if npc then
		if player:GetQuests():GetNpcFlag(300460,0,30) ~= LuaI.GetRealDay(LuaI.GetServiceTime()) then
			if bProcess then
				for i = 0 , 29 do
					player:GetQuests():SetNpcFlag(300460,0,i,0)
				end
				player:GetQuests():SetNpcFlag(300460,0,30,LuaI.GetRealDay(LuaI.GetServiceTime()))
			end
		end
		NpcAsk("端午佳节，明皇特意邀请天下群侠展示武艺，参与荼蘼花事游泳大赛！")
		SetAnswer(1,"好，我们来参加比赛")
		SetAnswer(2,"荼蘼花事游泳大赛怎么玩")
		SetAnswer(3,"领取游泳大赛前十名奖励")
		SetAnswer(4,"我下次再来")
		WaitAnswer(4)
		if GetAnswer() == 1 then
			local Day = LuaI.GetRealDay(LuaI.GetServiceTime())
			local Hour = LuaI.GetRealHour(LuaI.GetServiceTime())
	--[[		if not ( Day >= 19 and Day <= 23 ) or not ( ( Hour >= 10 and Hour < 12 ) or ( Hour >= 15 and Hour < 17 ) or ( Hour >= 19 and Hour < 23 ) ) then
				NpcSayParty("对不起，游泳大赛尚未开始或者已经结束，各位大侠请回吧。")
				return
			end--]]
			if not party then
				NpcSay("游泳大赛需要大家团结协力，共同拼搏才可以，你还是多找几个朋友过来吧。（需要至少\#G5\#W人的队伍才能参与游泳大赛）")
				return
			end
			if party:GetRealMemNum() < 5 then
				NpcSayParty("你们人数不够，还是多找几个朋友过来吧。（需要至少\#G5\#W人的队伍才能参与游泳大赛）")
				return
			end
			
			
			for i = 0, party:GetRealMemNum() - 1 do
				local member = party:GetInPartyMember(i)
				if member:GetLevel() < 60 then
					NpcSayParty(string.format("\#P%s\#W的功力太弱，请再历练一下再来参赛。（参与比赛的玩家等级不得少于\#G60\#W级）", member:GetName()))
					return
				end
				
				local TotalRound6936 = 0
				local Type6936 = member:GetQuests():GetType(6936)	
				if Type6936 ~= nil then
					TotalRound6936 = Type6936:GetTotalRound()
				end
				if Type6936 == nil then
					member:GetQuests():SetRoundInfo(6936, 2, 2, 1)	
				end
				if TotalRound6936 >= 2 then
					NpcSayParty(string.format("	\#P%s\#W今天已经参加过两次荼蘼花事游泳大赛了，请留点机会给别人吧。",member:GetName()))
					return
				end
				if member:GetQuests():HasQuest(69203) then
					if member:GetQuests():GetQuest(69203):IsFailed() then
						NpcSayParty(string.format("大侠\#P%s\#W上次的游泳大赛还没有完成，请自己先退赛之后再来参加本轮次的比赛。（手动删除任务即可完成退赛）", member:GetName()))
					else
						NpcSayParty(string.format("大侠就不要来糊弄小民了，\#P%s\#W不是正在参加本轮次的比赛了吗。", member:GetName()))
					end
					return
				end
				
				local TotalRound937 = 0
				local Type937 = member:GetQuests():GetType(937)	
				if Type937 ~= nil then
					TotalRound937 = Type937:GetTotalRound()
				end
				if Type937 == nil then
					member:GetQuests():SetRoundInfo(937, 1, 1, 1)	
				end
				
				if Hour >= 10 and Hour <=12 and TotalRound937 >= 2 then
					NpcSayParty(string.format("大侠\#P%s\#W已经报名参加过本轮次的游泳大赛了，还是留点机会给别人吧。（手动删除任务即可完成退赛）", member:GetName()))
					return
				end
				
				local TotalRound938 = 0
				local Type938 = member:GetQuests():GetType(938)	
				if Type938 ~= nil then
					TotalRound938 = Type938:GetTotalRound()
				end
				if Type938 == nil then
					member:GetQuests():SetRoundInfo(938, 1, 1, 1)	
				end
				
				if Hour >= 15 and Hour <=17 and TotalRound938 >= 2 then
					NpcSayParty(string.format("大侠\#P%s\#W已经报名参加过本轮次的游泳大赛了，还是留点机会给别人吧。（手动删除任务即可完成退赛）", member:GetName()))
					return
				end
				
				local TotalRound939 = 0
				local Type939 = member:GetQuests():GetType(939)	
				if Type939 ~= nil then
					TotalRound939 = Type939:GetTotalRound()
				end
				if Type939 == nil then
					member:GetQuests():SetRoundInfo(939, 1, 1, 1)	
				end
				
				if Hour >= 19 and Hour <=21 and TotalRound939 >= 2 then
					NpcSayParty(string.format("大侠\#P%s\#W已经报名参加过本轮次的游泳大赛了，还是留点机会给别人吧。（手动删除任务即可完成退赛）", member:GetName()))
					return
				end
			end
			if bProcess then
				script:SetSaying(true)
				for i = 0, party:GetRealMemNum() - 1 do
					local member = party:GetInPartyMember(i)
					member:GetQuests():SetFlag(6956,0)
					member:GetQuests():RemoveTimeMark(697)
					if Hour >= 10 and Hour <= 12 then
						member:GetQuests():GetType(937):ChangeTotalRound(1)
					elseif Hour >= 15 and Hour <= 17 then
						member:GetQuests():GetType(938):ChangeTotalRound(1)
					elseif Hour >= 19 and Hour <= 21 then
						member:GetQuests():GetType(939):ChangeTotalRound(1)
					end	
				end
				NpcSayParty("报名成功！你们现在可以去找1号接引人挑战第一关，时间宝贵哦。")
				Quest69203:Take()
			end
			
		elseif GetAnswer() == 2 then
			NpcSayParty("从每天19点-20点分别举行3次群侠荼蘼花事游泳大赛，每次历时2小时。玩家需要组满5人在我这里报名，然后从1号游泳大赛接引人出发，一次穿过12个关卡，最后终点在京城。闯关过程中，挑战成功后可进入下一关，如果失败则需要要等待\#G3\#W分钟再来挑战当前的关口。闯关过程中只要有一个成员（包括同伴）存活则算胜利。")
			NpcSayParty("每次游泳大赛最先到达终点的前十个队伍的玩家都会获得额外丰厚的奖励。每个玩家每天只能参加\#G2\#W次游泳大赛。当玩家取消比赛任务，则无法再次参与该轮次的游泳大赛。")
			NpcSay("请当天获得过某个轮次的前十名玩家到我这里领取奖励，每天玩家最多能领取两次。当天前十名的奖励最迟只能在当天\#G24\#W时之前领取。")
	
		elseif GetAnswer() == 3 then
			if party then
				NpcSayParty("请离队后再来我这里领取前十名奖励。")
				return
			end
			if player:GetItems():GetFreeSlot(0) < 2 then
				NpcSay("请在当前背包中留下至少两个空位。")
				return
			end
			
			local TotalRound940 = 0
			local Type940 = player:GetQuests():GetType(940)	
			if Type940 ~= nil then
				TotalRound940 = Type940:GetTotalRound()
			end
			if Type940 == nil then
				player:GetQuests():SetRoundInfo(940, 1, 1, 1)	
			end
			
			local TotalRound941 = 0
			local Type941 = player:GetQuests():GetType(941)	
			if Type941 ~= nil then
				TotalRound941 = Type941:GetTotalRound()
			end
			if Type941 == nil then
				player:GetQuests():SetRoundInfo(941, 1, 1, 1)	
			end
			
			if TotalRound940 == 0 then
				NpcSay("真相只有一个：你没有进入今天比赛的前十名！")
				return
			end
			
			
			local TotalRound942 = 0
			local Type942 = player:GetQuests():GetType(942)	
			if Type942 ~= nil then
				TotalRound942 = Type942:GetTotalRound()
			end
			if Type942 == nil then
				player:GetQuests():SetRoundInfo(942, 1, 1, 1)	
			end
			
			local TotalRound943 = 0
			local Type943 = player:GetQuests():GetType(943)	
			if Type943 ~= nil then
				TotalRound943 = Type943:GetTotalRound()
			end
			if Type943 == nil then
				player:GetQuests():SetRoundInfo(943, 1, 1, 1)	
			end
			if TotalRound940 ~= 0 and TotalRound941 == 0 then
				if TotalRound942 == 0 then
					if bProcess then
						script:SetSaying(true)
						local ItemId = 0
						local a = math.random(1,100)
						if a == 1 then
			        ItemId = RandTable({60204,60205,60206,60207,60212,60213,60214,60215,40000,40001,40002,40003,40004,40005,40006,40007,40008,40009,40010,40011,40012,40013,40014,40015,40016,40017,40018,40019,40020,40021,40022,40023,40024,40025,40026,40027,40028,40029})
						elseif a<= 20 then
			        ItemId = RandTable({20002,20003,20004,20005,20006})
						elseif a<= 25 then
							ItemId = RandTable({30000,30001})
						elseif a<= 45 then
							ItemId = 60124
						elseif a<= 60 then
							ItemId = 60125
						elseif a<= 90 then
							ItemId = RandTable({60401,60411,60421,60431,60441,60451,60461,60471})
						else
							ItemId = 20000
						end
						if ItemId ~= 0 then
							ShowError(string.format("\#W获得物品%s",GetItemName(ItemId)))
							script:Rumor(string.format("\#W %s \#O武艺高强，在荼蘼花事游泳大赛中表现出色获得前十名，明皇把\#B%s\#O给他作为奖赏！", player:GetCharNameLink(), GetItemName(ItemId)),false)		
						end
						player:GetItems():AddItemForScript(ItemId,1)
						NpcSay("这是给你的奖励，请拿好。")
						player:GetQuests():GetType(942):ChangeTotalRound(1)
					end
				else
					NpcSay("想忽悠我吗，你不是已经领取完今天的奖励了？")
					return
				end
			end
			if  TotalRound940 ~= 0 and TotalRound941 ~= 0 then
				if TotalRound942 == 0 then
					if bProcess then
						script:SetSaying(true)
						local ItemId = 0
						local a = math.random(1,100)
						if a == 1 then
			        ItemId = RandTable({60204,60205,60206,60207,60212,60213,60214,60215,40000,40001,40002,40003,40004,40005,40006,40007,40008,40009,40010,40011,40012,40013,40014,40015,40016,40017,40018,40019,40020,40021,40022,40023,40024,40025,40026,40027,40028,40029})
						elseif a<= 20 then
			        ItemId = RandTable({20002,20003,20004,20005,20006})
						elseif a<= 25 then
							ItemId = RandTable({30000,30001})
						elseif a<= 45 then
							ItemId = 60124
						elseif a<= 60 then
							ItemId = 60125
						elseif a<= 90 then
							ItemId = RandTable({60401,60411,60421,60431,60441,60451,60461,60471})
						else
							ItemId = 20000
						end
						if ItemId ~= 0 then
							ShowError(string.format("\#W获得物品%s",GetItemName(ItemId)))
							script:Rumor(string.format("\#W %s \#O武艺高强，在荼蘼花事游泳大赛中表现出色获得前十名，明皇把\#B%s\#O给他作为奖赏！", player:GetCharNameLink(), GetItemName(ItemId)),false)		
						end
						player:GetItems():AddItemForScript(ItemId,1)
						NpcSay("这是给你的奖励，请拿好。")
						NpcSay("你还有一次的前十名奖励没有领取。")
						player:GetQuests():GetType(942):ChangeTotalRound(1)
					end
				elseif TotalRound943 == 0 then
					if bProcess then
						script:SetSaying(true)
						local ItemId = 0
						local a = math.random(1,100)
						if a == 1 then
			        ItemId = RandTable({60204,60205,60206,60207,60212,60213,60214,60215,40000,40001,40002,40003,40004,40005,40006,40007,40008,40009,40010,40011,40012,40013,40014,40015,40016,40017,40018,40019,40020,40021,40022,40023,40024,40025,40026,40027,40028,40029})
						elseif a<= 20 then
			        ItemId = RandTable({20002,20003,20004,20005,20006})
						elseif a<= 25 then
							ItemId = RandTable({30000,30001})
						elseif a<= 45 then
							ItemId = 60124
						elseif a<= 60 then
							ItemId = 60125
						elseif a<= 90 then
							ItemId = RandTable({60401,60411,60421,60431,60441,60451,60461,60471})
						else
							ItemId = 20000
						end
						if ItemId ~= 0 then
							ShowError(string.format("\#W获得物品%s",GetItemName(ItemId)))
							script:Rumor(string.format("\#W %s \#O武艺高强，在荼蘼花事游泳大赛中表现出色获得前十名，明皇把\#B%s\#O给他作为奖赏！", player:GetCharNameLink(), GetItemName(ItemId)),false)		
						end
						player:GetItems():AddItemForScript(ItemId,1)
						NpcSay("这是给你的奖励，请拿好。")
						player:GetQuests():GetType(943):ChangeTotalRound(1)
					end
				else
					NpcSay("想忽悠我吗，你不是已经领取完今天的奖励了？")
					return
				end
			end
		end
	end
end
-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc300085)