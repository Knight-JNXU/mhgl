Preload("Quest26001.lua")
Preload("Quest26002.lua")
Preload("Quest26003.lua")
Preload("Quest26004.lua")
Npc000160= {	
	npc_id = 160,				
	name = GetNpcName(160),							
}

function Npc000160:Talk(bProcess)
	local quest26001 = player:GetQuests():GetQuest(26001) 
	local quest26002 = player:GetQuests():GetQuest(26002)
	local quest26003 = player:GetQuests():GetQuest(26003)
	local quest26004 = player:GetQuests():GetQuest(26004)
	if (HasQuest(26001) and quest26001:GetEndNpcId() == self.npc_id) or
		(HasQuest(26002) and quest26002:GetEndNpcId() == self.npc_id) or
		(HasQuest(26003) and quest26003:GetEndNpcId() == self.npc_id) or
		(HasQuest(26004) and quest26004:GetEndNpcId() == self.npc_id) then
    NpcAsk({"南瞻部洲地域辽阔,有居家百姓也有草莽野兽,有妖魔鬼怪也有佛道神仙。",
          "我本来以为我就是最大的猪了,可是我居然在这附近见到了一头比我还大的的猪,而且它身上散发的气势居然让我不敢接近,这是怎么回事。",
          "大唐境外那一家人看起来可不像凡夫俗子,是那个妖怪变得?",
          "前面不远就是高老庄"
          
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
    NpcAsk({"南瞻部洲地域辽阔,有居家百姓也有草莽野兽,有妖魔鬼怪也有佛道神仙。",
          "我本来以为我就是最大的猪了,可是我居然在这附近见到了一头比我还大的的猪,而且它身上散发的气势居然让我不敢接近,这是怎么回事。",
          "大唐境外那一家人看起来可不像凡夫俗子,是那个妖怪变得?",
          "前面不远就是高老庄"
          
          })
		SetAnswer(2, "离开")
		WaitAnswer(2)
	end
end

AddNpcTable(Npc000160)