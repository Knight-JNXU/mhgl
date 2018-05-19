Preload("Quest69203.lua")
Npc300092 = {							-- 龙舟接引人7
	npc_id = 300092,						-- NPC ID
	name = GetNpcName(300092),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc300092:Talk(bProcess)
	if npc then
		NpcAsk("欢迎参加中国梦幻古龙游泳大赛，我是7号接引人。")
		SetAnswer(1,"开始挑战")
		SetAnswer(2,"等等，还没准备好")
		WaitAnswer(2)
		if GetAnswer() == 1 then
			local Day = LuaI.GetRealDay(LuaI.GetServiceTime())
			local Hour = LuaI.GetRealHour(LuaI.GetServiceTime())
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
					NpcSayParty(string.format("大侠\#P%s\#W，你的中国梦幻古龙赛龙舟时间已经用完。",member:GetName()))
					return
				end
				if member:GetQuests():TimeMarkOver(697, 3) == false then
					NpcSayParty(string.format("大侠\#P%s\#W刚才挑战失败，需要休息一下再来吧。",member:GetName()))
					return
				else
					member:GetQuests():RemoveTimeMark(697)
				end
			end
			
			NpcSayParty("欢迎参加中国梦幻古龙游泳大赛，现在开始比赛的第七关。")
			NpcAskParty("见到各位大侠身手不凡，我也刚好学了几招，各位大侠就陪我切磋切磋吧。（只有队长选择有效）")
	--		SetAnswer(1,"你是切磋为假，敲诈为真吧，看招！")
			SetAnswer(2,"npc都学会敲诈了。这是25万银两，快放我们过关。")
			SetAnswer(3,"我们想想先")
			WaitAnswer(3)
			if GetAnswer(0) == 1 then
				if bProcess then
					player:EncounterBattle(300092)
				end
			elseif GetAnswer(0) == 2 then
				if player:GetMoney() < 250000 then
					NpcSayParty("队长身上好像钱不够。")
					return
				end
				
				NpcSayParty("各位大侠真够意思，不想切磋就说嘛，我又不会强逼各位，嘿嘿。既然各位那么大方，这一关你们算通过了。")

				if bProcess then
					script:SetSaying(true)
					player:ChangeMoney(-250000,13035)
					ShowError("花费250000两")
					Quest69203:Take()
				end
			end
		end
	end
end
-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc300092)