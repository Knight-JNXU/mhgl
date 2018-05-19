

-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00309 = {							-- 杵官王
	npc_id = 309,						-- NPC ID
	name = GetNpcName(309),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00309:Talk(bProcess) 
  NpcAsk("有时间就来下下棋，调剂下生活嘛想学下棋就来找我")
  SetAnswer(1,"我就是为此而来")
  SetAnswer(2,"我想了解一下 ")
  SetAnswer(3,"积分兑换")
  SetAnswer(4,"俺是来瞧热闹滴！")
  WaitAnswer(4)
end











-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00309)
