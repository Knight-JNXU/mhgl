
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00445 = {							-- 孙小红
	npc_id = 445,						-- NPC ID
	name = GetNpcName(445),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00445:Talk(bProcess) 
  NpcAsk("近来市场不景气,我们这做当铺的生意也不好,现在也是关门了,客观若是来典当东西,还请下次再来~！")
  SetAnswer(1,"离开")
  WaitAnswer(1)
end







-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00445)
