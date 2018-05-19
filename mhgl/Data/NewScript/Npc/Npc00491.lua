
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00491 = {							-- 杵官王
	npc_id = 491,						-- NPC ID
	name = GetNpcName(491),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00491:Talk(bProcess) 
  NpcAsk({"这是哪里来的小孩子？怎么没有和家里的大人在一起?难道是迷路了。",})
  SetAnswer(1,"离开")
  WaitAnswer(1)
end
         
  









-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00491)
