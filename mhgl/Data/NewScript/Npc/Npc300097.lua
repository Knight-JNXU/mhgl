Preload("Quest69203.lua")
Npc300097 = {							-- 龙舟接引人12
	npc_id = 300097,						-- NPC ID
	name = GetNpcName(300097),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc300097:Talk(bProcess)
	if npc then
		NpcAsk("欢迎参加中国梦幻古龙游泳大赛，我是12号接引人，整个游泳大赛的终点站")
		SetAnswer(1,"开始挑战")
		SetAnswer(2,"等等，还没准备好")
		WaitAnswer(2)
		local a = 0
		local b = 0
		local c = 0
		local Day = LuaI.GetRealDay(LuaI.GetServiceTime())
		local Hour = LuaI.GetRealHour(LuaI.GetServiceTime())
		if GetAnswer() == 1 then
	--[[		if not ( Day >= 19 and Day <= 23 ) or not ( ( Hour >= 10 and Hour < 12 ) or ( Hour >= 15 and Hour < 17 ) or ( Hour >= 19 and Hour < 23 ) ) then
				NpcSayParty("对不起，你们所参加轮次的中国梦幻古龙游泳大赛已经结束，各位大侠请回吧。")
				return
			end--]]
			
			if not party then
				NpcSay("挑战人数不能少于\#G5\#W人。")
				return
			end
			if party:GetRealMemNum() < 5 then
				NpcSayParty("挑战人数不能少于\#G5\#W人。")
				return
			end
			for i = 0, party:GetRealMemNum() - 1 do
				local member = party:GetInPartyMember(i)
				local q = member:GetQuests():GetQuest(69203)
				if q == nil then
					NpcSayParty(string.format("\#P%s\#W是哪来的观众，混在参赛选手里面捣什么乱？",member:GetName()))
					return
				end
				if q:GetTargetNpcId(1) ~= npc:GetNpc_id() then
					NpcSayParty(string.format("大侠\#P%s\#W别来捣乱了，找你该找的人去吧。",member:GetName()))
					return
				end
				if q:IsFailed() then
					NpcSayParty(string.format("大侠\#P%s\#W，你的游泳大赛时间已经用完。",member:GetName()))
					return
				end
				if member:GetQuests():TimeMarkOver(697, 3) == false then
					NpcSayParty(string.format("大侠\#P%s\#W刚才挑战失败，需要休息一下再来吧。",member:GetName()))
					return
				else
					member:GetQuests():RemoveTimeMark(697)
				end
			end
			NpcSayParty("欢迎参加中国梦幻古龙游泳大赛，现在开始比赛的第十二关，我来和大家玩下猜拳吧，如果能赢我就可以过关。")
			if not bProcess then return end
			script:SetSaying(true)
			script:SetAsking(true)
			NpcAskParty("队长准备好了么，请问你要出什么？（仅队长回答有效）")
			SetAnswer(1,"剪刀")
			SetAnswer(2,"石头")
			SetAnswer(3,"布")
			SetAnswer(4,"我要花费25万银两直接过关")
			SetAnswer(5,"等等再来")
			WaitAnswer(5)
			if GetAnswer(0) >= 1 and GetAnswer(0) <= 3 then
				if GetAnswer(0) == math.random(1,3) then
					NpcSayParty("哎，很可惜，你们竟然......赢了！你们过关成功！恭喜你们完成了这次游泳大赛！")
					a = 1
				else
					if math.random(1,2) == 1 then
						NpcSayParty("哎，我们打了个平手，闯关失败，休息\#G3\#W分钟再来吧。")
					else
						NpcSayParty("哎，你输了，闯关失败，休息\#G3\#W分钟再来吧。")
					end
					for i = 0, party:GetRealMemNum() - 1 do
						local member = party:GetInPartyMember(i)
						member:GetQuests():SetTimeMark(697)
					end
					return
				end
			elseif GetAnswer(0) == 4 then
				NpcAsk("真的要花费\#G25\#W万直接通过本关吗？")
				SetAnswer(1,"确定")
				SetAnswer(2,"点错了")
				WaitAnswer(2)
				if GetAnswer() == 1 then
					if player:GetMoney() < 250000 then
						NpcSayParty("队长身上好像钱不够。")
						return
					end
					NpcSayParty("队长缴纳\#G25\#W万银两之后闯关成功！恭喜你们完成了这次游泳大赛！")
					a = 1
					player:ChangeMoney(-250000,13035)
					ShowError("花费250000两")
				end
			end
		end
		if not bProcess then return end
		script:SetSaying(true)
		if a == 1 then
			for i = 0 , 9 do
				if Hour >= 10 and Hour <= 12 then
					if player:GetQuests():GetNpcFlag(300097,0,i) == 0 then
						b = 1
						c = i
						break
					end
				elseif Hour >= 15 and Hour <= 17 then
					if player:GetQuests():GetNpcFlag(300097,0,10+i) == 0 then
						b = 1
						c = i
						break
					end
				elseif Hour >= 19 and Hour <= 21 then
					if player:GetQuests():GetNpcFlag(300097,0,20+i) == 0 then
						b = 1
						c = i
						break
					end
				end	
			end
	
			if b == 1 then
				local d = (c+1)%10
				if d == 0 then
					d = 10
				end
		--		script:Rumor(string.format("这次中国梦幻古龙游泳大赛的第\#G%d\#O名队伍产生了！他们是由\#W %s \#O所率领的队伍，大家快来恭喜他们吧！", d, player:GetCharNameLink()), false)
				script:Rumor(string.format("这次中国梦幻古龙游泳大赛的第\#G%d\#O名队伍产生了！他们是由\#W %s \#O所率领的队伍，队员有\#W %s \#O、\#W %s \#O、\#W %s \#O和\#W %s \#O。大家快来恭喜他们吧！", d, player:GetCharNameLink(), party:GetInPartyMember(1):GetCharNameLink(), party:GetInPartyMember(2):GetCharNameLink(), party:GetInPartyMember(3):GetCharNameLink(), party:GetInPartyMember(4):GetCharNameLink()), false)
				NpcSayParty("恭喜你们进入这次游泳大赛的前十名！各位大侠可以到\#P傲来国\#W的\#A游泳大赛接引人\#W领取前十名奖励。领取期限为今晚24时，过期无效。")
				if Hour >= 19 and Hour <= 20 then
					player:GetQuests():SetNpcFlag(300097,0,20+c,1)
				end
				for i = 0, party:GetRealMemNum() - 1 do
					local member = party:GetInPartyMember(i)
					member:GetQuests():RemoveFlag(6956)
					local TotalRound940 = 0
					local Type940 = member:GetQuests():GetType(940)	
					if Type940 ~= nil then
						TotalRound940 = Type940:GetTotalRound()
					end
					if Type940 == nil then
						member:GetQuests():SetRoundInfo(940, 1, 1, 1)	
					end
					
					local TotalRound941 = 0
					local Type941 = member:GetQuests():GetType(941)	
					if Type941 ~= nil then
						TotalRound941 = Type941:GetTotalRound()
					end
					if Type941 == nil then
						member:GetQuests():SetRoundInfo(941, 1, 1, 1)	
					end
					
					if TotalRound940 == 0 then
						member:GetQuests():GetType(940):ChangeTotalRound(1)
					else
						member:GetQuests():GetType(941):ChangeTotalRound(1)
					end
				end
			end
		
			Quest69203:Take()
		end
	end
end
-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc300097)