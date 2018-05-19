Preload("Quest26001.lua")
Preload("Quest26002.lua")
Preload("Quest26003.lua")
Preload("Quest26004.lua")
Npc00096= {	
	npc_id = 096,				
	name = GetNpcName(096),							
}

function Npc00096:Talk(bProcess)
	local quest26001 = player:GetQuests():GetQuest(26001) 
	local quest26002 = player:GetQuests():GetQuest(26002)
	local quest26003 = player:GetQuests():GetQuest(26003)
	local quest26004 = player:GetQuests():GetQuest(26004)
	if (HasQuest(26001) and quest26001:GetEndNpcId() == self.npc_id) or
		(HasQuest(26002) and quest26002:GetEndNpcId() == self.npc_id) or
		(HasQuest(26003) and quest26003:GetEndNpcId() == self.npc_id) or
		(HasQuest(26004) and quest26004:GetEndNpcId() == self.npc_id) then
    NpcAsk({"刚刚看青琉璃姑娘跑了上去,好象还受了点伤。",
          "翻天怪真可恶,居然敢打伤可爱的青琉璃姑娘,我一定要去教训教训他",
          "北俱芦洲是个探险的好地方,上面的凤巢和边上的龙窟都是升级练功的好去处。"})
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
    NpcAsk({"刚刚看青琉璃姑娘跑了上去,好象还受了点伤。",
          "翻天怪真可恶,居然敢打伤可爱的青琉璃姑娘,我一定要去教训教训他",
          "北俱芦洲是个探险的好地方,上面的凤巢和边上的龙窟都是升级练功的好去处。"})
		SetAnswer(2, "离开")
		WaitAnswer(2)
	end
end

AddNpcTable(Npc00096)