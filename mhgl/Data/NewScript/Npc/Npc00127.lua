Preload("Quest26001.lua")
Preload("Quest26002.lua")
Preload("Quest26003.lua")
Preload("Quest26004.lua")
Npc000127= {	
	npc_id = 127,				
	name = GetNpcName(127),							
}

function Npc000127:Talk(bProcess)
	local quest26001 = player:GetQuests():GetQuest(26001) 
	local quest26002 = player:GetQuests():GetQuest(26002)
	local quest26003 = player:GetQuests():GetQuest(26003)
	local quest26004 = player:GetQuests():GetQuest(26004)
	if (HasQuest(26001) and quest26001:GetEndNpcId() == self.npc_id) or
		(HasQuest(26002) and quest26002:GetEndNpcId() == self.npc_id) or
		(HasQuest(26003) and quest26003:GetEndNpcId() == self.npc_id) or
		(HasQuest(26004) and quest26004:GetEndNpcId() == self.npc_id) then
    NpcAsk({"高老庄附近有头大野猪,很是厉害,我几次都没捉住它。",
          "方圆几百里少有人家,倒是常有野兽和一些怪物出没。",
          "金秋是打猎的好季节,前几天看到头白色的梅花鹿,可惜没带武器,只能眼看着它向着高老庄一带跑走。",
          "不想当裁缝的铁匠不是好猎户。",
          "我不仅善于捕捉猎物,我还擅长驯养动物呢~"})
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
    NpcAsk({"高老庄附近有头大野猪,很是厉害,我几次都没捉住它。",
          "方圆几百里少有人家,倒是常有野兽和一些怪物出没。",
          "金秋是打猎的好季节,前几天看到头白色的梅花鹿,可惜没带武器,只能眼看着它向着高老庄一带跑走。",
          "不想当裁缝的铁匠不是好猎户。",
          "我不仅善于捕捉猎物,我还擅长驯养动物呢~"})
		SetAnswer(2, "离开")
		WaitAnswer(2)
	end
end

AddNpcTable(Npc000127)