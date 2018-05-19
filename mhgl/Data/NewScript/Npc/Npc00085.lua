
Preload("Quest26001.lua")
Preload("Quest26002.lua")
Preload("Quest26003.lua")
Preload("Quest26004.lua")
Preload("Quest69207.lua")
Npc00085 = {							-- 孙小红
	npc_id = 85,						-- NPC ID
	name = GetNpcName(85),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00085:Talk(bProcess)

	local quest26001 = player:GetQuests():GetQuest(26001) 
	local quest26002 = player:GetQuests():GetQuest(26002)
	local quest26003 = player:GetQuests():GetQuest(26003)
	local quest26004 = player:GetQuests():GetQuest(26004)
	local quest69207 = player:GetQuests():GetQuest(69207)
	if (HasQuest(26001) and quest26001:GetEndNpcId() == self.npc_id) or
		(HasQuest(26002) and quest26002:GetEndNpcId() == self.npc_id) or
		(HasQuest(26003) and quest26003:GetEndNpcId() == self.npc_id) or
		(HasQuest(26004) and quest26004:GetEndNpcId() == self.npc_id) then
    NpcAsk("宇宙万物,都由木、火、土、金、水五种基本物质的运动和变化构成。少侠如有兴趣,可到长安袁天罩之徒处了解五行之道。")
		if (HasQuest(26001) and quest26001:GetEndNpcId() == self.npc_id) or
			(HasQuest(26002) and quest26002:GetEndNpcId() == self.npc_id) or
			(HasQuest(26003) and quest26003:GetEndNpcId() == self.npc_id) or
			(HasQuest(26004) and quest26004:GetEndNpcId() == self.npc_id) then
			SetAnswer(1, "任务链")
		end
		if (HasQuest(69207) and quest69207:GetEndNpcId() == self.npc_id) then
		  SetAnswer(2, "官职任务")
		end
		SetAnswer(3, "离开")
		WaitAnswer(3)
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
	  elseif GetAnswer() == 2 then
		  Quest69207:Return()
		end
	else
    NpcAsk("宇宙万物,都由木、火、土、金、水五种基本物质的运动和变化构成。少侠如有兴趣,可到长安袁天罩之徒处了解五行之道。")
		SetAnswer(2, "离开")
		WaitAnswer(2)
	end
end





-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00085)
