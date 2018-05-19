Preload("Quest26001.lua")
Preload("Quest26002.lua")
Preload("Quest26003.lua")
Preload("Quest26004.lua")
Npc000153= {	
	npc_id = 153,				
	name = GetNpcName(153),							
}

function Npc000153:Talk(bProcess)
	local quest26001 = player:GetQuests():GetQuest(26001) 
	local quest26002 = player:GetQuests():GetQuest(26002)
	local quest26003 = player:GetQuests():GetQuest(26003)
	local quest26004 = player:GetQuests():GetQuest(26004)
	if (HasQuest(26001) and quest26001:GetEndNpcId() == self.npc_id) or
		(HasQuest(26002) and quest26002:GetEndNpcId() == self.npc_id) or
		(HasQuest(26003) and quest26003:GetEndNpcId() == self.npc_id) or
		(HasQuest(26004) and quest26004:GetEndNpcId() == self.npc_id) then
    NpcAsk({"我已经心有所属,怎么可能再去喜欢别人呢？",
          "天下最远的距离,不是相隔天涯,而是我就在他身边,他却不知道……",
          "为什么？为什么我总感觉冥冥之中有几个声音在耳边,而那声音又那么象我自己？",
          "有些人一辈子都在骗人,而有些人用一辈子去骗一个人！",
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
    NpcAsk({"我已经心有所属,怎么可能再去喜欢别人呢？",
          "天下最远的距离,不是相隔天涯,而是我就在他身边,他却不知道……",
          "为什么？为什么我总感觉冥冥之中有几个声音在耳边,而那声音又那么象我自己？",
          "有些人一辈子都在骗人,而有些人用一辈子去骗一个人！",
          })
		SetAnswer(2, "离开")
		WaitAnswer(2)
	end
end

AddNpcTable(Npc000153)