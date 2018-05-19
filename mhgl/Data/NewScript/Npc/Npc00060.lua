
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00060 = {							-- 孙小红
	npc_id = 60,						-- NPC ID
	name = GetNpcName(60),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00060:Talk(bProcess)
  NpcAsk("社区暂时关闭调整,具体开放时间请看官网通知")
  SetAnswer(1,"离开")
  WaitAnswer(1)
end






-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00060)
