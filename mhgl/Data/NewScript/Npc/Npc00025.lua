Preload("Quest10022.lua")
Preload("Quest10023.lua")
Preload("Quest10024.lua")
Preload("Quest10025.lua")
Preload("Quest10026.lua")
Preload("Quest10027.lua")
Npc00025 = {							
	npc_id = 25,					
	name = GetNpcName(25),	
	quests = { Quest10004,Quest10005}	
}


function Npc00025:Talk(bProcess)
	local quest_ids = {10022,10023,10025,10026}
	NpcAsk( { "驱鬼除妖测字算命啦，前算五百年，后算五百年。" } )
		if HasQuest(quest_ids) then
			SetAnswer(1, "主线任务")
		end
		SetAnswer(2, "离开")
		WaitAnswer(2)
		if GetAnswer() == 1 then
			if HasQuest(10022) then
				if Quest10022:Return() then
					Quest10023:Take()
				end
		elseif HasQuest(10023) then
			if Quest10023:Return() then
				Quest10024:Take()
		  end
		elseif HasQuest(10025) then
			if Quest10025:Return() then
				Quest10026:Take()
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
	
	
	
	
	
	
	
	
	
AddNpcTable(Npc00025)
