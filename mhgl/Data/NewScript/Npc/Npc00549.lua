
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00083 = {							-- 孙小红
	npc_id = 83,						-- NPC ID
	name = GetNpcName(83),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00083:Talk(bProcess)
  NpcAsk("欢迎来到KJ公益服")
  SetAnswer(1,"出去了")
  SetAnswer(2,"离开")
  WaitAnswer(2)
  if GetAnswer() == 1 then
     player:JumpMap(11,13,39)
  end
end


-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00083)
