Preload("Quest26001.lua")
Preload("Quest26002.lua")
Preload("Quest26003.lua")
Preload("Quest26004.lua")
Npc000108= {	
	npc_id = 108,				
	name = GetNpcName(108),							
}

function Npc000108:Talk(bProcess)
	local quest26001 = player:GetQuests():GetQuest(26001) 
	local quest26002 = player:GetQuests():GetQuest(26002)
	local quest26003 = player:GetQuests():GetQuest(26003)
	local quest26004 = player:GetQuests():GetQuest(26004)
	if (HasQuest(26001) and quest26001:GetEndNpcId() == self.npc_id) or
		(HasQuest(26002) and quest26002:GetEndNpcId() == self.npc_id) or
		(HasQuest(26003) and quest26003:GetEndNpcId() == self.npc_id) or
		(HasQuest(26004) and quest26004:GetEndNpcId() == self.npc_id) then
    NpcAsk({"大鼋不过是我的表面形象,我真实的身份是一个金鱼精",
          "好多天没有人从这里经过了,难道我今天的午饭是清水煮野菜?",
          "我长得美吗?若想养一只,那就去蓬莱仙岛碰碰运气吧",
          "谁能帮忙问问佛祖,我的阳寿究竟还有几年？"})
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
    NpcAsk({"大鼋不过是我的表面形象,我真实的身份是一个金鱼精",
          "好多天没有人从这里经过了,难道我今天的午饭是清水煮野菜?",
          "我长得美吗?若想养一只,那就去蓬莱仙岛碰碰运气吧",
          "谁能帮忙问问佛祖,我的阳寿究竟还有几年？"})
		SetAnswer(2, "离开")
		WaitAnswer(2)
	end
end

AddNpcTable(Npc000108)