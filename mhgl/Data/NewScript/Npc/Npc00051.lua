
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00051 = {							-- 孙小红
	npc_id = 51,						-- NPC ID
	name = GetNpcName(51),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00051:Talk(bProcess)
  NpcAsk("我不过是想夫妻两个好好过日子,谁知道这猪头居然喜欢上别的女人！")
  SetAnswer(1,"离开")
  WaitAnswer(1)
end







-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00051)
