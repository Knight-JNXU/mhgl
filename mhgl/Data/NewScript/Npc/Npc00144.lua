Preload("Quest26001.lua")
Preload("Quest26002.lua")
Preload("Quest26003.lua")
Preload("Quest26004.lua")
Npc000144= {	
	npc_id = 144,				
	name = GetNpcName(144),							
}

function Npc000144:Talk(bProcess)
	local quest26001 = player:GetQuests():GetQuest(26001) 
	local quest26002 = player:GetQuests():GetQuest(26002)
	local quest26003 = player:GetQuests():GetQuest(26003)
	local quest26004 = player:GetQuests():GetQuest(26004)
	if (HasQuest(26001) and quest26001:GetEndNpcId() == self.npc_id) or
		(HasQuest(26002) and quest26002:GetEndNpcId() == self.npc_id) or
		(HasQuest(26003) and quest26003:GetEndNpcId() == self.npc_id) or
		(HasQuest(26004) and quest26004:GetEndNpcId() == self.npc_id) then
    NpcAsk({"盘丝岭就在附近,听说洞主是两位美艳的女妖。",
          "少侠是不是看我有点眼熟？没错,东海海底那个是我的双胞胎兄弟。",
          "有人想跟我练习蛤蟆功么？这才是真正的飞升技能",
          "看什么看,再看我就吃了你,我现在才吃饱,不要打搅我休息。",
          
          
          })
		if (HasQuest(26001) and quest26001:GetEndNpcId() == self.npc_id) or
			(HasQuest(26002) and quest26002:GetEndNpcId() == self.npc_id) or
			(HasQuest(26003) and quest26003:GetEndNpcId() == self.npc_id) or
			(HasQuest(26004) and quest26004:GetEndNpcId() == self.npc_id) then
			SetAnswer(1, "任务链")
		end
		SetAnswer(2, "离开")
		WaitAnswer(2)
		if GetAnswer() == 1 then
			if HasQuest(26001) then
				Quest26001:Return()
			elseif HasQuest(26002) then
				Quest26002:Return()
			elseif HasQuest(26003) then
				Quest26003:Return()
			elseif HasQuest(26004) then
				Quest26004:Return()
			end
		end
	else
    NpcAsk({"盘丝岭就在附近,听说洞主是两位美艳的女妖。",
          "少侠是不是看我有点眼熟？没错,东海海底那个是我的双胞胎兄弟。",
          "有人想跟我练习蛤蟆功么？这才是真正的飞升技能",
          "看什么看,再看我就吃了你,我现在才吃饱,不要打搅我休息。",
          
          
          })
		SetAnswer(2, "离开")
		WaitAnswer(2)
	end
end

AddNpcTable(Npc000144)