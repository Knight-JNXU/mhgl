Preload("Quest26001.lua")
Preload("Quest26002.lua")
Preload("Quest26003.lua")
Preload("Quest26004.lua")
Preload("Quest55101.lua")
Npc00080= {	
	npc_id = 80,				
	name = GetNpcName(80),							
}

function Npc00080:Talk(bProcess)
  local quest55101 = player:GetQuests():GetQuest(55101)
	local quest26001 = player:GetQuests():GetQuest(26001) 
	local quest26002 = player:GetQuests():GetQuest(26002)
	local quest26003 = player:GetQuests():GetQuest(26003)
	local quest26004 = player:GetQuests():GetQuest(26004)
	if (HasQuest(26001) and quest26001:GetEndNpcId() == self.npc_id) or
		(HasQuest(26002) and quest26002:GetEndNpcId() == self.npc_id) or
		(HasQuest(26003) and quest26003:GetEndNpcId() == self.npc_id) or
		(HasQuest(26004) and quest26004:GetEndNpcId() == self.npc_id) then
		NpcAsk("人物对话重新修正！")
		if (HasQuest(26001) and quest26001:GetEndNpcId() == self.npc_id) or
			(HasQuest(26002) and quest26002:GetEndNpcId() == self.npc_id) or
			(HasQuest(26003) and quest26003:GetEndNpcId() == self.npc_id) or
			(HasQuest(26004) and quest26004:GetEndNpcId() == self.npc_id) then
			SetAnswer(1, "任务链")
		end
		SetAnswer(3, "离开")
		WaitAnswer(3)
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
		NpcAsk("人物对话重新修正！")
    if HasQuest(55101) and (quest55101:GetTargetNpcId(1) == self.npc_id or quest55101:GetTargetNpcId(2) == self.npc_id) then
      SetAnswer(1, "建设任务")
    end
		SetAnswer(2, "离开")
		WaitAnswer(2)
		if GetAnswer() == 1 then
      ISay("本帮山庄建设中，还请阁下多多帮忙。")
      NpcSay("没问题，回复你们总管就说包在我身上了。")
      if quest55101:GetTargetNpcId(1) == self.npc_id then
        quest55101:FindTargetNPC(1)
      else
        quest55101:FindTargetNPC(2)
      end
      quest55101:UpdateData()
    end
  end
end



AddNpcTable(Npc00080)