Preload("Quest10014.lua")
Preload("Quest10021.lua")

Npc00441 = {							
	npc_id = 441,					
	name = GetNpcName(441),	
	quests = { Quest10014 , Quest10021}	
}


function Npc00441:Talk(bProcess)
	print("NPC Talk() Start")
	local quest_ids = {10014,10021}
	NpcAsk("这位客官,有什么能帮到你呢？")
	if HasQuest(quest_ids) then
		SetAnswer(1, "主线任务")
	end
	SetAnswer(2,"购买")
	SetAnswer(3, "离开")
	WaitAnswer(3)
	if GetAnswer() == 1 then
		if HasQuest(10014) then
			if Quest10014:Return() then
	  		Quest10014:Return()
				Quest10021:Take()
			end
		elseif HasQuest(10021) then 
			Quest10021:Return()
		end
	elseif GetAnswer() == 2 then
	  script:OpenInterface("shop", 8);
	end
end










AddNpcTable(Npc00441)
