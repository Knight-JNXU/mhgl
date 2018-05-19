Preload("Quest26001.lua")
Preload("Quest26002.lua")
Preload("Quest26003.lua")
Preload("Quest26004.lua")
Npc000147= {	
	npc_id = 147,				
	name = GetNpcName(147),							
}

function Npc000147:Talk(bProcess)
	local quest26001 = player:GetQuests():GetQuest(26001) 
	local quest26002 = player:GetQuests():GetQuest(26002)
	local quest26003 = player:GetQuests():GetQuest(26003)
	local quest26004 = player:GetQuests():GetQuest(26004)
	if (HasQuest(26001) and quest26001:GetEndNpcId() == self.npc_id) or
		(HasQuest(26002) and quest26002:GetEndNpcId() == self.npc_id) or
		(HasQuest(26003) and quest26003:GetEndNpcId() == self.npc_id) or
		(HasQuest(26004) and quest26004:GetEndNpcId() == self.npc_id) then
    NpcAsk({"我家相公被老虎叼走了,这位客观,可否带我一程走出这荒山,小女子一定不会忘了您的大恩大德。",
          "你,你是什么人,为何总盯着我看?",
          "少侠饿了吗?我这篮子里还有些吃的,请拿去享用!",
          "呜……呜……呜,我的命好苦啊。"})

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
    NpcAsk({"我家相公被老虎叼走了,这位客观,可否带我一程走出这荒山,小女子一定不会忘了您的大恩大德。",
          "你,你是什么人,为何总盯着我看?",
          "少侠饿了吗?我这篮子里还有些吃的,请拿去享用!",
          "呜……呜……呜,我的命好苦啊。"})
		SetAnswer(2, "离开")
		WaitAnswer(2)

	end
end

AddNpcTable(Npc000147)