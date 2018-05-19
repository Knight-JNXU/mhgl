
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00036 = {							-- 孙小红
	npc_id = 36,						-- NPC ID
	name = GetNpcName(36),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00036:Talk(bProcess)
  NpcAsk("唧唧...唧唧(螃蟹精冒着气泡)！")
  SetAnswer(1,"离开")
  WaitAnswer(1)





end








-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00036)
