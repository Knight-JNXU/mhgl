Preload("Quest10005.lua")
Preload("Quest10006.lua")
Preload("Quest30605.lua")
Preload("Quest30606.lua")
Preload("Quest30607.lua")
Preload("Quest30608.lua")
Preload("Quest55002.lua")

Preload("Quest10026.lua")
Preload("Quest10027.lua")
Preload("Quest10028.lua")
Preload("Quest10029.lua")
Preload("Quest10030.lua")







Npc00011 = {							
	npc_id = 11,					
	name = GetNpcName(11),	
	quests = { Quest10005,Quest10006}	
}
function Npc00011:Talk(bProcess)
	local quest30605 = player:GetQuests():GetQuest(30605) 
	local quest30606 = player:GetQuests():GetQuest(30606)
	local quest30607 = player:GetQuests():GetQuest(30607)
	local quest30608 = player:GetQuests():GetQuest(30608)
	local quest55002 = player:GetQuests():GetQuest(55002)
	local quest_ids = {10005,10006,10027}

		NpcAsk("英雄行走江湖，总该有件称心如意的兵器防身吧？")
		if  HasQuest(quest_ids) then
			SetAnswer(1, "主线任务")
		end
	
		if (HasQuest(30605) and quest30605:GetTargetNpcId(1) == self.npc_id) or 
		(HasQuest(30606) and quest30606:GetTargetNpcId(1) == self.npc_id) or 
		(HasQuest(30607) and quest30607:GetTargetNpcId(1) == self.npc_id) or 
		(HasQuest(30608) and quest30608:GetTargetNpcId(1) == self.npc_id) then
			SetAnswer(2, "镖局任务")
		end
		if HasQuest(55002) and quest55002:GetTargetNpcId(1) == self.npc_id then
			SetAnswer(3, "发展任务")
		end
		SetAnswer(5, "离开")
		WaitAnswer(5)
	
	
		if GetAnswer() == 1 then
			if HasQuest(10005) then
				if Quest10005:Return() then
					Quest10006:Take()
				end
		
		
		
			elseif HasQuest(10006) then
				Quest10006:Return()
			elseif HasQuest(10027) then
				if Quest10027:Return() then
					Quest10028:Take()
				end
			end
		
		
		
		
		
		
		elseif GetAnswer() == 2 then	
			if HasQuest(30605) and quest30605:GetTargetNpcId(1) == self.npc_id then
				Quest30605:ReturnFirst()
			elseif HasQuest(30606) and quest30606:GetTargetNpcId(1) == self.npc_id then
				Quest30606:ReturnFirst()
			elseif HasQuest(30607) and quest30607:GetTargetNpcId(1) == self.npc_id then
				Quest30607:ReturnFirst()
			elseif HasQuest(30608) and quest30608:GetTargetNpcId(1) == self.npc_id then	
				Quest30608:ReturnFirst()
			end
		elseif GetAnswer() == 3 then
			Quest55002:Return()
		end
end
function RandomLine(MaxLine)
    local r = math.random(3,MaxLine)
	local t = ""
    for i=1, r do
		t = tostring(t)..tostring("\r.")
	end
	return t
end
AddNpcTable(Npc00011)
