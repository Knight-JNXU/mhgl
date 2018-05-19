Preload("Quest26001.lua")
Preload("Quest26002.lua")
Preload("Quest26003.lua")
Preload("Quest26004.lua")
Npc000132= {	
	npc_id = 132,				
	name = GetNpcName(132),							
}

function Npc000132:Talk(bProcess)
	local quest26001 = player:GetQuests():GetQuest(26001) 
	local quest26002 = player:GetQuests():GetQuest(26002)
	local quest26003 = player:GetQuests():GetQuest(26003)
	local quest26004 = player:GetQuests():GetQuest(26004)
	if (HasQuest(26001) and quest26001:GetEndNpcId() == self.npc_id) or
		(HasQuest(26002) and quest26002:GetEndNpcId() == self.npc_id) or
		(HasQuest(26003) and quest26003:GetEndNpcId() == self.npc_id) or
		(HasQuest(26004) and quest26004:GetEndNpcId() == self.npc_id) then
    NpcAsk({"观音姐姐究竟让卷帘大将在此等候何人？",
          "作为执行官,其实我很不忍心看到犯人受刑的,但是也没办法。",
          "流沙河水流尽之时,便是我返乡之日。",
          "",
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
    NpcAsk({"观音姐姐究竟让卷帘大将在此等候何人？",
          "作为执行官,其实我很不忍心看到犯人受刑的,但是也没办法。",
          "流沙河水流尽之时,便是我返乡之日。",
          "",
          })
		SetAnswer(2, "离开")
		WaitAnswer(2)
	end
end

AddNpcTable(Npc000132)