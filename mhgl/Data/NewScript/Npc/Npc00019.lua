Preload("Quest10023.lua")
Preload("Quest10024.lua")
Preload("Quest10025.lua")
Npc00019 = {							
	npc_id = 19,					
	name = GetNpcName(19),	
	quests = { Quest10004,Quest10005}	
}


function Npc00019:Talk(bProcess)
	local quest_ids = {10023,10024}
	NpcAsk({"听到过京城的人说,城里到处是亭台楼阁,红砖绿瓦,连皇上都住在那儿,真想去见识一下。"})
		if HasQuest(quest_ids) then
			SetAnswer(1, "主线任务")
		end
		SetAnswer(2, "离开")
		WaitAnswer(2)
		if GetAnswer() == 1 then
			if HasQuest(10023) then
				if Quest10023:Return() then
					Quest10024:Take()
				end
			elseif HasQuest(10024) then
				if Quest10024:Return() then
					Quest10025:Take()
				end
			end
  else
    NpcAsk("少侠后会有期！")
    SetAnswer(1, "再见")
    WaitAnswer(1)
  end
end

function RandomLine(MaxLine)
    local r = math.random(1,MaxLine)
	local t = ""
    for i=1, r do
		t = tostring(t)..tostring("\r.")
	end
	return t
end

	
	
	
	
	
	
	
	
	
AddNpcTable(Npc00019)
