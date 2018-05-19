Preload("Quest10012.lua")
Preload("Quest10013.lua")
Preload("Quest10021.lua")
Preload("Quest10022.lua")
Preload("Quest30605.lua")
Preload("Quest30606.lua")
Preload("Quest30607.lua")
Preload("Quest30608.lua")
Preload("Quest55002.lua")
Npc00021 = {							
	npc_id = 21,					
	name = GetNpcName(21),	
	quests = { Quest10012,Quest10013,Quest10022}	
}


function Npc00021:Talk(bProcess)
	local quest30605 = player:GetQuests():GetQuest(30605) 
	local quest30606 = player:GetQuests():GetQuest(30606)
	local quest30607 = player:GetQuests():GetQuest(30607)
	local quest30608 = player:GetQuests():GetQuest(30608)
	local quest55002 = player:GetQuests():GetQuest(55002)
	local quest_ids = {10012,10013,10021}
		NpcAsk("这几年风调雨顺、老百姓的日子过的都很富足，只是城外野兽横行，常有外出的百姓受到骚扰。")
		if HasQuest(quest_ids) then
			SetAnswer(1, "主线任务")
		end
		if HasQuest(55002) and quest55002:GetTargetNpcId(1) == self.npc_id then
			SetAnswer(2, "发展任务")
		end
		
		if (HasQuest(30605) and quest30605:GetTargetNpcId(1) == self.npc_id) or 
		(HasQuest(30606) and quest30606:GetTargetNpcId(1) == self.npc_id) or 
		(HasQuest(30607) and quest30607:GetTargetNpcId(1) == self.npc_id) or 
		(HasQuest(30608) and quest30608:GetTargetNpcId(1) == self.npc_id) then
			SetAnswer(4, "镖局任务")
		end
	--	SetAnswer(3, "买卖杂货")
		SetAnswer(5, "离开")
		WaitAnswer(5)

		if GetAnswer() == 1 then
			if HasQuest(10012) then
				if Quest10012:Return() then
					Quest10013:Take()
			
				end
		
			elseif HasQuest(10013) then
				Quest10013:Return()

			elseif HasQuest(10021) then
				if Quest10021:Return() then
					Quest10022:Take()
				end
			end
	
	
	
	
		elseif GetAnswer() == 2 then
			Quest55002:Return()	
		elseif GetAnswer() == 3 then
			script:OpenInterface("shop", 6);
		elseif GetAnswer() == 4 then	
			if HasQuest(30605) and quest30605:GetTargetNpcId(1) == self.npc_id then
				Quest30605:ReturnFirst()
			elseif HasQuest(30606) and quest30606:GetTargetNpcId(1) == self.npc_id then
				Quest30606:ReturnFirst()
			elseif HasQuest(30607) and quest30607:GetTargetNpcId(1) == self.npc_id then
				Quest30607:ReturnFirst()
			elseif HasQuest(30608) and quest30608:GetTargetNpcId(1) == self.npc_id then	
				Quest30608:ReturnFirst()
			end
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
AddNpcTable(Npc00021)
