Preload("Quest26001.lua")
Preload("Quest26002.lua")
Preload("Quest26003.lua")
Preload("Quest26004.lua")
Npc00101= {	
	npc_id = 0101,				
	name = GetNpcName(0101),							
}

function Npc00101:Talk(bProcess)
	local quest26001 = player:GetQuests():GetQuest(26001) 
	local quest26002 = player:GetQuests():GetQuest(26002)
	local quest26003 = player:GetQuests():GetQuest(26003)
	local quest26004 = player:GetQuests():GetQuest(26004)
	if (HasQuest(26001) and quest26001:GetEndNpcId() == self.npc_id) or
		(HasQuest(26002) and quest26002:GetEndNpcId() == self.npc_id) or
		(HasQuest(26003) and quest26003:GetEndNpcId() == self.npc_id) or
		(HasQuest(26004) and quest26004:GetEndNpcId() == self.npc_id) then
    NpcAsk({"这里的驿站老板可以传送回长安,土地公共可以送你去花果山,地遁鬼会送你到西牛贺洲,龙窟门口的召唤兽医生可以治疗你的召唤兽。",
          "我身后就是传送中的----凤巢,里面的怪物比较凶猛,等级不到60进去的话比较危险,最好多找几个同伴一起进去探险。",
          "北风那个吹~哎~哎~哎,雪花那个飘~嗷~嗷~嗷……"})
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
    NpcAsk({"这里的驿站老板可以传送回长安,土地公共可以送你去花果山,地遁鬼会送你到西牛贺洲,龙窟门口的召唤兽医生可以治疗你的召唤兽。",
          "我身后就是传送中的----凤巢,里面的怪物比较凶猛,等级不到60进去的话比较危险,最好多找几个同伴一起进去探险。",
          "北风那个吹~哎~哎~哎,雪花那个飘~嗷~嗷~嗷……"})
		SetAnswer(2, "离开")
		WaitAnswer(2)
	end
end

AddNpcTable(Npc00101)