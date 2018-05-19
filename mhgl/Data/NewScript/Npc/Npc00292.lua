Preload("Inst00003.lua")
Preload("Inst00004.lua")
Npc00093 = {							-- 薛穿心
	npc_id = 93,						-- NPC ID
	name = GetNpcName(93),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00093:Talk(bProcess)
	NpcAsk("需要回家吗？")
	SetAnswer(1,"送我回家")
	SetAnswer(2,"离开")
	WaitAnswer(2)
	if GetAnswer() == 1 then
		if bProcess then
			script:SetSaying(true)
			local flag2000 = player:GetQuests():GetFlag(2000)
			local HusbandId = player:GetRelationSystem():GetHusbandId()
			local WifeId = player:GetRelationSystem():GetWifeId()
			local MarriageId = player:GetRelationSystem():GetMarriageId()
			--local flag2100 = player:GetQuests():GetFlag(2100)
			if flag2000 == 0 --[[and flag2100 == 1 ]]and (HusbandId == 0 or WifeId == 0) then
				NpcSay("你都没有房屋，我把你送哪去啊？")
				return
			end
			
			if MarriageId ~= 0 then
				local allow, err = CanEnterInstance(Inst00003)
				if allow then
					ShowMessage("进入民居")
					EnterInstance(Inst00003, 58000, 22, 68)
				else
					NpcSay(string.format("%s，不能进入民居。", err))
				end
			else
				local allow1, err1 = CanEnterInstance(Inst00004)
				if allow1 then
					ShowMessage("进入民居")
					EnterInstance(Inst00004, 58000, 22, 68)
				else
					NpcSay(string.format("%s，不能进入民居。", err1))
				end
			end
		end
	end
end
-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00093)
