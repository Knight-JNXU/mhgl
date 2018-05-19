
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00483 = {							-- 杵官王
	npc_id = 483,						-- NPC ID
	name = GetNpcName(483),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00483:Talk(bProcess) 
  NpcAsk({"异域之地，气候变化无常，妖怪时有出没，路过此地可要多加小心。",})
  SetAnswer(1,"离开")
  WaitAnswer(1)
end
         
  









-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00483)
