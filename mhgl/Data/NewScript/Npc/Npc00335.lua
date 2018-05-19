
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00335 = {							-- 杵官王
	npc_id = 335,						-- NPC ID
	name = GetNpcName(335),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00335:Talk(bProcess) 
  NpcAsk("请问有什么能帮您吗？")
  SetAnswer(1,"月卡有效查询")
  SetAnswer(2,"剩余点数查询事宜")
  SetAnswer(3,"前往官方在线购卡平台")
  SetAnswer(4,"寄售点卡抽奖活动事宜")
  SetAnswer(5,"点错了，不好意思")
 WaitAnswer(5)
end











-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00335)
