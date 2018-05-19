Preload("Quest26001.lua")
Preload("Quest26002.lua")
Preload("Quest26003.lua")
Preload("Quest26004.lua")
Npc000138= {	
	npc_id = 138,				
	name = GetNpcName(138),							
}

function Npc000138:Talk(bProcess)
	local quest26001 = player:GetQuests():GetQuest(26001) 
	local quest26002 = player:GetQuests():GetQuest(26002)
	local quest26003 = player:GetQuests():GetQuest(26003)
	local quest26004 = player:GetQuests():GetQuest(26004)
	if (HasQuest(26001) and quest26001:GetEndNpcId() == self.npc_id) or
		(HasQuest(26002) and quest26002:GetEndNpcId() == self.npc_id) or
		(HasQuest(26003) and quest26003:GetEndNpcId() == self.npc_id) or
		(HasQuest(26004) and quest26004:GetEndNpcId() == self.npc_id) then
    NpcAsk({"咳~咳~~别看我家老太婆今年事已高,当年可是号称境外一枝花呢！",
          "再往西走点就是高老庄啦,你们打从那里来,有要往哪里去？",
          "我家老太婆我家儿媳妇去了,怎么两个人去了都不回来？",
          "我家老太婆和儿媳妇别是碰上什么野兽或者强盗吧,咳,看我这乌鸦嘴说的！该打！",
          
          
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
    NpcAsk({"咳~咳~~别看我家老太婆今年事已高,当年可是号称境外一枝花呢！",
          "再往西走点就是高老庄啦,你们打从那里来,有要往哪里去？",
          "我家老太婆我家儿媳妇去了,怎么两个人去了都不回来？",
          "我家老太婆和儿媳妇别是碰上什么野兽或者强盗吧,咳,看我这乌鸦嘴说的！该打！",
          
          
          })
		SetAnswer(2, "离开")
		WaitAnswer(2)
	end
end

AddNpcTable(Npc000138)