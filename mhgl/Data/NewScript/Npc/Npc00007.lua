Preload("Quest10026.lua")
Preload("Quest10027.lua")
Preload("Quest10028.lua")
Preload("Quest10029.lua")
Preload("Quest10030.lua")
Preload("Quest10031.lua")
Npc00007 = {							
	npc_id = 7,					
	name = GetNpcName(7),	
	quests = { Quest10004,Quest10005}	
}


function Npc00007:Talk(bProcess)
	local quest_ids = {10026,10027,10028}
	NpcAsk( { "我的事情太多,忙不过来,请优先选择一件你最想做的事情吧(如果你想要的事情不在列表中,请选择我要做其他事情)" } )
		if HasQuest(quest_ids) then
			SetAnswer(1, "主线任务")
		end
		SetAnswer(2, "离开")
		WaitAnswer(2)
		if GetAnswer() == 1 then
			if HasQuest(10026) then
				if Quest10026:Return() then
					Quest10027:Take()
				end

		elseif HasQuest(10027) then
		  if Quest10027:Return() then
			  Quest10028:Take()
      end


		elseif HasQuest(10028) then
		  if Quest10028:Return() then
			  Quest10029:Take()
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

	
	
	
	
	
	
	
	
	
AddNpcTable(Npc00007)
