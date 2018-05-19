
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00739 = {							-- 孙小红
	npc_id = 739,						-- NPC ID
	name = GetNpcName(739),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00739:Talk(bProcess)
  IAsk("传说中的大唐我最屌就是我啦,我就是大唐官府的首席弟子,大唐官府首席弟子就是我啦~！")
	SetAnswer(1,"离开")
	WaitAnswer(1)
end









-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00739)
