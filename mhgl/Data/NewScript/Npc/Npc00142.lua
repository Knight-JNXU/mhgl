Preload("Quest69207.lua")
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00142 = {							-- 孙小红
	npc_id = 142,						-- NPC ID
	name = GetNpcName(142),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00142:Talk(bProcess) 
	local quest69207 = player:GetQuests():GetQuest(69207)
  NpcAsk("少侠行色匆匆,是否有什么急事?")
  SetAnswer(1,"请点燃烽火报警,边境处发现敌人的先头部队。")
	if (HasQuest(69207) and quest69207:GetEndNpcId() == self.npc_id) then
		SetAnswer(2, "官职任务")
	end
  SetAnswer(3,"我只是路过,没什么事情")
  WaitAnswer(3)
	if GetAnswer() == 2 then
		Quest69207:Return()
	end
end










-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00142)
