
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00207 = {							-- 孙小红
	npc_id = 207,						-- NPC ID
	name = GetNpcName(207),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00207:Talk(bProcess)
  NpcAsk("海底地形复杂,当心可别迷了路")
		SetAnswer(2, "离开")
		WaitAnswer(2)
end












-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00207)
