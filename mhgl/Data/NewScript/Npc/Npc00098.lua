Preload("Quest26001.lua")
Preload("Quest26002.lua")
Preload("Quest26003.lua")
Preload("Quest26004.lua")
Npc00098= {	
	npc_id = 098,				
	name = GetNpcName(098),							
}

function Npc00098:Talk(bProcess)
	local quest26001 = player:GetQuests():GetQuest(26001) 
	local quest26002 = player:GetQuests():GetQuest(26002)
	local quest26003 = player:GetQuests():GetQuest(26003)
	local quest26004 = player:GetQuests():GetQuest(26004)
	if (HasQuest(26001) and quest26001:GetEndNpcId() == self.npc_id) or
		(HasQuest(26002) and quest26002:GetEndNpcId() == self.npc_id) or
		(HasQuest(26003) and quest26003:GetEndNpcId() == self.npc_id) or
		(HasQuest(26004) and quest26004:GetEndNpcId() == self.npc_id) then
    NpcAsk({"好久没出去走动了,等会去龙窟找龙神聊天去。",
          "不到黄河不知河之远,不来北俱不知天之寒。真冷啊！",
          "哼,那小丫头也不掂一下自己有几斤几两就想来收服我,这下知道我的厉害了吧,哈哈哈哈"})
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
    NpcAsk({"好久没出去走动了,等会去龙窟找龙神聊天去。",
          "不到黄河不知河之远,不来北俱不知天之寒。真冷啊！",
          "哼,那小丫头也不掂一下自己有几斤几两就想来收服我,这下知道我的厉害了吧,哈哈哈哈"})
		SetAnswer(2, "离开")
		WaitAnswer(2)
	end
end

AddNpcTable(Npc00098)