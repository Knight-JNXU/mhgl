
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00296 = {							-- 杵官王
	npc_id = 296,						-- NPC ID
	name = GetNpcName(296),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00296:Talk(bProcess) 
  NpcAsk("外挂举报设置已经取消，但是打击外挂的工作并不会停止，如果你手上还有之前购买的举报符，可以上交给我并获得50000两银子的补偿。")
  SetAnswer(1,"回收举报符 ")
  SetAnswer(2,"离开 ")
  WaitAnswer(2)
end











-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00296)
