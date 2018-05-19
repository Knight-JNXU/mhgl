Preload("Quest10010.lua")
Preload("Quest10011.lua")
Preload("Quest10012.lua")

Npc00035= {	
	npc_id = 35,				
	name = GetNpcName(35),		
	quests = { Quest10010, Quest10011, Quest10012 }						
}

function Npc00035:Talk(bProcess)
	local quest_ids = {10010,10011,10012}
	NpcAsk( "我发明了个传送器，要不要试一下让我把你传送到建邺城？"..RandomLine(10))	
	if HasQuest(quest_ids) then
		SetAnswer(1, "主线任务")
	end
	SetAnswer(2, "传送到建邺城")
	SetAnswer(3, "离开")
	WaitAnswer(3)
	if GetAnswer() == 1 then
		if HasQuest(10010) then
			if Quest10010:Return() then
				Quest10011:Take()
			end
		elseif HasQuest(10011) then
			if Quest10011:Return() then
				Quest10012:Take()
			end
		elseif HasQuest(10012) then 
			Quest10012:Return()
		end
	elseif 	GetAnswer() == 2 then
		if bProcess then
			player:JumpMap(1, 138, 30)
		end
  else
    NpcAsk("少侠后会有期！"..RandomLine(10))
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

AddNpcTable(Npc00035)