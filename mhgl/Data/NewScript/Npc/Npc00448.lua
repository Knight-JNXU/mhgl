Preload("Quest10029.lua")
Preload("Quest10030.lua")
Npc00448 = {							
	npc_id = 448,					
	name = GetNpcName(448),	
	quests = { Quest10004,Quest10005}	
}


function Npc00448:Talk(bProcess)
	local quest_ids = {10029,10030}
	NpcAsk( { "钱财本身身外之物,能用来济世行善是最好不过" } )
		if HasQuest(quest_ids) then
			SetAnswer(1, "主线任务")
		end
		SetAnswer(2, "离开")
		WaitAnswer(2)
		if GetAnswer() == 1 then
			if HasQuest(10029) then
				if Quest10029:Return() then
					Quest10030:Take()
			  end
		elseif HasQuest(10030) then
		  if Quest10030:Return() then
			end
		end
	end
end
	
	
	
	
	
	
	
	
	
AddNpcTable(Npc00448)
