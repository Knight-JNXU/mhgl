--wangzl
Preload("Quest69202.lua")

Npc300528 = {							
	npc_id = 300528,				--周婷仆人一
	name = GetNpcName(300528),	
}


function Npc300528:Talk(bProcess)
	NpcAsk("怎么，是不是想来陪我打架呀？")
	SetAnswer(1, "好的，我陪你玩")
	SetAnswer(2, "现在没空")
	WaitAnswer(2)	
	if GetAnswer() == 1 then
		if party == nil or party:GetRealMemNum() < 1 then
			NpcSay("组上\#G3\#W人以上队伍再来找我吧。")
			return false
		end
		local lvmin = player:GetLevel()
		local lvmax = player:GetLevel()	
		for i = 0, party:GetRealMemNum() - 1 do
			local member = party:GetInPartyMember(i)
			if member then					
				local lv = member:GetLevel()
				if lv < lvmin then
					lvmin = lv
				elseif lv > lvmax then
					lvmax = lv
				end									
				if member:GetLevel() < 119 then
					NpcSayParty(string.format("\#P%s\#W等级不足\#G30\#W级，快滚吧。", member:GetName()))
					return false
				elseif lvmax - lvmin > 20 then
					NpcSayParty("队员之间等级不能超过\#G20\#W级。")
					return false
				end
			end
		end					
		if bProcess then
			player:EncounterBattle(300528)
		end						
	end
	
end

AddNpcTable(Npc300528)
