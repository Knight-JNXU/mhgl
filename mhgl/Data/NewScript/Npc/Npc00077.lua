
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00077 = {							-- 孙小红
	npc_id = 77,						-- NPC ID
	name = GetNpcName(77),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00077:Talk(bProcess)
  NpcAsk("")
  SetAnswer(1,"1、潜能果相关。")
  SetAnswer(2,"机缘相关。")
  SetAnswer(3,"碰巧路过而已。")
  WaitAnswer(3)
end






-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00077)
