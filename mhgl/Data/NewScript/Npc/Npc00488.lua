Preload("Quest26001.lua")
Preload("Quest26002.lua")
Preload("Quest26003.lua")
Preload("Quest26004.lua")
Npc000488= {	
	npc_id = 488,				
	name = GetNpcName(488),							
}

function Npc000488:Talk(bProcess)
	local quest26001 = player:GetQuests():GetQuest(26001) 
	local quest26002 = player:GetQuests():GetQuest(26002)
	local quest26003 = player:GetQuests():GetQuest(26003)
	local quest26004 = player:GetQuests():GetQuest(26004)
	if (HasQuest(26001) and quest26001:GetEndNpcId() == self.npc_id) or
		(HasQuest(26002) and quest26002:GetEndNpcId() == self.npc_id) or
		(HasQuest(26003) and quest26003:GetEndNpcId() == self.npc_id) or
		(HasQuest(26004) and quest26004:GetEndNpcId() == self.npc_id) then
    NpcAsk({"整天就是在这里看门,真是没什么意思,不过真让我休息的话我也还是找个待着睡觉",
          "这太尉不过是个有名无实的闲职罢了！",
          "有志青年应该投奔我龙宫,及早某个好前程啊。",
          "千年王八万年龟,我今年已经一万零八岁了。",
          "学游泳,找我就对了,价格实惠,包学包会。"})
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
    NpcAsk({"整天就是在这里看门,真是没什么意思,不过真让我休息的话我也还是找个待着睡觉",
          "这太尉不过是个有名无实的闲职罢了！",
          "有志青年应该投奔我龙宫,及早某个好前程啊。",
          "千年王八万年龟,我今年已经一万零八岁了。",
          "学游泳,找我就对了,价格实惠,包学包会。"})
    SetAnswer(1,"离开")
    WaitAnswer(1)
	end
end

AddNpcTable(Npc000488)