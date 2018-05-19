Preload("Quest69000.lua")

Npc300410= {	
	npc_id = 300410,				
	name = GetNpcName(300410),		
								
}

function Npc300410:Talk(bProcess)
	local q = player:GetQuests():GetQuest(69000)
	if npc and q and q:GetTargetNpcId(1) == npc:GetNpc_id() and 
		q:GetTargetNpcMap(1) == npc:GetMap_id() and 
		q:GetTargetNpcX(1) == npc:GetCurPosX() and
		q:GetTargetNpcY(1) == npc:GetCurPosY() then
		NpcAsk("没看我在打劫吗，不想死的快走。")
		SetAnswer(1, "竟敢祸害百姓，找死")
		SetAnswer(2, "快走")
		WaitAnswer(2)	
		if GetAnswer() == 1 then
			if party == nil or party:GetRealMemNum() < 1 then
				NpcSay("你们就这么一点人吗，真是可笑！")
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
				    if member:GetLevel() < 30 then
						NpcSayParty(string.format("\#P%s\#W等级不足\#G30\#W级，不要急着来送死。", member:GetName()))
						return false
					elseif lvmax - lvmin > 10 then
						NpcSayParty("队员之间等级不能超过\#G20\#W级。")
						return false
					end
				end
			end					
			if bProcess then
				if npc and npc:GetNpc_id() == 300410 then			
					player:EncounterBattle(300410)
				elseif npc and npc:GetNpc_id() == 300411 then	
					player:EncounterBattle(300411)
				end
			end						
		end
	else
		NpcAsk("没看我在打劫吗，不想死的快走！")
		SetAnswer(1,"离开")
		WaitAnswer(1)
	end	
end

AddNpcTable(Npc300410)

