Preload("Quest26001.lua")
Preload("Quest26002.lua")
Preload("Quest26003.lua")
Preload("Quest26004.lua")
Npc000146= {	
	npc_id = 146,				
	name = GetNpcName(146),							
}

function Npc000146:Talk(bProcess)
	local quest26001 = player:GetQuests():GetQuest(26001) 
	local quest26002 = player:GetQuests():GetQuest(26002)
	local quest26003 = player:GetQuests():GetQuest(26003)
	local quest26004 = player:GetQuests():GetQuest(26004)
	if (HasQuest(26001) and quest26001:GetEndNpcId() == self.npc_id) or
		(HasQuest(26002) and quest26002:GetEndNpcId() == self.npc_id) or
		(HasQuest(26003) and quest26003:GetEndNpcId() == self.npc_id) or
		(HasQuest(26004) and quest26004:GetEndNpcId() == self.npc_id) then
    NpcAsk({"这五百年来,再没出现孙悟空一样大闹天宫的英雄,也再没出现过紫霞仙子那么率直美丽的女子了。",
          "我在盘丝岭做了五百多年土地了,这里的一草一木我都在熟悉不过,想知道什么问我好了。",
          "五百年前,这里曾发生过一段凄美的爱情,如今已落得物是人非。",
          "话说似乎有个叫月光宝盒的东西,可带你回到五百年前,去见证那段刻骨铭心的感情。"})


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
    NpcAsk({"这五百年来,再没出现孙悟空一样大闹天宫的英雄,也再没出现过紫霞仙子那么率直美丽的女子了。",
          "我在盘丝岭做了五百多年土地了,这里的一草一木我都在熟悉不过,想知道什么问我好了。",
          "五百年前,这里曾发生过一段凄美的爱情,如今已落得物是人非。",
          "话说似乎有个叫月光宝盒的东西,可带你回到五百年前,去见证那段刻骨铭心的感情。"})

		SetAnswer(2, "离开")
		WaitAnswer(2)
	end
end

AddNpcTable(Npc000146)