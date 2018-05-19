Preload("Quest10227.lua")
Preload("Quest10300.lua")
Preload("Quest10301.lua")
Preload("Quest30400.lua")

Npc000201 = {							
	npc_id = 201,					
	name = GetNpcName(201),	
	quests = { Quest10227, Quest10300, Quest10301, Quest30400}	
}


function Npc000201:Talk(bProcess)
	local quest_ids = {10227,10300,10301}
	if HasQuest(quest_ids) then
		NpcAsk( { "现在做鬼的也不安分,老是有出去闲逛的,你能帮我抓他们回来吗?" } )
		SetAnswer(1, "主线任务")
		SetAnswer(2, "好的,我帮你。")
		SetAnswer(3, "不,我没有空")
		WaitAnswer(3)
		if GetAnswer() == 1 then
			if HasQuest(10227) then
				if Quest10227:Return() then
					Quest10300:Take()
				end
			elseif HasQuest(10300) then
				if Quest10300:Return() then 
					Quest10301:Take()
				end 
			else
				Quest10301:Return()
			end
		elseif GetAnswer() == 2  then
    if not bProcess then
			player:AntiHack()
	  end
			end

	else	
		NpcAsk( { "现在做鬼的也不安分,老是有出去闲逛的,你能帮我抓他们回来吗?" } )
		SetAnswer(1, "好的,我帮你。")
		SetAnswer(2, "不,我没有空")
		WaitAnswer(2)
		if GetAnswer() == 1 then
    if not bProcess then
			player:AntiHack()
	  end
				Quest30400:Take()
			end
		end
	end


AddNpcTable(Npc000201)
