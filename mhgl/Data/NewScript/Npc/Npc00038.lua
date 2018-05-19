Preload("Quest10029.lua")
Preload("Quest10030.lua")
Preload("Quest10031.lua")
Npc00038 = {							
	npc_id = 38,					
	name = GetNpcName(38),	
	quests = { Quest10004,Quest10005}	
}


function Npc00038:Talk(bProcess)
	local quest_ids = {10030}
	NpcAsk( { "我的事情太多,忙不过来,请优先选择一件你最想做的事情吧(如果你想要的事情不在列表中,请选择我要做其他事情)" } )
	if HasQuest(quest_ids) then
		SetAnswer(1, "主线任务")
	end
	SetAnswer(2, "离开")
	WaitAnswer(2)
	if GetAnswer() == 1 then
	  if IsProcess() then
	    NpcSay("吼吼吼~~~~~")
	    player:EncounterBattle(38)
	  end
	end
end
	  

	
	
	
	
	
	
	
AddNpcTable(Npc00038)
