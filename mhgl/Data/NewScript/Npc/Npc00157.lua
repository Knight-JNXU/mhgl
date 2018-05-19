Preload("Quest26001.lua")
Preload("Quest26002.lua")
Preload("Quest26003.lua")
Preload("Quest26004.lua")
Npc000157= {	
	npc_id = 157,				
	name = GetNpcName(157),							
}

function Npc000157:Talk(bProcess)
	local quest26001 = player:GetQuests():GetQuest(26001) 
	local quest26002 = player:GetQuests():GetQuest(26002)
	local quest26003 = player:GetQuests():GetQuest(26003)
	local quest26004 = player:GetQuests():GetQuest(26004)
	if (HasQuest(26001) and quest26001:GetEndNpcId() == self.npc_id) or
		(HasQuest(26002) and quest26002:GetEndNpcId() == self.npc_id) or
		(HasQuest(26003) and quest26003:GetEndNpcId() == self.npc_id) or
		(HasQuest(26004) and quest26004:GetEndNpcId() == self.npc_id) then
    NpcAsk({"人到魔的转变往往就在一念之间。",
          "道,可道,非恒道。名,可名,非恒名。",
          "给我一双慧眼,让我看清这个纷繁复杂的世界吧！",
          "人法地,地法天,天法道,道法自然。",
          })
		if (HasQuest(26001) and quest26001:GetEndNpcId() == self.npc_id) or
			(HasQuest(26002) and quest26002:GetEndNpcId() == self.npc_id) or
			(HasQuest(26003) and quest26003:GetEndNpcId() == self.npc_id) or
			(HasQuest(26004) and quest26004:GetEndNpcId() == self.npc_id) then
			SetAnswer(1, "任务链")
		end
		SetAnswer(2, "离开")
		WaitAnswer(2)
		if GetAnswer() == 1 then
			if HasQuest(26001) then
				Quest26001:Return()
			elseif HasQuest(26002) then
				Quest26002:Return()
			elseif HasQuest(26003) then
				Quest26003:Return()
			elseif HasQuest(26004) then
				Quest26004:Return()
			end
		end
	else
    NpcAsk({"人到魔的转变往往就在一念之间。",
          "道,可道,非恒道。名,可名,非恒名。",
          "给我一双慧眼,让我看清这个纷繁复杂的世界吧！",
          "人法地,地法天,天法道,道法自然。",
          })
		SetAnswer(2, "离开")
		WaitAnswer(2)
	end
end

AddNpcTable(Npc000157)