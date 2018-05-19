

-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00370 = {							-- 杵官王
	npc_id = 370,						-- NPC ID
	name = GetNpcName(370),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00370:Talk(bProcess) 
  NpcAsk("师者所以传道授业解惑者也，我大唐历来重视施教，有师徒关系的人可以组队来我这里领取师徒任务。")
  SetAnswer(1,"我来领取师徒任务 ")
  SetAnswer(2,"我来取消师徒任务 ")
  SetAnswer(3,"我来设置修炼内容 ")
  SetAnswer(4,"我想了解一下师徒任务 ")
  SetAnswer(5,"我点错了 ")
  WaitAnswer(5)
end











-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00370)
