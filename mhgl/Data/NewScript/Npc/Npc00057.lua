
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00057 = {							-- 孙小红
	npc_id = 57,						-- NPC ID
	name = GetNpcName(57),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00057:Talk(bProcess)
  NpcAsk("你找我有什么事情呢？")
  SetAnswer(1,"我要交易")
  SetAnswer(6,"路过啦")
  WaitAnswer(6)
 end







-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00057)
