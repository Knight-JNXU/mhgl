Preload("Quest26001.lua")
Preload("Quest26002.lua")
Preload("Quest26003.lua")
Preload("Quest26004.lua")
Npc000131= {	
	npc_id = 131,				
	name = GetNpcName(131),							
}

function Npc000131:Talk(bProcess)
	local quest26001 = player:GetQuests():GetQuest(26001) 
	local quest26002 = player:GetQuests():GetQuest(26002)
	local quest26003 = player:GetQuests():GetQuest(26003)
	local quest26004 = player:GetQuests():GetQuest(26004)
	if (HasQuest(26001) and quest26001:GetEndNpcId() == self.npc_id) or
		(HasQuest(26002) and quest26002:GetEndNpcId() == self.npc_id) or
		(HasQuest(26003) and quest26003:GetEndNpcId() == self.npc_id) or
		(HasQuest(26004) and quest26004:GetEndNpcId() == self.npc_id) then
    NpcAsk({"我只希望冥冥中的那个声音说的都是真的:它告诉我我总有一天能脱离苦海,叫我耐心等待,可是到底是什么时候才能解脱呢？",
          "人生在世孰能无过？不知何时才能洗清这打破琉璃盏的罪过。",
          "与内心的苦痛争扎相比,流沙河边的寂寞又算的了什么？",
          "我若说我不是妖怪,而是天宫的卷帘大将,你会不会相信？",
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
    NpcAsk({"我只希望冥冥中的那个声音说的都是真的:它告诉我我总有一天能脱离苦海,叫我耐心等待,可是到底是什么时候才能解脱呢？",
          "人生在世孰能无过？不知何时才能洗清这打破琉璃盏的罪过。",
          "与内心的苦痛争扎相比,流沙河边的寂寞又算的了什么？",
          "我若说我不是妖怪,而是天宫的卷帘大将,你会不会相信？",
          })
		SetAnswer(2, "离开")
		WaitAnswer(2)
	end
end

AddNpcTable(Npc000131)