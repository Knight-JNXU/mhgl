Preload("Quest10000.lua")
Preload("Quest10001.lua")
Preload("Quest10002.lua")
Preload("Quest10003.lua")
Preload("Quest10004.lua")
Preload("Quest10605.lua")
Preload("Quest10606.lua")
Preload("Quest23000.lua")
Npc00001 = {							
	npc_id = 1,					--义父
	name = GetNpcName(1),	
	quests = { Quest10000, Quest10001,Quest10002,Quest10003,Quest10004,Quest10605,Quest10606}
}
function Npc00001:Talk(bProcess)	
	local quest_ids = {10000,10001,10002,10003,10004,10605,10606}
	local flag435 = player:GetQuests():GetFlag(435)
	local quest23000 = player:GetQuests():GetQuest(23000)
	if HasQuest(quest_ids) or  quest23000 or not player:GetItems():HasItem(51089) or not player:GetItems():HasItem(71006) then
    NpcAsk("欢迎来到天天西游,祝你游戏愉快,\r\#A小提示：前面的#R戏班老板#A，常在江湖行走，据说可以#R带你去到任何地方！")
    if HasQuest(quest_ids) then	
      SetAnswer(1, "主线任务")
    end
	  SetAnswer(2, "离开")
	  WaitAnswer(2)	
		if GetAnswer() == 1 then
			if HasQuest(10000) then
				if Quest10000:Return() then
					Quest10001:Take()
				end
			elseif HasQuest(10001) then
				if Quest10001:Return() then
					Quest10002:Take()
				end
			elseif HasQuest(10002) then
				if Quest10002:Return() then
					Quest10003:Take()
				end
			elseif HasQuest(10003) then
				if Quest10003:Return() then
					Quest10004:Take()
				end	
			elseif HasQuest(10004) then
				Quest10004:Return()
			elseif HasQuest(10605) then
				if Quest10605:Return() then
					Quest10606:Take()
				end
			elseif HasQuest(10606) then
				Quest10606:Return()
			end
	  else
		NpcAsk("少侠后会有期！")
		SetAnswer(1, "再见")
		WaitAnswer(1)
	end
  end
end

function RandomLine(MaxLine)
    local r = math.random(3,MaxLine)
	local t = ""
    for i=1, r do
		t = tostring(t)..tostring("\r.")
	end
	return t
end
	
  


































  
AddNpcTable(Npc00001)

--[[           


1=龙宫
3=地府
4=大唐官府
10=化生寺
11=普陀山









--]]