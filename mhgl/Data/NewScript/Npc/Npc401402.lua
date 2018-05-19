--wangzl
Preload("Quest304100.lua")

Npc000401402 = {							
	npc_id = 401402,				--周婷仆人一
	name = GetNpcName(401402),	
}


function Npc000401402:Talk(bProcess)
	NpcAsk("那里来的渣渣？也敢管老子的事？")
	SetAnswer(1, "找打~！")
	SetAnswer(2, "快跑")
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
				if member:GetLevel() < 120 then
					NpcSayParty(string.format("\#P%s\#W等级不足\#G120\#W级，不可以玩这么危险的游戏的。", member:GetName()))
					return false
				elseif lvmax - lvmin > 50 then
					NpcSayParty("队员之间等级不能超过\#G50\#W级。")
					return false
				end
			end
		end					
		if bProcess then
			player:EncounterBattle(401402)
		end						
	end
	
end

AddNpcTable(Npc000401402)
