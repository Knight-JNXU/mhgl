
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00366 = {							-- 杵官王
	npc_id = 366,						-- NPC ID
	name = GetNpcName(366),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00366:Talk(bProcess) 
  NpcAsk("我受户部尚书委派在此专门管理所有土地交易事宜，你是否有交易土地的需求？")
  SetAnswer(1,"交易注意事项")
  SetAnswer(2,"进入交易所")
  SetAnswer(3,"手抖，点错了")
  WaitAnswer(3)
end











-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00366)
