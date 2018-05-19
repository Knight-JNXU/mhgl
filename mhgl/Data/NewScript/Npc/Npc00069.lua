
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00069 = {							-- 孙小红
	npc_id = 69,						-- NPC ID
	name = GetNpcName(69),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00069:Talk(bProcess)
  NpcAsk("我们这里已经打烊了,客观明天请早。(开放时间为6:00-次日1:00)")
  SetAnswer(1,"离开")
  WaitAnswer(1)
end


  










-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00069)
