Preload("Quest69203.lua")
Npc300462 = {							-- 毒蛇
	npc_id = 300462,						-- NPC ID
	name = GetNpcName(300462),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- 对话方法，bProcess 为脚本处理阶段
function Npc300462:Talk(bProcess)
	local Q = player:GetQuests():GetQuest(69203)
	if npc and Q and Q:GetTargetNpcId(1) == npc:GetNpc_id() and 
		Q:GetTargetNpcMap(1) == npc:GetMap_id() and 
		Q:GetTargetNpcX(1) == npc:GetCurPosX() and
		Q:GetTargetNpcY(1) == npc:GetCurPosY() then
		NpcAsk("我就是五毒之一毒蛇，天气炎热，正好是我横行的好时机！")
		SetAnswer(1,"我们来收拾你")
		SetAnswer(2,"点错了")
		WaitAnswer(2)
		if GetAnswer() == 1 then
		  
			local Day = LuaI.GetRealDay(LuaI.GetServiceTime())
			local Hour = LuaI.GetRealHour(LuaI.GetServiceTime())
	--[[		if not ( Day >=19 and Day <= 24 ) or not ( ( Hour >= 10 and Hour <= 12 ) or ( Hour >= 15 and Hour <= 17 ) or ( Hour >= 19 and Hour <= 21 ) ) then
				NpcSayParty("对不起，你们所参加轮次的荼蘼花事龙舟大赛已经结束，各位大侠请回吧。")
				return
			end
			if not party then
				NpcSay("挑战人数不能少于\#G5\#W人。")
				return
			end
			if party:GetRealMemNum() < 5 then
				NpcSayParty("挑战人数不能少于\#G5\#W人。")
				return
			end--]]
			for i = 0, party:GetRealMemNum() - 1 do
				local member = party:GetInPartyMember(i)
				local q = member:GetQuests():GetQuest(69203)
				if q == nil then
					NpcSayParty(string.format("\#P%s\#W是哪来的，没任务来捣什么乱？",member:GetName()))
					return
				end
				if q:GetTargetNpcId(1) ~= npc:GetNpc_id() then
					NpcSayParty(string.format("\#P%s\#W别来捣乱了，找你该找的人去吧。",member:GetName()))
					return
				end
				if q:IsFailed() then
					NpcSayParty(string.format("\#P%s\#W，你的荼蘼花事赛龙舟时间已经用完。",member:GetName()))
					return
				end
				if member:GetQuests():TimeMarkOver(697, 3) == false then
					NpcSayParty(string.format("哈哈，\#P%s\#W刚刚被我打得落花流水，这么快就好了伤疤忘了疼，还是养下伤再来吧。",member:GetName()))
					return
				else
					member:GetQuests():RemoveTimeMark(697)
				end
			end
			if bProcess then
				player:EncounterBattle(300462)
			end
		end
	else
		NpcAsk("京城真是个热闹的地方，我和五毒的兄弟们到这里凑下热闹，嘿嘿。")
		SetAnswer(1,"离开")
		WaitAnswer(1)
	end
end
-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc300462)