Preload("Quest26001.lua")
Preload("Quest26002.lua")
Preload("Quest26003.lua")
Preload("Quest26004.lua")
Npc000133= {	
	npc_id = 133,				
	name = GetNpcName(133),							
}

function Npc000133:Talk(bProcess)
	local quest26001 = player:GetQuests():GetQuest(26001) 
	local quest26002 = player:GetQuests():GetQuest(26002)
	local quest26003 = player:GetQuests():GetQuest(26003)
	local quest26004 = player:GetQuests():GetQuest(26004)
	if (HasQuest(26001) and quest26001:GetEndNpcId() == self.npc_id) or
		(HasQuest(26002) and quest26002:GetEndNpcId() == self.npc_id) or
		(HasQuest(26003) and quest26003:GetEndNpcId() == self.npc_id) or
		(HasQuest(26004) and quest26004:GetEndNpcId() == self.npc_id) then
    NpcAsk({"知道我们老大是谁么？大名鼎鼎的圣婴大王是也！怎么样,怕了吧",
          "流沙河畔地势低洼,水气丰沛,真是云遮雾罩神仙境。",
          "我就是翠云山巡山小队长,你也是来求雨的吧?供奉带了没有？",
          "我家夫人最近出去修炼了,有什么事先告诉我吧。",
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
    NpcAsk({"知道我们老大是谁么？大名鼎鼎的圣婴大王是也！怎么样,怕了吧",
          "流沙河畔地势低洼,水气丰沛,真是云遮雾罩神仙境。",
          "我就是翠云山巡山小队长,你也是来求雨的吧?供奉带了没有？",
          "我家夫人最近出去修炼了,有什么事先告诉我吧。",
          })
		SetAnswer(2, "离开")
		WaitAnswer(2)
	end
end

AddNpcTable(Npc000133)