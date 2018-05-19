Preload("Quest26001.lua")
Preload("Quest26002.lua")
Preload("Quest26003.lua")
Preload("Quest26004.lua")
Npc000149= {	
	npc_id = 149,				
	name = GetNpcName(149),							
}

function Npc000149:Talk(bProcess)
	local quest26001 = player:GetQuests():GetQuest(26001) 
	local quest26002 = player:GetQuests():GetQuest(26002)
	local quest26003 = player:GetQuests():GetQuest(26003)
	local quest26004 = player:GetQuests():GetQuest(26004)
	if (HasQuest(26001) and quest26001:GetEndNpcId() == self.npc_id) or
		(HasQuest(26002) and quest26002:GetEndNpcId() == self.npc_id) or
		(HasQuest(26003) and quest26003:GetEndNpcId() == self.npc_id) or
		(HasQuest(26004) and quest26004:GetEndNpcId() == self.npc_id) then
     NpcAsk({"难道帮主中的就是传送中的七伤拳？",
          "老大要是去当了和尚,我们下面这群小兵可怎么混啊。",
          "帮主不知怎么了,现在经常疯疯癫癫的,还经常把我当成烧饭的。",
          "年轻人,别太放肆,没什么用。"})

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
     NpcAsk({"难道帮主中的就是传送中的七伤拳？",
          "老大要是去当了和尚,我们下面这群小兵可怎么混啊。",
          "帮主不知怎么了,现在经常疯疯癫癫的,还经常把我当成烧饭的。",
          "年轻人,别太放肆,没什么用。"})
		SetAnswer(2, "离开")
		WaitAnswer(2)

	end
end

AddNpcTable(Npc000149)