Preload("Quest26001.lua")
Preload("Quest26002.lua")
Preload("Quest26003.lua")
Preload("Quest26004.lua")
Preload("Quest69207.lua")
Npc00028= {	
	npc_id = 28,				
	name = GetNpcName(28),							
}

function Npc00028:Talk(bProcess)
	local quest26001 = player:GetQuests():GetQuest(26001) 
	local quest26002 = player:GetQuests():GetQuest(26002)
	local quest26003 = player:GetQuests():GetQuest(26003)
	local quest26004 = player:GetQuests():GetQuest(26004)
	local quest69207 = player:GetQuests():GetQuest(69207)
	if (HasQuest(26001) and quest26001:GetEndNpcId() == self.npc_id) or
		(HasQuest(26002) and quest26002:GetEndNpcId() == self.npc_id) or
		(HasQuest(26003) and quest26003:GetEndNpcId() == self.npc_id) or
		(HasQuest(26004) and quest26004:GetEndNpcId() == self.npc_id) or
		(HasQuest(69207) and quest69207:GetEndNpcId() == self.npc_id) or
		(HasQuest(69208) and quest69208:GetEndNpcId() == self.npc_id) then
		NpcAsk("靠山吃山,靠海吃海。"..RandomLine(10))
		if (HasQuest(26001) and quest26001:GetEndNpcId() == self.npc_id) or
			(HasQuest(26002) and quest26002:GetEndNpcId() == self.npc_id) or
			(HasQuest(26003) and quest26003:GetEndNpcId() == self.npc_id) or
			(HasQuest(26004) and quest26004:GetEndNpcId() == self.npc_id) then
			SetAnswer(1, "任务链")
		end
		if (HasQuest(69207) and quest69207:GetEndNpcId() == self.npc_id) then
		  SetAnswer(2, "官职任务")
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
	  elseif GetAnswer() == 2 then
		  Quest69207:Return()
		end
	else
		NpcAsk("靠山吃山,靠海吃海。"..RandomLine(10))
		SetAnswer(1,"离开")
		WaitAnswer(1)
	end
end
--..RandomLine(10)
function RandomLine(MaxLine)
    local r = math.random(1,MaxLine)
	local t = ""
    for i=1, r do
		t = tostring(t)..tostring("\r.")
	end
	return t
end
AddNpcTable(Npc00028)