Preload("Quest10006.lua")
Preload("Quest10010.lua")
Preload("Quest30605.lua")
Preload("Quest30606.lua")
Preload("Quest30607.lua")
Preload("Quest30608.lua")
Preload("Quest55002.lua")
Preload("Quest20002.lua")
Preload("Quest20006.lua")
Npc000449 = {							
	npc_id = 449,					
	name = GetNpcName(449),	
	quests = { Quest10006,Quest10010}	
}


function Npc000449:Talk(bProcess)
	local quest30605 = player:GetQuests():GetQuest(30605) 
	local quest30606 = player:GetQuests():GetQuest(30606)
	local quest30607 = player:GetQuests():GetQuest(30607)
	local quest30608 = player:GetQuests():GetQuest(30608)
	local quest55002 = player:GetQuests():GetQuest(55002)
	local quest20002 = HasQuest(20002) and player:GetQuests():GetFlag(20002)==3
	local quest_ids = {10006,10010}
		NpcAsk( { "本店虽小，货物却全是手工所制，款式新颖，选料上乘，价格公道，童叟无欺，不知客官想买点什么？",
		"别看老身年纪一大把，若论针线活儿，还没有几个比得上我呢！可惜我那个孙女就是不肯学……" })
		if  HasQuest(quest_ids) then
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
		SetAnswer(3, "买卖装备")
		if quest20002 then
			SetAnswer(5,"一块红缎子")
		end
		SetAnswer(6, "离开")
		WaitAnswer(6)
		if GetAnswer() == 1 then
	
	
			if HasQuest(10006) then
				if Quest10006:Return() then
					Quest10010:Take()
				end
			elseif HasQuest(10010) then
				Quest10010:Return()
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
		elseif GetAnswer() == 5 then
			Quest20002:Return()
		end
end

AddNpcTable(Npc000449)
