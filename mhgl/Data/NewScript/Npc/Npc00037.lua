
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00037 = {							-- 孙小红
	npc_id = 37,						-- NPC ID
	name = GetNpcName(37),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00037:Talk(bProcess)
  NpcAsk("你是怎么下来的,现在的人胆子越来越大了。")
  SetAnswer(1,"离开")
  WaitAnswer(1)

  





end








-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00037)
