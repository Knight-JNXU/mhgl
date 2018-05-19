Preload("Quest10003.lua")
Preload("Quest10604.lua")
Preload("Quest10605.lua")
Preload("Quest10002.lua")

Npc00583 = {							
	npc_id = 583,					
	name = GetNpcName(583),	
	quests = { Quest10002}	
}


function Npc00583:Talk(bProcess)
  local quest_ids = {10003,10604,10605}
	
	if HasQuest(10002) then
		NpcAsk( { "你又跑那里去了，怎么老不来看我啊？","宠物仙子说你迟早要离开这里的，还说你肯定会有一番作为的。","宠物仙子说江湖中尔虞我诈，人心难测，我还是喜欢这里平平淡淡的生活，可不想参加什么比武大会。"} )
		SetAnswer(1, "主线任务")
		SetAnswer(2, "离开")
		WaitAnswer(2)
		if GetAnswer() == 1 then
			Quest10002:Return()
		end
	elseif HasQuest(quest_ids)  then
		NpcAsk( "~~~" )
		SetAnswer(1, "主线任务")
		SetAnswer(2, "离开")
		WaitAnswer(2)
		if GetAnswer() == 1 then
			if HasQuest(10003) then
				Quest10003:Return()
			elseif HasQuest(10604) then
					if Quest10604:Return() then
						Quest10605:Take()
					end
			elseif HasQuest(10605) then
				Quest10605:Return()
			end
		end
	else	
		NpcAsk( "~~~" )
		SetAnswer(1,"离开")
		WaitAnswer(1)
	end
end--]]
	  


AddNpcTable(Npc00583)
