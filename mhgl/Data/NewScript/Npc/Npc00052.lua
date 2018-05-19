
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00052 = {							-- 孙小红
	npc_id = 52,						-- NPC ID
	name = GetNpcName(52),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00052:Talk(bProcess)
  NpcAsk("作买卖要讲究“变通”,眼明手快,商场如战场,时机不等人啊。")


  SetAnswer(1,"离开")
  WaitAnswer(1)
end







-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00052)
