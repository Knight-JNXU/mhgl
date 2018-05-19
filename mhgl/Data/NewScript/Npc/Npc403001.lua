--wangzl
Preload("Quest690010.lua")

Npc403001 = {							
	npc_id = 403001,				--周婷仆人一
	name = GetNpcName(403001),	
}


function Npc403001:Talk(bProcess)
	NpcAsk("你他妈不装逼，老子不打死你！")
	SetAnswer(1, "找死")
	SetAnswer(2, "快跑")
	WaitAnswer(2)	
	if GetAnswer() == 1 then
		if party == nil or party:GetRealMemNum() < 1 then
			NpcSay("组上\#G1\#W人以上队伍再来找我吧。")
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
				if member:GetLevel() < 110 then
					NpcSayParty(string.format("\#P%s\#W等级不足\#G110\#W级，不可以玩这么危险的游戏的。", member:GetName()))
					return false
				elseif lvmax - lvmin > 20 then
					NpcSayParty("队员之间等级不能超过\#G20\#W级。")
					return false
				end
			end
		end					
		if bProcess then
			player:EncounterBattle(403001)
		end						
	end
	
end

AddNpcTable(Npc403001)
